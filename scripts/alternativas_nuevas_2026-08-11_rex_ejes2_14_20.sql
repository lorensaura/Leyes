-- Lote de techo real REX (2026-08-11), ejes 2, 14 y 20. Sin publicar
-- (publicado = false), pendiente de revisión de Laura antes de que las vea
-- una alumna. Ver docs/camino-a-beta.md, sección "Beta en curso".

insert into public.alternativas
  (id, materia, subtema, nivel_exigencia, pregunta, opciones, correcta, retroalimentacion, fuente, publicado)
values (
  'ext-alt-044',
  'extracontractual',
  'La anomalía de la cosa juzgada penal: efecto erga omnes sin triple identidad',
  4,
  '¿Qué característica hace anómalo el efecto de cosa juzgada que produce una sentencia penal condenatoria sobre el juicio civil posterior, en comparación con los principios generales de la cosa juzgada?',
  '["Que opera con efecto erga omnes, sin exigir la triple identidad de partes, cosa pedida y causa de pedir que exige el artículo 177 del Código de Procedimiento Civil", "Que solo puede invocarla la víctima, nunca el condenado", "Que solo produce efectos si el juicio civil se tramita ante el mismo tribunal que conoció del proceso penal", "Que requiere que hayan transcurrido al menos cuatro años desde la sentencia penal para poder invocarse en sede civil"]'::jsonb,
  0,
  '{"correcta": "La jurisprudencia ha resuelto que la cosa juzgada de la sentencia penal produce efectos erga omnes, sin requerir la triple identidad del art. 177 CPC (identidad de partes, cosa pedida y causa de pedir), algo que ninguna sentencia civil posee, porque el objeto de la acción civil es materialmente distinto del de la penal. Por eso el art. 179 CPC, al ser una excepción a los principios generales, se interpreta restrictivamente.", "por_que_no": ["B: puede ser invocada por cualquiera, no está limitada a la víctima; su efecto es de proyección general (erga omnes).", "C: no exige identidad de tribunal, solo que la sentencia haya quedado firme.", "D: no existe ese plazo de espera; el efecto opera desde que la sentencia produce cosa juzgada, sujeto al plazo de prescripción de la acción civil misma (art. 2332), que es una cuestión distinta."]}'::jsonb,
  'Manual REX, Eje 2, sección 5 (Dato de grado)',
  false
)
on conflict (id) do nothing;

insert into public.alternativas
  (id, materia, subtema, nivel_exigencia, pregunta, opciones, correcta, retroalimentacion, fuente, publicado)
values (
  'ext-alt-045',
  'extracontractual',
  'Responsabilidad de los jefes de colegios y escuelas por sus discípulos',
  3,
  'El director de un colegio es demandado por el hecho ilícito de un alumno de 17 años, cometido durante el horario de clases dentro del establecimiento. El director alega que no responde, porque la responsabilidad por el hecho ajeno del artículo 2320 solo alcanza a menores de edad cuando estos son hijos del demandado, no discípulos. ¿Es correcto el argumento del director?',
  '["Sí, porque la responsabilidad por hecho ajeno del artículo 2320 solo se extiende a la relación paterno-filial", "No, porque la responsabilidad de los jefes de colegios y escuelas por sus discípulos rige sin distinguir si estos son mayores o menores de edad, mientras permanezcan bajo su cuidado", "No, pero solo porque el alumno tiene 17 años, ya que si hubiera tenido 18 el director sí quedaría exento", "Sí, porque los discípulos nunca están bajo el cuidado del establecimiento durante el horario de clases, solo fuera de él"]'::jsonb,
  1,
  '{"correcta": "La responsabilidad de los jefes de colegios y escuelas por sus discípulos afecta a quien ejerce ese cargo por los hechos ilícitos de sus discípulos, sean mayores o menores de edad, puesto que la norma no distingue en este punto, y subsiste mientras los discípulos permanezcan bajo su cuidado (en el establecimiento o bajo su control).", "por_que_no": ["A: el artículo 2320 regula varias hipótesis de hecho ajeno, no solo la de los padres; los jefes de colegios y escuelas son una de ellas.", "C: la norma no distingue por edad del discípulo; la exigencia de minoría de edad es propia del régimen de los padres (art. 2320 inc. 2°), no del de los jefes de colegios y escuelas.", "D: es exactamente al revés: el fundamento de esta responsabilidad es precisamente que los discípulos están bajo el cuidado del establecimiento mientras asisten a él."]}'::jsonb,
  'Manual REX, Eje 14, sección 3',
  false
)
on conflict (id) do nothing;

insert into public.alternativas
  (id, materia, subtema, nivel_exigencia, pregunta, opciones, correcta, retroalimentacion, fuente, publicado)
values (
  'ext-alt-046',
  'extracontractual',
  'Desde cuándo corren los reajustes e intereses: daño material vs. daño moral',
  4,
  'Un tribunal debe fijar desde qué momento corren los reajustes e intereses de una indemnización por daño moral derivado de un accidente. ¿Cuál es el criterio que se impone en la práctica, y por qué?',
  '["Desde la dictación de la sentencia, porque a diferencia del daño material, el daño moral no existe como cifra determinada sino hasta que el juez la fija en el fallo mismo", "Desde la fecha del hecho ilícito, porque es en ese momento cuando se produce el daño y comienza a erosionarse su valor", "Desde la notificación de la demanda, aplicando las reglas generales sobre la mora, igual que en materia contractual", "Desde que la sentencia queda ejecutoriada, porque solo entonces la obligación de indemnizar es exigible"]'::jsonb,
  0,
  '{"correcta": "Tratándose del daño moral, la dificultad de fijar su valor en el pasado es conceptualmente insalvable: a diferencia del daño material, que existe como magnitud objetiva desde el hecho aunque solo se pruebe después, el daño moral no existe como cifra determinada sino hasta el momento mismo en que el juez la fija en la sentencia, ponderando las circunstancias del caso. Por eso se impone, sin mayor discusión, el criterio de aplicar reajustes e intereses solo desde la dictación de la sentencia.", "por_que_no": ["B: es la tesis que exige retrotraer el cómputo al momento del hecho, coherente con el principio de reparación integral en abstracto, pero que la práctica jurisprudencial no sigue en toda su extensión, y que además pierde sentido conceptual tratándose del daño moral, que no existe como cifra hasta la sentencia.", "C: las normas sobre la mora presuponen una obligación previa cuyo incumplimiento se constituye en mora, lógica contractual ajena a la obligación indemnizatoria extracontractual, que nace directamente del hecho ilícito.", "D: la ejecutoriedad de la sentencia no es el criterio que se maneja en esta discusión; el debate se centra en si computar desde el hecho, la demanda o la sentencia misma."]}'::jsonb,
  'Manual REX, Eje 20, sección 2.4 (Dato de grado)',
  false
)
on conflict (id) do nothing;
