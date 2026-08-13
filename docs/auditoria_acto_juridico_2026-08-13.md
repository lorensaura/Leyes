# Auditoría de `04_Acto_Juridico_Manual.html` contra sus fuentes

> Reporte de brechas, no reescritura. El manual de Acto Jurídico (21 ejes
> A-U, terminado 2026-08-12) se compara eje por eje contra los 17 PDF
> fuente ya fragmentados por tema (libro de Boetsch) más las fuentes
> secundarias (Causa Domínguez/Boetsch, el resumen de Bozzo e Ibarra,
> el cuadro comparativo de ineficacia y el glosario de Memorice). **No se
> agrega jurisprudencia ni doctrina nueva de conocimiento general**: solo
> se señala lo que la fuente de Laura ya trae y el manual omitió, o lo que
> el manual afirma sin respaldo en ninguna fuente. Nada de este reporte
> es definitivo hasta que Laura lo revise; la corrección del HTML es una
> fase 2 posterior, fuera de este documento.
>
> Categorías por eje: (1) profundidad insuficiente, (2) falta de ejemplos,
> (3) jurisprudencia en la fuente ausente en el manual, (4) dato de grado
> marcado en la fuente y ausente en el manual, (5) debate doctrinal
> aplanado, (6) coherencia estructural, (7) contenido del manual sin
> respaldo en fuente. Cada hallazgo lleva prioridad **alto/medio/bajo**.
> Si una categoría no tiene hallazgos, se deja "Sin hallazgos." explícito.

---

## Tanda 1 — Eje A. Teoría general del acto jurídico (fuente: PDF 1, 19p)

### 1. Profundidad insuficiente
Sin hallazgos. Los 8 puntos del eje (introducción, teoría en el CC chileno,
hechos jurídicos, concepto de AJ, autonomía de la voluntad, estructura y
elementos, requisitos/condiciones, clasificaciones con sus 13 subtipos)
están desarrollados con el mismo nivel de detalle que la fuente, sin
resúmenes de más.

### 2. Falta de ejemplos
Sin hallazgos. Los ejemplos del PDF fuente (hechos jurídicos naturales,
comuneros/centro de intereses, precio en dinero de la compraventa, legado
con modo) están todos recogidos, varios elevados a recuadro `.ejemplo`
donde el formato lo pide.

### 3. Jurisprudencia en la fuente, ausente en el manual
Sin hallazgos. El PDF 1 no cita ningún fallo (solo doctrina: VIAL,
ALESSANDRI, BELLO); el manual tampoco trae jurisprudencia en este eje, lo
cual es consistente con la fuente, no un vacío.

### 4. Dato de grado marcado en la fuente, ausente en el manual
Sin hallazgos. El único punto de tensión real de la fuente (¿existe la
inexistencia como sanción distinta de la nulidad?, sección 7) está
recogido en un recuadro `.dato-grado` propio en `sA7`.

### 5. Debate doctrinal aplanado
Sin hallazgos. Las dos doctrinas de la sección 7 (existencia/validez vs.
solo eficacia) están ambas desarrolladas en extenso (`sA7-1` y `sA7-2`),
sin privilegiar una por sobre la otra.

### 6. Coherencia estructural
Sin hallazgos. Numeración A/1/1.1/a)/(i) aplicada correctamente, orden
idéntico al de la fuente, sin saltos. Los 13 subtipos de la sección 8
(`8.1` a `8.13`) están todos presentes en el mismo orden del PDF.

### 7. Contenido del manual sin respaldo en fuente
Sin hallazgos. Toda afirmación revisada traza a un pasaje literal del PDF
1. El recuadro `.dato-grado` de `sA7` es una reformulación en formato
pregunta/respuesta de contenido que ya está en el cuerpo del texto (ambas
doctrinas), no una adición nueva.

### Resumen de la tanda
Eje A de alta fidelidad a la fuente: transcripción completa, sin
compresión de contenido, con recuadros adecuados (3 `.ejemplo`, 1
`.dato-grado`, 2 `.callout`). No requiere intervención en fase 2 más allá
de la revisión general de Laura.

---

## Tanda 2 — Eje B, secciones 1-3. La voluntad (fuente: PDF 2, 19p)

### 1. Profundidad insuficiente
- **[medio]** `sB3-2-a` (La oferta / la aceptación): la fuente distingue
  explícitamente **aceptación expresa** y **aceptación tácita** como
  subclases (con el ejemplo del taxi, ver categoría 2) antes de pasar a
  los requisitos de la aceptación; el manual omite esa distinción y va
  directo a "pura y simple / tiempo oportuno / vigente".
- **[medio]** `sB3-2-a`: falta la regla de carga de la prueba de la
  aceptación: *"la aceptación no se presume, correspondiendo, en caso de
  controversia sobre su existencia, probarla a quien quiera prevalecerse
  de ella. Pero una vez probada la aceptación, se presume que esta se ha
  dado dentro de plazo, a menos que se acredite lo contrario"* (fuente,
  p.40). No está ni en el texto corrido ni en ningún recuadro.
- **[medio]** `sB3-3-iv` (contratos electrónicos): falta la obligación
  del proveedor, una vez perfeccionado el contrato, de enviar
  confirmación escrita íntegra, clara y legible del mismo (Ley del
  Consumidor, según la fuente).
- **[bajo]** `sB3-2-a` ("a vuelta de correo"): la fuente cita la
  definición de la RAE (*"por correo inmediato, sin perder día"*); el
  manual solo remite a la apreciación judicial del término.
- **[bajo]** `sB3-3-iii` (autocontratación): la fuente da dos ejemplos
  del mandato, art. 2144 (comprar/vender lo que el mandante ordenó) y
  art. 2145 (prestarse a sí mismo el dinero que debía colocar a interés);
  el manual solo recoge el art. 2144.

### 2. Falta de ejemplos
- **[medio]** `sB3-2-a`/`b`: falta el ejemplo clásico de aceptación
  tácita de la fuente: quien abre la puerta de un taxi estacionado y
  sube, sin decir palabra, acepta inequívocamente la oferta de
  transporte.

### 3. Jurisprudencia en la fuente, ausente en el manual
Sin hallazgos. La fuente no cita ningún fallo con rol/tribunal/fecha en
este tramo, solo una mención genérica a que "la Corte Suprema ha
declarado" sobre la apreciación de "a vuelta de correo", ya reflejada en
el manual sin perder nada sustantivo (más allá de la definición de la
RAE, ya señalada en 1).

### 4. Dato de grado marcado en la fuente, ausente en el manual
- **[medio]** La regla de carga de la prueba de la aceptación (mismo
  punto de la categoría 1) es precisamente el tipo de precisión procesal
  que suele preguntarse en examen oral, y no está destacada de ninguna
  forma.

### 5. Debate doctrinal aplanado
Sin hallazgos. La discusión doctrina tradicional/moderna sobre
responsabilidad precontractual (con FAGUELLA, SALEIYES y ROSENDE) y las
cuatro teorías sobre el momento del consentimiento están completas, sin
privilegiar ninguna indebidamente.

### 6. Coherencia estructural
Sin hallazgos. Numeración y jerarquía correctas (1/2/3, 3.1/3.2/3.3,
a)/b)/c) para las subdivisiones de 3.2, (i)-(iv) para 3.3), fiel al orden
de la fuente.

### 7. Contenido del manual sin respaldo en fuente
Sin hallazgos. El recuadro `.dato-grado` de ROSENDE comprime el requisito
(b) sobre gastos (la fuente distingue gastos antes/durante la
negociación y quién se benefició, con más granularidad) pero no agrega
contenido nuevo; es compresión legítima de un recuadro, no una adición.

### Resumen de la tanda
Buena fidelidad general, pero con más recorte que el eje A,
concentrado casi todo en el tratamiento de la **aceptación** dentro de
3.2 (se perdió la distinción expresa/tácita, el ejemplo del taxi y la
regla de carga de la prueba) y en un vacío puntual de los contratos
electrónicos (falta la obligación de confirmación escrita). Ningún
hallazgo de prioridad alta; los de prioridad media son candidatos claros
para la fase 2.

---

## Tanda 3 — Eje B, secciones 4-8. Vicios de la voluntad (fuente: PDF 3, 21p)

### 1. Profundidad insuficiente
- **[medio]** `sB5-3-ii` (error sustancial): falta el argumento propio de
  la fuente sobre por qué no es necesario un "elemento subjetivo" para
  calificar la <em>calidad esencial</em> de la cosa (ese elemento solo
  importaría para las cualidades accidentales elevadas a esenciales), y
  falta enteramente la discusión, con cita al <span class="art">art.
  1815</span> (compra de cosa ajena), sobre si pertenecer en dominio al
  vendedor constituye o no una calidad esencial de la cosa vendida.
- **[medio]** `sB5-3-iv` (error en las personas): falta la cita
  específica del art. 8 Nº 2 de la Ley de Matrimonio Civil, que trae dos
  causales propias de falta de consentimiento libre por error (identidad
  del contrayente y cualidades personales determinantes).
- **[medio]** `sB6-4` (prueba del dolo): la fuente da cuatro ejemplos de
  presunciones legales de dolo (arts. 143 inc. 2º, 706 inc. final, 968 Nº
  5 y 2510 Nº 3); el manual solo recoge dos (143 inc. 2º y 968 Nº 5).
- **[medio]** `sB6-6` (sanción del dolo): falta el ejemplo de sanción
  especial del art. 1768 (el cónyuge que oculta o distrae dolosamente
  bienes de la sociedad conyugal pierde su porción en ellos y debe
  restituirlos doblados).
- **[bajo]** `sB5-2` (error de derecho): falta la referencia comparada al
  Código Civil italiano de 1942 (art. 1429 Nº 4), que solo vicia el
  consentimiento cuando el error de derecho fue la razón única o
  principal del contrato.
- **[bajo]** `sB7-3-ii` (fuerza grave): falta la mención de que algunos
  autores exigen, además, que la fuerza sea "actual", aunque la fuente
  aclara que esa condición ya va implícita en la gravedad.

### 2. Falta de ejemplos
- **[medio]** `sB6-2-ii` (dolo negativo / reticencia): falta el ejemplo
  clásico del anticuario que vende una cómoda Luis XVI sin advertir que
  es una copia, ilustración de reticencia dolosa más allá de los dos
  casos legales ya citados (seguro y vicios redhibitorios).

### 3. Jurisprudencia en la fuente, ausente en el manual
- **[bajo]** `sB6-4` (prueba del dolo): la fuente señala que la
  jurisprudencia ha extendido la presunción de buena fe del art. 707
  incluso al matrimonio putativo, en materia de Derecho de Familia; el
  manual recoge que el art. 707 es de aplicación general pese a estar
  ubicado en la posesión, pero no esa extensión jurisprudencial concreta.

### 4. Dato de grado marcado en la fuente, ausente en el manual
Sin hallazgos adicionales a los ya señalados en 1 y 3. El dato de grado
sobre la sanción del error esencial (las tres posturas doctrinales) sí
está recogido en un recuadro propio, con buen nivel de detalle.

### 5. Debate doctrinal aplanado
- **[medio]** `sB5-3-ii` (error sustancial): la fuente no solo expone las
  dos posturas sobre si "sustancia" y "calidad esencial" son sinónimos o
  conceptos distintos, sino que el propio autor toma partido y argumenta
  por qué; el manual expone ambas posturas pero omite esa toma de
  posición razonada (mismo punto de la categoría 1).

### 6. Coherencia estructural
Sin hallazgos. Numeración 4 / 5 (5.1 a 5.6) / 6 (6.1 a 6.7) / 7 (7.1 a
7.8) / 8 fiel al orden y jerarquía de la fuente, incluyendo el título
"Lesión y simulación: remisión" idéntico al de la fuente.

### 7. Contenido del manual sin respaldo en fuente
Sin hallazgos.

### Resumen de la tanda
Más hallazgos que en las tandas anteriores, concentrados en el
**error sustancial** (se perdió el argumento propio del autor sobre el
elemento subjetivo y la discusión del dominio del vendedor como calidad
esencial) y en ejemplos o citas puntuales del **dolo** (presunciones
legales incompletas, falta el ejemplo del anticuario, falta la sanción
especial del art. 1768). Ningún hallazgo de prioridad alta; consistente
con ser el PDF más largo y denso del set de fuentes (21p).

---

## Tanda 4 — Ejes C, D. Capacidad, Objeto (fuente: PDF 4 + PDF 5, 25p)

### 1. Profundidad insuficiente
- **[medio]** `sC3-1` (dementes): se pierde el desarrollo de fondo de dos
  fallos reales de la <strong>Corte de Concepción</strong> (1896 y 2008)
  sobre el sentido amplio de "demencia"; el manual solo parafrasea de
  forma genérica y sin atribución la conclusión del fallo de 2008.
- **[medio]** `sC3-2-b` (disipadores): se pierde por completo el
  desarrollo de un fallo de la <strong>Corte de Concepción (2008)</strong>
  que define la interdicción y explica el fundamento de la institución
  (interés del interdicto, su familia y la sociedad).
- **[medio]** `sD4-1` (contravención del derecho público): falta la
  precisión de que el <span class="art">art. 1462</span> no se refiere al
  <em>orden público</em> sino al <em>derecho público</em> (conceptos
  distintos), falta la mención de que se ha resuelto que adolece de
  nulidad absoluta por objeto ilícito el contrato fundado en un acto
  administrativo nulo de derecho público, y falta enteramente el párrafo
  sobre la <strong>nulidad de derecho público</strong> del art. 7 de la
  Constitución, aplicable cuando la contravención proviene de un órgano
  del Estado y no de un particular.
- **[medio]** `sD4-3-iv` (especies litigiosas): falta la observación
  doctrinal de que el Nº 4 del <span class="art">art. 1464</span> sería
  redundante con el Nº 3 (dado el alcance amplio que la jurisprudencia da
  a "cosas embargadas"), y falta que el demandado es responsable de
  fraude si enajena a sabiendas una especie litigiosa mueble estando
  vigente la prohibición.
- **[bajo]** `sC3-2` (disipadores): falta el punto de que se discute si
  los actos de los disipadores interdictos también generan obligaciones
  naturales (remitido por la fuente al curso de Obligaciones).
- **[bajo]** `sD4-3-iii` (cosas embargadas): falta la protección del
  acreedor que embargó primero mediante el procedimiento de las
  tercerías (art. 528 C.P.C.).

### 2. Falta de ejemplos
Sin hallazgos nuevos. El ejemplo de la venta de la suerte (red del
pescador) ya está recogido en un recuadro `.ejemplo` propio.

### 3. Jurisprudencia en la fuente, ausente en el manual
- **[medio]** `sC3-1` (dementes): falta el fallo de la Corte de
  Concepción de 1896 (la demencia comprende no solo a quienes carecen en
  absoluto de razón, sino también a quienes no pueden dirigirse a sí
  mismos o administrar competentemente sus negocios), y falta la
  atribución explícita del fallo de 2008 de la misma Corte, cuya
  conclusión el manual recoge pero sin citarlo como jurisprudencia. Eje C
  no tiene ningún recuadro `.jurisprudencia`, pese a que la fuente trae
  tres fallos reales con tribunal y año en este tramo.
- **[medio]** `sC3-2-b` (disipadores): falta el fallo de la Corte de
  Concepción de 2008 sobre el concepto y fundamento de la interdicción,
  citado en extenso por la fuente (mismo punto de la categoría 1).

### 4. Dato de grado marcado en la fuente, ausente en el manual
Sin hallazgos adicionales a los ya señalados en 1 y 3.

### 5. Debate doctrinal aplanado
Sin hallazgos. Los debates de objeto ilícito (inexistencia vs. nulidad
absoluta en cosas incomerciables, sentido estricto vs. amplio de
"enajenación") están bien representados con ambas posturas.

### 6. Coherencia estructural
Sin hallazgos. Numeración fiel a la fuente en ambos ejes (1/2/2.1/2.2/3
con 3.1-3.3 para capacidad; 1/2/2.1-2.3/3/3.1-3.3/4/4.1-4.7 para objeto,
con la subdivisión (i)-(iv) correcta dentro de 4.3).

### 7. Contenido del manual sin respaldo en fuente
Sin hallazgos.

### Resumen de la tanda
El hallazgo más notable hasta ahora: **tres fallos reales, con tribunal y
año, presentes en la fuente y ausentes o diluidos en el manual**, los
tres en el eje C (Capacidad), que además no tiene ningún recuadro
`.jurisprudencia`. El eje D (Objeto), pese a ser la fuente más densa y
técnica del set (17p sobre objeto ilícito, arts. 1462 a 1466), tiene una
transcripción muy completa y fiel, con solo algunos puntos puntuales
perdidos (derecho público vs. orden público, nulidad de derecho público
del art. 7 CPR, redundancia del art. 1464 Nº 4). Ningún hallazgo de
prioridad alta, pero los de categoría 3 (jurisprudencia) son los
primeros de esa categoría en toda la auditoría y ameritan atención
prioritaria en fase 2.

---
