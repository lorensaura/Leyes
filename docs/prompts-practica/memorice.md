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

## Regla de oro específica de Memorice: quién pone el texto (Laura, 2026-07-28 y 2026-10-07)

Memorice tiene dos clases de ítem, con reglas distintas:

- **Artículos de ley: Laura decide qué artículo entra y manda ella el
  texto legal exacto.** No salgas a buscar el artículo ni a verificar su
  texto por tu cuenta (ni en leychile.cl ni en los PDF de códigos), y no
  lo reconstruyas desde el manual: los manuales casi siempre
  **parafrasean** los artículos ("el artículo 2332 establece un plazo de
  cuatro años..." es un resumen, no el texto legal). Pídele a Laura el
  artículo y el texto verbatim y trabaja solo con lo que ella entregue.
  Lo cargado antes con verificación propia (ej.
  `scripts/memorice_literales_2026-07-28.sql`) sigue valiendo.
- **Definiciones doctrinales** (desde 2026-10-07): el texto se copia
  **literal** de la definición entre comillas del manual, sin la frase
  que la introduce. Laura elige cuáles entran: el informe del lote le
  lista las candidatas.

## Qué extraer

Artículos: solo los que Laura indique. Definiciones: las definiciones
entre comillas del manual (párrafos `p.definicion`), propuestas a Laura
para que elija.

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

**Definiciones:** misma tabla, con `articulo = ''`, id
`<materia>-def-NNN` (ej. `aj-def-001`) y en `fuente` el autor si el
manual lo nombra más la ubicación (ej. "Definición de acto jurídico de
VIAL. Manual de Acto Jurídico, I.4"). Los grupos de
`prioridad_ocultamiento` deben aparecer tal cual en el texto, y
`palabras_criticas` van como palabras sueltas (la app las compara palabra
por palabra).

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

- [ ] Artículos: el `texto` es exactamente el que mandó Laura, no una
      paráfrasis del manual ni una reconstrucción de memoria.
- [ ] Definiciones: el `texto` es literal del manual, y Laura eligió que
      entrara.
- [ ] `palabras_criticas` incluye los verbos rectores, cifras y plazos
      que cambian el sentido normativo si se alteran.
- [ ] Ningún artículo nuevo reusa el `id` de uno ya cargado en otra
      materia sin fusionarlo (ver "Regla de oro de datos" arriba).
