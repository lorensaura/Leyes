-- Registro de uso real de IA (tokens + costo estimado en USD) durante la
-- beta, para cruzar cuánta plata gastó cada alumna con qué tan en serio
-- tomar su feedback. Correr una sola vez en Supabase:
-- Database → SQL Editor → New query → pegar → Run.
--
-- Lo llenan api/interrogador.js y api/justiniano.js (ver api/_uso_ia.js)
-- después de CADA respuesta, con la llave secreta (SUPABASE_SECRET_KEY),
-- que se salta RLS a propósito -- la alumna solo puede leer sus propias
-- filas.

create table if not exists public.uso_ia_beta (
  id bigint generated always as identity primary key,
  user_id uuid not null references auth.users(id) on delete cascade,
  feature text not null, -- 'interrogador' | 'justiniano'
  modo text, -- interrogador: 'examen' | 'practica'; justiniano: la materia
  modelo text not null,
  input_tokens integer not null default 0,
  output_tokens integer not null default 0,
  cache_creation_tokens integer not null default 0,
  cache_read_tokens integer not null default 0,
  costo_usd numeric(10, 6),
  creado_en timestamptz not null default now()
);

create index if not exists idx_uso_ia_beta_user
  on public.uso_ia_beta (user_id);

create index if not exists idx_uso_ia_beta_feature
  on public.uso_ia_beta (feature);

alter table public.uso_ia_beta enable row level security;

create policy "uso_ia_beta: cada usuaria lee solo lo suyo"
  on public.uso_ia_beta for select
  to authenticated
  using (auth.uid() = user_id);

-- Consulta útil para revisar el gasto por alumna (Laura, desde el SQL
-- Editor de Supabase, que no está sujeto a RLS):
--
-- select user_id, feature,
--        count(*) as preguntas,
--        sum(costo_usd) as gasto_usd
-- from public.uso_ia_beta
-- group by user_id, feature
-- order by gasto_usd desc;
