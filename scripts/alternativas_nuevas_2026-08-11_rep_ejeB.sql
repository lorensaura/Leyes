-- Lote de techo real REP (2026-08-11), eje B (Evolución doctrinaria),
-- cubriendo el fundamento de Saleilles (cuadro comparativo Ihering/
-- Faggella/Saleilles, §B.5). Sin publicar (publicado = false), pendiente
-- de revisión de Laura. Ver docs/camino-a-beta.md, sección "Beta en curso".

insert into public.alternativas
  (id, materia, subtema, nivel_exigencia, pregunta, opciones, correcta, retroalimentacion, fuente, publicado)
values (
  'pre-alt-048',
  'precontractual',
  'El fundamento de Saleilles: la equidad comercial como estándar objetivo',
  3,
  'Según SALEILLES, ¿en qué se funda la responsabilidad precontractual?',
  '["En la culpa contractual (culpa in contrahendo)", "En la transgresión del acuerdo tácito de negociar, sin necesidad de dolo ni culpa", "En la infracción a los usos y la equidad comercial, un estándar objetivo", "En el enriquecimiento sin causa de la parte que se retira"]'::jsonb,
  2,
  '{"correcta": "SALEILLES funda la responsabilidad precontractual en la infracción a los usos y la equidad comercial, un estándar objetivo distinto tanto de la culpa subjetiva de Ihering como de la transgresión pura del acuerdo de negociar de Faggella.", "por_que_no": ["A: es el fundamento de IHERING, la culpa contractual (culpa in contrahendo).", "B: es el fundamento de FAGGELLA, la transgresión del acuerdo tácito de negociar, sin necesidad de dolo ni culpa.", "D: el enriquecimiento sin causa no aparece en el cuadro comparativo del manual como fundamento de ninguno de los tres autores."]}'::jsonb,
  'Manual REP, Eje B.4-B.5 (cuadro comparativo Ihering/Faggella/Saleilles)',
  false
)
on conflict (id) do nothing;
