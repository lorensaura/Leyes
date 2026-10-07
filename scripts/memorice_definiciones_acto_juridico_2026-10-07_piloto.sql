-- Memorice de DEFINICIONES de Acto Jurídico (piloto, 2026-10-07).
-- Texto copiado literal de las definiciones entre comillas del manual
-- (04_Acto_Juridico_Manual.html, párrafos con estilo de definición); la
-- ubicación exacta va en `fuente`. `articulo` = '' marca la fila como
-- definición: la app no pide número de artículo (requiere el cambio de
-- app/alternativas.html del 2026-10-07 ya desplegado ANTES de correr esto).
-- Sin publicar (publicado = false), pendiente de revisión de Laura. Para
-- publicarlas: update public.memorice_articulos set publicado = true where id like 'aj-def-%';

insert into public.memorice_articulos
  (id, materia, subtema, articulo, texto, prioridad_ocultamiento, palabras_criticas, fuente, publicado)
values (
  'aj-def-001',
  'acto_juridico',
  'Concepto de acto jurídico y sus elementos',
  '',
  'La manifestación de voluntad hecha con el propósito de crear, modificar o extinguir derechos, y que produce los efectos queridos por su autor o las partes porque el derecho sanciona dicha manifestación de voluntad.',
  '[["manifestación", "propósito", "sanciona"], ["crear", "modificar", "extinguir"], ["efectos queridos", "autor o las partes"], ["*"]]'::jsonb,
  array['manifestación', 'propósito', 'crear', 'modificar', 'extinguir', 'sanciona'],
  'Definición de acto jurídico de VIAL. Manual de Acto Jurídico, I.4',
  false
)
on conflict (id) do nothing;

insert into public.memorice_articulos
  (id, materia, subtema, articulo, texto, prioridad_ocultamiento, palabras_criticas, fuente, publicado)
values (
  'aj-def-002',
  'acto_juridico',
  'Voluntad en los actos unilaterales y concepto de consentimiento',
  '',
  'El encuentro de dos declaraciones de voluntad que, emitidas por dos sujetos diversos, se dirigen a un fin común y se funden.',
  '[["encuentro", "funden"], ["dos sujetos diversos", "fin común"], ["declaraciones de voluntad", "emitidas"], ["*"]]'::jsonb,
  array['encuentro', 'dos', 'fin', 'común', 'funden'],
  'Definición doctrinal de consentimiento. Manual de Acto Jurídico, II.A.3.2',
  false
)
on conflict (id) do nothing;

insert into public.memorice_articulos
  (id, materia, subtema, articulo, texto, prioridad_ocultamiento, palabras_criticas, fuente, publicado)
values (
  'aj-def-003',
  'acto_juridico',
  'Concepto de dolo, sus ámbitos y elementos',
  '',
  'La maquinación fraudulenta destinada a que una persona preste su consentimiento para la celebración de un acto o contrato.',
  '[["maquinación", "fraudulenta"], ["preste su consentimiento"], ["celebración", "acto o contrato"], ["*"]]'::jsonb,
  array['maquinación', 'fraudulenta', 'consentimiento'],
  'Definición doctrinal de dolo como vicio del consentimiento. Manual de Acto Jurídico, II.A.6.1',
  false
)
on conflict (id) do nothing;

insert into public.memorice_articulos
  (id, materia, subtema, articulo, texto, prioridad_ocultamiento, palabras_criticas, fuente, publicado)
values (
  'aj-def-004',
  'acto_juridico',
  'Concepto y clases de fuerza (física y moral)',
  '',
  'Los apremios físicos o morales que se ejercen sobre una persona destinados a que preste su consentimiento para la celebración de un acto jurídico.',
  '[["apremios", "físicos o morales"], ["preste su consentimiento"], ["se ejercen sobre una persona", "celebración"], ["*"]]'::jsonb,
  array['apremios', 'físicos', 'morales', 'consentimiento'],
  'Definición doctrinal de fuerza o violencia. Manual de Acto Jurídico, II.A.7.1',
  false
)
on conflict (id) do nothing;

insert into public.memorice_articulos
  (id, materia, subtema, articulo, texto, prioridad_ocultamiento, palabras_criticas, fuente, publicado)
values (
  'aj-def-005',
  'acto_juridico',
  'Concepto y clases de capacidad (goce y ejercicio)',
  '',
  'La aptitud para adquirir derechos y ejercitarlos.',
  '[["aptitud"], ["adquirir"], ["ejercitarlos"], ["*"]]'::jsonb,
  array['aptitud', 'adquirir', 'ejercitarlos'],
  'Definición doctrinal de capacidad. Manual de Acto Jurídico, II.B.1',
  false
)
on conflict (id) do nothing;

insert into public.memorice_articulos
  (id, materia, subtema, articulo, texto, prioridad_ocultamiento, palabras_criticas, fuente, publicado)
values (
  'aj-def-006',
  'acto_juridico',
  'Concepto de objeto ilícito y casos en general',
  '',
  'Aquel que versa sobre hechos prohibidos por las leyes o contrarios a las buenas costumbres o al orden público.',
  '[["prohibidos", "contrarios"], ["buenas costumbres", "orden público"], ["versa sobre hechos", "leyes"], ["*"]]'::jsonb,
  array['prohibidos', 'leyes', 'buenas', 'costumbres', 'orden', 'público'],
  'Definición doctrinal de objeto ilícito. Manual de Acto Jurídico, II.C.4',
  false
)
on conflict (id) do nothing;

insert into public.memorice_articulos
  (id, materia, subtema, articulo, texto, prioridad_ocultamiento, palabras_criticas, fuente, publicado)
values (
  'aj-def-007',
  'acto_juridico',
  'Reglas, concepto general y especies de nulidad',
  '',
  'La sanción legal establecida por la omisión de los requisitos y formalidades que se prescriben para el valor de un acto según su especie y la calidad o estado de las partes.',
  '[["sanción legal", "omisión"], ["especie", "calidad o estado"], ["requisitos y formalidades", "valor de un acto"], ["*"]]'::jsonb,
  array['sanción', 'legal', 'omisión', 'valor', 'especie', 'calidad', 'estado'],
  'Definición doctrinal de nulidad. Manual de Acto Jurídico, IV.B.1.2',
  false
)
on conflict (id) do nothing;
