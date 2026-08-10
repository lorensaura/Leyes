-- Tope diario de preguntas a JustinIAno, para la beta.
-- Correr una sola vez en Supabase: Database → SQL Editor → New query → pegar → Run.
--
-- Diseño: una fila por pregunta respondida (no un contador). A diferencia
-- del Interrogador (que descuenta por interrogación completa, con
-- session_id), acá cada pregunta a JustinIAno es una interacción suelta, así
-- que no hace falta deduplicar por sesión: simplemente se cuentan las filas
-- de hoy y, si ya hay 50, se corta antes de llamar a la IA.
--
-- Las escrituras las hace únicamente api/justiniano.js, con la llave secreta
-- (SUPABASE_SECRET_KEY), que se salta RLS a propósito: la alumna solo puede
-- LEER sus propias filas, nunca insertar ni borrar directo.

create table if not exists public.justiniano_uso_diario (
  id bigint generated always as identity primary key,
  user_id uuid not null references auth.users(id) on delete cascade,
  fecha date not null default (now() at time zone 'America/Santiago')::date,
  creado_en timestamptz not null default now()
);

create index if not exists idx_justiniano_uso_diario_user_fecha
  on public.justiniano_uso_diario (user_id, fecha);

alter table public.justiniano_uso_diario enable row level security;

create policy "justiniano_uso_diario: cada usuaria lee solo lo suyo"
  on public.justiniano_uso_diario for select
  to authenticated
  using (auth.uid() = user_id);
