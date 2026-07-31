# Auditoría: renderizado de HTML en Flashcards (2026-07-31)

## Motivo

Laura reportó (con captura) que algunas flashcards mostraban texto crudo
de etiquetas HTML (ej. `<span class="art">artículo 2319</span>` visible
literalmente) en vez de renderizarlo. La causa raíz ya se identificó y
corrigió en `app/alternativas.html` (función `fcFormatearRespuesta`,
usada tanto para el lado de pregunta como el de respuesta de la
flashcard, línea ~1597-1601): el lado de la pregunta no restauraba
ninguna etiqueta, y además el regex de restauración de `<span class="art">`
no cubría el caso de comillas dobles.

Esta auditoría **no toca código**: es una revisión de los datos reales en
Supabase para confirmar que, con el arreglo aplicado, ninguna flashcard
de ninguna de las 3 materias queda mostrando markup crudo.

## Metodología

1. Se descargaron las 488 filas de la tabla `flashcards` en Supabase
   (`select=id,materia,tema,pregunta,respuesta,publicado`, proyecto
   `byyukzhxhtopojgvgglp`), en un solo llamado (sin necesidad de paginar:
   488 filas caben bajo el límite de 1000 de PostgREST). Confirmado por
   `Content-Range: 0-0/488` que el total real es 488, y el archivo
   descargado trae exactamente 488 objetos.
2. Se leyó el código fuente real de `app/alternativas.html` (no la
   paráfrasis del encargo) para replicar el whitelist exacto que aplica
   el arreglo:
   - `escaparHtmlBase`: escapa `&` → `&amp;`, `<` → `&lt;`, `>` → `&gt;`
     (todo el HTML, sin excepción).
   - `fcFormatearRespuesta` restaura después, con dos regex:
     - `/&lt;(\/?)(b|i|em|strong|u)&gt;/g` → solo `<b>`, `</b>`, `<i>`,
       `</i>`, `<em>`, `</em>`, `<strong>`, `</strong>`, `<u>`, `</u>`,
       exactos, minúsculas, sin atributos, sin espacios.
     - `/&lt;span class=["']art["']&gt;/g` y `/&lt;\/span&gt;/g` → solo
       `<span class="art">` o `<span class='art'>` (comilla recta simple
       o doble, sin espacios extra alrededor de `=`, sin atributos
       adicionales, minúsculas) y `</span>`.
   - Cualquier otra etiqueta, o una variante mal formada de estas
     (mayúsculas, comillas curvas, atributos extra, espacios raros)
     **no se restaura** y queda visible como texto crudo.
3. Con un script de Python (no se le pidió a la API que analizara nada),
   se escaneó el campo `pregunta` y `respuesta` de las 488 filas con la
   regex genérica `<[a-zA-Z/][^>]*>` para encontrar **cualquier**
   substring con forma de etiqueta HTML, y se clasificó cada hallazgo:
   cubierto por el whitelist exacto de arriba, o no cubierto.
4. Chequeos adicionales de paranoia sobre el mismo corpus:
   - Se removieron todas las etiquetas ya identificadas y se buscó si
     quedaba algún `<` o `>` suelto en el texto restante (indicaría una
     etiqueta parcial o mal formada, o un uso matemático de `<`/`>`
     mezclado con letras). **Resultado: 0 casos.**
   - Se buscaron entidades HTML ya escapadas de forma literal en los
     datos crudos (`&lt;`, `&gt;`, `&amp;lt;`) que indicarían doble
     escape. **Resultado: 0 casos.**
   - Se listaron todas las variantes textuales exactas de etiquetas
     encontradas en todo el corpus, para verificar que no hay ninguna
     etiqueta fuera del whitelist (ej. `<p>`, `<br>`, `<div>`, `<SPAN>`,
     variantes con comillas tipográficas, etc.).
   - Se buscaron entidades HTML sueltas en el dato crudo (`&nbsp;`,
     `&aacute;`, `&mdash;`, `&#8217;`, etc., con la regex
     `&[a-zA-Z#][a-zA-Z0-9]{1,10};`), porque `escaparHtmlBase` escapa el
     `&` primero y convertiría cualquier entidad preexistente en texto
     literal tipo `&amp;nbsp;` visible en la tarjeta. **Resultado: 0
     casos** en las 488 filas × 2 campos.
   - Se contaron aperturas vs. cierres de cada etiqueta (`<b>`/`</b>`,
     `<i>`/`</i>`, `<em>`/`</em>`, `<strong>`/`</strong>`,
     `<span class="art">`/`<span class='art'>` vs. `</span>`) **por
     campo y por fila** (no solo el total global), para descartar una
     etiqueta sin cerrar en una fila compensada por una etiqueta de
     cierre suelta en otra fila distinta (que globalmente cuadraría
     pero rompería el renderizado de esa fila puntual). **Resultado: 0
     desbalances.**
   - Se verificó que ninguna fila tuviera `pregunta` o `respuesta` en
     `NULL` (se renderizaría como el string literal `undefined`).
     **Resultado: 0 casos.**

## Resultado: variantes de etiquetas encontradas en las 488 filas

Se encontraron exactamente estas 11 variantes de etiqueta en todo el
corpus (`pregunta` + `respuesta` de las 3 materias), con su conteo de
ocurrencias:

| Etiqueta | Ocurrencias |
|---|---|
| `<b>` | 345 |
| `</b>` | 345 |
| `<strong>` | 134 |
| `</strong>` | 134 |
| `<span class="art">` (comilla doble) | 76 |
| `<span class='art'>` (comilla simple) | 123 |
| `</span>` | 199 |
| `<em>` | 16 |
| `</em>` | 16 |
| `<i>` | 7 |
| `</i>` | 7 |

No aparece `<u>`/`</u>` en los datos (el whitelist lo soporta, pero
ninguna flashcard lo usa actualmente). No aparece ninguna otra etiqueta
(`<p>`, `<br>`, `<div>`, mayúsculas, atributos extra, comillas curvas,
etc.) en ninguna de las 488 filas.

**Las 11 variantes encontradas calzan, una por una, exactas contra el
whitelist del código ya corregido.** Cero casos NO cubiertos.

## Filas con markup, por materia

Filas (de `pregunta` y/o `respuesta`) que contienen al menos una
etiqueta HTML de las de arriba:

| Materia | Filas totales | Filas con markup (se benefician del arreglo) |
|---|---|---|
| Responsabilidad contractual | 225 | 207 |
| Responsabilidad extracontractual | 204 | 147 |
| Responsabilidad precontractual | 59 | 59 |
| **Total** | **488** | **413** |

(Las 488 filas están `publicado = true` en las 3 materias.)

En las 413 filas con markup, el conjunto de filas "con al menos una
etiqueta cubierta" y "con al menos una etiqueta cualquiera" es idéntico
en las 3 materias, confirmando que no hay ningún caso mixto (etiqueta
cubierta + etiqueta no cubierta en la misma fila).

## Casos NO cubiertos

**Ninguno.** El escaneo con la regex genérica de detección de etiquetas
(`<[a-zA-Z/][^>]*>`) sobre las 488 filas × 2 campos (`pregunta`,
`respuesta`) no encontró ni un solo caso que no calzara exacto con el
whitelist del arreglo ya aplicado. Tampoco se encontraron etiquetas
parciales, corchetes sueltos, entidades HTML doblemente escapadas,
entidades HTML sueltas sin escapar (`&nbsp;` y similares), campos
`NULL`, ni desbalances de apertura/cierre por fila.

## Conclusión

**Todas las flashcards de las 3 materias (Contractual, Extracontractual,
Precontractual) van a renderizar bien con el arreglo ya aplicado en
`app/alternativas.html`**: ni markup crudo visible, ni etiquetas sin
cerrar, ni entidades HTML sueltas. No quedan casos pendientes de
revisión manual en Airtable ni ajustes adicionales de código: el
contenido real en Supabase solo usa las variantes de etiqueta exactas
que el whitelist ya restaura (`<b>`, `<i>`, `<em>`, `<strong>`,
`<span class="art">` con comilla simple o doble, y sus cierres
correspondientes), siempre balanceadas dentro de cada fila.

Nota de mantenimiento a futuro: si en algún momento se genera contenido
nuevo con `<u>` (soportado por el whitelist pero sin uso actual), otra
etiqueta distinta, o con atributos extra / mayúsculas / comillas
curvas, ese contenido específico quedaría mostrando markup crudo hasta
que se corrija el dato o se amplíe el whitelist del código. Esta
auditoría cubre solo el estado de los datos al 2026-07-31.
