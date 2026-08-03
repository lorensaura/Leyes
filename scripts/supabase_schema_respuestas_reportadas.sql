-- Botón de "marcar respuesta incorrecta" del Interrogador IA.
-- Correr una sola vez en Supabase: Database → SQL Editor → New query → pegar → Run.
--
-- A diferencia de interrogaciones_diarias, esta la escribe la alumna directo
-- desde el navegador (mismo patrón que flashcard_progreso: RLS deja insertar
-- y leer solo lo propio). No hay UI de revisión todavía — se revisa a mano
-- en Supabase.

create table if not exists public.respuestas_reportadas (
  id bigint generated always as identity primary key,
  user_id uuid not null references auth.users(id) on delete cascade,
  session_id uuid,
  modo text,
  respuesta text not null,
  creado_en timestamptz not null default now()
);

create index if not exists idx_respuestas_reportadas_user
  on public.respuestas_reportadas (user_id);

alter table public.respuestas_reportadas enable row level security;

create policy "respuestas_reportadas: cada usuaria inserta solo lo suyo"
  on public.respuestas_reportadas for insert
  to authenticated
  with check (auth.uid() = user_id);

create policy "respuestas_reportadas: cada usuaria lee solo lo suyo"
  on public.respuestas_reportadas for select
  to authenticated
  using (auth.uid() = user_id);
