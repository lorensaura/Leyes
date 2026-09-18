# Prompt: Memorice

> Aplican además, sin excepción, las reglas de trabajo por tandas,
> control de redundancia, estilo y auto-auditoría de
> `docs/prompts-practica/nucleo.md`. **No aplica** la sección "Filosofía"
> del núcleo (aplicación sobre memoria): Memorice es, junto con
> Flashcards, la herramienta de memorización explícita de Digesto, así
> que aquí sí se busca memoria pura y verbatim, a propósito.

## Copiar y pegar

Reemplaza `{MATERIA}` antes de usar este prompt en una sesión.
`{MATERIA}` es el valor normalizado que usa el resto de la plataforma
para esta materia.

---

Vas a generar ítems de **Memorice** para el módulo de Práctica de
Digesto, para la materia **{MATERIA}**. El público son estudiantes de
derecho chilenos preparando el examen de grado. La precisión importa
tanto como en un examen real.

## Regla de oro específica de Memorice: texto oficial, no la paráfrasis del manual

A diferencia de los demás tipos, acá **no trabajas solo con el manual**.
El campo `texto` debe ser el texto oficial del artículo, palabra por
palabra, verificado contra una fuente textual confiable (Biblioteca del
Congreso Nacional, leychile.cl), no reconstruido de memoria ni copiado
del manual.

Ojo: los manuales casi siempre **parafrasean** los artículos en vez de
citarlos textual (ej. "el artículo 2332 establece un plazo especial de
prescripción de cuatro años, contado desde la perpetración del acto...",
que es un resumen, no el texto legal). Nunca reconstruyas el texto legal
a partir de esa paráfrasis: búscalo en su fuente oficial y verifica que
el número de artículo y la materia coincidan con lo que el manual
describe. **Si no puedes verificar el texto exacto, no generes ese ítem
de Memorice**, repórtalo como pendiente en vez de aproximarlo.

## Qué extraer

Solo para los artículos numerados que el eje trata como centrales (ej.
un artículo que define una institución, fija un plazo, o establece un
requisito puntual), y solo si puedes verificar su texto oficial vigente.
No generes Memorice para un eje que no gira en torno a un artículo
específico: no todos los ejes rinden un buen ítem de Memorice, y eso
está bien.

## Esquema exacto y destino

Va a la tabla Supabase `memorice_articulos` (esquema en
`scripts/supabase_schema_practica.sql`). El entregable es un bloque de
sentencias `INSERT`:

```sql
insert into public.memorice_articulos
  (id, materia, subtema, articulo, texto, prioridad_ocultamiento, palabras_criticas, fuente)
values (
  'cc-art-2330', -- id semántico: código-art-número
  '{materia}',
  'Nombre del subtema',
  '2330', -- solo el número
  'Texto OFICIAL y verbatim del artículo, verificado contra la fuente legal, no la paráfrasis del manual.',
  '[["palabra1", "palabra2"], ["palabra3"], ["*"]]'::jsonb, -- grupos acumulativos de ocultamiento, opcional
  array['palabra_critica1', 'palabra_critica2'],
  'Código Civil, art. 2330'
)
on conflict (id) do nothing;
```

`palabras_criticas` son las palabras que exigen coincidencia exacta sin
tolerancia al practicar; elige las que cambian el sentido normativo si se
alteran (verbos rectores, cifras, plazos), no cualquier palabra del
artículo.

## Regla de oro de datos: el `id` es único en toda la tabla, sin importar la materia

Si un artículo ya está cargado (ej. `cc-art-44` en `contractual`) y es
también relevante para otra materia (ej. `bienes`), **no insertes una
segunda fila con el mismo id**: el `on conflict (id) do nothing` la
ignora en silencio y el ítem se pierde sin ningún error. En vez de eso,
**antes de generar un ítem de Memorice, revisa si el artículo ya existe
en la tabla para otra materia**; si existe, guarda las dos materias
separadas por coma en la fila existente (`materia =
'contractual,bienes'`) en vez de crear una fila nueva. El filtro de
`app/alternativas.html` (función `perteneceAArea`) ya entiende ese
formato. El `subtema` de esa fila debe quedar corto y neutral para las
materias que comparte; si hace falta anotar por qué el artículo cruza de
materia, ese detalle va en `fuente`.

## Volumen esperado

Salvo que Laura pida un número distinto, apunta a 1-2 ítems de Memorice
por eje, solo si el eje tiene un artículo central verificable.

## Checklist específica de Memorice

Además de la auto-auditoría del núcleo, verifica:

- [ ] El `texto` es el texto oficial verbatim del artículo, no una
      paráfrasis ni una reconstrucción de memoria; verificado contra una
      fuente legal oficial, no contra el manual.
- [ ] `palabras_criticas` incluye los verbos rectores, cifras y plazos
      que cambian el sentido normativo si se alteran.
- [ ] Ningún artículo nuevo reusa el `id` de uno ya cargado en otra
      materia sin fusionarlo (ver "Regla de oro de datos" arriba).
