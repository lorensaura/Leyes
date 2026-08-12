# Notas de reformato de REX (02_Responsabilidad_Extracontractual_Manual.html)

> Bitácora de decisiones editoriales (no mecánicas) tomadas al reformatear
> el manual de Extracontractual para igualar el formato de REC/REP, según
> `docs/script_apuntes.md` sección 1.6. El grueso del trabajo es mecánico
> (partir párrafos largos en varios `<p>`, sin tocar una palabra); esta nota
> registra solo lo que sí implicó una decisión: qué se agregó, qué se
> reordenó, qué se fusionó o se quitó por duplicado. Todo el contenido
> jurídico sigue pendiente de revisión de Laura, igual que el resto del
> manual (regla de `docs/script_apuntes.md` sección 0).

## Global
- `font-size` 12pt→11pt y `line-height` 1.2→1.45 en el body del `<style>`,
  para igualar REC/REP (REX quedó con el ajuste denso original).

## Eje 1 (A)
- Agregada 1 caja `.callout` "No confundir": efectos de la sentencia penal
  condenatoria vs. absolutoria en sede civil (contenido ya presente en el
  párrafo, solo destacado en recuadro).
- Convertidas a `.enum-a`/`.enum-i`: delito/cuasidelito civil (definiciones
  del punto 3), los tres corolarios de la no-responsabilidad (punto 4.2),
  las tres categorías de daños punitivos ingleses (punto 4.4).
- Arreglados 2 bugs preexistentes de span (punto seguido dentro del
  `<span class="art">`, ej. `artículo 2314.</span>` → `artículo 2314</span>.`).

## Eje 2 (B)
- Agrupadas en cajas `.jurisprudencia` (varios fallos, un solo recuadro,
  por la regla de `script_apuntes.md` 1.3): CS 1921 + CS 1938 (tipicidad);
  CS 1917 + CS 1938(ene) + CS 1952 (interpretación restrictiva del art.
  179); CA Santiago 1923 + CS 1970 (efecto erga omnes).
- Agregada 1 caja `.callout`: culpa civil objetiva vs. culpabilidad penal
  subjetiva (contenido ya presente, destacado en recuadro).
- Convertidos a `.enum-a`: los "límites subjetivo/objetivo" de la condena
  penal (3.1); a `.enum-i`: las tres circunstancias del art. 179 CPC (3.3).

## Eje 3 (C)
- Agregada 1 caja `.callout`: "la pregunta que decide el estatuto
  aplicable" (contenido ya presente).
- Convertidos a `.enum-a`: delito/cuasidelito civil, tres/cinco aplicaciones
  del criterio (médica, precontractual, nulidad, productos, directores); a
  `.enum-i`: los cuatro "movimientos" de la tesis contraria a Alessandri.
- Arreglado bug de span en `artículo 2284.` (punto dentro del span).

## Eje 4 (D)
- Convertidos a `.enum-i`: las tres críticas al sistema de la culpa (1.2),
  las tres críticas a la doctrina objetiva (2.3), las tres consecuencias
  del carácter excepcional de la responsabilidad estricta (2.4).
- Fix de estructura: el ítem `(ii) Fuera de esos ámbitos...` había quedado
  sin párrafo de desarrollo (marcador seguido directo de `(iii)`, rompía el
  patrón marcador+párrafo de REC). Se separó en marcador corto + párrafo.

## Eje 5 (E)
- Agregada 1 caja `.callout`: demencia como estado declarado vs. hecho
  verificable (contenido ya presente).
- Convertidos a `.enum-i`: los tres requisitos de la demencia como causal
  de exoneración (2.3), las dos diferencias entre el art. 2319 y el art.
  2320 (4.2); a `.enum-a`: las tres técnicas comparadas de responsabilidad
  del incapaz (3.5).
- Agrupados en caja `.jurisprudencia`: CA Santiago 1861 + CA Concepción
  1939 (capacidad del menor ante riesgo evidente).
- **Bugs de span encontrados y corregidos durante la verificación**: dos
  marcadores `.enum-i`/`.enum-a` habían perdido el `<span class="art">`
  alrededor de un número de artículo al recortar la frase líder (2320 y
  2319). Detectados por el script de verificación (diff de conteo de
  `<span class="art">` entre original y nuevo), no a simple vista.

## Eje 6 (F)
- Agregada 1 caja `.callout`: capacidad califica al sujeto / voluntariedad
  califica al acto (contenido ya presente).
- Convertidos a `.enum-i`: los tres elementos del caso fortuito
  (irresistibilidad/imprevisibilidad/exterioridad, 3.3).
- **Quitada una repetición literal**: el párrafo de 3.3 narraba inline el
  fallo CS 20-jun-1949 y luego la caja `.jurisprudencia` ya existente
  repetía el mismo fallo. Se dejó solo la caja (con el contenido más
  completo, fusionando una frase que solo estaba en la versión inline) y
  se quitó la narración duplicada. Mismo criterio para CA Concepción 1985.

## Eje 7 (G)
- Agregadas 2 cajas `.callout`: "la misma solución, dos arquitecturas
  distintas" (Rodríguez Grez vs. Barros sobre legítima defensa) y "estado
  de necesidad vs. caso fortuito" (contenido ya presente en ambos casos).
- Convertidos a `.enum-i`: los dos requisitos del estado de necesidad
  (6.2), los cinco requisitos de la legítima defensa (7).
- Agrupada en caja `.jurisprudencia`: CA Santiago 1890 + CA Santiago 1908
  (los dos casos de estado de necesidad que la sección ya contrastaba).
- **Fix de numeración preexistente**: la sección "6.3. La distinción
  decisiva..." estaba escrita inline dentro del párrafo de 5.2, sin
  etiqueta `<h3>` y con el número equivocado (6.3 en vez de 5.3, ya que
  cuelga de la sección 5). Se convirtió en `<h3>5.3.</h3>` propio.
- Agregado `<span class="art">` a una cita de "2284" que en el original
  aparecía sin span (inconsistente con el resto del documento).

## Eje 8 (H)
- Desde este eje, los cortes de párrafo se hacen con un script de anclas
  (texto exacto, sin retipear nada) que verifica 0 diffs de contenido antes
  de tocar el archivo real; solo las adiciones (enum/cajas) se escriben a
  mano. Ver metodología abajo.
- Convertidas a `.enum-i`: las tres consecuencias de la distinción
  delito/cuasidelito civil (punto 1).
- Agregada 1 caja `.callout`: "responsabilidad subjetiva" no es sinónimo
  de responsabilidad por culpa (contenido ya presente, la propia sección
  lo señala como "confusión terminológica frecuente").

## Metodología desde el eje 8: cortes por anclas
Para minimizar el riesgo de perder un `<span class="art">` al retipear
manualmente (bug real que apareció 2 veces en el eje 5 y 1 en el eje 3,
detectado por el script de verificación, no a simple vista): los cortes de
párrafo puramente mecánicos (partir un párrafo largo en dos, sin cambiar
una palabra) se hacen con `scratchpad/split_anchors.py`, que recibe una
lista de "anclas" (subcadenas exactas de ~30-50 caracteres donde debe
empezar el nuevo párrafo), verifica que cada ancla aparezca exactamente una
vez en el tramo, e inserta `</p>\n\n<p>` antes de cada una. El resultado es
byte-idéntico al original salvo esos cortes: 0 líneas para revisar a mano.
Encima de eso se aplican, ahora sí a mano y en un diff corto y legible,
las adiciones de criterio (enum-i/enum-a, cajas, arreglos de numeración).

## Eje 9 (I)
- Convertidos a `.enum-i`: los cuatro argumentos a favor de la lectura
  amplia de Alessandri del art. 2329 (exegético/textual/experiencia/
  justicia correctiva); los tres grupos de condiciones de aplicación de
  la presunción (peligrosidad/control de los hechos/rol de la
  experiencia).

## Eje 10 (J)
- Solo cortes mecánicos (por anclas); la estructura de 7 requisitos de
  resarcibilidad ya estaba en h3, sin necesidad de enum adicional.

## Eje 11 (K)
- Convertidas a `.enum-i` las tres fuentes del daño patrimonial (daño a
  las cosas / a las personas / patrimonial puro, punto 5).

## Eje 12 (L)
- Convertidos a `.enum-i` los cinco argumentos que justifican la
  resarcibilidad del daño moral (punto 2).

## Eje 13 (M)
- Convertidas a `.enum-i` las tres críticas a la teoría de la equivalencia
  de las condiciones (1.1).

## Eje 14 (N)
- Convertidas a `.enum-i` las cuatro circunstancias de la acción de
  regreso contra el subordinado (punto 5, art. 2325).

## Eje 15 (O)
- Solo cortes mecánicos (por anclas); sin agregados de enum/caja.

## Eje 16 (P)
- Solo cortes mecánicos (por anclas); sin agregados de enum/caja.
