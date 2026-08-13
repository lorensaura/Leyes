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

## Resumen ejecutivo

**49 hallazgos** en total a lo largo de los 21 ejes: **1 de prioridad
alta**, **33 de prioridad media**, **15 de prioridad baja**. Ningún eje
tiene hallazgos de contenido sin respaldo en fuente (categoría 7): el
manual es, en ese sentido, limpio, no se detectó alucinación.

| Tanda | Eje(s) | Alto | Medio | Bajo | Total |
|---|---|---|---|---|---|
| 1 | A | 0 | 0 | 0 | 0 |
| 2 | B (1-3, la voluntad) | 0 | 5 | 2 | 7 |
| 3 | B (4-8, vicios) | 0 | 6 | 3 | 9 |
| 4 | C, D | 0 | 7 | 2 | 9 |
| 5 | E, F, G | 0 | 4 | 3 | 7 |
| 6 | H, I, J, K | 0 | 2 | 0 | 2 |
| 7 | L, M | 0 | 0 | 2 | 2 |
| 8 | N, O | 1 | 4 | 2 | 7 |
| 9 | P, Q, R | 0 | 4 | 1 | 5 |
| 10 | S, T, U | 0 | 1 | 0 | 1 |
| 11 | Transversal | 0 | 0 | 0 | 0 |
| **Total** | | **1** | **33** | **15** | **49** |

**El único hallazgo de prioridad alta** es la ausencia de dos fallos
reales (RDJ 1936 y RDJ 1991) que respaldan directamente la tesis central
de la sección de simulación lícita (`sN3`, tanda 8).

**Nota sobre las etiquetas de prioridad:** cada tanda se calificó por
separado, en sesiones distintas, así que el mismo tipo de vacío
(jurisprudencia real de la fuente, ausente del manual) no siempre quedó
con la misma etiqueta según el eje. En el eje N, los 2 fallos de
1936/1991 se marcaron `[alto]` porque sostienen la tesis central de esa
sección. En el eje H, un solo hallazgo `[medio]` agrupa 18 fallos reales
de la fuente frente a solo 5 citados en el manual (la brecha de
jurisprudencia más grande de todo el reporte, aunque cuenta como un solo
hallazgo). En el eje C, 3 fallos reales de la Corte de Concepción
(1896 y 2008 x2) están repartidos en 2 hallazgos también `[medio]`. Si
se prioriza por volumen real de jurisprudencia no usada y no solo por la
etiqueta, el orden es **N > H > C**, no únicamente "el único hallazgo
alto".

**Concentración de hallazgos por eje** (más de 3 hallazgos):
- **Eje N (Simulación)** — el más señalado: 5 fallos reales ausentes
  (incluido el único hallazgo alto), más 2 citas de autor sin usar
  (ALCALDE, JOSSERAND). Es la prioridad más clara para la fase 2.
- **Eje B, secciones 4-8 (Vicios de la voluntad)** — 6 hallazgos menores:
  argumento propio del autor sobre el error sustancial, ejemplos y
  presunciones legales de dolo incompletas.
- **Eje H (Inexistencia)** — jurisprudencia comprimida: 18 fallos reales
  en la fuente, 5 en el manual.
- **Eje C (Capacidad)** — 3 fallos reales (Corte de Concepción, 1896 y
  2008 x2) ausentes o diluidos, eje sin ningún recuadro `.jurisprudencia`.
- **Eje P (Fraude a la ley)** — pierde el argumento moral de DOMÍNGUEZ y
  las citas de FERREIRA y DIEZ-PICAZO sobre buena fe y abuso del derecho.

**Ejes de altísima fidelidad, sin hallazgos relevantes**: A, E, F, G, L,
M, S, T, U. En conjunto, más de la mitad de los 21 ejes no tiene ningún
hallazgo de prioridad media o alta.

**Un solo problema de forma, no de contenido**: el párrafo introductorio
de modalidades (RAMOS, ABELIUK) quedó al final del eje R en vez de al
inicio del eje S (tanda 9-10).

### Qué sigue (fuera del alcance de este reporte)
Este documento es una auditoría de brechas, no una corrección. La
edición del HTML es una fase 2 posterior que requiere que Laura revise
estos hallazgos y decida cuáles corregir y en qué orden. Dado el volumen
de jurisprudencia real identificada (ejes N, H y C concentran casi toda),
esa fase podría organizarse por tandas similares a esta auditoría,
empezando por los ejes de mayor concentración de hallazgos.

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
- **[medio]** `sD4` (concepto de objeto ilícito): el anexo secundario de
  Bozzo e Ibarra trae un debate de al menos cuatro posturas sobre qué
  debe entenderse por "objeto ilícito" (para <strong>CLARO SOLAR</strong>,
  el conforme a la ley y amparado por ella; para <strong>SOMARRIVA</strong>,
  el conforme a la ley, las buenas costumbres y el orden público; para
  <strong>ALESSANDRI</strong>, sinónimo de comerciable; para
  <strong>VELASCO LETELIER</strong>, el que cumple las cualidades del art.
  1461, agregando que solo los arts. 1445, 1468 y 1682 le dan su sentido
  real, y que en los arts. 1462, 1464 y 1466 el legislador lo usa
  impropiamente). El manual introduce el objeto ilícito con una sola
  frase genérica ("buena parte de la doctrina entiende..."), sin este
  debate de autores.

Fuera de este punto, sin más hallazgos: los debates de objeto ilícito
propios de la fuente principal (inexistencia vs. nulidad absoluta en
cosas incomerciables, sentido estricto vs. amplio de "enajenación") están
bien representados con ambas posturas.

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

## Tanda 5 — Ejes E, F, G. Causa, Formalidades, Efectos de los AJ (fuente: PDF 6 + PDF 7 + PDF 8, 22p, más el anexo "Causa Domínguez/Boetsch")

Los ejes F (Formalidades) y G (Efectos) resultaron ser transcripciones de
muy alta fidelidad, prácticamente completas frente a sus PDF fuente (7 y
8): no se encontraron hallazgos de prioridad media o alta en ninguna
categoría. El eje E (Causa) también es muy fiel a su fuente principal
(PDF 6), pero la fuente secundaria "Causa Domínguez/Boetsch" (en
realidad un resumen de interrogación de Bozzo e Ibarra, compilado por
Lucas Pavez a partir de apuntes de Carmen Domínguez y Cristián Boetsch)
aporta contenido real que no está en ninguna de las dos fuentes ya
usadas en el manual.

### 1. Profundidad insuficiente
- **[medio]** `sE4-4` (doctrina unitaria de ALCALDE): falta el punto
  final del autor, que precisa que ciertas instituciones tradicionalmente
  explicadas en función de la causa (la <em>condición resolutoria
  tácita</em> y la <em>excepción de contrato no cumplido</em>) en
  realidad no se relacionan con ella.
- **[medio]** `sE3` (generalidades del debate causalista/anticausalista):
  falta por completo una actualización de derecho comparado que trae el
  anexo Domínguez/Boetsch: la eliminación de la exigencia expresa de
  causa en el Código Civil de Quebec, en los códigos escandinavos y, más
  recientemente, en la reforma francesa de derecho de contratos del <strong>10
  de enero de 2016</strong>, junto con la precisión de <strong>MAZEAUD</strong> de
  que la causa no desapareció de forma absoluta, sino que subsiste en
  ciertos casos. Es un dato con fecha y países específicos, fácil de
  verificar y ausente del manual.
- **[bajo]** `sE3-4` (doctrina anticausalista, PLANIOL): falta el
  argumento adicional, presente en el anexo, de que no sería necesario
  exigir que la causa sea lícita porque el cuestionamiento a la moralidad
  del acto ya está cubierto por el objeto ilícito.
- **[bajo]** `sE4-1` (¿causa del acto o de la obligación?): falta el
  argumento adicional a favor de la tesis "causa del contrato", apoyado
  en el art. 2057 (sociedades nulas por ilicitud del objeto o la causa).
- **[bajo]** `sG3-3` (efecto absoluto): falta la mención de que los
  sistemas jurídicos que más han desarrollado la interferencia en
  contratos ajenos (americano, alemán y francés) presentan diferencias
  entre sí, y el punto de que un tercero puede valerse de un contrato
  ajeno para determinar el legitimado pasivo de una acción de
  responsabilidad extracontractual.

### 2. Falta de ejemplos
- **[medio]** `sE5` (causa real): falta un segundo ejemplo de causa falsa
  o errónea, distinto del de la deuda inexistente ya recogido: el
  heredero que paga un legado sin saber que el testamento en que se
  basaba fue revocado por uno posterior, ejemplo del anexo
  Domínguez/Boetsch.

### 3. Jurisprudencia en la fuente, ausente en el manual
Sin hallazgos. Ninguna de las fuentes de esta tanda (PDF 6, 7, 8 ni el
anexo Domínguez/Boetsch) cita fallos con rol, tribunal o fecha.

### 4. Dato de grado marcado en la fuente, ausente en el manual
- **[medio]** El dato de la reforma francesa de 2016 (categoría 1) es
  precisamente el tipo de actualización reciente que merecería un
  recuadro `.dato-grado` propio, dado que altera la premisa de que "la
  causa es un elemento universal" en el derecho comparado.

### 5. Debate doctrinal aplanado
Cubierto en la categoría 1 (los puntos de ALCALDE y PLANIOL). Fuera de
eso, el resto de los debates de causa (objetivo/subjetivo, dual/unitaria)
están completos y con ambas posturas bien desarrolladas.

### 6. Coherencia estructural
Sin hallazgos en los tres ejes. Numeración fiel a la fuente (1 a 7 con
subniveles en E; 1 a 2.4 en F; 1 a 3.3 en G).

### 7. Contenido del manual sin respaldo en fuente
Sin hallazgos.

### Resumen de la tanda
Los ejes F y G son de los más fieles y completos de toda la auditoría
hasta ahora: sin hallazgos de prioridad media o alta. El eje E es fiel a
su fuente principal, pero al cruzarlo con el anexo Domínguez/Boetsch
aparece contenido real y verificable ausente del manual, en particular
la actualización de derecho comparado sobre la reforma francesa de 2016.
Ningún hallazgo de prioridad alta en la tanda.

---

## Tanda 6 — Ejes H, I, J, K. Inexistencia, Nulidad general/absoluta/relativa (fuente: PDF 9 + PDF 10, 25p, más anexo Bozzo-Ibarra)

Nota metodológica: se verificó puntualmente contra el anexo Bozzo-Ibarra
(`Anexo_secundario_AJ_Ineficacia.pdf`) el contenido del manual que no
aparecía en PDF 9 ni PDF 10, para descartar contenido sin respaldo
(categoría 7). Los dos casos encontrados (la "nulidad refleja" de `sI9` y
el fallo de actos propios de `sJ4`) **sí están respaldados** en ese
anexo, aunque formalmente asignado a otra tanda: quien escribió el
manual ya lo cruzó para estos dos puntos puntuales, señal de que el uso
de fuentes secundarias fue real pero inconsistente entre tramos.

### 1. Profundidad insuficiente
- **[medio]** `sI9` (nulidad refleja): la misma fuente secundaria de la
  que sale este concepto (Bozzo-Ibarra) trae, justo antes del pasaje
  usado, dos conceptos adyacentes que no llegaron al manual: la
  <strong>nulidad consecuencial o de resultado</strong> (cuando la
  cláusula nula contiene la estipulación principal del acto, o este no
  puede subsistir sin ella, su nulidad acarrea la de todo el acto), y el
  principio de que <strong>la nulidad de lo accesorio no afecta a lo
  principal, pero la nulidad de lo principal sí acarrea la de lo
  accesorio</strong>, con dos ejemplos de artículo concretos: la cláusula
  penal (<span class="art">art. 1536</span>) y la fianza (<span class="art">art.
  2381 Nº 3</span>).

### 2. Falta de ejemplos
Sin hallazgos nuevos.

### 3. Jurisprudencia en la fuente, ausente en el manual
- **[medio]** `sH4-4` (jurisprudencia sobre inexistencia vs. nulidad
  absoluta): la fuente lista <strong>18 fallos reales</strong>, con rol,
  tribunal y cita de RDJ (8 que rechazan la teoría de la inexistencia, 10
  que la acogen); el manual cita solo 4 en el cuerpo del texto más uno en
  recuadro `.jurisprudencia`. Entre los omitidos hay varios con rol
  citable y relativamente recientes: Corte Suprema, 28 de noviembre de
  2012, rol 4537-10; C. de Santiago, 2 de mayo de 1997, rol 2153-1995; C.
  de Concepción, 11 de abril de 1995, rol 315-1994; C. de Santiago, 18 de
  noviembre de 2011, rol 5168-2010. La selección hecha es razonable como
  recorte editorial, pero al ser esta la sección con más jurisprudencia
  real de todo el manual hasta ahora, vale la pena que Laura revise si
  conviene ampliar la muestra o agregar un segundo recuadro con más
  fallos.

### 4. Dato de grado marcado en la fuente, ausente en el manual
Sin hallazgos adicionales a los ya señalados.

### 5. Debate doctrinal aplanado
Sin hallazgos. El debate central de la tanda (¿distingue el Código
chileno la inexistencia de la nulidad absoluta?) está tratado con
extraordinaria fidelidad: ambas doctrinas completas (`sH4-1`, `sH4-2`),
más el análisis de historia fidedigna (`sH4-3`) y la jurisprudencia
(`sH4-4`).

### 6. Coherencia estructural
Sin hallazgos. Numeración fiel en los cuatro ejes; se verificó
específicamente que `sI9` (nulidad refleja, sin numeración correlativa
visible en el temario original de la fuente principal) no rompe la
jerarquía del manual porque es contenido adicional correctamente
integrado con su propio `<h2>`.

### 7. Contenido del manual sin respaldo en fuente
Sin hallazgos, tras la verificación puntual descrita en la nota
metodológica.

### Resumen de la tanda
Los ejes I, J y K (nulidad general, absoluta y relativa) son de
altísima fidelidad, probablemente los más completos de la auditoría
hasta ahora, incluyendo puntos técnicos finos (BARAONA sobre la
naturaleza de la caducidad del art. 1683, la discusión sobre el
representante doloso, la situación excepcional del art. 1685). El único
hallazgo de fondo es la jurisprudencia comprimida del eje H (18 fallos
reales en la fuente, 5 en el manual) y dos conceptos adyacentes a la
nulidad refleja que no se cruzaron desde la misma fuente secundaria que
sí se usó para ese punto. Ningún hallazgo de prioridad alta.

---

## Tanda 7 — Ejes L, M. Efectos de la nulidad, Lesión (fuente: PDF 11 + PDF 12, 23p)

Dos de los ejes más extensos y técnicamente densos del manual (la acción
de indemnización de perjuicios de `sL4-3` recorre ocho hipótesis
distintas por causal de nulidad, con la controversia RODRÍGUEZ/BARAONA en
cada una) resultaron ser, a la vez, de los más fieles de toda la
auditoría.

### 1. Profundidad insuficiente
- **[bajo]** `sL4-3` (indemnización de perjuicios por error): la fuente
  distingue dos hipótesis separadas de error con tratamiento distinto
  (error en cualidades accidentales, donde se compensan las culpas si
  ambas partes erraron o hay reticencia si solo una sabía; y error
  sustancial o esencial, donde RODRÍGUEZ y BARAONA discrepan sobre si
  necesariamente lo padecen ambas partes); el manual las presenta en un
  solo párrafo de "el error", sin marcar con la misma claridad que son
  dos hipótesis distintas de la fuente.

### 2. Falta de ejemplos
- **[bajo]** `sM3` (viii, hipoteca): falta el ejemplo numérico de la
  fuente que ilustra la regla del duplo: un deudor con una deuda de
  $30.000 (mutuo) y $20.000 (sobregiro) puede pedir que la hipoteca de
  garantía general se limite a $100.000.

### 3. Jurisprudencia en la fuente, ausente en el manual
Sin hallazgos. Ninguna de las dos fuentes de esta tanda cita fallos con
rol, tribunal o fecha.

### 4. Dato de grado marcado en la fuente, ausente en el manual
Sin hallazgos.

### 5. Debate doctrinal aplanado
Sin hallazgos de fondo. La tesis minoritaria de DUCCI sobre la lesión
como error en la magnitud de las prestaciones está recogida en un
recuadro `.dato-grado` propio, con sus dos argumentos de texto (arts.
1348 y 2458); el debate RODRÍGUEZ/BARAONA sobre la naturaleza de la
responsabilidad por nulidad y sobre cada hipótesis de indemnización está
completo (ver matiz en categoría 1).

### 6. Coherencia estructural
Sin hallazgos. Los 8 casos de lesión del eje M siguen el orden exacto de
la fuente, con la misma numeración (i) a (viii).

### 7. Contenido del manual sin respaldo en fuente
Sin hallazgos.

### Resumen de la tanda
Los ejes más técnicos y extensos de la auditoría hasta ahora resultaron
también de los más fieles: sin hallazgos de prioridad media o alta en
ninguna categoría. El eje L trata con notable precisión ocho hipótesis
distintas de responsabilidad por nulidad, cada una con su propia
controversia doctrinal, sin aplanar ninguna. El eje M recoge los 8 casos
taxativos de lesión del Código con todos sus artículos y la tesis
minoritaria de DUCCI en un recuadro dedicado.

---

## Tanda 8 — Ejes N, O. Simulación, Inoponibilidad (fuente: PDF 13 + PDF 14, 19p)

El eje N (Simulación) es la fuente con más jurisprudencia real y densa
encontrada hasta ahora en la auditoría (comparable solo al eje H), y es
también donde más se comprimió: de al menos 6 fallos reales y 2 citas de
autor con nombre propio, el manual retuvo 2 fallos. El eje O
(Inoponibilidad) es, en cambio, de altísima fidelidad.

### 1. Profundidad insuficiente
- **[bajo]** `sN2`: la fuente lista siete códigos civiles extranjeros del
  siglo XX que sí regulan la simulación, cada uno con sus artículos (el
  alemán de 1900, art. 117; el italiano de 1942, arts. 1414 a 1417; el
  etíope de 1960; el portugués de 1967; el boliviano de 1975; el peruano
  de 1984; el paraguayo de 1985); el manual nombra solo tres (alemán,
  italiano, peruano) y sin citar ningún artículo, ni siquiera de los tres
  que sí menciona.
- **[bajo]** `sN2`: falta la referencia a la Ley Nº 20.720 de 2014, que
  modificó el art. 466 del Código Penal, y a la definición de "persona
  deudora" del art. 2º Nº 25 de esa misma ley.

### 2. Falta de ejemplos
Sin hallazgos relevantes. La fuente da un segundo ejemplo de simulación
relativa por diferencia en el objeto (contrato de servicios que aparenta
ser de "empleada de casa particular" y en realidad es de otra
naturaleza) que el manual omitió, en lo que parece una decisión editorial
razonable dado el contenido, no un vacío a corregir.

### 3. Jurisprudencia en la fuente, ausente en el manual
- **[alto]** `sN3` (simulación lícita): faltan los dos fallos que la
  fuente cita como respaldo directo de la tesis central de la sección
  (que la simulación sin perjuicio de terceros es lícita): uno de 1936
  (RDJ, t. XXXVIII, secc. 2ª, p. 17) y otro de 1991 (RDJ, t. LXXXVIII,
  secc. 1ª, p. 14). El manual solo trae el fallo de 2015 sobre la
  <em>causa simulandi</em>, que es un punto distinto (por qué existe la
  simulación, no que sea lícita).
- **[medio]** `sN4-1` (requisitos de la simulación ilícita): falta la
  cita del fallo de la Corte Suprema de 30 de marzo de 2017, que la
  fuente menciona junto al de 2015 como reiteración de los mismos
  requisitos.
- **[medio]** `sN4-4` (consideraciones probatorias): faltan dos fallos
  reales más, de la Corte de Apelaciones de Concepción de 29 de agosto de
  1997 (confirmado por la Corte Suprema el 20 de octubre de 1997), sobre
  la prueba indirecta y por indicios de la simulación, y la síntesis de
  "dos consecuencias probatorias" que la Corte Suprema formula en sus
  fallos de 2015 y 2017. El manual solo conserva el fallo de 1918 sobre
  la prueba por presunciones.

### 4. Dato de grado marcado en la fuente, ausente en el manual
Sin hallazgos adicionales a los ya señalados.

### 5. Debate doctrinal aplanado
- **[medio]** `sN3` (introducción a la simulación lícita): falta el
  argumento de ALCALDE de que toda simulación busca engañar a terceros
  sin que ello la vuelva necesariamente ilícita, y la cita de JOSSERAND
  sobre que el móvil perseguido es decisivo para calificar el acto
  ("habrá mentiras jurídicas condenables y a veces criminales, otras que
  serán solo pecados veniales..."), ambos citados por nombre en la fuente
  al introducir la distinción entre simulación lícita e ilícita.
- **[medio]** `sO2-1` (i, inoponibilidades por publicidad): falta la
  discusión doctrinal sobre si el art. 1707 inciso 1º (contraescrituras
  privadas) debería clasificarse como una "inoponibilidad por
  clandestinidad" (de fondo) en lugar de una inoponibilidad de forma, con
  la crítica de que esa clasificación alternativa exigiría acreditar un
  ánimo de ocultamiento que la norma no pide.

### 6. Coherencia estructural
Sin hallazgos. Numeración fiel en ambos ejes (1 a 4 con 4.1-4.4 en N; 1 a
5 con 2.1-2.2 en O).

### 7. Contenido del manual sin respaldo en fuente
Sin hallazgos.

### Resumen de la tanda
El eje N concentra el hallazgo de jurisprudencia más importante de toda
la auditoría hasta ahora: cinco fallos reales, verificables por tomo y
página de RDJ o por fecha exacta, ausentes del manual, más dos citas de
autor con nombre propio (ALCALDE, JOSSERAND) que enmarcan justamente el
punto doctrinal central de la sección (por qué la simulación no es, por
sí sola, ilícita). El eje O es, en contraste, de gran fidelidad, con solo
una discusión de clasificación doctrinal aplanada. Se recomienda que la
fase 2 priorice el eje N para agregar jurisprudencia, dado el volumen de
fallos reales disponibles y sin usar.

---

## Tanda 9 — Ejes P, Q, R. Fraude a la ley, Otras causales, Representación (fuente: PDF 15 + PDF 16, 33p)

Nota metodológica: el eje Q trae tres puntos (Terminación, Renuncia,
Muerte) que no están en PDF 16, la fuente principal de esta tanda. Se
verificó contra `INEFICACIA JURÍDICA_Cuadro comparativo.pdf` (anexo de
Bozzo e Ibarra) y **los tres están correctamente respaldados ahí**, con
definiciones que calzan casi textualmente con el manual: no es contenido
sin fuente.

### 1. Profundidad insuficiente
- **[medio]** `sP2` (el fraude a la ley en Chile): falta el argumento
  moral e iusnaturalista, extenso, que la fuente atribuye a DOMÍNGUEZ,
  sobre por qué un fin ilícito vicia un acto en sí lícito ("un fin lícito
  no legitima un acto ilícito: el fin no justifica los medios; pero un
  fin ilícito vicia el acto intrínsecamente lícito").
- **[bajo]** `sP2`: de los diez artículos que DOMÍNGUEZ cita como
  manifestaciones del principio <em>fraus omnia corrumpit</em>, el
  manual retiene siete y omite tres (arts. 539 Nº 2 y 541, sobre remoción
  del guardador por fraude; art. 555, sobre el "delito de fraude" en las
  asociaciones).

### 2. Falta de ejemplos
Sin hallazgos nuevos. Los casos Bauffremont y Fritz Mandel ya están
recogidos en un recuadro `.ejemplo` propio en `sP1`.

### 3. Jurisprudencia en la fuente, ausente en el manual
Sin hallazgos. Ninguna de las dos fuentes de esta tanda cita fallos con
rol o fecha en las secciones de fraude a la ley u otras causales; en
representación, el único fallo real de la fuente (Corte Suprema, 9 de
enero de 2017) está correctamente citado en extenso en `sR4-4`.

### 4. Dato de grado marcado en la fuente, ausente en el manual
Sin hallazgos adicionales a los ya señalados.

### 5. Debate doctrinal aplanado
- **[medio]** `sP4-1` (fraude a la ley y simulación): falta la
  contra-crítica de ALCALDE a la distinción mayoritaria entre ambas
  figuras: para él, aunque las distinciones propuestas son correctas
  "desde una perspectiva científica o académica", no gozan de la misma
  consistencia "si uno atiende a la realidad de los hechos".
- **[medio]** `sP4-2` (fraude a la ley y abuso del derecho): faltan las
  citas de FERREIRA y DIEZ-PICAZO sobre la buena fe como límite al
  ejercicio de los derechos subjetivos, y el catálogo amplio de
  conductas que la doctrina califica como abuso del derecho (ejercicio
  con el solo propósito de dañar, desproporción extrema entre el interés
  del titular y el efecto en el tercero, actos propios, ejercicio de
  mala fe, desviación del fin de un derecho potestativo).

### 6. Coherencia estructural
- **[medio]** `sR10-2` (cierre del eje R): el último párrafo del eje,
  sobre las definiciones de "modalidad" de RAMOS y ABELIUK y su
  clasificación (accidental/de la naturaleza/de la esencia; actos
  patrimoniales vs. de familia), no aparece en PDF 16 (fuente de
  Representación) y temáticamente pertenece al eje S (Modalidades), cuya
  fuente (PDF 17) todavía no se revisó en esta auditoría. Queda
  pendiente verificar en la tanda 10 si el contenido está simplemente
  duplicado ahí (como introducción del eje S) o si quedó mal ubicado.

### 7. Contenido del manual sin respaldo en fuente
Pendiente de cerrar el punto de la categoría 6 (párrafo final de
modalidades en `sR10-2`) en la tanda 10, cruzándolo contra PDF 17. Fuera
de eso, sin hallazgos: se verificó explícitamente que Q7-Q9 sí tienen
respaldo (ver nota metodológica).

### Resumen de la tanda
El eje R (Representación) es uno de los más completos y fieles de toda
la auditoría, incluyendo la transcripción casi íntegra del fallo de la
Corte Suprema de 2017 sobre las cuatro teorías de la naturaleza jurídica
de la representación. El eje Q es breve y fiel, con una fuente adicional
(Cuadro comparativo) correctamente cruzada para tres de sus nueve
puntos. El eje P pierde algunas citas de autor con nombre propio
(DOMÍNGUEZ, ALCALDE, FERREIRA, DIEZ-PICAZO) en los puntos más
argumentativos de la sección, sin perder la estructura central del
debate. Ningún hallazgo de prioridad alta; queda abierto un punto de
coherencia estructural a cerrar en la tanda 10.

---

## Tanda 10 — Ejes S, T, U. Condición, Plazo, Modo (fuente: PDF 17, 13p)

### Cierre del punto pendiente de la tanda 9
Se confirma: el párrafo final de `sR10-2` (definiciones de RAMOS y
ABELIUK, características de las modalidades, actos que admiten
modalidades, lugar del Código) es exactamente la introducción general de
PDF 17 ("VI. Modalidades de los actos jurídicos", secciones 1 a 4, antes
de que la fuente entre en "A. La condición"). El contenido está
correctamente respaldado en la fuente, incluida la referencia a dónde
trata el Código las modalidades (Libro III y Libro IV) — **no falta
nada**, pero está mal ubicado: pertenece como introducción del eje S
("Modalidades", con sus tres subejes condición/plazo/modo), no como
cierre del eje R (Representación). No se duplicó en `sS`, que arranca
directo en "1. Concepto" de la condición, sin ningún párrafo introductorio
general sobre modalidades.

### 1. Profundidad insuficiente
Sin hallazgos. Los tres ejes son transcripciones prácticamente completas
de la fuente: todas las clasificaciones de la condición (positiva/negativa,
posible/imposible, suspensiva/resolutoria, potestativa/casual/mixta), los
tres estados (pendiente/cumplida/fallida) para ambos tipos de condición,
las semejanzas/diferencias y clasificaciones del plazo, y el concepto,
efectos y cumplimiento del modo están todos presentes con sus artículos y
ejemplos.

### 2. Falta de ejemplos
Sin hallazgos. Todos los ejemplos de la fuente (condición físicamente
imposible de la estrella, condición mixta del casamiento con María, plazo
determinado/indeterminado, modo de las escuelas fronterizas, etc.) están
recogidos.

### 3. Jurisprudencia en la fuente, ausente en el manual
Sin hallazgos. El único punto jurisprudencial de la fuente (la condición
suspensiva puramente potestativa del deudor es nula, la resolutoria es
válida) está recogido en un recuadro `.dato-grado` propio en `sS2-4`, con
el razonamiento completo.

### 4. Dato de grado marcado en la fuente, ausente en el manual
Sin hallazgos adicionales.

### 5. Debate doctrinal aplanado
Sin hallazgos. No hay debates doctrinales relevantes en esta fuente más
allá del punto ya recogido en el recuadro de la categoría 3.

### 6. Coherencia estructural
- **[medio]** Ver "Cierre del punto pendiente de la tanda 9" arriba: la
  introducción general de modalidades quedó al final del eje R en lugar
  de al inicio del eje S. Es un problema de ubicación, no de contenido
  perdido.

### 7. Contenido del manual sin respaldo en fuente
Sin hallazgos, incluido el párrafo verificado en el punto anterior.

### Resumen de la tanda
Los tres ejes finales del manual son de altísima fidelidad, sin
hallazgos de contenido en ninguna categoría. El único punto real de esta
tanda es de forma, no de fondo: mover el párrafo introductorio de
modalidades (RAMOS, ABELIUK, características, ámbito de aplicación) del
final de `sR10-2` al inicio de `sS`, donde temáticamente corresponde.

---

## Tanda 11 — Pasada transversal

### Cuadro comparativo de Ineficacia (Bozzo-Ibarra)
Se leyó completo (3p, 13 causales: inexistencia, nulidad absoluta,
nulidad relativa, resciliación o mutuo disenso, resolución, terminación,
inoponibilidad, revocación, renuncia, retractación, suspensión,
caducidad, muerte) y se cruzó contra el manual completo. Las 13 causales
están representadas: 12 tienen su propia sección en algún eje (H, J, K, L
por la reivindicatoria contra terceros de la resolución, O, Q); la
**retractación** no tiene sección propia en el eje Q (Otras causales),
pero está desarrollada en detalle a propósito de la oferta, en `sB3-2-a`
(tempestiva/intempestiva). No es un vacío de contenido, solo una
ubicación distinta a la que sugiere el cuadro. Sin hallazgos nuevos de
categorías 1-5 o 7.

### Memorice_ART y Definiciones
Se leyó completo (4p, glosario de definiciones con cita de artículo o
autor) y se usó para verificar por muestreo, no exhaustivamente, que las
definiciones del manual coinciden con las que Laura ya validó para el
módulo de Memorice. La gran mayoría de las ~35 entradas del glosario
(voluntad, oferta, aceptación, error, error de derecho, dolo, fuerza,
lesión, capacidad, formalidades, los tres tipos de efectos, parte,
terceros relativos, inexistencia, nulidad, nulidad absoluta/relativa,
ratificación tácita, acción reivindicatoria, conversión, suspensión,
inoponibilidad, representación, poder de representación, mandato,
contemplatio domini, estipulación para otro, entre otras) coincide
palabra por palabra o casi con el texto del manual: buena señal de
consistencia general.

Una sola divergencia real: la tarjeta de <strong>Simulación</strong> del
Memorice, atribuida a Boetsch, la define como <em>"cuando la declaración
de voluntad constitutiva de un acto jurídico se dirige por la persona
que la hace a otra, con la cual se está de acuerdo en no querer darle
eficacia"</em>, mientras que el manual (`sN1`) usa la definición de
Avelino LEÓN ("aparentar una declaración de voluntad que no se desea,
contando con la aquiescencia de la parte a quien esa declaración va
dirigida"), que es la que efectivamente trae PDF 13. No se persiguió más
allá esta divergencia porque el contenido de Memorice lo decide y envía
Laura directamente, no algo que este proceso deba verificar o corregir
por su cuenta; se deja anotado solo para que ella lo tenga presente si
alguna vez cruza ambos materiales.

### Verificación de fuentes secundarias sin cruzar
Se confirmó que los 17 PDF fragmentados, las 3 fuentes secundarias
específicas (Causa Domínguez/Boetsch, Bozzo-Ibarra en sus 3 copias, Cuadro
comparativo) y el glosario de Memorice fueron todos leídos con extracción
real de texto y cruzados contra el manual en algún punto de las 10 tandas
anteriores. No se abrió por separado el PDF unificado
`Acto Jurídico_principal_BOETSCH.pdf` (221p): solo se verificó que la
suma de páginas de los 17 fragmentos (≈219p) es consistente con que sea
el mismo libro dividido por tema, no se leyó su texto de forma
independiente. La cobertura de contenido es equivalente (los fragmentos
cubren el mismo texto), pero no es una lectura duplicada del unificado.

