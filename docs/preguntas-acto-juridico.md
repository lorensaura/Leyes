# Preguntas de Acto Jurídico (módulo de Práctica)

> Estado vivo del contenido de Práctica de Acto Jurídico: Evaluación,
> Alternativas, Flashcards y Memorice de definiciones. Se actualiza **in
> place** (no se agrega una entrada nueva por sesión). Si Laura dice
> "retoma las preguntas de Acto Jurídico", leer este archivo primero y
> resumir en pocas líneas dónde quedó.
> Fuente única del contenido: `04_Acto_Juridico_Manual.html` (manual
> actualizado, terminado el 2026-10-07, capítulos I a VI).

## Estado por capítulo

**Flashcards de los seis capítulos: revisadas contra el manual y
publicadas el 2026-10-09** (291). Evaluación: en curso, tema por tema y
tipo por tipo; tanda 1 (Nulidad, Aplicación) cargada y esperando revisión
(ver "Siguiente paso exacto"). Alternativas: después.

| Capítulo del manual | Estado |
|---|---|
| I. Teoría general del acto jurídico | **Flashcards: todos los subtemas cubiertos** (lote 2). Evaluación y Alternativas: lote 1 en borrador |
| II. Requisitos (A voluntad, B capacidad, C objeto, D causa, E formalidades) | **Capítulo completo (temas 6 a 16): Flashcards de todos los subtemas cubiertas** (lotes 2 a 5) |
| III. Efectos | **Flashcards de todos los subtemas cubiertas** (lote 5) |
| IV. Ineficacia (A inexistencia, B nulidad, C lesión, D simulación, E inoponibilidad, F fraude a la ley, G otras) | **Capítulo completo (temas 18 a 27): Flashcards de todos los subtemas cubiertas** (lotes 6 a 9) |
| V. Representación | **Flashcards de todos los subtemas cubiertas** (lote 10, con pocas tarjetas) |
| VI. Modalidades | **Flashcards de todos los subtemas cubiertas** (lote 10, con pocas tarjetas) |

Además existen, de antes y también en Revisar, 10 ítems del Cap. I
cargados el 2026-09-28 (`aj-aplic-001`, `aj-det-001`, `aj-just-001`,
`aj-mc-001`, `aj-fc-001` a `006`). Se revisaron contra el manual
actualizado el 2026-10-07 y siguen correctos.

Memorice de **artículos** de AJ ya existe desde 2026-08-12 (40 artículos,
publicados, ver `docs/camino-a-beta.md`). Lo nuevo es Memorice de
**definiciones**.

## Relevancia de los temas según exámenes de grado reales

Análisis del 2026-10-07 sobre la carpeta `Apuntes/CIVIL/PREGUNTAS` (que
Laura armó con preguntas de exámenes de grado), para decidir qué temas
necesitan más preguntas en Digesto.

**Qué se contó.** La unidad es el **examen**: en cuántos exámenes
distintos apareció cada tema (si un examinador hizo diez preguntas
seguidas sobre nulidad, cuenta como un examen con nulidad, no como diez).
Se usaron tres fuentes de exámenes reales, **81 exámenes en total**:
- `Preguntas Grado ACA.numbers`, hoja **Civil**: 28 exámenes de 2018-2019
  con fecha y examinador (Correa, Sochting, Jiménez, Cruz, Boetsch, Lyon,
  Verdugo, Cifuentes y otros), filas marcadas "T. Ley y T. AJ".
- Misma planilla, hoja **LYON**: 48 cédulas o listas, filas marcadas
  "T. Ley y T. AJ".
- `PREGUNTAS ACTO JURIDICO.pages`: 5 interrogatorios orales completos
  (bloques UNO a SEIS).

En total, 1.162 preguntas de Acto Jurídico. Se apartaron 76 preguntas de
Teoría de la Ley (otra materia) y quedaron 94 sin tema reconocible (por
ejemplo, la teoría de los actos propios, que no está en el manual).

**Qué no se contó, y por qué.** `PREGUNTAS CIVIL - EXAMENES COMPLETOS`
y el listado suelto del final de `PREGUNTAS ACTO JURIDICO` mezclan
Obligaciones, Personas y Familia sin separación clara, y meterlos
ensuciaba el conteo. `Preguntas AJ.pages` (y sus copias `.docx`) es el
banco de preguntas ya redactado, no un registro de exámenes: es material
útil para escribir, pero no mide frecuencia. Los demás archivos (Bienes,
Contratos, Matrimonio, Responsabilidad y las planillas de Procesal) son
de otras materias.

**Cómo se clasificó.** Cada pregunta se asignó a uno de 29 temas que
siguen el índice del manual, por palabras clave. Una pregunta de
seguimiento sin palabras clave (por ejemplo, "¿y quién puede pedirla?")
hereda el tema de la anterior del mismo examen; la herencia suma
preguntas, pero no cuenta un examen nuevo. Se revisaron muestras al azar
y se corrigieron los errores encontrados, pero la clasificación es
automática: los números son una buena aproximación del peso relativo, no
un conteo exacto. Dentro de cada tema, la pregunta se asignó además a
uno de sus subtemas con el mismo método; las preguntas generales del tema
("hablemos de la nulidad") cuentan para el tema, pero no para ningún
subtema.

**Ojo con los temas que el examen pregunta en otras materias.** Algunos
temas del manual se preguntan mucho, pero el examinador los anota en otra
materia: la representación y el mandato en Fuentes, las modalidades en
Obligaciones, la capacidad en Personas (174, 61 y 43 preguntas en esas
materias, respectivamente). El informe lo muestra bajo el nombre de cada
tema, para no subestimarlos; la cifra también está en el catálogo
(`otras_materias`).

**Niveles:** Alta = aparece en el 25% o más de los exámenes; Media = 10%
a 24%; Baja = menos de 10%.

La tabla con la relevancia de cada tema y subtema está en el tablero de
abajo (filas en negrita = tema; filas sangradas = subtemas).

## Tablero de cobertura por tema y subtema

Los 29 temas (filas en negrita, en el orden del manual) se dividen en 132
subtemas que siguen el índice del manual. Los subtemas viven **dentro**
de su tema: en Airtable, cada pregunta se liga a uno de los 29 temas
(tabla Temas) y lleva el nombre exacto de su subtema en el campo
`subtema`. El tablero separa los subtemas para ver qué falta preguntar
en cada uno. El catálogo de temas y subtemas, con la relevancia de cada
uno y el mapa de Memorice y de los recuadros "No confundir", está en
`scripts/aj_temas_subtemas.json`.

**Para actualizarlo después de cada lote:** `python3
scripts/tablero_cobertura_aj.py`. Cuenta en vivo desde Airtable y
Supabase (y suma las Alternativas en SQL que todavía no se corren),
reescribe la tabla de abajo y el informe
`DERECHO LIBRE/Informes/Informe_AJ_relevancia_temas.html`. Por eso, toda
pregunta nueva debe llevar en `subtema` el nombre **exacto** de un
subtema del catálogo; si no, el script la avisa como "sin subtema" y no
la cuenta.

<!-- tablero:inicio -->
*Generado por `scripts/tablero_cobertura_aj.py`. No editar a mano: correr el script de nuevo.*

| Tema / subtema | Sección | Relevancia | Exámenes (de 81) | Aplicación | Detección de error | Justificación | Discr. MC | Alternativas | Flashcards | Recuadros No confundir (ya incluidos en Flashcards) | Memorice |
|---|---|---|---|---|---|---|---|---|---|---|---|
| **1. Concepto de acto jurídico; hechos jurídicos** | I.1-4 | **Baja** | **3 (4%)** | **·** | **1** | **1** | **·** | **3** | **7** | **1** | **1** |
| &nbsp;&nbsp;&nbsp;La teoría del acto jurídico en el Código Civil | I.1-2 | | · | · | · | · | · | 1 | 1 | · | · |
| &nbsp;&nbsp;&nbsp;Hechos jurídicos: concepto y clasificación | I.3 | | · | · | · | 1 | · | 1 | 1 | · | · |
| &nbsp;&nbsp;&nbsp;Acto jurídico y negocio jurídico | I.3 (No confundir) | | · | · | 1 | · | · | · | 1 | 1 | · |
| &nbsp;&nbsp;&nbsp;Concepto de acto jurídico y sus elementos | I.4 | | 2 | · | · | · | · | 1 | 4 | · | 1 |
| **2. Autonomía de la voluntad y sus límites** | I.5 | **Media** | **9 (11%)** | **·** | **·** | **·** | **·** | **3** | **4** | **·** | **·** |
| &nbsp;&nbsp;&nbsp;Concepto y fundamento de la autonomía de la voluntad | I.5.1 | | 2 | · | · | · | · | · | 1 | · | · |
| &nbsp;&nbsp;&nbsp;Consecuencias de la autonomía de la voluntad | I.5.2 | | · | · | · | · | · | 1 | 1 | · | · |
| &nbsp;&nbsp;&nbsp;Límites: orden público y buenas costumbres | I.5.3 | | 9 | · | · | · | · | 2 | 2 | · | · |
| **3. Elementos esenciales, de la naturaleza y accidentales** | I.6 | **Media** | **10 (12%)** | **2** | **·** | **·** | **·** | **1** | **4** | **·** | **1** |
| &nbsp;&nbsp;&nbsp;Elementos esenciales (generales y especiales) | I.6.1 | | 4 | 1 | · | · | · | · | 2 | · | 1 |
| &nbsp;&nbsp;&nbsp;Elementos de la naturaleza | I.6.2 | | 3 | 1 | · | · | · | · | 1 | · | · |
| &nbsp;&nbsp;&nbsp;Elementos accidentales | I.6.3 | | 2 | · | · | · | · | 1 | 1 | · | · |
| **4. Requisitos de existencia y de validez** | I.7 | **Alta** | **21 (26%)** | **·** | **1** | **1** | **·** | **·** | **4** | **·** | **1** |
| &nbsp;&nbsp;&nbsp;Doctrina de los requisitos de existencia y de validez | I.7.1 | | 14 | · | 1 | · | · | · | 2 | · | 1 |
| &nbsp;&nbsp;&nbsp;Doctrina de los requisitos de eficacia | I.7.2 | | · | · | · | 1 | · | · | 2 | · | · |
| **5. Clasificaciones de los actos jurídicos** | I.8 | **Media** | **9 (11%)** | **1** | **1** | **1** | **3** | **5** | **16** | **1** | **·** |
| &nbsp;&nbsp;&nbsp;Unilaterales, bilaterales y plurilaterales (y convención/contrato) | I.8.1 | | 2 | · | 1 | 1 | 1 | 2 | 4 | 1 | · |
| &nbsp;&nbsp;&nbsp;Patrimoniales y de familia | I.8.2 | | · | · | · | · | · | · | 1 | · | · |
| &nbsp;&nbsp;&nbsp;Gratuitos y onerosos (conmutativos y aleatorios) | I.8.3 | | 1 | · | · | · | 1 | · | 1 | · | · |
| &nbsp;&nbsp;&nbsp;Administración y disposición | I.8.4 | | · | 1 | · | · | · | · | 1 | · | · |
| &nbsp;&nbsp;&nbsp;Entre vivos y por causa de muerte | I.8.5 | | 2 | · | · | · | · | · | 1 | · | · |
| &nbsp;&nbsp;&nbsp;Solemnes y no solemnes | I.8.6 | | · | · | · | · | · | 1 | 1 | · | · |
| &nbsp;&nbsp;&nbsp;Consensuales y reales | I.8.7 | | · | · | · | · | · | · | 1 | · | · |
| &nbsp;&nbsp;&nbsp;Puros y simples y sujetos a modalidad | I.8.8 | | · | · | · | · | · | · | 1 | · | · |
| &nbsp;&nbsp;&nbsp;Causales y abstractos | I.8.9 | | · | · | · | · | · | · | 1 | · | · |
| &nbsp;&nbsp;&nbsp;Principales y accesorios | I.8.10 | | 1 | · | · | · | 1 | 1 | 1 | · | · |
| &nbsp;&nbsp;&nbsp;Constitutivos, declarativos y traslaticios | I.8.11 | | · | · | · | · | · | · | 1 | · | · |
| &nbsp;&nbsp;&nbsp;Instantáneos, de ejecución diferida y de tracto sucesivo | I.8.12 | | · | · | · | · | · | · | 1 | · | · |
| &nbsp;&nbsp;&nbsp;Típicos y atípicos | I.8.13 | | 3 | · | · | · | · | 1 | 1 | · | · |
| **6. Voluntad: requisitos, manifestación y silencio** | II.A.1-2 | **Baja** | **4 (5%)** | **·** | **·** | **·** | **·** | **·** | **5** | **1** | **·** |
| &nbsp;&nbsp;&nbsp;Conceptos generales y seriedad de la voluntad | II.A.1-2.1 | | · | · | · | · | · | · | 1 | · | · |
| &nbsp;&nbsp;&nbsp;Manifestación expresa y tácita | II.A.2.2 (i)-(ii) | | 1 | · | · | · | · | · | 2 | · | · |
| &nbsp;&nbsp;&nbsp;El silencio como manifestación de voluntad | II.A.2.2 (iii) | | 1 | · | · | · | · | · | 2 | 1 | · |
| **7. Formación del consentimiento (oferta, aceptación, casos especiales)** | II.A.3 | **Baja** | **6 (7%)** | **·** | **·** | **·** | **·** | **·** | **13** | **4** | **1** |
| &nbsp;&nbsp;&nbsp;Voluntad en los actos unilaterales y concepto de consentimiento | II.A.3.1-3.2 | | 1 | · | · | · | · | · | 1 | · | 1 |
| &nbsp;&nbsp;&nbsp;La oferta (requisitos, retractación, caducidad) | II.A.3.2 (i) | | 1 | · | · | · | · | · | 4 | 2 | · |
| &nbsp;&nbsp;&nbsp;La aceptación (requisitos, plazo) | II.A.3.2 (ii) | | 2 | · | · | · | · | · | 2 | · | · |
| &nbsp;&nbsp;&nbsp;Momento y lugar en que se forma el consentimiento | II.A.3.2 (iii)-(iv) | | 2 | · | · | · | · | · | 2 | 1 | · |
| &nbsp;&nbsp;&nbsp;Negociaciones preliminares | II.A.3.2 (v) | | · | · | · | · | · | · | 1 | · | · |
| &nbsp;&nbsp;&nbsp;Casos especiales: licitación, adhesión, autocontrato y electrónicos | II.A.3.3 | | · | · | · | · | · | · | 3 | 1 | · |
| **8. Vicios del consentimiento en general** | II.A.4 | **Alta** | **20 (25%)** | **·** | **·** | **·** | **·** | **·** | **2** | **·** | **1** |
| &nbsp;&nbsp;&nbsp;Vicios del consentimiento: enumeración y concepto | II.A.4 | | 20 | · | · | · | · | · | 2 | · | 1 |
| **9. Error** | II.A.5 | **Alta** | **36 (44%)** | **·** | **·** | **·** | **·** | **·** | **19** | **3** | **4** |
| &nbsp;&nbsp;&nbsp;Concepto de error (ignorancia, duda, previsión) | II.A.5.1 | | 19 | · | · | · | · | · | 2 | 1 | · |
| &nbsp;&nbsp;&nbsp;Error de derecho | II.A.5.2 (i) | | 7 | · | · | · | · | · | 3 | 1 | 1 |
| &nbsp;&nbsp;&nbsp;Error de hecho y sus clases | II.A.5.2 (ii) | | 14 | · | · | · | · | · | 2 | · | · |
| &nbsp;&nbsp;&nbsp;Error esencial u obstáculo | II.A.5.3 (i) | | 21 | · | · | · | · | · | 2 | · | 1 |
| &nbsp;&nbsp;&nbsp;Error sustancial | II.A.5.3 (ii) | | 20 | · | · | · | · | · | 2 | · | 1 |
| &nbsp;&nbsp;&nbsp;Error sobre calidades accidentales | II.A.5.3 (iii) | | 18 | · | · | · | · | · | 2 | 1 | · |
| &nbsp;&nbsp;&nbsp;Error en la persona | II.A.5.3 (iv) | | 12 | · | · | · | · | · | 3 | · | 1 |
| &nbsp;&nbsp;&nbsp;Error en actos bilaterales y unilaterales | II.A.5.4-5.5 | | · | · | · | · | · | · | 2 | · | · |
| &nbsp;&nbsp;&nbsp;Error común | II.A.5.6 | | 2 | · | · | · | · | · | 1 | · | · |
| **10. Dolo** | II.A.6 | **Alta** | **22 (27%)** | **·** | **·** | **·** | **·** | **·** | **11** | **·** | **3** |
| &nbsp;&nbsp;&nbsp;Concepto de dolo, sus ámbitos y elementos | II.A.6.1 | | 7 | · | · | · | · | · | 2 | · | 1 |
| &nbsp;&nbsp;&nbsp;Clases de dolo (bueno/malo, positivo/negativo, principal/incidental) | II.A.6.2 | | 5 | · | · | · | · | · | 3 | · | · |
| &nbsp;&nbsp;&nbsp;Cuándo vicia el consentimiento (bilaterales y unilaterales) | II.A.6.3 | | 10 | · | · | · | · | · | 1 | · | 1 |
| &nbsp;&nbsp;&nbsp;Prueba del dolo | II.A.6.4 | | · | · | · | · | · | · | 2 | · | 1 |
| &nbsp;&nbsp;&nbsp;Condonación o renuncia del dolo | II.A.6.5 | | · | · | · | · | · | · | 1 | · | · |
| &nbsp;&nbsp;&nbsp;Sanción del dolo y acción de dolo | II.A.6.6-6.7 | | 3 | · | · | · | · | · | 2 | · | · |
| **11. Fuerza** | II.A.7 | **Media** | **17 (21%)** | **·** | **·** | **·** | **·** | **·** | **8** | **1** | **3** |
| &nbsp;&nbsp;&nbsp;Concepto y clases de fuerza (física y moral) | II.A.7.1-7.2 | | 5 | · | · | · | · | · | 1 | · | 1 |
| &nbsp;&nbsp;&nbsp;Requisitos: injusta, grave y determinante | II.A.7.3 | | 8 | · | · | · | · | · | 3 | · | 1 |
| &nbsp;&nbsp;&nbsp;Persona que ejerce la fuerza | II.A.7.4 | | 2 | · | · | · | · | · | 2 | 1 | 1 |
| &nbsp;&nbsp;&nbsp;Prueba, efectos y prescripción de la acción | II.A.7.5-7.7 | | 1 | · | · | · | · | · | 1 | · | · |
| &nbsp;&nbsp;&nbsp;Temor reverencial | II.A.7.8 | | · | · | · | · | · | · | 1 | · | · |
| **12. Capacidad e incapacidades** | II.B | **Media** | **9 (11%)** | **·** | **·** | **·** | **·** | **·** | **13** | **1** | **3** |
| &nbsp;&nbsp;&nbsp;Concepto y clases de capacidad (goce y ejercicio) | II.B.1-2 | | · | · | · | · | · | · | 3 | · | 2 |
| &nbsp;&nbsp;&nbsp;Incapacidad absoluta | II.B.3.1 | | 3 | · | · | · | · | · | 4 | · | 1 |
| &nbsp;&nbsp;&nbsp;Incapacidad relativa | II.B.3.2 | | 2 | · | · | · | · | · | 4 | 1 | · |
| &nbsp;&nbsp;&nbsp;Incapacidades particulares o especiales | II.B.3.3 | | 1 | · | · | · | · | · | 2 | · | · |
| **13. Objeto: concepto y requisitos** | II.C.1-3 | **Alta** | **28 (35%)** | **·** | **·** | **·** | **·** | **·** | **12** | **·** | **2** |
| &nbsp;&nbsp;&nbsp;Concepto de objeto | II.C.1 | | 15 | · | · | · | · | · | 3 | · | 1 |
| &nbsp;&nbsp;&nbsp;Objeto que recae sobre una cosa: real (existente o futura) | II.C.2.1 | | 5 | · | · | · | · | · | 3 | · | 1 |
| &nbsp;&nbsp;&nbsp;Cosa comerciable | II.C.2.2 | | 6 | · | · | · | · | · | 1 | · | · |
| &nbsp;&nbsp;&nbsp;Cosa determinada o determinable | II.C.2.3 | | 3 | · | · | · | · | · | 2 | · | · |
| &nbsp;&nbsp;&nbsp;Objeto que recae sobre un hecho: determinado, física y moralmente posible | II.C.3 | | 10 | · | · | · | · | · | 3 | · | · |
| **14. Objeto ilícito (1462 a 1466)** | II.C.4 | **Alta** | **24 (30%)** | **·** | **·** | **·** | **·** | **·** | **21** | **1** | **6** |
| &nbsp;&nbsp;&nbsp;Concepto de objeto ilícito y casos en general | II.C.4 | | 14 | · | · | · | · | · | 3 | · | 1 |
| &nbsp;&nbsp;&nbsp;Actos contrarios al derecho público chileno | II.C.4.1 | | 3 | · | · | · | · | · | 2 | · | 1 |
| &nbsp;&nbsp;&nbsp;Pactos sobre sucesiones futuras | II.C.4.2 | | 13 | · | · | · | · | · | 3 | · | 1 |
| &nbsp;&nbsp;&nbsp;Enajenación del art. 1464 (cosas incomerciables, intransferibles, embargadas y litigiosas) | II.C.4.3 | | 11 | · | · | · | · | · | 10 | 1 | 1 |
| &nbsp;&nbsp;&nbsp;Condonación del dolo futuro | II.C.4.4 | | 1 | · | · | · | · | · | 1 | · | 1 |
| &nbsp;&nbsp;&nbsp;Juego de azar, libros prohibidos y actos prohibidos por la ley | II.C.4.5-4.7 | | 1 | · | · | · | · | · | 2 | · | 1 |
| **15. Causa** | II.D | **Alta** | **31 (38%)** | **·** | **·** | **·** | **·** | **·** | **17** | **1** | **1** |
| &nbsp;&nbsp;&nbsp;Generalidades: causa eficiente, final y ocasional | II.D.1-2 | | 10 | · | · | · | · | · | 2 | · | · |
| &nbsp;&nbsp;&nbsp;Doctrinas de la causa (clásica, italiana, móvil, anticausalista) | II.D.3 | | 1 | · | · | · | · | · | 3 | · | · |
| &nbsp;&nbsp;&nbsp;La causa en el Código: ¿acto u obligación?, criterio objetivo o subjetivo, doctrina dual y unitaria | II.D.4 | | 11 | · | · | · | · | · | 4 | · | 1 |
| &nbsp;&nbsp;&nbsp;Causa real | II.D.5 | | 1 | · | · | · | · | · | 2 | · | · |
| &nbsp;&nbsp;&nbsp;Licitud de la causa | II.D.6 | | 11 | · | · | · | · | · | 2 | · | · |
| &nbsp;&nbsp;&nbsp;Actos causales y abstractos | II.D.7 | | 1 | · | · | · | · | · | 2 | · | · |
| &nbsp;&nbsp;&nbsp;Relación de la causa con el error, la fuerza y el dolo | II.D.8 | | 7 | · | · | · | · | · | 2 | 1 | · |
| **16. Formalidades y solemnidades** | II.E | **Baja** | **3 (4%)** | **·** | **·** | **·** | **·** | **·** | **10** | **1** | **·** |
| &nbsp;&nbsp;&nbsp;Concepto y clases de formalidades | II.E.1-2 | | · | · | · | · | · | · | 2 | · | · |
| &nbsp;&nbsp;&nbsp;Solemnidades (de existencia y de validez) | II.E.2.1 | | 3 | · | · | · | · | · | 3 | · | · |
| &nbsp;&nbsp;&nbsp;Formalidades habilitantes | II.E.2.2 | | · | · | · | · | · | · | 2 | · | · |
| &nbsp;&nbsp;&nbsp;Formalidades de prueba y medidas de publicidad | II.E.2.3-2.4 | | · | · | · | · | · | · | 3 | 1 | · |
| **17. Efectos del acto: partes, terceros y efecto relativo** | III | **Baja** | **0 (0%)** | **·** | **·** | **·** | **·** | **·** | **8** | **1** | **·** |
| &nbsp;&nbsp;&nbsp;Generalidades y efectos esenciales, naturales y accidentales | III.1 | | · | · | · | · | · | · | 1 | · | · |
| &nbsp;&nbsp;&nbsp;Partes y terceros (absolutos y relativos) | III.2 | | · | · | · | · | · | · | 3 | 1 | · |
| &nbsp;&nbsp;&nbsp;Efecto relativo y sus excepciones | III.3.1-3.2 | | · | · | · | · | · | · | 2 | · | · |
| &nbsp;&nbsp;&nbsp;Efecto absoluto o erga omnes | III.3.3 | | · | · | · | · | · | · | 2 | · | · |
| **18. Ineficacia en general** | IV, introducción | **Media** | **8 (10%)** | **·** | **·** | **·** | **·** | **·** | **3** | **·** | **·** |
| &nbsp;&nbsp;&nbsp;Ineficacia: concepto y clasificación (invalidez e ineficacia en sentido estricto) | IV (introducción) | | 8 | · | · | · | · | · | 3 | · | · |
| **19. Inexistencia jurídica** | IV.A | **Media** | **15 (19%)** | **·** | **·** | **·** | **·** | **·** | **12** | **2** | **·** |
| &nbsp;&nbsp;&nbsp;Concepto, características y origen de la inexistencia | IV.A.1-2 | | 1 | · | · | · | · | · | 3 | · | · |
| &nbsp;&nbsp;&nbsp;Diferencias entre inexistencia y nulidad | IV.A.3 | | · | · | · | · | · | · | 2 | · | · |
| &nbsp;&nbsp;&nbsp;¿Distingue el Código la inexistencia? (doctrinas, historia y jurisprudencia) | IV.A.4 | | 6 | · | · | · | · | · | 7 | 2 | · |
| **20. Nulidad: concepto, clases, causales, titulares y saneamiento** | IV.B.1-3 | **Alta** | **39 (48%)** | **17** | **·** | **·** | **·** | **·** | **39** | **1** | **8** |
| &nbsp;&nbsp;&nbsp;Reglas, concepto general y especies de nulidad | IV.B.1.1-3 | | 15 | 2 | · | · | · | · | 4 | · | 2 |
| &nbsp;&nbsp;&nbsp;Terminología y nulidad como regla general | IV.B.1.4-5 | | · | 1 | · | · | · | · | 2 | · | · |
| &nbsp;&nbsp;&nbsp;Diferencias entre nulidad absoluta y relativa | IV.B.1.6 | | 5 | 1 | · | · | · | · | 2 | · | · |
| &nbsp;&nbsp;&nbsp;Principios comunes a ambas nulidades | IV.B.1.7 | | · | 1 | · | · | · | · | 5 | · | 1 |
| &nbsp;&nbsp;&nbsp;Nulidad total y parcial; consecuencial y refleja | IV.B.1.8-9 | | · | 1 | · | · | · | · | 3 | 1 | · |
| &nbsp;&nbsp;&nbsp;Nulidad absoluta: concepto, causales y fundamento | IV.B.2.1-3 | | 10 | 2 | · | · | · | · | 3 | · | 1 |
| &nbsp;&nbsp;&nbsp;Nulidad absoluta: quién la declara o pide (juez de oficio, interesado, ministerio público) | IV.B.2.4 | | 14 | 2 | · | · | · | · | 6 | · | 1 |
| &nbsp;&nbsp;&nbsp;Nulidad absoluta: saneamiento (no por ratificación, sí por tiempo) y no opera de pleno derecho | IV.B.2.5-7 | | 9 | 1 | · | · | · | · | 4 | · | · |
| &nbsp;&nbsp;&nbsp;Nulidad relativa: definición, fundamento, causales y características | IV.B.3.1-3 | | 11 | 2 | · | · | · | · | 3 | · | · |
| &nbsp;&nbsp;&nbsp;Nulidad relativa: quiénes pueden alegarla (y el incapaz que no puede) | IV.B.3.4 | | 11 | 2 | · | · | · | · | 3 | · | 2 |
| &nbsp;&nbsp;&nbsp;Nulidad relativa: saneamiento por el transcurso del tiempo | IV.B.3.5 | | 15 | 2 | · | · | · | · | 4 | · | 1 |
| **21. Ratificación o confirmación** | IV.B.3.6 | **Baja** | **3 (4%)** | **·** | **·** | **·** | **·** | **·** | **8** | **1** | **5** |
| &nbsp;&nbsp;&nbsp;Ratificación o confirmación: concepto, clases, características y requisitos | IV.B.3.6 | | 3 | · | · | · | · | · | 8 | 1 | 5 |
| **22. Efectos de la nulidad, restituciones, reivindicación y conversión** | IV.B.4 | **Media** | **8 (10%)** | **·** | **·** | **·** | **·** | **·** | **20** | **2** | **3** |
| &nbsp;&nbsp;&nbsp;Efectos de la nulidad entre las partes (restituciones mutuas) | IV.B.4.1-2 | | 1 | · | · | · | · | · | 5 | · | 2 |
| &nbsp;&nbsp;&nbsp;Efectos respecto de terceros y acción reivindicatoria | IV.B.4.3-4 | | 1 | · | · | · | · | · | 8 | · | 1 |
| &nbsp;&nbsp;&nbsp;La conversión del acto nulo | IV.B.4.5 | | · | · | · | · | · | · | 7 | 2 | · |
| **23. Lesión** | IV.C | **Baja** | **6 (7%)** | **·** | **·** | **·** | **·** | **·** | **5** | **·** | **·** |
| &nbsp;&nbsp;&nbsp;Concepto de lesión | IV.C.1 | | 2 | · | · | · | · | · | 1 | · | · |
| &nbsp;&nbsp;&nbsp;¿Es la lesión un vicio del consentimiento? | IV.C.2 | | 3 | · | · | · | · | · | 1 | · | · |
| &nbsp;&nbsp;&nbsp;Casos de lesión en el Código Civil | IV.C.3 | | 2 | · | · | · | · | · | 2 | · | · |
| &nbsp;&nbsp;&nbsp;Sanción de la lesión | IV.C.4 | | 1 | · | · | · | · | · | 1 | · | · |
| **24. Simulación** | IV.D | **Media** | **8 (10%)** | **·** | **·** | **·** | **·** | **·** | **6** | **·** | **1** |
| &nbsp;&nbsp;&nbsp;Concepto de simulación y su reconocimiento en Chile | IV.D.1-2 | | 6 | · | · | · | · | · | 2 | · | · |
| &nbsp;&nbsp;&nbsp;Simulación lícita e ilícita y sus requisitos | IV.D.3-4.1 | | 2 | · | · | · | · | · | 1 | · | · |
| &nbsp;&nbsp;&nbsp;Clases: absoluta y relativa (e interposición de persona) | IV.D.4.2 | | 2 | · | · | · | · | · | 1 | · | · |
| &nbsp;&nbsp;&nbsp;Sanción, prueba y acción de simulación | IV.D.4.3-4.5 | | 6 | · | · | · | · | · | 2 | · | 1 |
| **25. Inoponibilidad** | IV.E | **Baja** | **3 (4%)** | **·** | **·** | **·** | **·** | **·** | **4** | **·** | **·** |
| &nbsp;&nbsp;&nbsp;Concepto de inoponibilidad | IV.E.1 | | · | · | · | · | · | · | 1 | · | · |
| &nbsp;&nbsp;&nbsp;Inoponibilidades de forma y de fondo (incluida la acción pauliana) | IV.E.2 | | 2 | · | · | · | · | · | 1 | · | · |
| &nbsp;&nbsp;&nbsp;Inoponibilidad derivada de la nulidad o resolución | IV.E.3 | | 1 | · | · | · | · | · | 1 | · | · |
| &nbsp;&nbsp;&nbsp;Cómo se hace valer y diferencias con la nulidad | IV.E.4-5 | | · | · | · | · | · | · | 1 | · | · |
| **26. Fraude a la ley** | IV.F | **Baja** | **1 (1%)** | **·** | **·** | **·** | **·** | **·** | **2** | **·** | **·** |
| &nbsp;&nbsp;&nbsp;Fraude a la ley: concepto, requisitos, figuras afines y sanción | IV.F | | 1 | · | · | · | · | · | 2 | · | · |
| **27. Otras causales de ineficacia (resolución, resciliación, revocación, caducidad...)** | IV.G | **Baja** | **4 (5%)** | **·** | **·** | **·** | **·** | **·** | **4** | **·** | **·** |
| &nbsp;&nbsp;&nbsp;Resolución | IV.G.2 | | 2 | · | · | · | · | · | 1 | · | · |
| &nbsp;&nbsp;&nbsp;Resciliación | IV.G.3 | | · | · | · | · | · | · | 1 | · | · |
| &nbsp;&nbsp;&nbsp;Revocación y desistimiento unilateral | IV.G.4-5 | | 2 | · | · | · | · | · | 1 | · | · |
| &nbsp;&nbsp;&nbsp;Suspensión, caducidad, terminación, renuncia y muerte | IV.G.1, 6-9 | | 1 | · | · | · | · | · | 1 | · | · |
| **28. Representación (y estipulación por otro, promesa de hecho ajeno)** | V | **Media** | **8 (10%)** | **·** | **·** | **·** | **·** | **·** | **9** | **1** | **3** |
| &nbsp;&nbsp;&nbsp;Concepto, utilidad y clases de representación | V.1-3.2 | | 4 | · | · | · | · | · | 1 | · | 1 |
| &nbsp;&nbsp;&nbsp;Mandato y representación voluntaria | V.3.3 | | 3 | · | · | · | · | · | 2 | 1 | 1 |
| &nbsp;&nbsp;&nbsp;Naturaleza jurídica de la representación | V.4 | | 1 | · | · | · | · | · | 1 | · | · |
| &nbsp;&nbsp;&nbsp;Circunstancias personales: capacidad, vicios y buena fe | V.5 | | 1 | · | · | · | · | · | 2 | · | · |
| &nbsp;&nbsp;&nbsp;Requisitos y efectos de la representación (contemplatio domini, poder) | V.6-7 | | 1 | · | · | · | · | · | 1 | · | 1 |
| &nbsp;&nbsp;&nbsp;Actos sin poder o con extralimitación y su ratificación | V.8-9 | | · | · | · | · | · | · | 1 | · | · |
| &nbsp;&nbsp;&nbsp;Estipulación para otro y promesa de hecho ajeno | V.10 | | · | · | · | · | · | · | 1 | · | · |
| **29. Modalidades: condición, plazo y modo** | VI | **Baja** | **6 (7%)** | **·** | **·** | **·** | **·** | **·** | **5** | **·** | **·** |
| &nbsp;&nbsp;&nbsp;Condición: concepto y clasificaciones | VI.A.1-2 | | 3 | · | · | · | · | · | 2 | · | · |
| &nbsp;&nbsp;&nbsp;Estados y efectos de la condición (suspensiva y resolutoria) | VI.A.3 | | · | · | · | · | · | · | 1 | · | · |
| &nbsp;&nbsp;&nbsp;Plazo: concepto, diferencias con la condición, clases y efectos | VI.B | | · | · | · | · | · | · | 1 | · | · |
| &nbsp;&nbsp;&nbsp;Modo | VI.C | | 3 | · | · | · | · | · | 1 | · | · |
| **Total** | | | | **20** | **3** | **3** | **3** | **12** | **291** | **23** | **47** |
<!-- tablero:fin -->

## Dónde está cada cosa (al 2026-10-09)

| Modelo | Cantidad | Dónde | Estado |
|---|---|---|---|
| Flashcards | **291** (`aj-fc-001` a `291`) | Airtable, base `Digesto Acto Jurídico` (`appBDWY3eCXgxBGpL`), tabla Flashcards | **Publicadas** (2026-10-09): en Airtable con `publicado` y `Verificado`, y en Supabase; cada una ligada a uno de los 29 temas (tabla Temas) y con su `subtema` exacto. Detalle por lote en "Lotes de Flashcards" |
| Evaluación | 29: 12 del Cap. I (3 por tipo, `aj-*-001` a `003`) y 17 de Aplicación de Nulidad (`aj-aplic-004` a `020`) | Misma base, tablas Aplicación / Detección de error / Justificación / Discriminación MC | Sin publicar, en `Revisar`, con tema y subtema |
| Alternativas | 12 (`aj-alt-001` a `012`) | `scripts/alternativas_acto_juridico_2026-10-07_capI.sql` | **SQL sin correr**; entra con `publicado = false`. Cap. I |
| Memorice de definiciones | 7, piloto (`aj-def-001` a `007`) | `scripts/memorice_definiciones_acto_juridico_2026-10-07_piloto.sql` | **SQL sin correr**; entra con `publicado = false` |
| Memorice de artículos | 40 | Supabase `memorice_articulos` | Publicados desde 2026-08-12 |
| Conexiones con otras materias | 61 (`aj-con-001` a `061`) | Airtable, base de AJ, tabla **Conexiones** (creada el 2026-10-10) | En `Revisar`. Extraídas de los 19 recuadros "Conexiones" del manual (`scripts/practica_aj/extraer_conexiones.py` y `subir_conexiones.py`). Una fila por materia conectada, con tema, subtema, sección y dónde está en el otro apunte. **Para qué (Laura):** que los exámenes con IA de toda la materia puedan ir conectando materias. No se sincroniza a Supabase todavía |

Informes de revisión (fuera del repo, en `DERECHO LIBRE/Informes/`):
`Informe_AJ_relevancia_temas.html` (relevancia y tablero por subtema,
se regenera con el script del tablero), `Informe_AJ_practica_capI.html`
(lote 1 de Evaluación, Alternativas y definiciones) e
`Informe_AJ_flashcards_lote2.html` a `lote10.html`.

## Herramientas (scripts del repo)

- `scripts/aj_temas_subtemas.json`: catálogo de los 29 temas y 132
  subtemas, con su relevancia en exámenes y el mapa de Memorice y de los
  recuadros "No confundir".
- `scripts/tablero_cobertura_aj.py`: cuenta en vivo (Airtable +
  Supabase + SQL sin correr) y reescribe el tablero de este archivo y el
  informe de relevancia.
- `scripts/practica_aj/`, el flujo de Flashcards por lote:
  - `extraer.py`: genera en `generado/` el texto plano del manual
    (`manual.txt`) y los recuadros No confundir. Correrlo primero si el
    manual cambió.
  - `lote_fcN.py`: el contenido de cada lote (tarjeta, subtema, respaldo).
    El lote siguiente se escribe en un archivo nuevo con el mismo formato.
  - `subir_fc.py lote_fcN`: asigna ids, revisa (subtema válido, sin
    guiones largos ni etiquetas no permitidas, sin preguntas repetidas) y
    corre `verificar_respaldo.py`; solo con `--subir` y cero problemas
    carga a Airtable sin publicar y en Revisar. Si se intenta subir un
    lote ya cargado, lo frena por preguntas repetidas.
  - `verificar_respaldo.py`: comprueba que cada artículo y autor citado
    esté en la sección del manual indicada como respaldo.
  - `informe_fc.py lote_fcN N "descripción"`: arma el informe de
    revisión del lote en `DERECHO LIBRE/Informes/`.
- Revisión de Flashcards ya cargadas (2026-10-09), sin escribir en Airtable:
  - `revisar_fc.py`: baja todas las Flashcards de Airtable, las cruza con
    los lotes **por el texto de la pregunta** (ojo: `filas_lote_fc6.json`
    quedó con ids corridos, `aj-fc-195` a `207`, porque se volvió a correr
    después de subir; las tarjetas reales del lote 6 son `182` a `194`),
    avisa si alguna se editó en Airtable y agrega controles que
    `verificar_respaldo.py` no hace (comillas literales, artículos y autores
    sin formato). Deja en `generado/revision_fc.json` cada tarjeta con el
    texto de su sección, para la lectura de fondo.
  - `correcciones_revision.py`: las correcciones propuestas (id, nivel,
    problema, texto actual, texto propuesto). `informe_revision.py` arma con
    ellas `Informe_AJ_revision_flashcards.html`.

## Pasos para que el contenido llegue a la app, en este orden

1. ~~Llevar a `main` y desplegar los cambios de código del 2026-10-07~~
   **Hecho** (comprobado el 2026-10-08: `app/alternativas.html` y
   `scripts/sync_airtable_supabase.py` ya están en `origin/main`). Sin
   esos cambios, un ítem de AJ publicado aparecería mezclado bajo
   Responsabilidad y una definición de Memorice pediría un número de
   artículo. Las Flashcards viven en Airtable, así que no necesitan
   fusionar esta rama para llegar a la app.
2. Laura revisa los informes y corrige o aprueba.
3. Flashcards y Evaluación: en Airtable, marcar `publicado` y poner
   `Revision_status = Verificado`; luego correr
   `python3 scripts/sync_airtable_supabase.py`.
4. Alternativas y definiciones: Laura corre los dos SQL en el SQL Editor
   de Supabase (copiar con `pbcopy < ruta/al/archivo.sql`, pegar con
   Cmd+V). Para publicar después de revisar, cada SQL trae en su
   encabezado el `update ... set publicado = true` correspondiente.

## Método: acordado y por acordar (conversación con Laura, 2026-10-07)

Decidido:
- **Se parte por Flashcards**, tema por tema en el orden del manual,
  cubriendo todos los subtemas (ver "Lotes de Flashcards").
- **Los 23 recuadros "No confundir" del manual se convirtieron todos en
  Flashcards** (lote 2, `aj-fc-023` a `045`).
- **La relevancia la marcan los exámenes reales** (sección "Relevancia
  de los temas"), y el tablero de cobertura por tema y subtema es la
  herramienta para decidir dónde faltan preguntas.
- **Los 29 temas en Airtable** (hecho 2026-10-07): la tabla Temas de la
  base de AJ tiene los 29 temas y cada pregunta lleva su subtema exacto.
  Los subtemas viven dentro de su tema; solo el tablero los separa.
- **Tandas chicas: dos temas por tanda** (o uno solo si es grande, como
  la nulidad), para bajar el riesgo. Revisión en un informe HTML por
  lote, que se abre en el navegador al terminar.
- **Control anti-alucinación obligatorio** antes de subir cada lote (ver
  "Lotes de Flashcards").

Por acordar con Laura (no bloquea seguir con Flashcards):
1. ~~Cómo trabajar Evaluación~~ **decidido el 2026-10-09** (ver
   "Siguiente paso exacto"). Falta: cuántas por subtema, y Alternativas.
2. Qué hacer con el lote 1 del Cap. I (Evaluación, Alternativas y
   definiciones en borrador): revisarlo, ajustarlo o descartarlo.
3. Qué definiciones entran a Memorice (38 en el manual, 7 en el piloto).

## Lotes de Flashcards (método acordado el 2026-10-07)

Laura pidió partir por Flashcards: primero convertir los recuadros "No
confundir" y después generar **por tema, cubriendo todos los subtemas**,
en el orden del manual.

- **Lote 2 (2026-10-07), hecho:** 83 Flashcards en Airtable, sin
  publicar y en Revisar, ligadas a su tema y con su subtema exacto.
  `aj-fc-023` a `045`: los 23 recuadros "No confundir" (de todos los
  capítulos). `aj-fc-046` a `105`: 60 nuevas de los temas 1 a 11
  (Capítulo I y II.A, la voluntad), que dejan **al menos una Flashcard en
  cada subtema** de esos temas; los subtemas de relevancia alta llevan
  dos a cuatro. Informe de revisión:
  `DERECHO LIBRE/Informes/Informe_AJ_flashcards_lote2.html`.
- **Lote 3 (2026-10-07), hecho:** 24 Flashcards (`aj-fc-106` a `129`)
  de los temas 12 (Capacidad) y 13 (Objeto: concepto y requisitos), todos
  sus subtemas cubiertos. Informe:
  `DERECHO LIBRE/Informes/Informe_AJ_flashcards_lote3.html`. Laura pidió
  desde este lote **menos temas por tanda (dos)**, para bajar el riesgo.
- **Lote 4 (2026-10-07), hecho:** 36 Flashcards (`aj-fc-130` a `165`)
  de los temas 14 (Objeto ilícito, 21 en total con el recuadro No
  confundir) y 15 (Causa, 17), todos sus subtemas cubiertos; el art. 1464
  lleva 10, por ser el subtema más preguntado del tema. Informe:
  `DERECHO LIBRE/Informes/Informe_AJ_flashcards_lote4.html`.
- **Lote 5 (2026-10-07), hecho:** 16 Flashcards (`aj-fc-166` a `181`)
  de los temas 16 (Formalidades, 10 con el recuadro No confundir) y 17
  (Efectos, 8), ambos de relevancia baja, por eso una a tres por
  subtema. Cierran los capítulos II y III. El control detectó una cita
  con respaldo mal indicado (art. 1545 en III.2.2, no en III.3.1) y se
  corrigió antes de subir. Informe:
  `DERECHO LIBRE/Informes/Informe_AJ_flashcards_lote5.html`.
- **Lote 6 (2026-10-07), hecho:** 13 Flashcards (`aj-fc-182` a `194`)
  de los temas 18 (Ineficacia en general, 3) y 19 (Inexistencia, 12 con
  los dos recuadros No confundir); la discusión de si el Código distingue
  la inexistencia (Claro Solar, Alessandri, historia del art. 1683)
  lleva 7. Informe: `DERECHO LIBRE/Informes/Informe_AJ_flashcards_lote6.html`.
- **Lote 7 (2026-10-08), hecho:** 38 Flashcards (`aj-fc-195` a `232`)
  del tema 20 (Nulidad) solo, IV.B.1 a IV.B.3.5, sus 11 subtemas
  cubiertos. Más carga en lo más preguntado: quién pide o declara la
  nulidad absoluta (6), principios comunes (5) y saneamiento de la
  relativa (4). Control sin fallos al primer intento. Informe:
  `DERECHO LIBRE/Informes/Informe_AJ_flashcards_lote7.html`.
- **Lote 8 (2026-10-08), hecho:** 25 Flashcards (`aj-fc-233` a `257`)
  de los temas 21 (Ratificación, 7) y 22 (Efectos de la nulidad, 18:
  partes 5, terceros y acciones 8, conversión 5). Se evitó repetir lo ya
  cubierto (los 3 recuadros No confundir del lote 2 y el art. 1692 del
  lote 7, que aquí solo aparece por la regla de no extender la suspensión
  por analogía). Control sin fallos al primer intento. Informe:
  `DERECHO LIBRE/Informes/Informe_AJ_flashcards_lote8.html`.
- **Lote 9 (2026-10-08), hecho:** 21 Flashcards (`aj-fc-258` a `278`)
  de los temas 23 a 27 (Lesión 5, Simulación 6, Inoponibilidad 4, Fraude
  a la ley 2, Otras causales 4), ya con el criterio de **pocas tarjetas**:
  una por subtema, dos solo donde el subtema junta ideas distintas. Cierra
  el Capítulo IV. Control sin fallos al primer intento. Informe:
  `DERECHO LIBRE/Informes/Informe_AJ_flashcards_lote9.html`.
- **Lote 10 (2026-10-08), hecho, el último:** 13 Flashcards (`aj-fc-279`
  a `291`) de los temas 28 (Representación, 8) y 29 (Modalidades, 5), con
  el criterio de pocas tarjetas. Control sin fallos al primer intento.
  Con este lote, **los 132 subtemas del manual tienen al menos una
  Flashcard** (comprobado en el tablero). Informe:
  `DERECHO LIBRE/Informes/Informe_AJ_flashcards_lote10.html`.
- **Criterio de cantidad usado:** al menos una por subtema; dos a cuatro
  en los subtemas que más aparecen en exámenes (error esencial y
  sustancial, error en la persona, clases de dolo, requisitos de la
  fuerza, etc.). Una idea por tarjeta, con el artículo cuando el manual
  lo cita, y el pasaje del manual que la respalda.
- **Desde el tema 23 (IV.C Lesión) en adelante, pocas tarjetas** (Laura,
  2026-10-08): lo más relevante ya se tocó. Basta **una por subtema**, y
  dos solo donde el subtema tenga dos ideas que no caben en una tarjeta.
  No se agregan tarjetas de detalle doctrinal fino.
- **Control anti-alucinación (obligatorio en cada lote):** cada tarjeta se
  redacta solo desde el texto del manual leído en ese momento, con su
  respaldo (sección exacta). Antes de subir, un script comprueba que cada
  artículo y cada autor citado aparezca **en esa misma sección** del
  manual (no solo en alguna parte), que no haya guiones largos ni
  etiquetas no permitidas y que ninguna pregunta repita una existente; si
  algo falla, no se sube. Lotes 2 a 10: 269 tarjetas, ninguna subida con fallos.

## Siguiente paso exacto

**Flashcards de AJ: terminadas, revisadas y publicadas (2026-10-09).**
291 en Airtable y en la app (Supabase, `materia = acto_juridico`), los
132 subtemas cubiertos.
- **Revisión contra el manual** (2026-10-09): las 291 se leyeron una por
  una contra el manual actual, con los criterios de `digesto-revision` y
  la regla anti-alucinación de `docs/prompts-practica/nucleo.md`. Ningún
  artículo, autor ni fallo inventado, nada fuera de la materia. 14
  correcciones (2 de fondo: `aj-fc-248`, el tope de diez años es del art.
  1692 inc. final y no del 2520 inc. 2°; `aj-fc-156`, cita del art. 1467
  cortada; 5 de precisión y 7 de forma), aprobadas por Laura con un ajuste
  (`005`: "prenda civil") y aplicadas con
  `scripts/practica_aj/aplicar_correcciones.py`, que también actualizó los
  `lote_fcN.py`. Detalle en `correcciones_revision.py` y en
  `DERECHO LIBRE/Informes/Informe_AJ_revision_flashcards.html`.
- **Redundancia entre tarjetas:** Laura decidió no revisarla.
- **Publicación** (2026-10-09): `publicado` y `Revision_status =
  Verificado` en las 291 (`scripts/practica_aj/publicar_fc.py`), y sync a
  Supabase. El sync (`scripts/sync_airtable_supabase.py`) **se corre
  desde el repo principal**, porque busca el `.env` en su raíz. Ese sync
  subió además 12 Flashcards de Responsabilidad que ya estaban publicadas
  en Airtable y faltaban en Supabase.

**Lo que sigue: Evaluación. Método decidido por Laura el 2026-10-09:**
- **Tablero propio de Evaluación:**
  `DERECHO LIBRE/Informes/Informe_AJ_cobertura_evaluacion.html`, que se
  genera con el mismo `python3 scripts/tablero_cobertura_aj.py`. Muestra
  los 4 tipos (Aplicación, Detección de error, Justificación,
  Discriminación MC) por tema y subtema, separando publicadas y borrador,
  con los temas **ordenados por relevancia**. Ese orden es el orden de
  trabajo: 1° Nulidad (tema 20), 2° Error (9), 3° Causa (15), 4° Objeto
  (13), 5° Objeto ilícito (14), 6° Dolo (10), y así.
- **Se trabaja tema por tema y, dentro del tema, tipo por tipo:** primero
  Aplicación de todos los subtemas del tema, luego Detección de error,
  luego Justificación, luego Discriminación MC. Terminados los 4 tipos se
  pasa al tema siguiente. Cada tanda (un tipo de un tema) lleva el control
  anti-alucinación y su informe de revisión.
- **Cantidad (Laura, 2026-10-10, sube desde la opción B del 2026-10-09):**
  **cuatro preguntas por tipo** en los subtemas que aparecen en **10 o más
  exámenes** (columna del tablero; son 23 de los 132) y **dos en el
  resto**, para que alcance a quien estudia solo esta materia. Es la regla
  de todas las materias (núcleo, "Cantidad de preguntas"). Es un techo: si
  un subtema no da para más sin repetir, o no da para el tipo (ej.
  terminología en Aplicación), se dice en el informe. Total estimado de
  AJ: ~310 por tipo, ~1.240 entre los 4.
- **Prompt:** el de Responsabilidad, `docs/prompts-practica/nucleo.md` +
  `{tipo}.md` + `elementos-clave.md`, con estas adaptaciones para AJ (que
  mandan sobre lo que digan esos archivos): cantidad según la regla de
  arriba (no "2-4 por eje entre los 4 tipos"); un tipo a la vez dentro de
  cada tema; destino la base `Digesto Acto Jurídico` (el sync fuerza
  `materia = acto_juridico`); `subtema` con el nombre **exacto** del
  catálogo; y la entrega en el orden del núcleo dentro del informe.
- **Corrección flexible (obligatoria, Laura 2026-10-09):** las keywords se
  redactan para la corrección flexible de la app (palabras con
  significado cercanas, por raíz, en cualquier orden; no frases del
  manual). Reglas en `docs/prompts-practica/elementos-clave.md`. Para
  aprobar se exige el 75% (con 3 elementos, los 3); **con 2 de 3 la
  alumna recibe una repregunta** (la `pregunta` del elemento faltante) y
  una segunda pasada antes del veredicto final, decisión de Laura: no se
  baja el umbral. Por eso cada elemento necesita una repregunta que
  oriente sin regalar la respuesta. En el veredicto final está el botón
  "Lo dije con otras palabras", cuyos reclamos se revisan con
  `scripts/revisar_correcciones_evaluacion.py`.
- **Flujo de cada tanda** (scripts en `scripts/practica_aj/`):
  1. `python3 scripts/practica_aj/extraer.py` si cambió el manual.
  2. Leer la sección del tema en `generado/manual.txt`, y lo que ya existe
     de ese tipo (tablero), antes de redactar.
  3. Escribir `lote_<tipo>N.py` (formato de `lote_aplic1.py`: `TABLA`,
     `PREFIJO`, `ITEMS` con subtema, caso, enunciado, respuesta,
     elementos, artículos, objetivo y secciones de respaldo; e `INFORME`
     con puntos activados, cobertura por ítem, avisos y redundancia).
  4. `python3 scripts/practica_aj/subir_eval.py lote_<tipo>N`: revisa
     (artículos y autores en su sección de respaldo, guiones, 3-4
     elementos con 4-6 keywords de hasta 4 palabras con significado, que
     la corrección flexible no las encuentre ya en el caso, el enunciado
     ni la repregunta de su elemento, que la respuesta modelo obtenga
     todos los elementos con la corrección de la app, sin repetir lo
     cargado; avisa de las keywords de una sola palabra). Sin opciones
     solo revisa. Con `--subir` y cero problemas, carga sin publicar y en
     Revisar. **Con `--actualizar` escribe en Airtable** los ítems ya
     cargados (para corregirlos), así que no usarlo para solo revisar.
  5. `python3 scripts/practica_aj/informe_eval.py lote_<tipo>N` y abrir el
     informe; `python3 scripts/tablero_cobertura_aj.py`.
  6. Ojo con los puntos discutidos del manual: no darlos por zanjados. Ej.:
     la **compraventa** de cosa embargada es válida para la Corte Suprema
     (tesis de Velasco, II.C.4.3); los casos atacan la **tradición**.
- **Tanda 1 (2026-10-09): Nulidad, Aplicación.** 17 preguntas,
  `aj-aplic-004` a `020` (`lote_aplic1.py`), en Airtable sin publicar y en
  Revisar. Informe: `DERECHO LIBRE/Informes/Informe_AJ_aplic1.html`.
  **Revisada por Laura (2026-10-09): bien.** El subtema de terminología se
  cubrió solo con la regla general (la terminología no da para
  Aplicación). Después, al pasar a la corrección flexible, se ajustaron en
  Airtable las keywords y repreguntas de 13 de las 17 (keywords que ya
  estaban en el caso, repreguntas que regalaban la respuesta, palabras
  sueltas muy generales); el contenido jurídico no cambió. Siguen sin
  publicar: se publican junto con el resto de Nulidad.
- **Pendiente por la regla nueva: completar Aplicación de Nulidad** de 17
  a hasta 34 preguntas (4 en los 6 subtemas importantes, 2 en los otros
  5), con `lote_aplic2.py` desde `aj-aplic-021`. Laura decide si va antes
  de Detección de error.
- **Siguiente tanda: Nulidad, Detección de error** (`lote_det1.py`,
  tabla `Detección de error`, prefijo `aj-det`, desde `aj-det-004`), con
  el prompt `docs/prompts-practica/deteccion-error.md` y las reglas de
  corrección flexible de `elementos-clave.md`.
- **Alternativas:** se dejan para después de Evaluación (no se habló
  todavía de cómo trabajarlas).
- El borrador del Cap. I (lote 1) y las definiciones de Memorice siguen
  pendientes de decidir (ver "Por acordar").

Si más adelante hacen falta más Flashcards, el lote nuevo va en
`scripts/practica_aj/lote_fc11.py` con el mismo flujo (correr antes
`python3 scripts/tablero_cobertura_aj.py`; verificar, subir sin publicar,
informe, actualizar este archivo). Próximo id libre: `aj-fc-292`.

## Reglas y decisiones que no cambian

- **Tag de materia:** todo el contenido de AJ va con `materia =
  'acto_juridico'` (exacto, es lo que exige `perteneceAMateriaCivil` en
  `app/alternativas.html`). Para Evaluación y Flashcards lo fuerza el
  sync (`BASES_SOLO_PRACTICA` en `scripts/sync_airtable_supabase.py`); no
  usar el valor "Acto jurídico" de la tabla Temas, que la app no
  reconoce. La base de AJ no tiene `Preguntas_Evaluacion`, por eso no va
  en `PREGUNTAS_BASES`.
- **Memorice de definiciones:** texto copiado literal de la definición
  entre comillas del manual (sin la frase que la introduce), `articulo =
  ''`, id `aj-def-NNN`, y en `fuente` el autor si el manual lo nombra
  más la ubicación (ej. "Definición de acto jurídico de VIAL. Manual de
  Acto Jurídico, I.4"). `palabras_criticas` van como palabras sueltas
  (la app las compara palabra por palabra). Los grupos de
  `prioridad_ocultamiento` deben aparecer tal cual en el texto. Laura
  elige qué definiciones entran. Los **artículos** de ley siguen la regla
  de siempre: los manda Laura.
- **Ids:** `aj-aplic-NNN`, `aj-det-NNN`, `aj-just-NNN`, `aj-mc-NNN`,
  `aj-fc-NNN`, `aj-alt-NNN`, `aj-def-NNN`, correlativos. Próximos libres:
  `aj-aplic-021`, `aj-det-004`, `aj-just-004`, `aj-mc-004`, `aj-fc-292`,
  `aj-alt-013`, `aj-def-008`.
- **Todo entra sin publicar** y en Revisar; nunca se marca Verificado sin
  que Laura lo confirme.
- **Posición de la respuesta correcta repartida desde el principio.** Lote
  1: Alternativas con 3 en cada letra; Discriminación MC en A
  (`aj-mc-002`) y D (`aj-mc-003`); el anterior `aj-mc-001` está en C.
- **Distractores no adivinables por descarte.** `aj-alt-010` se reescribió
  por eso (antes sus distractores eran nombres de contratos).
- Cero guiones largos y cero comillas angulares en cualquier campo.
- Cada ítem tiene su cita de respaldo del manual; los artículos citados
  aparecen en ese pasaje.

## Cambios técnicos hechos para AJ (2026-10-07)

- `app/alternativas.html`: Evaluación filtra por materia Civil (antes se
  cortaba para todo lo que no fuera Responsabilidad); la insignia de
  materia muestra "Acto Jurídico" en vez de `acto_juridico`; Memorice
  reconoce las definiciones (`esMemoriceDefinicion()`), no pide número
  de artículo y su insignia dice "Memorice · Definición". Verificado en
  Chrome headless con datos de prueba (10 de 10 chequeos), incluido que
  Responsabilidad y los artículos siguen igual.
- `scripts/sync_airtable_supabase.py`: `BASES_SOLO_PRACTICA` con la base
  de AJ. Probado sin tocar producción (con datos falsos); el sync real
  todavía no se corrió.

## Cobertura del Capítulo I (detalle del lote 1)

Dentro del Cap. I quedan sin contenido I.8.5 (entre vivos y mortis causa)
y I.8.8 (puros y simples y sujetos a modalidad, que se desarrolla en el
Cap. VI). La tabla por subsección está en el informe del lote 1; la
cobertura por tema de todo el manual está en el tablero de arriba.

## Inventario del lote 1 (Cap. I)

| id | Tipo | Subtema | Pregunta |
|---|---|---|---|
| `aj-aplic-002` | Aplicación | Actos de administración y actos de disposición | Clasifique cada una de las tres gestiones según la distinción entre actos de administración y actos de... |
| `aj-aplic-003` | Aplicación | Elementos de la naturaleza y elementos accidentales | Clasifique, según la estructura del acto jurídico, el precio, el plazo para pagar la segunda cuota, la... |
| `aj-det-002` | Detección de error | Convención y contrato; acto unilateral y contrato unilateral | Identifique y corrija los errores de este razonamiento. |
| `aj-det-003` | Detección de error | Requisitos de existencia y de validez | Identifique y corrija los errores de este razonamiento. |
| `aj-just-002` | Justificación | Requisitos de existencia y de validez | ¿Puede un acto jurídico ser inexistente en el derecho chileno? Explique las dos posiciones doctrinales sobre... |
| `aj-just-003` | Justificación | Actos unilaterales, bilaterales y plurilaterales | ¿Por qué el testamento sigue siendo un acto jurídico unilateral, aunque el heredero deba aceptar después la... |
| `aj-mc-002` | Discriminación MC (correcta: A) | Actos unilaterales, bilaterales y plurilaterales | ¿Cómo se clasifica este acto según el número de partes cuya voluntad se requiere para que se forme? |
| `aj-mc-003` | Discriminación MC (correcta: D) | Actos a título gratuito y a título oneroso | ¿Cómo se clasifica este acto, atendiendo al beneficio que reciben las partes? |
| `aj-fc-007` | Flashcard (basica) | I.3 | ¿Qué es un hecho jurídico y en qué se diferencia de un simple hecho material? |
| `aj-fc-008` | Flashcard (intermedia) | I.4 | ¿Qué tres elementos se extraen de la definición de acto jurídico de VIAL? |
| `aj-fc-009` | Flashcard (avanzada) | I.4 | En el ejemplo del ladrón y el comprador, ¿qué distingue el efecto práctico del efecto jurídico? |
| `aj-fc-010` | Flashcard (intermedia) | I.4 c) | ¿Cuáles son las dos causas de los efectos de un acto jurídico? |
| `aj-fc-011` | Flashcard (intermedia) | I.5.2 | ¿Qué consecuencias prácticas se desprenden del principio de la autonomía de la voluntad? |
| `aj-fc-012` | Flashcard (intermedia) | I.5.3 | ¿Cuáles son los límites a la autonomía de la voluntad? |
| `aj-fc-013` | Flashcard (avanzada) | I.5.3 (iv) | ¿Cómo ha descrito la jurisprudencia el orden público? |
| `aj-fc-014` | Flashcard (basica) | I.6.2 | ¿Qué son los elementos de la naturaleza de un acto jurídico? Dé un ejemplo. |
| `aj-fc-015` | Flashcard (basica) | I.6.3 | ¿Qué son los elementos accidentales de un acto jurídico? |
| `aj-fc-016` | Flashcard (intermedia) | I.7.1 | Para la doctrina que distingue existencia y validez, ¿cuáles son los requisitos de existencia y cuáles los de... |
| `aj-fc-017` | Flashcard (intermedia) | I.8.1 (i) | ¿Cómo se subclasifican los actos jurídicos unilaterales? |
| `aj-fc-018` | Flashcard (basica) | I.8.1 (ii) | ¿Qué diferencia a una convención de un contrato? |
| `aj-fc-019` | Flashcard (intermedia) | I.8.2 | ¿Qué rol tiene la voluntad de las partes en los actos de familia, a diferencia de los patrimoniales? |
| `aj-fc-020` | Flashcard (intermedia) | I.8.9 | ¿Qué diferencia a un acto causal de uno abstracto? |
| `aj-fc-021` | Flashcard (intermedia) | I.8.11 | ¿Qué es un acto declarativo y por qué suele operar retroactivamente? |
| `aj-fc-022` | Flashcard (basica) | I.8.12 | ¿Qué diferencia a un acto de ejecución instantánea, uno de ejecución diferida y uno de tracto sucesivo? |
| `aj-alt-001` | Alternativa (correcta: B, nivel 2) | La teoría del acto jurídico en el Código Civil | ¿Cómo trata el Código Civil chileno la teoría general del acto jurídico? |
| `aj-alt-002` | Alternativa (correcta: D, nivel 2) | Los hechos jurídicos | Un delito civil, como el daño causado dolosamente a una cosa ajena, ¿es un acto jurídico? |
| `aj-alt-003` | Alternativa (correcta: C, nivel 4) | Concepto de acto jurídico | Respecto del propósito que debe perseguir la manifestación de voluntad en el acto jurídico, ¿qué sostiene... |
| `aj-alt-004` | Alternativa (correcta: B, nivel 2) | Consecuencias de la autonomía de la voluntad | Según el art. 12, ¿cuándo puede renunciarse un derecho? |
| `aj-alt-005` | Alternativa (correcta: A, nivel 3) | Limitaciones a la autonomía de la voluntad | En la compraventa de cosa ajena (art. 1815), ¿qué efecto tiene el acto respecto del verdadero dueño de la... |
| `aj-alt-006` | Alternativa (correcta: D, nivel 3) | Limitaciones a la autonomía de la voluntad | ¿Cómo describe la doctrina las buenas costumbres, como límite a la autonomía de la voluntad? |
| `aj-alt-007` | Alternativa (correcta: B, nivel 3) | Elementos o cosas accidentales | ¿Puede un elemento accidental afectar la existencia misma del acto jurídico, y no solo su eficacia? |
| `aj-alt-008` | Alternativa (correcta: C, nivel 3) | Actos solemnes y actos no solemnes | Si las partes pactan una solemnidad que la ley no exige (solemnidad voluntaria) y luego la omiten, ¿qué... |
| `aj-alt-009` | Alternativa (correcta: C, nivel 3) | Actos unilaterales, bilaterales y plurilaterales | ¿Desde qué momento se vuelve irrevocable un acto jurídico unilateral recepticio, como el ejercicio de una... |
| `aj-alt-010` | Alternativa (correcta: D, nivel 3) | Actos unilaterales, bilaterales y plurilaterales | ¿Cuál de las siguientes afirmaciones sobre convenciones y contratos es correcta? |
| `aj-alt-011` | Alternativa (correcta: A, nivel 3) | Actos principales y actos accesorios | ¿Puede un acto accesorio existir antes que el acto principal? |
| `aj-alt-012` | Alternativa (correcta: A, nivel 3) | Actos típicos y actos atípicos | ¿Qué decide que un acto jurídico sea típico o nominado? |
| `aj-def-001` | Memorice definición | Concepto de acto jurídico | I.4 |
| `aj-def-002` | Memorice definición | Concepto de consentimiento | II.A.3.2 |
| `aj-def-003` | Memorice definición | Concepto de dolo | II.A.6.1 |
| `aj-def-004` | Memorice definición | Concepto de fuerza | II.A.7.1 |
| `aj-def-005` | Memorice definición | Concepto de capacidad | II.B.1 |
| `aj-def-006` | Memorice definición | Concepto de objeto ilícito | II.C.4 |
| `aj-def-007` | Memorice definición | Concepto de nulidad | IV.B.1.2 |
