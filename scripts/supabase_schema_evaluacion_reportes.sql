-- Reportes de calificación de Evaluación (Práctica): permite que una
-- alumna marque una pregunta puntual que el sistema calificó mal (por
-- ejemplo, una paráfrasis correcta que las keywords curadas no
-- detectaron), para que Laura revise después y ajuste la pauta.
--
-- La corrección de Evaluación es comparación de keywords en JS del
-- navegador (evaluarRespuesta(), app/alternativas.html), sin ningún
-- LLM -- no entiende sinónimos ni paráfrasis. Este reporte no corrige
-- solo, solo junta los casos concretos para que Laura amplíe
-- `elementos_clave`/`keywords` en Airtable cuando corresponda.
--
-- Correr una sola vez en Supabase: Database → SQL Editor → New query →
-- pegar → Run. Mismo patrón de RLS que scripts/supabase_schema_respuestas_reportadas.sql
-- (del Interrogador): cada alumna inserta y lee solo lo suyo, sin UI de
-- revisión -- Laura mira directo en Supabase.

create table if not exists public.evaluacion_reportes (
  id bigint generated always as identity primary key,
  user_id uuid not null references auth.users(id) on delete cascade,
  evaluacion_codigo text not null,
  respuesta_alumna text not null,
  -- Snapshot de la pauta vigente al momento del reporte: Laura puede
  -- editar elementos_clave después en Airtable, y sin este snapshot el
  -- reporte original quedaría desalineado con la pauta que lo generó.
  elementos_clave_snapshot jsonb not null,
  elementos_acertados jsonb not null,
  credito_obtenido numeric,
  creado_en timestamptz not null default now()
);

create index if not exists idx_evaluacion_reportes_user
  on public.evaluacion_reportes (user_id);

alter table public.evaluacion_reportes enable row level security;

create policy "evaluacion_reportes: cada usuaria inserta lo suyo"
  on public.evaluacion_reportes for insert
  to authenticated
  with check (auth.uid() = user_id);

create policy "evaluacion_reportes: cada usuaria lee lo suyo"
  on public.evaluacion_reportes for select
  to authenticated
  using (auth.uid() = user_id);
