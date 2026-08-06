-- Agrega la columna `modo` a interrogaciones_diarias, para poder limitar
-- examen y practica por separado (ver api/interrogador.js,
-- chequearYRegistrarSesion). Correr una sola vez en Supabase: Database →
-- SQL Editor → New query → pegar → Run. Idempotente, se puede correr de
-- nuevo sin romper nada si ya se corrió antes.
--
-- Regla nueva desde acá (pedida por Laura, 2026-08-07): 2 interrogaciones
-- al día en total, de las cuales como máximo 1 puede ser examen. Las filas
-- que ya existan de antes de esta columna quedan con modo null; eso es
-- inofensivo porque el conteo de examen las trata como "no examen" (no se
-- puede saber retroactivamente qué modo fue), y de todos modos son de días
-- anteriores a hoy.

alter table public.interrogaciones_diarias
  add column if not exists modo text;

alter table public.interrogaciones_diarias
  drop constraint if exists interrogaciones_diarias_modo_check;

alter table public.interrogaciones_diarias
  add constraint interrogaciones_diarias_modo_check
  check (modo is null or modo in ('examen', 'practica'));
