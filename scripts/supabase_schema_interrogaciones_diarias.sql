-- Tope diario de interrogaciones del Interrogador IA, para la beta.
-- Correr una sola vez en Supabase: Database → SQL Editor → New query → pegar → Run.
--
-- Diseño: una fila por interrogación (no un contador). El sessionId que ya
-- manda app/interrogador.html (crypto.randomUUID() al empezar, fijo durante
-- toda esa interrogación) es la clave real de cuánto se descuenta: reenviar
-- el mismo sessionId (una alumna que reintenta tras un error, o cualquier
-- turno normal dentro de la misma interrogación) nunca vuelve a descontar
-- cupo; un sessionId nuevo sí, y solo se acepta si todavía queda cupo hoy.
-- El unique (user_id, session_id, fecha) es lo que hace la cuenta imposible
-- de saltarse desde el cliente: aunque alguien arme el request a mano, cada
-- sessionId nuevo consume 1 de los cupos del día, sin excepción.
--
-- Las escrituras las hace únicamente api/interrogador.js, con la llave
-- secreta (SUPABASE_SECRET_KEY), que se salta RLS a propósito: la alumna
-- solo puede LEER sus propias filas, nunca insertar ni borrar directo.

create table if not exists public.interrogaciones_diarias (
  id bigint generated always as identity primary key,
  user_id uuid not null references auth.users(id) on delete cascade,
  session_id uuid not null,
  fecha date not null default (now() at time zone 'America/Santiago')::date,
  creado_en timestamptz not null default now(),
  unique (user_id, session_id, fecha)
);

create index if not exists idx_interrogaciones_diarias_user_fecha
  on public.interrogaciones_diarias (user_id, fecha);

alter table public.interrogaciones_diarias enable row level security;

create policy "interrogaciones_diarias: cada usuaria lee solo lo suyo"
  on public.interrogaciones_diarias for select
  to authenticated
  using (auth.uid() = user_id);
