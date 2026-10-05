# Acto Jurídico, capítulo IV.B (Nulidad) — chequeo de paráfrasis cercana

Fecha: 2026-10-01. Rama: `worktree-acto-juridico-cap4`.

## Alcance

B completo: B.1 Aspectos generales, B.2 La nulidad absoluta, B.3 La
nulidad relativa, B.4 Los efectos de la nulidad (líneas 2170-2674 del
manual). Fuentes: Boetsch `principal_10` (pp. 124-138) y `principal_11`
(pp. 138-150), más el anexo Bozzo e Ibarra (pp. 9-15 del PDF del
anexo, la sección que trata la nulidad).

Es el bloque más largo del capítulo, escrito en los tramos 2 y 3
(2026-09-29/30), **antes** de que existiera el chequeo de paráfrasis
cercana. A diferencia de IV, intro+A (solo 3 pasajes), acá el problema
es **generalizado**: la gran mayoría de la prosa de conexión sin autor
nombrado reproduce la construcción de la fuente con sinónimos
cambiados, sin reestructurar de verdad. Y el problema no es solo con
Boetsch: buena parte del contenido que no viene de Boetsch (B.1.3 "la
distinción no mide la intensidad", B.1.7 los tres principios de orden
público/derecho estricto/no hay nulidad por causa sobreviniente, B.1.9
completo, B.2.4 el párrafo de la Corte Pedro Aguirre Cerda y el
principio *nemo auditur*, B.3.6.1 la crítica al término "ratificación"
y su `.definicion`, y parte de B.4.5 la conversión) viene del anexo
Bozzo e Ibarra, y tiene el mismo problema: está parafraseado de cerca
sin que pueda atribuirse (nunca se nombra a Bozzo e Ibarra en el
manual).

## Qué se encontró

Comparado oración por oración contra ambas fuentes. Cuatro categorías:

### 1. Autor con nombre, ya atribuido con claridad (cumple la regla, no se toca)

BARAONA (B.1.7(vi) doctrina minoritaria no se nombra ahí, pero sí en
B.2.6, B.2.7 y en varios pasajes de B.4.4), VIAL (B.4.2, la crítica a
la distinción contrato cumplido/no cumplido), RODRÍGUEZ (B.4.4, dos
pasajes). En todos estos casos el manual dice "BARAONA sostiene que…",
"Para VIAL…", etc.: es reporte en voz propia pero atribuido, que es
exactamente lo que exige la regla cuando no se tiene la cita textual
del autor (solo la paráfrasis que de él hace Boetsch). **No requieren
cambio.**

### 2. Verbatim o casi verbatim, sin atribución (la categoría más grave)

Son oraciones completas, iguales o casi iguales palabra por palabra a
la fuente, presentadas como prosa propia del manual:

- **B.2.1** (Concepto de nulidad absoluta): el bloque `.definicion`
  completo es idéntico a Boetsch, palabra por palabra.
- **B.3.1** (Definición de nulidad relativa): el bloque `.definicion`
  es Boetsch palabra por palabra, solo con las cláusulas reordenadas.
- **B.3.6.1** (Concepto de confirmación): el bloque `.definicion` es
  casi palabra por palabra el texto del anexo Bozzo e Ibarra ("La
  confirmación de la nulidad se define como el acto por el cual
  aquél que tiene derecho a pedir la declaración de nulidad,
  declara su voluntad de no usar de ese derecho, haciendo en
  consecuencia desaparecer los vicios que afectaban al acto").
- **B.3.4.1** puntos (i), (ii) y (iii) (el beneficiado, herederos,
  cesionarios): los tres, casi verbatim de Boetsch.
- **B.3.6.2(i)** (ratificación expresa) y **B.3.6.2(ii)** intro: casi
  verbatim de Boetsch.
- **B.3.6.3** los cuatro caracteres (unilateral, accesoria,
  irrevocable, retroactiva): Boetsch ya los traía numerados (i)-(iv)
  en el mismo orden; el manual solo les agregó una etiqueta corta.
  Eso es forma, no reestructuración real.
- **B.3.6.4** los seis requisitos de la ratificación: (i) y (iv) son
  idénticos palabra por palabra a Boetsch; (ii), (iii) y (v) casi
  verbatim (se les agregó la cita textual del artículo, que sí está
  bien, pero la frase que la introduce es la misma de Boetsch).
- **B.1.7(iv)** y **B.1.7(vi)**: casi verbatim de Boetsch.
- **El "No olvidar" de B.4.5** (los dos requisitos de la conversión
  material): la frase final ("es indispensable que las partes ignoren
  la nulidad… que celebraron") es casi palabra por palabra del anexo.

### 3. Paráfrasis cercana, mismo orden de cláusulas (necesita reestructurarse)

Afecta prácticamente toda la prosa de conexión sin autor del resto del
bloque. Los más claros:

- **B.1.3** completo ("¿Por qué una se llama absoluta…?"): la pregunta
  es nueva, pero la respuesta sigue la misma construcción de Boetsch
  oración por oración.
- **B.1.4** completo (Terminología): la introducción y las tres
  razones (i)-(iii) siguen a Boetsch casi cláusula por cláusula.
- **B.1.5**: primera oración casi verbatim.
- El párrafo de B.1.7 sobre la doctrina que no comparte el criterio de
  la sentencia judicial ("Parte de la doctrina no comparte…").
- **B.1.8**: el párrafo "Hay disposiciones de un acto…" y la referencia
  al art. 1061 (antes del ejemplo propio de la tía Valeria).
- **B.2.3**, **B.2.4** (los párrafos de conexión, no las citas
  textuales ni la tabla), **B.2.6**, **B.3.3**.
- **B.3.4.2**: los dos párrafos sobre la simple aserción y el dolo.
- **B.4.1**; los párrafos de las cuatro excepciones de **B.4.2**; los
  tres párrafos de conexión de **B.4.3** (salvo el ejemplo propio de
  la señora Pilar); los párrafos de apertura de **B.4.4**.

### 4. Genuinamente reestructurado, cumple la regla (no se toca)

- **B.1.1**: prosa de Boetsch convertida en lista `(i)/(ii)/(iii)` con
  encabezados; es una reorganización real, no solo formato.
- **B.1.6**: tabla comparativa de 5 criterios (ya aprobada en el
  tramo 2).
- **B.1.8**: la conversión de "total/parcial" a lista con encabezados.
- **B.1.9** (Nulidad consecuencial y refleja): viene del anexo, pero
  está bien reestructurado y combina contenido de dos párrafos del
  anexo en una exposición propia con ejemplo nuevo (Diego y Sebastián).
  **No requiere cambio**, aunque conviene revisarlo una vez más al
  reescribir el resto del punto B.1 para mantener la voz consistente.
- Los ejemplos propios (Felipe y la Coty, doña Marta/don Waldo/la
  señora Pilar, Matías y la guitarra, la tía Valeria): ninguno viene de
  la fuente, no se tocan.
- **B.4.5**: la cita de Eduardo Court (atribuida, textual) y la tabla
  comparativa de las tres clases de conversión (condensación real de
  la prosa en comillas del anexo, no transcripción reordenada).
- Las listas de causales (B.2.2, B.3.2): son enumeraciones de
  categorías legales, no prosa argumentativa. Se dejan como están a
  propósito: no hay forma distinta de enumerar las mismas nueve u ocho
  causales sin inventar contenido.

### 5. Una decisión que le corresponde a Laura

El bloque `.definicion` de **B.1.2** ("La nulidad es 'la sanción legal
establecida por la omisión de los requisitos y formalidades que se
prescriben para el valor de un acto según su especie y la calidad o
estado de las partes'") está entre comillas pero sin autor, y ni
Boetsch la atribuye a nadie: es la fórmula con que la doctrina
describe el art. 1681. No se puede inventar un autor (ni Alessandri ni
Vodanovic aparecen citados por Boetsch en este punto). Dos caminos:

- (a) reescribirla en voz propia, sin comillas, como paráfrasis del
  art. 1681 (igual que ya se hace con los artículos citados en todo el
  manual), o
- (b) dejarla entre comillas pero presentada como "la definición que
  suele dar la doctrina", sin nombre propio.

## Qué falta verificar (no alcanza a este informe)

- El párrafo final de B.4.5 sobre "otros ejemplos de conversión legal"
  (fideicomisos, legados, censos, donaciones) no se comparó todavía
  letra por letra contra el anexo (pp. 15 en adelante): hay que
  revisarlo antes de cerrar B.4.
- Los artículos citados en B no se volvieron a verificar en este
  chequeo (ya se verificaron en los tramos 2 y 3 originales); no se
  repitió esa verificación acá.

## Propuesta

Igual que en el capítulo I: dado que el problema es generalizado y no
puntual, la reescritura punto por punto con `Edit` sería más lenta y
más propensa a dejar pasajes sueltos que una reescritura completa en
voz propia, **conservando intacto**:

- todo el contenido, los artículos citados y el vocabulario técnico;
- las cajas `.ley` (son citas textuales de artículos, no del autor);
- los ejemplos propios ya existentes;
- todos los agregados que Laura aprobó en los tramos 2 y 3
  ("dale con todo");
- los encabezados y el índice.

Se aplicaría la decisión pendiente de B.1.2 según lo que Laura elija.

Para no repetir el problema de volumen de otros tramos grandes,
propongo partirlo en cuatro sub-pasadas, con aviso antes de seguir con
la siguiente:

1. B.1 Aspectos generales (9 puntos).
2. B.2 La nulidad absoluta (7 puntos).
3. B.3 La nulidad relativa (6 puntos, el más largo por la ratificación).
4. B.4 Los efectos de la nulidad (5 puntos, el que tiene más
   contenido doctrinal de BARAONA/VIAL/RODRÍGUEZ, que no se toca).

Verificación mecánica en cada sub-pasada, igual que en tramos
anteriores: balance de etiquetas, cero guiones largos y guillemets,
ningún párrafo sobre 1.200 caracteres, mismos artículos citados antes
y después (script de comparación), diff línea por línea de lo
eliminado, capturas de Chrome headless.

## Qué se hizo en B.1 (Aspectos generales)

Laura decidió B.1.2: se dejó entre comillas, presentada como "la
definición que suele dar la doctrina" (sin inventar autor).

Se reescribieron en voz propia los pasajes marcados como verbatim o
paráfrasis cercana: los dos `.definicion` de B.1.3 (fusionados en uno
solo, con otra construcción), el párrafo "¿Por qué una se llama
absoluta...?", todo B.1.4 (Terminología, intro + tres razones +
conclusión), la primera oración de B.1.5, la frase de transición antes
de la tabla de B.1.6, los seis principios de B.1.7 y el párrafo de la
doctrina minoritaria sobre la sentencia judicial, y el párrafo sobre
la extensión de la nulidad parcial de B.1.8 (incluido el ejemplo del
art. 1061). Mismo contenido, mismos artículos, mismo vocabulario
técnico, otra construcción de oración. No se tocó B.1.1 (ya era lista
reestructurada), B.1.6 (la tabla), B.1.8 (la lista total/parcial, el
ejemplo de la tía Valeria, la caja de Conexiones) ni B.1.9 (ya estaba
bien reestructurado contra el anexo).

Verificación mecánica: balance de etiquetas OK (`p` 42/42, `div`
4/4, `span` 90/90, `em` 6/6, `strong` 27/27, `table`/`tr`/`th`/`td`
OK, `h2` 10/10), cero guiones largos y guillemets, ningún párrafo
sobre 1.200 caracteres, mismos artículos citados antes y después (10,
1057, 1058, 1061, 1469, 1536, 1681, 1682, 1683, 1690, 2381), diff
línea por línea de lo eliminado revisado (coincide exactamente con lo
señalado en este informe), capturas de Chrome headless revisadas
bloque por bloque. No se tocó el índice.

## Corrección al inventario original de B.2

Al reescribir B.2 se encontró que el chequeo original (sección "Qué se
encontró") **no había detectado todo** lo que necesitaba arreglo en
este punto. Quedaron fuera del inventario inicial:

- **B.2.2**, la segunda frase introductoria ("Para quienes no aceptan
  la teoría de la inexistencia...") es idéntica palabra por palabra a
  Boetsch. (La lista de causales en sí, items (i)-(ix), sigue sin
  tocarse: es enumeración de categorías legales.)
- **B.2.4**, la frase introductoria ("Conforme al art. 1683... puede
  declararse por tres vías") es Boetsch con una palabra cambiada.
- **B.2.5 completo**: no apareció en ninguna de las cuatro categorías
  del informe original, pero es paráfrasis cercana clase por clase
  contra Boetsch (misma estructura de tres oraciones, sinónimos
  cambiados).
- **B.2.6**, los dos primeros párrafos (no el tercero, que sí estaba
  bien identificado como atribuido a BARAONA): el primero es
  paráfrasis cercana, el segundo tiene una oración completa idéntica
  palabra por palabra a Boetsch ("El plazo se cuenta desde la fecha en
  que se celebró el acto o contrato nulo, porque desde entonces podía
  hacerse valer la acción de nulidad").
- **B.2.7**, el primer párrafo (no el segundo, atribuido a BARAONA):
  paráfrasis cercana, mismo contenido en el mismo orden.

Conclusión para Laura: el inventario original de este informe (sección
"Qué se encontró") **no es confiable para B.3 y B.4** tal como está.
Antes de reescribir esos dos puntos hay que repetir la comparación
oración por oración contra Boetsch y, donde corresponda, contra el
anexo, en vez de partir de la lista ya hecha.

## Qué se hizo en B.2 (La nulidad absoluta)

Se comparó cada párrafo de B.2 oración por oración contra Boetsch
`principal_10` (pp. 129-138, páginas reales impresas "Página N de 221"
que coinciden con las páginas del PDF) y, para los pasajes que no
vienen de Boetsch, contra el anexo `Anexo_secundario_AJ_Ineficacia.pdf`
de Bozzo e Ibarra (pp. internas 9-12 del PDF, sección "QUIEN NO PUEDE
PEDIR LA DECLARACION DE NULIDAD").

Se reescribieron en voz propia, conservando contenido, artículos y
vocabulario técnico:

- B.2.1: el `.definicion` completo (verbatim en Boetsch), además
  redactado para no repetir la fórmula ya usada en la nueva B.1.3
  ("naturaleza o especie").
- B.2.2: solo la segunda frase introductoria (antes de las causales
  v-ix). La lista de causales no se tocó.
- B.2.3: el párrafo completo.
- B.2.4: la frase introductoria; en (i), las dos oraciones de conexión
  después de la cita textual; en (ii), los seis párrafos de conexión
  (se dejaron intactas la cita del art. 1683, la caja de
  jurisprudencia de la Corte Suprema 2008 y la tabla
  representado/herederos); en (iii), la oración de conexión después de
  la cita.
- B.2.5: el párrafo completo.
- B.2.6: los dos primeros párrafos y la primera oración del tercero
  (hasta donde empieza la atribución a BARAONA); el resto del tercer
  párrafo, atribuido a BARAONA, no se tocó.
- B.2.7: el primer párrafo; el segundo, atribuido a BARAONA, no se
  tocó.

Dos hallazgos adicionales durante la reescritura, fuera del alcance de
paráfrasis pero corregidos de paso porque se estaba trabajando el
mismo párrafo:

- **Cita incompleta del art. 1683 en B.2.4(iii)**: el manual citaba
  "puede asimismo pedirse por el ministerio público..." pero el texto
  real del art. 1683 (verificado contra la caja `.ley` de A.4.3, línea
  2111) dice "puede asimismo pedirse **su declaración** por el
  ministerio público...". Corregido para que la cita entre comillas
  sea literal.
- **Párrafo de la Corte Pedro Aguirre Cerda, ahora con cita literal**:
  el párrafo no tenía comillas pese a presentarse como lo que resolvió
  el fallo. El anexo Bozzo e Ibarra sí trae la cita textual completa
  del fallo, con su referencia ("Repertorio, Tomo VI, pág. 234", no un
  rol, el anexo no da uno). Se usó esa cita literal entre comillas en
  vez de la paráfrasis. También se corrigió el principio latino, que
  en el anexo es "nemo auditur propriam **suam** turpitudinem
  allegans" (el manual omitía "suam").

Verificación mecánica: balance de etiquetas OK en todo el archivo (`p`
758/758, `span` 1930/1930, `div` 69/69, `strong` 588/588, `em`
277/277, `table`/`tr`/`th`/`td` OK, `h2` 133/133), cero guiones largos
y guillemets en B.2, ningún párrafo sobre 1.200 caracteres, mismos
artículos citados antes y después del bloque B.2 (1681, 1682, 1683,
8°, 1468, 1448, 1685, 350 COT, 2514, 705, 1687, 1689, 37 LMC), diff
línea por línea revisado (19 párrafos modificados, todos coinciden con
lo descrito acá). **No se pudo tomar captura de Chrome headless**: el
sandbox de este worktree bloqueó la invocación por la ruta con
espacios ("Google Chrome.app"); quedó pendiente si Laura quiere
verificación visual antes de aprobar.

## Qué se hizo en B.3 (La nulidad relativa)

Se repitió la comparación oración por oración contra Boetsch
`principal_10` (pp. 133-138, la última parte del PDF: B.3 termina a
media página 138, justo antes de que empiece "B.4 LOS EFECTOS DE LA
NULIDAD"), en vez de partir del inventario de la sección "Qué se
encontró" de este informe. El resultado confirma y completa lo que ya
se había anotado ahí para B.3, con una corrección: los **seis**
requisitos de la ratificación de B.3.6.4 vienen los seis de Boetsch
(no solo los dos primeros, que es lo único que parecía en la página
137; los cuatro restantes, (iii) a (vi), están al principio de la
página 138, antes del título de B.4).

Se reescribieron en voz propia, conservando contenido, artículos,
ejemplos y vocabulario técnico:

- B.3.1: el `.definicion` (verbatim con cláusulas reordenadas) y el
  párrafo siguiente (contracara de la absoluta).
- B.3.3: la frase introductoria de las tres características.
- B.3.4.1: los tres puntos (i) el beneficiado, (ii) sus herederos,
  (iii) sus cesionarios.
- B.3.4.2: la frase introductoria y los dos párrafos (i) la simple
  aserción, (ii) el dolo. No se tocó el art. 1685 citado en bloque
  `.ley`, ni la Advertencia ni el Ejemplo ("La guitarra eléctrica"),
  que ya eran voz propia.
- B.3.5: la frase sobre el saneamiento transcurridos los cuatro años, y
  la frase introductoria del párrafo de los herederos (el contenido
  sustantivo de esa parte, verificado contra el art. 1692 en el tramo
  2, no viene de Boetsch y no se tocó). No se tocó el "No olvidar".
- B.3.6.1: la frase de las dos acepciones, las etiquetas (i) y (ii), el
  `.definicion` de confirmación (que en el chequeo anterior ya constaba
  como casi verbatim del anexo), el párrafo de la renuncia y la crítica
  terminológica, y el párrafo del fundamento (art. 12). No se tocó el
  "No confundir".
- B.3.6.2: (i) ratificación expresa, la frase introductoria de (ii), y
  las tres preguntas a)/b)/c) sobre la ejecución voluntaria (esta
  última parte no estaba en el inventario original de "Qué se
  encontró", que solo marcaba la introducción de (ii); al comparar de
  nuevo, las tres resultaron igual de cercanas a Boetsch).
- B.3.6.3: los cuatro caracteres (i)-(iv) y el párrafo final sobre la
  consolidación de la situación de hecho (del anexo, Y13).
- B.3.6.4: los seis requisitos (i)-(vi), conservando las citas
  textuales entre comillas de los arts. 1696, 1697 y 1694.

No se tocaron las listas de causales (B.3.2): son enumeración de las
ocho categorías legales del art. 1682, igual criterio que B.2.2.

Verificación mecánica: balance de etiquetas OK (`p` 56/56, `span`
122/122, `div` 4/4, `strong` 28/28, `em` 1/1, `h2` 7/7, `h3` 6/6), cero
guiones largos y guillemets, ningún párrafo sobre 1.200 caracteres (el
más largo quedó en 536), mismos artículos citados antes y después
(1681, 1682, 1683, 1684, 1685, 1691, 1692, 1693, 1694, 1695, 1696,
1697, 2160, 12). No se tocó el índice.

## Siguiente paso

Laura revisa B.2 (`AJ_vista_previa.html`) y B.3
(`AJ_vista_previa_B3.html`) en el navegador. Con su aprobación: commit,
push, y seguir con B.4 (Los efectos de la nulidad), repitiendo la
comparación completa contra Boetsch y el anexo en vez de partir del
inventario original de este informe.
