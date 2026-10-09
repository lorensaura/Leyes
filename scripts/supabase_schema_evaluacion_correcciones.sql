-- Registro de correcciones de Evaluación (Práctica), 2026-10-09.
--
-- La app (evaluarRespuesta() en app/alternativas.html) corrige comparando
-- keywords con la respuesta: literal, o flexible (palabras con significado,
-- cerca unas de otras, por su raíz). Cada corrección final y cada vez que la
-- alumna aprieta "Lo dije con otras palabras" en un elemento faltante queda
-- registrada aquí, con el texto de su respuesta. Con esto, la IA revisa
-- periódicamente (scripts/revisar_correcciones_evaluacion.py):
--   - los reclamos: si la alumna sí lo dijo, se agrega la variante a las
--     keywords en Airtable; si no, se ignora;
--   - las aprobaciones por coincidencia flexible o por reclamo: si se aprobó
--     algo que no era correcto, se ajusta o se saca la keyword.
-- Ningún cambio llega a Airtable sin la aprobación de Laura.
--
-- Solo inserciones (una fila por corrección, otra por cada reclamo): así no
-- hay carreras entre filas ni hace falta permiso de modificar.
--
-- Correr una sola vez en Supabase: SQL Editor → New query → pegar → Run.
-- Mismo patrón de RLS que supabase_schema_evaluacion_reportes.sql.

create table if not exists public.evaluacion_correcciones (
  id bigint generated always as identity primary key,
  user_id uuid not null references auth.users(id) on delete cascade,
  evento text not null check (evento in ('correccion', 'reclamo')),
  evaluacion_codigo text not null,
  materia text,
  tipo text,
  respuesta_alumna text not null,
  -- pauta vigente al momento de corregir (puede editarse después en Airtable)
  elementos_clave_snapshot jsonb not null,
  -- por elemento: { texto, como: literal | flexible | reclamado | faltante, keyword }
  detalle jsonb not null,
  -- solo en evento = 'reclamo': el elemento que la alumna marcó como logrado
  elemento_reclamado text,
  credito numeric,
  aprobada boolean,
  aprobada_por_reclamo boolean,
  creado_en timestamptz not null default now()
);

create index if not exists idx_evaluacion_correcciones_codigo
  on public.evaluacion_correcciones (evaluacion_codigo);

alter table public.evaluacion_correcciones enable row level security;

create policy "evaluacion_correcciones: cada usuaria inserta lo suyo"
  on public.evaluacion_correcciones for insert
  to authenticated
  with check (auth.uid() = user_id);

create policy "evaluacion_correcciones: cada usuaria lee lo suyo"
  on public.evaluacion_correcciones for select
  to authenticated
  using (auth.uid() = user_id);
