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
