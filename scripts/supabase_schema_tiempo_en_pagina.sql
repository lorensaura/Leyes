-- Registro de tiempo en la página durante la beta, para cruzar cuánto
-- tiempo pasó cada alumna en la app con qué tan en serio tomar su feedback.
-- Correr una sola vez en Supabase: Database → SQL Editor → New query →
-- pegar → Run.
--
-- Lo llena app/nav.js directo desde el navegador (no hay servidor de por
-- medio acá) cada vez que la alumna oculta o cierra la pestaña -- por eso
-- necesita una policy de INSERT para el rol `authenticated`, a diferencia
-- de las otras tablas de esta carpeta que solo escribe el servidor.

create table if not exists public.tiempo_en_pagina (
  id bigint generated always as identity primary key,
  user_id uuid not null references auth.users(id) on delete cascade,
  pagina text not null,
  segundos integer not null,
  creado_en timestamptz not null default now()
);

create index if not exists idx_tiempo_en_pagina_user
  on public.tiempo_en_pagina (user_id);

alter table public.tiempo_en_pagina enable row level security;

create policy "tiempo_en_pagina: cada usuaria inserta lo suyo"
  on public.tiempo_en_pagina for insert
  to authenticated
  with check (auth.uid() = user_id);

create policy "tiempo_en_pagina: cada usuaria lee lo suyo"
  on public.tiempo_en_pagina for select
  to authenticated
  using (auth.uid() = user_id);

-- Consulta útil para revisar el tiempo total por alumna y página (Laura,
-- desde el SQL Editor de Supabase, que no está sujeto a RLS):
--
-- select user_id, pagina,
--        round(sum(segundos) / 60.0, 1) as minutos_totales
-- from public.tiempo_en_pagina
-- group by user_id, pagina
-- order by minutos_totales desc;
