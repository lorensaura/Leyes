// Función serverless: portero del registro para la beta de Digesto (Capa 1
// del paywall, ver docs/paywall.md). app/auth.html llama acá -en vez de
// llamar a Supabase directo- cuando alguien usa la pestaña "Registrarse".
// Antes de mandar el código OTP, chequea el correo contra la lista blanca
// (tabla alumnas_autorizadas, ver
// scripts/supabase_schema_alumnas_autorizadas.sql). Si no está en la
// lista, no se manda ningún correo ni se crea cuenta.
//
// La pestaña "Ingresar" (cuentas ya existentes) no pasa por acá: solo se
// cierra el registro de cuentas NUEVAS, no el acceso de las que ya tenían
// cuenta antes de que existiera esta lista.

const SUPABASE_URL = 'https://byyukzhxhtopojgvgglp.supabase.co';
const EMAIL_RE = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

async function estaAutorizada(email) {
  const resp = await fetch(
    `${SUPABASE_URL}/rest/v1/alumnas_autorizadas?email=ilike.${encodeURIComponent(email)}&select=id`,
    {
      headers: {
        apikey: process.env.SUPABASE_SECRET_KEY,
        Authorization: `Bearer ${process.env.SUPABASE_SECRET_KEY}`,
      },
    }
  );
  if (!resp.ok) {
    throw new Error(`Supabase respondió ${resp.status} al chequear la lista blanca`);
  }
  const filas = await resp.json();
  return filas.length > 0;
}

module.exports = async (req, res) => {
  if (req.method !== 'POST') {
    res.status(405).json({ error: 'Método no permitido' });
    return;
  }

  const { email, name, emailRedirectTo } = req.body || {};
  if (typeof email !== 'string' || !EMAIL_RE.test(email)) {
    res.status(400).json({ error: 'Correo inválido' });
    return;
  }

  let autorizada;
  try {
    autorizada = await estaAutorizada(email);
  } catch (e) {
    console.error('Error chequeando la lista blanca:', e);
    res.status(502).json({ error: 'No se pudo verificar tu correo en este momento. Intenta de nuevo.' });
    return;
  }

  if (!autorizada) {
    res.status(403).json({
      error: 'Tu correo todavía no está habilitado para la beta de Digesto. Escribile a Laura para que te agregue.',
    });
    return;
  }

  const redirectQuery =
    typeof emailRedirectTo === 'string' && emailRedirectTo
      ? `?redirect_to=${encodeURIComponent(emailRedirectTo)}`
      : '';

  let otpResp;
  try {
    otpResp = await fetch(`${SUPABASE_URL}/auth/v1/otp${redirectQuery}`, {
      method: 'POST',
      headers: {
        apikey: process.env.SUPABASE_SECRET_KEY,
        Authorization: `Bearer ${process.env.SUPABASE_SECRET_KEY}`,
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({
        email,
        create_user: true,
        data: typeof name === 'string' && name ? { full_name: name } : {},
      }),
    });
  } catch (e) {
    console.error('Error de red mandando el OTP:', e);
    res.status(502).json({ error: 'No se pudo enviar el código. Intenta de nuevo.' });
    return;
  }

  if (!otpResp.ok) {
    let detalle = '';
    try {
      detalle = await otpResp.text();
    } catch (e) {
      // sin detalle disponible
    }
    console.error('Supabase rechazó el envío del OTP:', otpResp.status, detalle);
    res.status(502).json({ error: 'No se pudo enviar el código. Intenta de nuevo.' });
    return;
  }

  res.status(200).json({ ok: true });
};
