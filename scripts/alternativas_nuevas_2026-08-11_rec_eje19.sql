-- Lote de techo real REC (2026-08-11), eje 19 (Los derechos auxiliares
-- del acreedor), cubriendo G.1 (el derecho de prenda general y su
-- fundamento). Sin publicar (publicado = false), pendiente de revisión de
-- Laura. Ver docs/camino-a-beta.md, sección "Beta en curso".

insert into public.alternativas
  (id, materia, subtema, nivel_exigencia, pregunta, opciones, correcta, retroalimentacion, fuente, publicado)
values (
  'rc-alt-030',
  'contractual',
  'La doble finalidad de los derechos auxiliares del acreedor (mantener y acrecentar)',
  2,
  '¿Cuál es la doble finalidad que persiguen los derechos auxiliares del acreedor, según ORREGO?',
  '["Sancionar al deudor y indemnizar a la víctima", "Mantener la integridad del patrimonio del deudor y acrecentarlo cuando sea posible", "Sustituir al deudor en el cumplimiento y extinguir la obligación", "Transferir el dominio de los bienes del deudor al acreedor"]'::jsonb,
  1,
  '{"correcta": "Los derechos auxiliares del acreedor persiguen una doble finalidad: mantener la integridad del patrimonio del deudor, evitando que se reduzca a tal punto de no servir para responder, y acrecentarlo, sea incorporando nuevos bienes o reintegrando los que salieron en fraude de los acreedores.", "por_que_no": ["A: los derechos auxiliares no tienen una función sancionatoria ni indemnizatoria directa; buscan proteger el patrimonio que servirá de garantía, no sancionar ni indemnizar.", "C: los derechos auxiliares no sustituyen al deudor en el cumplimiento ni extinguen la obligación; solo protegen el patrimonio que respalda esa obligación.", "D: ningún derecho auxiliar transfiere el dominio de los bienes del deudor al acreedor; estos siguen siendo del deudor, solo quedan protegidos o reintegrados a su patrimonio."]}'::jsonb,
  'Manual REC, Sección G.1 (El derecho de prenda general y su fundamento)',
  false
)
on conflict (id) do nothing;
