-- Instrumentación: un registro por cada intento de Evaluación/Alternativas
-- (2026-08-13). Hoy solo Memorice (memorice_intentos) y Flashcards
-- (flashcard_progreso) dejan rastro de lo que responde cada alumna; por eso
-- el dashboard muestra "sin datos" para Evaluación/Alternativas. Esta tabla
-- es el equivalente para esos dos modelos -- mismo patrón que
-- memorice_intentos (scripts/supabase_schema_practica_metodo_b.sql): log de
-- solo inserción, nunca se pisa un intento anterior.
--
-- Corre en el SQL Editor de Supabase.

create table if not exists public.practica_intentos (
  id bigint generated always as identity primary key,
  user_id uuid not null references auth.users(id) on delete cascade,
  origen text not null check (origen in ('evaluacion', 'alternativas')),
  item_id text not null,
  materia text,
  subtema text,
  tipo text,
  resultado text not null check (resultado in ('correcto', 'parcial', 'incorrecto')),
  credito numeric not null check (credito between 0 and 1),
  creado_en timestamptz not null default now()
);

create index if not exists idx_practica_intentos_user
  on public.practica_intentos (user_id);
create index if not exists idx_practica_intentos_user_fecha
  on public.practica_intentos (user_id, creado_en);

alter table public.practica_intentos enable row level security;

drop policy if exists "practica_intentos: cada usuaria ve solo lo suyo" on public.practica_intentos;
create policy "practica_intentos: cada usuaria ve solo lo suyo"
  on public.practica_intentos for select
  to authenticated
  using (auth.uid() = user_id);

drop policy if exists "practica_intentos: cada usuaria inserta solo lo suyo" on public.practica_intentos;
create policy "practica_intentos: cada usuaria inserta solo lo suyo"
  on public.practica_intentos for insert
  to authenticated
  with check (auth.uid() = user_id);
