-- Memorice: Acto Jurídico (materia nueva de Civil).
-- Generado a partir de los artículos y texto literal que Laura entregó directamente
-- en la conversación del 2026-08-12 (Memorice: Laura manda ella el texto, no se
-- verifica aparte -- ver docs/practica.md).
-- Nota: 'acto_juridico' está hoy disabled:true en MATERIAS_CIVIL de app/alternativas.html,
-- así que este contenido no se ve en la app hasta que se habilite ese filtro (pendiente,
-- a confirmar con Laura).

insert into public.memorice_articulos
  (id, materia, subtema, articulo, texto, prioridad_ocultamiento, palabras_criticas, fuente)
values (
  'cc-art-1444',
  'acto_juridico',
  'Elementos del acto jurídico',
  '1444',
  'Se distinguen en cada contrato las cosas que son de su esencia, las que son de su naturaleza, y las puramente accidentales. Son de la esencia de un contrato aquellas cosas sin las cuales o no produce efecto alguno, o degenera en otro contrato diferente; son de la naturaleza de un contrato las que no siendo esenciales en él, se entienden pertenecerle, sin necesidad de una cláusula especial; y son accidentales a un contrato aquellas que ni esencial ni naturalmente le pertenecen, y que se le agregan por medio de cláusulas especiales.',
  '[["esencia", "naturaleza", "puramente accidentales"], ["no produce efecto alguno", "degenera en otro contrato diferente"], ["se entienden pertenecerle", "cláusulas especiales"], ["*"]]'::jsonb,
  array['esencia', 'naturaleza', 'accidentales', 'degenera'],
  'Código Civil, art. 1444'
)
on conflict (id) do nothing;

insert into public.memorice_articulos
  (id, materia, subtema, articulo, texto, prioridad_ocultamiento, palabras_criticas, fuente)
values (
  'cc-art-1445',
  'acto_juridico',
  'Requisitos del acto jurídico',
  '1445',
  'Para que una persona se obligue a otra por un acto o declaración de voluntad es necesario: 1º que sea legalmente capaz; 2º que consienta en dicho acto o declaración y su consentimiento no adolezca de vicio; 3º que recaiga sobre un objeto lícito; 4º que tenga una causa lícita. La capacidad legal de una persona consiste en poderse obligar por sí misma, y sin el ministerio o la autorización de otra.',
  '[["legalmente capaz", "objeto lícito", "causa lícita"], ["no adolezca de vicio"], ["poderse obligar por sí misma", "sin el ministerio o la autorización de otra"], ["*"]]'::jsonb,
  array['legalmente capaz', 'objeto lícito', 'causa lícita', 'vicio'],
  'Código Civil, art. 1445'
)
on conflict (id) do nothing;

insert into public.memorice_articulos
  (id, materia, subtema, articulo, texto, prioridad_ocultamiento, palabras_criticas, fuente)
values (
  'cc-art-1446',
  'acto_juridico',
  'Regla general de capacidad',
  '1446',
  'Toda persona es legalmente capaz, excepto aquellas que la ley declara incapaces.',
  '[["legalmente capaz"], ["declara incapaces"], [], ["*"]]'::jsonb,
  array['legalmente capaz', 'incapaces'],
  'Código Civil, art. 1446'
)
on conflict (id) do nothing;

insert into public.memorice_articulos
  (id, materia, subtema, articulo, texto, prioridad_ocultamiento, palabras_criticas, fuente)
values (
  'cc-art-1447',
  'acto_juridico',
  'Incapacidad absoluta y relativa',
  '1447',
  'Son absolutamente incapaces los dementes, los impúberes y los sordos o sordomudos que no pueden darse a entender claramente. Sus actos no producen ni aun obligaciones naturales, y no admiten caución. Son también incapaces los menores adultos y los disipadores que se hallen bajo interdicción de administrar lo suyo. Pero la incapacidad de las personas a que se refiere este inciso no es absoluta, y sus actos pueden tener valor en ciertas circunstancias y bajo ciertos respectos, determinados por las leyes. Además de estas incapacidades hay otras particulares que consisten en la prohibición que la ley ha impuesto a ciertas personas para ejecutar ciertos actos.',
  '[["dementes", "impúberes", "sordos o sordomudos que no pueden darse a entender claramente"], ["no producen ni aun obligaciones naturales", "no admiten caución"], ["menores adultos", "disipadores", "interdicción de administrar lo suyo"], ["*"]]'::jsonb,
  array['dementes', 'impúberes', 'sordomudos', 'obligaciones naturales', 'caución', 'interdicción'],
  'Código Civil, art. 1447'
)
on conflict (id) do nothing;

insert into public.memorice_articulos
  (id, materia, subtema, articulo, texto, prioridad_ocultamiento, palabras_criticas, fuente)
values (
  'cc-art-1451',
  'acto_juridico',
  'Vicios del consentimiento',
  '1451',
  'Los vicios de que puede adolecer el consentimiento, son error, fuerza y dolo',
  '[["error", "fuerza", "dolo"], [], [], ["*"]]'::jsonb,
  array['error', 'fuerza', 'dolo'],
  'Código Civil, art. 1451'
)
on conflict (id) do nothing;

insert into public.memorice_articulos
  (id, materia, subtema, articulo, texto, prioridad_ocultamiento, palabras_criticas, fuente)
values (
  'cc-art-1452',
  'acto_juridico',
  'Error de derecho',
  '1452',
  'El error sobre un punto de derecho no vicia el consentimiento.',
  '[["un punto de derecho"], ["no vicia el consentimiento"], [], ["*"]]'::jsonb,
  array['error', 'derecho', 'no vicia el consentimiento'],
  'Código Civil, art. 1452'
)
on conflict (id) do nothing;

insert into public.memorice_articulos
  (id, materia, subtema, articulo, texto, prioridad_ocultamiento, palabras_criticas, fuente)
values (
  'cc-art-1453',
  'acto_juridico',
  'Error esencial (error obstáculo)',
  '1453',
  'El error de hecho vicia el consentimiento cuando recae sobre la especie de acto o contrato que se ejecuta o celebra, como si una de las partes entendiese empréstito y la otra donación; o sobre la identidad de la cosa específica de que se trata, como si en el contrato de venta el vendedor entendiese vender cierta cosa determinada, y el comprador entendiese comprar otra.',
  '[["error de hecho", "vicia el consentimiento"], ["especie de acto o contrato que se ejecuta o celebra"], ["identidad de la cosa específica"], ["*"]]'::jsonb,
  array['error de hecho', 'especie de acto o contrato', 'identidad de la cosa específica'],
  'Código Civil, art. 1453'
)
on conflict (id) do nothing;

insert into public.memorice_articulos
  (id, materia, subtema, articulo, texto, prioridad_ocultamiento, palabras_criticas, fuente)
values (
  'cc-art-1454',
  'acto_juridico',
  'Error sustancial',
  '1454',
  'El error de hecho vicia asimismo el consentimiento cuando la sustancia o calidad esencial del objeto sobre que versa el acto o contrato, es diversa de lo que se cree; como si por alguna de las partes se supone que el objeto es una barra de plata, y realmente es una masa de algún otro metal semejante. El error acerca de otra cualquiera calidad de la cosa no vicia el consentimiento de los que contratan, sino cuando esa calidad es el principal motivo de una de ellas para contratar, y este motivo ha sido conocido de la otra parte.',
  '[["sustancia o calidad esencial del objeto"], ["barra de plata", "masa de algún otro metal semejante"], ["principal motivo de una de ellas para contratar", "conocido de la otra parte"], ["*"]]'::jsonb,
  array['sustancia', 'calidad esencial', 'principal motivo', 'conocido'],
  'Código Civil, art. 1454'
)
on conflict (id) do nothing;

insert into public.memorice_articulos
  (id, materia, subtema, articulo, texto, prioridad_ocultamiento, palabras_criticas, fuente)
values (
  'cc-art-1455',
  'acto_juridico',
  'Error en la persona',
  '1455',
  'El error acerca de la persona con quien se tiene intención de contratar no vicia el consentimiento, salvo que la consideración de esta persona sea la causa principal del contrato. Pero en este caso la persona con quien erradamente se ha contratado, tendrá derecho a ser indemnizada de los perjuicios en que de buena fe haya incurrido por la nulidad del contrato.',
  '[["error acerca de la persona", "no vicia el consentimiento"], ["causa principal del contrato"], ["derecho a ser indemnizada de los perjuicios", "de buena fe"], ["*"]]'::jsonb,
  array['causa principal del contrato', 'indemnizada', 'buena fe'],
  'Código Civil, art. 1455'
)
on conflict (id) do nothing;

insert into public.memorice_articulos
  (id, materia, subtema, articulo, texto, prioridad_ocultamiento, palabras_criticas, fuente)
values (
  'cc-art-1456',
  'acto_juridico',
  'Fuerza como vicio del consentimiento',
  '1456',
  'La fuerza no vicia el consentimiento, sino cuando es capaz de producir una impresión fuerte en una persona de sano juicio, tomando en cuenta su edad, sexo y condición. Se mira como una fuerza de este género todo acto que infunde a una persona un justo temor de verse expuesta ella, su consorte o alguno de sus ascendientes o descendientes a un mal irreparable y grave. El temor reverencial, esto es, el solo temor de desagradar a las personas a quienes se debe sumisión y respeto, no basta para viciar el consentimiento.',
  '[["impresión fuerte en una persona de sano juicio"], ["justo temor", "mal irreparable y grave"], ["temor reverencial", "no basta para viciar el consentimiento"], ["*"]]'::jsonb,
  array['impresión fuerte', 'sano juicio', 'mal irreparable y grave', 'temor reverencial'],
  'Código Civil, art. 1456'
)
on conflict (id) do nothing;

insert into public.memorice_articulos
  (id, materia, subtema, articulo, texto, prioridad_ocultamiento, palabras_criticas, fuente)
values (
  'cc-art-1457',
  'acto_juridico',
  'Fuerza ejercida por un tercero',
  '1457',
  'Para que la fuerza vicie el consentimiento no es necesario que la ejerza aquel que es beneficiado por ella; basta que se haya empleado la fuerza por cualquiera persona con el objeto de obtener el consentimiento.',
  '[["no es necesario que la ejerza aquel que es beneficiado por ella"], ["cualquiera persona"], [], ["*"]]'::jsonb,
  array['no es necesario', 'beneficiado', 'cualquiera persona'],
  'Código Civil, art. 1457'
)
on conflict (id) do nothing;

insert into public.memorice_articulos
  (id, materia, subtema, articulo, texto, prioridad_ocultamiento, palabras_criticas, fuente)
values (
  'cc-art-1458',
  'acto_juridico',
  'Dolo como vicio del consentimiento',
  '1458',
  'El dolo no vicia el consentimiento sino cuando es obra de una de las partes, y cuando además aparece claramente que sin él no hubieran contratado. En los demás casos el dolo da lugar solamente a la acción de perjuicios contra la persona o personas que lo han fraguado o que se han aprovechado de él; contra las primeras por el total valor de los perjuicios, y contra las segundas hasta concurrencia del provecho que han reportado del dolo.',
  '[["obra de una de las partes"], ["sin él no hubieran contratado"], ["total valor de los perjuicios", "concurrencia del provecho"], ["*"]]'::jsonb,
  array['obra de una de las partes', 'sin él no hubieran contratado', 'concurrencia del provecho'],
  'Código Civil, art. 1458'
)
on conflict (id) do nothing;

insert into public.memorice_articulos
  (id, materia, subtema, articulo, texto, prioridad_ocultamiento, palabras_criticas, fuente)
values (
  'cc-art-1459',
  'acto_juridico',
  'Prueba del dolo',
  '1459',
  'El dolo no se presume sino en los casos especialmente previstos por la ley. En los demás debe probarse.',
  '[["no se presume"], ["especialmente previstos por la ley"], [], ["*"]]'::jsonb,
  array['no se presume', 'debe probarse'],
  'Código Civil, art. 1459'
)
on conflict (id) do nothing;

insert into public.memorice_articulos
  (id, materia, subtema, articulo, texto, prioridad_ocultamiento, palabras_criticas, fuente)
values (
  'cc-art-1460',
  'acto_juridico',
  'Objeto de la declaración de voluntad',
  '1460',
  'Toda declaración de voluntad debe tener por objeto una o más cosas que se trata de dar, hacer o no hacer. El mero uso de la cosa o su tenencia puede ser objeto de la declaración.',
  '[["dar, hacer o no hacer"], ["mero uso de la cosa", "su tenencia"], [], ["*"]]'::jsonb,
  array['dar', 'hacer', 'no hacer', 'tenencia'],
  'Código Civil, art. 1460'
)
on conflict (id) do nothing;

insert into public.memorice_articulos
  (id, materia, subtema, articulo, texto, prioridad_ocultamiento, palabras_criticas, fuente)
values (
  'cc-art-1461',
  'acto_juridico',
  'Requisitos del objeto',
  '1461',
  'No sólo las cosas que existen pueden ser objetos de una declaración de voluntad, sino las que se espera que existan; pero es menester que las unas y las otras sean comerciables, y que estén determinadas, a lo menos, en cuanto a su género. La cantidad puede ser incierta con tal que el acto o contrato fije reglas o contenga datos que sirvan para determinarla. Si el objeto es un hecho, es necesario que sea física y moralmente posible. Es físicamente imposible el que es contrario a la naturaleza, y moralmente imposible el prohibido por las leyes, o contrario a las buenas costumbres o al orden público',
  '[["comerciables", "determinadas, a lo menos, en cuanto a su género"], ["La cantidad puede ser incierta"], ["física y moralmente posible", "físicamente imposible", "moralmente imposible"], ["*"]]'::jsonb,
  array['comerciables', 'determinadas', 'física y moralmente posible'],
  'Código Civil, art. 1461'
)
on conflict (id) do nothing;

insert into public.memorice_articulos
  (id, materia, subtema, articulo, texto, prioridad_ocultamiento, palabras_criticas, fuente)
values (
  'cc-art-1462',
  'acto_juridico',
  'Objeto ilícito: derecho público chileno',
  '1462',
  'Hay un objeto ilícito en todo lo que contraviene al derecho público chileno. Así la promesa de someterse en Chile a una jurisdicción no reconocida por las leyes chilenas, es nula por el vicio del objeto.',
  '[["derecho público chileno"], ["jurisdicción no reconocida por las leyes chilenas"], [], ["*"]]'::jsonb,
  array['objeto ilícito', 'derecho público chileno', 'vicio del objeto'],
  'Código Civil, art. 1462'
)
on conflict (id) do nothing;

insert into public.memorice_articulos
  (id, materia, subtema, articulo, texto, prioridad_ocultamiento, palabras_criticas, fuente)
values (
  'cc-art-1463',
  'acto_juridico',
  'Objeto ilícito: derecho a suceder a persona viva',
  '1463',
  'El derecho de suceder por causa de muerte a una persona viva no puede ser objeto de una donación o contrato, aun cuando intervenga el consentimiento de la misma persona. Las convenciones entre la persona que debe una legítima y el legitimario, relativas a la misma legítima o a mejoras, están sujetas a las reglas especiales contenidas en el título De las asignaciones forzosas.',
  '[["a una persona viva", "no puede ser objeto de una donación o contrato"], ["aun cuando intervenga el consentimiento de la misma persona"], ["legítima", "el legitimario", "asignaciones forzosas"], ["*"]]'::jsonb,
  array['persona viva', 'no puede ser objeto', 'legítima', 'legitimario'],
  'Código Civil, art. 1463'
)
on conflict (id) do nothing;

insert into public.memorice_articulos
  (id, materia, subtema, articulo, texto, prioridad_ocultamiento, palabras_criticas, fuente)
values (
  'cc-art-1464',
  'acto_juridico',
  'Objeto ilícito en la enajenación',
  '1464',
  'Hay un objeto ilícito en la enajenación: 1º. De las cosas que no están en el comercio; 2º. De los derechos o privilegios que no pueden transferirse a otra persona; 3º. De las cosas embargadas por decreto judicial, a menos que el juez lo autorice o el acreedor consienta en ello; 4º. De especies cuya propiedad se litiga, sin permiso del juez que conoce en el litigio.',
  '[["no están en el comercio", "no pueden transferirse a otra persona"], ["embargadas por decreto judicial"], ["a menos que el juez lo autorice o el acreedor consienta en ello", "sin permiso del juez"], ["*"]]'::jsonb,
  array['no están en el comercio', 'embargadas', 'el juez lo autorice', 'el acreedor consienta', 'sin permiso del juez'],
  'Código Civil, art. 1464'
)
on conflict (id) do nothing;

insert into public.memorice_articulos
  (id, materia, subtema, articulo, texto, prioridad_ocultamiento, palabras_criticas, fuente)
values (
  'cc-art-1466',
  'acto_juridico',
  'Objeto ilícito: juego, libros y contratos prohibidos',
  '1466',
  'Hay asimismo objeto ilícito en las deudas contraídas en juego de azar, en la venta de libros cuya circulación es prohibida por autoridad competente, de láminas, pinturas y estatuas obscenas, y de impresos condenados como abusivos de la libertad de la prensa; y generalmente en todo contrato prohibido por las leyes.',
  '[["juego de azar"], ["circulación es prohibida por autoridad competente", "estatuas obscenas"], ["abusivos de la libertad de la prensa"], ["*"]]'::jsonb,
  array['juego de azar', 'circulación es prohibida', 'contrato prohibido por las leyes'],
  'Código Civil, art. 1466'
)
on conflict (id) do nothing;

insert into public.memorice_articulos
  (id, materia, subtema, articulo, texto, prioridad_ocultamiento, palabras_criticas, fuente)
values (
  'cc-art-1467',
  'acto_juridico',
  'Causa de las obligaciones',
  '1467',
  'No puede haber obligación sin una causa real y lícita; pero no es necesario expresarla. La pura liberalidad o beneficencia es causa suficiente. Se entiende por causa el motivo que induce al acto o contrato; y por causa ilícita la prohibida por ley, o contraria a las buenas costumbres o al orden público. Así la promesa de dar algo en pago de una deuda que no existe, carece de causa; y la promesa de dar algo en recompensa de un crimen o de un hecho inmoral, tiene una causa ilícita.',
  '[["causa real y lícita", "no es necesario expresarla"], ["pura liberalidad o beneficencia"], ["el motivo que induce al acto o contrato", "causa ilícita"], ["*"]]'::jsonb,
  array['causa real y lícita', 'motivo que induce', 'causa ilícita', 'carece de causa'],
  'Código Civil, art. 1467'
)
on conflict (id) do nothing;

insert into public.memorice_articulos
  (id, materia, subtema, articulo, texto, prioridad_ocultamiento, palabras_criticas, fuente)
values (
  'cc-art-1468',
  'acto_juridico',
  'Sanción del objeto o causa ilícita a sabiendas',
  '1468',
  'No podrá repetirse lo que se haya dado o pagado por un objeto o causa ilícita a sabiendas',
  '[["No podrá repetirse"], ["a sabiendas"], [], ["*"]]'::jsonb,
  array['no podrá repetirse', 'a sabiendas'],
  'Código Civil, art. 1468'
)
on conflict (id) do nothing;

insert into public.memorice_articulos
  (id, materia, subtema, articulo, texto, prioridad_ocultamiento, palabras_criticas, fuente)
values (
  'cc-art-1681',
  'acto_juridico',
  'Concepto y clases de nulidad',
  '1681',
  'Es nulo todo acto o contrato a que falta alguno de los requisitos que la ley prescribe para el valor del mismo acto o contrato, según su especie y la calidad o estado de las partes. La nulidad puede ser absoluta o relativa.',
  '[["falta alguno de los requisitos que la ley prescribe"], ["según su especie y la calidad o estado de las partes"], ["absoluta o relativa"], ["*"]]'::jsonb,
  array['falta alguno de los requisitos', 'absoluta', 'relativa'],
  'Código Civil, art. 1681'
)
on conflict (id) do nothing;

insert into public.memorice_articulos
  (id, materia, subtema, articulo, texto, prioridad_ocultamiento, palabras_criticas, fuente)
values (
  'cc-art-1682',
  'acto_juridico',
  'Causales de nulidad absoluta y relativa',
  '1682',
  'La nulidad producida por un objeto o causa ilícita, y la nulidad producida por la omisión de algún requisito o formalidad que las leyes prescriben para el valor de ciertos actos o contratos en consideración a la naturaleza de ellos, y no a la calidad o estado de las personas que los ejecutan o acuerdan, son nulidades absolutas. Hay asimismo nulidad absoluta en los actos y contratos de personas absolutamente incapaces. Cualquiera otra especie de vicio produce nulidad relativa, y da derecho a la rescisión del acto o contrato.',
  '[["objeto o causa ilícita", "son nulidades absolutas"], ["en consideración a la naturaleza de ellos", "y no a la calidad o estado de las personas"], ["personas absolutamente incapaces", "nulidad relativa", "rescisión del acto o contrato"], ["*"]]'::jsonb,
  array['objeto o causa ilícita', 'nulidades absolutas', 'absolutamente incapaces', 'nulidad relativa', 'rescisión'],
  'Código Civil, art. 1682'
)
on conflict (id) do nothing;

insert into public.memorice_articulos
  (id, materia, subtema, articulo, texto, prioridad_ocultamiento, palabras_criticas, fuente)
values (
  'cc-art-1683',
  'acto_juridico',
  'Nulidad absoluta: titulares y saneamiento',
  '1683',
  'La nulidad absoluta puede y debe ser declarada por el juez, aun sin petición de parte, cuando aparece de manifiesto en el acto o contrato; puede alegarse por todo el que tenga interés en ello, excepto el que ha ejecutado el acto o celebrado el contrato, sabiendo o debiendo saber el vicio que lo invalidaba; puede asimismo pedirse su declaración por el ministerio público en el interés de la moral o de la ley; y no puede sanearse por la ratificación de las partes, ni por un lapso de tiempo que no pase de diez años.',
  '[["declarada por el juez, aun sin petición de parte", "cuando aparece de manifiesto"], ["todo el que tenga interés en ello", "sabiendo o debiendo saber el vicio que lo invalidaba"], ["el ministerio público", "no puede sanearse por la ratificación de las partes", "diez años"], ["*"]]'::jsonb,
  array['aun sin petición de parte', 'de manifiesto', 'sabiendo o debiendo saber', 'ministerio público', 'no puede sanearse', 'diez años'],
  'Código Civil, art. 1683'
)
on conflict (id) do nothing;

insert into public.memorice_articulos
  (id, materia, subtema, articulo, texto, prioridad_ocultamiento, palabras_criticas, fuente)
values (
  'cc-art-1684',
  'acto_juridico',
  'Nulidad relativa: titulares y saneamiento',
  '1684',
  'La nulidad relativa no puede ser declarada por el juez sino a pedimento de parte; ni puede pedirse su declaración por el ministerio público en el solo interés de la ley; ni puede alegarse sino por aquellos en cuyo beneficio la han establecido las leyes o por sus herederos o cesionarios; y puede sanearse por el lapso de tiempo o por la ratificación de las partes.',
  '[["a pedimento de parte"], ["en el solo interés de la ley"], ["en cuyo beneficio la han establecido las leyes", "herederos o cesionarios"], ["*"]]'::jsonb,
  array['a pedimento de parte', 'solo interés de la ley', 'herederos o cesionarios', 'puede sanearse'],
  'Código Civil, art. 1684'
)
on conflict (id) do nothing;

insert into public.memorice_articulos
  (id, materia, subtema, articulo, texto, prioridad_ocultamiento, palabras_criticas, fuente)
values (
  'cc-art-1685',
  'acto_juridico',
  'Dolo del incapaz y nulidad',
  '1685',
  'Si de parte del incapaz ha habido dolo para inducir al acto o contrato, ni él ni sus herederos o cesionarios podrán alegar nulidad. Sin embargo, la aserción de mayor edad, o de no existir la interdicción u otra causa de incapacidad, no inhabilitará al incapaz para obtener el pronunciamiento de nulidad.',
  '[["dolo para inducir al acto o contrato"], ["ni él ni sus herederos o cesionarios podrán alegar nulidad"], ["la aserción de mayor edad", "no inhabilitará al incapaz"], ["*"]]'::jsonb,
  array['dolo para inducir', 'no podrán alegar nulidad', 'aserción de mayor edad', 'no inhabilitará'],
  'Código Civil, art. 1685'
)
on conflict (id) do nothing;

insert into public.memorice_articulos
  (id, materia, subtema, articulo, texto, prioridad_ocultamiento, palabras_criticas, fuente)
values (
  'cc-art-1689',
  'acto_juridico',
  'Nulidad y acción reivindicatoria',
  '1689',
  'La nulidad judicialmente pronunciada da acción reivindicatoria contra terceros poseedores; sin perjuicio de las excepciones legales.',
  '[["acción reivindicatoria"], ["terceros poseedores"], [], ["*"]]'::jsonb,
  array['acción reivindicatoria', 'terceros poseedores'],
  'Código Civil, art. 1689'
)
on conflict (id) do nothing;

insert into public.memorice_articulos
  (id, materia, subtema, articulo, texto, prioridad_ocultamiento, palabras_criticas, fuente)
values (
  'cc-art-1690',
  'acto_juridico',
  'Efecto relativo de la nulidad',
  '1690',
  'Cuando dos o más personas han contratado con un tercero, la nulidad declarada a favor de una de ellas no aprovechará a las otras.',
  '[["dos o más personas"], ["no aprovechará a las otras"], [], ["*"]]'::jsonb,
  array['no aprovechará a las otras'],
  'Código Civil, art. 1690'
)
on conflict (id) do nothing;

insert into public.memorice_articulos
  (id, materia, subtema, articulo, texto, prioridad_ocultamiento, palabras_criticas, fuente)
values (
  'cc-art-1691',
  'acto_juridico',
  'Plazo de la acción rescisoria',
  '1691',
  'El plazo para pedir la rescisión durará cuatro años. Este cuadrienio se contará, en el caso de violencia, desde el día en que ésta hubiere cesado; en el caso de error o de dolo, desde el día de la celebración del acto o contrato. Cuando la nulidad proviene de una incapacidad legal, se contará el cuadrienio desde el día en que haya cesado esta incapacidad. Todo lo cual se entiende en los casos en que leyes especiales no hubieren designado otro plazo.',
  '[["cuatro años"], ["desde el día en que ésta hubiere cesado", "desde el día de la celebración del acto o contrato"], ["desde el día en que haya cesado esta incapacidad"], ["*"]]'::jsonb,
  array['cuatro años', 'violencia', 'error', 'dolo', 'incapacidad legal'],
  'Código Civil, art. 1691'
)
on conflict (id) do nothing;

insert into public.memorice_articulos
  (id, materia, subtema, articulo, texto, prioridad_ocultamiento, palabras_criticas, fuente)
values (
  'cc-art-1693',
  'acto_juridico',
  'Ratificación del acto nulo',
  '1693',
  'La ratificación necesaria para sanear la nulidad cuando el vicio del contrato es susceptible de este remedio, puede ser expresa o tácita.',
  '[["susceptible de este remedio"], ["expresa o tácita"], [], ["*"]]'::jsonb,
  array['expresa', 'tácita'],
  'Código Civil, art. 1693'
)
on conflict (id) do nothing;

insert into public.memorice_articulos
  (id, materia, subtema, articulo, texto, prioridad_ocultamiento, palabras_criticas, fuente)
values (
  'cc-art-1694',
  'acto_juridico',
  'Ratificación expresa',
  '1694',
  'Para que la ratificación expresa sea válida, deberá hacerse con las solemnidades a que por la ley está sujeto el acto o contrato que se ratifica.',
  '[["ratificación expresa"], ["con las solemnidades a que por la ley está sujeto el acto o contrato"], [], ["*"]]'::jsonb,
  array['ratificación expresa', 'solemnidades'],
  'Código Civil, art. 1694'
)
on conflict (id) do nothing;

insert into public.memorice_articulos
  (id, materia, subtema, articulo, texto, prioridad_ocultamiento, palabras_criticas, fuente)
values (
  'cc-art-1695',
  'acto_juridico',
  'Ratificación tácita',
  '1695',
  'La ratificación tácita es la ejecución voluntaria de la obligación contratada.',
  '[["ratificación tácita"], ["ejecución voluntaria de la obligación contratada"], [], ["*"]]'::jsonb,
  array['ratificación tácita', 'ejecución voluntaria'],
  'Código Civil, art. 1695'
)
on conflict (id) do nothing;

insert into public.memorice_articulos
  (id, materia, subtema, articulo, texto, prioridad_ocultamiento, palabras_criticas, fuente)
values (
  'cc-art-1696',
  'acto_juridico',
  'Titulares de la ratificación',
  '1696',
  'Ni la ratificación expresa ni la tácita serán válidas, si no emanan de la parte o partes que tienen derecho de alegar la nulidad.',
  '[["Ni la ratificación expresa ni la tácita serán válidas"], ["que tienen derecho de alegar la nulidad"], [], ["*"]]'::jsonb,
  array['no emanan', 'derecho de alegar la nulidad'],
  'Código Civil, art. 1696'
)
on conflict (id) do nothing;

insert into public.memorice_articulos
  (id, materia, subtema, articulo, texto, prioridad_ocultamiento, palabras_criticas, fuente)
values (
  'cc-art-1697',
  'acto_juridico',
  'Incapacidad para ratificar',
  '1697',
  'No vale la ratificación expresa o tácita del que no es capaz de contratar.',
  '[["No vale la ratificación expresa o tácita"], ["del que no es capaz de contratar"], [], ["*"]]'::jsonb,
  array['no vale', 'no es capaz de contratar'],
  'Código Civil, art. 1697'
)
on conflict (id) do nothing;

insert into public.memorice_articulos
  (id, materia, subtema, articulo, texto, prioridad_ocultamiento, palabras_criticas, fuente)
values (
  'cc-art-1707',
  'acto_juridico',
  'Contraescrituras',
  '1707',
  'Las escrituras privadas hechas por los contratantes para alterar lo pactado en escritura pública, no producirán efecto contra terceros. Tampoco lo producirán las contraescrituras públicas, cuando no se ha tomado razón de su contenido al margen de la escritura matriz cuyas disposiciones se alteran en la contraescritura, y del traslado en cuya virtud ha obrado el tercero.',
  '[["no producirán efecto contra terceros"], ["no se ha tomado razón de su contenido al margen de la escritura matriz"], ["del traslado en cuya virtud ha obrado el tercero"], ["*"]]'::jsonb,
  array['no producirán efecto contra terceros', 'tomado razón', 'escritura matriz'],
  'Código Civil, art. 1707'
)
on conflict (id) do nothing;

insert into public.memorice_articulos
  (id, materia, subtema, articulo, texto, prioridad_ocultamiento, palabras_criticas, fuente)
values (
  'cc-art-1448',
  'acto_juridico',
  'Efectos de la representación',
  '1448',
  'Lo que una persona ejecuta a nombre de otra, estando facultada por ella o por la ley para representarla, produce respecto del representado iguales efectos que si hubiese contratado él mismo.',
  '[["a nombre de otra"], ["facultada por ella o por la ley para representarla"], ["iguales efectos que si hubiese contratado él mismo"], ["*"]]'::jsonb,
  array['a nombre de otra', 'facultada', 'representarla', 'iguales efectos'],
  'Código Civil, art. 1448'
)
on conflict (id) do nothing;

insert into public.memorice_articulos
  (id, materia, subtema, articulo, texto, prioridad_ocultamiento, palabras_criticas, fuente)
values (
  'cc-art-43',
  'acto_juridico',
  'Representantes legales',
  '43',
  'Son representantes legales de una persona uno o ambos progenitores, el adoptante y su tutor o curador.',
  '[["uno o ambos progenitores"], ["el adoptante"], ["su tutor o curador"], ["*"]]'::jsonb,
  array['progenitores', 'adoptante', 'tutor', 'curador'],
  'Código Civil, art. 43'
)
on conflict (id) do nothing;

insert into public.memorice_articulos
  (id, materia, subtema, articulo, texto, prioridad_ocultamiento, palabras_criticas, fuente)
values (
  'cc-art-2116',
  'acto_juridico',
  'Concepto de mandato',
  '2116',
  'El mandato es un contrato en que una persona confía la gestión de uno o más negocios a otra, que se hace cargo de ellos por cuenta y riesgo de la primera. La persona que confiere el encargo se llama comitente o mandante, y la que lo acepta, apoderado, procurador, y en general, mandatario.',
  '[["confía la gestión de uno o más negocios a otra"], ["por cuenta y riesgo de la primera"], ["comitente o mandante", "apoderado, procurador"], ["*"]]'::jsonb,
  array['gestión', 'cuenta y riesgo', 'mandante', 'mandatario'],
  'Código Civil, art. 2116'
)
on conflict (id) do nothing;
