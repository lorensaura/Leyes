// Función serverless de Vercel: JustinIAno, el chat de dudas de materia
// dentro de Práctica (ver docs/interrogador.md, sección "Justiniano: persona
// unificadora"). A diferencia del Interrogador (api/interrogador.js), que
// examina, este responde una duda puntual sobre UNA materia a la vez y
// siempre señala la sección exacta del manual de donde sacó la respuesta.
//
// Grounding: búsqueda vectorial, no el router por IA que usa el Interrogador.
// La pregunta de la alumna se convierte en un embedding (Voyage AI, mismo
// modelo que scripts/generar_embeddings_justiniano.js) y se buscan las
// secciones más parecidas en Supabase (tabla justiniano_secciones, filtrada
// por materia DENTRO de la función SQL -- ver scripts/supabase_schema.sql).
//
// La respuesta se transmite como streaming NDJSON, mismo protocolo que
// interrogador.js:
//   {"type":"secciones","items":[{id,h1,h2}]}  → las secciones usadas, ANTES del texto
//   {"type":"delta","text":"..."}               → un pedazo de texto de la respuesta
//   {"type":"error","message":"..."}             → algo falló (se corta ahí)
//   {"type":"done"}                              → la respuesta terminó bien

const { registrarUsoIA } = require('./_uso_ia.js');

const SUPABASE_URL = 'https://byyukzhxhtopojgvgglp.supabase.co';
const VOYAGE_URL = 'https://api.voyageai.com/v1/embeddings';
// Tiene que ser EXACTAMENTE el mismo modelo que scripts/generar_embeddings_justiniano.js
// usó para indexar los manuales -- si no coinciden, las huellas numéricas no
// son comparables entre sí.
const VOYAGE_MODELO = 'voyage-3';
const VOYAGE_DIMENSIONES = 1024;

const MATERIAS_VALIDAS = new Set(['contractual', 'extracontractual', 'precontractual']);
const MAX_MENSAJES_HISTORIAL = 20;
const MAX_LARGO_PREGUNTA = 2000;
const SECCIONES_A_TRAER = 6;

// Tope diario de preguntas a JustinIAno (Laura, 2026-08-10, decidido junto con
// el rediseño de la UI a página propia -- ver scripts/supabase_schema_justiniano_uso_diario.sql
// para el porqué del diseño de la tabla). A diferencia del Interrogador, acá
// cada pregunta es una interacción suelta: no hay session_id que deduplicar.
const DIARIO_LIMITE = 50;
const MENSAJE_TOPE_DIARIO = 'Ya usaste tus 50 preguntas de hoy con JustinIAno. Mañana se renueva el cupo.';

const SISTEMA_JUSTINIANO = `Sos JustinIAno, el asistente de dudas de Digesto (plataforma de estudio para el examen de grado de Derecho en Chile). Tu trabajo es responder UNA duda puntual de una alumna sobre una materia específica, dentro del flujo de Práctica -- no sos un examinador, no corregís respuestas, no evaluás.

Reglas:
1. Respondé SOLO con base en los extractos del manual que se te dan a continuación. Si esos extractos no alcanzan para responder la duda, decilo explícitamente en vez de inventar o completar con conocimiento general.
2. Siempre indicá de qué sección del manual sacaste la respuesta (nombrá el título exacto, ej. "según la sección 'C. La mora del deudor'"). La app ya le muestra a la alumna un link directo a esa sección, así que tu trabajo es que quede claro CUÁL de los extractos usaste, no repetir el link.
3. Sé directo y breve -- es una duda puntual dentro de una sesión de práctica, no un desarrollo completo del tema. Si la duda pide más profundidad, respondé lo esencial y sugerí que revise la sección completa en el manual.
4. Nunca uses guiones largos (—) en tu respuesta.
5. Si la pregunta no tiene nada que ver con la materia que se te indica, decilo y no intentes responder igual.`;

function construirBloqueSecciones(secciones) {
  if (secciones.length === 0) {
    return 'No se encontraron secciones del manual relacionadas con esta pregunta.';
  }
  return secciones
    .map((s, i) => `[Extracto ${i + 1}] ${s.h1} > ${s.h2}\n\n${s.texto}`)
    .join('\n\n---\n\n');
}

async function verificarUsuario(accessToken) {
  if (!accessToken) return null;
  const resp = await fetch(`${SUPABASE_URL}/auth/v1/user`, {
    headers: {
      apikey: process.env.SUPABASE_SECRET_KEY,
      Authorization: `Bearer ${accessToken}`,
    },
  });
  if (!resp.ok) return null;
  const usuario = await resp.json();
  return usuario && usuario.id ? usuario : null;
}

function fechaSantiagoHoy() {
  return new Date().toLocaleDateString('en-CA', { timeZone: 'America/Santiago' });
}

// Cuenta las preguntas ya registradas hoy y, si hay cupo, deja registrada
// esta interacción antes de gastar en Voyage/Anthropic. No hay session_id que
// deduplicar (a diferencia del Interrogador) -- cada pregunta es su propia
// fila. Ver scripts/supabase_schema_justiniano_uso_diario.sql.
async function chequearYRegistrarInteraccion(userId, hoy) {
  const headers = {
    apikey: process.env.SUPABASE_SECRET_KEY,
    Authorization: `Bearer ${process.env.SUPABASE_SECRET_KEY}`,
    'Content-Type': 'application/json',
  };

  const contadorResp = await fetch(
    `${SUPABASE_URL}/rest/v1/justiniano_uso_diario?user_id=eq.${userId}&fecha=eq.${hoy}&select=id`,
    { headers }
  );
  if (!contadorResp.ok) {
    throw new Error(`Supabase respondió ${contadorResp.status} al contar el tope diario`);
  }
  const filasHoy = await contadorResp.json();
  if (filasHoy.length >= DIARIO_LIMITE) {
    return { ok: false };
  }

  const insertResp = await fetch(`${SUPABASE_URL}/rest/v1/justiniano_uso_diario`, {
    method: 'POST',
    headers: { ...headers, Prefer: 'return=minimal' },
    body: JSON.stringify({ user_id: userId, fecha: hoy }),
  });
  if (!insertResp.ok) {
    throw new Error(`Supabase respondió ${insertResp.status} al registrar la interacción`);
  }
  return { ok: true };
}

async function embeberPregunta(pregunta) {
  const resp = await fetch(VOYAGE_URL, {
    method: 'POST',
    headers: {
      Authorization: `Bearer ${process.env.VOYAGE_API_KEY}`,
      'Content-Type': 'application/json',
    },
    body: JSON.stringify({ model: VOYAGE_MODELO, input: [pregunta], input_type: 'query' }),
  });
  if (!resp.ok) throw new Error(`Voyage ${resp.status}: ${await resp.text()}`);
  const data = await resp.json();
  const embedding = data.data?.[0]?.embedding;
  if (!Array.isArray(embedding) || embedding.length !== VOYAGE_DIMENSIONES) {
    throw new Error('Voyage devolvió un embedding con forma inesperada');
  }
  return embedding;
}

async function buscarSecciones(embedding, materia) {
  const resp = await fetch(`${SUPABASE_URL}/rest/v1/rpc/match_justiniano_secciones`, {
    method: 'POST',
    headers: {
      apikey: process.env.SUPABASE_SECRET_KEY,
      Authorization: `Bearer ${process.env.SUPABASE_SECRET_KEY}`,
      'Content-Type': 'application/json',
    },
    body: JSON.stringify({
      query_embedding: embedding,
      materia_filtro: materia,
      match_count: SECCIONES_A_TRAER,
    }),
  });
  if (!resp.ok) throw new Error(`Supabase rpc ${resp.status}: ${await resp.text()}`);
  return resp.json();
}

module.exports = async (req, res) => {
  if (req.method !== 'POST') {
    res.status(405).json({ error: 'Método no permitido' });
    return;
  }

  const authHeader = req.headers.authorization || '';
  const accessToken = authHeader.startsWith('Bearer ') ? authHeader.slice(7) : null;
  const usuario = await verificarUsuario(accessToken);
  if (!usuario) {
    res.status(401).json({ error: 'Tenés que iniciar sesión para usar JustinIAno' });
    return;
  }

  const { materia, pregunta, historial } = req.body || {};

  if (!MATERIAS_VALIDAS.has(materia)) {
    res.status(400).json({ error: 'Materia inválida' });
    return;
  }
  if (typeof pregunta !== 'string' || !pregunta.trim() || pregunta.length > MAX_LARGO_PREGUNTA) {
    res.status(400).json({ error: 'Falta la pregunta, o es demasiado larga' });
    return;
  }
  const historialValido =
    historial === undefined ||
    (Array.isArray(historial) &&
      historial.length <= MAX_MENSAJES_HISTORIAL &&
      historial.every((m) => m && (m.role === 'user' || m.role === 'assistant') && typeof m.content === 'string'));
  if (!historialValido) {
    res.status(400).json({ error: 'Formato de historial inválido' });
    return;
  }

  let resultadoCupo;
  try {
    resultadoCupo = await chequearYRegistrarInteraccion(usuario.id, fechaSantiagoHoy());
  } catch (e) {
    console.error('Error chequeando el tope diario de JustinIAno:', e);
    res.status(502).json({ error: 'No se pudo verificar tu cupo diario en este momento' });
    return;
  }
  if (!resultadoCupo.ok) {
    res.status(429).json({ error: MENSAJE_TOPE_DIARIO });
    return;
  }

  let secciones;
  try {
    const embedding = await embeberPregunta(pregunta);
    secciones = await buscarSecciones(embedding, materia);
  } catch (e) {
    console.error('Error buscando secciones para JustinIAno:', e);
    res.status(502).json({ error: 'No se pudo buscar en el manual en este momento' });
    return;
  }

  const messages = [...(historial || []), { role: 'user', content: pregunta }];

  let anthropicRes;
  try {
    anthropicRes = await fetch('https://api.anthropic.com/v1/messages', {
      method: 'POST',
      headers: {
        'content-type': 'application/json',
        'x-api-key': process.env.ANTHROPIC_API_KEY,
        'anthropic-version': '2023-06-01',
      },
      body: JSON.stringify({
        model: 'claude-sonnet-5',
        max_tokens: 1536,
        stream: true,
        thinking: { type: 'disabled' },
        system: [
          { type: 'text', text: SISTEMA_JUSTINIANO, cache_control: { type: 'ephemeral' } },
          { type: 'text', text: construirBloqueSecciones(secciones) },
        ],
        messages,
      }),
    });
  } catch (e) {
    res.status(502).json({ error: 'No se pudo conectar con la IA' });
    return;
  }

  if (!anthropicRes.ok || !anthropicRes.body) {
    let detalle = '';
    try {
      detalle = await anthropicRes.text();
    } catch (e) {
      // sin detalle disponible
    }
    console.error('Error de Anthropic (JustinIAno):', anthropicRes.status, detalle);
    res.status(502).json({ error: 'La IA no pudo responder en este momento' });
    return;
  }

  res.writeHead(200, {
    'Content-Type': 'application/x-ndjson; charset=utf-8',
    'Cache-Control': 'no-cache, no-transform',
  });

  res.write(
    JSON.stringify({
      type: 'secciones',
      items: secciones.map((s) => ({ id: s.id, h1: s.h1, h2: s.h2 })),
    }) + '\n'
  );

  const reader = anthropicRes.body.getReader();
  const decoder = new TextDecoder();
  let buffer = '';
  // Uso real de esta llamada (ver api/_uso_ia.js) -- input_tokens y los
  // cache_* vienen completos en message_start; output_tokens se va
  // actualizando en cada message_delta, el último valor es el definitivo.
  const usoTurno = { input_tokens: 0, output_tokens: 0, cache_creation_input_tokens: 0, cache_read_input_tokens: 0 };

  try {
    while (true) {
      const { done, value } = await reader.read();
      if (done) break;

      buffer += decoder.decode(value, { stream: true });
      const lineas = buffer.split('\n');
      buffer = lineas.pop();

      for (const linea of lineas) {
        if (!linea.startsWith('data: ')) continue;
        const payload = linea.slice(6).trim();
        if (!payload) continue;

        let evento;
        try {
          evento = JSON.parse(payload);
        } catch (e) {
          continue;
        }

        if (evento.type === 'content_block_delta' && evento.delta?.type === 'text_delta') {
          res.write(JSON.stringify({ type: 'delta', text: evento.delta.text }) + '\n');
        } else if (evento.type === 'message_start' && evento.message?.usage) {
          Object.assign(usoTurno, evento.message.usage);
        } else if (evento.type === 'message_delta' && typeof evento.usage?.output_tokens === 'number') {
          usoTurno.output_tokens = evento.usage.output_tokens;
        } else if (evento.type === 'error') {
          res.write(JSON.stringify({ type: 'error', message: 'La IA se interrumpió. Intenta de nuevo.' }) + '\n');
          console.error('Error en el stream de Anthropic (JustinIAno):', evento.error);
        }
      }
    }
    res.write(JSON.stringify({ type: 'done' }) + '\n');
  } catch (e) {
    console.error('Error leyendo el stream (JustinIAno):', e);
    res.write(JSON.stringify({ type: 'error', message: 'Se cortó la conexión con la IA.' }) + '\n');
  }

  // Registro de uso/costo real (ver api/_uso_ia.js) -- ttlCache '5m' porque
  // el bloque del sistema más arriba usa cache_control sin ttl explícito
  // (el default de Anthropic es 5 minutos).
  await registrarUsoIA({
    userId: usuario.id,
    feature: 'justiniano',
    modo: materia,
    modelo: 'claude-sonnet-5',
    usage: usoTurno,
    ttlCache: '5m',
  });

  res.end();
};
