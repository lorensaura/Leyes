-- Alternativas de Acto Jurídico, lote 1: Capítulo I (Teoría general del acto
-- jurídico). Generado 2026-10-07 desde 04_Acto_Juridico_Manual.html, cap. I.
-- Sin publicar (publicado = false), pendiente de revisión de Laura. Para
-- publicarlas después de revisarlas:
--   update public.alternativas set publicado = true where id like 'aj-alt-%';

insert into public.alternativas
  (id, materia, subtema, nivel_exigencia, pregunta, opciones, correcta, retroalimentacion, fuente, publicado)
values (
  'aj-alt-001',
  'acto_juridico',
  'La teoría del acto jurídico en el Código Civil',
  2,
  '¿Cómo trata el Código Civil chileno la teoría general del acto jurídico?',
  '["La regula sistemáticamente en un título propio, siguiendo el modelo del Código alemán", "No la regula como tal: es una construcción doctrinal apoyada en los arts. 1445 a 1469 y 1681 a 1697", "La regula solo para los contratos, sin aplicación a los demás actos jurídicos", "La regula en el Título Preliminar, como regla común a todo el Código"]'::jsonb,
  1,
  '{"correcta": "El Código no tiene un título ni un capítulo dedicado a la teoría general del acto jurídico. Es una construcción doctrinal apoyada en el título De los actos y declaraciones de voluntad (arts. 1445 a 1469) y en el de la nulidad y rescisión (arts. 1681 a 1697).", "por_que_no": ["A: el Código alemán es de los pocos que sí construyen esa teoría de forma sistemática; el chileno pertenece al grupo que no lo hace.", "C: doctrina y jurisprudencia coinciden en que esas normas rigen a todo acto jurídico, salvo que su texto o la naturaleza de las cosas las limite a las convenciones o los contratos.", "D: la teoría no está en el Título Preliminar, sino que se apoya en el título De los actos y declaraciones de voluntad y en el de la nulidad y rescisión."]}'::jsonb,
  'Manual de Acto Jurídico, I.2',
  false
)
on conflict (id) do nothing;

insert into public.alternativas
  (id, materia, subtema, nivel_exigencia, pregunta, opciones, correcta, retroalimentacion, fuente, publicado)
values (
  'aj-alt-002',
  'acto_juridico',
  'Hechos jurídicos: concepto y clasificación',
  2,
  'Un delito civil, como el daño causado dolosamente a una cosa ajena, ¿es un acto jurídico?',
  '["Sí, porque es un hecho humano voluntario que produce efectos jurídicos", "Sí, porque genera la obligación de indemnizar, que es un efecto de derecho", "No, porque el acto jurídico exige la voluntad de dos partes, y el delito es obra de una sola", "No, porque el acto jurídico es un hecho jurídico humano y lícito, y el delito es un hecho ilícito"]'::jsonb,
  3,
  '{"correcta": "El acto jurídico es un hecho jurídico humano y lícito. Los delitos y cuasidelitos son hechos jurídicos humanos ilícitos: producen efectos, pero no son actos jurídicos.", "por_que_no": ["A: que sea humano y voluntario no basta: falta la licitud, y los delitos pertenecen a la categoría de los hechos ilícitos.", "B: esa obligación existe, pero no es el efecto que persigue el autor: es la consecuencia que el ordenamiento atribuye a un hecho ilícito.", "C: confunde esta clasificación con la de actos unilaterales y bilaterales: hay actos jurídicos que nacen de la voluntad de una sola parte, como el testamento."]}'::jsonb,
  'Manual de Acto Jurídico, I.3',
  false
)
on conflict (id) do nothing;

insert into public.alternativas
  (id, materia, subtema, nivel_exigencia, pregunta, opciones, correcta, retroalimentacion, fuente, publicado)
values (
  'aj-alt-003',
  'acto_juridico',
  'Concepto de acto jurídico y sus elementos',
  4,
  'Respecto del propósito que debe perseguir la manifestación de voluntad en el acto jurídico, ¿qué sostiene ROUBIER?',
  '["Que basta con perseguir un resultado práctico o económico, y el efecto jurídico es solo la forma en que el derecho traduce ese resultado", "Que la posición tradicional y la moderna describen lo mismo desde ángulos distintos", "Que la voluntad debe perseguir conscientemente las consecuencias jurídicas, y sin ese mínimo de conciencia jurídica no hay acto jurídico", "Que el propósito es irrelevante, porque los efectos del acto se producen solo porque la ley los establece"]'::jsonb,
  2,
  '{"correcta": "Para ROUBIER no hay término medio: lo que distingue al contrato del delito es que en el acto jurídico la voluntad privada persigue de forma consciente las consecuencias jurídicas que espera obtener.", "por_que_no": ["A: es la posición de la doctrina más moderna, que ROUBIER no comparte.", "B: es la conciliación que propone VIAL; para ROUBIER, en cambio, no hay término medio posible.", "D: la ley es la causa mediata de los efectos, pero la voluntad es su causa inmediata; el propósito no es irrelevante para ninguna de las posiciones."]}'::jsonb,
  'Manual de Acto Jurídico, I.4 b)',
  false
)
on conflict (id) do nothing;

insert into public.alternativas
  (id, materia, subtema, nivel_exigencia, pregunta, opciones, correcta, retroalimentacion, fuente, publicado)
values (
  'aj-alt-004',
  'acto_juridico',
  'Consecuencias de la autonomía de la voluntad',
  2,
  'Según el art. 12, ¿cuándo puede renunciarse un derecho?',
  '["Siempre, porque cualquiera puede disponer libremente de lo suyo, sin límite alguno", "Cuando el derecho está establecido en beneficio del renunciante, la renuncia mira solo a su interés individual y la ley no la prohíbe", "Cuando mira a su interés individual, aunque la ley prohíba renunciarlo, porque la autonomía de la voluntad prima sobre la prohibición", "Solo cuando la ley autoriza expresamente la renuncia de ese derecho en particular"]'::jsonb,
  1,
  '{"correcta": "Un derecho establecido en beneficio propio puede renunciarse libremente, mientras la renuncia mire solo al interés individual del renunciante y la ley no la prohíba (art. 12).", "por_que_no": ["A: ignora los dos límites que fija el art. 12: que la renuncia mire solo al interés individual del renunciante y que la ley no la prohíba.", "C: invierte la relación: la autonomía de la voluntad cede ante la prohibición legal, no al revés.", "D: convierte la excepción en regla: la renuncia es libre mientras la ley no la prohíba; no hace falta una autorización expresa."]}'::jsonb,
  'Manual de Acto Jurídico, I.5.2 (ii)',
  false
)
on conflict (id) do nothing;

insert into public.alternativas
  (id, materia, subtema, nivel_exigencia, pregunta, opciones, correcta, retroalimentacion, fuente, publicado)
values (
  'aj-alt-005',
  'acto_juridico',
  'Límites: orden público y buenas costumbres',
  3,
  'En la compraventa de cosa ajena (art. 1815), ¿qué efecto tiene el acto respecto del verdadero dueño de la cosa?',
  '["Le es inoponible: el acto no lo perjudica", "Es nulo absolutamente, por objeto ilícito", "Es inexistente, por falta de objeto", "Le es oponible, aunque puede pedir indemnización al vendedor"]'::jsonb,
  0,
  '{"correcta": "Solo se puede disponer de lo propio: disponer de un bien ajeno no perjudica a su verdadero dueño, porque el acto simplemente le es inoponible, como ocurre en la compraventa de cosa ajena (art. 1815).", "por_que_no": ["B: la sanción que corresponde a disponer de lo ajeno es la inoponibilidad respecto del dueño, no la nulidad.", "C: la consecuencia de disponer de lo ajeno es la inoponibilidad, no la inexistencia del acto.", "D: si le fuera oponible, el dueño quedaría perjudicado por un acto en el que no intervino, que es justamente lo que este límite impide."]}'::jsonb,
  'Manual de Acto Jurídico, I.5.3 (i)',
  false
)
on conflict (id) do nothing;

insert into public.alternativas
  (id, materia, subtema, nivel_exigencia, pregunta, opciones, correcta, retroalimentacion, fuente, publicado)
values (
  'aj-alt-006',
  'acto_juridico',
  'Límites: orden público y buenas costumbres',
  3,
  '¿Cómo describe la doctrina las buenas costumbres, como límite a la autonomía de la voluntad?',
  '["Como el conjunto de disposiciones establecidas por el legislador para resguardar los intereses superiores de la colectividad", "Como la moral sexual predominante en una época determinada, y solo ella", "Como lo define el propio Código Civil, que fija su concepto legal en el art. 1461", "Como los principios moralmente predominantes en una época determinada, que incluyen, pero no se agotan en, la moral sexual"]'::jsonb,
  3,
  '{"correcta": "Las buenas costumbres carecen de definición legal y funcionan como una variante del orden público: la doctrina las describe como los principios moralmente predominantes en una época determinada, que incluyen, pero no se agotan en, la moral sexual.", "por_que_no": ["A: es una de las descripciones jurisprudenciales del orden público, no de las buenas costumbres.", "B: las buenas costumbres incluyen la moral sexual, pero no se agotan en ella.", "C: el Código menciona las buenas costumbres, pero no las define: carecen de definición legal, igual que el orden público."]}'::jsonb,
  'Manual de Acto Jurídico, I.5.3 (v)',
  false
)
on conflict (id) do nothing;

insert into public.alternativas
  (id, materia, subtema, nivel_exigencia, pregunta, opciones, correcta, retroalimentacion, fuente, publicado)
values (
  'aj-alt-007',
  'acto_juridico',
  'Elementos accidentales',
  3,
  '¿Puede un elemento accidental afectar la existencia misma del acto jurídico, y no solo su eficacia?',
  '["No: los elementos accidentales solo pueden afectar la eficacia del acto, mediante una condición, un plazo o un modo", "Sí, como cuando las partes acuerdan que la compraventa de un mueble no se perfeccione sin escritura pública (art. 1802)", "Sí, pero solo cuando la ley lo sobreentiende sin necesidad de una cláusula expresa", "No, porque los elementos accidentales no forman parte del acto: son efectos que la ley sobreentiende"]'::jsonb,
  1,
  '{"correcta": "Los elementos accidentales pueden afectar la existencia misma del acto, como cuando las partes acuerdan que una compraventa de un mueble no se perfeccione hasta que se otorgue escritura pública (art. 1802), o, más comúnmente, su eficacia.", "por_que_no": ["A: esa es la forma más común, pero no la única: los elementos accidentales también pueden afectar la existencia del acto.", "C: lo que la ley sobreentiende son los elementos de la naturaleza; los accidentales solo existen si las partes los agregan por cláusula expresa.", "D: describe a los elementos de la naturaleza, que en rigor son efectos que la ley sobreentiende."]}'::jsonb,
  'Manual de Acto Jurídico, I.6.3',
  false
)
on conflict (id) do nothing;

insert into public.alternativas
  (id, materia, subtema, nivel_exigencia, pregunta, opciones, correcta, retroalimentacion, fuente, publicado)
values (
  'aj-alt-008',
  'acto_juridico',
  'Solemnes y no solemnes',
  3,
  'Si las partes pactan una solemnidad que la ley no exige (solemnidad voluntaria) y luego la omiten, ¿qué ocurre con el acto?',
  '["Es nulo absolutamente, igual que si se omitiera una solemnidad legal exigida para su validez", "Es inexistente, porque la solemnidad pactada pasa a ser un requisito de existencia", "Puede producir efectos igual, si las partes actúan de un modo que implique renunciar a esa exigencia", "Es nulo relativamente, porque la solemnidad se pactó en atención a la calidad de las partes"]'::jsonb,
  2,
  '{"correcta": "Si la solemnidad es solo voluntaria, el acto puede igual producir efectos, si las partes actúan de un modo que implique renunciar a esa exigencia.", "por_que_no": ["A: esa es la sanción de omitir una solemnidad legal exigida para la validez (art. 1682); la solemnidad voluntaria no recibe ese tratamiento.", "B: la solemnidad voluntaria no se convierte en un requisito legal: las partes pueden renunciar a ella con su conducta.", "D: confunde la solemnidad voluntaria con los requisitos exigidos en atención a la calidad o estado de las partes; la omisión de la voluntaria puede quedar superada por la conducta de las partes."]}'::jsonb,
  'Manual de Acto Jurídico, I.8.6',
  false
)
on conflict (id) do nothing;

insert into public.alternativas
  (id, materia, subtema, nivel_exigencia, pregunta, opciones, correcta, retroalimentacion, fuente, publicado)
values (
  'aj-alt-009',
  'acto_juridico',
  'Unilaterales, bilaterales y plurilaterales (y convención/contrato)',
  3,
  '¿Desde qué momento se vuelve irrevocable un acto jurídico unilateral recepticio, como el ejercicio de una opción?',
  '["Desde que se emite la declaración, aunque el destinatario no la conozca", "Desde que el destinatario la acepta expresamente", "Desde que el destinatario toma conocimiento de ella", "Nunca: por ser unilateral, su autor puede revocarlo en cualquier momento"]'::jsonb,
  2,
  '{"correcta": "Todo acto unilateral recepticio deja de poder modificarse tan pronto el destinatario toma conocimiento de él: desde ese momento se vuelve irrevocable.", "por_que_no": ["A: antes de que el destinatario tome conocimiento de la declaración, quien la emitió todavía puede arrepentirse y revocarla.", "B: no se requiere aceptación: si hiciera falta la voluntad del destinatario, el acto dejaría de ser unilateral. Basta que tome conocimiento.", "D: que el acto sea unilateral no lo hace revocable indefinidamente: el recepticio queda fijo una vez que su destinatario lo conoce."]}'::jsonb,
  'Manual de Acto Jurídico, I.8.1 (i)',
  false
)
on conflict (id) do nothing;

insert into public.alternativas
  (id, materia, subtema, nivel_exigencia, pregunta, opciones, correcta, retroalimentacion, fuente, publicado)
values (
  'aj-alt-010',
  'acto_juridico',
  'Unilaterales, bilaterales y plurilaterales (y convención/contrato)',
  3,
  '¿Cuál de las siguientes afirmaciones sobre convenciones y contratos es correcta?',
  '["Todo acto jurídico bilateral es un contrato, porque requiere la voluntad de dos partes", "Toda convención es un contrato, pero no todo contrato es una convención", "El pago del precio es un contrato real, porque supone la entrega de una cosa (el dinero)", "La tradición de la cosa vendida es una convención, pero no un contrato, porque extingue una obligación en vez de crearla"]'::jsonb,
  3,
  '{"correcta": "Todo acto bilateral es una convención, y solo es contrato la convención dirigida a crear obligaciones. La tradición de la cosa vendida extingue la obligación del vendedor de dar la cosa: es convención, pero no contrato.", "por_que_no": ["A: todo acto bilateral es una convención; solo es contrato la convención dirigida a crear obligaciones.", "B: invierte la relación: todo contrato es convención, pero no toda convención es contrato.", "C: el pago no crea obligaciones, sino que extingue la de pagar el precio: es convención, pero no contrato, y por eso tampoco puede ser un contrato real."]}'::jsonb,
  'Manual de Acto Jurídico, I.8.1 (ii)',
  false
)
on conflict (id) do nothing;

insert into public.alternativas
  (id, materia, subtema, nivel_exigencia, pregunta, opciones, correcta, retroalimentacion, fuente, publicado)
values (
  'aj-alt-011',
  'acto_juridico',
  'Principales y accesorios',
  3,
  '¿Puede un acto accesorio existir antes que el acto principal?',
  '["Sí, como una hipoteca constituida para caucionar obligaciones que todavía no existen (art. 2413)", "No, porque lo accesorio sigue la suerte de lo principal y, por eso, nunca puede precederlo", "Solo si es un acto de garantía; los actos dependientes nunca pueden existir antes que el principal", "Solo si es un acto dependiente; las cauciones requieren siempre una obligación principal ya nacida"]'::jsonb,
  0,
  '{"correcta": "Un acto accesorio puede existir incluso antes que el principal: así ocurre con las capitulaciones matrimoniales o con una hipoteca constituida para caucionar obligaciones que todavía no existen (art. 2413).", "por_que_no": ["B: que lo accesorio siga la suerte de lo principal se aprecia sobre todo al momento de la extinción, no en el orden en que nacen.", "C: las capitulaciones matrimoniales son un acto dependiente y pueden celebrarse antes que el matrimonio.", "D: la hipoteca es una caución y puede constituirse para caucionar obligaciones que todavía no existen (art. 2413)."]}'::jsonb,
  'Manual de Acto Jurídico, I.8.10',
  false
)
on conflict (id) do nothing;

insert into public.alternativas
  (id, materia, subtema, nivel_exigencia, pregunta, opciones, correcta, retroalimentacion, fuente, publicado)
values (
  'aj-alt-012',
  'acto_juridico',
  'Típicos y atípicos',
  3,
  '¿Qué decide que un acto jurídico sea típico o nominado?',
  '["Que la ley lo haya configurado expresamente, dándole un tratamiento y caracteres propios", "Que tenga un nombre conocido en la práctica de los negocios", "Que la ley lo mencione, aunque sea de pasada", "Que haya sido regulado desde la dictación del Código Civil, porque un acto atípico no puede volverse típico después"]'::jsonb,
  0,
  '{"correcta": "Un acto es típico o nominado si la ley lo configuró expresamente, dándole caracteres propios. No lo decide su nombre, ni basta una mención legal de pasada.", "por_que_no": ["B: que tenga o no un nombre no es, en rigor, lo que decide esta clasificación.", "C: no basta con que la ley lo mencione de pasada, sin darle un tratamiento propio.", "D: un acto atípico puede volverse típico si el legislador lo regula más adelante, como ocurrió con el leasing habitacional."]}'::jsonb,
  'Manual de Acto Jurídico, I.8.13',
  false
)
on conflict (id) do nothing;
