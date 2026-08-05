// Función serverless de Vercel: el Interrogador IA de Responsabilidad Civil.
// Recibe el historial de la conversación desde app/interrogador.html, arma
// el system prompt (reglas del examinador + Código Civil/Comercio + muestra
// de preguntas + extractos de manual elegidos para este turno, ver
// api/_interrogador-prompt.js y elegirContenidoDelTurno más abajo) y llama a
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
const PROMPT_ROUTER = require('./_interrogador-router-prompt.js');
const CONTENIDO_MANUALES = require('./_interrogador-contenido.js'); // { completo, porMateria } -- respaldo de seguridad, ver elegirContenidoDelTurno
const CONTENIDO_CODIGO = require('./_interrogador-codigo.js');
const CHUNKS_MANUALES = require('./_interrogador-chunks.js'); // { [id]: texto de la sección }
const INDICE_MANUALES = require('./_interrogador-indice.js'); // [{ id, materia, h1, h2 }]
const CHECKLIST_ANCLAS = require('./_interrogador-checklist-anclas.js');

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
// Fraccionamiento por turno (ver docs/interrogador.md, "Grounding"): en vez
// de mandarle a la IA principal los 3 manuales completos en cada turno, una
// llamada chica y barata a un modelo rápido ("router") decide qué secciones
// cargar para el turno que sigue. Si esa llamada falla o no está segura,
// se cae a un respaldo (manual completo de una materia, o los 3 completos)
// -- nunca se corrige "sin manual" a la vista. Ver elegirContenidoDelTurno.
const ROUTER_MODELO = 'claude-haiku-4-5-20251001';
const ROUTER_MAX_CHUNKS = 8;
const ROUTER_TIMEOUT_MS = 10000;
const ROUTER_TOOL = {
  name: 'seleccionar_contenido',
  description: 'Elige qué secciones del manual cargar como contexto para el turno que el examinador está por generar.',
  input_schema: {
    type: 'object',
    properties: {
      chunk_ids: {
        type: 'array',
        items: { type: 'string' },
        description: 'IDs del índice (entre 2 y 8), por orden de relevancia, para el turno que sigue.',
      },
      checklist_items_en_juego: {
        type: 'array',
        items: { type: 'string', enum: ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k'] },
        description: 'Ítems del checklist (a-k) que este turno pone en juego.',
      },
      no_estoy_seguro: {
        type: 'boolean',
        description: 'true si no hay confianza suficiente para acotar a secciones puntuales.',
      },
      materia_respaldo: {
        type: 'string',
        enum: ['contractual', 'extracontractual', 'precontractual'],
        description: 'Materia más probable del turno actual, para el respaldo si no_estoy_seguro es true.',
      },
    },
    required: ['chunk_ids', 'checklist_items_en_juego', 'no_estoy_seguro', 'materia_respaldo'],
  },
};

// Índice y checklist como texto compacto, calculados una sola vez (no
// dependen de la sesión) -- se los manda el router en su propio mensaje de
// sistema, cacheados igual que hoy se cachea el bloque de manuales.
function construirIndiceTexto(indice) {
  const porMateria = new Map();
  for (const entrada of indice) {
    if (!porMateria.has(entrada.materia)) porMateria.set(entrada.materia, []);
    porMateria.get(entrada.materia).push(entrada);
  }
  const bloques = [];
  for (const [materia, entradas] of porMateria) {
    const lineas = entradas.map((e) => `[${e.id}] ${e.h1} > ${e.h2}`);
    bloques.push(`===== ÍNDICE: ${materia.toUpperCase()} =====\n${lineas.join('\n')}`);
  }
  return bloques.join('\n\n');
}

function construirAnclasTexto(anclas) {
  const lineas = anclas.map((a) => `(${a.item}) ${a.descripcion} -- pistas: ${a.pistas.join(', ')}`);
  return `===== CHECKLIST DE SUBTEMAS (a-k) =====\n${lineas.join('\n')}`;
}

const INDICE_TEXTO = construirIndiceTexto(INDICE_MANUALES);
const ANCLAS_TEXTO = construirAnclasTexto(CHECKLIST_ANCLAS);
const INDICE_POR_ID = new Map(INDICE_MANUALES.map((e) => [e.id, e]));

// Recorta el historial a los últimos `n` mensajes para la llamada del
// router (no hace falta la conversación completa para saber de qué se está
// hablando ahora) y descarta mensajes iniciales sueltos de "assistant" que
// pudieran quedar a mitad del recorte -- la API de Claude exige que
// `messages` empiece con "user".
function mensajesRecientesParaRouter(messages, n = 6) {
  let recorte = messages.slice(-n);
  while (recorte.length && recorte[0].role !== 'user') recorte = recorte.slice(1);
  return recorte.length ? recorte : messages.slice(-1);
}

async function llamarRouter(messages) {
  const controlador = new AbortController();
  const timeout = setTimeout(() => controlador.abort(), ROUTER_TIMEOUT_MS);
  try {
    const resp = await fetch('https://api.anthropic.com/v1/messages', {
      method: 'POST',
      headers: {
        'content-type': 'application/json',
        'x-api-key': process.env.ANTHROPIC_API_KEY,
        'anthropic-version': '2023-06-01',
      },
      signal: controlador.signal,
      body: JSON.stringify({
        model: ROUTER_MODELO,
        max_tokens: 600,
        thinking: { type: 'disabled' },
        tools: [ROUTER_TOOL],
        tool_choice: { type: 'tool', name: ROUTER_TOOL.name },
        system: [
          { type: 'text', text: PROMPT_ROUTER },
          { type: 'text', text: ANCLAS_TEXTO },
          { type: 'text', text: INDICE_TEXTO, cache_control: { type: 'ephemeral', ttl: '1h' } },
        ],
        messages: mensajesRecientesParaRouter(messages),
      }),
    });
    if (!resp.ok) {
      throw new Error(`El router respondió ${resp.status}: ${await resp.text()}`);
    }
    const data = await resp.json();
    const bloqueTool = (data.content || []).find((b) => b.type === 'tool_use');
    if (!bloqueTool || !bloqueTool.input) {
      throw new Error('El router no devolvió una selección de contenido válida');
    }
    return bloqueTool.input;
  } finally {
    clearTimeout(timeout);
  }
}

// Red de seguridad determinística, sin LLM, que corre en paralelo al
// router: si la alumna mencionó un artículo puntual o una palabra clave de
// algún título del índice, esa sección se agrega igual, la haya elegido el
// router o no. Nunca reduce la selección del router, solo puede ampliarla.
function normalizarTexto(texto) {
  return texto.toLowerCase().normalize('NFD').replace(/[\u0300-\u036f]/g, '');
}

function extraerNumerosDeArticulo(texto) {
  const numeros = new Set();
  const re = /art(?:í|i)culos?\.?\s*([0-9][0-9,\sy a]*[0-9]|[0-9]+)/gi;
  let m;
  while ((m = re.exec(texto)) !== null) {
    for (const token of m[1].split(/[^0-9]+/)) {
      if (token) numeros.add(token);
    }
  }
  return numeros;
}

function redDeSeguridadPorPalabraClave(messages) {
  const textoReciente = messages
    .slice(-2)
    .map((m) => m.content || '')
    .join('\n');
  const normalReciente = normalizarTexto(textoReciente);
  const numeros = extraerNumerosDeArticulo(textoReciente);
  const ids = [];
  for (const entrada of INDICE_MANUALES) {
    const tituloNormal = normalizarTexto(`${entrada.h1} ${entrada.h2}`);
    let coincide = false;
    for (const n of numeros) {
      if (new RegExp(`\\bart\\w*\\.?\\s*${n}\\b`).test(tituloNormal)) {
        coincide = true;
        break;
      }
    }
    if (!coincide) {
      const palabrasClave = tituloNormal.split(/[^a-z0-9]+/).filter((p) => p.length >= 8);
      coincide = palabrasClave.some((p) => normalReciente.includes(p));
    }
    if (coincide) ids.push(entrada.id);
  }
  return ids;
}

function construirBloqueExtractos(ids) {
  const partes = ids
    .map((id) => INDICE_POR_ID.get(id))
    .filter(Boolean)
    .map((entrada) => `----- ${entrada.materia} > ${entrada.h1} > ${entrada.h2} -----\n${CHUNKS_MANUALES[entrada.id]}`);
  return (
    '===== EXTRACTOS DEL MANUAL PARA ESTE TURNO =====\n' +
    '(Selección automática de secciones relevantes -- NO es el manual íntegro. ' +
    'Si necesitas un pasaje que no aparece acá, no lo inventes: dilo con naturalidad ' +
    'y sigue con lo que sí puedes verificar.)\n\n' +
    partes.join('\n\n')
  );
}

function textoRespaldoPorMateria(materiaSlug) {
  const texto = CONTENIDO_MANUALES.porMateria[materiaSlug];
  if (!texto) return CONTENIDO_MANUALES.completo;
  return (
    `===== MANUAL COMPLETO (respaldo -- el router no estaba seguro del subtema exacto): ${materiaSlug.toUpperCase()} =====\n\n` +
    texto
  );
}

// Punto de entrada: decide qué bloque de manual va en el system prompt de
// la llamada principal de este turno. Nunca lanza -- cualquier falla cae a
// los 3 manuales completos (el comportamiento de hoy), nunca a "sin
// manual".
async function elegirContenidoDelTurno(messages) {
  try {
    const eleccion = await llamarRouter(messages);
    const idsDelRouter = Array.isArray(eleccion.chunk_ids)
      ? eleccion.chunk_ids.filter((id) => INDICE_POR_ID.has(id))
      : [];
    const idsRedDeSeguridad = redDeSeguridadPorPalabraClave(messages);

    const idsFinal = [];
    for (const id of [...idsDelRouter, ...idsRedDeSeguridad]) {
      if (!idsFinal.includes(id)) idsFinal.push(id);
      if (idsFinal.length >= ROUTER_MAX_CHUNKS) break;
    }

    if (eleccion.no_estoy_seguro || idsFinal.length === 0) {
      return textoRespaldoPorMateria(eleccion.materia_respaldo);
    }
    return construirBloqueExtractos(idsFinal);
  } catch (e) {
    console.error('Fraccionamiento del turno falló, cae a los 3 manuales completos:', e);
    return CONTENIDO_MANUALES.completo;
  }
}

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

  // Fraccionamiento por turno: nunca lanza, ver elegirContenidoDelTurno.
  const contenidoDelTurno = await elegirContenidoDelTurno(messages);

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
          { type: 'text', text: CONTENIDO_CODIGO },
          // ttl 1h (no el default de 5 min): las respuestas de examen son de
          // análisis completo, tardan minutos en escribirse -- con 5 min el
          // caché caduca entre preguntas y se vuelve a pagar el precio
          // completo de este bloque en cada turno. Este es el ÚLTIMO bloque
          // cacheado (cachea todo el prefijo: reglas + código + muestra) --
          // el bloque de extractos que sigue cambia turno a turno, así que
          // va sin cache_control, pero como ahora es chico (unos pocos
          // miles de tokens, no los ~185K de los 3 manuales enteros) pagarlo
          // fresco en cada turno sale igual o más barato que antes.
          { type: 'text', text: muestraPreguntas, cache_control: { type: 'ephemeral', ttl: '1h' } },
          { type: 'text', text: contenidoDelTurno },
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
