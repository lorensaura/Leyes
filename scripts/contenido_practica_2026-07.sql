-- Contenido nuevo para Alternativas y Memorice, generado según el proceso de
-- docs/prompt-generacion-contenido-practica.md, en tandas de ~10 páginas por
-- manual. Correr en el SQL Editor de Supabase cuando Laura lo confirme.
-- Cada lote queda comentado con la sección/eje de origen para trazabilidad.

-- ════════════════════════════════════════════════════════════════════════
-- LOTE 1: Contractual, Sección A. Marco general de la responsabilidad
-- contractual (páginas 1-9 del PDF)
-- ════════════════════════════════════════════════════════════════════════

insert into public.alternativas
  (id, materia, subtema, nivel_exigencia, pregunta, opciones, correcta, retroalimentacion, fuente)
values (
  'rc-alt-002',
  'contractual',
  'Derechos auxiliares del acreedor',
  2,
  'Los derechos auxiliares del acreedor (beneficio de separación, acción subrogatoria, acción pauliana, medidas conservativas) tienen por objeto:',
  '["Obtener directamente el pago de la obligación incumplida, sustituyendo a la acción de cumplimiento forzado", "Conservar el patrimonio del deudor, en función del derecho de prenda general del acreedor (art. 2465)", "Sancionar exclusivamente el incumplimiento doloso del deudor", "Sustituir la indemnización de perjuicios cuando esta no puede acreditarse"]'::jsonb,
  1,
  '{"correcta": "La ley otorga estos derechos para conservar el patrimonio del deudor, precisamente porque es en ese patrimonio donde se hará exigible el cumplimiento, en virtud del derecho de prenda general del art. 2465 CC.", "por_que_no": ["A: los derechos auxiliares no sustituyen al cumplimiento forzado, son instrumentales a que el patrimonio del deudor esté disponible para cualquiera de los remedios.", "C: no se limitan al incumplimiento doloso, protegen el patrimonio del deudor en general.", "D: no reemplazan la indemnización de perjuicios, que sigue requiriendo su propia prueba."]}'::jsonb,
  'Art. 2465 CC'
)
on conflict (id) do nothing;

insert into public.alternativas
  (id, materia, subtema, nivel_exigencia, pregunta, opciones, correcta, retroalimentacion, fuente)
values (
  'rc-alt-003',
  'contractual',
  'Compatibilidad de las acciones del art. 1489',
  3,
  'El acreedor que demanda el cumplimiento forzado del contrato y no lo obtiene:',
  '["Pierde definitivamente la posibilidad de demandar la resolución, porque ambas acciones se excluyen para siempre entre sí", "Puede demandar posteriormente la resolución del contrato, porque ambas acciones, aunque incompatibles como pretensión simultánea, pueden interponerse sucesivamente", "Solo puede demandar la resolución si el incumplimiento fue doloso", "Debe esperar a que se cumpla el plazo de prescripción antes de poder intentar la resolución"]'::jsonb,
  1,
  '{"correcta": "Cumplimiento y resolución son incompatibles como pretensiones simultáneas (no pueden demandarse conjuntamente, salvo una en subsidio de la otra), pero nada obsta a interponerlas sucesivamente: si el acreedor demanda el cumplimiento y no lo obtiene, conserva la opción de demandar después la resolución (art. 17 CPC).", "por_que_no": ["A: contradice exactamente la regla de sucesividad que permite el art. 17 CPC.", "C: la exigencia de dolo rige para la renuncia anticipada a la acción resolutoria, no para la posibilidad de demandarla después de un cumplimiento fallido.", "D: no existe ninguna exigencia de esperar el plazo de prescripción para pasar de una acción a la otra."]}'::jsonb,
  'Art. 17 CPC; art. 1489 CC'
)
on conflict (id) do nothing;

insert into public.alternativas
  (id, materia, subtema, nivel_exigencia, pregunta, opciones, correcta, retroalimentacion, fuente)
values (
  'rc-alt-004',
  'contractual',
  'Responsabilidad subjetiva y objetivación',
  4,
  'Conforme a la tesis objetiva de la responsabilidad contractual (BARAONA, PEÑAILILLO), la imputabilidad (dolo o culpa) del deudor es un requisito indispensable únicamente para:',
  '["El cumplimiento forzado de la obligación", "La resolución del contrato", "La indemnización de perjuicios", "Los tres remedios por igual, sin ninguna excepción"]'::jsonb,
  2,
  '{"correcta": "El incumplimiento, por sí solo, habilita el cumplimiento forzado y la resolución, sin exigir imputabilidad; el dolo o la culpa solo se exigen para la indemnización de perjuicios. Por eso puede haber resolución sin indemnización en un incumplimiento fortuito, y la presunción de culpa del art. 1547 inc. 3° opera precisamente en el terreno indemnizatorio.", "por_que_no": ["A: el cumplimiento forzado procede por el solo incumplimiento, mientras no sobrevenga una imposibilidad no imputable que extinga la obligación.", "B: la resolución tampoco exige probar dolo o culpa del deudor.", "D: la tesis objetiva niega justamente que los tres remedios compartan el mismo requisito de imputabilidad."]}'::jsonb,
  'Art. 1547 CC (dato de grado, Sección A)'
)
on conflict (id) do nothing;

insert into public.memorice_articulos
  (id, materia, subtema, articulo, texto, prioridad_ocultamiento, palabras_criticas, fuente)
values (
  'cc-art-1489',
  'contractual',
  'Condición resolutoria tácita',
  '1489',
  'En los contratos bilaterales va envuelta la condición resolutoria de no cumplirse por uno de los contratantes lo pactado. Pero en tal caso podrá el otro contratante pedir a su arbitrio o la resolución o el cumplimiento del contrato, con indemnización de perjuicios.',
  '[["contratos bilaterales", "condición resolutoria"], ["no cumplirse", "lo pactado"], ["a su arbitrio", "resolución", "cumplimiento del contrato"], ["*"]]'::jsonb,
  array['bilaterales', 'arbitrio', 'resolución', 'cumplimiento', 'indemnización de perjuicios'],
  'Código Civil, art. 1489'
)
on conflict (id) do nothing;

-- ════════════════════════════════════════════════════════════════════════
-- LOTE 2: Contractual, Sección B. El incumplimiento contractual como factor
-- de atribución (páginas 10-21 del PDF)
-- ════════════════════════════════════════════════════════════════════════

insert into public.alternativas
  (id, materia, subtema, nivel_exigencia, pregunta, opciones, correcta, retroalimentacion, fuente)
values (
  'rc-alt-005',
  'contractual',
  'Incumplimiento total y parcial (art. 1556)',
  2,
  'Si el deudor paga, pero el acreedor acepta un pago que no cubre íntegramente lo debido, se está frente a un incumplimiento:',
  '["Total", "Parcial, por cumplimiento imperfecto", "Que no genera ningún tipo de responsabilidad", "Que solo puede alegarse en obligaciones de hacer"]'::jsonb,
  1,
  '{"correcta": "El art. 1556 considera incumplimiento el pago que se cumple imperfectamente, es decir, que no se paga en forma íntegra (ej. de una deuda de $10.000, el acreedor acepta un abono de $5.000).", "por_que_no": ["A: el incumplimiento total supone que no se ejecuta la obligación en ninguna de sus partes; aquí hubo un pago parcial aceptado por el acreedor.", "C: el cumplimiento imperfecto sí genera responsabilidad: la deuda subsiste reducida y puede sumarse indemnización moratoria.", "D: la distinción entre incumplimiento total y parcial no está limitada a las obligaciones de hacer."]}'::jsonb,
  'Art. 1556 CC'
)
on conflict (id) do nothing;

insert into public.alternativas
  (id, materia, subtema, nivel_exigencia, pregunta, opciones, correcta, retroalimentacion, fuente)
values (
  'rc-alt-006',
  'contractual',
  'Carga de la prueba del caso fortuito',
  3,
  'Si el deudor incumplido alega que la obligación se hizo imposible por caso fortuito, ¿a quién corresponde probar la concurrencia de esa causal?',
  '["Al acreedor, porque es quien busca obtener la indemnización", "Al deudor, porque es quien alega la causal que lo exonera (art. 1547 inciso 3°)", "A ambas partes por igual, dividiéndose la carga probatoria", "A ninguna, porque el caso fortuito se presume salvo prueba en contrario del acreedor"]'::jsonb,
  1,
  '{"correcta": "El art. 1547 inciso 3° es expreso: la prueba de la diligencia o cuidado incumbe al que ha debido emplearlo; la prueba del caso fortuito, al que lo alega. Quien alega el caso fortuito es el deudor.", "por_que_no": ["A: invierte la carga; el acreedor no debe probar la ausencia de caso fortuito.", "C: no existe tal reparto de la carga probatoria.", "D: el caso fortuito no se presume, debe ser acreditado por quien lo invoca."]}'::jsonb,
  'Art. 1547 inciso 3° CC'
)
on conflict (id) do nothing;

insert into public.alternativas
  (id, materia, subtema, nivel_exigencia, pregunta, opciones, correcta, retroalimentacion, fuente)
values (
  'rc-alt-007',
  'contractual',
  'Exención en obligaciones de resultado',
  4,
  'En una obligación de resultado, el deudor que no alcanzó el resultado prometido se exonera de responsabilidad únicamente si prueba:',
  '["Que actuó con la diligencia debida, aunque no haya logrado el resultado", "Que el acreedor tampoco cumplió alguna obligación suya", "Un evento de fuerza mayor que le imposibilitó cumplir", "Que el incumplimiento fue parcial y no total"]'::jsonb,
  2,
  '{"correcta": "En las obligaciones de resultado la culpa no es un elemento a considerar para el incumplimiento; el deudor únicamente se exonera acreditando un evento de fuerza mayor, sin que baste alegar la ausencia de culpa.", "por_que_no": ["A: esa defensa (ausencia de culpa) solo opera en obligaciones de medio, no en las de resultado.", "B: esa es una causal distinta (incumplimiento recíproco del acreedor), no la exención propia de las obligaciones de resultado.", "D: que el incumplimiento sea parcial no exonera al deudor de responder por la parte incumplida."]}'::jsonb,
  'Sección B del manual (obligaciones de medio y resultado)'
)
on conflict (id) do nothing;

insert into public.memorice_articulos
  (id, materia, subtema, articulo, texto, prioridad_ocultamiento, palabras_criticas, fuente)
values (
  'cc-art-1547-3',
  'contractual',
  'Presunción de culpa contractual (prueba de la diligencia)',
  '1547 inc. 3°',
  'La prueba de la diligencia o cuidado incumbe al que ha debido emplearlo; la prueba del caso fortuito al que lo alega. Todo lo cual, sin embargo, se entiende sin perjuicio de las disposiciones especiales de las leyes, y de las estipulaciones expresas de las partes.',
  '[["diligencia", "cuidado"], ["incumbe", "ha debido emplearlo"], ["caso fortuito", "al que lo alega"], ["*"]]'::jsonb,
  array['diligencia', 'cuidado', 'incumbe', 'caso fortuito', 'alega'],
  'Código Civil, art. 1547 inciso 3°'
)
on conflict (id) do nothing;

-- ════════════════════════════════════════════════════════════════════════
-- LOTE 3: Contractual, Sección C. La acción de cumplimiento
-- (páginas 22-38 del PDF)
-- ════════════════════════════════════════════════════════════════════════

insert into public.alternativas
  (id, materia, subtema, nivel_exigencia, pregunta, opciones, correcta, retroalimentacion, fuente)
values (
  'rc-alt-008',
  'contractual',
  'Requisitos de la acción ejecutiva',
  2,
  'Para que proceda la ejecución forzada de una obligación de dar, se requiere que la obligación sea, entre otros requisitos:',
  '["Condicional y de monto indeterminado", "Líquida o liquidable mediante simples operaciones aritméticas", "Solidaria", "Superior a un mínimo legal de cuantía"]'::jsonb,
  1,
  '{"correcta": "El art. 434 CPC y siguientes exigen, entre otros requisitos, que la obligación sea líquida o liquidable mediante simples operaciones aritméticas con los solos datos del título, además de constar en un título ejecutivo, ser actualmente exigible y que la acción no esté prescrita.", "por_que_no": ["A: la obligación debe ser actualmente exigible, no estar sujeta a una condición pendiente; y debe ser líquida, no de monto indeterminado.", "C: la solidaridad no es un requisito de la acción ejecutiva.", "D: no existe un mínimo legal de cuantía como requisito general de procedencia."]}'::jsonb,
  'Art. 434 y ss. CPC'
)
on conflict (id) do nothing;

insert into public.alternativas
  (id, materia, subtema, nivel_exigencia, pregunta, opciones, correcta, retroalimentacion, fuente)
values (
  'rc-alt-009',
  'contractual',
  'Prescripción de la acción ejecutiva',
  3,
  'La acción ejecutiva para el cumplimiento forzado de una obligación de dar prescribe en:',
  '["5 años, plazo común a toda acción contractual", "3 años, convirtiéndose luego en ordinaria por 2 años más", "1 año, sin posibilidad de conversión", "10 años, plazo de la prescripción extraordinaria"]'::jsonb,
  1,
  '{"correcta": "La acción ejecutiva prescribe en 3 años; cumplido ese plazo, se convierte en ordinaria y dura 2 años más (art. 2515 CC).", "por_que_no": ["A: 5 años es el plazo de la prescripción ordinaria general, no el de la acción ejecutiva específicamente.", "C: no existe tal plazo de 1 año para la acción ejecutiva ni se excluye su conversión en ordinaria.", "D: 10 años no corresponde a ningún plazo de prescripción de esta acción."]}'::jsonb,
  'Art. 2515 CC'
)
on conflict (id) do nothing;

insert into public.alternativas
  (id, materia, subtema, nivel_exigencia, pregunta, opciones, correcta, retroalimentacion, fuente)
values (
  'rc-alt-010',
  'contractual',
  'Obligaciones de no hacer (art. 1555)',
  3,
  'Si lo hecho en contravención de una obligación de no hacer no puede destruirse ni deshacerse, el acreedor:',
  '["Pierde todo derecho, porque la obligación se torna de imposible cumplimiento", "Solo puede pedir la indemnización de perjuicios", "Puede exigir igualmente que se destruya lo hecho, aunque sea materialmente imposible", "Debe aceptar un cumplimiento por equivalente sin derecho a indemnización adicional"]'::jsonb,
  1,
  '{"correcta": "Conforme al art. 1555 inciso 1°, si no es posible destruir o deshacer lo hecho, al acreedor no le queda otro remedio que pedir la indemnización de perjuicios.", "por_que_no": ["A: el acreedor no queda sin derecho alguno; conserva la indemnización de perjuicios.", "C: no se puede exigir una destrucción materialmente imposible.", "D: el inciso final del art. 1555 precisa que el acreedor queda de todos modos indemne, por lo que sí puede reclamar perjuicios adicionales."]}'::jsonb,
  'Art. 1555 CC'
)
on conflict (id) do nothing;

insert into public.memorice_articulos
  (id, materia, subtema, articulo, texto, prioridad_ocultamiento, palabras_criticas, fuente)
values (
  'cc-art-1553',
  'contractual',
  'Cumplimiento forzado de obligaciones de hacer',
  '1553',
  'Si la obligación es de hacer y el deudor se constituye en mora, podrá pedir el acreedor, junto con la indemnización de la mora, cualquiera de estas tres cosas, a elección suya: 1ª. Que se apremie al deudor para la ejecución del hecho convenido; 2ª. Que se le autorice a él mismo para hacerlo ejecutar por un tercero a expensas del deudor; 3ª. Que el deudor le indemnice de los perjuicios resultantes de la infracción del contrato.',
  '[["se constituye en mora"], ["apremie al deudor"], ["a expensas del deudor"], ["*"]]'::jsonb,
  array['mora', 'apremie', 'tercero', 'expensas', 'indemnice', 'perjuicios'],
  'Código Civil, art. 1553'
)
on conflict (id) do nothing;

-- ════════════════════════════════════════════════════════════════════════
-- LOTE 4: Contractual, Sección D. La resolución por incumplimiento
-- ════════════════════════════════════════════════════════════════════════

insert into public.alternativas
  (id, materia, subtema, nivel_exigencia, pregunta, opciones, correcta, retroalimentacion, fuente)
values (
  'rc-alt-011',
  'contractual',
  'Prescripción de la acción resolutoria',
  3,
  'La acción resolutoria emanada de la condición resolutoria tácita prescribe, por regla general, en:',
  '["10 años, igual que la nulidad absoluta", "5 años, contados desde que la obligación se hace exigible", "4 años, siempre, sea cual sea el contrato", "2 años, plazo especial de las acciones patrimoniales"]'::jsonb,
  1,
  '{"correcta": "Por regla general, la acción resolutoria prescribe en 5 años contados desde que la obligación se hace exigible (arts. 2514 y 2515 CC). El plazo de 4 años solo rige para el pacto comisorio de la compraventa por no pago del precio (art. 1880), contado además desde una fecha distinta: la del contrato.", "por_que_no": ["A: 10 años es el plazo de la nulidad absoluta, una institución distinta con su propio régimen.", "C: 4 años es la regla especial del pacto comisorio de la compraventa, no la regla general de la acción resolutoria.", "D: no existe un plazo de 2 años para esta acción."]}'::jsonb,
  'Arts. 2514 y 2515 CC'
)
on conflict (id) do nothing;

insert into public.alternativas
  (id, materia, subtema, nivel_exigencia, pregunta, opciones, correcta, retroalimentacion, fuente)
values (
  'rc-alt-012',
  'contractual',
  'Características de la acción resolutoria',
  2,
  'Que la acción resolutoria sea personal significa que:',
  '["Solo puede demandarla el propio contratante, nunca sus herederos o cesionarios", "Solo puede dirigirse contra quien celebró el contrato, no contra terceros adquirentes", "Solo procede en contratos de carácter personalísimo (intuito personae)", "No puede renunciarse anticipadamente"]'::jsonb,
  1,
  '{"correcta": "La acción resolutoria deriva del contrato, y los contratos generan derechos personales (art. 578 CC): por eso solo puede entablarse contra quien celebró el contrato, no contra terceros, sin perjuicio de que existan otras acciones (reivindicatoria o restitutoria) contra estos según los arts. 1490 y 1491.", "por_que_no": ["A: la acción sí es transferible y transmisible; pueden deducirla herederos y cesionarios del acreedor.", "C: nada tiene que ver con que el contrato sea intuito personae; se refiere al tipo de derecho (personal, no real) del que emana la acción.", "D: la acción resolutoria sí es renunciable, por ser de contenido patrimonial (art. 1487 en relación con el art. 12)."]}'::jsonb,
  'Art. 578 CC'
)
on conflict (id) do nothing;

insert into public.alternativas
  (id, materia, subtema, nivel_exigencia, pregunta, opciones, correcta, retroalimentacion, fuente)
values (
  'rc-alt-013',
  'contractual',
  'Alcance general del pacto comisorio',
  3,
  '¿Puede convenirse un pacto comisorio en un contrato distinto de la compraventa, o por el incumplimiento de una obligación distinta del pago del precio?',
  '["No, el pacto comisorio solo existe en la compraventa por no pago del precio, por su ubicación en el Código", "Sí, la doctrina hoy reconoce que el pacto comisorio tiene alcance general, en virtud de la autonomía de la voluntad", "Solo en contratos bilaterales de tracto sucesivo, nunca en contratos de ejecución instantánea", "Solo si el contrato lo remite expresamente a las reglas de la compraventa"]'::jsonb,
  1,
  '{"correcta": "Pese a su ubicación sistemática a propósito de la compraventa, la doctrina es hoy conteste en que el pacto comisorio tiene alcance general: puede establecerse en cualquier contrato, incluso unilateral, y por el incumplimiento de cualquier obligación, en virtud de la autonomía de la voluntad.", "por_que_no": ["A: su ubicación en el Código responde a una razón histórica (la lex commissoria romana), no a una limitación sustantiva de su alcance.", "C: no existe tal restricción a los contratos de tracto sucesivo.", "D: no se requiere ninguna remisión expresa a las reglas de la compraventa para pactarlo en otro contrato."]}'::jsonb,
  'Sección D del manual (pacto comisorio)'
)
on conflict (id) do nothing;

insert into public.memorice_articulos
  (id, materia, subtema, articulo, texto, prioridad_ocultamiento, palabras_criticas, fuente)
values (
  'cc-art-1552',
  'contractual',
  'Excepción de contrato no cumplido (la mora purga la mora)',
  '1552',
  'En los contratos bilaterales ninguno de los contratantes está en mora dejando de cumplir lo pactado, mientras el otro no lo cumple por su parte, o no se allana a cumplirlo en la forma y tiempo debidos.',
  '[["contratos bilaterales"], ["ninguno", "está en mora"], ["no lo cumple", "no se allana"], ["*"]]'::jsonb,
  array['bilaterales', 'mora', 'no lo cumple', 'se allana'],
  'Código Civil, art. 1552'
)
on conflict (id) do nothing;

-- ════════════════════════════════════════════════════════════════════════
-- LOTE 5: Contractual, Sección E, parte 1. La indemnización de perjuicios
-- (concepto, autonomía, imputabilidad, daño)
-- ════════════════════════════════════════════════════════════════════════

insert into public.alternativas
  (id, materia, subtema, nivel_exigencia, pregunta, opciones, correcta, retroalimentacion, fuente)
values (
  'rc-alt-014',
  'contractual',
  'Acumulabilidad de la indemnización compensatoria',
  3,
  'La indemnización compensatoria, por reemplazar a la prestación no cumplida, ¿puede acumularse con el cumplimiento en naturaleza de la misma obligación?',
  '["Sí, siempre, porque son remedios independientes", "No, porque implicaría un doble pago y un enriquecimiento sin causa", "Solo si el deudor lo consiente expresamente en el mismo juicio", "Solo en las obligaciones de dar, no en las de hacer"]'::jsonb,
  1,
  '{"correcta": "La indemnización compensatoria reemplaza a la prestación no cumplida; acumularla con el cumplimiento en naturaleza de la misma obligación significaría que el acreedor reciba a la vez la cosa debida y su equivalente en dinero, un doble pago que importa enriquecimiento sin causa.", "por_que_no": ["A: precisamente por su función sustitutiva, no son acumulables entre sí.", "C: la regla no depende del consentimiento del deudor en el juicio; es una prohibición general.", "D: la regla de no acumulación rige para toda obligación, sea de dar o de hacer."]}'::jsonb,
  'Sección E del manual (indemnización compensatoria y moratoria)'
)
on conflict (id) do nothing;

insert into public.alternativas
  (id, materia, subtema, nivel_exigencia, pregunta, opciones, correcta, retroalimentacion, fuente)
values (
  'rc-alt-015',
  'contractual',
  'Graduación de la culpa según utilidad del contrato',
  2,
  'En un contrato que beneficia únicamente al deudor (como el comodato para el comodatario), el deudor responde de:',
  '["Culpa grave", "Culpa leve", "Culpa levísima", "Ningún grado de culpa, por tratarse de un préstamo gratuito"]'::jsonb,
  2,
  '{"correcta": "El art. 1547 inciso 1° hace responder de culpa levísima al deudor en los contratos que por su naturaleza son útiles solo a él: recibiendo todo el provecho, se le exige la máxima diligencia.", "por_que_no": ["A: la culpa grave es el estándar para los contratos que benefician solo al acreedor (ej. depósito), lo contrario de este caso.", "B: la culpa leve es la regla general en los contratos de beneficio recíproco, no en los que benefician solo al deudor.", "D: la gratuidad no elimina la responsabilidad; solo puede modular el estándar de diligencia exigido, que aquí es, además, el más alto."]}'::jsonb,
  'Art. 1547 CC'
)
on conflict (id) do nothing;

insert into public.alternativas
  (id, materia, subtema, nivel_exigencia, pregunta, opciones, correcta, retroalimentacion, fuente)
values (
  'rc-alt-016',
  'contractual',
  'Daño directo e indirecto (art. 1558)',
  3,
  'Conforme al artículo 1558 del Código Civil, los perjuicios indirectos:',
  '["Se indemnizan siempre que el incumplimiento sea doloso", "Nunca se indemnizan, ni siquiera mediando dolo", "Se indemnizan solo si fueron previstos al contratar", "Se indemnizan únicamente en las obligaciones de dinero"]'::jsonb,
  1,
  '{"correcta": "El art. 1558 traza una frontera infranqueable: los perjuicios indirectos no se indemnizan nunca, ni siquiera mediando dolo. El dolo extiende la responsabilidad de los perjuicios previstos a los imprevistos, pero jamás a los indirectos.", "por_que_no": ["A: ni siquiera el dolo hace indemnizables los perjuicios indirectos.", "C: la distinción previsto/imprevisto opera solo dentro de los perjuicios directos; los indirectos quedan excluidos de raíz.", "D: la exclusión de los perjuicios indirectos es una regla general, no limitada a las obligaciones de dinero."]}'::jsonb,
  'Art. 1558 CC'
)
on conflict (id) do nothing;

insert into public.memorice_articulos
  (id, materia, subtema, articulo, texto, prioridad_ocultamiento, palabras_criticas, fuente)
values (
  'cc-art-1558-1',
  'contractual',
  'Extensión del daño: perjuicios previstos e imprevistos',
  '1558 inc. 1°',
  'Si no se puede imputar dolo al deudor, sólo es responsable de los perjuicios que se previeron o pudieron preverse al tiempo del contrato; pero si hay dolo, es responsable de todos los perjuicios que fueron una consecuencia inmediata o directa de no haberse cumplido la obligación o de haberse demorado su cumplimiento.',
  '[["no se puede imputar dolo"], ["se previeron", "pudieron preverse"], ["consecuencia inmediata", "o directa"], ["*"]]'::jsonb,
  array['dolo', 'previeron', 'pudieron preverse', 'inmediata', 'directa'],
  'Código Civil, art. 1558 inciso 1°'
)
on conflict (id) do nothing;

-- ════════════════════════════════════════════════════════════════════════
-- LOTE 6: Contractual, Sección E, parte 2. Daño moral, pérdida de chance,
-- causalidad, mora, cláusula penal
-- ════════════════════════════════════════════════════════════════════════

insert into public.alternativas
  (id, materia, subtema, nivel_exigencia, pregunta, opciones, correcta, retroalimentacion, fuente)
values (
  'rc-alt-017',
  'contractual',
  'Acumulación de cláusula penal y obligación principal',
  4,
  'Por regla general, ¿puede el acreedor exigir a la vez el cumplimiento de la obligación principal y el pago de la cláusula penal?',
  '["Sí, siempre, sin ninguna excepción", "No, salvo que la pena se haya estipulado por el simple retardo, o se haya pactado expresamente que su pago no extingue la obligación principal", "Sí, pero solo en los contratos de tracto sucesivo", "No, en ningún caso, ni siquiera pactándolo expresamente"]'::jsonb,
  1,
  '{"correcta": "El art. 1537 establece que no se acumulan la obligación principal y la pena, salvo que esta se haya estipulado por el simple retardo (pena moratoria) o que se haya pactado expresamente que su pago no extingue la obligación principal.", "por_que_no": ["A: la regla general es precisamente la no acumulación, no la acumulación irrestricta.", "C: la excepción no está limitada a los contratos de tracto sucesivo.", "D: sí existen excepciones expresamente contempladas por el propio art. 1537."]}'::jsonb,
  'Art. 1537 CC'
)
on conflict (id) do nothing;

insert into public.alternativas
  (id, materia, subtema, nivel_exigencia, pregunta, opciones, correcta, retroalimentacion, fuente)
values (
  'rc-alt-018',
  'contractual',
  'Cláusula penal enorme (art. 1544)',
  4,
  'En un contrato conmutativo en que tanto la obligación principal como la pena consisten en una cantidad de dinero determinada, ¿cuál es el tope máximo de la pena, según la interpretación mayoritaria del art. 1544?',
  '["El triple de la obligación principal", "El doble de la obligación principal, incluyéndose esta en dicho duplo", "Un monto fijado libremente por el juez en cada caso", "No existe tope alguno si las partes lo pactaron expresamente"]'::jsonb,
  1,
  '{"correcta": "La doctrina mayoritaria (Alessandri, Somarriva, Abeliuk, Claro Solar, Fueyo) interpreta que la pena no puede superar el doble de la obligación principal, quedando esta incluida en ese duplo: si la deuda es de $10.000.000, la pena máxima es $20.000.000.", "por_que_no": ["A: el triple no corresponde a la interpretación mayoritaria del art. 1544.", "C: el juez no tiene discreción libre en este supuesto específico; el tope del duplo es una regla legal, no un criterio de equidad (ese criterio rige solo para obligaciones de valor inapreciable o indeterminado).", "D: el pacto de las partes no puede dejar sin efecto el límite del art. 1544, que es de orden público e irrenunciable."]}'::jsonb,
  'Art. 1544 CC'
)
on conflict (id) do nothing;

insert into public.alternativas
  (id, materia, subtema, nivel_exigencia, pregunta, opciones, correcta, retroalimentacion, fuente)
values (
  'rc-alt-019',
  'contractual',
  'Pérdida de una chance u oportunidad',
  4,
  'La pérdida de una chance u oportunidad, según la jurisprudencia reciente de la Corte Suprema, se indemniza:',
  '["Por el valor íntegro del beneficio final que se esperaba obtener", "Ponderando el valor del beneficio esperado según la probabilidad que existía de alcanzarlo, en una avaluación restringida", "Solo si el incumplimiento fue doloso", "De la misma manera que el lucro cesante, porque son la misma institución"]'::jsonb,
  1,
  '{"correcta": "La Corte Suprema (caso Alpes Chemie con CENABAST) exige una avaluación restringida y prudencial: el monto no puede equivaler al beneficio final esperado, sino que se calcula ponderando ese valor por la probabilidad que la oportunidad tenía de concretarse.", "por_que_no": ["A: eso equivaldría a indemnizar un lucro cesante cierto, que es justamente lo que la pérdida de chance no es, por tratarse de un resultado incierto.", "C: no se exige dolo para que proceda la pérdida de chance; basta el incumplimiento y la pérdida de la oportunidad.", "D: la propia Corte Suprema ha precisado que la pérdida de chance es una especie de daño diversa del lucro cesante, autónoma del resultado final esperado."]}'::jsonb,
  'CS, Alpes Chemie con CENABAST (2025); Roles 154.662-2020 y 4989-2019'
)
on conflict (id) do nothing;

insert into public.memorice_articulos
  (id, materia, subtema, articulo, texto, prioridad_ocultamiento, palabras_criticas, fuente)
values (
  'cc-art-1551',
  'contractual',
  'Interpelación y constitución en mora',
  '1551',
  'El deudor está en mora, 1º. Cuando no ha cumplido la obligación dentro del término estipulado, salvo que la ley en casos especiales exija que se requiera al deudor para constituirle en mora; 2º. Cuando la cosa no ha podido ser dada o ejecutada sino dentro de cierto espacio de tiempo, y el deudor lo ha dejado pasar sin darla o ejecutarla; 3º. En los demás casos, cuando el deudor ha sido judicialmente reconvenido por el acreedor.',
  '[["término estipulado"], ["cierto espacio de tiempo"], ["judicialmente reconvenido"], ["*"]]'::jsonb,
  array['término estipulado', 'cierto espacio de tiempo', 'judicialmente reconvenido'],
  'Código Civil, art. 1551'
)
on conflict (id) do nothing;

-- ════════════════════════════════════════════════════════════════════════
-- LOTE 7: Contractual, Sección F. Causales de exención de responsabilidad
-- ════════════════════════════════════════════════════════════════════════

insert into public.alternativas
  (id, materia, subtema, nivel_exigencia, pregunta, opciones, correcta, retroalimentacion, fuente)
values (
  'rc-alt-020',
  'contractual',
  'Ausencia de culpa vs. caso fortuito',
  4,
  'Sobre si basta la ausencia de culpa o se requiere acreditar el caso fortuito para que el deudor se exonere, la Corte Suprema ha resuelto que:',
  '["Siempre se requiere acreditar el caso fortuito, sin excepción", "Basta que el deudor acredite que empleó el cuidado a que lo obligaba el contrato, sin necesidad de probar el caso fortuito", "El deudor nunca puede exonerarse, cualquiera sea la prueba que rinda", "Solo se exonera si prueba dolo del acreedor"]'::jsonb,
  1,
  '{"correcta": "La Corte Suprema ha resuelto que basta al deudor acreditar que empleó el cuidado a que lo obligaba el contrato, sin que sea necesario probar además el caso fortuito. La doctrina conecta esta postura con las obligaciones de medio, donde probar la diligencia equivale a probar el cumplimiento.", "por_que_no": ["A: esa es la tesis de Claro Solar, pero no la que ha seguido la Corte Suprema según el manual.", "C: el deudor sí puede exonerarse, precisamente probando su diligencia.", "D: el dolo del acreedor no es lo que está en discusión en este debate probatorio."]}'::jsonb,
  'Sección F del manual (ausencia de culpa)'
)
on conflict (id) do nothing;

insert into public.alternativas
  (id, materia, subtema, nivel_exigencia, pregunta, opciones, correcta, retroalimentacion, fuente)
values (
  'rc-alt-021',
  'contractual',
  'El hecho de un tercero',
  3,
  'Por regla general, ¿cómo se considera para el deudor la intervención de un tercero por el cual no es civilmente responsable?',
  '["Como un caso fortuito, si reúne los requisitos de imprevisibilidad e irresistibilidad", "Como hecho propio del deudor, que compromete siempre su responsabilidad", "Como una causal de nulidad del contrato", "Como una situación que siempre exige la intervención judicial previa"]'::jsonb,
  0,
  '{"correcta": "Conforme al art. 1677 y al inciso final del art. 1590, el hecho de un tercero por el cual el deudor no responde civilmente constituye para él un caso fortuito, siempre que reúna los requisitos propios de este: imprevisibilidad e irresistibilidad.", "por_que_no": ["B: eso es lo que ocurre con el hecho de un tercero por el cual el deudor SÍ es civilmente responsable (art. 1679), justo lo opuesto de este supuesto.", "C: la intervención de un tercero no genera, por sí sola, una causal de nulidad.", "D: no se exige ninguna intervención judicial previa para que el hecho del tercero opere como caso fortuito."]}'::jsonb,
  'Arts. 1677 y 1590 CC'
)
on conflict (id) do nothing;

insert into public.alternativas
  (id, materia, subtema, nivel_exigencia, pregunta, opciones, correcta, retroalimentacion, fuente)
values (
  'rc-alt-022',
  'contractual',
  'Frustración del fin del contrato vs. imprevisión',
  4,
  '¿Qué diferencia a la frustración del fin del contrato de la teoría de la imprevisión?',
  '["En la imprevisión el cumplimiento se vuelve imposible; en la frustración, solo se encarece", "En la imprevisión la prestación sigue interesando pero cuesta demasiado; en la frustración la prestación ya no interesa, aunque pueda ejecutarse sin dificultad", "Son exactamente la misma institución bajo dos nombres distintos", "La frustración del fin solo se aplica a contratos unilaterales, y la imprevisión solo a bilaterales"]'::jsonb,
  1,
  '{"correcta": "En la imprevisión la prestación sigue interesando al acreedor, pero su costo se ha vuelto excesivo; en la frustración del fin, la prestación ya no interesa en absoluto, aunque pueda ejecutarse sin ninguna dificultad (el ejemplo escolar es el balcón arrendado para un desfile que se cancela).", "por_que_no": ["A: invierte los conceptos; ninguna de las dos figuras exige imposibilidad del cumplimiento (eso es propio del caso fortuito).", "C: son instituciones distintas, con requisitos y consecuencias propias, aunque emparentadas.", "D: ambas figuras exigen, precisamente, un contrato bilateral y oneroso."]}'::jsonb,
  'Sección F del manual (frustración del fin del contrato)'
)
on conflict (id) do nothing;

insert into public.memorice_articulos
  (id, materia, subtema, articulo, texto, prioridad_ocultamiento, palabras_criticas, fuente)
values (
  'cc-art-45',
  'contractual',
  'Concepto de caso fortuito o fuerza mayor',
  '45',
  'Se llama fuerza mayor o caso fortuito el imprevisto a que no es posible resistir, como un naufragio, un terremoto, el apresamiento de enemigos, los actos de autoridad ejercidos por un funcionario público, etc.',
  '[["fuerza mayor", "caso fortuito"], ["imprevisto"], ["no es posible resistir"], ["*"]]'::jsonb,
  array['fuerza mayor', 'caso fortuito', 'imprevisto', 'no es posible resistir'],
  'Código Civil, art. 45'
)
on conflict (id) do nothing;

-- ════════════════════════════════════════════════════════════════════════
-- LOTE 8: Contractual, Sección G. Los derechos auxiliares del acreedor
-- ════════════════════════════════════════════════════════════════════════

insert into public.alternativas
  (id, materia, subtema, nivel_exigencia, pregunta, opciones, correcta, retroalimentacion, fuente)
values (
  'rc-alt-023',
  'contractual',
  'Derecho de prenda general',
  2,
  'El llamado "derecho de prenda general" del artículo 2465:',
  '["Es un contrato real de prenda que recae sobre bienes muebles determinados del deudor", "Es una expresión ilustrativa: no hay verdadera prenda, sino que todos los bienes embargables del deudor quedan afectos al cumplimiento", "Solo se aplica a las obligaciones garantizadas con caución real", "No incluye los bienes futuros del deudor, solo los presentes"]'::jsonb,
  1,
  '{"correcta": "La nomenclatura es defectuosa: no existe un contrato real de prenda (que exigiría entrega de bienes muebles al acreedor). El nombre se mantiene solo por su valor ilustrativo: recuerda que todos los bienes embargables del deudor, presentes o futuros, quedan afectos al cumplimiento de sus obligaciones.", "por_que_no": ["A: no hay ningún contrato de prenda real involucrado; es una expresión metafórica.", "C: el derecho de prenda general ampara las obligaciones personales, precisamente en contraposición a las garantizadas con cauciones reales.", "D: el art. 2465 expresamente incluye los bienes presentes y futuros del deudor."]}'::jsonb,
  'Art. 2465 CC'
)
on conflict (id) do nothing;

insert into public.alternativas
  (id, materia, subtema, nivel_exigencia, pregunta, opciones, correcta, retroalimentacion, fuente)
values (
  'rc-alt-024',
  'contractual',
  'Prescripción de la acción pauliana',
  3,
  'La acción pauliana del artículo 2468 prescribe en:',
  '["5 años desde que la obligación se hizo exigible", "1 año contado desde la fecha del acto o contrato", "4 años desde que se descubrió el fraude", "10 años, igual que la nulidad absoluta"]'::jsonb,
  1,
  '{"correcta": "El art. 2468 N° 3 fija un plazo especial de un año, contado desde la fecha del acto o contrato que se pretende revocar; por ser prescripción de corto tiempo, no se suspende y corre contra toda persona.", "por_que_no": ["A: 5 años es el plazo general de las acciones contractuales, no el de la pauliana.", "C: el plazo no se cuenta desde el descubrimiento del fraude, sino desde la fecha del acto o contrato.", "D: la pauliana no comparte el plazo de la nulidad absoluta; son instituciones distintas."]}'::jsonb,
  'Art. 2468 CC'
)
on conflict (id) do nothing;

insert into public.alternativas
  (id, materia, subtema, nivel_exigencia, pregunta, opciones, correcta, retroalimentacion, fuente)
values (
  'rc-alt-025',
  'contractual',
  'Naturaleza jurídica de la acción pauliana',
  4,
  'Según la tesis hoy más aceptada sobre la naturaleza jurídica de la acción pauliana, el acto revocado:',
  '["Es nulo absolutamente desde su origen", "Es válido entre las partes, pero inoponible al acreedor que obtuvo la revocación, y solo hasta el monto de su crédito", "Se transforma automáticamente en una donación", "Solo puede dejarse sin efecto si el deudor está sometido a un procedimiento concursal"]'::jsonb,
  1,
  '{"correcta": "La tesis de la inoponibilidad por fraude (Somarriva, Abeliuk) es la más aceptada: el acto es perfectamente válido entre las partes, pero el acreedor puede desconocerlo y privarlo de efectos respecto de él, y solo hasta el monto de su propio crédito.", "por_que_no": ["A: la tesis de la nulidad relativa (Alessandri) es minoritaria, y se le objeta que el acto no tiene vicio de origen alguno.", "C: no existe tal transformación; el acto conserva su naturaleza original entre las partes.", "D: la acción pauliana civil no requiere que el deudor esté sometido a un procedimiento concursal de liquidación."]}'::jsonb,
  'Art. 2468 CC (naturaleza jurídica de la acción pauliana)'
)
on conflict (id) do nothing;

insert into public.memorice_articulos
  (id, materia, subtema, articulo, texto, prioridad_ocultamiento, palabras_criticas, fuente)
values (
  'cc-art-2465',
  'contractual',
  'Derecho de prenda general',
  '2465',
  'Toda obligación personal da al acreedor el derecho de perseguir su ejecución sobre todos los bienes raíces o muebles del deudor, sean presentes o futuros, exceptuándose solamente los no embargables, designados en el artículo 1618.',
  '[["obligación personal"], ["bienes raíces o muebles", "presentes o futuros"], ["no embargables"], ["*"]]'::jsonb,
  array['obligación personal', 'presentes o futuros', 'no embargables'],
  'Código Civil, art. 2465'
)
on conflict (id) do nothing;

-- ════════════════════════════════════════════════════════════════════════
-- LOTE 9: Contractual, Sección H. Cláusulas que modifican la responsabilidad
-- (última sección del manual de Contractual)
-- ════════════════════════════════════════════════════════════════════════

insert into public.alternativas
  (id, materia, subtema, nivel_exigencia, pregunta, opciones, correcta, retroalimentacion, fuente)
values (
  'rc-alt-026',
  'contractual',
  'Cláusulas que agravan la responsabilidad',
  3,
  '¿Cuál de las siguientes es una cláusula que agrava la responsabilidad del deudor?',
  '["Rebajar el grado de culpa del que ordinariamente respondería", "Que el deudor responda incluso del caso fortuito", "Fijar un tope cuantitativo a la indemnización", "Limitar la responsabilidad solo a los perjuicios directos previstos"]'::jsonb,
  1,
  '{"correcta": "Las partes pueden estipular que el deudor responda incluso del caso fortuito, asumiendo un riesgo que ordinariamente lo liberaría (arts. 1547 y 1673); esta es una típica cláusula agravatoria.", "por_que_no": ["A: rebajar el grado de culpa es una cláusula que atenúa, no agrava, la responsabilidad.", "C: el tope indemnizatorio es la forma más característica de cláusula atenuante.", "D: limitar la responsabilidad a los perjuicios previstos también es una atenuación, no una agravación."]}'::jsonb,
  'Arts. 1547 y 1673 CC'
)
on conflict (id) do nothing;

insert into public.alternativas
  (id, materia, subtema, nivel_exigencia, pregunta, opciones, correcta, retroalimentacion, fuente)
values (
  'rc-alt-027',
  'contractual',
  'Cláusula "todo daño" y su límite frente al dolo',
  4,
  'Una cláusula que estipula que el deudor "responderá de todo daño" opera como una agravante que:',
  '["Puede extenderse válidamente incluso a exonerar al deudor de su propio dolo futuro", "Amplía la responsabilidad dentro del campo de la culpa, sin poder invadir el terreno reservado al dolo y a la culpa grave", "Solo tiene efecto si el incumplimiento proviene de caso fortuito", "Convierte automáticamente cualquier incumplimiento culposo en doloso"]'::jsonb,
  1,
  '{"correcta": "La cláusula de todo daño opera, respecto del deudor que no actúa con dolo, como una agravante que lo obliga a soportar también perjuicios imprevistos; pero el dolo y la culpa grave rompen la proporcionalidad del régimen y no pueden ser objeto de agravación ni de exoneración por esta vía.", "por_que_no": ["A: es justamente lo contrario; el dolo futuro nunca puede condonarse ni manipularse mediante estas cláusulas.", "C: la cláusula opera precisamente para incumplimientos imputables a culpa, no para el caso fortuito, que de todas formas exime.", "D: la cláusula no cambia la naturaleza del incumplimiento; solo amplía qué perjuicios se indemnizan dentro del campo de la culpa."]}'::jsonb,
  'Arts. 1558 y 1465 CC'
)
on conflict (id) do nothing;

insert into public.alternativas
  (id, materia, subtema, nivel_exigencia, pregunta, opciones, correcta, retroalimentacion, fuente)
values (
  'rc-alt-028',
  'contractual',
  'Cláusula que excluye los daños indirectos',
  4,
  'Según Boetsch, ¿por qué la cláusula que excluye los "daños indirectos" resulta, en gran medida, inocua o redundante en el derecho chileno?',
  '["Porque los daños indirectos ya están excluidos de la indemnización por el propio artículo 1558, al faltarles el requisito de la causalidad directa", "Porque los daños indirectos no existen como categoría en ningún ordenamiento jurídico", "Porque toda cláusula de este tipo es nula por objeto ilícito", "Porque los daños indirectos solo se aplican a los contratos de tracto sucesivo"]'::jsonb,
  0,
  '{"correcta": "El daño indirecto, al no ser consecuencia directa e inmediata del incumplimiento, de suyo no se indemniza en el sistema chileno por faltarle el requisito de la causalidad exigido por el art. 1558. Excluir lo que ya está excluido es, en este plano, redundante.", "por_que_no": ["B: la categoría sí existe, proviene del Common Law, aunque es indeterminada en su precisión.", "C: Boetsch no la califica de nula por objeto ilícito, sino de inocua o redundante, salvo que se reconduzca a una cláusula penal.", "D: no existe tal restricción a los contratos de tracto sucesivo."]}'::jsonb,
  'Art. 1558 CC (Sección H del manual)'
)
on conflict (id) do nothing;

insert into public.memorice_articulos
  (id, materia, subtema, articulo, texto, prioridad_ocultamiento, palabras_criticas, fuente)
values (
  'cc-art-1546',
  'contractual',
  'Buena fe contractual',
  '1546',
  'Los contratos deben ejecutarse de buena fe, y por consiguiente obligan no sólo a lo que en ellos se expresa, sino a todas las cosas que emanan precisamente de la naturaleza de la obligación, o que por la ley o la costumbre pertenecen a ella.',
  '[["buena fe"], ["no sólo a lo que en ellos se expresa"], ["naturaleza de la obligación", "ley o la costumbre"], ["*"]]'::jsonb,
  array['buena fe', 'naturaleza de la obligación'],
  'Código Civil, art. 1546'
)
on conflict (id) do nothing;

-- LOTE 2026-07 (10): Extracontractual, Eje A (Concepto, regulación y funciones)

insert into public.alternativas
  (id, materia, subtema, nivel_exigencia, pregunta, opciones, correcta, retroalimentacion, fuente)
values (
  'ext-alt-002',
  'extracontractual',
  'Fuentes de las obligaciones: el hecho ilícito',
  2,
  'Según el artículo 1437 del Código Civil, ¿cuál es la fuente de la obligación de indemnizar que nace de un delito o cuasidelito civil?',
  '["Un hecho que ha inferido injuria o daño a otra persona", "El concurso real de las voluntades de dos o más personas", "Un hecho voluntario de la persona que se obliga, como en los cuasicontratos", "La disposición expresa de la ley, como entre padres e hijos"]'::jsonb,
  0,
  '{"correcta": "El artículo 1437 enumera cuatro fuentes de las obligaciones; el delito y el cuasidelito quedan comprendidos en \"un hecho que ha inferido injuria o daño a otra persona\", que es la fuente propia de la responsabilidad extracontractual.", "por_que_no": ["B: esa es la fuente contractual (contratos o convenciones), no la extracontractual.", "C: esa es la fuente de los cuasicontratos, figura distinta del cuasidelito.", "D: esa es la fuente legal, ajena al hecho ilícito."]}'::jsonb,
  'Art. 1437 CC'
)
on conflict (id) do nothing;

insert into public.memorice_articulos
  (id, materia, subtema, articulo, texto, prioridad_ocultamiento, palabras_criticas, fuente)
values (
  'cc-art-1437',
  'extracontractual',
  'Fuentes de las obligaciones',
  '1437',
  'Las obligaciones nacen, ya del concurso real de las voluntades de dos o más personas, como los contratos o convenciones; ya de un hecho voluntario de la persona que se obliga, como en la aceptación de una herencia o legado y en todos los cuasicontratos; ya a consecuencia de un hecho que ha inferido injuria o daño a otra persona, como en los delitos y cuasidelitos; ya por disposición de la ley, como entre los padres y los hijos sujetos a patria potestad.',
  '[["concurso real de las voluntades", "contratos o convenciones"], ["hecho voluntario", "cuasicontratos"], ["injuria o daño", "delitos y cuasidelitos"], ["disposición de la ley", "patria potestad"], ["*"]]'::jsonb,
  array['concurso real de las voluntades', 'hecho voluntario', 'cuasicontratos', 'injuria o daño', 'delitos y cuasidelitos', 'disposición de la ley'],
  'Código Civil, art. 1437'
)
on conflict (id) do nothing;

-- LOTE 2026-07 (11): Extracontractual, Eje B (Responsabilidad civil y penal)

insert into public.alternativas
  (id, materia, subtema, nivel_exigencia, pregunta, opciones, correcta, retroalimentacion, fuente)
values (
  'ext-alt-003',
  'extracontractual',
  'Efectos de la sentencia penal en sede civil',
  3,
  'Según el artículo 179 del Código de Procedimiento Civil, ¿en cuál de los siguientes casos NO produce cosa juzgada civil la sentencia absolutoria penal?',
  '["Cuando la absolución se funda en que el hecho perseguido nunca ocurrió", "Cuando la absolución se funda en que no existe indicio alguno contra el acusado", "Cuando la absolución se funda en que la prueba rendida no alcanzó el estándar de duda razonable exigido en materia penal", "Cuando la sentencia declara expresamente que no existe relación alguna entre el hecho y el acusado"]'::jsonb,
  2,
  '{"correcta": "La insuficiencia probatoria (no se alcanzó el estándar penal de duda razonable) no es una de las tres causales taxativas del art. 179 CPC; por tanto, esa absolución no produce cosa juzgada civil y la víctima puede demandar con el estándar civil, más bajo.", "por_que_no": ["A: es la primera causal taxativa (inexistencia del hecho), sí produce cosa juzgada civil.", "B: es la tercera causal taxativa, sí produce cosa juzgada civil (con efecto relativo a quienes fueron parte).", "D: es la segunda causal taxativa, sí produce cosa juzgada civil."]}'::jsonb,
  'Art. 179 CPC'
)
on conflict (id) do nothing;

insert into public.memorice_articulos
  (id, materia, subtema, articulo, texto, prioridad_ocultamiento, palabras_criticas, fuente)
values (
  'cc-art-2332',
  'extracontractual',
  'Prescripción de la acción de responsabilidad extracontractual',
  '2332',
  'Las acciones que concede este título por daño o dolo, prescriben en cuatro años contados desde la perpetración del acto.',
  '[["daño o dolo"], ["cuatro años"], ["perpetración del acto"], ["*"]]'::jsonb,
  array['daño o dolo', 'cuatro años', 'perpetración del acto'],
  'Código Civil, art. 2332'
)
on conflict (id) do nothing;

-- LOTE 2026-07 (12): Extracontractual, Eje C (Delimitación de estatutos)

insert into public.alternativas
  (id, materia, subtema, nivel_exigencia, pregunta, opciones, correcta, retroalimentacion, fuente)
values (
  'ext-alt-004',
  'extracontractual',
  'Acción indemnizatoria vs. acción restitutoria',
  3,
  'Según el artículo 2290 del Código Civil, ¿qué puede exigir el agente oficioso (gestor de negocios ajenos) al interesado cuando el negocio ha sido bien administrado?',
  '["El reembolso de las expensas útiles o necesarias, sin derecho a salario ni a lucro cesante", "La indemnización íntegra del daño patrimonial, incluido el lucro cesante, igual que en sede extracontractual", "Una remuneración equivalente al valor de mercado de sus servicios", "Nada, porque la agencia oficiosa no genera ninguna obligación para el interesado"]'::jsonb,
  0,
  '{"correcta": "El art. 2290 dispone que el interesado debe reembolsar las expensas útiles o necesarias, pero no está obligado a pagar salario alguno; la acción del gestor es restitutoria, no indemnizatoria, por lo que no incluye el lucro cesante.", "por_que_no": ["B: esa es la lógica de la acción indemnizatoria extracontractual, ajena al cuasicontrato de agencia oficiosa.", "C: el art. 2290 excluye expresamente el pago de salario o remuneración.", "D: la agencia oficiosa sí genera obligaciones para el interesado, aunque limitadas al reembolso de gastos."]}'::jsonb,
  'Art. 2290 CC'
)
on conflict (id) do nothing;

insert into public.memorice_articulos
  (id, materia, subtema, articulo, texto, prioridad_ocultamiento, palabras_criticas, fuente)
values (
  'cc-art-2290',
  'extracontractual',
  'Agencia oficiosa: límite de la acción restitutoria',
  '2290',
  'Si el negocio ha sido bien administrado, cumplirá el interesado las obligaciones que el gerente ha contraído en la gestión y le reembolsará las expensas útiles o necesarias. El interesado no es obligado a pagar salario alguno al gerente.',
  '[["negocio ha sido bien administrado"], ["reembolsará", "expensas útiles o necesarias"], ["no es obligado a pagar salario"], ["*"]]'::jsonb,
  array['bien administrado', 'expensas útiles o necesarias', 'no pagar salario', 'gerente'],
  'Código Civil, art. 2290'
)
on conflict (id) do nothing;

-- LOTE 2026-07 (13): Extracontractual, Eje D (Sistemas o modelos de atribución)

insert into public.alternativas
  (id, materia, subtema, nivel_exigencia, pregunta, opciones, correcta, retroalimentacion, fuente)
values (
  'ext-alt-005',
  'extracontractual',
  'Responsabilidad estricta: carácter excepcional y de derecho estricto',
  3,
  '¿Cuál de las siguientes afirmaciones describe correctamente el carácter de la responsabilidad estricta u objetiva en el derecho chileno?',
  '["Es un régimen especial, de fuente exclusivamente legal, que no admite aplicación analógica a actividades igualmente riesgosas", "Es el régimen general del derecho chileno, aplicable a toda actividad riesgosa aunque no exista ley que lo establezca", "Es un régimen que el juez puede aplicar por analogía cuando estime que una actividad es peligrosa", "Es un régimen que sustituyó por completo a la responsabilidad por culpa desde la dictación del Código Civil"]'::jsonb,
  0,
  '{"correcta": "La responsabilidad estricta es un régimen especial y de derecho estricto: opera solo respecto de los ámbitos que el legislador definió previamente, y no admite extensión analógica.", "por_que_no": ["B: el régimen general y supletorio en Chile es la responsabilidad por culpa (arts. 2284, 2314, 2329), no la estricta.", "C: precisamente lo que caracteriza a este régimen es que NO admite aplicación analógica.", "D: la responsabilidad estricta coexiste con la de culpa mediante estatutos legales especiales; no la sustituyó."]}'::jsonb,
  'Arts. 2327, 2328 CC'
)
on conflict (id) do nothing;

insert into public.memorice_articulos
  (id, materia, subtema, articulo, texto, prioridad_ocultamiento, palabras_criticas, fuente)
values (
  'cc-art-2327',
  'extracontractual',
  'Responsabilidad estricta: animal fiero',
  '2327',
  'El daño causado por un animal fiero, de que no se reporta utilidad para la guarda o servicio de un predio, será siempre imputable al que lo tenga, y si alegare que no le fue posible evitar el daño, no será oído.',
  '[["animal fiero"], ["no se reporta utilidad", "guarda o servicio de un predio"], ["será siempre imputable"], ["no será oído"], ["*"]]'::jsonb,
  array['animal fiero', 'siempre imputable', 'no será oído'],
  'Código Civil, art. 2327'
)
on conflict (id) do nothing;

-- LOTE 2026-07 (14): Extracontractual, Eje E (La capacidad delictual)

insert into public.alternativas
  (id, materia, subtema, nivel_exigencia, pregunta, opciones, correcta, retroalimentacion, fuente)
values (
  'ext-alt-006',
  'extracontractual',
  'Capacidad delictual: las dos reglas del art. 2319',
  2,
  'Conforme al artículo 2319 del Código Civil, ¿cuál es la diferencia entre la incapacidad del infante (menor de siete años) y la del menor entre siete y dieciséis años?',
  '["La del infante es absoluta y de pleno derecho; la del mayor de siete y menor de dieciséis depende de la apreciación judicial del discernimiento", "Ambas son absolutas y de pleno derecho, sin excepción alguna", "Ambas dependen igualmente de la apreciación judicial del discernimiento", "La del infante depende del discernimiento; la del mayor de siete es absoluta de pleno derecho"]'::jsonb,
  0,
  '{"correcta": "El inciso primero del art. 2319 declara incapaces de pleno derecho a los menores de siete años, sin admitir prueba en contrario. El inciso segundo deja a la prudencia del juez determinar si el mayor de siete y menor de dieciséis obró con discernimiento.", "por_que_no": ["B: la incapacidad del mayor de siete y menor de dieciséis no es absoluta; depende de la apreciación judicial.", "C: la incapacidad del infante es de pleno derecho, no depende de apreciación judicial alguna.", "D: es exactamente al revés: el infante es incapaz de pleno derecho; el mayor de siete depende del discernimiento."]}'::jsonb,
  'Art. 2319 CC'
)
on conflict (id) do nothing;

insert into public.memorice_articulos
  (id, materia, subtema, articulo, texto, prioridad_ocultamiento, palabras_criticas, fuente)
values (
  'cc-art-2319',
  'extracontractual',
  'Capacidad delictual: incapaces y responsabilidad del guardián',
  '2319',
  'No son capaces de delito o cuasidelito los menores de siete años ni los dementes; pero serán responsables de los daños causados por ellos las personas a cuyo cargo estén, si pudiere imputárseles negligencia. Queda a la prudencia del juez determinar si el menor de dieciséis años ha cometido el delito o cuasidelito sin discernimiento; y en este caso se seguirá la regla del inciso anterior.',
  '[["menores de siete años", "dementes"], ["responsables", "personas a cuyo cargo estén", "imputárseles negligencia"], ["prudencia del juez", "menor de dieciséis años", "sin discernimiento"], ["*"]]'::jsonb,
  array['menores de siete años', 'dementes', 'negligencia', 'prudencia del juez', 'discernimiento'],
  'Código Civil, art. 2319'
)
on conflict (id) do nothing;

-- LOTE 2026-07 (15): Extracontractual, Eje F (Hecho voluntario, caso fortuito y personas jurídicas)

insert into public.alternativas
  (id, materia, subtema, nivel_exigencia, pregunta, opciones, correcta, retroalimentacion, fuente)
values (
  'ext-alt-007',
  'extracontractual',
  'Elementos del caso fortuito',
  3,
  '¿Cuáles son los tres elementos del caso fortuito o fuerza mayor, conforme a la doctrina y jurisprudencia chilenas?',
  '["Irresistibilidad, imprevisibilidad y exterioridad", "Culpa, daño y causalidad", "Dolo, negligencia e imprudencia", "Capacidad, voluntariedad y antijuridicidad"]'::jsonb,
  0,
  '{"correcta": "Los tres elementos son la irresistibilidad (medida en función del deber de diligencia), la imprevisibilidad (concepto normativo: el caso fortuito comienza donde cesa el deber de previsión) y la exterioridad (el hecho debe ser ajeno al ámbito de control del agente).", "por_que_no": ["B: esos son elementos del régimen general de responsabilidad por culpa, no del caso fortuito.", "C: esas son formas de imputación subjetiva (culpabilidad), ajenas a la definición de fuerza mayor.", "D: esos son elementos generales de la responsabilidad, no los que definen específicamente al caso fortuito."]}'::jsonb,
  'Art. 45 CC'
)
on conflict (id) do nothing;

insert into public.memorice_articulos
  (id, materia, subtema, articulo, texto, prioridad_ocultamiento, palabras_criticas, fuente)
values (
  'cc-art-545',
  'extracontractual',
  'Persona jurídica: concepto',
  '545',
  'Se llama persona jurídica una persona ficticia, capaz de ejercer derechos y contraer obligaciones civiles, y de ser representada judicial y extrajudicialmente.',
  '[["persona ficticia"], ["capaz de ejercer derechos", "contraer obligaciones civiles"], ["representada judicial y extrajudicialmente"], ["*"]]'::jsonb,
  array['persona ficticia', 'ejercer derechos', 'obligaciones civiles', 'representada'],
  'Código Civil, art. 545'
)
on conflict (id) do nothing;

-- LOTE 2026-07 (16): Extracontractual, Eje G (Antijuridicidad y causales de justificación)

insert into public.alternativas
  (id, materia, subtema, nivel_exigencia, pregunta, opciones, correcta, retroalimentacion, fuente)
values (
  'ext-alt-008',
  'extracontractual',
  'Requisitos del estado de necesidad',
  3,
  '¿Cuáles son los dos requisitos copulativos del estado de necesidad como causal de justificación en materia extracontractual?',
  '["Que el peligro no tenga origen en la acción culpable de quien lo alega, y que no existan medios menos dañinos para evitarlo", "Que la agresión sea actual e ilegítima, y que la defensa sea proporcionada", "Que exista un vínculo obligatorio previo entre las partes, y que se pruebe la culpa del demandado", "Que el daño sea imprevisible e irresistible"]'::jsonb,
  0,
  '{"correcta": "El estado de necesidad exige que el peligro que se busca evitar no tenga origen en la propia culpa de quien lo invoca, y que no existieran medios inocuos o menos dañinos disponibles para evitar el daño.", "por_que_no": ["B: esos son los requisitos de la legítima defensa, una causal distinta.", "C: esos criterios no corresponden al estado de necesidad, que es una causal de justificación, no un problema de delimitación de estatutos.", "D: esos son los elementos del caso fortuito, que se distingue del estado de necesidad precisamente en que el daño sí puede resistirse, aunque a costa de un mal propio."]}'::jsonb,
  'Doctrina y jurisprudencia (sin regulación civil expresa)'
)
on conflict (id) do nothing;

insert into public.memorice_articulos
  (id, materia, subtema, articulo, texto, prioridad_ocultamiento, palabras_criticas, fuente)
values (
  'cc-art-1465',
  'extracontractual',
  'Límite al consentimiento de la víctima: condonación del dolo futuro',
  '1465',
  'El pacto de no pedir más en razón de una cuenta aprobada, no vale en cuanto al dolo contenido en ella, si no se ha condonado expresamente. La condonación del dolo futuro no vale.',
  '[["pacto de no pedir más", "cuenta aprobada"], ["dolo contenido", "condonado expresamente"], ["condonación del dolo futuro no vale"], ["*"]]'::jsonb,
  array['cuenta aprobada', 'condonado expresamente', 'dolo futuro no vale'],
  'Código Civil, art. 1465'
)
on conflict (id) do nothing;

-- LOTE 2026-07 (17): Extracontractual, Eje H (Culpabilidad: dolo y culpa)

insert into public.alternativas
  (id, materia, subtema, nivel_exigencia, pregunta, opciones, correcta, retroalimentacion, fuente)
values (
  'ext-alt-009',
  'extracontractual',
  'Acción restitutoria contra el tercero beneficiado del dolo ajeno',
  3,
  'Conforme a los artículos 1458 inciso segundo y 2316 inciso segundo del Código Civil, ¿hasta qué monto responde quien, sin ser autor ni cómplice, se ha beneficiado del dolo ajeno?',
  '["Hasta el monto de todo el daño causado a la víctima, igual que el autor del dolo", "Únicamente hasta la concurrencia de lo que valga el provecho que efectivamente obtuvo", "No responde en caso alguno, salvo que haya sido cómplice del delito", "Hasta el monto que el juez determine equitativamente, sin relación con el provecho obtenido"]'::jsonb,
  1,
  '{"correcta": "El art. 2316 inciso segundo limita la responsabilidad del tercero beneficiado del dolo ajeno, sin ser cómplice, a la concurrencia de lo que valga el provecho obtenido: es una acción restitutoria, no indemnizatoria.", "por_que_no": ["A: esa es la extensión de la responsabilidad del autor del dolo, no la del tercero beneficiado, que responde solo hasta su provecho.", "C: precisamente porque se benefició del dolo ajeno a sabiendas, la ley habilita esta acción restitutoria en su contra.", "D: el monto no queda a la equidad judicial discrecional, sino que está fijado por la ley como el valor del provecho obtenido."]}'::jsonb,
  'Arts. 1458 inc. 2°, 2316 inc. 2° CC'
)
on conflict (id) do nothing;

-- LOTE 2026-07 (18): Extracontractual, Eje I (Prueba de la culpa y presunción del art. 2329)

insert into public.alternativas
  (id, materia, subtema, nivel_exigencia, pregunta, opciones, correcta, retroalimentacion, fuente)
values (
  'ext-alt-010',
  'extracontractual',
  'Interpretación amplia del art. 2329 (Alessandri)',
  4,
  '¿Cuál de los siguientes NO es uno de los cuatro argumentos con que se sostiene la interpretación amplia del artículo 2329 (que establece una presunción general de culpabilidad y no una mera repetición del art. 2314)?',
  '["Argumento exegético: la ubicación de la norma como regla de clausura del sistema de presunciones", "Argumento textual: la expresión \"daño que pueda imputarse\" a negligencia", "Argumento de experiencia: la máxima res ipsa loquitur", "Argumento de que la responsabilidad extracontractual es siempre de derecho estricto y no admite presunciones"]'::jsonb,
  3,
  '{"correcta": "Los cuatro argumentos son: exegético (ubicación como regla de clausura), textual (\"daño que pueda imputarse\"), de experiencia (res ipsa loquitur) y de justicia correctiva (único camino práctico en procesos complejos). La idea de que la responsabilidad extracontractual sea \"de derecho estricto\" corresponde, en cambio, al carácter excepcional de la responsabilidad ESTRICTA U OBJETIVA (Eje 4), no a las presunciones de culpa.", "por_que_no": ["A, B y C: estos sí son tres de los cuatro argumentos reales que sostienen la interpretación amplia de Alessandri."]}'::jsonb,
  'Art. 2329 CC'
)
on conflict (id) do nothing;

insert into public.memorice_articulos
  (id, materia, subtema, articulo, texto, prioridad_ocultamiento, palabras_criticas, fuente)
values (
  'cc-art-2329',
  'extracontractual',
  'Presunción de culpabilidad por el hecho propio',
  '2329',
  'Por regla general todo daño que pueda imputarse a malicia o negligencia de otra persona, debe ser reparado por ésta.',
  '[["por regla general", "todo daño"], ["que pueda imputarse", "malicia o negligencia"], ["debe ser reparado"], ["*"]]'::jsonb,
  array['por regla general', 'que pueda imputarse', 'malicia o negligencia', 'reparado'],
  'Código Civil, art. 2329'
)
on conflict (id) do nothing;

-- LOTE 2026-07 (19): Extracontractual, Eje J (El daño: concepto y requisitos de resarcibilidad)

insert into public.alternativas
  (id, materia, subtema, nivel_exigencia, pregunta, opciones, correcta, retroalimentacion, fuente)
values (
  'ext-alt-011',
  'extracontractual',
  'Pérdida de una oportunidad (chance) como daño autónomo',
  4,
  'Conforme al criterio aplicado por la Corte Suprema en 2025 respecto de la pérdida de una oportunidad (chance), ¿cómo debe avaluarse la indemnización cuando la víctima fue indebidamente excluida de un proceso competitivo (licitación, concurso, selección)?',
  '["En el monto total del beneficio que se habría obtenido de resultar ganador", "En una fracción del beneficio esperado, proporcional a la probabilidad real que tenía de resultar ganador", "En cero, porque al no haber certeza de que hubiera ganado, el daño es puramente eventual y no indemnizable", "En un monto fijo determinado por la ley, igual para todos los casos de pérdida de oportunidad"]'::jsonb,
  1,
  '{"correcta": "La pérdida de una chance se avalúa prudencialmente en una fracción del beneficio esperado, correspondiente a la probabilidad real que la víctima tenía de obtenerlo, y no en el monto total del beneficio ni en cero.", "por_que_no": ["A: indemnizar el total supondría dar por cierto un resultado que en realidad es incierto (que habría ganado).", "C: la pérdida de chance no es un daño eventual; el daño final ya ocurrió con certeza, y lo incierto es la relación causal, lo que sí la hace indemnizable como daño autónomo.", "D: no existe un monto fijo legal; la avaluación es prudencial y depende de la probabilidad real acreditada en cada caso."]}'::jsonb,
  'Doctrina y jurisprudencia (CS, sentencia de reemplazo de 6 de enero de 2025)'
)
on conflict (id) do nothing;

insert into public.memorice_articulos
  (id, materia, subtema, articulo, texto, prioridad_ocultamiento, palabras_criticas, fuente)
values (
  'cc-art-2317',
  'extracontractual',
  'Solidaridad entre coautores de un delito o cuasidelito',
  '2317',
  'Si un delito o cuasidelito ha sido cometido por dos o más personas, cada una de ellas será solidariamente responsable de todo el perjuicio procedente del mismo delito o cuasidelito, salvas las excepciones de los artículos 2323 y 2328. Todo fraude o dolo cometido por dos o más personas produce la acción solidaria del precedente inciso.',
  '[["dos o más personas"], ["solidariamente responsable"], ["todo el perjuicio"], ["fraude o dolo", "acción solidaria"], ["*"]]'::jsonb,
  array['solidariamente responsable', 'dos o más personas', 'todo el perjuicio', 'fraude o dolo'],
  'Código Civil, art. 2317'
)
on conflict (id) do nothing;

-- LOTE 2026-07 (20): Extracontractual, Eje K (Clases de daño I: el daño patrimonial)

insert into public.alternativas
  (id, materia, subtema, nivel_exigencia, pregunta, opciones, correcta, retroalimentacion, fuente)
values (
  'ext-alt-012',
  'extracontractual',
  'Excepciones a la determinación en concreto del daño patrimonial',
  3,
  'Según el artículo 1559 del Código Civil, ¿cómo se determina el daño por la mora en el pago de una obligación de dinero?',
  '["Mediante prueba concreta de las oportunidades de negocio perdidas por el acreedor", "Mediante los intereses convencionales o, en su defecto, los legales, sin necesidad de justificar otros perjuicios", "Mediante una estimación prudencial del daño moral sufrido por el acreedor", "Mediante el valor de reposición del dinero adeudado, más el costo de oportunidad probado por peritos"]'::jsonb,
  1,
  '{"correcta": "El art. 1559 estandariza el daño por la mora en obligaciones de dinero: se deben los intereses convencionales (si son superiores al legal) o los legales, y el acreedor no necesita justificar perjuicios adicionales para cobrarlos; basta el hecho del retardo.", "por_que_no": ["A: precisamente lo que evita el art. 1559 es exigir esa prueba concreta, para ahorrar costos de litigación e incertidumbre.", "C: la norma no se refiere al daño moral, sino al daño patrimonial por la mora en obligaciones dinerarias.", "D: no se exige prueba pericial de costo de oportunidad; el monto está estandarizado por la tasa de interés."]}'::jsonb,
  'Art. 1559 CC'
)
on conflict (id) do nothing;

insert into public.memorice_articulos
  (id, materia, subtema, articulo, texto, prioridad_ocultamiento, palabras_criticas, fuente)
values (
  'cc-art-1559-num1-2',
  'extracontractual',
  'Determinación estandarizada del daño por mora en obligaciones de dinero',
  '1559 (N° 1 y 2)',
  'Se siguen debiendo los intereses convencionales, si se ha pactado un interés superior al legal, o empiezan a deberse los intereses legales, en el caso contrario. El acreedor no tiene necesidad de justificar perjuicios cuando sólo cobra intereses; basta el hecho del retardo.',
  '[["intereses convencionales", "interés superior al legal"], ["intereses legales"], ["no tiene necesidad de justificar perjuicios", "basta el hecho del retardo"], ["*"]]'::jsonb,
  array['intereses convencionales', 'intereses legales', 'no necesita justificar perjuicios', 'basta el retardo'],
  'Código Civil, art. 1559 N° 1 y 2'
)
on conflict (id) do nothing;

-- LOTE 2026-07 (21): Extracontractual, Eje L (Clases de daño II: el daño moral)

insert into public.alternativas
  (id, materia, subtema, nivel_exigencia, pregunta, opciones, correcta, retroalimentacion, fuente)
values (
  'ext-alt-013',
  'extracontractual',
  'Los cinco argumentos para admitir la resarcibilidad del daño moral',
  3,
  '¿Cuál de los siguientes NO es uno de los cinco argumentos con que la doctrina y jurisprudencia justificaron la resarcibilidad del daño moral pese al silencio del Código Civil?',
  '["Que no toda indemnización debe ser pecuniaria (cabe la reparación en especie, como la publicación de la sentencia)", "Que los artículos 2314 y 2329 están redactados en términos amplios, sin distinguir clases de daño", "Que la legislación posterior al Código (Constitución, leyes especiales) menciona expresamente el daño moral", "Que el artículo 1556 define expresamente el daño moral como una tercera categoría junto al daño emergente y el lucro cesante"]'::jsonb,
  3,
  '{"correcta": "El artículo 1556 NO menciona el daño moral; se refiere únicamente al daño emergente y al lucro cesante, lo que confirma precisamente que el daño moral es una construcción jurisprudencial posterior al Código, no una categoría reconocida en él.", "por_que_no": ["A, B y C: estos sí son tres de los cinco argumentos reales (reparación en especie; amplitud de los arts. 2314/2329; legislación posterior que sí lo menciona expresamente)."]}'::jsonb,
  'Doctrina y jurisprudencia sobre resarcibilidad del daño moral'
)
on conflict (id) do nothing;

insert into public.memorice_articulos
  (id, materia, subtema, articulo, texto, prioridad_ocultamiento, palabras_criticas, fuente)
values (
  'cc-art-2331',
  'extracontractual',
  'Imputaciones injuriosas contra el honor o el crédito',
  '2331',
  'Las imputaciones injuriosas contra el honor o el crédito de una persona no dan derecho para demandar una indemnización pecuniaria, a menos de probarse daño emergente o lucro cesante, que pueda apreciarse en dinero; pero ni aun entonces tendrá lugar la indemnización pecuniaria, si se probare la verdad de la imputación.',
  '[["imputaciones injuriosas", "honor o el crédito"], ["no dan derecho", "indemnización pecuniaria"], ["a menos de probarse daño emergente o lucro cesante"], ["se probare la verdad de la imputación"], ["*"]]'::jsonb,
  array['imputaciones injuriosas', 'honor o el crédito', 'daño emergente o lucro cesante', 'verdad de la imputación'],
  'Código Civil, art. 2331'
)
on conflict (id) do nothing;

-- LOTE 2026-07 (22): Extracontractual, Eje M (La causalidad)
-- Nota: los artículos centrales de este eje (2317, 2320, 2325, 2330) ya están
-- cubiertos en scripts/supabase_seed_memorice_cc_responsabilidad.sql; no se
-- duplica Memorice en este lote.

insert into public.alternativas
  (id, materia, subtema, nivel_exigencia, pregunta, opciones, correcta, retroalimentacion, fuente)
values (
  'ext-alt-014',
  'extracontractual',
  'Pluralidad de agentes: hechos distintos vs. causa difusa',
  4,
  'Dos fábricas distintas, sin ningún acuerdo ni coordinación entre sí, vierten independientemente residuos tóxicos al mismo río, cada una en una cantidad que por sí sola ya habría bastado para contaminar el agua y causar el daño a los regantes aguas abajo. ¿Cómo se distribuye la responsabilidad entre ambas?',
  '["Solidariamente, aplicando literalmente el artículo 2317, porque ambas causaron el mismo daño", "En proporción a la participación de cada una, porque no se trata de un solo delito o cuasidelito sino de ilícitos separados que igualmente deben responder en conjunto, sin exceder el monto total del daño", "Ninguna responde, porque al ser cada vertido por sí solo suficiente para causar el daño, no puede probarse cuál de los dos fue la causa real", "Debe sortearse aleatoriamente cuál de las dos fábricas asume el total de la indemnización"]'::jsonb,
  1,
  '{"correcta": "Cuando existen varios responsables por hechos distintos, cada uno causa necesaria y suficiente del daño, no se aplica literalmente el art. 2317 (pensado para un mismo hecho), pero como ninguno puede beneficiarse de que el otro también causó el daño ni la víctima puede cobrar más del total de su perjuicio, se divide la responsabilidad en proporción a la participación de cada autor, produciendo un efecto práctico análogo a la solidaridad.", "por_que_no": ["A: el art. 2317 supone un mismo hecho ilícito cometido por dos o más personas; aquí hay dos hechos independientes.", "C: esta hipótesis (causalidad acumulativa con causas conocidas) es distinta de la causa difusa (causante desconocido entre varios candidatos); aquí sí se sabe que ambas fábricas contribuyeron.", "D: la ley no contempla el sorteo como mecanismo de distribución de responsabilidad."]}'::jsonb,
  'Doctrina sobre pluralidad de agentes y causalidad'
)
on conflict (id) do nothing;

-- LOTE 2026-07 (23): Extracontractual, Eje N (Responsabilidad por el hecho ajeno, art. 2320)

insert into public.alternativas
  (id, materia, subtema, nivel_exigencia, pregunta, opciones, correcta, retroalimentacion, fuente)
values (
  'ext-alt-015',
  'extracontractual',
  'Presunción de derecho del artículo 2321',
  4,
  'Se acredita en juicio que un menor de edad cometió un cuasidelito civil que provino, notoriamente, de la mala educación y los hábitos viciosos que sus padres le permitieron adquirir. ¿Pueden los padres exonerarse probando que, pese a todo, no habrían podido impedir el hecho concreto?',
  '["Sí, aplicando la misma regla de exoneración del artículo 2320 inciso final", "No, porque el artículo 2321 establece en este caso una presunción de derecho que no admite prueba en contrario", "Sí, pero solo si el hijo ya es mayor de edad al momento del juicio", "No, pero solo si el hecho ocurrió dentro del domicilio familiar"]'::jsonb,
  1,
  '{"correcta": "El artículo 2321 emplea la expresión \"siempre\" para declarar responsables a los padres en esta hipótesis, lo que la doctrina y jurisprudencia interpretan como una presunción de derecho: acreditado el origen del ilícito en la mala educación o los hábitos viciosos, ninguna prueba en contrario exonera a los padres mientras el hijo sea menor de edad.", "por_que_no": ["A: esa regla de exoneración rige para el régimen general del art. 2320, pero el art. 2321 la excluye expresamente en esta hipótesis específica.", "C: la edad del hijo AL MOMENTO DEL JUICIO es irrelevante; lo que importa es que fuera menor al tiempo del hecho.", "D: el artículo 2321 no distingue según el lugar donde ocurrió el hecho."]}'::jsonb,
  'Art. 2321 CC'
)
on conflict (id) do nothing;

insert into public.memorice_articulos
  (id, materia, subtema, articulo, texto, prioridad_ocultamiento, palabras_criticas, fuente)
values (
  'cc-art-2321',
  'extracontractual',
  'Presunción de derecho: mala educación o hábitos viciosos',
  '2321',
  'Los padres serán siempre responsables de los delitos o cuasidelitos cometidos por sus hijos menores, y que conocidamente provengan de mala educación, o de los hábitos viciosos que les han dejado adquirir.',
  '[["padres", "siempre responsables"], ["hijos menores"], ["mala educación", "hábitos viciosos"], ["*"]]'::jsonb,
  array['siempre responsables', 'hijos menores', 'mala educación', 'hábitos viciosos'],
  'Código Civil, art. 2321'
)
on conflict (id) do nothing;

-- LOTE 2026-07 (24): Extracontractual, Eje O (Responsabilidad del empresario)

insert into public.alternativas
  (id, materia, subtema, nivel_exigencia, pregunta, opciones, correcta, retroalimentacion, fuente)
values (
  'ext-alt-016',
  'extracontractual',
  'Culpa difusa y responsabilidad por el hecho propio de la organización',
  4,
  'Un paciente sufre un daño en un hospital a consecuencia de un defecto genuinamente organizacional (protocolos de seguridad mal diseñados), sin que sea posible identificar a un dependiente individual negligente. ¿Bajo qué construcción dogmática puede fundarse la responsabilidad del hospital, y qué ventaja tiene esa vía para la víctima?',
  '["Responsabilidad por el hecho ajeno del artículo 2320, porque siempre debe identificarse a un dependiente concreto", "Responsabilidad directa por el hecho propio de la organización, con la ventaja de que no existe excusa de \"no haber podido impedir el hecho\", porque el defecto organizacional es precisamente el hecho propio que se reprocha", "Ninguna responsabilidad es posible, porque sin identificar a un dependiente concreto no puede probarse ningún ilícito", "Responsabilidad estricta u objetiva, porque los hospitales siempre responden sin necesidad de culpa alguna en el derecho chileno"]'::jsonb,
  1,
  '{"correcta": "Cuando el daño se atribuye a un defecto de la organización en su conjunto y no a un dependiente individualizable, se construye una responsabilidad directa por el hecho propio de la persona jurídica, análoga a la presunción del art. 2329. Su ventaja para la víctima es que no existe la excusa de imposibilidad de impedir el hecho, porque la organización deficiente ES el hecho propio reprochado.", "por_que_no": ["A: la responsabilidad por el hecho ajeno exige justamente poder identificar un ilícito de un tercero individualizado; aquí no es posible.", "C: la doctrina y jurisprudencia sí aceptan fundar la responsabilidad en la culpa difusa u organizacional, sin necesidad de individualizar a un dependiente.", "D: el derecho chileno no consagra responsabilidad estricta general para los hospitales; se trata de una responsabilidad por culpa (aunque de prueba facilitada por la culpa difusa)."]}'::jsonb,
  'Doctrina sobre responsabilidad por el hecho propio de la organización empresarial'
)
on conflict (id) do nothing;

insert into public.memorice_articulos
  (id, materia, subtema, articulo, texto, prioridad_ocultamiento, palabras_criticas, fuente)
values (
  'cc-art-2322',
  'extracontractual',
  'Responsabilidad de los amos por sus criados o dependientes',
  '2322',
  'Los amos responderán de la conducta de sus criados o sirvientes, en el ejercicio de sus respectivas funciones; y esto aunque el hecho de que se trate no se haya ejecutado a su vista. Pero no responderán de lo que hayan hecho sus criados o sirvientes en el ejercicio de sus respectivas funciones, si se probare que las han ejercido de un modo impropio que los amos no tenían medio de prever o impedir, empleando el cuidado ordinario, y la autoridad competente.',
  '[["amos", "criados o sirvientes"], ["ejercicio de sus respectivas funciones"], ["no se haya ejecutado a su vista"], ["modo impropio", "no tenían medio de prever o impedir"], ["*"]]'::jsonb,
  array['amos', 'criados o sirvientes', 'ejercicio', 'modo impropio', 'no pudieron prever'],
  'Código Civil, art. 2322'
)
on conflict (id) do nothing;
