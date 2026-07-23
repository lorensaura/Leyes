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
