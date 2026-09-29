# Actualización de Acto Jurídico: tramo 2, IV.B.1 a B.3 (Nulidad)

> Informe de cambios propuestos (paso c de
> `docs/manuales/actualizar-manuales-existentes.md`). **No se tocó el
> HTML del tramo.** Pendiente de la aprobación de Laura. Fecha: 2026-09-29.

## 0. Alcance y fuentes

- **Tramo:** IV.B Nulidad, en sus partes B.1 Aspectos generales (puntos 1
  a 9), B.2 La nulidad absoluta (1 a 7) y B.3 La nulidad relativa (1 a 6).
  B.4 Los efectos de la nulidad queda para el tramo 3, porque junto con
  esto el tramo sería demasiado largo (regla de oro 1 de `proceso.md`).
- **Apunte principal:** `Acto Jurídico_principal_10_INEFICACIA AJ_NULIDAD (ABSOLUTA Y RELATIVA)_BOETSCH`,
  pp. 124 a 138 (hasta el inicio de B.4).
- **Anexos** (ninguno es grande):
  - Bozzo e Ibarra, pp. 9 a 13 (clasificación, nulidad total y parcial,
    consecuencial y refleja, características, confirmación, quién no
    puede pedir la nulidad). Sus pp. 13 a 16 (conversión) van al tramo 3.
  - Cuadro comparativo de ineficacia: filas de nulidad absoluta y
    relativa (solo su concepto; sus efectos van al tramo 3).
  - Memorice: definiciones de nulidad, nulidad absoluta, nulidad
    relativa y ratificación tácita (todas de Boetsch).
  - Causa: nada para este tramo.
- **Preguntas clásicas:** sin banco de Acto Jurídico; la fuente no marca
  ninguna pregunta de examen en este tramo.
- **Razón de caracteres actual:** manual 19.632 / fuente 31.869 = **62%**.
- **Estructura:** la de Boetsch coincide con la del manual (B.1, B.2, B.3),
  salvo el punto 9 "La nulidad refleja", que viene de Bozzo e Ibarra.

## 1. Inventario de Boetsch, cruzado con el manual

Solo se listan en detalle las unidades con algo pendiente; las demás
(**Está**) se resumen por punto.

### B.1 Aspectos generales

| Punto | Unidades que están | Pendiente |
|---|---|---|
| 1. Reglas del Código | Título XX del Libro IV; se aplican a todo acto; orden público; demás ramas del derecho privado, no el público | Nada |
| 2. Concepto | Definición y art. 1681 inc. 1° | La definición es una cita textual y el manual la parafrasea: va a bloque `.definicion` |
| 3. Especies | Art. 1681 inc. 2°; definiciones de absoluta y relativa; por qué una es "absoluta" y la otra "relativa" | Las dos definiciones van a `.definicion` |
| 4. Terminología | Los tres argumentos (a, b, c) y la conclusión | **Parcial:** falta que el Código usa "otras expresiones delatoras" según el caso. El párrafo tiene 1.494 caracteres: se parte en la enumeración (i) a (iii) |
| 5. Regla general | La relativa es la regla general | Nada |
| 6. Diferencias | Las cuatro diferencias | **Formato:** es un paralelo entre dos instituciones con cuatro criterios, así que va en **cuadro comparativo** (ver 3.4) |
| 7. Principios | Los seis principios y la discrepancia doctrinal | **Parcial:** del principio (vi) faltan "sentencia basada en autoridad de cosa juzgada" y que la declaración supone una sentencia que acoja la acción o excepción en el juicio donde se discute la validez |
| 8. Total y parcial | Total y parcial; criterio de importancia; art. 1061 | Boetsch habla del "vicio de nulidad **absoluta**"; el manual dice "el vicio" en general. Bozzo e Ibarra lo trata en general, así que se deja general, mencionando ambas fuentes |

### B.2 La nulidad absoluta

| Punto | Unidades que están | Pendiente |
|---|---|---|
| 1. Concepto | Sí | A `.definicion` |
| 2. Causales | Las 4 del art. 1682 y las 5 adicionales para quienes niegan la inexistencia | Hoy es un párrafo corrido; se pasa a enumeración, en dos grupos |
| 3. Fundamento | Interés de la moral y de la ley | **Parcial:** entre los caracteres que derivan del fundamento falta el saneamiento por el **transcurso del tiempo** |
| 4. Declaración | Las tres vías; "de manifiesto"; el interés; sabiendo o debiendo saber; art. 1468; representante; herederos; ministerio público y art. 350 COT | **Parcial:** (a) falta la razón de por qué cualquiera con interés puede pedirla: el vicio está en el acto mismo, sin consideración a las personas; (b) **el manual dice "interés, generalmente pecuniario", pero Boetsch dice que "es de carácter pecuniario"**, y falta el contraste con el interés puramente moral del ministerio público; (c) falta que la jurisprudencia sobre el representado "ha sido contradictoria" y que la regla cubre al representado "convencional o legalmente". El párrafo tiene 1.772 caracteres: se parte |
| 5. No se sanea por ratificación | Sí | Nada |
| 6. Saneamiento por el tiempo | Diez años; cómputo (art. 2514); **BARAONA** y la caducidad; art. 705 | **Parcial:** faltan "de acuerdo a la doctrina mayoritaria" y que el plazo pone término al derecho de alegar la nulidad "sea como acción o excepción" |
| 7. No opera de pleno derecho | Doctrina tradicional y **BARAONA** | Nada |

**Inexactitud frente al Código:** el manual dice, en B.1.6, que el
ministerio público puede pedir la nulidad absoluta "en el solo interés de
la moral y la ley". Boetsch lo dice así, pero el art. 1683 dice "en el
interés de la moral **o** de la ley" (sin "solo"); el "solo interés de la
ley" es del art. 1684, para negarlo en la relativa. Propuesta: usar el
texto del Código, verificado.

### B.3 La nulidad relativa

| Punto | Unidades que están | Pendiente |
|---|---|---|
| 1. Definición y fundamento | Sí | A `.definicion` |
| 2. Causales | Los 8 casos | **Falta:** "Rescisión equivale a anulación" (así lo dice Boetsch aquí; conviene conectarlo con el debate de B.1.4). Dos términos del manual que no están en la fuente: "formalidades **habilitantes**" y "calidad accidental **elevada a la categoría de esencial**"; se propone volver a la redacción de la fuente. Hoy es un párrafo corrido: pasa a enumeración |
| 3. Características | Sí | Pasa a enumeración |
| 4. Legitimados | Art. 1684; quién sufrió el vicio; herederos; cesionarios; art. 1685 | Son dos subpuntos en la fuente (4.1 y 4.2), hoy son párrafos con título en negrita: pasan a subpuntos `4.1.` y `4.2.` (escalera). El ejemplo de la partida de nacimiento falsificada es de la fuente: se reemplaza (3.6) |
| 5. Saneamiento por el tiempo | Cuatro años y cómputo (art. 1691); el acto queda sano | **Falta:** los **herederos**: si son mayores de edad, el plazo no se suspende; si son menores, sí (art. 1692). Verificado en el Código: además, los menores no pueden pedirla pasados diez años desde la celebración |
| 6. Ratificación | Concepto, clases, características y requisitos | **Parcial:** falta la **primera acepción** de "ratificación" (asumir los actos que otro ejecutó a nuestro nombre sin poder) y la cita del art. 1693 (expresa o tácita). Los cuatro bloques (6.1 a 6.4) pasan a subpuntos |

## 2. Anexos: qué ya está, qué agrega, qué contradice

### Bozzo e Ibarra, pp. 9 a 13

| # | Unidad | Clasificación |
|---|---|---|
| Y01 | La distinción entre absoluta y relativa no mide la intensidad de la ineficacia: la absoluta no es "el summun de la negación" ni la relativa un acto "nulo a medias"; ambas producen los mismos efectos una vez declaradas, y se diferencian en causales, titulares y tiempo de saneamiento | **Agrega** (B.1.3 o como cierre del cuadro de B.1.6) |
| Y02 | Ejemplos de nulidad parcial: cláusulas de una compraventa (bien, precio, plazo) o de un testamento (cuarta de mejoras, libre disposición) | Ejemplos de la fuente: **se reemplazan** por uno propio (3.6) |
| Y03 | Casos legales de nulidad parcial: arts. 1057 y 1058 (el error en una disposición testamentaria solo afecta esa cláusula) | **Agrega**. Verificado en el Código |
| Y04 | Criterio: si la cláusula nula contiene la estipulación principal, o el acto no puede subsistir sin ella, la nulidad alcanza a todo el acto: nulidad consecuencial o de resultado | Ya está (punto 9) |
| Y05 | Actos accesorios: arts. 1536 (cláusula penal) y 2381 N° 3 (fianza) | Ya está. Verificados en el Código |
| Y06 | Nulidad refleja en actos solemnes; **nunca confundir la forma (la escritura) con el contenido (el acto)** | Parcial: falta la distinción forma/contenido |
| Y07 | Varios actos independientes en un mismo instrumento (compraventa y mutuo) | Ya está; es ejemplo de la fuente, **se reemplaza** (3.6) |
| Y08 | La nulidad solo puede establecerla la ley, nunca la voluntad de las partes; el art. 1469 les impide dar valor a actos nulos por su sola voluntad | **Agrega** el primer matiz |
| Y09 | Principio de que "no hay nulidad por causa sobreviniente": un acto válido en su origen no se vuelve nulo después | **Agrega** el nombre del principio a B.1.7 (iii) |
| Y10 | Definición de **confirmación**: acto por el cual quien tiene derecho a pedir la nulidad declara su voluntad de no usarlo, haciendo desaparecer los vicios | **Agrega** (`.definicion` en B.3.6) |
| Y11 | El Código dice "ratificación" (arts. 1683, 1684, 1693 y siguientes), pero se critica: la doctrina reserva "ratificación" para aprobar lo que otro hizo a nuestro nombre sin poder (art. 2160) y usa "confirmación" para sanear la nulidad | **Agrega**; se une con la primera acepción de Boetsch (B.3.6) |
| Y12 | Art. 1694: la confirmación **expresa** de un acto solemne es solemne, pero un acto solemne **puede confirmarse tácitamente** | **Agrega** el segundo matiz |
| Y13 | La confirmación consolida la situación anterior a la declaración e impide que el acto se vea afectado en el futuro | **Agrega** |
| Y14 | Principio *nemo auditur propriam turpitudinem allegans* ("nadie puede ser oído cuando alega su propia torpeza") | **Agrega** a B.2.4 |
| Y15 | Según la jurisprudencia, "debiendo saber" alude a la obligación de conocer el vicio, deducible de otros preceptos legales o de situaciones de hecho; el conocimiento es real y efectivo, no el presunto del art. 8°, porque si no nadie podría pedir la nulidad | **Agrega** (complementa a Boetsch) |
| Y16 | Fallo de la Corte de Pedro Aguirre Cerda, enero de 1988 (Repertorio, t. VI, p. 234), cita textual sobre el art. 8° | Sin rol. Por la regla nueva, **no va en recuadro**; se propone integrar su razonamiento al texto (Y15) sin la cita. Laura decide |
| Y17 | Así, la ley admite aquí el error de derecho, no para incumplir las normas sino para restablecer su imperio declarando la nulidad | **Agrega** |
| Y18 | Corte Suprema, 29 de abril de 2008, rol 1.969-2006 (actos propios) | Ya está en recuadro, pero **parafraseado**: la fuente trae la cita textual; se propone transcribirla (acortada, sin alterar) |
| (fuera del tramo) | Conversión (pp. 13 a 16), al tramo 3. Ineficacia en sentido estricto (p. 17): precisa que la suspensión y la inoponibilidad son causas **coetáneas**; se ajusta en la introducción del capítulo IV al pasar por ahí | |

### Cuadro comparativo y Memorice

- Conceptos de nulidad absoluta y relativa: ya están (son los de Boetsch).
- Definiciones de Memorice (nulidad, absoluta, relativa, ratificación
  tácita): ya están; sirven para los bloques `.definicion`.

## 3. Cambios propuestos

### 3.1 Recuadros

| Dónde | Recuadro | Contenido propuesto | Respaldo |
|---|---|---|---|
| B.1.6 | **Cuadro comparativo** | Paralelo entre nulidad absoluta y relativa: declaración de oficio, titulares (y ministerio público), saneamiento por el tiempo, saneamiento por ratificación, fundamento; debajo, que los **efectos** son idénticos (Y01) | Boetsch B.1.6, B.2.3, B.3.1; Y01 |
| B.1.8 | **Ejemplo** (original) | Ver 3.6 | art. 1061 |
| B.1.9 | **No confundir** | Nulidad refleja frente a varios actos en un mismo instrumento. Criterio: si el vicio está en la forma de un acto solemne (arrastra al acto) o en uno de varios actos independientes (no arrastra a los demás) | Y06, Y07 |
| B.2.4 | **Cuadro comparativo** | ¿Pueden alegar la nulidad absoluta el **representado** y los **herederos** de quien celebró el acto sabiendo el vicio? Columnas "Sí" y "No", con los argumentos de cada postura; debajo, cuál prevalece (el representado sí puede, según Boetsch y Bozzo e Ibarra; sobre los herederos, la fuente no da una postura dominante) | Boetsch B.2.4; Y15 |
| B.3.4 | **Advertencia** | Error típico: creer que cualquier engaño del incapaz le impide pedir la nulidad. La simple aserción de ser mayor de edad no lo inhabilita (art. 1685, segunda parte); solo el dolo | art. 1685, verificado |
| B.3.4 | **Ejemplo** (original) | Ver 3.6 | art. 1685 |
| B.3.5 | **No olvidar** | Plazos: absoluta, 10 años desde la celebración; relativa, 4 años (desde la celebración si hay error o dolo; desde que cesa la fuerza o la incapacidad); herederos menores: el cuadrienio corre desde su mayoría de edad, con tope de 10 años desde la celebración | arts. 1683, 1691, 1692, verificados |
| B.3.6 | **No confundir** | Ratificación de un acto nulo (confirmación) frente a ratificación de lo que otro hizo a nuestro nombre sin poder. Criterio: si sanea un vicio propio del acto o hace propio un acto ajeno | Boetsch B.3.6; Y11 |
| B.1.9 | **Conexiones** | Obligaciones (cláusula penal, art. 1536): `[FALTA: sección]`; Contratos (fianza, art. 2381 N° 3): `[FALTA: sección]` | Y05 |
| B.1.8 | **Conexiones** | Sucesorio (arts. 1057, 1058 y 1061): `[FALTA: sección]` | Y03 |
| B.2.6 | **Conexiones** | Bienes (art. 705, validación del título y prescripción adquisitiva): "Revisar apunte de Bienes, V.5.A La posesión, A.2 Clases de posesión (p. __)" | Boetsch B.2.6 |
| B.2.4 | **Conexiones** | Derecho Procesal (art. 350 COT, ministerio público judicial): `[FALTA: sección]` | Boetsch B.2.4 |

- **Dato de grado:** ninguno en este tramo.
- **Jurisprudencia:** se mantiene el recuadro de la Corte Suprema de 2008
  (tiene rol), con la cita textual de la fuente. El fallo de 1988, sin rol,
  no va en recuadro (Y16).
- **Máximo de dos recuadros pedagógicos por punto:** B.3.4 tendría
  Advertencia y Ejemplo (2); B.1.9 y B.3.6, un No confundir cada uno.
  Cumple.

### 3.2 Unidades que se agregarían

De Boetsch: B.1.4 (expresiones delatoras), B.1.7 (vi) completo, B.2.3
(transcurso del tiempo), B.2.4 (razón de la legitimación, interés
pecuniario corregido, jurisprudencia contradictoria, representación
convencional o legal), B.2.6 (doctrina mayoritaria; acción o excepción),
B.3.2 ("rescisión equivale a anulación"), **B.3.5 (herederos, art.
1692)**, B.3.6 (primera acepción de ratificación; art. 1693).
De Bozzo e Ibarra: Y01, Y03, Y06 (forma y contenido), Y08, Y09, Y10, Y11,
Y12, Y13, Y14, Y15, Y17; y Y18 textual.

### 3.3 Preguntas clásicas

Ninguna: no hay banco de Acto Jurídico y la fuente no marca preguntas de
examen en este tramo.

### 3.4 Cuadros comparativos

- **Existentes:** el tramo no tiene ninguno.
- **Nuevos:** los dos de 3.1. El de B.1.6 cumple la regla de paralelos
  ("diferencias entre..." con más de tres criterios). El de B.2.4 cumple
  la de discusiones doctrinales (dos posturas que responden la misma
  pregunta).

### 3.5 Voz propia (antes y después)

**1. B.1.1 Reglas del Código**
- *Fuente:* "Sus normas se aplican a cualquier acto jurídico, sea
  unilateral o bilateral, a menos que haya una disposición expresa que
  consulte otra sanción que la general ahí contemplada. Las normas sobre
  nulidad son de orden público; en consecuencia, de aplicación estricta e
  inderogable por las partes."
- *Manual hoy:* "Sus normas se aplican a cualquier acto jurídico,
  unilateral o bilateral, salvo que una disposición expresa consulte otra
  sanción. Son de orden público, de aplicación estricta e inderogables por
  las partes [...]". (Misma construcción.)
- *Propuesta:* "Las reglas generales están en el Título XX del Libro IV
  (arts. 1681 a 1697). Tienen tres rasgos:" seguido de (i) **alcance
  general**: rigen para todo acto, unilateral o bilateral, salvo norma
  expresa que consulte otra sanción; (ii) **orden público**: son de
  aplicación estricta y las partes no pueden derogarlas; (iii) **derecho
  privado**: se aplican a sus demás ramas a falta de norma especial, pero
  no al derecho público, que tiene reglas propias en cada rama.

**2. B.2.3 Fundamento**
- *Fuente:* "La nulidad absoluta se encuentra establecida en interés de la
  moral y de la ley: para proteger la primera y obtener la observancia de
  la segunda; no se dirige a cautelar el interés de determinadas personas."
- *Manual hoy:* "Se establece en interés de la moral y de la ley, para
  proteger la primera y obtener la observancia de la segunda, no en el de
  determinadas personas." (Misma oración.)
- *Propuesta:* "¿A quién protege la nulidad absoluta? No a una persona en
  particular, sino a la moral, que resguarda, y a la ley, cuyo
  cumplimiento asegura. De ese fundamento se siguen todos sus caracteres:"
  y la enumeración (declaración de oficio, titulares amplios, no
  ratificación, saneamiento solo por el tiempo).

**3. B.3.1 Definición y fundamento**
- *Fuente:* "La nulidad relativa no se encuentra establecida en el
  interés de la moral y de la ley, no protege los superiores intereses de
  la colectividad, sino los de ciertas y determinadas personas en cuyo
  beneficio el legislador la establece."
- *Manual hoy:* "No protege el interés de la moral y la ley, sino el de
  ciertas y determinadas personas en cuyo beneficio el legislador la
  establece."
- *Propuesta:* definición en `.definicion`, y luego: "Es la contracara de
  la absoluta: no mira a la colectividad, sino a personas determinadas, y
  por eso solo ellas pueden invocarla o renunciarla."

**4. B.1.4 Terminología** (1.494 caracteres en un solo párrafo, con
"Primero... Segundo... Tercero..."): se reescribe como introducción más
enumeración `(i)` a `(iii)`, estilo lista, y conclusión aparte.

### 3.6 Ejemplos de la fuente y ejemplos propios

- **Nulidad parcial** (Y02: compraventa y testamento por cláusulas):
  ejemplo propio en recuadro en B.1.8: *En su testamento, la tía Valeria
  deja su departamento en Ñuñoa a sus sobrinos y, en otra cláusula, su
  colección de Condorito autografiada al notario que autoriza el
  testamento. La cláusula del notario no vale (art. 1061), pero los
  sobrinos heredan igual el departamento: la nulidad es parcial.*
- **Varios actos en un mismo instrumento** (Y07: compraventa y mutuo):
  ejemplo propio breve en el texto de B.1.9: *Así, si en una misma
  escritura Diego le vende su auto a Sebastián y, además, le presta plata
  para la bencina del primer viaje al sur, la nulidad de la compraventa no
  arrastra al préstamo.*
- **Incapaz que se hace pasar por capaz** (B.3.4: falsificar una partida
  de nacimiento): ejemplo propio en recuadro: *Matías, de 16 años, quiere
  comprarle a Pancho su guitarra eléctrica. Si solo le dice "tengo 18",
  después igual podrá pedir la nulidad: Pancho debió cerciorarse (art.
  1685, segunda parte). Si en cambio le muestra una cédula adulterada, ni
  Matías ni sus herederos podrán alegarla (art. 1685, primera parte).*
- **Art. 1061** (escribano): no es un ejemplo ficticio sino un caso legal;
  se mantiene en el texto.
- **Pedir plazo para pagar** (B.3.6): es la ilustración de una regla
  doctrinal; se mantiene en el texto.

### 3.7 Artículos en bloque `.ley` (verificados contra el Código)

Arts. **1684**, **1685** y **1691** completos. Los arts. 1681, 1682 y 1683
ya están transcritos en IV.A: se remite a ellos en vez de repetirlos. Los
arts. 1468, 1469, 1536, 1693, 1694, 1695, 1696, 1697, 2381 N° 3 y 705 se
citan entre comillas en el texto, también verificados.

### 3.8 Escalera y formato

- B.2.4 usa `a.`, `b.`, `c.` (formato antiguo): bajo un punto `1.` sin
  subpuntos, el primer nivel es `(i)`. Se propone `(i)`, `(ii)`, `(iii)`.
- B.3.4 y B.3.6 tienen subpartes con título en negrita (Regla general,
  Situación excepcional; Concepto, Clases, Características, Requisitos),
  que en la fuente son `4.1.`, `4.2.` y `6.1.` a `6.4.`: se proponen como
  subpuntos `h3`.
- B.1.6 y B.1.7 usan `(i)` sin las marcas `.num`/`.tit` (formato antiguo):
  B.1.6 pasa a cuadro; B.1.7 a `(i)` estilo lista.
- Título de B.1.9: el punto trata la nulidad consecuencial, la de actos
  accesorios y la refleja. Se propone "Nulidad consecuencial y nulidad
  refleja".
- Párrafos sobre 1.200 caracteres: B.1.4 (1.494) y B.2.4 (1.772); se
  parten.
- El encabezado "B." no lleva `style="text-decoration:none"`; se corrige.

## 4. Pendientes para Laura

1. Aprobar, corregir o descartar los cambios de la sección 3.
2. Fallo de la Corte de Pedro Aguirre Cerda de 1988 (Y16): ¿se integra
   solo su razonamiento al texto (propuesta) o se omite?
3. ¿Se cambia el título de B.1.9 a "Nulidad consecuencial y nulidad
   refleja"?
4. Términos "formalidades habilitantes" y "calidad accidental elevada a
   la categoría de esencial" (B.3.2): ¿se vuelve a la redacción de la
   fuente o se conservan?
