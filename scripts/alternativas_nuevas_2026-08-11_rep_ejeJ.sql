-- Lote de techo real REP (2026-08-11), eje J (derecho comparado),
-- cubriendo el artículo 227 del Código Civil portugués, sin ningún ítem
-- propio hasta ahora (a diferencia de Italia, Alemania y el Anteproyecto
-- de Pavía, ya cubiertos). Sin publicar (publicado = false), pendiente de
-- revisión de Laura. Ver docs/camino-a-beta.md, sección "Beta en curso".

insert into public.alternativas
  (id, materia, subtema, nivel_exigencia, pregunta, opciones, correcta, retroalimentacion, fuente, publicado)
values (
  'pre-alt-049',
  'precontractual',
  'El artículo 227 del Código Civil portugués frente al 1337 italiano',
  3,
  '¿Qué característica distingue la formulación del artículo 227 del Código Civil portugués de la del artículo 1337 del Código Civil italiano, pese a que ambas recurren a una cláusula general de buena fe?',
  '["El artículo 227 portugués no distingue expresamente entre la etapa de los tratos y la de formación del contrato, cubriendo ambas bajo un mismo estándar y un mismo factor de atribución", "El artículo 227 portugués regula únicamente el supuesto de la nulidad del contrato, a diferencia del italiano", "El artículo 227 portugués exige dolo, mientras que el italiano se conforma con la culpa", "El artículo 227 portugués es posterior y deroga tácitamente al italiano en el derecho comparado"]'::jsonb,
  0,
  '{"correcta": "A diferencia del artículo 1337 italiano, que se complementa con el artículo 1338 para regular por separado el supuesto de la nulidad, el artículo 227 portugués no distingue expresamente entre tratos preliminares y formación del contrato: cubre ambas etapas bajo un mismo estándar de buena fe y un mismo factor de atribución (la culpa).", "por_que_no": ["B: es al revés, es el artículo 1338 italiano (no el 227 portugués) el que regula específicamente el supuesto de la nulidad.", "C: ni el artículo 227 ni el 1337 exigen dolo; ambos se satisfacen con la infracción del estándar de buena fe (culpa), no con dolo.", "D: los códigos de distintos países no se derogan entre sí; son ordenamientos jurídicos independientes que el manual solo compara con fines de derecho comparado."]}'::jsonb,
  'Manual REP, Eje J.1-J.2 (Código Civil italiano y portugués)',
  false
)
on conflict (id) do nothing;
