-- Cuaderno de errores (2026-08-06). Cada vez que una alumna falla una
-- pregunta de Evaluación o Alternativas, la pregunta queda guardada acá
-- para repasar antes del examen -- ver app/alternativas.html, sección
-- "Errores" del Modelo (Eje 2) y el nav-item "Repaso de errores".
--
-- Autolimpiable: si más adelante la alumna responde bien esa misma
-- pregunta, la fila se borra sola (registrarError/limpiarError en
-- alternativas.html). También se puede sacar a mano con el botón
-- "Ya lo repasé" sin tener que volver a responderla.
--
-- Alcance de esta tanda (decidido por Laura, 2026-08-06): solo Alternativas
-- y Evaluación. La detección de imprecisión conceptual vía IA en el
-- Interrogador queda pospuesta para después del beta -- ver
-- docs/camino-a-beta.md.
--
-- Corre en el SQL Editor de Supabase.

create table if not exists public.practica_errores (
  id bigint generated always as identity primary key,
  user_id uuid not null references auth.users(id) on delete cascade,
  origen text not null check (origen in ('evaluacion', 'alternativas')),
  item_id text not null,
  materia text,
  subtema text,
  tipo text,
  enunciado text,
  actualizado_en timestamptz not null default now()
);

-- Una sola fila viva por pregunta fallada y por alumna: fallar la misma
-- pregunta dos veces actualiza la fecha, no duplica la fila.
create unique index if not exists idx_practica_errores_user_item
  on public.practica_errores (user_id, origen, item_id);

create index if not exists idx_practica_errores_user
  on public.practica_errores (user_id);

alter table public.practica_errores enable row level security;

drop policy if exists "practica_errores: cada usuaria ve solo lo suyo" on public.practica_errores;
create policy "practica_errores: cada usuaria ve solo lo suyo"
  on public.practica_errores for select
  to authenticated
  using (auth.uid() = user_id);

drop policy if exists "practica_errores: cada usuaria inserta solo lo suyo" on public.practica_errores;
create policy "practica_errores: cada usuaria inserta solo lo suyo"
  on public.practica_errores for insert
  to authenticated
  with check (auth.uid() = user_id);

drop policy if exists "practica_errores: cada usuaria actualiza solo lo suyo" on public.practica_errores;
create policy "practica_errores: cada usuaria actualiza solo lo suyo"
  on public.practica_errores for update
  to authenticated
  using (auth.uid() = user_id)
  with check (auth.uid() = user_id);

drop policy if exists "practica_errores: cada usuaria borra solo lo suyo" on public.practica_errores;
create policy "practica_errores: cada usuaria borra solo lo suyo"
  on public.practica_errores for delete
  to authenticated
  using (auth.uid() = user_id);
