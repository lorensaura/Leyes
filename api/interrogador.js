// Función serverless de Vercel: el Interrogador IA de Responsabilidad Civil.
// Recibe el historial de la conversación desde app/interrogador.html, arma
// el system prompt (reglas del examinador + contenido de los manuales, ver
// api/_interrogador-prompt.js y api/_interrogador-contenido.js) y llama a
// la API de Claude. La llave de Anthropic vive solo acá (variable de entorno
// ANTHROPIC_API_KEY en Vercel), nunca en el HTML servido al navegador.
//
// La respuesta se transmite al navegador como streaming NDJSON (una línea
// JSON por chunk) para que el texto aparezca progresivamente y para que
// cada llamada quede holgadamente dentro del límite de tiempo de las
// funciones serverless de Vercel:
//   {"type":"delta","text":"..."}   → un pedazo de texto de la respuesta
//   {"type":"error","message":"..."} → algo falló (se corta ahí)
//   {"type":"done"}                  → la respuesta terminó bien

const PROMPT_EXAMINADOR = require('./_interrogador-prompt.js');
const CONTENIDO_MANUALES = require('./_interrogador-contenido.js');
const CONTENIDO_CODIGO = require('./_interrogador-codigo.js');

const MODOS_VALIDOS = new Set(['examen', 'practica']);
const MAX_MENSAJES = 60;
// Configuración de modelo por modo (ver docs/interrogador.md). Examen: Opus,
// más caro pero es la corrección final que más le importa a la alumna que
// esté bien calibrada. Práctica: Sonnet 5, corrección breve tras cada
// respuesta -- thinking desactivado a propósito para que los 500 tokens
// vayan enteros a la respuesta visible, no a pensar internamente (con
// thinking activo, max_tokens se reparte entre pensar y responder, y a 500
// tokens el riesgo de que la respuesta visible salga cortada es real).
const CONFIG_MODO = {
  examen: {
    model: 'claude-opus-4-8',
    max_tokens: 2048,
    thinking: { type: 'adaptive' },
    effort: 'medium',
  },
  practica: {
    model: 'claude-sonnet-5',
    max_tokens: 500,
    thinking: { type: 'disabled' },
  },
};
const UUID_RE = /^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/i;
// Tope diario de interrogaciones completas por alumna, durante la beta.
// Se cuenta por sessionId (no por mensaje ni por confiar en el cliente):
// ver chequearYRegistrarSesion. Un sessionId ya registrado HOY nunca vuelve
// a descontar cupo (es la misma interrogación continuando); uno nuevo sí, y
// solo pasa si todavía queda cupo — sin importar qué mande el cliente en
// `messages`, así que reintentar o armar el request a mano no lo saltea.
const DIARIO_LIMITE = 2;
const MENSAJE_TOPE_DIARIO =
  'Has alcanzado tu límite de interrogaciones diarias de la Beta. Se repondrán mañana a las 00:00 hrs.';

const SUPABASE_URL = 'https://byyukzhxhtopojgvgglp.supabase.co';
const MATERIAS_MUESTRA = ['Responsabilidad contractual', 'Responsabilidad extracontractual', 'Responsabilidad precontractual'];
const MUESTRA_POR_MATERIA = 40;

// PRNG determinístico (mulberry32): misma sessionId -> misma muestra en todos
// los mensajes de esa interrogación, para no invalidar el caché de Claude a
// mitad de sesión. Sesiones distintas (sessionId distinta) sacan una muestra
// distinta -> eso da la rotación entre interrogaciones.
function semillaDesdeTexto(texto) {
  let h = 0;
  for (let i = 0; i < texto.length; i++) {
    h = Math.imul(31, h) + texto.charCodeAt(i);
    h |= 0;
  }
  return h >>> 0;
}

function mulberry32(semilla) {
  let a = semilla;
  return function () {
    a |= 0;
    a = (a + 0x6d2b79f5) | 0;
    let t = Math.imul(a ^ (a >>> 15), 1 | a);
    t = (t + Math.imul(t ^ (t >>> 7), 61 | t)) ^ t;
    return ((t ^ (t >>> 14)) >>> 0) / 4294967296;
  };
}

function barajarDeterministico(arr, rand) {
  const copia = arr.slice();
  for (let i = copia.length - 1; i > 0; i--) {
    const j = Math.floor(rand() * (i + 1));
    [copia[i], copia[j]] = [copia[j], copia[i]];
  }
  return copia;
}

function formatearPregunta(p) {
  const partes = [`[${p.tipo || 'sin tipo'}] ${p.subtema || ''}`.trim()];
  partes.push(`Enunciado: ${p.enunciado || ''}`);
  if (p.articulos_referencia) {
    partes.push(`Artículos de referencia: ${p.articulos_referencia}`);
  }
  if (Array.isArray(p.elementos_clave) && p.elementos_clave.length > 0) {
    partes.push('Elementos clave esperados en la respuesta:');
    for (const e of p.elementos_clave) partes.push(`  - ${e}`);
  }
  if (Array.isArray(p.opciones_mc) && p.opciones_mc.length > 0) {
    partes.push('Opciones (pregunta de discriminación / alternativas):');
    for (const o of p.opciones_mc) {
      let linea = `  ${o.letra}) ${o.texto}`;
      if (o.rationale) linea += ` — ${o.rationale}`;
      partes.push(linea);
    }
  }
  if (p.respuesta_modelo) {
    partes.push(`Respuesta modelo: ${p.respuesta_modelo}`);
  }
  return partes.join('\n');
}

// Verifica el JWT de Supabase que manda el cliente contra el propio Supabase
// (endpoint GoTrue /auth/v1/user). Sin esto, cualquiera que conociera esta
// URL podía llamar al Interrogador sin haber iniciado sesión.
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

// Chequea y registra el tope diario de interrogaciones de una alumna, a
// partir del sessionId (no del largo de `messages`, que manda el cliente y
// por lo tanto no es confiable). Ver scripts/supabase_schema_interrogaciones_diarias.sql
// para el porqué del diseño. Las escrituras las hace este servidor con
// SUPABASE_SECRET_KEY, que se salta RLS a propósito — la alumna solo puede
// leer sus propias filas.
async function chequearYRegistrarSesion(userId, sessionId) {
  const hoy = new Date().toLocaleDateString('en-CA', { timeZone: 'America/Santiago' });
  const headers = {
    apikey: process.env.SUPABASE_SECRET_KEY,
    Authorization: `Bearer ${process.env.SUPABASE_SECRET_KEY}`,
    'Content-Type': 'application/json',
  };

  const yaRegistradaResp = await fetch(
    `${SUPABASE_URL}/rest/v1/interrogaciones_diarias?user_id=eq.${userId}&session_id=eq.${sessionId}&fecha=eq.${hoy}&select=id`,
    { headers }
  );
  if (!yaRegistradaResp.ok) {
    throw new Error(`Supabase respondió ${yaRegistradaResp.status} al chequear la sesión`);
  }
  if ((await yaRegistradaResp.json()).length > 0) {
    // Esta interrogación ya estaba contada hoy: es un turno más de la misma, no una nueva.
    return true;
  }

  const contadorResp = await fetch(
    `${SUPABASE_URL}/rest/v1/interrogaciones_diarias?user_id=eq.${userId}&fecha=eq.${hoy}&select=id`,
    { headers }
  );
  if (!contadorResp.ok) {
    throw new Error(`Supabase respondió ${contadorResp.status} al contar el tope diario`);
  }
  if ((await contadorResp.json()).length >= DIARIO_LIMITE) {
    return false;
  }

  const insertResp = await fetch(`${SUPABASE_URL}/rest/v1/interrogaciones_diarias`, {
    method: 'POST',
    headers: { ...headers, Prefer: 'return=minimal' },
    body: JSON.stringify({ user_id: userId, session_id: sessionId, fecha: hoy }),
  });
  // 409 = ya la insertó una petición en paralelo (misma alumna, dos pestañas a la vez);
  // en ese caso ya quedó contada, así que se deja pasar igual.
  if (!insertResp.ok && insertResp.status !== 409) {
    throw new Error(`Supabase respondió ${insertResp.status} al registrar la interrogación`);
  }
  return true;
}

async function obtenerMuestraPreguntas(sessionId) {
  const filtro = MATERIAS_MUESTRA.map((m) => `"${m}"`).join(',');
  const params = new URLSearchParams({
    select:
      'tema_texto,subtema,tipo,enunciado,respuesta_modelo,articulos_referencia,elementos_clave,opciones_mc',
    'tema_texto': `in.(${filtro})`,
    publicado: 'eq.true',
  });
  const resp = await fetch(`${SUPABASE_URL}/rest/v1/preguntas_evaluacion?${params}`, {
    headers: {
      apikey: process.env.SUPABASE_SECRET_KEY,
      Authorization: `Bearer ${process.env.SUPABASE_SECRET_KEY}`,
    },
  });
  if (!resp.ok) {
    throw new Error(`Supabase respondió ${resp.status} al traer preguntas`);
  }
  const todas = await resp.json();

  const rand = mulberry32(semillaDesdeTexto(sessionId || 'sin-sesion'));
  const bloques = [];
  for (const materia of MATERIAS_MUESTRA) {
    const candidatas = todas.filter((p) => p.tema_texto === materia);
    const muestra = barajarDeterministico(candidatas, rand).slice(0, MUESTRA_POR_MATERIA);
    const textoMateria =
      `===== MUESTRA DE PREGUNTAS: ${materia.toUpperCase()} =====\n\n` +
      muestra.map(formatearPregunta).join('\n\n');
    bloques.push(textoMateria);
  }
  return bloques.join('\n\n\n');
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
    res.status(401).json({ error: 'Tenés que iniciar sesión para usar el Interrogador' });
    return;
  }

  const { messages, modo, sessionId } = req.body || {};

  if (!Array.isArray(messages) || messages.length === 0) {
    res.status(400).json({ error: 'Falta el historial de la conversación' });
    return;
  }
  if (messages.length > MAX_MENSAJES) {
    res.status(400).json({ error: 'La interrogación es demasiado larga' });
    return;
  }
  if (modo !== undefined && !MODOS_VALIDOS.has(modo)) {
    res.status(400).json({ error: 'Modo inválido' });
    return;
  }
  const mensajesValidos = messages.every(
    (m) => m && (m.role === 'user' || m.role === 'assistant') && typeof m.content === 'string'
  );
  if (!mensajesValidos) {
    res.status(400).json({ error: 'Formato de mensaje inválido' });
    return;
  }
  if (typeof sessionId !== 'string' || !UUID_RE.test(sessionId)) {
    res.status(400).json({ error: 'Falta identificar la interrogación' });
    return;
  }

  let hayCupo;
  try {
    hayCupo = await chequearYRegistrarSesion(usuario.id, sessionId);
  } catch (e) {
    console.error('Error chequeando el tope diario:', e);
    res.status(502).json({ error: 'No se pudo verificar tu cupo diario en este momento' });
    return;
  }
  if (!hayCupo) {
    res.status(429).json({ error: MENSAJE_TOPE_DIARIO });
    return;
  }

  let muestraPreguntas;
  try {
    muestraPreguntas = await obtenerMuestraPreguntas(sessionId);
  } catch (e) {
    console.error('Error trayendo la muestra de preguntas:', e);
    res.status(502).json({ error: 'No se pudo preparar la interrogación en este momento' });
    return;
  }

  const config = CONFIG_MODO[modo] || CONFIG_MODO.examen;

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
        model: config.model,
        max_tokens: config.max_tokens,
        stream: true,
        thinking: config.thinking,
        ...(config.effort ? { output_config: { effort: config.effort } } : {}),
        system: [
          { type: 'text', text: PROMPT_EXAMINADOR },
          { type: 'text', text: CONTENIDO_MANUALES },
          { type: 'text', text: CONTENIDO_CODIGO },
          // ttl 1h (no el default de 5 min): las respuestas de examen son de
          // análisis completo, tardan minutos en escribirse -- con 5 min el
          // caché caduca entre preguntas y se vuelve a pagar el precio
          // completo de este bloque en cada turno.
          { type: 'text', text: muestraPreguntas, cache_control: { type: 'ephemeral', ttl: '1h' } },
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
    console.error('Error de Anthropic:', anthropicRes.status, detalle);
    res.status(502).json({ error: 'La IA no pudo responder en este momento' });
    return;
  }

  res.writeHead(200, {
    'Content-Type': 'application/x-ndjson; charset=utf-8',
    'Cache-Control': 'no-cache, no-transform',
  });

  const reader = anthropicRes.body.getReader();
  const decoder = new TextDecoder();
  let buffer = '';

  try {
    while (true) {
      const { done, value } = await reader.read();
      if (done) break;

      buffer += decoder.decode(value, { stream: true });
      const lineas = buffer.split('\n');
      buffer = lineas.pop(); // última línea puede venir incompleta

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
        } else if (evento.type === 'error') {
          res.write(JSON.stringify({ type: 'error', message: 'La IA se interrumpió. Intenta de nuevo.' }) + '\n');
          console.error('Error en el stream de Anthropic:', evento.error);
        }
      }
    }
    res.write(JSON.stringify({ type: 'done' }) + '\n');
  } catch (e) {
    console.error('Error leyendo el stream:', e);
    res.write(JSON.stringify({ type: 'error', message: 'Se cortó la conexión con la IA.' }) + '\n');
  }

  res.end();
};
