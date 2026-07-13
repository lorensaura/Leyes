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

const SUPABASE_URL = 'https://byyukzhxhtopojgvgglp.supabase.co';
const MATERIAS_MUESTRA = ['Responsabilidad contractual', 'Responsabilidad extracontractual'];
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

  let muestraPreguntas;
  try {
    muestraPreguntas = await obtenerMuestraPreguntas(sessionId);
  } catch (e) {
    console.error('Error trayendo la muestra de preguntas:', e);
    res.status(502).json({ error: 'No se pudo preparar la interrogación en este momento' });
    return;
  }

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
        model: 'claude-opus-4-8',
        max_tokens: 2048,
        stream: true,
        thinking: { type: 'adaptive' },
        output_config: { effort: 'medium' },
        system: [
          { type: 'text', text: PROMPT_EXAMINADOR },
          { type: 'text', text: CONTENIDO_MANUALES },
          { type: 'text', text: CONTENIDO_CODIGO },
          { type: 'text', text: muestraPreguntas, cache_control: { type: 'ephemeral' } },
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
