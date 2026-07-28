---
name: generar-practica
description: Genera y carga contenido nuevo del módulo de Práctica (Evaluación, Alternativas, Memorice, Flashcards) para una materia de Responsabilidad, siguiendo el mismo proceso ya probado con Extracontractual — sin tener que reexplicarlo materia por materia. Úsalo cuando Laura diga "seguí con las preguntas de [materia]", "generá contenido de [materia]" o pida retomar el trabajo de Práctica para Contractual, Precontractual, o una materia nueva de Civil/Procesal cuando exista su manual.
---

# Generar contenido de Práctica

Genera Evaluación, Alternativas, Memorice y Flashcards para una materia,
siguiendo el mismo proceso que ya se usó para Extracontractual (y antes,
Precontractual). El contenido en sí (qué preguntar, cómo redactar, qué
prohibiciones anti-alucinación aplican) está en
`docs/prompt-generacion-contenido-practica.md` — **este skill no repite esas
reglas, las orquesta**. Léelo antes de generar el primer lote de la sesión.

## Antes de arrancar

1. Confirmá con Laura qué materia y qué tramo del manual (por ejes, nunca el
   manual completo de una pasada — ver sección 1 de
   `docs/prompt-generacion-contenido-practica.md`).
2. Revisá qué ya existe en las **cinco** fuentes de contenido (paso 1 de la
   sección 1 de ese mismo doc) antes de generar nada.
3. Contá cuántas Flashcards/Alternativas/Memorice tiene ya esa materia en
   Supabase y Airtable, para saber si el pedido es "completar" o "arrancar
   de cero" (ver consultas de la sección "Verificación" más abajo).

## El ciclo por lote (tanda de ~10 páginas o 1-2 ejes)

1. Generá los ítems de los 4 modelos según `docs/prompt-generacion-contenido-practica.md`.
2. Corré la auto-auditoría de la sección 6 de ese doc antes de entregar nada.
3. Armá el SQL de Alternativas/Memorice (`insert ... on conflict (id) do
   nothing;`) y la tabla de Flashcards para Airtable, siguiendo las
   convenciones de la próxima sección.
4. Entregá el reporte de auditoría primero, el contenido después.

## Convenciones de esquema (aprendidas con Extracontractual — no las repitas)

- **Un artículo puede pertenecer a más de una materia, en una sola fila.**
  Si el mismo artículo de Memorice ya existe para otra materia y también es
  relevante acá, **no dupliques la fila con un id nuevo** — el `id` es la
  clave única de toda la tabla (`cc-art-NNNN` / `ccom-art-NNNN`), duplicarlo
  se pierde en silencio por el `on conflict (id) do nothing`. En vez de eso,
  hacé un `UPDATE` que le agregue la materia nueva separada por coma
  (`materia = 'contractual,extracontractual'`). El filtro de
  `app/alternativas.html` (función `perteneceAArea`) ya entiende ese
  formato. Pero **ojo con la trampa**: que un artículo aparezca citado en
  el manual de otra materia NO significa automáticamente que haya que
  extenderlo — revisá si esa cita es una aplicación real de la norma en esa
  materia, o si el manual la usa solo para **contrastar** con la otra
  materia (ej. "la responsabilidad *contractual* lo exige, a diferencia de
  la extracontractual..."). Solo se extiende en el primer caso. Detalle
  completo del caso real (arts. 44/45/1465/1545/2332 sí, arts. 1551/1558
  no) en `docs/practica.md`, addendum 2026-07-28.
- **El `subtema` de una fila multi-materia debe quedar corto y neutral**
  (es un chip/opción de filtro, no una explicación). Si hace falta anotar
  por qué el artículo cruza de materia, esa nota va en `fuente`, que se
  muestra siempre junto al texto memorizado.
- **El filtro de Subtipo en Alternativas y Memorice es un `<select>`, no
  chips** (cambio hecho el 2026-07-28 porque con más de una decena de
  subtemas la fila de botones se volvía inmanejable). Si alguna vez ves
  código nuevo que vuelve a generar un botón por subtema en ese modelo,
  es una regresión — corregilo, no lo repliques.
- **Cero guiones largos (—) en ningún campo**, incluido `fuente`. Ya pasó
  una vez (art. 1545) y hubo que corregirlo en Supabase directo con un
  `PATCH` a la REST API.
- **Memorice: Laura decide el artículo y manda ella el texto legal
  (confirmado 2026-07-28).** No es un modelo que se genere solo: no salgas
  a buscar ni a proponer qué artículo memorizar, ni a verificar el texto
  vos mismo contra `Apuntes/Codigo Civil Chileno.pdf` o `leychile.cl`. Eso
  contradice lo que decía esta sección antes (y lo que sigue diciendo
  `docs/prompt-generacion-contenido-practica.md`, sección 0, punto de
  Memorice) — ese proceso ya se usó en lotes anteriores (incluido
  `scripts/memorice_literales_2026-07-28.sql`), pero el criterio actual es
  este: pedile a Laura el artículo y el texto verbatim, y trabajá solo a
  partir de lo que ella entregue.

## Verificación antes de correr nada

Antes de dar un SQL por listo, corré este chequeo (ya armado como patrón,
ver conversación del 2026-07-28 para el script completo si hace falta
adaptarlo):

1. Contra los `id` ya existentes en Supabase (`alternativas` y
   `memorice_articulos`, vía REST API con `SUPABASE_SECRET_KEY` de `.env`):
   ningún `insert` nuevo debe colisionar con un id existente sin que sea a
   propósito (el caso de "extender materia" es un `UPDATE`, no un
   `INSERT`).
2. Balance de paréntesis y de `insert`/`on conflict` (mismo conteo).
3. Si el lote cambia lógica de filtrado en `app/alternativas.html` (no solo
   contenido SQL), **Laura tiene que pushear ese cambio y confirmar que
   Vercel ya lo desplegó antes de correr el SQL** — si el SQL corre primero
   con el filtro viejo en producción, contenido multi-materia puede quedar
   invisible hasta que el deploy llegue.

## Entrega del SQL a Laura

Laura corre el SQL ella misma en el SQL Editor de Supabase (no lo corras
vos por API salvo que ella lo pida explícitamente para un fix puntual de
una fila, como pasó con el `PATCH` del art. 1545). Para pasarle un archivo
largo, no lo pegues en el chat — se corrompe fácil con archivos de más de
~50KB. Copialo directo a su portapapeles:

```bash
pbcopy < "ruta/al/archivo.sql"
```

Y decile que pegue con Cmd+V en el SQL Editor.

## Flashcards → Airtable

El entregable es una tabla (`pregunta | respuesta | dificultad | materia |
tema | subtema`) para que Laura la pegue directo en la base `Digesto`,
tabla `Flashcards` (ver `docs/contenido-airtable-supabase.md`). Antes de
generar, contá cuántas Flashcards tiene ya esa materia (vía Airtable API
con `AIRTABLE_TOKEN`) y revisá que no haya `pregunta` duplicada exacta
dentro de esa materia — si la hay, es un bug real de una carga anterior,
no algo para replicar.

## Al terminar un lote

1. Reportá el conteo antes/después por modelo y materia (Evaluación no
   cambia si el spec no lo pide — sigue en el `banco` hardcoded).
2. Actualizá `CLAUDE.md` → "Decisiones tomadas" si el lote deja algo
   pendiente que no sea obvio retomando el proyecto en frío (ver
   `feedback_no_dejar_pendientes_silenciosos` en la memoria del usuario).
3. No marques nada como "revisado" — el contenido jurídico nuevo siempre
   queda pendiente de revisión de Laura hasta que ella lo confirme.
