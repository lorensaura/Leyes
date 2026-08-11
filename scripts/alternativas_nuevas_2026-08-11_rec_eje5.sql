-- Lote de techo real REC (2026-08-11), eje 5 (Requisitos de la
-- indemnización de perjuicios, el más débil de los 18 ejes reales de
-- Contractual: solo 4 ítems de Evaluación antes de este lote). Sin
-- publicar (publicado = false), pendiente de revisión de Laura antes de
-- que la vea una alumna. Ver docs/camino-a-beta.md, sección "Beta en curso".

insert into public.alternativas
  (id, materia, subtema, nivel_exigencia, pregunta, opciones, correcta, retroalimentacion, fuente, publicado)
values (
  'rc-alt-029',
  'contractual',
  'Las cuatro teorías de la relación de causalidad contractual',
  4,
  '¿Cuál es el criterio que aplica la teoría de la causalidad más aceptada en materia contractual para determinar si un hecho es causa del daño?',
  '["Que sea un hecho sin el cual el daño no se habría producido, sin exigir ningún otro filtro", "Que sea idóneo, según el curso normal y ordinario de las cosas, para producir el daño", "Que sea la condición más cercana o inmediata en el tiempo a la producción del daño", "Que haya creado o incrementado un riesgo jurídicamente desaprobado que se concretó en el resultado"]'::jsonb,
  1,
  '{"correcta": "La causa adecuada es el criterio dominante: exige que el hecho sea, según el curso normal y ordinario de las cosas, idóneo para producir el daño, descartando lo que solo por azar condujo al resultado.", "por_que_no": ["A: es el criterio de la equivalencia de las condiciones (conditio sine qua non): considera causa a todo hecho sin el cual el daño no se habría producido, sin exigir idoneidad, lo que conduce a una cadena causal infinita (regressus ad infinitum) y por eso no es el criterio dominante.", "C: es el criterio de la causa próxima o relevante: atiende solo a la condición más cercana, prescindiendo de las remotas, un criterio distinto y menos aceptado que la causa adecuada.", "D: es el criterio de la imputación objetiva: un planteamiento moderno, de creciente influencia, pero que el manual describe como una corrección adicional, no como el criterio dominante."]}'::jsonb,
  'Manual REC, Sección E.6.1 (Las teorías de la causalidad)',
  false
)
on conflict (id) do nothing;
