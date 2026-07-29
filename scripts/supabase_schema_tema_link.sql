-- Agrega la columna `tema` a preguntas_evaluacion: nombre resuelto del eje
-- del manual (ej. "3. Requisitos de la responsabilidad contractual"), tomado
-- del campo de link `tema` -> `Temas` que ya existe en Airtable (mismo que
-- usa Flashcards desde siempre). evaluacion_practica ya tenía esta columna
-- desde su creación, solo que scripts/sync_airtable_supabase.py la dejaba
-- siempre en null; eso también se corrigió en el script (2026-07-29).
--
-- Correr una sola vez en Supabase: Database -> SQL Editor -> New query -> pegar -> Run.

alter table public.preguntas_evaluacion
  add column if not exists tema text;

create index if not exists idx_preguntas_evaluacion_tema
  on public.preguntas_evaluacion (tema) where publicado;
