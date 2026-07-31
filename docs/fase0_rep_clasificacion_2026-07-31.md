# Fase 0 REP: clasificación por eje de Evaluación de Precontractual (2026-07-31)

> Fase 0 del plan "llevar Evaluación a su techo por tema/subtema" (REX → REC
> → REP, ver `docs/camino-a-beta.md`), análoga a la que ya se hizo para
> Extracontractual el 2026-07-30 (`docs/cobertura_subtema_rex_2026-07-30.md`)
> y para Contractual hoy mismo (`docs/fase0_rec_clasificacion_2026-07-31.md`).
> Este doc cubre solo el paso de clasificación (linkear cada ítem de
> Evaluación de Precontractual a su eje real vía el campo `tema`), no la
> tabla de cobertura completa por tipo, eso es Fase 1, un paso posterior.
> **Nada de esto se aplicó a Supabase**: es una propuesta para que Laura la
> revise y, si la aprueba, corra los `UPDATE` del final en el SQL Editor.

## A diferencia de Contractual, acá el manual sí calza 1:1 con Airtable

La consigna de esta sesión avisaba que no había que asumir que el catálogo
de Airtable calzara letra por letra con las secciones del manual, porque en
Contractual no calzó (8 secciones con sub-numeración interna que reiniciaba
en cada una, catálogo real de 21 ejes viviendo solo en Airtable). Se abrió
igual `03_Responsabilidad_Precontractual_Manual.html` completo (1304
líneas, 10 secciones `<h1>`) para comprobarlo en vez de asumirlo, y acá **sí
hay match exacto, 1:1, entre los 10 registros de la tabla `Temas` de
Airtable** (`Digesto Precontractual`, `baseId appeZI0TkAC3uaeVW`) **y los 10
`<h1>` del manual**, letra por letra:

| # | `Temas.nombre` (Airtable) | `<h1>` del manual | ¿Coincide? |
|---|---|---|---|
| 1 | A. Planteamiento del problema y concepto de responsabilidad precontractual | idéntico (`id="eje1"`) | Sí |
| 2 | B. Evolución doctrinaria: de la doctrina tradicional a la doctrina moderna | idéntico (`id="eje2"`) | Sí |
| 3 | C. Las etapas del proceso de formación del contrato y el estatuto de responsabilidad aplicable en cada una | idéntico (`id="eje3"`) | Sí |
| 4 | D. El interés jurídicamente protegido y el fundamento de la buena fe | idéntico (`id="eje4"`) | Sí |
| 5 | E. Naturaleza jurídica de la responsabilidad precontractual | idéntico (`id="eje5"`) | Sí |
| 6 | F. Determinación de los daños a resarcir en la responsabilidad precontractual | idéntico (`id="eje6"`) | Sí |
| 7 | G. Los requisitos para que nazca el derecho a la reparación y su aplicación jurisprudencial | idéntico (`id="eje7"`) | Sí |
| 8 | H. La responsabilidad de quien causa la nulidad del contrato | idéntico (`id="eje8"`) | Sí |
| 9 | I. La responsabilidad postcontractual | idéntico (`id="eje9"`) | Sí |
| 10 | J. La responsabilidad precontractual en el derecho comparado y síntesis general de la materia | idéntico (`id="eje10"`) | Sí |

Dentro de cada eje hay sub-numeración `<h2>1.</h2>`, `<h2>2.</h2>`... que sí
reinicia en cada sección (igual que en Contractual), pero eso no genera el
problema que hubo en Contractual porque acá la granularidad de `tema` es el
eje completo (el `<h1>`), no el sub-numeral: la sub-numeración solo sirvió
como evidencia interna para ubicar el pasaje exacto que respalda cada ítem,
nunca como parte del string que se escribe en `tema`.

**Hallazgo que sí conviene dejar anotado, porque sin él el próximo sync se
rompe:** el índice (`<div class="toc">`, líneas 297-311) usa **títulos
acortados** para tres ejes, distintos del `<h1>` real y del nombre en
Airtable:

- Índice dice "C. Las etapas del proceso de formación del contrato";
  el `<h1>` y Airtable dicen "...y el estatuto de responsabilidad aplicable
  en cada una".
- Índice dice "F. Determinación de los daños a resarcir"; el `<h1>` y
  Airtable agregan "...en la responsabilidad precontractual".
- Índice dice "J. Derecho comparado y síntesis general de la materia"; el
  `<h1>` y Airtable dicen "J. La responsabilidad precontractual en el
  derecho comparado y síntesis general de la materia".

Si alguien copia el `tema` desde el índice en vez del `<h1>`, el string no
existe en `Temas` (campo de link en Airtable) y rompe en el próximo
`sync_airtable_supabase.py`. Por eso las 59 sentencias `UPDATE` de más
abajo se generaron con un script a partir del JSON de la API de Airtable
(`Temas`), nunca tipeadas a mano ni copiadas del índice del manual.

## Aritmética de partida

60 filas totales en `evaluacion_practica` con `materia = 'Responsabilidad
precontractual'`, confirmado por consulta directa a Supabase
(`select codigo,tipo,subtema,caso,enunciado,articulos_referencia,tema`).
Las 60 tenían `tema = null`: nadie había hecho Fase 0 de esta materia
todavía (a diferencia de Contractual, que ya traía 8 filas `hist-` con
`tema` real). De esas 60:

- **59 se clasifican con confianza** en este documento.
- **1 queda sin clasificar con confianza** (`hist-pre-mc-015`, ver sección
  propia): es genuinamente ambiguo entre dos ejes, no un caso de "materia
  equivocada" como los que aparecieron en REX/REC.

59 + 1 = 60. Cuadra con lo medido en vivo el 2026-07-31.

## Verificación cruzada por estructura de los códigos (independiente de la lectura del manual)

Los 60 códigos se descomponen en cuatro series de 10 (`pre-aplic-001..010`,
`pre-detect-001..010`, `pre-just-001..010`, `pre-mc-001..010`) más
`hist-pre-mc-001..020`. Antes de cerrar la clasificación se comprobó que,
para las 40 filas sin prefijo `hist-`, **el sufijo N coincide exactamente
con el eje N** (A=1...J=10) en el 100% de los casos según la clasificación
de contenido hecha manual por manual (`pre-aplic-005`→E, `pre-just-003`→C,
`pre-detect-008`→H, `pre-mc-010`→J, etc.). Esto no se usó para clasificar
(la clasificación es por contenido, contra el pasaje real del manual), pero
sirve como confirmación independiente de que la lectura no se desvió.

De las 20 filas `hist-`, 10 son gemelas de subtema exacto de la serie
`pre-mc-00N` (mismo `subtema`, un caso con contexto narrativo y el otro sin
él): `hist-010`↔`pre-mc-001`, `hist-019`↔`002`, `hist-011`↔`003`,
`hist-012`↔`004`, `hist-005`↔`005`, `hist-007`↔`006`, `hist-003`↔`007`,
`hist-009`↔`008`, `hist-016`↔`009`, `hist-020`↔`010` — un gemelo por eje,
consistente con la tabla de conteo final. Las 10 `hist-` restantes
(`001,002,004,006,008,013,014,015,017,018`) también resultan, según el
contenido, una por eje: A(`001`), C(`008`), D(`018`), E(`017`), F(`004`),
G(`006`), H(`014`), I(`013`), J(`002`) — cubriendo 9 de los 10 ejes y
dejando **B sin ningún ítem `hist-` de este subgrupo**. `hist-pre-mc-015`
es la décima fila de este subgrupo, y es precisamente el ítem que no se
pudo cerrar con confianza (ver abajo): el patrón estructural (llenar el
hueco en B) apunta a un eje distinto del que sugiere, a primera lectura, el
contenido literal de la pregunta (que apunta a J). No se resolvió el
empate adivinando; se dejó marcado.

## Tabla de clasificación (59 ítems con confianza)

| Código | Tipo | Subtema actual | Eje propuesto | Respaldo en el manual |
|---|---|---|---|---|
| pre-just-001 | justificación | Las cuatro interrogantes centrales de Orrego | A. Planteamiento del problema y concepto de responsabilidad precontractual | Eje 1 §2 (línea 350-352): "ORREGO sintetiza el programa completo... en cuatro preguntas... naturaleza... factor de atribución... momento en que ha comenzado el período precontractual... cuál es el daño indemnizable" |
| pre-aplic-001 | aplicación | Los tres elementos copulativos de la responsabilidad precontractual | A. Planteamiento del problema y concepto de responsabilidad precontractual | Eje 1, callout "Distinción fundamental" (línea 336-340): "los tres elementos que sí la generan, siempre copulativos, son: un daño efectivo, una expectativa razonable creada por la conducta de la contraparte, y una conducta que defrauda esa expectativa concreta" |
| pre-detect-001 | detección de error | Qué NO protege la responsabilidad precontractual | A. Planteamiento del problema y concepto de responsabilidad precontractual | mismo callout que el ítem anterior (línea 336-340): "No hay responsabilidad por el solo hecho de que la negociación no llegue a puerto" |
| pre-mc-001 | discriminación MC | Vacío legal en los tratos negociales previos vs. regulación parcial de la oferta | A. Planteamiento del problema y concepto de responsabilidad precontractual | Eje 1, línea 322: "el Código Civil chileno no se ocupa de la formación del consentimiento, salvo en lo relativo al contrato de promesa (artículo 1554)... las normas [arts. 97 a 106 C. Comercio]... parten todas del supuesto de que ya se ha formulado una oferta" |
| hist-pre-mc-010 | discriminación MC | Vacío legal: tratos previos vs. regulación parcial de la oferta | A. Planteamiento del problema y concepto de responsabilidad precontractual | gemelo de `pre-mc-001`, mismo pasaje (línea 322), cita además arts. 97 y 106 |
| hist-pre-mc-001 | discriminación MC | Las dos grandes etapas y el cambio de naturaleza jurídica con la oferta | A. Planteamiento del problema y concepto de responsabilidad precontractual | Eje 1 §3, título literal "Las dos grandes etapas del período precontractual" (línea 360); línea 362 responde directamente la pregunta: "momento en que... cambia radicalmente la naturaleza jurídica de la relación entre los partícipes: de hechos jurídicos sin fuerza obligatoria se pasa a un acto jurídico unilateral con vocación de generar el contrato". El Eje 3 desarrolla el mismo cambio con más detalle (línea 529), pero el título de esa sección ("La oferta") no coincide con el subtema del ítem ("las dos grandes etapas"), que sí es el título literal del Eje 1 §3; se prefirió el eje cuyo título calza, igual que la regla de desempate usada en REC |
| hist-pre-mc-019 | discriminación MC | Saleilles: extensión del resarcimiento cuando la oferta fue emitida con plazo | B. Evolución doctrinaria: de la doctrina tradicional a la doctrina moderna | Eje 2 §4 (línea 433): "si la oferta fue emitida y el oferente se comprometió a mantenerla dentro de un plazo, revocándola antes de su vencimiento, SALEILLES admite en ciertos casos que el aceptante pueda exigir el cumplimiento efectivo de la prestación" |
| pre-mc-002 | discriminación MC | Saleilles: extensión del resarcimiento cuando la oferta fue emitida con plazo | B. Evolución doctrinaria: de la doctrina tradicional a la doctrina moderna | gemelo de `hist-pre-mc-019`, mismo pasaje (línea 433) |
| pre-aplic-002 | aplicación | Ihering (culpa) vs. Faggella (transgresión del acuerdo de negociar) | B. Evolución doctrinaria: de la doctrina tradicional a la doctrina moderna | Eje 2 §3 (línea 425): "el fundamento de esa responsabilidad, insiste FAGGELLA, no es la culpa, como sostenía IHERING, sino la violación del acuerdo expreso o tácito... Esta violación puede existir sin dolo ni negligencia" |
| pre-detect-002 | detección de error | Los postulados de Ihering: presupone oferta y es de naturaleza contractual | B. Evolución doctrinaria: de la doctrina tradicional a la doctrina moderna | Eje 2 §2 (línea 395): "primero, la culpa in contrahendo presupone que ya se ha formulado una oferta (las meras tratativas, para IHERING, no originan responsabilidad); segundo, se trata de una responsabilidad de naturaleza contractual" |
| pre-just-002 | justificación | Por qué Ihering funda la culpa in contrahendo en la esfera contractual, y las críticas recibidas | B. Evolución doctrinaria: de la doctrina tradicional a la doctrina moderna | Eje 2 (líneas 409 y 415): fundamento contractual porque descarta actio de dolo y actio legis Aquiliae; las dos críticas ("de los propios textos romanos... se desprende que la responsabilidad debía entenderse extracontractual" y "en los casos... hay dolo y no simple culpa") |
| hist-pre-mc-011 | discriminación MC | Cierre de negocio vs. arras: el tercero depositario | C. Las etapas del proceso de formación del contrato y el estatuto de responsabilidad aplicable en cada una | Eje 3 §3, callout "cierre de negocio vs. arras" (línea 543-547): "el elemento que decide la calificación no es el monto ni el momento, sino la presencia o ausencia de ese tercero depositario" |
| pre-mc-003 | discriminación MC | Cierre de negocio vs. arras: el tercero depositario | C. Las etapas del proceso de formación del contrato y el estatuto de responsabilidad aplicable en cada una | gemelo de `hist-pre-mc-011`, mismo callout |
| pre-aplic-003 | aplicación | Retractación tempestiva de la oferta (art. 100 C. de Comercio) | C. Las etapas del proceso de formación del contrato y el estatuto de responsabilidad aplicable en cada una | Eje 3, dato-grado "las cinco etapas y su estatuto de responsabilidad" (línea 573-586): "Oferta: Extracontractual... o legal (retractación tempestiva con daño), Arts. 98 y 100 C. de Comercio" |
| pre-detect-003 | detección de error | No confundir formación progresiva con ejecución progresiva | C. Las etapas del proceso de formación del contrato y el estatuto de responsabilidad aplicable en cada una | Eje 3, warn box (línea 497-501): "Contrato de formación progresiva: lo que se prolonga es el camino hacia que el contrato nazca... Contrato de ejecución progresiva: el contrato ya nació, y lo que se prolonga es su cumplimiento" |
| pre-just-003 | justificación | No existe una naturaleza jurídica única de la responsabilidad precontractual | C. Las etapas del proceso de formación del contrato y el estatuto de responsabilidad aplicable en cada una | Eje 3 §6 (línea 596): "la pregunta correcta no es '¿qué estatuto rige la responsabilidad precontractual?', sino '¿en qué etapa exacta del itinerario se produjo el daño, y existía ya, en ese punto, algún vínculo convencional entre las partes?'" |
| hist-pre-mc-008 | discriminación MC | Las cinco etapas del itinerario de formación del contrato | C. Las etapas del proceso de formación del contrato y el estatuto de responsabilidad aplicable en cada una | Eje 3, línea 493: "Estas etapas son los tratos negociales previos... la oferta, el cierre de negocio, el contrato preparatorio y el contrato definitivo" |
| pre-just-004 | justificación | Por qué se exige siempre un elemento adicional a la sola ruptura de la negociación | D. El interés jurídicamente protegido y el fundamento de la buena fe | Eje 4 §4 (línea 667): "la doctrina... insiste en que la sola ruptura no basta, y exige siempre un elemento adicional de arbitrariedad, intempestividad o transgresión de una confianza específicamente generada" |
| hist-pre-mc-018 | discriminación MC | La tensión de fondo: buena fe como estándar objetivo frente al riesgo de desincentivar la negociación | D. El interés jurídicamente protegido y el fundamento de la buena fe | mismo pasaje que `pre-just-004`, Eje 4 §4 (línea 665-671) |
| pre-aplic-004 | aplicación | El deber positivo de no ocultar hechos determinantes conocidos | D. El interés jurídicamente protegido y el fundamento de la buena fe | Eje 4, ejemplo "Un deber positivo incumplido" (línea 657-661): venta de terreno contaminado, "incumplió el deber positivo de no ocultar un hecho que conocía y que era determinante para la decisión de la contraparte" |
| hist-pre-mc-012 | discriminación MC | El catálogo de Saavedra: deberes negativos y positivos | D. El interés jurídicamente protegido y el fundamento de la buena fe | Eje 4, dato-grado (línea 649-653): "Deberes negativos (no dañar)... Deberes positivos (actuar): estar debidamente facultado para negociar... respetar los acuerdos de confidencialidad..." |
| pre-mc-004 | discriminación MC | El catálogo de buena fe de Saavedra: deberes negativos y positivos | D. El interés jurídicamente protegido y el fundamento de la buena fe | gemelo de `hist-pre-mc-012`, mismo dato-grado |
| pre-detect-004 | detección de error | No se protege el interés en la celebración del contrato | D. El interés jurídicamente protegido y el fundamento de la buena fe | Eje 4 §1, callout "qué protege la responsabilidad precontractual" (línea 627-631): "NO protege el interés en que el contrato se celebre (las partes siempre son libres de no contratar). SÍ protege el interés en participar correcta y lealmente en el proceso de negociación" |
| pre-aplic-005 | aplicación | La posición de Alessandri: distingo según el momento | E. Naturaleza jurídica de la responsabilidad precontractual | Eje 5 §2, título idéntico "La posición de ALESSANDRI: un distingo según el momento" (línea 700), callout (línea 708-712): "Antes de la oferta: extracontractual... Después de la oferta: contractual, pero no porque haya nacido un contrato, sino porque la ley impone directamente la responsabilidad (arts. 98 y 100 C. de Comercio)" |
| hist-pre-mc-017 | discriminación MC | Las cinco tesis sobre naturaleza jurídica y su punto débil respectivo | E. Naturaleza jurídica de la responsabilidad precontractual | Eje 5, dato-grado "las cinco tesis sobre naturaleza jurídica" (línea 770-783) |
| pre-detect-005 | detección de error | El límite de la tesis del abuso del derecho durante las tratativas | E. Naturaleza jurídica de la responsabilidad precontractual | Eje 5 §3 (línea 724): "se le objeta que no explica adecuadamente el funcionamiento de la responsabilidad durante las tratativas, porque en esa etapa las partes no tienen, la una respecto de la otra, ningún derecho propiamente tal" |
| pre-just-005 | justificación | Por qué la tesis extracontractual explica mejor el mayor número de casos, y su punto débil | E. Naturaleza jurídica de la responsabilidad precontractual | Eje 5 §5 (línea 795): "La tesis extracontractual... es la que mejor explica el mayor número de casos... pero su punto débil... es explicar por qué la culpa precontractual... no es simplemente la misma culpa aquiliana que rige entre extraños" |
| hist-pre-mc-005 | discriminación MC | El doble fundamento de Boffi: declaración unilateral de voluntad vs. aquiliana | E. Naturaleza jurídica de la responsabilidad precontractual | Eje 5 §3 (línea 732): "Si el oferente se comprometió expresamente a mantener su oferta... se está ante un caso claro de declaración unilateral de voluntad... Si, en cambio, el oferente no asumió ese compromiso expreso... el fundamento debe buscarse en la responsabilidad aquiliana [art. 2314]" (artículos_referencia 99, 2314 coinciden con este pasaje, no con el de Boffi sobre nulidad del Eje 8, que cita arts. 1056 argentino/1687 CC) |
| pre-mc-005 | discriminación MC | El doble fundamento de Boffi: declaración unilateral de voluntad vs. responsabilidad aquiliana | E. Naturaleza jurídica de la responsabilidad precontractual | gemelo de `hist-pre-mc-005`, mismo pasaje y mismos artículos (99, 2314) |
| hist-pre-mc-007 | discriminación MC | Regla categórica (Faggella/Saleilles) vs. causalidad adecuada (Brebbia) | F. Determinación de los daños a resarcir en la responsabilidad precontractual | Eje 6 §4 (línea 887-889): "FAGGELLA, SALEILLES y la doctrina chilena tradicional resuelven este problema con una regla categórica... BREBBIA, en cambio, resuelve el mismo problema... con el instrumento general de la causalidad adecuada" |
| pre-mc-006 | discriminación MC | Regla categórica (Faggella/Saleilles) vs. causalidad adecuada (Brebbia) tras la oferta | F. Determinación de los daños a resarcir en la responsabilidad precontractual | gemelo de `hist-pre-mc-007`, mismo pasaje |
| pre-aplic-006 | aplicación | La causalidad adecuada de Brebbia según la etapa del daño | F. Determinación de los daños a resarcir en la responsabilidad precontractual | Eje 6 §3, callout (línea 867-871): "Antes de la oferta: solo daño emergente... Después de la oferta: daño emergente y lucro cesante" |
| pre-detect-006 | detección de error | La exclusión tradicional del lucro cesante en sede precontractual | F. Determinación de los daños a resarcir en la responsabilidad precontractual | Eje 6, warn box "Ojo con el error típico de examen" (línea 851-855): "En Chile, la posición tradicional (LEÓN HURTADO, ROSENDE) excluye siempre el lucro cesante en sede precontractual" |
| pre-just-006 | justificación | La distinción de Ihering entre interés positivo e interés negativo | F. Determinación de los daños a resarcir en la responsabilidad precontractual | Eje 6 §1 (línea 826-830): distinción interés positivo/negativo y falta de claridad de Ihering sobre si el interés negativo incluye lucro cesante |
| hist-pre-mc-004 | discriminación MC | Ejemplo aplicado del criterio de Brebbia (mismo negocio, dos momentos) | F. Determinación de los daños a resarcir en la responsabilidad precontractual | Eje 6, ejemplo "Mismo negocio, dos momentos distintos" (línea 877-881), caso de la distribuidora y el fabricante extranjero |
| hist-pre-mc-003 | discriminación MC | Imputabilidad del retiro: instrucciones del comprador vs. redacción de la corredora | G. Los requisitos para que nazca el derecho a la reparación y su aplicación jurisprudencial | Eje 7 §5-6, caso Lavín con Mena (línea 991): "el tribunal estableció, a partir de la prueba rendida, que los cambios incorporados a la oferta original no obedecieron a la autoría de la corredora, sino a instrucciones expresas recibidas del propio demandado" |
| pre-mc-007 | discriminación MC | Imputabilidad del retiro: instrucciones del comprador vs. redacción de la corredora | G. Los requisitos para que nazca el derecho a la reparación y su aplicación jurisprudencial | gemelo de `hist-pre-mc-003`, mismo pasaje |
| hist-pre-mc-006 | discriminación MC | Comparación de los tres catálogos: Saavedra, Celis y el fallo judicial | G. Los requisitos para que nazca el derecho a la reparación y su aplicación jurisprudencial | Eje 7, dato-grado "tres catálogos de requisitos, un mismo terreno" (línea 942-955) |
| pre-aplic-007 | aplicación | Los cuatro requisitos de Celis: la conexión causal con la conducta de la contraparte | G. Los requisitos para que nazca el derecho a la reparación y su aplicación jurisprudencial | Eje 7 §2 (línea 932-934): "que los gastos... se hayan ocasionado a consecuencia de la conducta desplegada por la otra parte... que el tribunal pondere si los gastos incurridos forman o no parte de los riesgos ordinarios del negocio" |
| pre-detect-007 | detección de error | La calificación aquiliana en el caso Lavín con Mena | G. Los requisitos para que nazca el derecho a la reparación y su aplicación jurisprudencial | Eje 7 §4 (línea 979): "el tribunal concluye... que en el sistema jurídico chileno el régimen aplicable... es el de la responsabilidad aquiliana... invocando... arts. 2284, 2314 y 2329" |
| pre-just-007 | justificación | La dificultad real: la prueba de la imputabilidad, no la formulación abstracta de los requisitos | G. Los requisitos para que nazca el derecho a la reparación y su aplicación jurisprudencial | Eje 7 §6, callout "la clave probatoria, no la doctrinaria" (línea 1009-1013) |
| hist-pre-mc-009 | discriminación MC | La responsabilidad legal de Rodríguez Grez en la nulidad matrimonial | H. La responsabilidad de quien causa la nulidad del contrato | Eje 8 §3 (línea 1062-1068): "RODRÍGUEZ GREZ sostiene que se trata de una responsabilidad de naturaleza legal... a propósito de la Ley de Matrimonio Civil" |
| pre-mc-008 | discriminación MC | La responsabilidad legal de Rodríguez Grez en la nulidad matrimonial | H. La responsabilidad de quien causa la nulidad del contrato | gemelo de `hist-pre-mc-009`, mismo pasaje |
| pre-aplic-008 | aplicación | La nulidad no convierte esta responsabilidad en contractual (Baraona) | H. La responsabilidad de quien causa la nulidad del contrato | Eje 8 §4 (línea 1080-1082): "la responsabilidad por la nulidad del contrato es, en lo fundamental, de naturaleza extracontractual, aunque con una precisión importante... valorar la culpa... considerando criterios de buena o mala fe" |
| hist-pre-mc-014 | discriminación MC | Tres posiciones sobre la responsabilidad por nulidad | H. La responsabilidad de quien causa la nulidad del contrato | Eje 8, dato-grado "tres posiciones sobre la responsabilidad por nulidad" (línea 1096-1107) |
| pre-detect-008 | detección de error | Trampa típica de examen: la apariencia de contrato no vuelve esta responsabilidad contractual | H. La responsabilidad de quien causa la nulidad del contrato | Eje 8, warn box "Trampa típica de examen" (línea 1056-1060) |
| pre-just-008 | justificación | La responsabilidad por nulidad no es una categoría autónoma | H. La responsabilidad de quien causa la nulidad del contrato | Eje 8 §6 (línea 1121): "la responsabilidad por nulidad del contrato no es una categoría autónoma y distinta de la responsabilidad precontractual en sentido estricto, sino una de sus manifestaciones" |
| pre-aplic-009 | aplicación | La salvedad de Corral: la conservación forzada del contrato | I. La responsabilidad postcontractual | Eje 9 §2, dato-grado "la salvedad de CORRAL" (línea 1168-1172): "si la ley sanciona el término abusivo del contrato disponiendo que este se conserva vigente... entonces no hay 'postcontrato' en absoluto: el contrato sigue vivo, y la responsabilidad... sigue siendo contractual" |
| pre-detect-009 | detección de error | La salvedad de Corral no es una regla absoluta | I. La responsabilidad postcontractual | mismo pasaje que `pre-aplic-009`, Eje 9 §2 (línea 1164-1172) |
| pre-just-009 | justificación | La responsabilidad postcontractual como imagen especular de la precontractual | I. La responsabilidad postcontractual | Eje 9, línea 1144 ("su imagen especular") y §3 completo (línea 1174-1188), análisis del paralelismo entre los tres supuestos |
| hist-pre-mc-013 | discriminación MC | El paralelismo con la responsabilidad por nulidad del contrato | I. La responsabilidad postcontractual | mismo pasaje que `pre-just-009`, Eje 9 §3 (línea 1176-1188): "en los tres casos, la doctrina chilena tiende a preferir, como solución residual, la calificación extracontractual" |
| pre-mc-009 | discriminación MC | Proyección contractual vs. tesis extracontractual de Corral | I. La responsabilidad postcontractual | Eje 9 §1-2 (línea 1156-1166): tesis de la proyección contractual vs. tesis extracontractual de CORRAL |
| hist-pre-mc-016 | discriminación MC | Proyección contractual vs. tesis extracontractual de Corral | I. La responsabilidad postcontractual | gemelo de `pre-mc-009`, mismo pasaje |
| hist-pre-mc-020 | discriminación MC | Artículos 1337 y 1338 del Código Civil italiano: dos supuestos distintos | J. La responsabilidad precontractual en el derecho comparado y síntesis general de la materia | Eje 10 §1 (línea 1215-1217): art. 1337 (cláusula general de buena fe en los tratos) vs. art. 1338 (nulidad por causa conocida y no revelada) |
| pre-mc-010 | discriminación MC | Artículos 1337 y 1338 del Código Civil italiano: dos supuestos distintos | J. La responsabilidad precontractual en el derecho comparado y síntesis general de la materia | gemelo de `hist-pre-mc-020`, mismo pasaje |
| hist-pre-mc-002 | discriminación MC | La conclusión para cerrar el examen | J. La responsabilidad precontractual en el derecho comparado y síntesis general de la materia | Eje 10, callout con ese título literal, "La conclusión para cerrar el examen" (línea 1277-1281) |
| pre-aplic-010 | aplicación | La gradación del artículo 6 del Anteproyecto de Pavía | J. La responsabilidad precontractual en el derecho comparado y síntesis general de la materia | Eje 10 §3 (línea 1231): "si en el curso de los tratos las partes ya han examinado los elementos esenciales del contrato... aquella que suscite en la otra una confianza razonable... obra en contra de la buena fe desde que interrumpe los tratos sin motivo justificado" |
| pre-detect-010 | detección de error | El BGB alemán no tiene una cláusula general de buena fe negocial | J. La responsabilidad precontractual en el derecho comparado y síntesis general de la materia | Eje 10 §4-5 (línea 1251, 1262): "a diferencia de los códigos italiano y portugués, el legislador alemán no formuló una cláusula general de buena fe negocial... optó por regular, de manera fragmentaria, ciertos supuestos específicos" |
| pre-just-010 | justificación | La buena fe negocial como exigencia estructural, más allá de la técnica legislativa | J. La responsabilidad precontractual en el derecho comparado y síntesis general de la materia | Eje 10 §5 (línea 1275): "la convergencia de resultados, pese a la divergencia de técnicas... es quizás la mejor prueba de que la buena fe negocial... expresa una exigencia estructural de todo sistema jurídico" |

## 1 ítem sin clasificar con confianza: `hist-pre-mc-015`

**Código:** `hist-pre-mc-015` | **Tipo:** discriminación MC | **Subtema:**
"Recepción parcial de Ihering en el BGB alemán" | **Enunciado:** "¿Cómo
recibió el Código Civil alemán (BGB) de 1900 la tesis de Ihering sobre la
culpa in contrahendo?"

Es un ítem genuinamente partido entre dos ejes, con evidencia real para
cada uno, no un caso de materia equivocada como los que aparecieron en
REX/REC:

- **A favor del Eje J** (derecho comparado y síntesis, donde vive el
  contenido sustantivo): el Eje 10 §4 (línea 1247-1251) es el que explica
  *cómo* fue esa recepción en detalle: "El parágrafo 122 dispone la
  reparación de daños y perjuicios en los casos de declaraciones de
  voluntad nulas... (recepción directa, y bastante fiel, del interés
  negativo de IHERING)... a diferencia de los códigos italiano y
  portugués, el legislador alemán no formuló una cláusula general de buena
  fe negocial". Es la sección cuyo tema es literalmente "derecho
  comparado", y el ítem pregunta por derecho comparado.
- **A favor del Eje B** (evolución doctrinaria, donde vive Ihering): el
  propio Eje 2 §2 (línea 415) es el que primero menciona el punto, como
  antesala directa de la pregunta: "Su tesis tuvo una recepción parcial en
  el Código Civil alemán de 1900 (BGB), **como se examinará en el Eje
  10**". Además, la verificación cruzada por estructura de códigos (ver
  sección arriba) deja a B como el único eje sin ningún ítem `hist-` en el
  subgrupo de 10 que por lo demás cubre uno por eje exactamente
  (A,C,D,E,F,G,H,I,J ya están cada uno con un `hist-` de ese subgrupo;
  falta B), lo que sugiere que este ítem fue pensado como el ítem de
  Ihering/B de esa tanda, con el detalle del BGB usado como contraste
  dentro del estudio de Ihering, no como pregunta de derecho comparado
  propiamente tal.

Ambas lecturas son defendibles y el contenido de la pregunta (que solo
pide "cómo recibió el BGB a Ihering", sin pedir comparar con Italia,
Portugal o Pavía) no fuerza una de las dos. **No se adivinó**: se deja acá
para que Laura decida, con `pre-detect-010` ya cubriendo, de forma
independiente, el punto "BGB no tiene cláusula general de buena fe" dentro
del Eje J, por si ese dato influye en la decisión (si `hist-pre-mc-015`
también fuera a J, J quedaría con dos ítems sobre el BGB y B sin ninguno de
este subgrupo).

## Statements SQL (59 ítems, listos para el SQL Editor de Supabase)

Generados por script a partir del JSON devuelto por la API de Airtable
(`Temas` de `Digesto Precontractual`, no tipeados a mano ni copiados del
índice del manual, por el hallazgo de títulos acortados explicado arriba).
Cada string se verificó programáticamente contra el conjunto de `nombre`
reales antes de emitirse. **No ejecutados por Claude** (los `UPDATE` a esta
tabla en producción están bloqueados por el modo automático, y de todas
formas el proceso de este proyecto exige revisión de Laura antes de
aplicar). `hist-pre-mc-015` no tiene sentencia: queda pendiente de la
decisión de la sección anterior.

```sql
update public.evaluacion_practica set tema = 'G. Los requisitos para que nazca el derecho a la reparación y su aplicación jurisprudencial' where codigo = 'hist-pre-mc-003';
update public.evaluacion_practica set tema = 'C. Las etapas del proceso de formación del contrato y el estatuto de responsabilidad aplicable en cada una' where codigo = 'hist-pre-mc-011';
update public.evaluacion_practica set tema = 'J. La responsabilidad precontractual en el derecho comparado y síntesis general de la materia' where codigo = 'hist-pre-mc-002';
update public.evaluacion_practica set tema = 'D. El interés jurídicamente protegido y el fundamento de la buena fe' where codigo = 'pre-just-004';
update public.evaluacion_practica set tema = 'F. Determinación de los daños a resarcir en la responsabilidad precontractual' where codigo = 'hist-pre-mc-007';
update public.evaluacion_practica set tema = 'B. Evolución doctrinaria: de la doctrina tradicional a la doctrina moderna' where codigo = 'hist-pre-mc-019';
update public.evaluacion_practica set tema = 'J. La responsabilidad precontractual en el derecho comparado y síntesis general de la materia' where codigo = 'hist-pre-mc-020';
update public.evaluacion_practica set tema = 'I. La responsabilidad postcontractual' where codigo = 'pre-aplic-009';
update public.evaluacion_practica set tema = 'E. Naturaleza jurídica de la responsabilidad precontractual' where codigo = 'pre-aplic-005';
update public.evaluacion_practica set tema = 'A. Planteamiento del problema y concepto de responsabilidad precontractual' where codigo = 'pre-just-001';
update public.evaluacion_practica set tema = 'C. Las etapas del proceso de formación del contrato y el estatuto de responsabilidad aplicable en cada una' where codigo = 'pre-aplic-003';
update public.evaluacion_practica set tema = 'D. El interés jurídicamente protegido y el fundamento de la buena fe' where codigo = 'hist-pre-mc-018';
update public.evaluacion_practica set tema = 'I. La responsabilidad postcontractual' where codigo = 'pre-just-009';
update public.evaluacion_practica set tema = 'G. Los requisitos para que nazca el derecho a la reparación y su aplicación jurisprudencial' where codigo = 'hist-pre-mc-006';
update public.evaluacion_practica set tema = 'E. Naturaleza jurídica de la responsabilidad precontractual' where codigo = 'hist-pre-mc-017';
update public.evaluacion_practica set tema = 'H. La responsabilidad de quien causa la nulidad del contrato' where codigo = 'hist-pre-mc-009';
update public.evaluacion_practica set tema = 'B. Evolución doctrinaria: de la doctrina tradicional a la doctrina moderna' where codigo = 'pre-aplic-002';
update public.evaluacion_practica set tema = 'D. El interés jurídicamente protegido y el fundamento de la buena fe' where codigo = 'pre-aplic-004';
update public.evaluacion_practica set tema = 'D. El interés jurídicamente protegido y el fundamento de la buena fe' where codigo = 'hist-pre-mc-012';
update public.evaluacion_practica set tema = 'H. La responsabilidad de quien causa la nulidad del contrato' where codigo = 'pre-aplic-008';
update public.evaluacion_practica set tema = 'G. Los requisitos para que nazca el derecho a la reparación y su aplicación jurisprudencial' where codigo = 'pre-aplic-007';
update public.evaluacion_practica set tema = 'J. La responsabilidad precontractual en el derecho comparado y síntesis general de la materia' where codigo = 'pre-aplic-010';
update public.evaluacion_practica set tema = 'F. Determinación de los daños a resarcir en la responsabilidad precontractual' where codigo = 'pre-aplic-006';
update public.evaluacion_practica set tema = 'J. La responsabilidad precontractual en el derecho comparado y síntesis general de la materia' where codigo = 'pre-detect-010';
update public.evaluacion_practica set tema = 'I. La responsabilidad postcontractual' where codigo = 'pre-detect-009';
update public.evaluacion_practica set tema = 'D. El interés jurídicamente protegido y el fundamento de la buena fe' where codigo = 'pre-detect-004';
update public.evaluacion_practica set tema = 'G. Los requisitos para que nazca el derecho a la reparación y su aplicación jurisprudencial' where codigo = 'pre-detect-007';
update public.evaluacion_practica set tema = 'C. Las etapas del proceso de formación del contrato y el estatuto de responsabilidad aplicable en cada una' where codigo = 'pre-detect-003';
update public.evaluacion_practica set tema = 'B. Evolución doctrinaria: de la doctrina tradicional a la doctrina moderna' where codigo = 'pre-detect-002';
update public.evaluacion_practica set tema = 'E. Naturaleza jurídica de la responsabilidad precontractual' where codigo = 'pre-detect-005';
update public.evaluacion_practica set tema = 'A. Planteamiento del problema y concepto de responsabilidad precontractual' where codigo = 'pre-detect-001';
update public.evaluacion_practica set tema = 'F. Determinación de los daños a resarcir en la responsabilidad precontractual' where codigo = 'pre-detect-006';
update public.evaluacion_practica set tema = 'H. La responsabilidad de quien causa la nulidad del contrato' where codigo = 'pre-detect-008';
update public.evaluacion_practica set tema = 'C. Las etapas del proceso de formación del contrato y el estatuto de responsabilidad aplicable en cada una' where codigo = 'pre-just-003';
update public.evaluacion_practica set tema = 'I. La responsabilidad postcontractual' where codigo = 'hist-pre-mc-013';
update public.evaluacion_practica set tema = 'F. Determinación de los daños a resarcir en la responsabilidad precontractual' where codigo = 'pre-just-006';
update public.evaluacion_practica set tema = 'A. Planteamiento del problema y concepto de responsabilidad precontractual' where codigo = 'pre-aplic-001';
update public.evaluacion_practica set tema = 'E. Naturaleza jurídica de la responsabilidad precontractual' where codigo = 'pre-just-005';
update public.evaluacion_practica set tema = 'G. Los requisitos para que nazca el derecho a la reparación y su aplicación jurisprudencial' where codigo = 'pre-just-007';
update public.evaluacion_practica set tema = 'B. Evolución doctrinaria: de la doctrina tradicional a la doctrina moderna' where codigo = 'pre-just-002';
update public.evaluacion_practica set tema = 'H. La responsabilidad de quien causa la nulidad del contrato' where codigo = 'pre-just-008';
update public.evaluacion_practica set tema = 'J. La responsabilidad precontractual en el derecho comparado y síntesis general de la materia' where codigo = 'pre-just-010';
update public.evaluacion_practica set tema = 'B. Evolución doctrinaria: de la doctrina tradicional a la doctrina moderna' where codigo = 'pre-mc-002';
update public.evaluacion_practica set tema = 'I. La responsabilidad postcontractual' where codigo = 'pre-mc-009';
update public.evaluacion_practica set tema = 'F. Determinación de los daños a resarcir en la responsabilidad precontractual' where codigo = 'hist-pre-mc-004';
update public.evaluacion_practica set tema = 'J. La responsabilidad precontractual en el derecho comparado y síntesis general de la materia' where codigo = 'pre-mc-010';
update public.evaluacion_practica set tema = 'H. La responsabilidad de quien causa la nulidad del contrato' where codigo = 'hist-pre-mc-014';
update public.evaluacion_practica set tema = 'E. Naturaleza jurídica de la responsabilidad precontractual' where codigo = 'hist-pre-mc-005';
update public.evaluacion_practica set tema = 'G. Los requisitos para que nazca el derecho a la reparación y su aplicación jurisprudencial' where codigo = 'pre-mc-007';
update public.evaluacion_practica set tema = 'I. La responsabilidad postcontractual' where codigo = 'hist-pre-mc-016';
update public.evaluacion_practica set tema = 'C. Las etapas del proceso de formación del contrato y el estatuto de responsabilidad aplicable en cada una' where codigo = 'pre-mc-003';
update public.evaluacion_practica set tema = 'A. Planteamiento del problema y concepto de responsabilidad precontractual' where codigo = 'pre-mc-001';
update public.evaluacion_practica set tema = 'F. Determinación de los daños a resarcir en la responsabilidad precontractual' where codigo = 'pre-mc-006';
update public.evaluacion_practica set tema = 'A. Planteamiento del problema y concepto de responsabilidad precontractual' where codigo = 'hist-pre-mc-001';
update public.evaluacion_practica set tema = 'A. Planteamiento del problema y concepto de responsabilidad precontractual' where codigo = 'hist-pre-mc-010';
update public.evaluacion_practica set tema = 'E. Naturaleza jurídica de la responsabilidad precontractual' where codigo = 'pre-mc-005';
update public.evaluacion_practica set tema = 'C. Las etapas del proceso de formación del contrato y el estatuto de responsabilidad aplicable en cada una' where codigo = 'hist-pre-mc-008';
update public.evaluacion_practica set tema = 'H. La responsabilidad de quien causa la nulidad del contrato' where codigo = 'pre-mc-008';
update public.evaluacion_practica set tema = 'D. El interés jurídicamente protegido y el fundamento de la buena fe' where codigo = 'pre-mc-004';
```

## Resumen final

- **59 ítems clasificados** con confianza (de 60 filas totales), todos con
  `materia = 'Responsabilidad precontractual'` y `tema` hoy en `null`.
- **1 ítem sin clasificar con confianza** (`hist-pre-mc-015`), genuinamente
  ambiguo entre el Eje B y el Eje J, no un caso de materia equivocada
  (ver sección propia arriba).
- **0 filas corruptas** y **0 ítems que resultaron ser de otra materia**
  (a diferencia de Contractual, donde 2 ítems tuvieron que moverse a
  Extracontractual): en esta materia el manual calza 1:1 con Airtable y no
  apareció ningún caso de contenido mal etiquetado por materia.

Total por eje si se aplican los 59 `UPDATE` (todos nuevos, porque las 60
filas partían con `tema = null`):

| Eje | Nuevos (este doc) |
|---|---|
| A. Planteamiento del problema y concepto de responsabilidad precontractual | **6** |
| B. Evolución doctrinaria: de la doctrina tradicional a la doctrina moderna | **5** |
| C. Las etapas del proceso de formación del contrato y el estatuto de responsabilidad aplicable en cada una | **6** |
| D. El interés jurídicamente protegido y el fundamento de la buena fe | **6** |
| E. Naturaleza jurídica de la responsabilidad precontractual | **6** |
| F. Determinación de los daños a resarcir en la responsabilidad precontractual | **6** |
| G. Los requisitos para que nazca el derecho a la reparación y su aplicación jurisprudencial | **6** |
| H. La responsabilidad de quien causa la nulidad del contrato | **6** |
| I. La responsabilidad postcontractual | **6** |
| J. La responsabilidad precontractual en el derecho comparado y síntesis general de la materia | **6** |
| (sin clasificar: `hist-pre-mc-015`) | **1** |

6×9 + 5 + 1 = 60. Todos los ejes quedan con cobertura de Evaluación
después de esta fase (a diferencia de Contractual, donde 5 de los 21 ejes
quedaron en cero); el eje B queda con un ítem menos que el resto
únicamente porque `hist-pre-mc-015` está pendiente de decisión y podría
sumarse a B. Esto es solo el paso de clasificación (Fase 0): la tabla de
cobertura completa por subtema, análoga a la de
`docs/cobertura_subtema_rex_2026-07-30.md`, es Fase 1 y queda para una
sesión posterior.
