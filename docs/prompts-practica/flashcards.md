# Prompt: Flashcards

> Aplican además, sin excepción, las reglas de trabajo por tandas,
> control de redundancia, estilo y auto-auditoría de
> `docs/prompts-practica/nucleo.md`. **No aplica** la sección "Filosofía"
> del núcleo (aplicación sobre memoria): Flashcards es, junto con
> Memorice, la herramienta de memorización explícita de Digesto, así que
> aquí sí se busca memoria pura, a propósito.

## Copiar y pegar

Reemplaza `{MATERIA}` y `{MANUAL}` antes de usar este prompt en una
sesión. `{MATERIA}` es el valor normalizado que usa el resto de la
plataforma para esta materia, y `{MANUAL}` es el archivo HTML del manual
correspondiente en la raíz del repo.

---

Vas a generar **Flashcards** para el módulo de Práctica de Digesto, a
partir del manual de **{MATERIA}** (`{MANUAL}`). El público son
estudiantes de derecho chilenos preparando el examen de grado. La
precisión importa tanto como en un examen real.

## Qué es una Flashcard

Una definición, requisito o dato puntual por tarjeta, sin caso ni
desarrollo: la unidad más pequeña posible de recuperación de memoria.
A diferencia de los otros 5 tipos, acá SÍ es correcto (y esperado) que
la pregunta sea "¿qué es X?" o "¿cuáles son los requisitos de X?": es
justamente la pieza que descarga a los demás tipos de tener que cubrir
memoria pura.

## Qué extraer del manual

Los recuadros `.callout` y las primeras oraciones definitorias de cada
eje son la fuente más directa. Una enumeración cerrada de requisitos
suele dar una Flashcard por requisito, o una sola Flashcard con la lista
completa si son pocos y siempre se piden juntos.

## Esquema exacto y destino

Se editan en Airtable, **no** en código ni en Supabase directo: el flujo
real es Airtable → `scripts/sync_airtable_supabase.py` → Supabase (ver
`docs/contenido-airtable-supabase.md`). El script lee la tabla
`Flashcards` de **cualquier base registrada en `PREGUNTAS_BASES`** (el
mismo diccionario que usa para Evaluación, ver `aplicacion.md`), así que
para una materia con su propia base (ej. las 3 bases de Bienes creadas
el 2026-09-17) el destino es la tabla `Flashcards` de esa base, no la
base compartida `Digesto` original (esa sigue existiendo, pero es el
esquema viejo de antes de que existiera el patrón de una base por
materia). El entregable es una tabla que Laura pueda pegar directo en
Airtable:

| pregunta | respuesta | dificultad | materia | tema | subtema |
|---|---|---|---|---|---|
| ¿...? | ... | básica / intermedia / avanzada | civil | {tema de {MATERIA}} | ... |

`respuesta` puede incluir `<b>`, `<i>`, `<em>`, `<strong>`, `<u>` y
`<span class="art">` (el lector de flashcards los soporta, ver
`fcFormatearRespuesta` en `app/alternativas.html`). No uses ninguna otra
etiqueta HTML.

## Volumen esperado

Salvo que Laura pida un número distinto, apunta a 4-6 Flashcards por
eje. Prioriza calidad y verificabilidad sobre volumen.

## Checklist específica de Flashcards

Además de la auto-auditoría del núcleo, verifica:

- [ ] `respuesta` no usa ninguna etiqueta HTML fuera de las permitidas
      arriba.
- [ ] Ninguna Flashcard nueva reformula, con otras palabras, una
      Flashcard ya existente para esa materia y subtema (chequeo de
      redundancia del núcleo, dentro del mismo tipo).
- [ ] Ninguna Flashcard nueva es, en el fondo, la misma pregunta que un
      ítem de Alternativas o Evaluación ya existente sin agregar nada
      (chequeo entre tipos del núcleo): una Flashcard puede coincidir en
      el punto de derecho, pero debe ser la versión mínima de
      recuperación, no una copia disfrazada.
