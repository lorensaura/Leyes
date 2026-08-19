# Creación de contenido

> Ábrelo cuando el trabajo sea generar o revisar manuales, preguntas de
> Evaluación, Alternativas, Memorice o Flashcards. Es el punto de entrada:
> el detalle mecánico vive en `docs/prompt-generacion-contenido-practica.md`
> (reglas de redacción, anti-alucinación, esquema exacto por modelo) y en
> `docs/practica.md` (cómo funciona el módulo en la app). El skill
> `generar-practica` orquesta el proceso completo, léelo antes de generar
> el primer lote de una sesión.

## Los cuatro modelos y dónde vive cada uno (estado actual)

| Modelo | Dónde vive | Se edita vía |
|---|---|---|
| Evaluación | Tabla `evaluacion_practica` en Supabase | Airtable (una base por materia, tablas `Aplicación`/`Detección de error`/`Justificación`/`Discriminación MC`) → `scripts/sync_airtable_supabase.py` → Supabase. |
| Alternativas | Tabla `alternativas` en Supabase | SQL directo (Laura lo corre en el SQL Editor). No pasa por Airtable. |
| Memorice | Tabla `memorice_articulos` en Supabase | SQL directo. El artículo y su texto verbatim los manda **Laura**, nunca se generan ni verifican solos. |
| Flashcards | Tabla `flashcards` en Supabase | Airtable (base `Digesto`, tabla `Flashcards`) → `scripts/sync_airtable_supabase.py` → Supabase. |

**Migrado el 2026-07-28:** Evaluación vivía hardcodeada en `const banco` de
`app/alternativas.html` (195 ítems entre las 3 materias). Se migró a
Airtable, en las mismas 4 tablas por tipo que un intento anterior (2026-07-28
por la mañana) había dejado con 16 ítems huérfanos y redundantes con el
banco: se compararon punto por punto, se borraron los 9 que repetían un
punto de derecho ya cubierto y se sumaron los 7 que aportaban algo nuevo.
`const banco` ya no existe en el código; el motor de Evaluación en
`app/alternativas.html` carga de `evaluacion_practica` vía `cargarEvaluacion()`,
igual que Flashcards/Alternativas/Memorice.

**Quedan sueltos en el código 4 ítems transversales** (`const bancoTransversal`
en `app/alternativas.html`, materia "civil" general en vez de una de las 3
materias): no encajan en el modelo de una base de Airtable por materia,
mismo tipo de caso que las preguntas `materia = 'transversal'` de
Alternativas (ver `docs/practica.md`). Se ven solo bajo el filtro "Todas".

**preguntas_evaluacion es una tabla distinta**, el banco de examen real
usado como grounding del Interrogador IA (ver `docs/interrogador.md`), no
se toca ni se mezcla con `evaluacion_practica`.

## Antes de generar nada: revisar las 5 fuentes existentes

1. La tabla Supabase `evaluacion_practica` (Evaluación) o, para editar,
   las 4 tablas de Airtable por materia (`Aplicación`/`Detección de
   error`/`Justificación`/`Discriminación MC`).
2. La tabla Supabase `preguntas_evaluacion` (banco de examen real, distinto
   del anterior, se usa como grounding del Interrogador IA, ver
   `docs/interrogador.md`).
3. La tabla Supabase `alternativas`.
4. La tabla Supabase `memorice_articulos`.
5. Flashcards en Airtable.

Esto ya es un paso obligatorio del prompt maestro (sección 1) y del skill
`generar-practica`, no generar sin haber contado qué existe ya para esa
materia y ese eje.

**Extracontractual ya tiene esa cuenta hecha (Fase 1, 2026-07-30):**
`docs/cobertura_subtema_rex_2026-07-30.md` trae la tabla de los 25 ejes ×
6 columnas (Aplicación/Detección de error/Justificación/Discriminación
MC/Flashcards/Alternativas) contada contra Supabase/Airtable en vivo, más
el cruce con `docs/preguntas_pendientes_ejes_debiles_2026-07.md` (qué de
ese borrador de 2026-07-27 sigue sin subir). Ábrelo antes de generar
contenido nuevo de Extracontractual para no recontar desde cero.

## Contenido de `contenido_practica_2026-07.sql` (ya cargado)

`scripts/contenido_practica_2026-07.sql` tiene 117 Alternativas + 23
Memorice (Contractual, Extracontractual y Precontractual). Este doc decía
"nunca se corrió en Supabase" desde que se encontró el 2026-07-28 por la
mañana; se verificó el 2026-07-28 por la tarde comparando los 140 ids del
archivo contra Supabase y **ya está cargado completo**. Antes de generar
contenido nuevo de Alternativas/Memorice para cualquiera de esas tres
materias, sigue valiendo el paso de revisar qué existe ya (ver "Antes de
generar nada" abajo) para no duplicar preguntas sobre el mismo punto
legal, pero no hace falta correr este script de nuevo.

## Manuales
- `01_Responsabilidad_Contractual_Manual.html`,
  `02_Responsabilidad_Extracontractual_Manual.html`,
  `03_Responsabilidad_Precontractual_Manual.html` — fuente de verdad del
  contenido jurídico y de los PDF (`docs/pdf.md` para las reglas de
  generación).
- **Formato:** jerarquía A/1/1.1/a)/(i), recuadros pedagógicos
  (callout/dato-grado/jurisprudencia/ejemplo/advertencia), sin guiones
  largos (—) en ningún campo — regla permanente y retroactiva. Para
  construir el manual de una materia **nueva** (no una de las 3 de
  Responsabilidad ya publicadas), usar `docs/script_apuntes.md`: template
  completo de formato (con la hoja de estilos lista para copiar) y proceso,
  con el estándar de Contractual/Precontractual (no de Extracontractual,
  que quedó más denso y con menos recuadros de lo deseado).
- **Bienes y Acto Jurídico quedaron con 49-57% del contenido de su
  fuente** (Contractual, el estándar, quedó en 92%): se sintetizó de
  memoria en vez de transcribir cerca y recién ahí formatear. Diagnóstico
  completo, ejemplo real y plan de reparación por partes (primero Acto
  Jurídico, después Bienes) en `docs/incidente_compresion_manuales.md`.
  El proceso ya se corrigió en `docs/script_apuntes.md` (secciones 0.4,
  1.6, 2.1) para que no vuelva a pasar en manuales nuevos; la reparación
  de estos dos manuales todavía no empezó.
- **Manual de Precontractual** (`03_...html`) se construyó a partir de un
  borrador de Laura; sus recuadros pedagógicos y las preguntas/keywords de
  los checkpoints de `app/manuales.html` son borrador de Claude, **todavía
  sin revisión de Laura** (ella pidió explícitamente ese orden: "dejas el
  hueco y redactas el dato, yo los reviso").
- **Caso Lavín con Mena** (Eje G de Precontractual): fallo real verificado
  (rol C-1461-2022), no alucinación — no hace falta re-litigar esa duda si
  vuelve a aparecer.
- Bug ya corregido en `app/manuales.html`: el lector online borraba
  silenciosamente el primer recuadro `.warn` de cualquier manual (código
  legado de una nota que ya no existe). Si un `.warn` desaparece del
  primer lugar de un manual, es una regresión de este mismo bug.

## Reglas permanentes
- **Toda fila nueva de Flashcards, Preguntas_Evaluacion o Evaluación
  (Aplicación/Detección de error/Justificación/Discriminación MC) se
  linkea a su `Tema` (eje del manual) en Airtable antes de marcarla
  `publicado`.** El campo `tema` (link a la tabla `Temas` de esa base) ya
  existe en las 6 tablas, no hay que crear nada — solo llenarlo. Si el
  eje todavía no tiene fila en `Temas`, crearla primero ahí (ya no pasa
  con Precontractual, que tiene su catálogo completo A-J desde
  2026-07-29). Esto es lo que permite ver de
  un vistazo, en Airtable, cuántas preguntas tiene cada eje (evita
  duplicar sobre el mismo punto) y que ninguna quede huérfana. Detalle y
  estado del linkeo por materia en `docs/contenido-airtable-supabase.md`
  ("Estado del linkeo a Temas").
- **Alternativas y Memorice** (no pasan por Airtable, se cargan por SQL
  directo) no tienen este link estructurado — usan `subtema` como texto
  libre. Para que sigan siendo cruzables a simple vista contra el resto,
  el `subtema` debe nombrar el mismo punto que el eje del manual al que
  corresponde (no una etiqueta libre inventada).
- Cero guiones largos (—) en ningún campo generado (manuales, preguntas,
  flashcards, SQL). Ya causó un fix manual una vez (art. 1545 en
  `fuente`).
- Evaluación acotada hoy a Contractual, Extracontractual y Precontractual:
  son las únicas 3 bases de Airtable con tablas de Evaluación, así que
  Procesal y el resto de Civil quedan ocultos hasta que existan sus
  manuales y su base correspondiente.
- Las preguntas de discriminación MC no llevan rúbrica de palabras clave:
  la corrección real es la alternativa elegida (`evaluarMC`).
- Un artículo de Memorice puede pertenecer a más de una materia en una
  sola fila (`materia` separada por coma) — nunca duplicar el id. Detalle
  y la trampa a evitar (cita vs. aplicación real) en
  `.claude/skills/generar-practica/SKILL.md`.
- Antes de dar una pregunta nueva por buena, pasa la auto-auditoría de la
  sección 6 de `docs/prompt-generacion-contenido-practica.md` (artículos
  citados literales del manual, cero jurisprudencia inventada,
  distractores no obvios, etc.). Todo contenido jurídico nuevo queda
  pendiente de revisión de Laura hasta que ella lo confirme — nunca se
  marca como "revisado" solo.
