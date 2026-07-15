-- Extensión del esquema para el refactor del módulo de práctica (2026-07-14).
-- Correr en Supabase: Database → SQL Editor → New query → pegar → Run.
-- Es aditivo: no reemplaza scripts/supabase_schema.sql, lo complementa.

-- ── Columnas nuevas en tablas existentes ──────────────────────────────
-- nivel_exigencia (1 a 5) y tags se agregan al esquema unificado de los
-- cuatro modelos de práctica (Flashcards, Alternativas, Memorice, Evaluación).

alter table public.flashcards
  add column if not exists subtema text,
  add column if not exists nivel_exigencia smallint,
  add column if not exists tags text[] not null default '{}';

alter table public.preguntas_evaluacion
  add column if not exists nivel_exigencia smallint,
  add column if not exists tags text[] not null default '{}';

-- ── Modelo: Alternativas (nuevo) ───────────────────────────────────────
-- Multiple choice puro: 4 opciones, retroalimentación solo si se falla.
-- Distinto del subtipo "discriminación MC" de Evaluación (ese sigue con su
-- flujo de recuperación libre + alternativas sin cambios).
--
-- Todavía no se edita desde Airtable — por eso el id es el id semántico del
-- ítem (ej. 'ext-alt-001'), no un airtable_id. Cuando Laura quiera editar esto
-- desde Airtable, se agrega una base nueva y se extiende
-- scripts/sync_airtable_supabase.py, igual que se hizo con las otras dos tablas.

create table if not exists public.alternativas (
  id text primary key,
  materia text not null,
  subtema text,
  nivel_exigencia smallint not null default 3,
  pregunta text not null,
  opciones jsonb not null,
  correcta smallint not null,
  retroalimentacion jsonb not null,
  fuente text,
  tags text[] not null default '{}',
  publicado boolean not null default true,
  actualizado_en timestamptz not null default now()
);

create index if not exists idx_alternativas_materia
  on public.alternativas (materia) where publicado;

alter table public.alternativas enable row level security;

drop policy if exists "alternativas: lectura para usuarias con sesión" on public.alternativas;
create policy "alternativas: lectura para usuarias con sesión"
  on public.alternativas for select
  to authenticated
  using (publicado = true);

-- ── Modelo: Memorice (nuevo) ────────────────────────────────────────────
-- Un artículo se guarda una sola vez, íntegro. El nivel de ocultamiento
-- (N1-N4) se calcula en el cliente a partir de memorice_progreso.nivel_actual;
-- esta tabla no repite el artículo por nivel.

create table if not exists public.memorice_articulos (
  id text primary key,
  materia text not null,
  subtema text,
  nivel_exigencia smallint not null default 5,
  articulo text not null,
  texto text not null,
  prioridad_ocultamiento jsonb,
  palabras_criticas text[] not null default '{}',
  fuente text,
  tags text[] not null default '{}',
  publicado boolean not null default true,
  actualizado_en timestamptz not null default now()
);

create index if not exists idx_memorice_articulos_materia
  on public.memorice_articulos (materia) where publicado;

alter table public.memorice_articulos enable row level security;

drop policy if exists "memorice_articulos: lectura para usuarias con sesión" on public.memorice_articulos;
create policy "memorice_articulos: lectura para usuarias con sesión"
  on public.memorice_articulos for select
  to authenticated
  using (publicado = true);

-- Progreso de repaso por alumna y por artículo (repetición espaciada de Memorice).
-- Mismo patrón que flashcard_progreso: unique(user_id, articulo_id), RLS por dueña.
-- No es un sistema paralelo: reutiliza exactamente la misma forma de upsert y
-- las mismas políticas de flashcard_progreso, solo que agrega nivel_actual,
-- estado e historial porque acá la unidad evaluada (el vacío) y la escala de
-- niveles (1-4) no existen en el modelo de Flashcards.

create table if not exists public.memorice_progreso (
  id bigint generated always as identity primary key,
  user_id uuid not null references auth.users(id) on delete cascade,
  articulo_id text not null references public.memorice_articulos(id) on delete cascade,
  nivel_actual smallint not null default 1 check (nivel_actual between 1 and 4),
  estado text not null check (estado in ('correcto', 'parcial', 'incorrecto')),
  ultima_revision timestamptz not null default now(),
  proxima_revision timestamptz,
  historial jsonb not null default '[]'::jsonb,
  unique (user_id, articulo_id)
);

create index if not exists idx_memorice_progreso_user
  on public.memorice_progreso (user_id);

alter table public.memorice_progreso enable row level security;

drop policy if exists "memorice_progreso: cada usuaria ve solo lo suyo" on public.memorice_progreso;
create policy "memorice_progreso: cada usuaria ve solo lo suyo"
  on public.memorice_progreso for select
  to authenticated
  using (auth.uid() = user_id);

drop policy if exists "memorice_progreso: cada usuaria inserta solo lo suyo" on public.memorice_progreso;
create policy "memorice_progreso: cada usuaria inserta solo lo suyo"
  on public.memorice_progreso for insert
  to authenticated
  with check (auth.uid() = user_id);

drop policy if exists "memorice_progreso: cada usuaria actualiza solo lo suyo" on public.memorice_progreso;
create policy "memorice_progreso: cada usuaria actualiza solo lo suyo"
  on public.memorice_progreso for update
  to authenticated
  using (auth.uid() = user_id)
  with check (auth.uid() = user_id);

-- ── Datos de ejemplo ────────────────────────────────────────────────────
-- Contenido real y verificado (no relleno), pero acotado a lo necesario para
-- probar cada modelo de punta a punta. Cargar el banco completo por materia
-- es un trabajo de contenido aparte (vía Airtable, cuando corresponda).

insert into public.memorice_articulos
  (id, materia, subtema, articulo, texto, prioridad_ocultamiento, palabras_criticas, fuente)
values (
  'cc-art-1',
  'general',
  'Teoría de la ley',
  '1',
  'La ley es una declaración de la voluntad soberana que, manifestada en la forma prescrita por la Constitución, manda, prohíbe o permite.',
  '[["una", "declaración", "voluntad soberana"], ["manda", "prohíbe", "permite"], ["manifestada", "forma prescrita", "Constitución"], ["*"]]'::jsonb,
  array['una', 'declaración', 'voluntad soberana', 'manda', 'prohíbe', 'permite'],
  'Código Civil, art. 1'
)
on conflict (id) do nothing;

insert into public.memorice_articulos
  (id, materia, subtema, articulo, texto, prioridad_ocultamiento, palabras_criticas, fuente)
values (
  'cc-art-2314',
  'extracontractual',
  'Responsabilidad extracontractual',
  '2314',
  'El que ha cometido un delito o cuasidelito que ha inferido daño a otro, es obligado a la indemnización; sin perjuicio de la pena que le impongan las leyes por el delito o cuasidelito.',
  '[["delito", "cuasidelito", "daño"], ["obligado", "indemnización"], ["pena", "leyes"], ["*"]]'::jsonb,
  array['delito', 'cuasidelito', 'daño', 'obligado', 'indemnización'],
  'Código Civil, art. 2314'
)
on conflict (id) do nothing;

insert into public.alternativas
  (id, materia, subtema, nivel_exigencia, pregunta, opciones, correcta, retroalimentacion, fuente)
values (
  'ext-alt-001',
  'extracontractual',
  'Daño — requisitos',
  3,
  'El daño indemnizable en sede extracontractual debe ser:',
  '["Cierto, personal y antijurídico", "Cierto, personal y previsible", "Eventual, personal y antijurídico", "Cierto, patrimonial y antijurídico"]'::jsonb,
  0,
  '{"correcta": "El daño indemnizable exige certeza (no ser meramente eventual), que afecte un interés de quien demanda (carácter personal) y que no exista un deber jurídico de soportarlo (antijuridicidad). La previsibilidad y el carácter patrimonial no son requisitos generales del daño extracontractual.", "por_que_no": ["B: la previsibilidad es un criterio de sede contractual (art. 1558 CC), no de la extracontractual.", "C: el daño eventual no es indemnizable; falta el requisito de certeza.", "D: el daño moral es indemnizable en sede extracontractual; no se exige carácter patrimonial."]}'::jsonb,
  'Art. 2314 CC'
)
on conflict (id) do nothing;

insert into public.alternativas
  (id, materia, subtema, nivel_exigencia, pregunta, opciones, correcta, retroalimentacion, fuente)
values (
  'cont-alt-001',
  'contractual',
  'Mora / art. 1551',
  3,
  'Como regla general, el deudor queda constituido en mora cuando:',
  '["Vence el plazo estipulado en el contrato, sin más trámite", "El acreedor lo reconviene judicialmente", "El deudor reconoce por escrito su incumplimiento", "Transcurren 30 días desde la exigibilidad de la obligación"]'::jsonb,
  1,
  '{"correcta": "El art. 1551 N°3 CC establece como regla general la interpelación judicial: el deudor está en mora desde que el acreedor lo reconviene judicialmente. El solo vencimiento del plazo (N°1) es la excepción, y opera únicamente si el plazo fue expresamente estipulado.", "por_que_no": ["A: describe la excepción del art. 1551 N°1 (interpelación contractual expresa), no la regla general.", "C: el reconocimiento del deudor no está entre los supuestos del art. 1551.", "D: no existe un plazo automático de 30 días en el régimen general de la mora."]}'::jsonb,
  'Art. 1551 CC'
)
on conflict (id) do nothing;
