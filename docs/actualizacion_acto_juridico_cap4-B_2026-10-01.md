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

## Siguiente paso

Esperando que Laura decida B.1.2 y apruebe el plan antes de reescribir
B.1.
