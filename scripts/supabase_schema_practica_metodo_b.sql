-- Addendum: Memorice con dos métodos en paralelo (A/B), 2026-07-14.
-- Correr en el SQL Editor de Supabase, después de supabase_schema_practica.sql.

-- ── Método B: segmentación por cláusulas ────────────────────────────────
-- Si no viene, el cliente la deriva automáticamente (fallback tonto: por
-- ";" o por incisos numerados). Curarla a mano solo vale la pena en los
-- artículos que de verdad se van a memorizar seguido.

alter table public.memorice_articulos
  add column if not exists clausulas jsonb;

-- ── memorice_progreso: el progreso ahora es POR MÉTODO, no solo por artículo ──
-- Las filas ya existentes (de las pruebas con el Método A) se marcan como
-- método 'A' por default para no perder ese progreso.

alter table public.memorice_progreso
  add column if not exists metodo text not null default 'A' check (metodo in ('A', 'B')),
  add column if not exists aciertos_nivel_max integer not null default 0,
  add column if not exists sesiones_con_acierto jsonb not null default '[]'::jsonb;

-- La restricción unique anterior era (user_id, articulo_id); ahora tiene que
-- incluir el método, porque un mismo alumno puede tener progreso distinto
-- en A y en B para el mismo artículo.
alter table public.memorice_progreso drop constraint if exists memorice_progreso_user_id_articulo_id_key;
alter table public.memorice_progreso drop constraint if exists memorice_progreso_user_articulo_metodo_key;
alter table public.memorice_progreso add constraint memorice_progreso_user_articulo_metodo_key
  unique (user_id, articulo_id, metodo);

-- ── Instrumentación: un registro por cada intento, para poder comparar A vs B ──
-- Esto es lo único que permite decidir con datos reales cuál método rinde
-- mejor — sin esto, tener dos métodos es solo tener dos botones.

create table if not exists public.memorice_intentos (
  id bigint generated always as identity primary key,
  user_id uuid not null references auth.users(id) on delete cascade,
  articulo_id text not null references public.memorice_articulos(id) on delete cascade,
  metodo text not null check (metodo in ('A', 'B')),
  nivel smallint not null,
  resultado text not null check (resultado in ('correcto', 'parcial', 'incorrecto')),
  porcentaje_vacios_acertados numeric,
  errores_en_palabras_criticas integer not null default 0,
  segundos_hasta_evaluar numeric,
  abandono boolean not null default false,
  creado_en timestamptz not null default now()
);

create index if not exists idx_memorice_intentos_user
  on public.memorice_intentos (user_id);
create index if not exists idx_memorice_intentos_metodo
  on public.memorice_intentos (metodo, articulo_id);

alter table public.memorice_intentos enable row level security;

drop policy if exists "memorice_intentos: cada usuaria ve solo lo suyo" on public.memorice_intentos;
create policy "memorice_intentos: cada usuaria ve solo lo suyo"
  on public.memorice_intentos for select
  to authenticated
  using (auth.uid() = user_id);

drop policy if exists "memorice_intentos: cada usuaria inserta solo lo suyo" on public.memorice_intentos;
create policy "memorice_intentos: cada usuaria inserta solo lo suyo"
  on public.memorice_intentos for insert
  to authenticated
  with check (auth.uid() = user_id);

-- ── Cláusulas curadas para el art. 1 CC (ya cargado) ─────────────────────
update public.memorice_articulos
set clausulas = '["La ley es una declaración de la voluntad soberana", "que, manifestada en la forma prescrita por la Constitución,", "manda, prohíbe o permite."]'::jsonb
where id = 'cc-art-1';
