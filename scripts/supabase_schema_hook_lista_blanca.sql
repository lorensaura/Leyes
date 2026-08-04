-- Auth Hook "Before User Created": cierra el agujero real de la lista
-- blanca de la beta. Hasta hoy, `alumnas_autorizadas` solo se chequeaba
-- en api/auth-registro.js -- cualquiera que copiara la llave pública
-- (sb_publishable_..., visible en el código fuente de app/auth.html) y
-- llamara directo a POST /auth/v1/otp con create_user:true se saltaba
-- ese chequeo por completo, porque Supabase mismo no sabía nada de la
-- lista blanca. Esta función corre DENTRO de Supabase, antes de crear
-- cualquier usuario nuevo, sin importar qué llave o qué endpoint se use.
--
-- Correr una sola vez en Supabase: Database → SQL Editor → New query →
-- pegar → Run. Después:
--   1. Insertar los correos autorizados en alumnas_autorizadas (Table
--      Editor) -- ANTES de activar el hook, no después. Si la tabla
--      está vacía cuando se activa, TODO registro se rechaza (incluidas
--      las alumnas autorizadas), y se ve idéntico a "el hook está roto"
--      cuando en realidad es "la lista está vacía".
--   2. Authentication → Hooks → "Before User Created" → elegir
--      hook_verificar_lista_blanca → guardar.
--   3. Probar los dos casos (ver docs/camino-a-beta.md o el plan de
--      esta sesión para el detalle): un bypass con curl directo a la
--      API debe devolver 403 ahora; el registro normal vía
--      api/auth-registro.js con un correo autorizado debe seguir
--      funcionando igual que antes.
--
-- Nota: no hay confirmación 100% (solo evidencia indirecta en el código
-- fuente de GoTrue) de que este hook se dispare para el camino de
-- creación vía OTP (no solo el signUp clásico con contraseña) -- por
-- eso el paso 3 de arriba no es opcional, es lo que confirma si este
-- mecanismo alcanza o hay que buscar otro.

create or replace function public.hook_verificar_lista_blanca(event jsonb)
returns jsonb
language plpgsql
security definer
as $$
declare
  correo text;
  autorizado int;
begin
  correo := lower(event->'user'->>'email');
  select count(*) into autorizado
  from public.alumnas_autorizadas
  where lower(email) = correo;
  if autorizado = 0 then
    return jsonb_build_object(
      'error', jsonb_build_object(
        'message', 'Tu correo todavía no está habilitado para la beta de Digesto.',
        'http_code', 403
      )
    );
  end if;
  return '{}'::jsonb;
end;
$$;

grant execute on function public.hook_verificar_lista_blanca to supabase_auth_admin;
-- Explícito a propósito, no redundante con `security definer`:
-- alumnas_autorizadas tiene RLS activado sin ninguna policy. Si por lo
-- que sea el select interno de la función no puede leer la tabla,
-- devolvería 0 filas para CUALQUIER correo y rechazaría a todo el
-- mundo -- este grant reduce ese riesgo de "fail-closed por el motivo
-- equivocado".
grant select on public.alumnas_autorizadas to supabase_auth_admin;
revoke execute on function public.hook_verificar_lista_blanca from authenticated, anon, public;
