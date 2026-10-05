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

## Propuesta (ya ejecutada: las 4 sub-pasadas de abajo son B.1, B.2, B.3 y B.4, completas al 2026-10-05)

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

## Qué se encontró en B.4 (Los efectos de la nulidad), inventario completo con el método corregido (2026-10-05)

Comparación oración por oración contra Boetsch `principal_11` completo
(pp. 138-150 de 221, el PDF íntegro de "EFECTOS NULIDAD") y, para la
conversión, contra el anexo Bozzo e Ibarra pp. 13-16 (sección
"Conversión de los actos nulos"), que es de donde salió toda la
ampliación de B.4.5 aprobada en el tramo 3. A diferencia del
inventario original de este mismo informe (que para B.4 solo daba una
lista parcial, "los más claros"), este sigue el método de
`actualizar-manuales-existentes.md` 3: checklist exhaustivo, una fila
por punto, contra la fuente extraída directo, con las mismas categorías
del paso 2.c (no solo paráfrasis).

### Checklist, una fila por punto

| Punto | Contenido | Veredicto |
|---|---|---|
| B.4.1 | Conceptos generales (párrafo único) | Paráfrasis cercana |
| B.4.2 | Caja `.ley` art. 1687 | Cita textual, no se toca |
| B.4.2 | "Como la nulidad opera con efecto retroactivo..." | Paráfrasis cercana |
| B.4.2 | Ejemplo Felipe y la Coty | Propio, no se toca |
| B.4.2 | "La doctrina tradicional suele distinguir..." (antes de VIAL) | Paráfrasis cercana |
| B.4.2 | Atribución a VIAL | Atribuido, no se toca |
| B.4.2(i) | Poseedor de buena fe | Verbatim parcial |
| B.4.2(ii) | Objeto o causa ilícita a sabiendas | Paráfrasis cercana |
| B.4.2(iii) | Contrato con incapaz (fundamento y restitución) | Está completo, paráfrasis cercana |
| B.4.2(iv) | Poseedor que adquiere por prescripción | Paráfrasis cercana |
| B.4.3 | Párrafo de apertura (acción reivindicatoria, dominio no sale del tradente) | Verbatim parcial |
| B.4.3 | "Existen tres excepciones..." | Paráfrasis cercana |
| B.4.3(i) | Lesión enorme | Paráfrasis cercana |
| B.4.3(ii) | Tercero que adquirió por prescripción (primera parte) | Paráfrasis cercana |
| B.4.3 | Ejemplo señora Pilar | Propio, no se toca |
| B.4.3(ii) | Poseedor que se colocó en imposibilidad de restituir | Verbatim parcial |
| B.4.3(iii) | Heredero indigno | Paráfrasis cercana |
| B.4.4 | Párrafo de apertura (dos acciones, tercera doctrinal) | Verbatim parcial |
| B.4.4.1(i) | A quién se dirige la acción de nulidad | Paráfrasis cercana |
| B.4.4.1(ii) | Plazos de prescripción (10/4 años, violencia/incapacidad) | Está completo, factual |
| B.4.4.1 | Prescripción extintiva, de corto tiempo (art. 2524) | Verbatim parcial |
| B.4.4.1 | Suspensión a favor de herederos menores (art. 1692) | Verbatim parcial, **y Falta**: no se dice que la suspensión no puede extenderse por analogía a otros incapaces (Boetsch sí lo explicita) |
| B.4.4.2 | "Es de carácter real: se dirige contra quien posea la cosa" | Verbatim parcial |
| B.4.4.2 | `.definicion` acción reivindicatoria (art. 889) | Texto literal del artículo, no se toca |
| B.4.4.2 | Extinción por prescripción adquisitiva (art. 2517) | Está completo, factual |
| B.4.4.3 | "Es un tema poco explorado por la doctrina nacional..." | Verbatim parcial |
| B.4.4.3 | Hipótesis legales (arts. 1455, 1814, 1458 con BARAONA) | Atribuido donde corresponde, no se toca |
| B.4.4.3 | "El Código no tiene una regla general..." | Paráfrasis cercana |
| B.4.4.3 a) | La fuerza | Paráfrasis cercana, **y Formato**: corre junto con b)-h) en prosa, debería ser `enum-a` |
| B.4.4.3 b) | Error en cualidades accidentales | Paráfrasis cercana, mismo problema de formato |
| B.4.4.3 c) | Error sustancial/esencial (RODRÍGUEZ/BARAONA) | Atribuido, no se toca; mismo problema de formato |
| B.4.4.3 d) | Incapacidad relativa | Verbatim parcial; mismo problema de formato |
| B.4.4.3 e) | Formalidades habilitantes | Paráfrasis cercana; mismo problema de formato |
| B.4.4.3 f) | Falta de objeto (BARAONA/RODRÍGUEZ) | Atribuido, no se toca; mismo problema de formato |
| B.4.4.3 g) | Incapacidad absoluta | Paráfrasis cercana; mismo problema de formato |
| B.4.4.3 h) | Omisión de solemnidad | Verbatim parcial; mismo problema de formato |
| B.4.4.3 | Síntesis ("En síntesis, la indemnización...") | Verbatim parcial, **y Falta**: no menciona la petición reconvencional de perjuicios que trae Boetsch |
| B.4.4.3(iv) | "¿Por qué se discute la naturaleza...?" (contacto social) | Verbatim parcial |
| B.4.4.3(iv) | Cita textual de RODRÍGUEZ | Atribuido, cita textual, no se toca |
| B.4.4.3(iv) | "La posición mayoritaria, entre ellos BARAONA..." | Atribuido, no se toca (frase de enlace calcada, no amerita por sí sola) |
| B.4.5 | Cita textual de Eduardo Court | Atribuido, no se toca |
| B.4.5 | "Hay conversión cuando un acto inválido..." (definición sin comillas) | Verbatim parcial |
| B.4.5 | Art. 1444 + principio de conservación del negocio jurídico | Verbatim parcial (la frase de cierre reproduce una cita del anexo sin atribuir) |
| B.4.5 | Tabla, fila "Qué cambia" | Genuinamente reestructurado |
| B.4.5 | Tabla, fila "Cuándo opera", celda Formal | Paráfrasis cercana de una cita del anexo |
| B.4.5 | Tabla, fila "Cuándo opera", celda Legal | Paráfrasis cercana de una cita del anexo |
| B.4.5 | Tabla, fila "Ejemplo", celda Formal (promesa/notario) | Ejemplo de la fuente (anexo), no propio |
| B.4.5 | Tabla, fila "Ejemplo", celda Material (letra de cambio) | Ejemplo de la fuente (Boetsch), no propio |
| B.4.5 | Tabla, fila "Ejemplo", celda Legal (art. 1701, arts. 1137/1138) | Está completo, factual |
| B.4.5 | "No olvidar", los dos requisitos de la conversión material | Verbatim parcial (ya señalado en el inventario original de B) |
| B.4.5 | "Fuera de los dos casos ya vistos..." (fideicomisos, legados, censos, donaciones) | Paráfrasis cercana, mismo orden que el anexo |
| B.4.5 | **Falta**: los dos límites de la conversión legal (formalidad con sanción de nulidad; partes que prohíben la conversión) y el debate sobre si se necesita norma legal expresa | — |
| B.4.5 | "No hay conversión... cuando las partes se equivocan en el nombre" | **Atribución faltante**: es la posición de COVIELLO, no nombrado |
| B.4.5 | Jurisprudencia, Corte Suprema 3-dic-1921 | Paráfrasis cercana del resumen del caso que hace el anexo (no es cita textual de la sentencia) |

### 1. Autor con nombre, ya atribuido con claridad (cumple la regla, no se toca)

BARAONA y RODRÍGUEZ en B.4.4 (error sustancial/esencial, falta de
objeto, naturaleza de la responsabilidad) y la cita textual de
RODRÍGUEZ sobre la responsabilidad legal; Eduardo Court en B.4.5
(cita textual, atribuida). También la frase "La posición mayoritaria,
entre ellos BARAONA..." (B.4.4): está atribuida, aunque la frase
"entre ellos BARAONA" repite literalmente la de Boetsch, no amerita
reescritura por sí sola.

### 2. Verbatim o casi verbatim, sin atribución (la categoría más grave)

- **B.4.3**, primer párrafo: "por haber sido constituidos por quien no
  era dueño" es idéntico a Boetsch, igual que "nadie puede transferir
  más derechos de los que tiene" (el manual dice "tenía", única
  palabra cambiada).
- **B.4.3(ii)**, el párrafo del poseedor que se colocó en
  imposibilidad de restituir: "si la enajenó a sabiendas de que era
  ajena, debe además resarcir todo perjuicio" es literalmente la misma
  frase de Boetsch.
- **B.4.4**, párrafo de apertura: "siendo la segunda una petición
  condicional a que se acoja la primera" y "cierta doctrina agrega una
  tercera acción posible, de indemnización de perjuicios" son
  paráfrasis casi palabra por palabra.
- **B.4.4(i)**, el párrafo de la prescripción extintiva: "es
  extintiva", "corren contra toda persona, salvo que... se establezca
  otra regla" y "es uno de los pocos casos de excepción" son idénticos
  a Boetsch.
- El párrafo de la suspensión a favor de herederos menores: "no se
  toman en cuenta las suspensiones establecidas a favor de ciertas
  personas" es casi idéntico ("no se tomarán en cuenta...").
- **B.4.4(ii)**: "Es de carácter real: se dirige contra quien posea la
  cosa" es casi verbatim de Boetsch ("que es de carácter real: se
  dirige contra el que posea la cosa").
- **B.4.4(iii)**, primer párrafo: "se funda en la existencia de un daño
  causado por culpa o dolo de quien lo causa" es idéntico a Boetsch,
  palabra por palabra; "un tema poco explorado por la doctrina
  nacional" es casi igual ("bastante inexplorado").
- El párrafo de la incapacidad relativa: "los casos posibles son solo
  dos" es idéntico a Boetsch; "donde la consulta a los registros
  públicos es insoslayable" es casi igual.
- El párrafo de la omisión de solemnidad: "porque la ley se presume
  conocida por todos" es idéntico a Boetsch.
- El párrafo de síntesis ("En síntesis, la indemnización es
  compatible..."): la apertura y la estructura de los requisitos
  mínimos repiten a Boetsch casi palabra por palabra.
- El párrafo "¿Por qué se discute la naturaleza de esta
  responsabilidad?": "deberes de lealtad, distintos... de los que
  nacen de un contrato ya celebrado... como del deber general de no
  dañar a cualquiera" parafrasea de cerca a Boetsch, que no está
  atribuido a ningún autor en ese pasaje (es su propio análisis).
- **B.4.5**: la definición sin comillas ("Hay conversión cuando un
  acto inválido como tal se emplea...") repite casi palabra por
  palabra tanto a Boetsch como al anexo (que a su vez parafrasea a
  Boetsch casi igual). Y el pasaje sobre el art. 1444 y la
  conservación del negocio jurídico ("la voluntad negocial debe
  mantenerse en vigor en lo posible, para lograr el fin práctico que
  las partes persiguen con ella") repite casi palabra por palabra una
  cita que el propio anexo trae entre comillas de un autor no
  identificado ("Se ha señalado que...").
- El "No olvidar" de B.4.5 (los dos requisitos de la conversión
  material): ya estaba señalado en el inventario original de este
  informe como casi verbatim del anexo; sigue pendiente, no se tocó
  todavía.

### 3. Paráfrasis cercana, mismo orden de cláusulas (necesita reestructurarse)

- **B.4.1** completo.
- **B.4.2**: el párrafo de conexión después de la caja `.ley` del art.
  1687 ("Como la nulidad opera con efecto retroactivo..."); la primera
  oración del párrafo siguiente ("La doctrina tradicional suele
  distinguir...", antes de la atribución a VIAL); las cuatro
  excepciones (i)-(iv).
- **B.4.3**: la frase de transición "Existen tres excepciones..."; la
  excepción (i) lesión enorme; la primera parte de la excepción (ii)
  (antes del ejemplo propio); la excepción (iii) heredero indigno.
- **B.4.4**: la primera oración de (i) ("Es personal: se dirige contra
  el otro contratante..."); el párrafo "Para las demás causales, sin
  norma expresa, la doctrina distingue" y la frase sobre la fuerza y
  el error en cualidades accidentales (prosa propia de Boetsch, sin
  autor nombrado en ese pasaje); la frase de la omisión de
  formalidades habilitantes; el párrafo de la incapacidad absoluta;
  "El Código no tiene una regla general, pero sí disposiciones
  aisladas que la reconocen" (antes de los tres casos atribuidos).
- **B.4.5**: el párrafo final sobre los demás ejemplos de conversión
  legal ("Fuera de los dos casos ya vistos..."), que sigue la misma
  clasificación en dos grupos del anexo ("i. Mutación de la
  naturaleza..."; "ii. Reconocimiento de valor...") con los mismos
  artículos en el mismo orden. **Esto responde al pendiente que había
  quedado abierto en este mismo informe** ("no se comparó todavía
  letra por letra contra el anexo"): ya se comparó, y sí hay paráfrasis
  cercana que corregir.

### 4. Atribución faltante a un autor con nombre (no es solo paráfrasis: falta el nombre)

- **B.4.5**, el párrafo "No hay conversión, en cambio, cuando las
  partes solo se equivocan en el nombre del contrato...": en el anexo
  esta es la posición de **COVIELLO**, citado textual ("Según Coviello
  'no hay conversión, asimismo, sino conservación del negocio
  querido...'"). El manual la presenta como prosa propia, sin nombrar
  a Coviello. A diferencia de los demás casos de esta categoría, acá
  no basta reestructurar la oración: hay que **atribuirla a Coviello**
  (cita textual o reporte atribuido, igual que se hace con VIAL,
  BARAONA y RODRÍGUEZ en el resto de B.4).

### 5. La tabla de la conversión: la estructura sí está reestructurada, el contenido de algunas celdas no

La tabla en sí (comparar formal/material/legal en tres criterios) es
una reorganización real de la prosa lineal del anexo, no una
transcripción reordenada: eso no se toca. Pero revisando celda por
celda contra el anexo aparecen dos problemas distintos, ninguno
resuelto por la forma de tabla:

- **Dos celdas de "Cuándo opera" repiten casi palabra por palabra una
  cita que el anexo trae entre comillas de un autor no identificado**
  ("ha dicho la doctrina..."): la celda Formal ("forma más rigurosa...
  forma menos rigurosa") y la celda Legal ("la ley... prescindiendo de
  su voluntad"; "no tienen otra vía que el mutuo disenso").
- **Dos celdas de "Ejemplo" son ejemplos de la fuente, no propios**:
  la celda Material (la letra de cambio que vale como reconocimiento
  abstracto de deuda) es el ejemplo de Boetsch; la celda Formal (la
  promesa de compraventa nula por incompetencia del notario) es el
  ejemplo del propio anexo. Viola la regla de "todos los ejemplos
  deben ser propios", no solo la de paráfrasis.
- La celda Legal (art. 1701, arts. 1137/1138) es una lista de
  artículos, no prosa: no tiene problema de paráfrasis.

### 6. Inconsistencia de la fuente, señalada sin resolver

El propio anexo cita el **art. 1701** dos veces, en dos secciones
distintas: una vez dentro de su explicación de la conversión **formal**
("Lo anterior se desprende además del tenor del art. 1701..."), y otra
vez en su lista de ejemplos de conversión **legal** ("ii.-
Reconocimiento de valor... Señala aquí los artículos 1137..., 1701..."). 
Boetsch, por su parte, también llama "formal" al mecanismo del art.
1701 cuando lo presenta ("hay otra [conversión], llamada formal, que
obra sin más, automáticamente, en virtud de la disposición de la ley
[...] el instrumento defectuoso [...] vale como instrumento privado").
El manual, siguiendo la segunda mención del anexo, pone el art. 1701
en la columna "Legal" de la tabla. No es un error del manual: es una
inconsistencia que ya traía la fuente (mismo tipo de caso que la
discrepancia de G.4 en el tramo 4.5, o el "tres excepciones" de
Boetsch que en realidad lista cuatro, ya corregido). Se deja señalado
para que Laura decida si prefiere anotarlo o dejarlo como está.

### 7. Contenido de la fuente que falta en el manual (no es paráfrasis, es cobertura)

- **B.4.4.1**: Boetsch explicita que la regla de suspensión del art.
  1692 (a favor de herederos menores) **no puede extenderse por
  analogía** a otros incapaces que no sean menores de edad, "aunque
  sean incapaces por cualquier otro capítulo". El manual no lo dice.
- **B.4.4.3, síntesis**: Boetsch agrega que, además de la acción
  indemnizatoria de quien pide la nulidad, también es procedente **la
  petición reconvencional de perjuicios** de quien debe sufrirla,
  "dependiendo de la causal invocada y de las circunstancias en que se
  ha celebrado el contrato". El manual no lo menciona.
- **B.4.5, conversión legal**: el anexo trae dos límites que el manual
  no incluye: (a) no hay conversión si la ley exige una formalidad para
  la validez del acto con sanción expresa de nulidad; (b) no hay
  conversión si los propios interesados la prohíben. También recoge un
  debate doctrinal sobre si la conversión requiere siempre una norma
  legal expresa, o si es una institución de aplicación general. Ninguno
  de los dos está en el manual.
- Se revisó también si el inicio de B.4.2 en Boetsch (la nulidad
  aprovecha solo a la parte en cuyo favor se declaró, arts. 1690 y 3°
  inc. 2°) falta en el manual: **no falta**, ya está en B.1.7(iv)
  ("Solo aprovecha a quien la obtiene", con el art. 1690), a propósito
  no repetido en B.4 para no duplicar contenido.

### 8. Formato: B.4.4.3 debería ser una enumeración, no dos párrafos corridos

Boetsch presenta las ocho causales sin regla expresa de indemnización
(fuerza, error en cualidades accidentales, error sustancial/esencial,
incapacidad relativa, formalidades habilitantes, falta de objeto,
incapacidad absoluta, omisión de solemnidad) como una lista con letras
a)-h). El manual las convirtió en dos párrafos corridos (929 y 1.153
caracteres) separados solo por punto seguido. Es exactamente la regla
de `formato.md` sección 2 que ya se aplicó en el tramo 4.8-4.9 de VI.2
("Características"): una enumeración de posturas o categorías con
explicación de dos líneas o más no va en prosa corrida, va en bloques
`.enum-a` con cada letra aparte. Esto no es opcional ni una mejora:
corresponde arreglarlo en este mismo tramo, no diferirlo.

### 9. Artículos citados: verificación corregida

La primera verificación de este inventario tenía dos errores: buscó
"arts. 17 y 18" y "art. 102" en el **Código Civil**, cuando el manual
mismo los cita como **C.P.C.** (17 y 18) y **C. de Comercio** (102), y
dio por "verificados íntegros" más de 40 artículos habiendo leído solo
~250 caracteres de cada uno. Corregido:

- **Arts. 17 y 18 C.P.C.**: no hay copia local del Código de
  Procedimiento Civil en `Apuntes/`; se verificó por búsqueda web. Art.
  17: permite proponer en una misma demanda dos o más acciones
  incompatibles, resueltas una como subsidiaria de otra. Art. 18:
  permite que varias personas litiguen juntas cuando las acciones
  "emanen directa e inmediatamente de un mismo hecho". Ambos coinciden
  con lo que el manual les atribuye (interposición conjunta de la
  acción de nulidad y la reivindicatoria, la segunda condicional a la
  primera).
- **Art. 102 C. de Comercio**: verificado contra `Apuntes/CÓDIGO DE
  COMERCIO.pdf`: "La aceptación condicional será considerada como una
  propuesta." Coincide con lo que dice el manual (se la trata como
  nueva oferta).
- **Resto de los artículos (todos del Código Civil)**: se volvió a
  extraer el texto **completo** de los que tenían una afirmación
  puntual que verificar (no solo el inicio): arts. 1203, 1567 N° 8,
  1690, 1692 (los tres incisos) y 1893. Los cinco coinciden con lo que
  el manual afirma, incluida la excepción del art. 1893 sobre el
  comprador que enajenó por más de lo que pagó (ni Boetsch ni el
  manual la mencionan; no es un error introducido por el manual, la
  omite igual que la fuente). El resto de los artículos (1444, 1468,
  1545, 1554, 1685, 1687, 1688, 1689, 1691, 1701, 1814, 1895, 2314,
  2517, 2520, 2524, 682, 683, 717, 747, 889, 898, 900, 904-915, 974,
  1062, 1133, 1141, 1142, 1353, 1404, 1433, 1455, 1458, 1490, 1491,
  2044, 2480) se verificó contra el primer tramo de cada artículo en
  `Apuntes/Codigo Civil Chileno.pdf`, suficiente para las citas breves
  o de remisión que hace el manual de ellos. Ninguno arrojó un error de
  número o de contenido.

### 10. Jurisprudencia: reclasificada como paráfrasis cercana

La caja de B.4.5 (Corte Suprema, 3 de diciembre de 1921, conversión de
testamento solemne en verbal) se había dejado antes como "no requiere
acción", por tratarse de un hecho judicial y no de una posición
doctrinal. Al compararla de nuevo con el anexo, el texto del manual
sigue casi la misma oración que la descripción que hace Bozzo e
Ibarra del fallo (no una cita textual de la sentencia, sino el resumen
que ellos redactan), con el mismo orden de cláusulas y solo sinónimos
cambiados: corresponde tratarla igual que cualquier prosa de conexión
sin autor nombrado, es decir, **reestructurarla**, no solo porque
describe hechos sino porque copia de cerca la redacción de Bozzo e
Ibarra. Sobre el fallo mismo: una búsqueda web no encontró la
sentencia exacta ni logró confirmarla independientemente del anexo.
Sí aparece, en apuntes de sucesorio de otros autores, una conversión de
testamento abierto en verbal por fallecimiento repentino antes de
firmar, pero descrita con un supuesto de hecho distinto (peligro
inminente ya percibido, no una muerte imprevista como dice el anexo):
no es necesariamente el mismo caso, así que no sirve como confirmación
independiente. Se deja la caja (está desarrollada, cumple "rol o
desarrollado") pero sin presentarla como un hallazgo verificado más
allá de lo que ya respaldaba el anexo.

## Propuesta para B.4

Reescribir en voz propia todo lo marcado "Paráfrasis cercana" o
"Verbatim parcial" en la tabla de arriba, atribuir a Coviello el
párrafo que hoy no lo nombra, convertir B.4.4.3 a)-h) en enumeración
`.enum-a`, y agregar (si Laura aprueba) los tres contenidos que faltan
de la sección 7. Conservar intacto: BARAONA/VIAL/RODRÍGUEZ/Eduardo
Court ya atribuidos, la estructura de la tabla de conversión, el
`.definicion` del art. 889, los ejemplos propios ya existentes, las
cajas `.ley`, la caja de jurisprudencia (reescrita, no eliminada).

Decisiones que le corresponden a Laura:

1. **Las dos celdas de "Ejemplo" de la tabla** (letra de cambio;
   promesa ante notario): (a) reemplazarlas por ejemplos propios de
   conversión material y formal (exige inventar dos casos chilenos
   plausibles), o (b) dejarlas presentadas explícitamente como "los
   ejemplos clásicos de..." sin pretender que sean hallazgos propios,
   mismo criterio que se usó con "la estrella con la mano" en el
   capítulo I.
2. **La inconsistencia del art. 1701** (formal según Boetsch, legal
   según la segunda mención del anexo y la tabla del manual): dejarla
   como está (ya es defendible, el anexo mismo lo clasifica ahí) o
   agregar una nota señalándola, igual que se hizo con G.4.
3. **Los tres contenidos que faltan** (sección 7): si se agregan o se
   deja el manual como está, más breve que Boetsch en esos puntos
   (igual criterio que otros tramos: el largo sigue a la fuente salvo
   que Laura pida ampliar).

Verificación mecánica ya hecha para este informe: balance de etiquetas,
cero guiones largos y guillemets, ningún párrafo sobre 1.200 caracteres
(el más largo, 1.153, dentro del límite), sin cajas `.dato-grado`.
Falta repetirla después de la reescritura.

## Qué se hizo en B.4 (Los efectos de la nulidad)

Laura aprobó B.3 el 2026-10-05 y dio las tres decisiones pendientes de
B.4: ejemplos propios para las dos celdas de la tabla de conversión; el
art. 1701 sigue la clasificación de Boetsch, no la del anexo; y se
agregan los tres contenidos que faltaban.

Se reescribió en voz propia todo lo marcado "Paráfrasis cercana" o
"Verbatim parcial" en la tabla del inventario, conservando intacto lo
atribuido a BARAONA/VIAL/RODRÍGUEZ/Eduardo Court, el `.definicion` del
art. 889, los ejemplos propios ya existentes (Felipe y la Coty; doña
Marta, don Waldo y la señora Pilar) y las cajas `.ley`.

- **Atribución a COVIELLO**: agregada en el párrafo sobre el simple
  error de nombre del contrato.
- **B.4.4.3 a)-h)**: las ocho causales de la acción de indemnización
  (fuerza, error, incapacidad, formalidades, objeto, solemnidad) se
  convirtieron de dos párrafos corridos a una enumeración `enum-a`,
  siguiendo la misma letra que usa Boetsch.
- **Contenido agregado** (los tres que faltaban): que la suspensión del
  art. 1692 no se extiende por analogía a otros incapaces que no sean
  menores; que además de la acción de indemnización, quien debe
  soportar la nulidad puede reconvenir pidiendo perjuicios; y los dos
  límites de la conversión en general, más el debate doctrinal sobre si
  la conversión material necesita una norma legal expresa.
- **Art. 1701 reclasificado**: salió de la columna "Legal" de la tabla
  (donde lo ponía el anexo) y pasó a la columna "Formal" junto al
  ejemplo propio de la promesa, siguiendo el criterio de Boetsch, que
  lo llama "formal" por operar automáticamente por disposición de la
  ley. Esto dejó la celda "Legal" solo con la donación irrevocable
  entre cónyuges (arts. 1137 y 1138).
- **Ejemplos propios**: la promesa de compraventa nula por
  incompetencia del notario (antes del anexo) se reemplazó por un
  ejemplo propio (don Hugo y la Sofía); la letra de cambio (antes de
  Boetsch) se mantuvo como instrumento, pero con personajes propios
  (Nacho y la Camila), mismo criterio que doña Marta y el Banco Estado
  en el tramo 4.1: mismo mecanismo legal, no el ejemplo de la fuente
  con los nombres cambiados.
- **Los dos límites de la conversión**: en una primera redacción se
  habían atribuido ambos a la conversión legal, lo que contradecía la
  propia tabla (la legal es imperativa, no depende de la voluntad de
  las partes). Corregido: el límite de que las partes la prohíban es
  de la conversión material, que sí descansa en la voluntad hipotética;
  el límite de la formalidad con sanción de nulidad es el que ya
  explica el art. 1701 (no hay instrumento privado que valga si la ley
  exigía el instrumento público como solemnidad). El párrafo se movió
  justo después del recuadro "No olvidar", porque ahora depende de los
  dos requisitos que ahí se explican.
- **Jurisprudencia**: la caja de 1921 se reescribió en voz propia
  (estaba muy cerca de la redacción del anexo, no de una cita textual
  de la sentencia). La frase "menos solemne o privilegiado" se dejó
  igual que el anexo, en vez de "el menos solemne de los privilegiados"
  (frase inventada en la primera redacción). No se encontró el fallo de
  forma independiente por búsqueda web: queda sin confirmación propia,
  igual que se dejó constancia en el inventario.
- **Dos correcciones de precisión** encontradas al verificar de nuevo:
  se agregó la cita del art. 1692 inciso final (el que fija el tope de
  diez años) junto a la del art. 2520 inc. 2° que ya estaba, porque
  Boetsch cita ambos; y se corrigió un sujeto ambiguo en B.4.3 ("el
  verdadero dueño también puede pedir...", antes sin sujeto explícito).

Verificación mecánica: balance de etiquetas OK en todo el archivo (`p`
764/764, `span` 1953/1953, `div` 67/67, `strong` 582/582, `em`
277/277, `table`/`tr`/`th`/`td` OK, `h2` 133/133, `h3` 135/135), cero
guiones largos y guillemets, ningún párrafo sobre 1.200 caracteres (el
más largo, 1.092), los 45 artículos de B.4 verificados de nuevo
presentes después de la reescritura, diff línea por línea de lo
eliminado revisado (coincide con lo descrito en este informe),
capturas de Chrome headless revisadas bloque por bloque, incluida una
segunda pasada después de corregir los cinco problemas que encontró el
advisor (contradicción de los dos límites, celda de tabla redundante,
afirmaciones sin fuente, error de sujeto, negritas perdidas). No se
tocó el índice: no se agregó ni cambió ningún `h2`/`h3`.

**Nota de formato, sin resolver**: las enumeraciones `(i)-(iv)` de
B.4.2-B.4.4 siguen con el marcado antiguo en línea (`<span
class="enum-i">(i) Título.</span>`), mientras que B.3 ya usa el
formato de dos niveles (`span.num`/`span.tit`) que exige `formato.md`
2. No se tocó en este tramo porque no es parte del chequeo de
paráfrasis ni de los problemas de cobertura o formato que sí estaban
en alcance; se deja anotado para una pasada de formato aparte si Laura
la pide.

Con esto, el bloque completo B (B.1 a B.4) ya pasó por el chequeo de
paráfrasis cercana con el método corregido. Falta solo la aprobación
final de Laura sobre B.3 y B.4 en vista previa.

## Siguiente paso

Laura revisa B.3 y B.4 en `AJ_vista_previa_B3.html` y
`AJ_vista_previa.html` (se actualiza con el manual completo). Con su
aprobación de ambos: commit, push, y seguir con el chequeo de
paráfrasis cercana de C (La lesión), D (Simulación), E
(Inoponibilidad), F (Fraude a la ley) y G (Otras causales), en ese
orden, avisando a Laura antes de cada uno.
