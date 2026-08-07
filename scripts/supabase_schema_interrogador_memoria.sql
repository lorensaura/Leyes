-- Memoria entre sesiones del Interrogador IA: para que la comisión no le
-- haga a una alumna las mismas preguntas de siempre, y priorice los temas
-- donde le fue mal. Correr una sola vez en Supabase: Database -> SQL Editor
-- -> New query -> pegar -> Run. Idempotente, se puede correr de nuevo sin
-- romper nada si ya se corrio antes.
--
-- Diseño en dos piezas (ver api/interrogador.js):
-- 1. `interrogaciones_diarias` (ya existe, para el tope diario) suma dos
--    columnas: `materia` y `historial` (la transcripción completa de esa
--    sesión, en JSON). Se actualiza turno a turno, así que aunque la
--    alumna cierre la pestaña a mitad de camino, lo que ya conversó queda
--    guardado -- no depende de que la sesión termine bien.
-- 2. `interrogador_memoria`, tabla nueva: UNA fila por (alumna, materia)
--    con un resumen compacto (no la transcripción completa) de los temas
--    ya cubiertos y cómo le fue en cada uno. Se recalcula con una llamada
--    barata a Haiku solo al empezar una sesión nueva (no en cada turno),
--    fusionando el resumen anterior con las sesiones de `historial` que
--    todavía no se habían incorporado (comparando `creado_en` contra
--    `actualizado_en` de la fila de memoria). Así el tamaño del resumen no
--    crece sin límite con la cantidad de sesiones.
--
-- Las escrituras las hace únicamente api/interrogador.js, con la llave
-- secreta (SUPABASE_SECRET_KEY), que se salta RLS a propósito: la alumna
-- solo puede LEER sus propias filas, nunca insertar ni borrar directo.

alter table public.interrogaciones_diarias
  add column if not exists materia text;

alter table public.interrogaciones_diarias
  add column if not exists historial jsonb;

create table if not exists public.interrogador_memoria (
  id bigint generated always as identity primary key,
  user_id uuid not null references auth.users(id) on delete cascade,
  materia text not null,
  resumen text not null,
  actualizado_en timestamptz not null default now(),
  unique (user_id, materia)
);

alter table public.interrogador_memoria enable row level security;

create policy "interrogador_memoria: cada alumna lee solo lo suyo"
  on public.interrogador_memoria for select
  to authenticated
  using (auth.uid() = user_id);
