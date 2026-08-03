-- Lista blanca de correos autorizados para la beta de Digesto
-- (Capa 1 del paywall, ver docs/paywall.md: "cerrar el registro abierto").
-- Correr una sola vez en Supabase: Database → SQL Editor → New query → pegar → Run.
--
-- Solo los correos que estén en esta tabla pueden crear cuenta NUEVA vía
-- OTP en app/auth.html (pestaña "Registrarse"). No afecta a quienes ya
-- tenían cuenta creada antes de hoy (la pestaña "Ingresar" no consulta
-- esta tabla) — hoy eso es solo la cuenta de Laura.
--
-- Laura administra esta lista a mano, sin SQL: Supabase → Table Editor →
-- alumnas_autorizadas → Insert row. Solo hace falta el campo "email"
-- (el "nombre" es opcional, solo para que Laura recuerde de quién es cada fila).
--
-- Sin políticas de RLS: la tabla queda con RLS habilitado pero CERO
-- policies, así que ni "anon" ni "authenticated" pueden leerla ni
-- escribirla desde el navegador bajo ninguna circunstancia. Solo
-- api/auth-registro.js la consulta, con SUPABASE_SECRET_KEY (se salta RLS
-- a propósito, es el servidor).

create table if not exists public.alumnas_autorizadas (
  id bigint generated always as identity primary key,
  email text not null unique,
  nombre text,
  creado_en timestamptz not null default now()
);

alter table public.alumnas_autorizadas enable row level security;
