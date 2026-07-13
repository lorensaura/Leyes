# Contenido: Airtable + Supabase

> Cómo está organizado el contenido de Digesto entre Airtable (donde Laura
> edita) y Supabase (lo que la app consulta en producción). El resumen de
> una línea vive en el Roadmap de `CLAUDE.md`.

## El principio (decidido 2026-07-13)
**Airtable es donde Laura edita. Supabase es lo que la app consulta.**
Antes (hasta 2026-07-13) la app leía Airtable directo o vía función
serverless; se cambió por records limits del plan Free, límite de
velocidad de la API de Airtable, y porque el cupo de uso por alumna (futuro)
necesita vivir en Supabase de todas formas (está atado al usuario
autenticado). Un script (`scripts/sync_airtable_supabase.py`) sincroniza de
uno a otro **a pedido** — Laura le avisa a Claude cuando agregó/cambió
contenido en Airtable, y se corre el script.

## Airtable — bases (workspace de Laura)
- **`Digesto`** (`appjP6jK8Jbm5uaeG`) — base original. Sigue teniendo:
  - `Temas` (capítulos de Contractual, con campo `materia`).
  - `Flashcards` (225 de muestra, todas de Contractual, campo `dificultad`
    básica/intermedia/avanzada, campo `tipo` con 50+ valores libres — poco
    útil para filtrar, se usa `dificultad` en la app).
  - Copia completa de `Preguntas_Evaluacion` + `Elementos_Clave` +
    `Opciones_MC` con **todas las materias mezcladas** (231 preguntas) — se
    dejó a propósito sin tocar (ver split abajo) para un futuro modo
    transversal (`docs/interrogador.md`).
  - `Banco_Preguntas_Crudo` (staging para preguntas históricas sin
    clasificar — campo `promovido` marca cuándo pasaron al esquema rico).
- **`Digesto Contractual`** (`appxeVxAE53yIqRPa`) — 55 preguntas, solo
  Responsabilidad contractual.
- **`Digesto Extracontractual`** (`appz8ePbArPV9cbE3`) — 154 preguntas.
- **`Digesto Precontractual`** (`appeZI0TkAC3uaeVW`) — 19 preguntas.

**Por qué se separaron (2026-07-13):** Laura quería más organización visual
(encontrar la materia más fácil) además del límite de 1.000 registros por
base del plan Free de Airtable. Cada base se duplicó de la original
("Duplicate base" con todos los registros) y después se borró en cada una
lo que no correspondía a su materia (ver historial de git para el script
de limpieza si hace falta repetir el proceso con una materia nueva).

**Esquema de `Preguntas_Evaluacion`** (igual en las 4 bases): `materia`
(genérico, ej. "civil"), `tema_texto` (específico, ej. "Responsabilidad
contractual" — este es el que se usa para filtrar), `subtema`, `tipo`
(aplicación/detección_error/justificación/discriminación_mc), `enunciado`,
`respuesta_modelo`, `articulos_referencia`, `objetivo_pedagogico`, `fuente`,
`publicado`, más los links a `Elementos_Clave` (texto + keywords) y
`Opciones_MC` (letra/texto/rationale, solo para discriminación_mc).

**Campo `publicado`** (checkbox): controla qué se sirve a la app sin tocar
código. Hoy Contractual/Extracontractual en `sí`.

## Supabase — tablas (proyecto de Laura, `byyukzhxhtopojgvgglp`)
Esquema completo en `scripts/supabase_schema.sql` (correrlo de nuevo con
`if not exists` es seguro si hay que recrear algo).

- **`flashcards`** — espejo de Airtable `Flashcards` + `Temas` resuelto
  (columna `materia`/`tema` ya con el nombre, no el ID de link). RLS: lectura
  para `authenticated` donde `publicado = true`. La página
  `app/flashcards.html` consulta esta tabla **directo desde el navegador**
  (con la llave pública, sin pasar por función serverless — RLS + sesión de
  Supabase ya activa alcanzan).
- **`preguntas_evaluacion`** — espejo de las 3 bases de materia, con
  `elementos_clave` (`text[]`, ya aplanado) y `opciones_mc` (`jsonb`, array
  de `{letra, texto, rationale}`) — denormalizado a propósito, no hay tablas
  relacionadas separadas en Supabase para esto. RLS igual que flashcards.
  Consultada por `api/interrogador.js` con la llave secreta (server-side,
  se salta RLS) para armar la muestra de cada sesión.
- **`flashcard_progreso`** — repetición espaciada por alumna (ver
  "Flashcards: calificación" abajo). RLS: cada usuaria solo ve/edita sus
  propias filas (`auth.uid() = user_id`).

**Llaves:**
- `SUPABASE_KEY` (pública, `sb_publishable_...`) — ya estaba, para login y
  ahora también para leer `flashcards` desde el navegador.
- `SUPABASE_SECRET_KEY` (`sb_secret_...`, reemplazo moderno de
  `service_role`) — solo backend: `scripts/sync_airtable_supabase.py` y
  `api/interrogador.js`. Nunca en el navegador. Vive en `.env` local y en
  Vercel (Production + Preview).

## Sincronización Airtable → Supabase
`python3 scripts/sync_airtable_supabase.py` — trae `Flashcards`+`Temas` de
la base `Digesto`, y `Preguntas_Evaluacion`+`Elementos_Clave`+`Opciones_MC`
de las 3 bases de materia, y hace upsert en Supabase por `airtable_id`.
**Correrlo cuando Laura avise que agregó o cambió contenido en Airtable**
— no es automático, no hay cron. Requiere `AIRTABLE_TOKEN` (scopes
`data.records:read` + `data.records:write` — el write no se usa en este
script en particular, pero el token ya tiene ambos por el trabajo de
migración) y `SUPABASE_SECRET_KEY` en `.env`.

## Flashcards: calificación y repetición espaciada (agregado 2026-07-13)
Al voltear una tarjeta en `app/flashcards.html` aparecen 3 botones:
- **Me acordaba** → no vuelve a salir hasta en 7 días.
- **Más o menos** → vuelve en 3 días.
- **Poco** → sin espera fija, disponible casi de inmediato; además siempre
  accesible con el filtro "⚠️ Revisar errores" (aísla solo las "poco").
Cada calificación hace upsert en `flashcard_progreso`. El estudio normal
filtra automáticamente las que todavía no tocan repasar.

## Flujo de carga de preguntas históricas (vigente, sin cambios)
Laura tiene bancos de preguntas reales de examen (de profesores UC) en
`.pages`/`.docx`/`.doc`/`.numbers`/`.pdf`, casi siempre **sin respuesta
escrita** (solo la pregunta oral). El trabajo de Claude: leer esos archivos
+ los manuales/apuntes de la materia, **redactar la respuesta modelo**
grounded en esos apuntes (no inventar contenido legal), clasificar `tipo`
(→ `Preguntas_Evaluacion`, o pregunta-respuesta corta → `Flashcards`), y
recién ahí subir a Airtable (y correr el sync a Supabase).

**Conversión de formatos** (sin Node/vercel CLI en esta máquina):
`.docx`/`.doc` → `textutil -convert txt`; `.pages` → AppleScript vía
Pages.app (`export doc to POSIX file outPath as Microsoft Word`, no
funciona `as Word`) → luego `textutil`; `.numbers` → AppleScript vía
Numbers.app (`export doc to POSIX file outPath as CSV`, genera una carpeta
con un CSV por hoja); `.pdf` → Read tool directo.

## Pendiente / no construido
- Materias más allá de Contractual/Extracontractual/Precontractual (Acto
  Jurídico, Bienes, Familia, Sucesorio, Procesal, etc.) — en stand by desde
  2026-07-10 hasta terminar de validar Responsabilidad. Acto Jurídico ya
  quedó procesado (ver `Preguntas CIVIL/Preguntas Acto Jurídico/`), el resto
  no se ha tocado.
- Tabla de conteo de uso (`interrogaciones_uso` o similar) para el cupo
  diario/mensual por suscripción (ver `docs/paywall.md` y
  `docs/interrogador.md`) — depende de que exista primero la Capa 3 del
  paywall (saber qué plan tiene cada alumna).
