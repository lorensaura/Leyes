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
