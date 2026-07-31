-- Agrega la columna `minimo_elementos` a evaluacion_practica: para preguntas de
-- Justificación/Aplicación tipo "menciona/explica N de M posibles" (M > N), donde
-- cualquier N elementos correctos de `elementos_clave` cuentan como respuesta
-- completa. Si la columna es null, la app exige el total de `elementos_clave`
-- (comportamiento de siempre, retrocompatible). Ver hallazgo del 2026-07-31
-- (rc-just-001/rc-just-009 penalizaban respuestas correctas que no coincidían
-- con los N elementos elegidos al redactar el ítem, de varios más posibles).
--
-- Correr una sola vez en Supabase: Database -> SQL Editor -> New query -> pegar -> Run.

alter table public.evaluacion_practica
  add column if not exists minimo_elementos integer;
