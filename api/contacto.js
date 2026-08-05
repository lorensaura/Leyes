// Función serverless de Vercel: recibe el formulario de contacto de la landing
// y lo guarda en Airtable (mismo patrón que api/waitlist.js). La clave de
// Airtable vive solo acá (variable de entorno AIRTABLE_TOKEN en Vercel).
//
// OJO: usa la misma base/tabla que waitlist.js. Esa tabla hoy solo tiene las
// columnas Email/Fecha/Fuente (las que usa el waitlist): para que este
// endpoint funcione hay que agregarle dos columnas más: "Nombre" (texto) y
// "Mensaje" (texto largo). Sin esas columnas, Airtable va a rechazar el
// guardado y el formulario le va a mostrar el mensaje de error al visitante.

const AIRTABLE_BASE = 'appjP6jK8Jbm5uaeG';
const AIRTABLE_TABLE = 'tblXj3d2lcufAD0KX';

module.exports = async (req, res) => {
  if (req.method !== 'POST') {
    res.status(405).json({ error: 'Método no permitido' });
    return;
  }

  const { nombre, correo, mensaje } = req.body || {};

  if (!nombre || typeof nombre !== 'string') {
    res.status(400).json({ error: 'Nombre inválido' });
    return;
  }
  if (!correo || typeof correo !== 'string' || !correo.includes('@')) {
    res.status(400).json({ error: 'Correo inválido' });
    return;
  }
  if (!mensaje || typeof mensaje !== 'string') {
    res.status(400).json({ error: 'Mensaje inválido' });
    return;
  }

  try {
    const airRes = await fetch(`https://api.airtable.com/v0/${AIRTABLE_BASE}/${AIRTABLE_TABLE}`, {
      method: 'POST',
      headers: {
        'Authorization': `Bearer ${process.env.AIRTABLE_TOKEN}`,
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({
        fields: {
          Nombre: nombre,
          Email: correo,
          Mensaje: mensaje,
          Fecha: new Date().toISOString().split('T')[0],
          Fuente: 'Contacto'
        }
      })
    });

    if (!airRes.ok) {
      res.status(502).json({ error: 'Error al guardar en Airtable' });
      return;
    }

    res.status(200).json({ ok: true });
  } catch (e) {
    res.status(500).json({ error: 'Error interno' });
  }
};
