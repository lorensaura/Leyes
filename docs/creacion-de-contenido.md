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
| Evaluación | Hardcodeado en `const banco` de `app/alternativas.html` | **Directo en código.** No se toca vía Airtable ni Supabase — la tabla `preguntas_evaluacion` existe pero la app no la lee (ver más abajo). |
| Alternativas | Tabla `alternativas` en Supabase | SQL directo (Laura lo corre en el SQL Editor). No pasa por Airtable. |
| Memorice | Tabla `memorice_articulos` en Supabase | SQL directo. El artículo y su texto verbatim los manda **Laura**, nunca se generan ni verifican solos. |
| Flashcards | Tabla `flashcards` en Supabase | Airtable (base `Digesto`, tabla `Flashcards`) → `scripts/sync_airtable_supabase.py` → Supabase. |

**Por qué Evaluación no se toca (confirmado 2026-07-28, tras un intento fallido):**
en una sesión se probó crear tablas nuevas en Airtable (Aplicación /
Detección de error / Justificación / Discriminación MC, una por materia)
para poder editar Evaluación desde ahí. A mitad de generar contenido para
Extracontractual se descubrió que **el banco hardcodeado ya tenía los 25
ejes cubiertos** (105 ítems, ids `re-*`), así que el contenido nuevo
generado esa sesión (16 ítems de Evaluación) quedó duplicado y huérfano —
las tablas nuevas de Airtable no tienen ningún script que las sincronice a
ningún lado. **Antes de generar Evaluación para cualquier materia, verificar
primero el `const banco` de `app/alternativas.html`** (buscar
`tema: 'Responsabilidad {materia}'`) — es casi seguro que ya exista.

**Pendiente sin decidir:** qué hacer con esas tablas de Airtable y esos 16
ítems huérfanos (quedaron en `Digesto Extracontractual`, tablas
`Aplicación`/`Detección de error`/`Justificación`/`Discriminación MC`) —
opciones: migrar los 105 ítems reales del banco hacia ahí (para que Laura
pueda por fin editar Evaluación sin tocar código), o borrar las tablas y
descartar la idea. **Laura decide.**

## Antes de generar nada: revisar las 5 fuentes existentes

1. El `const banco` hardcodeado en `app/alternativas.html` (Evaluación).
2. La tabla Supabase `preguntas_evaluacion` (banco de examen real, distinto
   del anterior — se usa como grounding del Interrogador IA, ver
   `docs/interrogador.md`).
3. La tabla Supabase `alternativas`.
4. La tabla Supabase `memorice_articulos`.
5. Flashcards en Airtable.

Esto ya es un paso obligatorio del prompt maestro (sección 1) y del skill
`generar-practica` — no generar sin haber contado qué existe ya para esa
materia y ese eje.

## Pendiente crítico de contenido ya escrito (encontrado 2026-07-28)

`scripts/contenido_practica_2026-07.sql` tiene **117 Alternativas + 32
Memorice** ya redactadas y auditadas (2026-07-24), cubriendo Contractual,
Extracontractual y Precontractual — **nunca se corrió en Supabase**. Antes
de generar contenido nuevo de Alternativas/Memorice para cualquiera de
esas tres materias, correr primero este script (Laura, en el SQL Editor),
o se corre el riesgo real de volver a duplicar preguntas ya escritas sobre
el mismo punto legal.

## Manuales
- `01_Responsabilidad_Contractual_Manual.html`,
  `02_Responsabilidad_Extracontractual_Manual.html`,
  `03_Responsabilidad_Precontractual_Manual.html` — fuente de verdad del
  contenido jurídico y de los PDF (`docs/pdf.md` para las reglas de
  generación).
- **Formato:** jerarquía A/1/1.1/a)/(i), recuadros pedagógicos
  (callout/dato-grado/jurisprudencia/ejemplo/advertencia), sin guiones
  largos (—) en ningún campo — regla permanente y retroactiva.
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
- Cero guiones largos (—) en ningún campo generado (manuales, preguntas,
  flashcards, SQL). Ya causó un fix manual una vez (art. 1545 en
  `fuente`).
- Evaluación acotada hoy a Contractual, Extracontractual y Precontractual
  (`TEMAS_EN_ALCANCE` en `startSession()`); Procesal y el resto de Civil
  quedan ocultos hasta que existan sus manuales.
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
