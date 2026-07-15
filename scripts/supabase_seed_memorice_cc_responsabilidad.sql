-- Lote inicial de artículos del Código Civil para Memorice (Responsabilidad).
-- Fuente: BCN, texto refundido DFL 1 (2000), última versión 28-AGO-2025 (Apuntes/Codigo Civil Chileno.pdf).
-- Generado a partir del banco de Evaluación existente (mismos artículos ya citados ahí).
-- Correr en el SQL Editor de Supabase, igual que scripts/supabase_schema_practica.sql.

insert into public.memorice_articulos
  (id, materia, subtema, articulo, texto, prioridad_ocultamiento, palabras_criticas, fuente)
values (
  'cc-art-44',
  'contractual',
  'Culpa grave / dolo',
  '44',
  'La ley distingue tres especies de culpa o descuido. Culpa grave, negligencia grave, culpa lata, es la que consiste en no manejar los negocios ajenos con aquel cuidado que aun las personas negligentes y de poca prudencia suelen emplear en sus negocios propios. Esta culpa en materias civiles equivale al dolo. Culpa leve, descuido leve, descuido ligero, es la falta de aquella diligencia y cuidado que los hombres emplean ordinariamente en sus negocios propios. Culpa o descuido, sin otra calificación, significa culpa o descuido leve. Esta especie de culpa se opone a la diligencia o cuidado ordinario o mediano. El que debe administrar un negocio como un buen padre de familia es responsable de esta especie de culpa. Culpa o descuido levísimo es la falta de aquella esmerada diligencia que un hombre juicioso emplea en la administración de sus negocios importantes. Esta especie de culpa se opone a la suma diligencia o cuidado. El dolo consiste en la intención positiva de inferir injuria a la persona o propiedad de otro.',
  '[["grave", "leve", "levísimo", "equivale al dolo"], ["esmerada diligencia", "buen padre de familia"], [], ["*"]]'::jsonb,
  array['grave','leve','levísimo','equivale','dolo','esmerada'],
  'Código Civil, art. 44'
)
on conflict (id) do nothing;

insert into public.memorice_articulos
  (id, materia, subtema, articulo, texto, prioridad_ocultamiento, palabras_criticas, fuente)
values (
  'cc-art-45',
  'contractual',
  'Caso fortuito / fuerza mayor',
  '45',
  'Se llama fuerza mayor o caso fortuito el imprevisto a que no es posible resistir, como un naufragio, un terremoto, el apresamiento de enemigos, los actos de autoridad ejercidos por un funcionario público, etc.',
  '[["imprevisto", "posible resistir"], [], [], ["*"]]'::jsonb,
  array['imprevisto','posible resistir'],
  'Código Civil, art. 45'
)
on conflict (id) do nothing;

insert into public.memorice_articulos
  (id, materia, subtema, articulo, texto, prioridad_ocultamiento, palabras_criticas, fuente)
values (
  'cc-art-1465',
  'contractual',
  'Culpa grave / dolo',
  '1465',
  'El pacto de no pedir más en razón de una cuenta aprobada, no vale en cuanto al dolo contenido en ella, si no se ha condonado expresamente. La condonación del dolo futuro no vale.',
  '[["dolo futuro", "no vale"], [], [], ["*"]]'::jsonb,
  array['dolo futuro','no vale'],
  'Código Civil, art. 1465'
)
on conflict (id) do nothing;

insert into public.memorice_articulos
  (id, materia, subtema, articulo, texto, prioridad_ocultamiento, palabras_criticas, fuente)
values (
  'cc-art-1545',
  'contractual',
  'Fuerza obligatoria del contrato',
  '1545',
  'Todo contrato legalmente celebrado es una ley para los contratantes, y no puede ser invalidado sino por su consentimiento mutuo o por causas legales.',
  null,
  array['ley para los contratantes','consentimiento mutuo','causas legales'],
  'Código Civil, art. 1545'
)
on conflict (id) do nothing;

insert into public.memorice_articulos
  (id, materia, subtema, articulo, texto, prioridad_ocultamiento, palabras_criticas, fuente)
values (
  'cc-art-1547',
  'contractual',
  'Presunción de culpa / carga probatoria',
  '1547',
  'El deudor no es responsable sino de la culpa lata en los contratos que por su naturaleza sólo son útiles al acreedor; es responsable de la leve en los contratos que se hacen para beneficio recíproco de las partes; y de la levísima, en los contratos en que el deudor es el único que reporta beneficio. El deudor no es responsable del caso fortuito, a menos que se haya constituido en mora (siendo el caso fortuito de aquellos que no hubieran dañado a la cosa debida, si hubiese sido entregada al acreedor), o que el caso fortuito haya sobrevenido por su culpa. La prueba de la diligencia o cuidado incumbe al que ha debido emplearlo; la prueba del caso fortuito al que lo alega. Todo lo cual, sin embargo, se entiende sin perjuicio de las disposiciones especiales de las leyes, y de las estipulaciones expresas de las partes.',
  '[["lata", "leve", "levísima"], ["incumbe al que ha debido emplearlo", "al que lo alega"], [], ["*"]]'::jsonb,
  array['lata','leve','levísima','incumbe','emplearlo','alega'],
  'Código Civil, art. 1547'
)
on conflict (id) do nothing;

insert into public.memorice_articulos
  (id, materia, subtema, articulo, texto, prioridad_ocultamiento, palabras_criticas, fuente)
values (
  'cc-art-1551',
  'contractual',
  'Mora / art. 1551',
  '1551',
  'El deudor está en mora, 1º. Cuando no ha cumplido la obligación dentro del término estipulado, salvo que la ley en casos especiales exija que se requiera al deudor para constituirle en mora; 2º. Cuando la cosa no ha podido ser dada o ejecutada sino dentro de cierto espacio de tiempo, y el deudor lo ha dejado pasar sin darla o ejecutarla; 3º. En los demás casos, cuando el deudor ha sido judicialmente reconvenido por el acreedor.',
  null,
  array['término estipulado','judicialmente reconvenido'],
  'Código Civil, art. 1551'
)
on conflict (id) do nothing;

insert into public.memorice_articulos
  (id, materia, subtema, articulo, texto, prioridad_ocultamiento, palabras_criticas, fuente)
values (
  'cc-art-1552',
  'contractual',
  'Mora / art. 1551',
  '1552',
  'En los contratos bilaterales ninguno de los contratantes está en mora dejando de cumplir lo pactado, mientras el otro no lo cumple por su parte, o no se allana a cumplirlo en la forma y tiempo debidos.',
  null,
  array['ninguno','mora','allana'],
  'Código Civil, art. 1552'
)
on conflict (id) do nothing;

insert into public.memorice_articulos
  (id, materia, subtema, articulo, texto, prioridad_ocultamiento, palabras_criticas, fuente)
values (
  'cc-art-1556',
  'contractual',
  'Extensión del daño / daño emergente y lucro cesante',
  '1556',
  'La indemnización de perjuicios comprende el daño emergente y lucro cesante, ya provengan de no haberse cumplido la obligación, o de haberse cumplido imperfectamente, o de haberse retardado el cumplimiento. Exceptúanse los casos en que la ley la limita expresamente al daño emergente.',
  null,
  array['daño emergente','lucro cesante'],
  'Código Civil, art. 1556'
)
on conflict (id) do nothing;

insert into public.memorice_articulos
  (id, materia, subtema, articulo, texto, prioridad_ocultamiento, palabras_criticas, fuente)
values (
  'cc-art-1558',
  'contractual',
  'Daño moral contractual / previsibilidad',
  '1558',
  'Si no se puede imputar dolo al deudor, sólo es responsable de los perjuicios que se previeron o pudieron preverse al tiempo del contrato; pero si hay dolo, es responsable de todos los perjuicios que fueron una consecuencia inmediata o directa de no haberse cumplido la obligación o de haberse demorado su cumplimiento. La mora producida por fuerza mayor o caso fortuito no da lugar a indemnización de perjuicios. Las estipulaciones de los contratantes podrán modificar estas reglas.',
  '[["dolo", "previeron o pudieron preverse", "inmediata o directa"], [], [], ["*"]]'::jsonb,
  array['dolo','previeron','inmediata','directa'],
  'Código Civil, art. 1558'
)
on conflict (id) do nothing;

insert into public.memorice_articulos
  (id, materia, subtema, articulo, texto, prioridad_ocultamiento, palabras_criticas, fuente)
values (
  'cc-art-1698',
  'contractual',
  'Presunción de culpa / carga probatoria',
  '1698',
  'Incumbe probar las obligaciones o su extinción al que alega aquéllas o ésta. Las pruebas consisten en instrumentos públicos o privados, testigos, presunciones, confesión de parte, juramento deferido, e inspección personal del juez.',
  null,
  array['incumbe','instrumentos','testigos','presunciones','confesión','juramento','inspección'],
  'Código Civil, art. 1698'
)
on conflict (id) do nothing;

insert into public.memorice_articulos
  (id, materia, subtema, articulo, texto, prioridad_ocultamiento, palabras_criticas, fuente)
values (
  'cc-art-2174',
  'contractual',
  'Graduación de la culpa / comodato',
  '2174',
  'El comodato o préstamo de uso es un contrato en que una de las partes entrega a la otra gratuitamente una especie, mueble o raíz, para que haga uso de ella, y con cargo de restituir la misma especie después de terminado el uso. Este contrato no se perfecciona sino por la tradición de la cosa.',
  null,
  array['gratuitamente','restituir','tradición'],
  'Código Civil, art. 2174'
)
on conflict (id) do nothing;

insert into public.memorice_articulos
  (id, materia, subtema, articulo, texto, prioridad_ocultamiento, palabras_criticas, fuente)
values (
  'cc-art-2284',
  'extracontractual',
  'Delito vs. cuasidelito civil / diferencias de régimen',
  '2284',
  'Las obligaciones que se contraen sin convención, nacen o de la ley, o del hecho voluntario de una de las partes. Las que nacen de la ley se expresan en ella. Si el hecho de que nacen es lícito, constituye un cuasicontrato. Si el hecho es ilícito, y cometido con intención de dañar, constituye un delito. Si el hecho es culpable, pero cometido sin intención de dañar, constituye un cuasidelito. En este título se trata solamente de los cuasicontratos.',
  '[["cuasicontrato", "delito", "cuasidelito", "intención de dañar"], [], [], ["*"]]'::jsonb,
  array['lícito','cuasicontrato','intención de dañar','delito','cuasidelito'],
  'Código Civil, art. 2284'
)
on conflict (id) do nothing;

insert into public.memorice_articulos
  (id, materia, subtema, articulo, texto, prioridad_ocultamiento, palabras_criticas, fuente)
values (
  'cc-art-2317',
  'extracontractual',
  'Responsabilidad por hecho ajeno / art. 2320',
  '2317',
  'Si un delito o cuasidelito ha sido cometido por dos o más personas, cada una de ellas será solidariamente responsable de todo perjuicio procedente del mismo delito o cuasidelito, salvas las excepciones de los artículos 2323 y 2328. Todo fraude o dolo cometido por dos o más personas produce la acción solidaria del precedente inciso.',
  '[["solidariamente"], [], [], ["*"]]'::jsonb,
  array['solidariamente'],
  'Código Civil, art. 2317'
)
on conflict (id) do nothing;

insert into public.memorice_articulos
  (id, materia, subtema, articulo, texto, prioridad_ocultamiento, palabras_criticas, fuente)
values (
  'cc-art-2320',
  'extracontractual',
  'Responsabilidad por hecho ajeno / art. 2320',
  '2320',
  'Toda persona es responsable no sólo de sus propias acciones, sino del hecho de aquellos que estuvieren a su cuidado. Así los progenitores son responsables del hecho de los hijos menores que habiten en la misma casa. Así el tutor o curador es responsable de la conducta del pupilo que vive bajo su dependencia y cuidado. Así los jefes de colegios y escuelas responden del hecho de los discípulos, mientras están bajo su cuidado; y los artesanos y empresarios del hecho de sus aprendices o dependientes, en el mismo caso. Pero cesará la obligación de esas personas si con la autoridad y el cuidado que su respectiva calidad les confiere y prescribe, no hubieren podido impedir el hecho.',
  null,
  array['cuidado','cesará','impedir'],
  'Código Civil, art. 2320'
)
on conflict (id) do nothing;

insert into public.memorice_articulos
  (id, materia, subtema, articulo, texto, prioridad_ocultamiento, palabras_criticas, fuente)
values (
  'cc-art-2325',
  'extracontractual',
  'Responsabilidad por hecho ajeno / art. 2320',
  '2325',
  'Las personas obligadas a la reparación de los daños causados por las que de ellas depende, tendrán derecho para ser indemnizadas sobre los bienes de éstas, si los hubiere, y si el que perpetró el daño lo hizo sin orden de la persona a quien debía obediencia, y era capaz de delito o cuasidelito, según el artículo 2319.',
  null,
  array['indemnizadas','sin orden','capaz'],
  'Código Civil, art. 2325'
)
on conflict (id) do nothing;

insert into public.memorice_articulos
  (id, materia, subtema, articulo, texto, prioridad_ocultamiento, palabras_criticas, fuente)
values (
  'cc-art-2329',
  'extracontractual',
  'Presunción de culpa / causalidad',
  '2329',
  'Por regla general todo daño que pueda imputarse a malicia o negligencia de otra persona, debe ser reparado por ésta. Son especialmente obligados a esta reparación: 1º. El que dispara imprudentemente un arma de fuego; 2º. El que remueve las losas de una acequia o cañería en calle o camino, sin las precauciones necesarias para que no caigan los que por allí transitan de día o de noche; 3º. El que, obligado a la construcción o reparación de un acueducto o puente que atraviesa un camino lo tiene en estado de causar daño a los que transitan por él.',
  null,
  array['malicia','negligencia','reparado'],
  'Código Civil, art. 2329'
)
on conflict (id) do nothing;

insert into public.memorice_articulos
  (id, materia, subtema, articulo, texto, prioridad_ocultamiento, palabras_criticas, fuente)
values (
  'cc-art-2330',
  'extracontractual',
  'Art. 2330 / causas de exención',
  '2330',
  'La apreciación del daño está sujeta a reducción, si el que lo ha sufrido se expuso a él imprudentemente.',
  '[["reducción", "imprudentemente"], [], [], ["*"]]'::jsonb,
  array['reducción','imprudentemente'],
  'Código Civil, art. 2330'
)
on conflict (id) do nothing;

insert into public.memorice_articulos
  (id, materia, subtema, articulo, texto, prioridad_ocultamiento, palabras_criticas, fuente)
values (
  'cc-art-2332',
  'general',
  'Prescripción de las acciones civiles',
  '2332',
  'Las acciones que concede este título por daño o dolo, prescriben en cuatro años contados desde la perpetración del acto.',
  '[["cuatro años", "perpetración del acto"], ["acciones", "dolo"], [], ["*"]]'::jsonb,
  array['cuatro','perpetración'],
  'Código Civil, art. 2332'
)
on conflict (id) do nothing;

insert into public.memorice_articulos
  (id, materia, subtema, articulo, texto, prioridad_ocultamiento, palabras_criticas, fuente)
values (
  'cc-art-2515',
  'general',
  'Prescripción de las acciones civiles',
  '2515',
  'Este tiempo es en general de tres años para las acciones ejecutivas y de cinco para las ordinarias. La acción ejecutiva se convierte en ordinaria por el lapso de tres años, y convertida en ordinaria durará solamente otros dos.',
  '[["tres años", "cinco", "tres años", "otros dos"], ["ejecutivas", "ordinarias", "convierte"], [], ["*"]]'::jsonb,
  array['tres','cinco','dos','convierte'],
  'Código Civil, art. 2515'
)
on conflict (id) do nothing;
