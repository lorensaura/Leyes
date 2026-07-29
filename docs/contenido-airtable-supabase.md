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
- **`Digesto Contractual`** (`appxeVxAE53yIqRPa`), **`Digesto
  Extracontractual`** (`appz8ePbArPV9cbE3`) y **`Digesto Precontractual`**
  (`appeZI0TkAC3uaeVW`) — una base por materia. Cada una tiene, con el
  mismo esquema en las tres:
  - `Temas`: un registro por eje del manual (`nombre` = "N. Nombre del
    eje", `numero`, `materia` como texto, ej. "Responsabilidad
    extracontractual"). Los campos de link inverso (`Flashcards`,
    `Preguntas_Evaluacion`) muestran, sin configuración adicional, qué
    ítems cubren cada tema — sirve para ver a simple vista qué ejes están
    menos preguntados.
  - `Preguntas_Evaluacion`: 55 (Contractual) / 154 (Extracontractual) / 19
    (Precontractual) a julio 2026.
  - `Flashcards`: **confirmado 2026-07-28 que existe en las tres bases**,
    con esquema propio (`id` y `tipo` como texto libre, sin usar en la
    práctica; `tema` como link a `Temas`, no texto libre; `dificultad`
    como `basica`/`intermedia`/`avanzada`, **sin tilde en "basica"**;
    `pregunta`, `respuesta`, `publicado`). Esta tabla **no tiene columnas
    `materia` ni `subtema`** — es distinta al esquema de la tabla
    Flashcards de la base "Digesto" original (ver abajo). A julio 2026
    solo `Digesto Extracontractual` tiene contenido propio ahí.
  - `Digesto Extracontractual` tiene además cuatro tablas sueltas
    ("Aplicación", "Detección de error", "Justificación", "Discriminación
    MC") que parecen un diseño anterior abandonado a favor de
    `Preguntas_Evaluacion` con un campo `tipo` — no se usan, no tocar.

**Por qué se separaron (2026-07-13):** Laura quería más organización visual
(encontrar la materia más fácil) además del límite de 1.000 registros por
base del plan Free de Airtable. Cada base se duplicó de la original
("Duplicate base" con todos los registros) y después se borró en cada una
lo que no correspondía a su materia (ver historial de git para el script
de limpieza si hace falta repetir el proceso con una materia nueva).

**Esquema de `Preguntas_Evaluacion`** (igual en las 4 bases): `materia`
(genérico, ej. "civil"), `tema` (link a `Temas`, el eje concreto del
manual), `tema_texto` (específico, ej. "Responsabilidad contractual" — este
es el que se usa para filtrar), `subtema`, `tipo`
(aplicación/detección_error/justificación/discriminación_mc), `enunciado`,
`respuesta_modelo`, `articulos_referencia`, `objetivo_pedagogico`, `fuente`,
`publicado`, más los links a `Elementos_Clave` (texto + keywords) y
`Opciones_MC` (letra/texto/rationale, solo para discriminación_mc).

**El campo `tema` (link a `Temas`) existe en `Preguntas_Evaluacion` y en las
4 tablas de Evaluación desde siempre, pero recién se usa** (ver "Estado del
linkeo a `Temas`" más abajo).

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
la base `Digesto`, **y también de `Flashcards`+`Temas` de las 3 bases de
materia** (fix 2026-07-28, ver abajo), y `Preguntas_Evaluacion`+
`Elementos_Clave`+`Opciones_MC` de las 3 bases de materia, y hace upsert
en Supabase por `airtable_id`. **Correrlo cuando Laura avise que agregó o
cambió contenido en Airtable** — no es automático, no hay cron. Requiere
`AIRTABLE_TOKEN` (scopes `data.records:read` + `data.records:write` — el
write no se usa en este script en particular, pero el token ya tiene
ambos por el trabajo de migración) y `SUPABASE_SECRET_KEY` en `.env`.

**Bug corregido 2026-07-28:** `sync_flashcards()` solo leía la tabla
`Flashcards` de la base `Digesto` original. Nunca recorría las 3 bases de
materia para Flashcards (a diferencia de `sync_preguntas()`, que sí lo
hacía para Preguntas_Evaluacion desde siempre). Esto significaba que
cualquier Flashcard cargada en `Digesto Extracontractual` (o las otras dos
bases de materia), aunque estuviera marcada `publicado = true`, **nunca
llegaba a Supabase ni a la app** — se descubrió con las 15 Flashcards que
ya existían ahí para Extracontractual, cargadas en algún momento pero
nunca sincronizadas. Corregido extendiendo `sync_flashcards()` para que
también recorra `PREGUNTAS_BASES` (mismo diccionario que ya usaba
`sync_preguntas()`), igual que se hace para Preguntas_Evaluacion.

**Reconciliación agregada 2026-07-29:** cada `sync_*()` compara, antes de
subir nada, cuántas filas hay ya en Supabase contra cuántas hay publicadas
en Airtable, e imprime un aviso si Supabase tenía menos. Se agregó después
de encontrar 225 Flashcards de "Digesto Contractual" cargadas en Airtable
que nunca habían llegado a sincronizarse (nadie lo notó hasta que se
contó a mano el 2026-07-29) — el mismo tipo de pérdida silenciosa que el
bug de arriba, pero en una base distinta. Con este aviso, correr el script
avisa solo si algo se está quedando afuera, sin tener que contar a mano.

## Estado del linkeo a `Temas` (agregado 2026-07-29)

Cada base de materia tiene una tabla `Temas` (un registro por eje del
manual) y un campo de link `tema` en `Flashcards`, `Preguntas_Evaluacion` y
las 4 tablas de Evaluación (`Aplicación`/`Detección de error`/
`Justificación`/`Discriminación MC`) que apunta a ella. El campo **ya
existía en las 6 tablas**, pero `scripts/sync_airtable_supabase.py` solo lo
leía para Flashcards; para Preguntas_Evaluacion usaba en cambio `tema_texto`
(texto libre, sin relación con `Temas`) y para Evaluación mandaba `tema =
null` siempre, a propósito. Corregido: ahora las 6 tablas resuelven el
mismo link (`_leer_temas`/`_resolver_tema` en el script) y lo mandan a
Supabase (`preguntas_evaluacion.tema`, columna nueva —
`scripts/supabase_schema_tema_link.sql`, correrla una vez en Supabase antes
de volver a sincronizar Preguntas_Evaluacion — y `evaluacion_practica.tema`,
que ya existía en el esquema pero nunca se llenaba).

**Cuánto está linkeado hoy (medido 2026-07-29, antes del fix):**

| Tabla | Contractual | Extracontractual | Precontractual |
|---|---|---|---|
| Flashcards | 225/225 | 204/204 | 0/0 (sin contenido) |
| Preguntas_Evaluacion | 0/55 | 170/170 | 0/119 |
| Evaluación (4 tablas) | 0/43 | 0/113 | 0/40 |

Extracontractual ya tiene el 100% de `Preguntas_Evaluacion` linkeado (así
se debe hacer de acá en adelante en las 3 materias). Lo demás quedó sin
linkear porque el campo nunca se usó al cargar ese contenido, no porque
falte crear nada — se completa materia por materia, al revisar cada eje, no
hace falta un lote aparte solo para esto.

**Precontractual ya tiene su catálogo de `Temas` (agregado 2026-07-29):**
10 ejes (A-J), tomados de `03_Responsabilidad_Precontractual_Manual.html`.
Antes estaba vacío, lo que además hizo que 59 Flashcards de Precontractual
quedaran "sueltas" en la base `Digesto` original en vez de en `Digesto
Precontractual` (ligadas ahí a un catálogo de Temas paralelo que existía
solo en esa base original, sin que nadie lo supiera hasta este estudio).
Se movieron esas 59 Flashcards a `Digesto Precontractual`, enlazadas al
catálogo nuevo, y se limpiaron en Supabase las filas duplicadas que había
dejado la migración (quedó en 488 Flashcards totales: 225 Contractual +
204 Extracontractual + 59 Precontractual). Preguntas_Evaluacion y
Evaluación de Precontractual todavía no están linkeadas a este catálogo
(pendiente, ver `docs/creacion-de-contenido.md`).

Ver la regla permanente sobre cargar contenido nuevo ya linkeado en
`docs/creacion-de-contenido.md`.

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

## Alternativas y Memorice: se quedan solo en Supabase, sin Airtable (decidido 2026-07-27)
Se evaluó llevar Alternativas al mismo patrón que Flashcards/Preguntas_Evaluacion
(Airtable para editar, Supabase para servir), incluso con el diseño ya
resuelto (una sola base para las tres materias, para no competir por el
cupo de 1.000 registros de las bases de Preguntas_Evaluacion, que ya están
al 40-53% de uso). Laura prefirió no hacerlo: son ítems más simples
("modo pasta", no tienen que quedar perfectos a la primera como
Preguntas_Evaluacion), así que sigue siendo más rápido que ella redacte el
SQL directo y lo corra en el SQL Editor de Supabase — agregar un paso de
edición en Airtable sería más fricción, no menos. `scripts/sync_airtable_supabase.py`
no toca `alternativas` ni `memorice_articulos`; el formato del INSERT está
en `docs/prompt-generacion-contenido-practica.md`, sección 3.

## El banco de preguntas de examen real ya se usa como grounding del Interrogador IA
Las 328 preguntas en la tabla Supabase `preguntas_evaluacion` (55
Contractual + 154 Extracontractual + 119 Precontractual) — que vienen de
bancos de preguntas de examen reales que Laura fue enviando (ver "Flujo de
carga de preguntas históricas" arriba) — **ya están en uso en producción**,
no son un banco muerto: `api/interrogador.js` las consulta en vivo (bloque
"Muestra de preguntas reales", 40 por materia, ver `docs/interrogador.md`)
para que el Interrogador IA pregunte con el mismo estilo y cobertura que un
examen real, no con casos inventados. Esto no es un banco aparte de
Evaluación por descuido: es intencional, cumple un propósito distinto
(grounding del Interrogador) al del banco hardcoded de `app/alternativas.html`
(contenido de práctica con retroalimentación estructurada).

**Para materias nuevas** (cuando se arme Civil completo, Procesal, etc.):
el mecanismo ya existe y es el mismo que se usó para sumar Precontractual
el 2026-07-20 — no hay que construir nada nuevo, solo repetir el patrón:
1. Cargar el banco de preguntas de esa materia en Airtable (`Preguntas_Evaluacion`,
   siguiendo "Flujo de carga de preguntas históricas") y correr el sync.
2. Sumar el nombre exacto de la materia a `MATERIAS_MUESTRA` en
   `api/interrogador.js`.
3. Sumar el manual de esa materia a `scripts/extraer_contenido_interrogador.js`
   y los artículos de código relevantes a `api/_interrogador-codigo.js` (ver
   `docs/interrogador.md`, "Grounding").

## Estado de los scripts de esquema SQL
`scripts/supabase_schema.sql`, `scripts/supabase_schema_practica.sql`,
`scripts/supabase_schema_practica_metodo_b.sql` y
`scripts/memorice_literales_2026-07-28.sql` ya están corridos en Supabase
— no hace falta volver a correrlos salvo que se agregue una columna nueva.

## Bases nuevas creadas 2026-07-28 (estado, para no recrearlas)
- **`DIGESTO ROADMAP`** — base de gestión de Laura (tareas, progreso web,
  ideas). Tiene la tabla `PENDIENTE - Civil` con 56 filas de seguimiento
  (una por eje de REC/REX/REP) para trackear qué contenido de Práctica
  falta por eje — se tickea `Estado Completado` a medida que se cierra
  cada uno.
- **`Digesto Extracontractual`** — se le agregaron 4 tablas nuevas
  (`Aplicación`, `Detección de error`, `Justificación`, `Discriminación
  MC`) en un intento de llevar Evaluación a Airtable que resultó
  redundante con el `banco` hardcodeado ya existente — ver
  `docs/creacion-de-contenido.md` para el estado y la decisión pendiente.
- Quedaron **8 bases sueltas sin usar** (`REX - Alternativas`, `REX -
  Justificación`, `REX - Detección de Error`, `REX - Memorice`, `REX -
  Aplicación`, `REC - Alternativas`, `REC - Flashcards`, `REC - Memorice`),
  de un diseño anterior (una base por tipo) que se descartó a favor de una
  base por materia. Laura las va a borrar a mano.

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
