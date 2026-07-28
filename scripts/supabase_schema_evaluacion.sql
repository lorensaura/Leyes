-- Tabla nueva para Evaluacion (Aplicacion / Deteccion de error / Justificacion /
-- Discriminacion MC), migrada desde el banco hardcodeado en app/alternativas.html
-- hacia Airtable (una base por materia: Digesto Contractual/Extracontractual/
-- Precontractual, tablas "Aplicación"/"Detección de error"/"Justificación"/
-- "Discriminación MC"). Distinta de preguntas_evaluacion, que sigue siendo el
-- banco de examen real usado como grounding del Interrogador IA, no se toca.
--
-- Correr una sola vez en Supabase: Database -> SQL Editor -> New query -> pegar -> Run.
-- La llena scripts/sync_airtable_supabase.py, no se edita a mano aca.

create table if not exists public.evaluacion_practica (
  id bigint generated always as identity primary key,
  airtable_id text unique not null,
  codigo text,
  materia text not null,
  tipo text not null,
  tema text,
  subtema text,
  caso text,
  enunciado text not null,
  respuesta_modelo text,
  elementos_clave jsonb not null default '[]'::jsonb,
  opciones jsonb not null default '[]'::jsonb,
  correcta text,
  articulos_referencia text,
  objetivo_pedagogico text,
  publicado boolean not null default true,
  actualizado_en timestamptz not null default now()
);

create index if not exists idx_evaluacion_practica_materia_tipo
  on public.evaluacion_practica (materia, tipo) where publicado;

alter table public.evaluacion_practica enable row level security;

create policy "evaluacion_practica: lectura para usuarias con sesión"
  on public.evaluacion_practica for select
  to authenticated
  using (publicado = true);
