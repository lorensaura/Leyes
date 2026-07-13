-- Esquema de contenido en Supabase (Flashcards + banco de preguntas del Interrogador).
-- Correr una sola vez en Supabase: Database → SQL Editor → New query → pegar → Run.
--
-- Airtable sigue siendo donde Laura edita el contenido. Estas tablas las llena
-- el script scripts/sync_airtable_supabase.py — no se editan a mano acá.

create table if not exists public.flashcards (
  id bigint generated always as identity primary key,
  airtable_id text unique not null,
  materia text not null,
  tema text,
  pregunta text not null,
  respuesta text not null,
  dificultad text not null,
  publicado boolean not null default true,
  actualizado_en timestamptz not null default now()
);

create table if not exists public.preguntas_evaluacion (
  id bigint generated always as identity primary key,
  airtable_id text unique not null,
  materia text not null,
  tema_texto text not null,
  subtema text,
  tipo text,
  enunciado text not null,
  respuesta_modelo text,
  articulos_referencia text,
  objetivo_pedagogico text,
  fuente text,
  elementos_clave text[] not null default '{}',
  opciones_mc jsonb not null default '[]'::jsonb,
  publicado boolean not null default true,
  actualizado_en timestamptz not null default now()
);

create index if not exists idx_flashcards_materia_dificultad
  on public.flashcards (materia, dificultad) where publicado;

create index if not exists idx_preguntas_tema_texto
  on public.preguntas_evaluacion (tema_texto) where publicado;

-- Row Level Security: solo alumnas con sesión iniciada pueden leer, y solo lo publicado.
-- Nadie (ni desde el navegador) puede escribir directo — eso lo hace únicamente
-- el script de sincronización, que usa la llave secreta y por lo tanto se salta RLS.

alter table public.flashcards enable row level security;
alter table public.preguntas_evaluacion enable row level security;

create policy "flashcards: lectura para usuarias con sesión"
  on public.flashcards for select
  to authenticated
  using (publicado = true);

create policy "preguntas_evaluacion: lectura para usuarias con sesión"
  on public.preguntas_evaluacion for select
  to authenticated
  using (publicado = true);

-- Progreso de repaso por alumna (repetición espaciada de Flashcards).
-- calificacion: 'bien' (no repetir hasta en 7 días), 'mas_o_menos' (3 días),
-- 'poco' (sin espera fija — proxima_revision queda en null, disponible ya).
-- Cada alumna solo puede leer/escribir sus propias filas (auth.uid() = user_id).

create table if not exists public.flashcard_progreso (
  id bigint generated always as identity primary key,
  user_id uuid not null references auth.users(id) on delete cascade,
  flashcard_id bigint not null references public.flashcards(id) on delete cascade,
  calificacion text not null check (calificacion in ('bien', 'mas_o_menos', 'poco')),
  ultima_revision timestamptz not null default now(),
  proxima_revision timestamptz,
  unique (user_id, flashcard_id)
);

create index if not exists idx_flashcard_progreso_user
  on public.flashcard_progreso (user_id);

alter table public.flashcard_progreso enable row level security;

create policy "flashcard_progreso: cada usuaria ve solo lo suyo"
  on public.flashcard_progreso for select
  to authenticated
  using (auth.uid() = user_id);

create policy "flashcard_progreso: cada usuaria inserta solo lo suyo"
  on public.flashcard_progreso for insert
  to authenticated
  with check (auth.uid() = user_id);

create policy "flashcard_progreso: cada usuaria actualiza solo lo suyo"
  on public.flashcard_progreso for update
  to authenticated
  using (auth.uid() = user_id)
  with check (auth.uid() = user_id);
