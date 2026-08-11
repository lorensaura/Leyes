-- Lote de techo real REX (2026-08-11), ejes 9 y 15. Sin publicar (publicado
-- = false), pendiente de revisión de Laura antes de que las vea una alumna.
-- Ver docs/camino-a-beta.md, sección "Beta en curso".

insert into public.alternativas
  (id, materia, subtema, nivel_exigencia, pregunta, opciones, correcta, retroalimentacion, fuente, publicado)
values (
  'ext-alt-042',
  'extracontractual',
  'Los tres grupos de condiciones de aplicación de la presunción del hecho propio',
  3,
  '¿Cuál de las siguientes NO es una de las tres condiciones bajo las cuales la jurisprudencia aplica la presunción de culpabilidad por el hecho propio del artículo 2329?',
  '["La peligrosidad desproporcionada de la acción", "El control de los hechos por parte del demandado", "El rol de la experiencia (lo que usualmente ocurre)", "La existencia de un vínculo contractual previo entre las partes"]'::jsonb,
  3,
  '{"correcta": "Los tres grupos reconocidos por la doctrina y jurisprudencia son la peligrosidad desproporcionada de la acción, el control de los hechos por el demandado, y el rol de la experiencia. La existencia de un vínculo contractual previo no es un criterio de esta presunción, que opera precisamente en el ámbito extracontractual, donde por definición no existe una relación contractual entre las partes.", "por_que_no": ["A: la peligrosidad desproporcionada sí es uno de los tres criterios reconocidos (ilustrado con el choque de trenes).", "B: el control de los hechos por el demandado sí es uno de los tres criterios (casos de responsabilidad hospitalaria y empresarial).", "C: el rol de la experiencia sí es uno de los tres criterios (pozos sin señalizar, excavaciones que dañan construcciones vecinas)."]}'::jsonb,
  'Manual REX, Eje 9, sección 3',
  false
)
on conflict (id) do nothing;

insert into public.alternativas
  (id, materia, subtema, nivel_exigencia, pregunta, opciones, correcta, retroalimentacion, fuente, publicado)
values (
  'ext-alt-043',
  'extracontractual',
  'El límite de la subcontratación: cuándo el subcontratista es en realidad un mero encargado',
  4,
  'Una empresa constructora subcontrata formalmente a otra empresa para instalar las redes eléctricas de un edificio, mediante un contrato a suma alzada. Sin embargo, en la práctica, la constructora principal supervisa a diario el trabajo de los electricistas, les asigna tareas específicas cada mañana y coordina directamente su labor con el resto de la obra, sin que la subcontratista tenga autonomía real sobre cómo y cuándo se ejecuta el trabajo. ¿Existe relación de dependencia entre la constructora principal y los electricistas, para efectos de la responsabilidad por el hecho ajeno?',
  '["Sí, porque la apreciación de la dependencia debe hacerse en concreto, y aquí el subcontratista actúa en los hechos como un mero encargado bajo las órdenes y coordinación de la constructora principal", "No, porque existe un contrato de subcontratación a suma alzada, y ese solo hecho excluye siempre la dependencia", "No, porque la subcontratista es una persona jurídica distinta, y solo puede haber dependencia entre personas naturales", "Sí, pero solo si la subcontratista no tiene patrimonio propio para responder"]'::jsonb,
  0,
  '{"correcta": "La ampliación del concepto de dependencia tiene como límite la subcontratación genuina, pero esa apreciación debe hacerse siempre en concreto y no según la sola naturaleza formal del vínculo contractual invocado. Cuando el subcontratista es, en los hechos, un mero encargado que actúa bajo las órdenes, instrucciones o coordinación del empresario principal (como ocurre aquí, con supervisión diaria y asignación de tareas), sí existe relación de dependencia pese al contrato a suma alzada.", "por_que_no": ["B: el solo hecho del contrato a suma alzada no es determinante; lo decisivo es cómo se ejecuta en la práctica.", "C: la dependencia empresarial se predica igualmente entre personas jurídicas, no exige que las partes sean personas naturales.", "D: la solvencia patrimonial de la subcontratista no es un criterio para determinar la existencia de dependencia."]}'::jsonb,
  'Manual REX, Eje 15, sección 1',
  false
)
on conflict (id) do nothing;
