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

-- LOTE 2026-07 (25): Extracontractual, Eje P (Hecho de las cosas: animales, ruina, cosas que caen)

insert into public.alternativas
  (id, materia, subtema, nivel_exigencia, pregunta, opciones, correcta, retroalimentacion, fuente)
values (
  'ext-alt-017',
  'extracontractual',
  'Naturaleza de la excusa del artículo 2328',
  4,
  '¿Por qué sostiene Barros que la responsabilidad del artículo 2328 (cosa que cae o se arroja) es, en su estructura real, una responsabilidad estricta y no una simple presunción de culpa?',
  '["Porque la norma no admite ninguna excusa en absoluto, ni siquiera identificando al causante", "Porque la única excusa que la norma admite opera en el plano causal (identificar con exclusividad quién causó la caída), y no permite una prueba de diligencia respecto del cuidado del objeto", "Porque el artículo 2328 exige culpa grave del demandado, un estándar más exigente que en las demás presunciones", "Porque la norma fue derogada tácitamente por la Ley N° 21.020 sobre tenencia responsable de mascotas"]'::jsonb,
  1,
  '{"correcta": "Barros observa que la excusa del art. 2328 no permite probar la propia diligencia respecto del objeto; solo permite identificar, con exclusividad, quién causó la caída. Al operar la excusa en el plano de la causalidad y no en el de la culpa, la norma se comporta, en su estructura real, como una responsabilidad estricta.", "por_que_no": ["A: sí existe una excusa (identificar al causante exclusivo), solo que no es una excusa de diligencia.", "C: el artículo 2328 no exige un grado de culpa distinto; el punto de Barros es que no exige culpa alguna en su excusa, sino causalidad.", "D: el artículo 2328 no ha sido derogado; regula una hipótesis distinta (cosas que caen de edificios) de la que regula la Ley N° 21.020 (animales)."]}'::jsonb,
  'Art. 2328 CC'
)
on conflict (id) do nothing;

insert into public.memorice_articulos
  (id, materia, subtema, articulo, texto, prioridad_ocultamiento, palabras_criticas, fuente)
values (
  'cc-art-2326',
  'extracontractual',
  'Presunción de culpa del dueño de un animal',
  '2326',
  'El dueño de un animal es responsable de los daños causados por el mismo animal, aun después que se haya soltado o extraviado; salvo que la soltura, extravío o daño no pueda imputarse a culpa del dueño o del dependiente encargado de la guarda o servicio del animal.',
  '[["dueño de un animal", "responsable"], ["soltado o extraviado"], ["no pueda imputarse a culpa"], ["*"]]'::jsonb,
  array['dueño de un animal', 'soltado o extraviado', 'no pueda imputarse a culpa'],
  'Código Civil, art. 2326'
)
on conflict (id) do nothing;

-- LOTE 2026-07 (26): Extracontractual, Eje Q (Regímenes legales de responsabilidad objetiva)

insert into public.alternativas
  (id, materia, subtema, nivel_exigencia, pregunta, opciones, correcta, retroalimentacion, fuente)
values (
  'ext-alt-018',
  'extracontractual',
  'Fundamentos de la responsabilidad estricta: riesgo-provecho y riesgo-creado',
  3,
  '¿Cuál es la única excusa que admite la responsabilidad estricta del propietario de un vehículo motorizado bajo la Ley de Tránsito?',
  '["Probar que él personalmente conduce siempre con extremo cuidado", "Probar que el vehículo le fue tomado sin su conocimiento o autorización", "Probar que el conductor tenía más experiencia de manejo que el propietario", "Probar que el vehículo contaba con revisión técnica al día"]'::jsonb,
  1,
  '{"correcta": "La única excusa que la ley admite es que el vehículo le fue tomado al propietario sin su conocimiento o autorización, circunstancia que la ley asimila a un caso de fuerza mayor.", "por_que_no": ["A: al ser responsabilidad estricta, la diligencia personal del propietario es irrelevante.", "C: la experiencia relativa del conductor no es una excusa contemplada por la ley.", "D: la revisión técnica no exonera al propietario de esta responsabilidad estricta específica."]}'::jsonb,
  'Ley N° 18.290, de Tránsito'
)
on conflict (id) do nothing;

-- LOTE 2026-07 (27): Extracontractual, Eje R (Responsabilidad del Estado)

-- LOTE 2026-07 (28): Extracontractual, Eje S (Acción por daño contingente, art. 2333)

insert into public.alternativas
  (id, materia, subtema, nivel_exigencia, pregunta, opciones, correcta, retroalimentacion, fuente)
values (
  'ext-alt-020',
  'extracontractual',
  'Legitimación activa: acción individual vs. acción popular',
  3,
  'Según el artículo 2333 del Código Civil, ¿a quién corresponde la acción de daño contingente cuando la amenaza recae sobre personas indeterminadas?',
  '["Solo al Estado, a través del Consejo de Defensa Fiscal", "Se concede una acción popular: cualquier persona puede ejercerla", "Solo a quien primero haya sufrido un daño similar por la misma causa", "A nadie, porque la acción de daño contingente solo procede respecto de personas determinadas"]'::jsonb,
  1,
  '{"correcta": "El art. 2333 concede acción popular en todos los casos de daño contingente que amenace a personas indeterminadas; solo cuando la amenaza recae sobre personas determinadas, la acción se restringe a estas.", "por_que_no": ["A: la acción popular del art. 2333 no está reservada al Estado; puede ejercerla cualquier persona.", "C: no se exige haber sufrido un daño previo similar; la acción es precisamente preventiva.", "D: es exactamente al revés: la acción popular procede cuando la amenaza recae sobre personas INdeterminadas."]}'::jsonb,
  'Art. 2333 CC'
)
on conflict (id) do nothing;

-- LOTE 2026-07 (29): Extracontractual, Eje T (Objeto y extensión de la reparación)

insert into public.alternativas
  (id, materia, subtema, nivel_exigencia, pregunta, opciones, correcta, retroalimentacion, fuente)
values (
  'ext-alt-021',
  'extracontractual',
  'Efecto reflejo de la reparación en especie',
  3,
  'Si el responsable de un daño repara, por su cuenta y antes del juicio, la cosa deteriorada, dejándola en el mismo estado que tenía previamente, ¿qué efecto produce esa reparación en naturaleza sobre una eventual acción indemnizatoria posterior por el mismo concepto?',
  '["Ninguno: la víctima puede igualmente cobrar el valor íntegro de reparación, como si el arreglo nunca se hubiese hecho", "Disminuye correlativamente el monto de la indemnización debida, en la medida en que corrigió o disminuyó el daño", "Extingue automáticamente cualquier derecho de la víctima a reclamar cualquier otro perjuicio derivado del mismo hecho", "Obliga a la víctima a rechazar la reparación en naturaleza y exigir solo dinero"]'::jsonb,
  1,
  '{"correcta": "La restitución en naturaleza produce un efecto reflejo sobre la acción indemnizatoria: en la medida en que corrige o disminuye el daño, disminuye correlativamente el monto de la indemnización en equivalente que aún se debe.", "por_que_no": ["A: cobrar el valor íntegro ignorando la reparación ya realizada puede constituir un ejercicio abusivo de la acción indemnizatoria.", "C: la reparación en naturaleza solo disminuye el daño que corrige; no extingue el derecho a reclamar otros perjuicios distintos (ej. lucro cesante por privación de uso).", "D: la víctima puede aceptar la reparación en naturaleza sin que ello la prive de reclamar lo que esta no cubrió."]}'::jsonb,
  'Doctrina sobre formas y extensión de la reparación'
)
on conflict (id) do nothing;

insert into public.memorice_articulos
  (id, materia, subtema, articulo, texto, prioridad_ocultamiento, palabras_criticas, fuente)
values (
  'cc-art-2333',
  'extracontractual',
  'Acción por daño contingente: legitimación activa',
  '2333',
  'Por regla general, se concede acción popular en todos los casos de daño contingente que por imprudencia o negligencia de alguien amenace a personas indeterminadas; pero si el daño amenazare solamente a personas determinadas, sólo alguna de éstas podrá intentar la acción.',
  '[["daño contingente", "amenace a personas indeterminadas"], ["acción popular"], ["personas determinadas", "sólo alguna de éstas"], ["*"]]'::jsonb,
  array['daño contingente', 'acción popular', 'personas indeterminadas', 'personas determinadas'],
  'Código Civil, art. 2333'
)
on conflict (id) do nothing;

insert into public.alternativas
  (id, materia, subtema, nivel_exigencia, pregunta, opciones, correcta, retroalimentacion, fuente)
values (
  'ext-alt-019',
  'extracontractual',
  'Falta de servicio: naturaleza objetiva pero no estricta pura',
  4,
  '¿Exige la falta de servicio, como fundamento de la responsabilidad del Estado, individualizar al funcionario concreto cuya negligencia la origina?',
  '["Sí, siempre debe identificarse al funcionario específico responsable, igual que en la responsabilidad por el hecho ajeno entre particulares", "No, basta calificar si el servicio, atendidas sus circunstancias, debió funcionar de un modo distinto al que efectivamente tuvo, sin dejar de exigir por ello un juicio normativo", "No, y por eso la falta de servicio es un régimen de responsabilidad estricta pura que prescinde de todo juicio normativo", "Sí, porque de lo contrario no podría acreditarse ninguna relación de causalidad"]'::jsonb,
  1,
  '{"correcta": "La falta de servicio no exige individualizar al funcionario, pero sí exige un juicio normativo: si el servicio, atendidas sus circunstancias concretas, debió funcionar de un modo distinto. Esto la distingue tanto de la responsabilidad por el hecho ajeno (que si exige identificar el ilícito de un dependiente) como de la responsabilidad estricta pura (que prescinde de todo juicio normativo).", "por_que_no": ["A: precisamente lo que caracteriza a la falta de servicio es que NO exige esa individualización.", "C: la ausencia de individualización no equivale a ausencia de juicio normativo; la falta de servicio conserva ese juicio, a diferencia de la responsabilidad estricta pura.", "D: la relación de causalidad se puede acreditar sin identificar a un funcionario específico, evaluando el funcionamiento del servicio en su conjunto."]}'::jsonb,
  'Doctrina y jurisprudencia sobre responsabilidad del Estado (falta de servicio)'
)
on conflict (id) do nothing;

-- LOTE 2026-07 (30): Extracontractual, Eje U (Legitimación activa y pasiva)

insert into public.alternativas
  (id, materia, subtema, nivel_exigencia, pregunta, opciones, correcta, retroalimentacion, fuente)
values (
  'ext-alt-022',
  'extracontractual',
  'Legitimación del mero tenedor',
  4,
  'Un arrendatario (mero tenedor) sufre un daño en el bien que tiene en arriendo por el hecho de un tercero. ¿En qué caso está legitimado para demandar, a título personal, la indemnización por ese daño?',
  '["Nunca, porque el mero tenedor carece de todo derecho sobre la cosa y solo el dueño puede accionar", "Siempre, en las mismas condiciones que el dueño, porque basta con detentar materialmente la cosa", "Solo respecto del perjuicio que el daño irroga a su propio derecho personal sobre la cosa (por ejemplo, el perjuicio a su crédito de arrendatario), no respecto del valor de la cosa misma", "Solo si actúa como representante legal del dueño, mediante mandato expreso"]'::jsonb,
  2,
  '{"correcta": "El mero tenedor carece de derechos reales sobre la cosa y no puede reclamar su valor a título personal, salvo en ausencia del dueño (y entonces actúa en su nombre). Pero sí está legitimado, por derecho propio, para reclamar el perjuicio que el daño irroga a un derecho personal suyo, como el crédito del arrendatario.", "por_que_no": ["A: puede accionar en ausencia del dueño (en su nombre) y, por derecho propio, respecto del perjuicio a su propio crédito.", "B: el mero tenedor no tiene sobre la cosa el mismo derecho que el dueño; su legitimación por derecho propio es más acotada.", "D: no necesita mandato para reclamar, a título personal, el perjuicio a su propio derecho."]}'::jsonb,
  'Doctrina sobre legitimación activa en responsabilidad extracontractual'
)
on conflict (id) do nothing;

insert into public.alternativas
  (id, materia, subtema, nivel_exigencia, pregunta, opciones, correcta, retroalimentacion, fuente)
values (
  'ext-alt-023',
  'extracontractual',
  'Cesión del derecho a la indemnización ya devengada',
  4,
  '¿Puede cederse entre vivos el derecho a exigir una indemnización de perjuicios ya devengada, tratándose de daño moral?',
  '["No, porque el daño moral es personalísimo y su reparación solo puede reclamarla la víctima o sus herederos", "Sí, porque la indemnización ya devengada tiene siempre carácter patrimonial y no existe norma que prohíba su cesión, aunque el daño que le dio origen sea moral", "Solo si el cesionario es también heredero de la víctima", "No, salvo que medie autorización judicial previa"]'::jsonb,
  1,
  '{"correcta": "El derecho a pedir la indemnización de perjuicios ya devengados puede ser objeto de cesión entre vivos, incluso tratándose de daño moral, porque la indemnización tiene siempre un carácter patrimonial y no existe norma que prohíba su transferencia.", "por_que_no": ["A: lo personalísimo es el daño moral en sí, no el crédito indemnizatorio ya devengado, que es patrimonial y transferible.", "C: no se exige ninguna calidad de heredero en el cesionario.", "D: no se exige autorización judicial para ceder un crédito indemnizatorio ya devengado."]}'::jsonb,
  'Doctrina sobre legitimación activa por derecho derivado (cesión)'
)
on conflict (id) do nothing;

insert into public.alternativas
  (id, materia, subtema, nivel_exigencia, pregunta, opciones, correcta, retroalimentacion, fuente)
values (
  'ext-alt-024',
  'extracontractual',
  'Solidaridad del art. 2317: mismo hecho ilícito',
  4,
  'Un peatón es atropellado sucesivamente por dos vehículos distintos, conducidos por personas sin relación entre sí, en dos hechos separados. ¿Responden ambos conductores solidariamente por el total del daño conforme al artículo 2317?',
  '["Sí, porque el artículo 2317 establece solidaridad cada vez que dos o más personas causan daño a una misma víctima", "No, porque el artículo 2317 exige que dos o más personas hayan participado, como autores o cómplices, en un mismo delito o cuasidelito; tratándose de hechos ilícitos distintos, no hay solidaridad sino división proporcional", "Sí, pero solo si ambos conductores actuaron con dolo", "No, porque la solidaridad del artículo 2317 solo opera entre coautores de daños a las cosas, nunca de daños a las personas"]'::jsonb,
  1,
  '{"correcta": "El artículo 2317 exige que dos o más personas hayan participado, como autores o cómplices, en un mismo delito o cuasidelito. Si se trata de hechos ilícitos distintos, aunque afecten a la misma víctima, no hay solidaridad, sino la división proporcional entre los responsables.", "por_que_no": ["A: la solidaridad no opera por la sola coincidencia de la víctima, sino por la participación conjunta en un mismo hecho ilícito.", "C: el artículo 2317 no distingue según el grado de culpabilidad de cada conductor para la solidaridad; lo decisivo es si el hecho es uno solo o varios distintos.", "D: la solidaridad del artículo 2317 no está limitada a daños a las cosas."]}'::jsonb,
  'Doctrina sobre legitimación pasiva y solidaridad (art. 2317)'
)
on conflict (id) do nothing;

insert into public.alternativas
  (id, materia, subtema, nivel_exigencia, pregunta, opciones, correcta, retroalimentacion, fuente)
values (
  'ext-alt-025',
  'extracontractual',
  'Medida de la acción del art. 2316 inciso 2°',
  3,
  'Quien recibe un provecho de $2.000.000 derivado de un dolo ajeno del cual no fue cómplice, dolo que causó a la víctima un daño de $20.000.000, ¿hasta qué monto puede ser condenado conforme al artículo 2316 inciso segundo?',
  '["Hasta $20.000.000, el total del daño sufrido por la víctima, igual que el autor del dolo", "Hasta $2.000.000, el monto del provecho que efectivamente recibió, y no más", "Hasta la mitad del daño sufrido por la víctima, por aplicación de las reglas de división proporcional", "No puede ser condenado a nada, porque no participó en el dolo"]'::jsonb,
  1,
  '{"correcta": "Quien recibe provecho del dolo ajeno sin ser cómplice en él solo está obligado hasta la concurrencia de lo que valga ese provecho: aquí, $2.000.000, sin que el mayor daño sufrido por la víctima aumente su obligación.", "por_que_no": ["A: esa medida corresponde al autor del dolo, no a quien solo se benefició de él sin ser cómplice.", "C: el artículo 2316 inciso segundo no aplica una fracción del daño, sino el monto exacto del provecho recibido.", "D: sí responde, aunque de forma limitada al provecho recibido; no queda exento de toda obligación."]}'::jsonb,
  'Doctrina sobre la acción restitutoria del art. 2316 inciso 2°'
)
on conflict (id) do nothing;

insert into public.memorice_articulos
  (id, materia, subtema, articulo, texto, prioridad_ocultamiento, palabras_criticas, fuente)
values (
  'cc-art-2316',
  'extracontractual',
  'Legitimación pasiva: el autor y el que recibe provecho del dolo ajeno',
  '2316',
  'Es obligado a la indemnización el que hizo el daño, y sus herederos. El que recibe provecho del dolo ajeno, sin ser cómplice en él, sólo es obligado hasta concurrencia de lo que valga el provecho.',
  '[["provecho del dolo ajeno", "sin ser cómplice"], ["hasta concurrencia"], ["*"]]'::jsonb,
  array['provecho', 'sin ser cómplice', 'hasta concurrencia', 'herederos'],
  'Código Civil, art. 2316'
)
on conflict (id) do nothing;

-- LOTE 2026-07 (31): Extracontractual, Eje V (Tribunal, procedimiento y extinción de la acción, art. 2332)

insert into public.alternativas
  (id, materia, subtema, nivel_exigencia, pregunta, opciones, correcta, retroalimentacion, fuente)
values (
  'ext-alt-026',
  'extracontractual',
  'Transacción sobre la acción civil de un delito',
  2,
  '¿Puede la transacción recaer sobre la acción civil que nace de un delito?',
  '["Sí, sin perjuicio de la acción criminal", "No, la transacción está prohibida en materia de responsabilidad extracontractual", "Solo si media autorización judicial previa", "Solo respecto de daños materiales, nunca de daño moral"]'::jsonb,
  0,
  '{"correcta": "El Código Civil admite expresamente que la transacción puede recaer sobre la acción civil que nace de un delito, sin perjuicio de la acción criminal, porque su objeto es un crédito patrimonial ya devengado.", "por_que_no": ["B: la transacción está expresamente admitida, no prohibida.", "C: no se exige autorización judicial para transigir sobre la indemnización ya devengada.", "D: no existe esa limitación; la transacción puede comprender tanto daño material como moral, en tanto crédito patrimonial ya nacido."]}'::jsonb,
  'Código Civil, disposiciones sobre transacción y extinción de la responsabilidad extracontractual'
)
on conflict (id) do nothing;

insert into public.alternativas
  (id, materia, subtema, nivel_exigencia, pregunta, opciones, correcta, retroalimentacion, fuente)
values (
  'ext-alt-027',
  'extracontractual',
  'Plazo de prescripción del art. 2332',
  2,
  '¿Cuál es el plazo de prescripción de la acción indemnizatoria por delitos y cuasidelitos civiles conforme al artículo 2332?',
  '["Un año, contado desde que se tuvo conocimiento del daño", "Cuatro años, contados desde la perpetración del acto", "Cinco años, contados desde la celebración del hecho", "Dos años, igual que la prescripción de corto tiempo general"]'::jsonb,
  1,
  '{"correcta": "El artículo 2332 establece un plazo especial de prescripción de cuatro años, contado desde la perpetración del acto, para las acciones que concede el título de los delitos y cuasidelitos por daño o dolo.", "por_que_no": ["A: no es un año ni corre desde el conocimiento del daño, sino desde la perpetración del acto.", "C: cinco años es el plazo especial de responsabilidad del constructor por ruina de un edificio, no la regla general del art. 2332.", "D: la prescripción de corto tiempo general del Código Civil no es de dos años; además, el art. 2332 es un plazo especial distinto."]}'::jsonb,
  'Código Civil, art. 2332'
)
on conflict (id) do nothing;

insert into public.alternativas
  (id, materia, subtema, nivel_exigencia, pregunta, opciones, correcta, retroalimentacion, fuente)
values (
  'ext-alt-028',
  'extracontractual',
  'Suspensión del plazo de prescripción del art. 2332',
  4,
  '¿Se suspende el plazo de prescripción de cuatro años del artículo 2332 en favor de las personas enumeradas en las reglas generales de suspensión (incapaces)?',
  '["Sí, se aplican sin excepción las reglas generales de suspensión", "No, por tratarse de una prescripción de corto tiempo de carácter especial, no se suspende en favor de esas personas", "Se suspende solo respecto de los menores de edad, no de los dementes", "Se suspende únicamente si la víctima estuvo imposibilitada de conocer el daño"]'::jsonb,
  1,
  '{"correcta": "Se ha sostenido tradicionalmente que, tratándose de una prescripción de corto tiempo de carácter especial, el plazo del art. 2332 no se suspende en favor de las personas enumeradas en las reglas generales sobre prescripción.", "por_que_no": ["A: precisamente por su carácter especial y de corto tiempo, no se aplican sin más esas reglas generales de suspensión.", "C: la exclusión no distingue entre menores y dementes; se sostiene respecto de todas las personas enumeradas en las reglas generales.", "D: no existe esa causal específica de suspensión para el plazo del art. 2332."]}'::jsonb,
  'Doctrina sobre prescripción de corto tiempo especial (art. 2332)'
)
on conflict (id) do nothing;

insert into public.alternativas
  (id, materia, subtema, nivel_exigencia, pregunta, opciones, correcta, retroalimentacion, fuente)
values (
  'ext-alt-029',
  'extracontractual',
  'Improcedencia de la reserva de perjuicios en materia extracontractual',
  4,
  'En un juicio por delito o cuasidelito civil, ¿puede el tribunal reservar para la ejecución del fallo, o para un juicio diverso, lo relativo a la especie y monto de los perjuicios?',
  '["Sí, es la regla general en todo juicio indemnizatorio", "No; la jurisprudencia ha entendido que esa reserva no resulta aplicable en materia extracontractual, debiendo establecerse todos esos factores dentro de un solo juicio", "Sí, pero solo si ambas partes lo consienten expresamente", "No, salvo que se trate exclusivamente de daño moral"]'::jsonb,
  1,
  '{"correcta": "La jurisprudencia ha entendido que, en materia extracontractual, no resulta aplicable la norma que permite reservar para la ejecución del fallo, o para un juicio diverso, lo relativo a la especie y monto de los perjuicios: en los delitos y cuasidelitos civiles, todos estos factores deben quedar establecidos dentro de un solo juicio.", "por_que_no": ["A: es exactamente lo contrario de la regla aplicable en materia extracontractual.", "C: no se trata de una facultad disponible para las partes, sino de una regla sobre cómo debe tramitarse el juicio indemnizatorio.", "D: la regla no distingue según la clase de daño; rige tanto para el daño material como el moral."]}'::jsonb,
  'Jurisprudencia sobre tramitación del juicio indemnizatorio extracontractual'
)
on conflict (id) do nothing;

-- LOTE 2026-07 (32): Extracontractual, Eje W (Dualidad o unidad de regímenes; diferencias entre estatutos)

insert into public.alternativas
  (id, materia, subtema, nivel_exigencia, pregunta, opciones, correcta, retroalimentacion, fuente)
values (
  'ext-alt-030',
  'extracontractual',
  'Prueba de la culpa: contractual vs. extracontractual',
  3,
  '¿En cuál de los dos estatutos se presume la culpa del deudor por el solo incumplimiento?',
  '["En el extracontractual, correspondiendo al demandado probar su propia diligencia", "En el contractual (art. 1547 inciso tercero), correspondiendo al deudor acreditar que actuó con la diligencia debida", "En ambos estatutos por igual, sin diferencia alguna", "En ninguno de los dos: la culpa siempre debe ser probada por quien la alega"]'::jsonb,
  1,
  '{"correcta": "En materia contractual, el incumplimiento hace presumir la culpa del deudor conforme al art. 1547 inciso tercero, correspondiéndole a él acreditar que actuó con la diligencia debida. En materia extracontractual, en cambio, corresponde en principio a la víctima probar la culpa del demandado.", "por_que_no": ["A: es exactamente al revés; en materia extracontractual, en principio, es la víctima quien debe probar la culpa.", "C: existe justamente esta diferencia entre ambos estatutos.", "D: en materia contractual la culpa se presume; no siempre debe probarla quien la alega."]}'::jsonb,
  'Código Civil, art. 1547 inciso 3°; diferencias entre estatutos'
)
on conflict (id) do nothing;

insert into public.alternativas
  (id, materia, subtema, nivel_exigencia, pregunta, opciones, correcta, retroalimentacion, fuente)
values (
  'ext-alt-031',
  'extracontractual',
  'Necesidad de mora: contractual vs. extracontractual',
  3,
  '¿Es necesario constituir en mora al responsable para que proceda la indemnización en materia extracontractual?',
  '["Sí, exactamente igual que en materia contractual", "No; la obligación de indemnizar nace directamente con el hecho ilícito dañoso, sin necesidad de constituir en mora a nadie", "Solo si el daño es de carácter patrimonial, no si es daño moral", "Sí, pero únicamente cuando el hecho ilícito también tiene sanción penal"]'::jsonb,
  1,
  '{"correcta": "La obligación extracontractual de indemnizar nace directamente con el hecho ilícito dañoso, sin que sea necesario constituir en mora a nadie, a diferencia de la responsabilidad contractual, que exige la mora como presupuesto (arts. 1551 y 1557).", "por_que_no": ["A: es precisamente una de las diferencias entre ambos estatutos; en materia contractual sí se exige mora.", "C: la regla no distingue según la clase de daño.", "D: la regla no depende de si el hecho tiene, además, sanción penal."]}'::jsonb,
  'Doctrina sobre diferencias entre responsabilidad contractual y extracontractual'
)
on conflict (id) do nothing;

insert into public.alternativas
  (id, materia, subtema, nivel_exigencia, pregunta, opciones, correcta, retroalimentacion, fuente)
values (
  'ext-alt-032',
  'extracontractual',
  'Diferencias que no se reconducen a la distinción estructural',
  5,
  'De las siguientes diferencias entre el estatuto contractual y el extracontractual, ¿cuál de ellas NO se deriva, según el manual, con la misma nitidez de la distinción estructural (presencia o ausencia de una obligación previa entre las partes)?',
  '["La exigencia de mora en materia contractual y su ausencia en materia extracontractual", "La graduación de la culpa según a quién beneficia el contrato", "La extensión de las incapacidades, sensiblemente más amplia en materia contractual", "La procedencia de la cláusula penal solo en materia contractual"]'::jsonb,
  2,
  '{"correcta": "La extensión de las incapacidades, junto con el tratamiento de los perjuicios imprevistos y los efectos agravados del dolo contractual, no se derivan con la misma nitidez de la distinción estructural, y pueden calificarse de decisiones legislativas más autónomas.", "por_que_no": ["A: la mora sí se reconduce directamente a esa distinción: solo puede estar en mora quien debía una prestación previa determinada.", "B: la graduación de la culpa según a quién beneficia el contrato también se reconduce a la existencia de una relación previa negociada.", "D: la procedencia de la cláusula penal también se explica por la existencia de una obligación previa cuya fuente las partes conocen de antemano."]}'::jsonb,
  'Doctrina sobre la reconducción de las diferencias entre estatutos a una distinción estructural única'
)
on conflict (id) do nothing;

insert into public.alternativas
  (id, materia, subtema, nivel_exigencia, pregunta, opciones, correcta, retroalimentacion, fuente)
values (
  'ext-alt-033',
  'extracontractual',
  'Fuentes de las obligaciones según el art. 1437',
  2,
  '¿Qué fuentes de las obligaciones opone el artículo 1437 del Código Civil como distintas entre sí?',
  '["El contrato y el hecho que ha inferido injuria o daño", "La ley y la voluntad unilateral, únicamente", "El cuasicontrato y el delito, exclusivamente", "La convención y la sentencia judicial"]'::jsonb,
  0,
  '{"correcta": "El artículo 1437 opone como fuentes distintas de las obligaciones el contrato y el hecho que ha inferido injuria o daño, respaldo textual central de la tesis dualista de la responsabilidad civil.", "por_que_no": ["B: la ley y la voluntad unilateral no son la oposición que establece este artículo.", "C: el cuasicontrato y el delito no son, en este artículo, las fuentes contrapuestas.", "D: la convención y la sentencia judicial no son las fuentes que opone el art. 1437."]}'::jsonb,
  'Código Civil, art. 1437'
)
on conflict (id) do nothing;

insert into public.memorice_articulos
  (id, materia, subtema, articulo, texto, prioridad_ocultamiento, palabras_criticas, fuente)
values (
  'cc-art-44',
  'extracontractual',
  'Los tres grados de culpa y el dolo',
  '44',
  'La ley distingue tres especies de culpa o descuido. Culpa grave, negligencia grave, culpa lata, es la que consiste en no manejar los negocios ajenos con aquella diligencia que aun las personas negligentes y de poca prudencia suelen emplear en sus negocios propios. Esta culpa en materias civiles equivale al dolo. Culpa leve, descuido leve, descuido ligero, es la falta de aquella diligencia y cuidado que los hombres emplean ordinariamente en sus negocios propios. Culpa o descuido, sin otra calificación, significa culpa o descuido leve. Esta especie de culpa se opone a la diligencia o cuidado ordinario o mediano. El que debe administrar un negocio como un buen padre de familia es responsable de esta especie de culpa. Culpa o descuido levísimo es la falta de aquella esmerada diligencia que un hombre juicioso emplea en la administración de sus negocios importantes. Esta especie de culpa se opone a la suma diligencia o cuidado. El dolo consiste en la intención positiva de inferir injuria a la persona o propiedad de otro.',
  '[["equivale al dolo"], ["buen padre de familia"], ["intención positiva de inferir injuria"], ["*"]]'::jsonb,
  array['culpa grave', 'culpa leve', 'culpa levísima', 'equivale al dolo', 'buen padre de familia', 'intención positiva de inferir injuria'],
  'Código Civil, art. 44'
)
on conflict (id) do nothing;

-- LOTE 2026-07 (33): Extracontractual, Eje X (Cúmulo o concurso de responsabilidades)

insert into public.alternativas
  (id, materia, subtema, nivel_exigencia, pregunta, opciones, correcta, retroalimentacion, fuente)
values (
  'ext-alt-034',
  'extracontractual',
  'Acumulación: doble indemnización rechazada',
  2,
  '¿Puede la víctima acumular ambas indemnizaciones, la contractual y la extracontractual, por un mismo daño, cobrando efectivamente dos veces?',
  '["Sí, siempre que ambos estatutos resulten en principio aplicables al mismo hecho", "No, porque ello se traduciría en un enriquecimiento sin causa de la víctima, indemnizada dos veces por un mismo perjuicio", "Sí, pero solo hasta el monto del daño moral", "No, salvo que las partes lo hayan pactado expresamente"]'::jsonb,
  1,
  '{"correcta": "La responsabilidad contractual no puede acumularse a la extracontractual, porque ello se traduciría en un enriquecimiento sin causa de la víctima, que resultaría indemnizada dos veces por un mismo perjuicio.", "por_que_no": ["A: la aplicabilidad alternativa de ambos estatutos es precisamente el problema de la opción, distinto del problema de la acumulación, que se rechaza sin mayor controversia.", "C: la prohibición de acumular no distingue entre daño moral y patrimonial.", "D: la acumulación (cobrar dos veces por el mismo daño) no se admite ni siquiera por pacto expreso, a diferencia de la opción entre estatutos."]}'::jsonb,
  'Doctrina sobre el cúmulo de responsabilidades: la cuestión de la acumulación'
)
on conflict (id) do nothing;

insert into public.alternativas
  (id, materia, subtema, nivel_exigencia, pregunta, opciones, correcta, retroalimentacion, fuente)
values (
  'ext-alt-035',
  'extracontractual',
  'Posición dominante sobre la opción entre estatutos',
  3,
  '¿Cuál es la posición dominante en Chile respecto de si la víctima puede optar por el estatuto de responsabilidad que le resulte más provechoso, cuando un mismo hecho reúne los caracteres de ambos?',
  '["Se rechaza la opción, fundada en la fuerza obligatoria del contrato (art. 1545) y en el carácter especial de la responsabilidad contractual frente al carácter residual de la extracontractual", "Se acepta la opción sin restricciones, porque la víctima siempre puede elegir el estatuto que más le convenga", "Se acepta la opción solo si el juez la autoriza expresamente en cada caso", "Se rechaza la opción de forma absoluta, sin reconocerse ninguna excepción"]'::jsonb,
  0,
  '{"correcta": "La doctrina y la jurisprudencia nacionales se han manifestado tradicionalmente en contra de reconocer a la víctima esta opción, fundándose en la fuerza obligatoria del contrato (art. 1545) y en el carácter de especialidad de la responsabilidad contractual frente al carácter residual de la extracontractual.", "por_que_no": ["B: la posición dominante es precisamente de rechazo, no de aceptación sin restricciones.", "C: no se exige autorización judicial caso a caso; la regla general opera sin ese trámite.", "D: sí se reconocen excepciones (Alessandri, Corral), de modo que el rechazo no es absoluto."]}'::jsonb,
  'Doctrina sobre la posición dominante frente al cúmulo de responsabilidades'
)
on conflict (id) do nothing;

insert into public.alternativas
  (id, materia, subtema, nivel_exigencia, pregunta, opciones, correcta, retroalimentacion, fuente)
values (
  'ext-alt-036',
  'extracontractual',
  'Acumulación procesal cuando un tercero es ajeno al contrato',
  4,
  'Un mismo hecho genera responsabilidad contractual respecto de las partes de un contrato, y responsabilidad extracontractual respecto de un tercero ajeno a él. ¿Pueden acumularse procesalmente, en un mismo juicio, la acción contractual de las partes y la acción extracontractual del tercero?',
  '["No, porque cada acción debe tramitarse en un juicio separado según su propio estatuto", "Sí, sin inconveniente, porque unas y otras emanan directa e inmediatamente de un mismo hecho", "Solo si el tercero renuncia previamente a su acción extracontractual", "No, salvo que el tercero también sea parte del contrato"]'::jsonb,
  1,
  '{"correcta": "En esta hipótesis no existe inconveniente alguno para admitir la acumulación procesal de ambas acciones en un mismo juicio, porque unas y otras emanan directa e inmediatamente de un mismo hecho, cumpliéndose el requisito general que la ley procesal exige para la acumulación de acciones.", "por_que_no": ["A: precisamente por emanar del mismo hecho, no hay obstáculo para tramitarlas juntas.", "C: no se exige esa renuncia; ambas acciones pueden coexistir en el mismo juicio.", "D: el tercero, por definición, es ajeno al contrato; eso no impide la acumulación procesal, sino que explica por qué no hay riesgo de doble indemnización de un mismo perjuicio."]}'::jsonb,
  'Doctrina sobre ejercicio conjunto de acciones en el cúmulo de responsabilidades'
)
on conflict (id) do nothing;

insert into public.alternativas
  (id, materia, subtema, nivel_exigencia, pregunta, opciones, correcta, retroalimentacion, fuente)
values (
  'ext-alt-037',
  'extracontractual',
  'Límite al criterio amplio de Corral',
  5,
  'Según el criterio de CORRAL, que admite el cúmulo cada vez que el daño sería igualmente indemnizable con prescindencia del contrato, ¿en qué caso no será admisible el cúmulo pese a que el hecho sea, en principio, independientemente ilícito?',
  '["Cuando el hecho sea penalmente sancionable", "Cuando el sometimiento a la distribución contractual de riesgos emane de la naturaleza misma del contrato o resulte impuesto por la buena fe, o cuando las partes lo hayan pactado expresamente", "Cuando la víctima sea una persona jurídica y no una persona natural", "Cuando el contrato no conste por escrito"]'::jsonb,
  1,
  '{"correcta": "Corral reconoce un límite a su propio criterio amplio: el cúmulo no será admisible, y deberá aplicarse íntegramente el régimen contractual, cuando las partes lo hayan pactado expresamente, o cuando, a falta de pacto, el sometimiento a la distribución de riesgos del contrato emane de su propia naturaleza o resulte impuesto por la buena fe.", "por_que_no": ["A: que el hecho sea penalmente sancionable es, precisamente, uno de los supuestos en que Corral SÍ admite el cúmulo, no un límite a él.", "C: el criterio no distingue según la naturaleza jurídica o natural de la víctima.", "D: la forma escrita o no del contrato no es el criterio que determina este límite."]}'::jsonb,
  'Doctrina de Corral sobre el criterio amplio del cúmulo de responsabilidades y su límite'
)
on conflict (id) do nothing;

insert into public.memorice_articulos
  (id, materia, subtema, articulo, texto, prioridad_ocultamiento, palabras_criticas, fuente)
values (
  'cc-art-1545',
  'extracontractual',
  'Fuerza obligatoria del contrato, fundamento del rechazo a la opción entre estatutos',
  '1545',
  'Todo contrato legalmente celebrado es una ley para los contratantes, y no puede ser invalidado sino por su consentimiento mutuo o por causas legales.',
  '[["ley para los contratantes"], ["consentimiento mutuo", "causas legales"], ["*"]]'::jsonb,
  array['ley para los contratantes', 'consentimiento mutuo', 'causas legales'],
  'Código Civil, art. 1545'
)
on conflict (id) do nothing;

-- LOTE 2026-07 (34): Extracontractual, Eje Y (Responsabilidad precontractual, por nulidad y postcontractual)

insert into public.alternativas
  (id, materia, subtema, nivel_exigencia, pregunta, opciones, correcta, retroalimentacion, fuente)
values (
  'ext-alt-038',
  'extracontractual',
  'Desistimiento unilateral de una negociación',
  2,
  '¿Existe responsabilidad por el solo desistimiento unilateral de una negociación, según la doctrina tradicional?',
  '["Sí, siempre que la otra parte haya sufrido algún daño", "No, porque constituye el ejercicio legítimo del derecho a desistirse de un contrato eventual, aunque de ello se sigan daños para la otra parte", "Sí, pero solo si la negociación duró más de seis meses", "No, salvo que exista un contrato de promesa ya firmado"]'::jsonb,
  1,
  '{"correcta": "La doctrina tradicional sostiene que no existe responsabilidad por el desistimiento unilateral de la negociación, porque este constituye el ejercicio legítimo del derecho a desistirse de un contrato eventual, aunque de ese desistimiento se sigan daños para la otra parte.", "por_que_no": ["A: el solo daño no basta; la doctrina tradicional lo considera, en principio, un ejercicio legítimo de un derecho.", "C: no existe ese criterio de duración mínima en la regla general.", "D: si existe promesa, el régimen aplicable es directamente el contractual, no el de la negociación preliminar."]}'::jsonb,
  'Doctrina tradicional sobre la etapa de negociación preliminar'
)
on conflict (id) do nothing;

insert into public.alternativas
  (id, materia, subtema, nivel_exigencia, pregunta, opciones, correcta, retroalimentacion, fuente)
values (
  'ext-alt-039',
  'extracontractual',
  'Los tres requisitos de Rosende',
  4,
  '¿Cuáles son los tres requisitos que ROSENDE exige, en el sistema chileno, para que nazca responsabilidad precontractual?',
  '["Buena fe, capacidad y objeto lícito", "Consentimiento en entrar en las tratativas preliminares, gastos efectuados en vías del contrato proyectado, y un retiro unilateral de las negociaciones contrario a la buena fe", "Oferta, aceptación y plazo de vigencia de la oferta", "Culpa grave, dolo y daño moral"]'::jsonb,
  1,
  '{"correcta": "Rosende sintetiza tres requisitos: que exista consentimiento en entrar en las tratativas preliminares, que se hayan efectuado gastos por alguna de las partes en vías del contrato proyectado, y que exista un retiro unilateral de las negociaciones contrario a la buena fe.", "por_que_no": ["A: esos son elementos de la formación del consentimiento y de los requisitos del acto jurídico, no los requisitos de Rosende.", "C: esos son elementos de la oferta, no los requisitos para la responsabilidad precontractual.", "D: la responsabilidad precontractual no exige culpa grave ni dolo como estándar único, ni se limita al daño moral."]}'::jsonb,
  'Doctrina de Rosende sobre responsabilidad precontractual en el derecho chileno'
)
on conflict (id) do nothing;

insert into public.alternativas
  (id, materia, subtema, nivel_exigencia, pregunta, opciones, correcta, retroalimentacion, fuente)
values (
  'ext-alt-040',
  'extracontractual',
  'Naturaleza de la responsabilidad por incumplimiento de la promesa',
  3,
  '¿Qué naturaleza tiene la responsabilidad que se sigue del incumplimiento de un contrato de promesa?',
  '["Precontractual, porque el contrato definitivo todavía no se ha celebrado", "Contractual, porque la promesa es en sí misma un contrato que cumple con sus propios requisitos legales", "Extracontractual, porque las partes de una promesa siguen siendo jurídicamente extrañas entre sí", "Legal, en los mismos términos que la responsabilidad por nulidad según Rodríguez Grez"]'::jsonb,
  1,
  '{"correcta": "El contrato de promesa es, en sí mismo, un contrato, según sus propios requisitos legales; por eso, la responsabilidad que se sigue de su incumplimiento es netamente contractual y no se rige por las reglas de la responsabilidad precontractual.", "por_que_no": ["A: la promesa no es una simple negociación previa, sino un contrato ya celebrado.", "C: la promesa genera un vínculo contractual entre las partes; no son jurídicamente extrañas entre sí.", "D: la calificación de responsabilidad legal corresponde, para Rodríguez Grez, a la responsabilidad por nulidad, no a la de la promesa."]}'::jsonb,
  'Doctrina sobre el contrato de promesa y la responsabilidad precontractual'
)
on conflict (id) do nothing;

insert into public.alternativas
  (id, materia, subtema, nivel_exigencia, pregunta, opciones, correcta, retroalimentacion, fuente)
values (
  'ext-alt-041',
  'extracontractual',
  'Régimen aplicable a la responsabilidad postcontractual (Corral)',
  4,
  'Frente a los daños causados por hechos posteriores a la expiración de un contrato (responsabilidad postcontractual), ¿qué régimen prefiere CORRAL, y cuál es la excepción que él mismo reconoce?',
  '["El régimen contractual siempre, sin excepciones", "El régimen extracontractual como regla general, salvo que la ley sancione el ejercicio abusivo de la terminación del contrato disponiendo la conservación del mismo, caso en que la responsabilidad será contractual", "El régimen extracontractual siempre, sin ninguna excepción posible", "El régimen que las partes hayan pactado expresamente para el período posterior a la expiración del contrato"]'::jsonb,
  1,
  '{"correcta": "Corral se inclina por el régimen extracontractual como regla general para la responsabilidad postcontractual, con una salvedad: si la ley sanciona el ejercicio abusivo de la facultad de poner término a un contrato disponiendo, como consecuencia, la conservación del contrato mismo, la responsabilidad será contractual, porque el contrato no ha llegado a extinguirse en los términos pretendidos.", "por_que_no": ["A: Corral no sostiene el régimen contractual como regla general, sino como excepción acotada.", "C: sí reconoce una excepción expresa, la de la conservación forzada del contrato.", "D: el criterio de Corral no depende de un pacto expreso de las partes sobre el período posterior a la expiración."]}'::jsonb,
  'Doctrina de Corral sobre responsabilidad postcontractual'
)
on conflict (id) do nothing;

-- LOTE 2026-07 (35): Precontractual, Eje A (Planteamiento del problema y concepto de responsabilidad precontractual)

insert into public.alternativas
  (id, materia, subtema, nivel_exigencia, pregunta, opciones, correcta, retroalimentacion, fuente)
values (
  'pre-alt-001',
  'precontractual',
  'Vacío legal en la formación del consentimiento',
  2,
  '¿Regula el Código Civil chileno, como regla general, la formación del consentimiento durante la etapa previa a la celebración de un contrato?',
  '["Sí, de manera exhaustiva, en un título especial dedicado a la materia", "No, salvo en lo relativo al contrato de promesa (art. 1554); existe un vacío legal en lo demás", "Sí, pero solo tratándose de contratos mercantiles", "No, y tampoco existe ninguna norma que se ocupe siquiera de la etapa de la oferta"]'::jsonb,
  1,
  '{"correcta": "El Código Civil chileno no se ocupa de la formación del consentimiento, salvo en lo relativo al contrato de promesa (art. 1554). Ese vacío fue remediado solo parcialmente por el legislador mercantil.", "por_que_no": ["A: no existe esa regulación exhaustiva en el Código Civil.", "C: la referencia expresa que sí existe (art. 1554) es de aplicación general, no exclusiva de la materia mercantil.", "D: sí existe una regulación parcial de la etapa de la oferta, en los arts. 97 a 106 del Código de Comercio."]}'::jsonb,
  'Código Civil, art. 1554; vacío legal en la formación del consentimiento'
)
on conflict (id) do nothing;

insert into public.alternativas
  (id, materia, subtema, nivel_exigencia, pregunta, opciones, correcta, retroalimentacion, fuente)
values (
  'pre-alt-002',
  'precontractual',
  'Regulación mercantil parcial del período precontractual',
  3,
  '¿Qué artículos del Código de Comercio regulan, parcialmente, el período precontractual, y desde qué momento parten?',
  '["Los artículos 97 a 106, partiendo del supuesto de que ya existe una oferta formulada", "Los artículos 1 a 10, que regulan los tratos negociales previos desde el primer contacto entre las partes", "Los artículos 97 a 106, que regulan exclusivamente los tratos negociales previos a la oferta", "No existe ninguna norma en el Código de Comercio sobre esta materia"]'::jsonb,
  0,
  '{"correcta": "Los artículos 97 a 106 del Código de Comercio remedian solo parcialmente el vacío del Código Civil, partiendo todos del supuesto de que ya se ha formulado una oferta; el tramo anterior, los tratos negociales previos, queda sin regulación expresa.", "por_que_no": ["B: esos no son los artículos ni la materia que regulan los arts. 1 a 10 del Código de Comercio.", "C: esos artículos parten precisamente de que ya existe oferta; no regulan la etapa previa a ella.", "D: sí existe esa norma parcial en el Código de Comercio."]}'::jsonb,
  'Código de Comercio, arts. 97 a 106'
)
on conflict (id) do nothing;

insert into public.alternativas
  (id, materia, subtema, nivel_exigencia, pregunta, opciones, correcta, retroalimentacion, fuente)
values (
  'pre-alt-003',
  'precontractual',
  'Los tres elementos copulativos de la responsabilidad precontractual',
  3,
  '¿Cuáles son los tres elementos que, copulativamente, generan responsabilidad precontractual según el núcleo común de las definiciones examinadas?',
  '["Un daño efectivo, una expectativa razonable creada por la conducta de la contraparte, y una conducta que defrauda esa expectativa concreta", "La existencia de un contrato de promesa, un plazo vencido, y la mala fe de una de las partes", "Un daño moral, dolo probado, y la ausencia de toda negociación previa", "La sola frustración de la negociación, sin necesidad de ningún otro requisito"]'::jsonb,
  0,
  '{"correcta": "El núcleo común de las definiciones examinadas exige siempre un daño efectivo, una expectativa razonable generada por la conducta de la contraparte, y una conducta que defrauda esa expectativa concreta.", "por_que_no": ["B: la responsabilidad precontractual no presupone un contrato de promesa; de hecho, la promesa se rige por reglas distintas.", "C: no se exige específicamente daño moral ni dolo probado como estándar único.", "D: la sola frustración de la negociación, sin más, no genera responsabilidad."]}'::jsonb,
  'Doctrina sobre el concepto de responsabilidad precontractual (Saavedra, Picasso, De los Mozos)'
)
on conflict (id) do nothing;

insert into public.alternativas
  (id, materia, subtema, nivel_exigencia, pregunta, opciones, correcta, retroalimentacion, fuente)
values (
  'pre-alt-004',
  'precontractual',
  'Las dos etapas del período precontractual (Orrego)',
  3,
  'Según ORREGO, ¿en cuántas etapas se divide el período precontractual, y cuáles son?',
  '["En dos: los tratos negociales previos (antes de la oferta) y la etapa que se inicia con la oferta", "En tres: la oferta, la aceptación y la celebración del contrato prometido", "En una sola etapa indivisible, que comienza con la oferta", "En dos: la etapa contractual y la etapa extracontractual"]'::jsonb,
  0,
  '{"correcta": "Orrego distingue dos grandes etapas: los tratos negociales previos o negociaciones preliminares (antes de que exista una oferta), y la etapa que se inicia con la formulación de la oferta por alguna de las partes.", "por_que_no": ["B: esas son etapas de la formación del consentimiento en general, no la división que propone Orrego para el período precontractual.", "C: Orrego sí distingue dos etapas, no una sola.", "D: esa distinción corresponde a los estatutos de responsabilidad civil, no a las etapas del período precontractual."]}'::jsonb,
  'Doctrina de Orrego sobre las etapas del período precontractual'
)
on conflict (id) do nothing;

insert into public.memorice_articulos
  (id, materia, subtema, articulo, texto, prioridad_ocultamiento, palabras_criticas, fuente)
values (
  'cc-art-1554',
  'precontractual',
  'El contrato de promesa y sus cuatro requisitos',
  '1554',
  'La promesa de celebrar un contrato no produce obligación alguna; salvo que concurran las circunstancias siguientes: 1a. Que la promesa conste por escrito; 2a. Que el contrato prometido no sea de aquellos que las leyes declaran ineficaces; 3a. Que la promesa contenga un plazo o condición que fije la época de la celebración del contrato; 4a. Que en ella se especifique de tal manera el contrato prometido, que sólo falten para que sea perfecto, la tradición de la cosa, o las solemnidades que las leyes prescriban.',
  '[["conste por escrito"], ["plazo o condición"], ["solo falten", "tradición de la cosa", "solemnidades"], ["*"]]'::jsonb,
  array['conste por escrito', 'plazo o condición', 'solo falten', 'tradición de la cosa', 'solemnidades'],
  'Código Civil, art. 1554'
)
on conflict (id) do nothing;

-- LOTE 2026-07 (36): Precontractual, Eje B (Evolución doctrinaria: de la doctrina tradicional a la doctrina moderna)

insert into public.alternativas
  (id, materia, subtema, nivel_exigencia, pregunta, opciones, correcta, retroalimentacion, fuente)
values (
  'pre-alt-005',
  'precontractual',
  'Las tres fases de la doctrina tradicional',
  2,
  '¿Cuáles son las tres fases que la doctrina tradicional reconoce en la formación del consentimiento?',
  '["Los meros hechos sociales, la oferta, y la promesa de contrato", "La negociación, la aceptación, y la ejecución del contrato", "La oferta, la contraoferta, y la aceptación", "La capacidad, el objeto lícito, y la causa lícita"]'::jsonb,
  0,
  '{"correcta": "La doctrina tradicional reconoce tres períodos: la fase de los meros hechos sociales, la fase de la oferta, y la fase de la promesa de contrato.", "por_que_no": ["B: esas etapas no corresponden a la periodización de la doctrina tradicional sobre este punto.", "C: la contraoferta no es una de las tres fases de esta periodización.", "D: esos son requisitos del acto jurídico en general, no las fases de este debate."]}'::jsonb,
  'Doctrina tradicional sobre la formación del consentimiento'
)
on conflict (id) do nothing;

insert into public.alternativas
  (id, materia, subtema, nivel_exigencia, pregunta, opciones, correcta, retroalimentacion, fuente)
values (
  'pre-alt-006',
  'precontractual',
  'Obra y año de la doctrina de Ihering',
  2,
  '¿En qué año y en qué obra expuso IHERING su doctrina de la culpa in contrahendo?',
  '["En 1907, en \"Responsabilidad precontractual\"", "En 1860, en \"De la culpa in contrahendo o de los daños y perjuicios en las convenciones nulas o que permanecieron imperfectas\"", "En 1906, en \"De los períodos precontractuales y de su verdadera y exacta construcción científica\"", "En 1900, en el Código Civil alemán (BGB)"]'::jsonb,
  1,
  '{"correcta": "Ihering expuso su doctrina en 1860, en la obra De la culpa in contrahendo o de los daños y perjuicios en las convenciones nulas o que permanecieron imperfectas.", "por_que_no": ["A: 1907 y ese título corresponden a Saleilles, quien acuñó la expresión responsabilidad precontractual.", "C: esa obra y año corresponden a Faggella.", "D: el BGB de 1900 recogió parcialmente la tesis de Ihering, pero no es la obra en que él la expuso."]}'::jsonb,
  'Doctrina de Ihering sobre la culpa in contrahendo'
)
on conflict (id) do nothing;

insert into public.alternativas
  (id, materia, subtema, nivel_exigencia, pregunta, opciones, correcta, retroalimentacion, fuente)
values (
  'pre-alt-007',
  'precontractual',
  'La culpa in contrahendo presupone oferta (Ihering)',
  3,
  'Para IHERING, ¿presupone la culpa in contrahendo que ya se ha formulado una oferta?',
  '["Sí; las meras tratativas, para él, no originan responsabilidad", "No; para él, la responsabilidad nace desde el primer contacto entre las partes", "Solo si el contrato prometido es solemne", "No; Ihering nunca exigió ningún momento de inicio determinado"]'::jsonb,
  0,
  '{"correcta": "Para Ihering, la culpa in contrahendo presupone que ya se ha formulado una oferta; las meras tratativas no originan responsabilidad bajo su doctrina. Fue Faggella quien extendió el análisis hacia los tratos negociales previos.", "por_que_no": ["B: esa extensión hacia el primer contacto es, precisamente, el aporte posterior de Faggella, no la posición de Ihering.", "C: la exigencia de oferta previa no depende de si el contrato es solemne o no.", "D: Ihering sí fija un momento de inicio preciso: la formulación de la oferta."]}'::jsonb,
  'Doctrina de Ihering sobre la culpa in contrahendo'
)
on conflict (id) do nothing;

insert into public.alternativas
  (id, materia, subtema, nivel_exigencia, pregunta, opciones, correcta, retroalimentacion, fuente)
values (
  'pre-alt-008',
  'precontractual',
  'El fundamento de Faggella: transgresión del acuerdo de negociar',
  4,
  'Para FAGGELLA, ¿cuál es el fundamento de la responsabilidad por ruptura de las negociaciones?',
  '["La culpa, en los mismos términos que sostenía Ihering", "La violación del acuerdo expreso o tácito que las partes concluyeron para entablar negociaciones, transgresión que puede existir sin dolo ni culpa", "La infracción de los usos y la equidad comercial, exclusivamente", "La sola existencia de un daño, sin necesidad de ningún otro elemento"]'::jsonb,
  1,
  '{"correcta": "Para Faggella, el fundamento no es la culpa, como sostenía Ihering, sino la violación del acuerdo expreso o tácito que las partes habían concluido para entablar negociaciones; esta violación puede existir sin dolo ni negligencia, bastando una transgresión arbitraria y sin motivo de las tratativas.", "por_que_no": ["A: Faggella se aparta expresamente de la culpa como fundamento; ese es el criterio de Ihering.", "C: la equidad comercial como estándar corresponde a Saleilles, no a Faggella.", "D: Faggella exige, además del daño, la transgresión del acuerdo de negociar; el daño solo no basta."]}'::jsonb,
  'Doctrina de Faggella sobre el fundamento de la responsabilidad precontractual'
)
on conflict (id) do nothing;

insert into public.alternativas
  (id, materia, subtema, nivel_exigencia, pregunta, opciones, correcta, retroalimentacion, fuente)
values (
  'pre-alt-009',
  'precontractual',
  'Origen de la expresión "responsabilidad precontractual"',
  2,
  '¿Quién empleó por primera vez la expresión "responsabilidad precontractual", y en qué año?',
  '["Ihering, en 1860", "Faggella, en 1906", "Saleilles, en 1907", "Rosende, en el siglo XX en Chile"]'::jsonb,
  2,
  '{"correcta": "Será el jurista francés Raymond Saleilles quien, en 1907, emplee por primera vez la expresión responsabilidad precontractual.", "por_que_no": ["A: Ihering, en 1860, habló de culpa in contrahendo, no de responsabilidad precontractual.", "B: Faggella, en 1906, extendió el período relevante, pero no acuñó esa expresión específica.", "D: Rosende es un autor chileno posterior, que sintetiza los requisitos de esta responsabilidad en el sistema local, no quien acuñó la expresión."]}'::jsonb,
  'Doctrina de Saleilles sobre responsabilidad precontractual'
)
on conflict (id) do nothing;

-- LOTE 2026-07 (37): Precontractual, Eje C (Las etapas del proceso de formación del contrato y el estatuto de responsabilidad aplicable en cada una)

insert into public.alternativas
  (id, materia, subtema, nivel_exigencia, pregunta, opciones, correcta, retroalimentacion, fuente)
values (
  'pre-alt-010',
  'precontractual',
  'Cierre de negocio vs. arras: el tercero depositario',
  3,
  '¿Qué elemento decide si una suma de dinero entregada para asegurar la seriedad de un futuro contrato configura arras o cierre de negocio?',
  '["El monto de la suma entregada", "La presencia o ausencia de un tercero depositario que retiene la suma hasta que se cumpla o no el compromiso", "El momento del día en que se realiza la entrega", "El tipo de contrato definitivo que se proyecta celebrar"]'::jsonb,
  1,
  '{"correcta": "El elemento que decide la calificación no es el monto ni el momento, sino la presencia o ausencia de un tercero depositario, típicamente el corredor: si el dinero queda en su poder, hay cierre de negocio; si se entrega directamente entre las partes, hay arras.", "por_que_no": ["A: el monto de la suma no es el criterio distintivo entre ambas figuras.", "C: el momento de la entrega tampoco decide la calificación.", "D: la naturaleza del contrato definitivo proyectado no es lo que distingue arras de cierre de negocio."]}'::jsonb,
  'Doctrina sobre el cierre de negocio y su distinción con las arras'
)
on conflict (id) do nothing;

insert into public.alternativas
  (id, materia, subtema, nivel_exigencia, pregunta, opciones, correcta, retroalimentacion, fuente)
values (
  'pre-alt-011',
  'precontractual',
  'Estatuto del contrato preparatorio',
  2,
  '¿Cuál es el estatuto de responsabilidad aplicable al incumplimiento de un contrato preparatorio (por ejemplo, una promesa), según la periodización examinada?',
  '["Contractual, sin discusión, porque ya existe un contrato válidamente celebrado", "Extracontractual, porque el contrato definitivo todavía no se ha celebrado", "Legal, en los mismos términos que la retractación tempestiva de la oferta", "Discutido entre responsabilidad cuasicontractual, contractual condicionada y contrato innominado"]'::jsonb,
  0,
  '{"correcta": "En cuanto al fundamento de la responsabilidad del contrato preparatorio, la regla es simple y no admite mayor discusión: si ya se acordó el contrato preparatorio, la responsabilidad que origine su incumplimiento será contractual, como ocurre con el incumplimiento de una promesa.", "por_que_no": ["B: el contrato preparatorio ya es, en sí mismo, un contrato válidamente celebrado; no es necesario que el contrato definitivo se celebre para que su incumplimiento sea contractual.", "C: la calificación legal corresponde a la retractación tempestiva de la oferta (art. 100 C. de Comercio), no al contrato preparatorio.", "D: esa discusión tripartita corresponde al cierre de negocio, no al contrato preparatorio, cuyo estatuto no se discute."]}'::jsonb,
  'Doctrina sobre el contrato preparatorio y su estatuto de responsabilidad'
)
on conflict (id) do nothing;

insert into public.alternativas
  (id, materia, subtema, nivel_exigencia, pregunta, opciones, correcta, retroalimentacion, fuente)
values (
  'pre-alt-012',
  'precontractual',
  'Retractación intempestiva no avisada (art. 98 C. de Comercio)',
  4,
  'Si el oferente se retracta de su propuesta y no avisa oportunamente de esa retractación al destinatario, quien por ello acepta extemporáneamente, ¿qué régimen de responsabilidad resulta aplicable conforme al artículo 98 del Código de Comercio?',
  '["Responsabilidad extracontractual, porque no existe vínculo preexistente entre las partes desde que el oferente se retractó", "Responsabilidad contractual, porque la oferta aceptada forma un contrato perfecto", "Responsabilidad legal, en los mismos términos que la retractación tempestiva del art. 100", "Ninguna responsabilidad, porque la propuesta se tiene simplemente por no hecha"]'::jsonb,
  0,
  '{"correcta": "Conforme al art. 98, puede nacer responsabilidad indemnizatoria para el oferente que omitió avisar oportunamente de su retractación, si el destinatario aceptó extemporáneamente por esa omisión; aquí corresponde aplicar las reglas de la responsabilidad extracontractual, porque no existe vínculo preexistente entre las partes desde que el oferente se retractó.", "por_que_no": ["B: la aceptación extemporánea no forma contrato; la propuesta se tiene por no hecha una vez vencido el plazo.", "C: la calificación legal corresponde al supuesto distinto del art. 100 (retractación tempestiva con perjuicio), no a este.", "D: aunque la propuesta se tenga por no hecha para efectos contractuales, sí puede nacer responsabilidad indemnizatoria por la omisión del aviso oportuno."]}'::jsonb,
  'Código de Comercio, art. 98'
)
on conflict (id) do nothing;

insert into public.alternativas
  (id, materia, subtema, nivel_exigencia, pregunta, opciones, correcta, retroalimentacion, fuente)
values (
  'pre-alt-013',
  'precontractual',
  'Valor jurídico de la puntualización en el derecho chileno',
  4,
  '¿Reconoce el derecho chileno, como regla general, valor obligatorio a la puntualización (la minuta o borrador en que las partes dejan constancia de los puntos esenciales acordados, sin haber cerrado todavía el negocio)?',
  '["Sí, con el mismo valor obligatorio que reconoce el derecho alemán", "No; la regla es negarle ese valor, porque las partes se obligan realmente recién a partir de la oferta", "Sí, pero solo si la puntualización consta en escritura pública", "No, y tampoco se le reconoce ningún valor ni siquiera como antecedente interpretativo"]'::jsonb,
  1,
  '{"correcta": "El valor jurídico de la puntualización ha sido discutido: mientras el derecho alemán le reconoce eficacia obligatoria respecto de los elementos esenciales acordados, en el derecho chileno la regla es negarle ese valor, porque mal podría ser obligatorio un acuerdo esencialmente precario.", "por_que_no": ["A: esa es la solución del derecho alemán, expresamente contrastada con la chilena, que es distinta.", "C: la forma de escritura pública no es lo que determina, en la regla chilena, el reconocimiento de valor obligatorio a la puntualización.", "D: la puntualización sí puede tener relevancia, por ejemplo como antecedente interpretativo del contrato finalmente celebrado."]}'::jsonb,
  'Doctrina sobre la puntualización dentro de los tratos negociales previos'
)
on conflict (id) do nothing;

insert into public.alternativas
  (id, materia, subtema, nivel_exigencia, pregunta, opciones, correcta, retroalimentacion, fuente)
values (
  'pre-alt-014',
  'precontractual',
  'La pregunta correcta: la etapa concreta, no el estatuto abstracto',
  5,
  'Según la tensión de fondo examinada en este eje, ¿cuál es la pregunta correcta que debe formularse frente a un daño ocurrido durante el proceso de formación de un contrato, en vez de preguntar en abstracto "qué estatuto rige la responsabilidad precontractual"?',
  '["Si el demandante actuó de buena o mala fe durante toda la negociación", "En qué etapa exacta del itinerario se produjo el daño, y si existía ya, en ese punto, algún vínculo convencional entre las partes", "Si el contrato finalmente llegó o no a celebrarse", "Cuál de las partes tiene mayor poder de negociación en la relación"]'::jsonb,
  1,
  '{"correcta": "La pregunta correcta no es \"qué estatuto rige la responsabilidad precontractual\", en abstracto, sino \"en qué etapa exacta del itinerario se produjo el daño, y existía ya, en ese punto, algún vínculo convencional entre las partes\". Esta reformulación permite ordenar sin contradicción las respuestas dispersas que ofrece la doctrina.", "por_que_no": ["A: la buena o mala fe es relevante en ciertos ejes (como la responsabilidad por nulidad), pero no es la pregunta estructural que resuelve la elección de estatuto en este itinerario.", "C: el contrato puede no llegar a celebrarse en varias etapas distintas, con estatutos distintos; esa sola pregunta no basta.", "D: el poder de negociación de cada parte no es el criterio que determina el estatuto aplicable."]}'::jsonb,
  'Síntesis sobre la ausencia de una naturaleza jurídica única de la responsabilidad precontractual'
)
on conflict (id) do nothing;

insert into public.memorice_articulos
  (id, materia, subtema, articulo, texto, prioridad_ocultamiento, palabras_criticas, fuente)
values (
  'ccom-art-98',
  'precontractual',
  'Retractación no avisada y aceptación extemporánea',
  '98',
  'La propuesta hecha por escrito deberá ser aceptada o desechada dentro de veinticuatro horas, si la persona a quien se ha dirigido residiere en el mismo lugar que el proponente, o a vuelta de correo, si estuviere en otro diverso. Vencidos los plazos indicados, la propuesta se tendrá por no hecha, aun cuando hubiere sido aceptada. En caso de aceptación extemporánea, el proponente será obligado, bajo responsabilidad de daños y perjuicios, a dar pronto aviso de su retractación.',
  '[["veinticuatro horas", "vuelta de correo"], ["se tendrá por no hecha"], ["responsabilidad de daños y perjuicios", "pronto aviso"], ["*"]]'::jsonb,
  array['veinticuatro horas', 'vuelta de correo', 'se tendrá por no hecha', 'aceptación extemporánea', 'responsabilidad de daños y perjuicios'],
  'Código de Comercio, art. 98'
)
on conflict (id) do nothing;

insert into public.memorice_articulos
  (id, materia, subtema, articulo, texto, prioridad_ocultamiento, palabras_criticas, fuente)
values (
  'ccom-art-100',
  'precontractual',
  'Retractación tempestiva de la oferta',
  '100',
  'La retractación tempestiva impone al proponente la obligación de indemnizar los gastos que la persona a quien fue encaminada la propuesta hubiere hecho, y los daños y perjuicios que hubiere sufrido. Sin embargo, el proponente podrá exonerarse de la obligación de indemnizar, cumpliendo el contrato propuesto.',
  '[["indemnizar los gastos", "daños y perjuicios"], ["exonerarse", "cumpliendo el contrato propuesto"], ["*"]]'::jsonb,
  array['retractación tempestiva', 'indemnizar los gastos', 'daños y perjuicios', 'exonerarse', 'cumpliendo el contrato propuesto'],
  'Código de Comercio, art. 100'
)
on conflict (id) do nothing;

-- LOTE 2026-07 (38): Precontractual, Eje D (El interés jurídicamente protegido y el fundamento de la buena fe)

insert into public.alternativas
  (id, materia, subtema, nivel_exigencia, pregunta, opciones, correcta, retroalimentacion, fuente)
values (
  'pre-alt-015',
  'precontractual',
  'Qué protege la responsabilidad precontractual',
  3,
  '¿Protege la responsabilidad precontractual el interés en que el contrato efectivamente llegue a celebrarse?',
  '["Sí, siempre que las negociaciones hayan avanzado lo suficiente", "No; las partes conservan siempre la libertad de no contratar; se protege el interés en participar correcta y lealmente en el proceso de negociación", "Sí, pero solo si existió una oferta formal de por medio", "No, y tampoco se protege ningún otro interés durante la negociación"]'::jsonb,
  1,
  '{"correcta": "No puede tratarse del interés en que el contrato efectivamente se celebre, porque las partes conservan siempre la libertad de no contratar. El objeto de protección es la manera correcta y leal de participar en un proceso de negociación cuyo resultado permanece siempre incierto.", "por_que_no": ["A: ni siquiera un avance considerable de las negociaciones elimina la libertad de no contratar.", "C: la existencia de una oferta formal no cambia qué interés se protege, aunque sí puede cambiar el estatuto aplicable (Eje 3).", "D: sí se protege un interés concreto: la lealtad y corrección en el proceso de negociación."]}'::jsonb,
  'Doctrina sobre el interés jurídicamente protegido en la responsabilidad precontractual'
)
on conflict (id) do nothing;

insert into public.alternativas
  (id, materia, subtema, nivel_exigencia, pregunta, opciones, correcta, retroalimentacion, fuente)
values (
  'pre-alt-016',
  'precontractual',
  'Las dos hipótesis del interés protegido (Saavedra)',
  4,
  'Según SAAVEDRA, ¿cuáles son las dos hipótesis distintas que cubre el interés jurídicamente protegido por la responsabilidad precontractual?',
  '["El daño por haber sido envuelto en negociaciones inútiles por un retiro intempestivo, y el daño por el ocultamiento de situaciones causantes de la nulidad del contrato resultante", "El daño emergente y el lucro cesante, únicamente", "El daño moral y el daño patrimonial, sin ninguna otra distinción", "El daño contractual y el daño extracontractual"]'::jsonb,
  0,
  '{"correcta": "Saavedra cubre dos hipótesis: el daño sufrido por haber sido envuelto en negociaciones inútiles a raíz del retiro intempestivo y arbitrario de la contraparte, y el daño derivado del ocultamiento de situaciones que resulten ser, después, causa de nulidad del contrato resultante.", "por_que_no": ["B: esa distinción corresponde al daño indemnizable (Eje 6), no a las dos hipótesis del interés protegido.", "C: la distinción moral/patrimonial no es la que formula Saavedra en este punto.", "D: esa distinción de estatutos no es la formulación de Saavedra sobre el interés protegido."]}'::jsonb,
  'Doctrina de Saavedra sobre el interés jurídicamente protegido'
)
on conflict (id) do nothing;

insert into public.alternativas
  (id, materia, subtema, nivel_exigencia, pregunta, opciones, correcta, retroalimentacion, fuente)
values (
  'pre-alt-017',
  'precontractual',
  'El caso Lavín con Mena (2024)',
  3,
  'En el caso Lavín con Mena (Segundo Juzgado de Letras de Curicó, 11 de marzo de 2024, rol C-1461-2022), ¿desde qué momento reconoció el tribunal que nacen obligaciones derivadas del principio de la buena fe contractual?',
  '["Solo desde que se celebra el contrato definitivo", "Aun antes de que exista oferta propiamente tal", "Solo desde que se formula una oferta formal por escrito", "Solo desde que se celebra un contrato de promesa"]'::jsonb,
  1,
  '{"correcta": "El tribunal, apoyándose en Enrique Barros Bourie, precisó que aun antes de que exista oferta propiamente tal ya nacen obligaciones emanadas del principio de la buena fe contractual, entre ellas la de negociar de forma leal, correcta y honesta.", "por_que_no": ["A: el fallo reconoce estas obligaciones antes, no recién con el contrato definitivo.", "C: el fallo las reconoce incluso antes de la oferta, no solo desde ella.", "D: la promesa es una etapa muy posterior; el fallo se refiere a un momento anterior incluso a la oferta."]}'::jsonb,
  'Caso Lavín con Mena, 2° Juzgado de Letras de Curicó, 11 de marzo de 2024, rol C-1461-2022'
)
on conflict (id) do nothing;

insert into public.alternativas
  (id, materia, subtema, nivel_exigencia, pregunta, opciones, correcta, retroalimentacion, fuente)
values (
  'pre-alt-018',
  'precontractual',
  'Deberes negativos del catálogo de Saavedra',
  4,
  'Según el catálogo de Saavedra, ¿de qué tipo es el deber de "no ocultar hechos que pudieran acarrear después la nulidad o la ineficacia de lo acordado"?',
  '["Un deber negativo (de no dañar)", "Un deber positivo (de actuar)", "No es parte del catálogo de Saavedra", "Un deber exclusivo del contrato preparatorio, no de los tratos previos"]'::jsonb,
  0,
  '{"correcta": "Dentro del catálogo de Saavedra, no ocultar hechos que pudieran acarrear después la nulidad o la ineficacia de lo acordado se clasifica como un deber negativo, de no dañar, junto con no inducir con información falsa, no retirarse arbitrariamente y no revocar propuestas cuya mantención se prometió.", "por_que_no": ["B: ese deber se agrupa entre los negativos, no los positivos, en la clasificación del propio catálogo.", "C: sí forma parte expresa del catálogo de Saavedra.", "D: el catálogo rige durante los tratos negociales previos en general, no solo respecto del contrato preparatorio."]}'::jsonb,
  'Catálogo de conductas de buena fe negocial de Saavedra'
)
on conflict (id) do nothing;

insert into public.alternativas
  (id, materia, subtema, nivel_exigencia, pregunta, opciones, correcta, retroalimentacion, fuente)
values (
  'pre-alt-019',
  'precontractual',
  'El elemento adicional exigido más allá de la sola ruptura',
  4,
  '¿Qué elemento adicional exige siempre la doctrina, además de la sola ruptura de la negociación, para que nazca responsabilidad precontractual por infracción de la buena fe?',
  '["Arbitrariedad, intempestividad o transgresión de una confianza específicamente generada por la conducta de la contraparte", "Que exista siempre un contrato de promesa ya firmado entre las partes", "Que el monto del daño supere un mínimo legal predeterminado", "Que la negociación haya durado, como mínimo, seis meses"]'::jsonb,
  0,
  '{"correcta": "La doctrina exige siempre un elemento adicional de arbitrariedad, intempestividad o transgresión de una confianza específicamente generada, no de la mera circunstancia de haber negociado, precisamente para no desincentivar la negociación misma.", "por_que_no": ["B: no se exige la existencia de una promesa; de hecho, esta responsabilidad opera precisamente cuando no hay contrato alguno todavía.", "C: no existe un umbral mínimo de daño predeterminado en esta doctrina.", "D: no existe un plazo mínimo de duración de la negociación como requisito."]}'::jsonb,
  'Doctrina sobre el límite de la buena fe negocial frente al riesgo de desincentivar la negociación'
)
on conflict (id) do nothing;

-- LOTE 2026-07 (39): Precontractual, Eje E (Naturaleza jurídica de la responsabilidad precontractual)

insert into public.alternativas
  (id, materia, subtema, nivel_exigencia, pregunta, opciones, correcta, retroalimentacion, fuente)
values (
  'pre-alt-020',
  'precontractual',
  'Alessandri: régimen antes de la oferta',
  4,
  'Para ALESSANDRI, ¿bajo qué régimen se rige la responsabilidad por la ruptura de negociaciones preliminares, antes de formularse la oferta?',
  '["Contractual, porque ya existe un vínculo negocial suficiente", "Extracontractual, porque las negociaciones preliminares no crean entre las partes ningún vínculo jurídico", "Legal, en los mismos términos que rigen después de la oferta", "Ninguno; Alessandri niega que pueda existir responsabilidad alguna antes de la oferta"]'::jsonb,
  1,
  '{"correcta": "Alessandri sostiene que la responsabilidad a que puede dar origen la ruptura de las negociaciones preliminares, cuando es susceptible de generar responsabilidad, es extracontractual, porque tales negociaciones no crean entre las partes ningún vínculo jurídico.", "por_que_no": ["A: Alessandri niega expresamente que exista, en esta etapa, un vínculo contractual.", "C: la calificación legal, para Alessandri, corresponde al tramo posterior a la oferta, no al anterior.", "D: Alessandri sí admite que pueda existir responsabilidad antes de la oferta, solo que de naturaleza extracontractual."]}'::jsonb,
  'Doctrina de Alessandri sobre la naturaleza jurídica de la responsabilidad precontractual'
)
on conflict (id) do nothing;

insert into public.alternativas
  (id, materia, subtema, nivel_exigencia, pregunta, opciones, correcta, retroalimentacion, fuente)
values (
  'pre-alt-021',
  'precontractual',
  'Crítica a la tesis del abuso del derecho',
  4,
  '¿Cuál es la principal crítica que recibe la tesis del abuso del derecho (Ripert, Josserand, Picasso) como fundamento de la responsabilidad precontractual durante las tratativas preliminares?',
  '["Que exige siempre la existencia de dolo, lo que la haría demasiado restrictiva", "Que durante esa etapa las partes no tienen todavía, la una respecto de la otra, ningún derecho propiamente tal que ejercer de forma abusiva", "Que solo se aplica a los contratos mercantiles, no a los civiles", "Que contradice expresamente el texto del artículo 1545 del Código Civil"]'::jsonb,
  1,
  '{"correcta": "Se objeta a esta tesis que no explica adecuadamente el funcionamiento de la responsabilidad durante las tratativas, porque en esa etapa las partes no tienen, la una respecto de la otra, ningún derecho propiamente tal, sino que pesa sobre ambas la obligación de observar una conducta diligente.", "por_que_no": ["A: Picasso concibe el abuso del derecho como objetivo, no como exigencia de dolo.", "C: la crítica no se limita a la materia mercantil.", "D: la crítica no se funda en una contradicción textual con el art. 1545."]}'::jsonb,
  'Crítica doctrinal a la tesis del abuso del derecho en la responsabilidad precontractual'
)
on conflict (id) do nothing;

insert into public.alternativas
  (id, materia, subtema, nivel_exigencia, pregunta, opciones, correcta, retroalimentacion, fuente)
values (
  'pre-alt-022',
  'precontractual',
  'Requisito de la oferta que por sí sola obliga (art. 99 C. de Comercio)',
  4,
  '¿Qué exige el artículo 99 del Código de Comercio para que el proponente no pueda arrepentirse libremente de su oferta en el tiempo intermedio entre su envío y la aceptación?',
  '["Que el destinatario haya comenzado ya a ejecutar el contrato propuesto", "Que el proponente se haya comprometido, al hacer la propuesta, a esperar contestación o a no disponer del objeto del contrato hasta transcurrido un plazo determinado", "Que la propuesta conste en escritura pública", "Que hayan transcurrido, como mínimo, treinta días desde el envío de la propuesta"]'::jsonb,
  1,
  '{"correcta": "El artículo 99 dispone que el proponente puede arrepentirse en el tiempo medio entre el envío de la propuesta y la aceptación, salvo que al hacerla se hubiere comprometido a esperar contestación o a no disponer del objeto del contrato, sino después de desechada o de transcurrido un determinado plazo.", "por_que_no": ["A: el artículo no exige que el destinatario haya comenzado a ejecutar nada; basta el compromiso expreso del proponente.", "C: no se exige escritura pública para este compromiso.", "D: no existe ese plazo mínimo fijo de treinta días en la norma."]}'::jsonb,
  'Código de Comercio, art. 99'
)
on conflict (id) do nothing;

insert into public.alternativas
  (id, materia, subtema, nivel_exigencia, pregunta, opciones, correcta, retroalimentacion, fuente)
values (
  'pre-alt-023',
  'precontractual',
  'Las dos diferencias de Brebbia entre culpa precontractual y culpa aquiliana ordinaria',
  4,
  'Según BREBBIA, ¿cuáles son las dos diferencias que existen entre la culpa precontractual y la culpa aquiliana ordinaria, pese a compartir el mismo encuadre extracontractual?',
  '["Una diferencia de sujetos (solo quienes negocian, no extraños) y una diferencia de grado (mayor exigencia de conducta prudente y leal)", "Una diferencia de plazo de prescripción y una diferencia de tribunal competente", "Una diferencia de monto máximo indemnizable y una diferencia de carga de la prueba", "No existe ninguna diferencia real entre ambas; Brebbia las equipara completamente"]'::jsonb,
  0,
  '{"correcta": "Brebbia destaca una diferencia en los sujetos (en la responsabilidad precontractual, solo pueden ser las personas relacionadas para la concertación del convenio) y una diferencia de grado (mayor afinamiento del concepto de culpa, por el especial deber de conducta prudente y leal durante las negociaciones).", "por_que_no": ["B: Brebbia no funda la distinción en el plazo de prescripción ni en el tribunal competente.", "C: tampoco la funda en el monto máximo ni en la carga de la prueba.", "D: Brebbia sí reconoce diferencias reales, pese a mantener el mismo encuadre extracontractual general."]}'::jsonb,
  'Doctrina de Brebbia sobre la culpa precontractual dentro del encuadre extracontractual'
)
on conflict (id) do nothing;

insert into public.alternativas
  (id, materia, subtema, nivel_exigencia, pregunta, opciones, correcta, retroalimentacion, fuente)
values (
  'pre-alt-024',
  'precontractual',
  'Crítica a la responsabilidad legal como fundamento',
  3,
  '¿Cuál es la principal crítica que recibe la tesis de la responsabilidad legal como fundamento de la responsabilidad precontractual?',
  '["Que carece de todo anclaje textual en el derecho chileno", "Que no aporta un fundamento jurídico propio, sino que se limita a describir que la ley así lo dispone, sin explicar por qué", "Que solo se aplica a los contratos de consumo", "Que contradice la doctrina de la buena fe negocial"]'::jsonb,
  1,
  '{"correcta": "Esta tesis ha sido criticada porque, en rigor, no otorga fundamento jurídico propio a los casos de responsabilidad precontractual, sino que se limita a describir que la ley así lo dispone, sin explicar por qué.", "por_que_no": ["A: sí tiene anclaje textual, en los arts. 98 y 100 del Código de Comercio.", "C: no se limita a los contratos de consumo.", "D: no hay contradicción directa con la buena fe negocial; son cuestiones distintas."]}'::jsonb,
  'Crítica doctrinal a la tesis de la responsabilidad legal'
)
on conflict (id) do nothing;

insert into public.memorice_articulos
  (id, materia, subtema, articulo, texto, prioridad_ocultamiento, palabras_criticas, fuente)
values (
  'ccom-art-99',
  'precontractual',
  'La oferta que por sí sola obliga',
  '99',
  'El proponente puede arrepentirse en el tiempo medio entre el envío de la propuesta y la aceptación, salvo que al hacerla se hubiere comprometido a esperar contestación o a no disponer del objeto del contrato, sino después de desechada o de transcurrido un determinado plazo. El arrepentimiento no se presume.',
  '[["comprometido a esperar contestación", "no disponer del objeto"], ["transcurrido un determinado plazo"], ["el arrepentimiento no se presume"], ["*"]]'::jsonb,
  array['arrepentirse', 'comprometido a esperar', 'no disponer del objeto', 'transcurrido un determinado plazo', 'no se presume'],
  'Código de Comercio, art. 99'
)
on conflict (id) do nothing;

-- LOTE 2026-07 (40): Precontractual, Eje F (Determinación de los daños a resarcir en la responsabilidad precontractual)

insert into public.alternativas
  (id, materia, subtema, nivel_exigencia, pregunta, opciones, correcta, retroalimentacion, fuente)
values (
  'pre-alt-025',
  'precontractual',
  'El interés negativo o de confianza (Ihering)',
  3,
  '¿Qué es el interés negativo o de confianza, según la distinción de IHERING?',
  '["La ganancia que se habría obtenido si el contrato se hubiera cumplido", "El daño sufrido por quien confió en que el contrato se celebraría, o en que sería válido", "El daño moral derivado exclusivamente de la ruptura de una negociación", "El mismo concepto que el interés positivo, con distinto nombre"]'::jsonb,
  1,
  '{"correcta": "El interés negativo o de confianza es todo el daño sufrido por quien confió en que el contrato se celebraría, o en que sería válido; se distingue del interés positivo o de cumplimiento, que Ihering reserva para el incumplimiento de un contrato efectivamente celebrado y válido.", "por_que_no": ["A: esa es la definición del interés positivo, no del negativo.", "C: el interés negativo no se limita al daño moral; puede comprender daño emergente y, según la interpretación, lucro cesante.", "D: son conceptos expresamente distintos en la formulación de Ihering."]}'::jsonb,
  'Doctrina de Ihering sobre interés positivo e interés negativo'
)
on conflict (id) do nothing;

insert into public.alternativas
  (id, materia, subtema, nivel_exigencia, pregunta, opciones, correcta, retroalimentacion, fuente)
values (
  'pre-alt-026',
  'precontractual',
  'Posición tradicional chilena sobre el lucro cesante',
  3,
  '¿Cuál es la posición tradicional de la doctrina chilena (LEÓN HURTADO, ROSENDE) sobre el lucro cesante en sede precontractual?',
  '["Se indemniza siempre, en las mismas condiciones que en la responsabilidad contractual ordinaria", "Se excluye siempre, cualquiera sea la etapa; solo se indemniza el daño emergente", "Se indemniza solo si el contrato llegó a celebrarse y después fue declarado nulo", "Se indemniza únicamente si hay dolo probado del responsable"]'::jsonb,
  1,
  '{"correcta": "Según Orrego, la posición que ha prevalecido en la doctrina chilena tradicional, representada por León Hurtado y Rosende Álvarez, es que solo se indemniza el daño emergente, nunca el lucro cesante, cualquiera sea la etapa.", "por_que_no": ["A: precisamente se aparta de la regla ordinaria, que sí incluye el lucro cesante.", "C: la exclusión del lucro cesante no depende de si el contrato llegó a celebrarse y luego se anuló.", "D: la exigencia de dolo no es el criterio que determina, para esta posición, la exclusión del lucro cesante."]}'::jsonb,
  'Doctrina chilena tradicional (León Hurtado, Rosende) sobre daño indemnizable en sede precontractual'
)
on conflict (id) do nothing;

insert into public.alternativas
  (id, materia, subtema, nivel_exigencia, pregunta, opciones, correcta, retroalimentacion, fuente)
values (
  'pre-alt-027',
  'precontractual',
  'Brebbia: daño antes de la oferta',
  4,
  'Según BREBBIA, ¿qué se indemniza respecto del daño producido antes de formulada la oferta, durante los tratos negociales previos?',
  '["Solo el reembolso de los gastos ocasionados por las negociaciones, no la ganancia dejada de percibir", "El daño emergente y también el lucro cesante, en las mismas condiciones que después de la oferta", "Solo el lucro cesante, no los gastos incurridos", "Nada; antes de la oferta no existe responsabilidad alguna para Brebbia"]'::jsonb,
  0,
  '{"correcta": "Respecto del daño originado durante los tratos negociales previos, el damnificado solo puede demandar el reembolso de los gastos ocasionados por las negociaciones, porque entre la ganancia dejada de percibir y el hecho culposo no existe, según Brebbia, una relación de causalidad adecuada.", "por_que_no": ["B: esa regla (daño emergente y lucro cesante) rige recién después de la oferta, no antes.", "C: los gastos (daño emergente) sí son indemnizables antes de la oferta; lo que se excluye es el lucro cesante.", "D: Brebbia sí admite responsabilidad antes de la oferta, aunque limitada al daño emergente."]}'::jsonb,
  'Doctrina de Brebbia sobre el daño indemnizable antes de la oferta'
)
on conflict (id) do nothing;

insert into public.alternativas
  (id, materia, subtema, nivel_exigencia, pregunta, opciones, correcta, retroalimentacion, fuente)
values (
  'pre-alt-028',
  'precontractual',
  'Brebbia: daño después de la oferta',
  4,
  'Según BREBBIA, ¿qué se indemniza respecto del daño producido después de formulada la oferta, en caso de retractación culposa del oferente?',
  '["Solo el daño emergente, igual que antes de la oferta", "El daño emergente y también el lucro cesante", "Solo el lucro cesante, excluyendo los gastos ya incurridos", "Nada, porque el oferente conserva siempre el derecho absoluto a retractarse"]'::jsonb,
  1,
  '{"correcta": "Respecto del daño ocasionado después de formulada la oferta, en caso de retractación culposa, el damnificado tiene derecho a reclamar no solo el daño emergente, sino también el lucro cesante, porque entre esa retractación y la ganancia frustrada sí existe un nexo de causalidad adecuado.", "por_que_no": ["A: precisamente después de la oferta la regla cambia respecto de la etapa anterior.", "C: el lucro cesante se suma al daño emergente; no lo reemplaza.", "D: el ius revocandi no excluye la responsabilidad por retractación culposa; solo impide obligar al cumplimiento forzado de la prestación."]}'::jsonb,
  'Doctrina de Brebbia sobre el daño indemnizable después de la oferta'
)
on conflict (id) do nothing;

insert into public.alternativas
  (id, materia, subtema, nivel_exigencia, pregunta, opciones, correcta, retroalimentacion, fuente)
values (
  'pre-alt-029',
  'precontractual',
  'El criterio de causalidad adecuada de Brebbia',
  4,
  '¿Qué criterio usa BREBBIA para decidir si el lucro cesante es o no indemnizable en un caso concreto, en vez de aplicar una regla fija según el tipo de partida?',
  '["La relación de causalidad adecuada entre el hecho generador de responsabilidad y el perjuicio reclamado", "El monto total del daño emergente ya acreditado", "La buena o mala fe subjetiva del oferente al momento de retractarse", "El tiempo transcurrido desde el inicio de las negociaciones, expresado en días"]'::jsonb,
  0,
  '{"correcta": "Brebbia matiza la regla de reparación integral con un límite: la relación de causalidad adecuada entre el hecho generador de responsabilidad y el perjuicio, aplicada de manera diferenciada según la etapa en que se produjo el daño.", "por_que_no": ["B: el monto del daño emergente no es, por sí mismo, el criterio que decide la procedencia del lucro cesante.", "C: el criterio de Brebbia no pasa por la buena o mala fe subjetiva, sino por la causalidad adecuada.", "D: no existe un umbral de días que determine, por sí solo, la procedencia del lucro cesante en este criterio."]}'::jsonb,
  'Doctrina de Brebbia sobre causalidad adecuada en la responsabilidad precontractual'
)
on conflict (id) do nothing;
