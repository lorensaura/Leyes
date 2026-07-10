// Función serverless de Vercel: recibe el email del formulario de lista de espera
// y lo guarda en Airtable. La clave de Airtable vive solo acá (variable de entorno
// AIRTABLE_TOKEN en Vercel), nunca en el HTML servido al navegador.

const AIRTABLE_BASE = 'appjP6jK8Jbm5uaeG';
const AIRTABLE_TABLE = 'tblXj3d2lcufAD0KX';

module.exports = async (req, res) => {
  if (req.method !== 'POST') {
    res.status(405).json({ error: 'Método no permitido' });
    return;
  }

  const { email, source } = req.body || {};

  if (!email || typeof email !== 'string' || !email.includes('@')) {
    res.status(400).json({ error: 'Email inválido' });
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
          Email: email,
          Fecha: new Date().toISOString().split('T')[0],
          Fuente: source === 'hero' ? 'Hero' : 'CTA Final'
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
