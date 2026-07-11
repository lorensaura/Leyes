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

const MODOS_VALIDOS = new Set(['examen', 'practica']);
const MAX_MENSAJES = 60;

module.exports = async (req, res) => {
  if (req.method !== 'POST') {
    res.status(405).json({ error: 'Método no permitido' });
    return;
  }

  const { messages, modo } = req.body || {};

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
          { type: 'text', text: CONTENIDO_MANUALES, cache_control: { type: 'ephemeral' } },
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
