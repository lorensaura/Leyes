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

const construirPromptExaminador = require('./_interrogador-prompt.js');
const PROMPT_ROUTER = require('./_interrogador-router-prompt.js');
const CONTENIDO_MANUALES = require('./_interrogador-contenido.js'); // { completo, porMateria } -- respaldo de seguridad, ver elegirContenidoDelTurno / respaldoDeCierre
const CONTENIDO_CODIGO = require('./_interrogador-codigo.js');
const CHUNKS_MANUALES = require('./_interrogador-chunks.js'); // { [id]: texto de la sección }
const INDICE_MANUALES = require('./_interrogador-indice.js'); // [{ id, materia, h1, h2 }]
const CHECKLIST_ANCLAS = require('./_interrogador-checklist-anclas.js');

const MODOS_VALIDOS = new Set(['examen', 'practica']);
// La alumna elige interrogarse sobre una sola materia (más barato: el
// respaldo, si hace falta, nunca toca las otras dos) o "todas" (modo
// transversal, pensado para 1-2 veces por semana, no una vez por sesión).
const MATERIAS_VALIDAS = new Set(['contractual', 'extracontractual', 'precontractual', 'todas']);
const ETIQUETA_POR_MATERIA = {
  contractual: 'Responsabilidad contractual',
  extracontractual: 'Responsabilidad extracontractual',
  precontractual: 'Responsabilidad precontractual',
};
const MATERIA_POR_ETIQUETA = Object.fromEntries(
  Object.entries(ETIQUETA_POR_MATERIA).map(([slug, etiqueta]) => [etiqueta, slug])
);
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
// se cae a un respaldo -- nunca se corrige "sin manual" a la vista. El
// manual completo (de una materia, o de las 3) queda reservado para cuando
// de verdad hace falta -- ver elegirContenidoDelTurno y respaldoDeCierre.
const ROUTER_MODELO = 'claude-haiku-4-5-20251001';
const ROUTER_MAX_CHUNKS = 8;
// Tope de la "llamada ampliada" del cierre en sesiones "todas las materias"
// (ver respaldoDeCierre) -- más alto que el de un turno normal porque tiene
// que cubrir razonablemente toda la sesión, no un solo subtema.
const ROUTER_MAX_CHUNKS_AMPLIO = 24;
const ROUTER_TIMEOUT_MS = 10000;
// A partir de este largo de conversación, el cierre puede llegar en
// cualquier momento: en vez de esperar a que el router lo detecte bien con
// "es_cierre", se lo trata directamente como cierre (ver respaldoDeCierre).
// El protocolo apunta a ~15-20 preguntas núcleo + caso práctico antes de
// cerrar (típicamente ~30-38 mensajes).
const UMBRAL_MENSAJES_CIERRE_FORZADO = 40;
// Duración elegida por la alumna (ver app/interrogador.html). Además de
// cambiar cuántas preguntas apunta a hacer el examinador (ver
// api/_interrogador-prompt.js, DURACION_CONFIG), acorta el umbral mecánico
// de cierre forzado -- si no, una sesión de 5 minutos podría seguir
// corriendo 40 mensajes igual que una de 30.
const DURACIONES_VALIDAS = new Set([5, 15, 30]);
const UMBRAL_CIERRE_POR_DURACION = { 5: 12, 15: 24, 30: 40 };

function construirRouterTool(tope) {
  return {
    name: 'seleccionar_contenido',
    description: 'Elige qué secciones del manual cargar como contexto para el turno que el examinador está por generar.',
    input_schema: {
      type: 'object',
      properties: {
        chunk_ids: {
          type: 'array',
          items: { type: 'string' },
          description: `IDs del índice (hasta ${tope}), por orden de relevancia, para el turno que sigue.`,
        },
        checklist_items_en_juego: {
          type: 'array',
          items: { type: 'string', enum: ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k'] },
          description: 'Ítems del checklist (a-k) que este turno pone en juego.',
        },
        no_estoy_seguro: {
          type: 'boolean',
          description: 'true si no hay confianza suficiente para acotar a secciones puntuales (ver el prompt del router para el criterio distinto en la llamada ampliada).',
        },
        materia_respaldo: {
          type: 'string',
          enum: ['contractual', 'extracontractual', 'precontractual'],
          description: 'Materia más probable del turno actual, para el respaldo si no_estoy_seguro es true.',
        },
        es_cierre: {
          type: 'boolean',
          description:
            'true si el turno que sigue es el CIERRE de la interrogación (anuncio de fin + EVALUACIÓN FINAL con rúbrica). Esa evaluación corrige y cita texto de TODA la sesión, no de un subtema puntual.',
        },
      },
      required: ['chunk_ids', 'checklist_items_en_juego', 'no_estoy_seguro', 'materia_respaldo', 'es_cierre'],
    },
  };
}

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

// Índice/anclas recortados por materia -- se calculan una sola vez al
// cargar el módulo (no dependen de la sesión). Cuando la interrogación es
// de una sola materia, el router recibe solo esto: más barato, y
// estructuralmente no puede elegir una sección de otra materia por error.
// El ítem 'compartido' del checklist (marco general) se incluye siempre.
const INDICE_POR_MATERIA = {};
const INDICE_TEXTO_POR_MATERIA = {};
const ANCLAS_TEXTO_POR_MATERIA = {};
for (const slug of Object.keys(ETIQUETA_POR_MATERIA)) {
  const indice = INDICE_MANUALES.filter((e) => e.materia === ETIQUETA_POR_MATERIA[slug]);
  const anclas = CHECKLIST_ANCLAS.filter((a) => a.materia === 'compartido' || a.materia === slug);
  INDICE_POR_MATERIA[slug] = indice;
  INDICE_TEXTO_POR_MATERIA[slug] = construirIndiceTexto(indice);
  ANCLAS_TEXTO_POR_MATERIA[slug] = construirAnclasTexto(anclas);
}

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

// materiaSesion: 'contractual' | 'extracontractual' | 'precontractual' | 'todas'.
// opciones.ampliado: true para la llamada de respaldo del cierre en modo
// 'todas' (conversación completa, tope ROUTER_MAX_CHUNKS_AMPLIO) en vez de
// la llamada normal de cada turno (últimos mensajes, tope ROUTER_MAX_CHUNKS).
async function llamarRouter(messages, materiaSesion, opciones = {}) {
  const ampliado = !!opciones.ampliado;
  const tope = ampliado ? ROUTER_MAX_CHUNKS_AMPLIO : ROUTER_MAX_CHUNKS;
  const indiceTexto = materiaSesion === 'todas' ? INDICE_TEXTO : INDICE_TEXTO_POR_MATERIA[materiaSesion];
  const anclasTexto = materiaSesion === 'todas' ? ANCLAS_TEXTO : ANCLAS_TEXTO_POR_MATERIA[materiaSesion];
  const mensajesParaRouter = ampliado ? messages : mensajesRecientesParaRouter(messages);

  const controlador = new AbortController();
  const timeout = setTimeout(() => controlador.abort(), ROUTER_TIMEOUT_MS);
  // Cuántos mensajes lleva la conversación real -- ayuda al router a juzgar
  // si el turno que sigue es probablemente el cierre (protocolo: 15-20
  // preguntas núcleo + caso práctico antes de cerrar, tope duro MAX_MENSAJES).
  // Va sin cache_control: es distinto en cada turno, pero es una sola línea.
  const contextoTurno =
    `Este turno sería el número ${messages.length + 1} de la conversación ` +
    `(tope duro: ${MAX_MENSAJES} mensajes en total). ` +
    (ampliado
      ? `Esta es la llamada AMPLIADA para el cierre: tenés hasta ${tope} secciones y la conversación COMPLETA.`
      : `Esta es la llamada NORMAL de cada turno: tenés hasta ${tope} secciones y los últimos mensajes.`);
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
        max_tokens: ampliado ? 1200 : 600,
        thinking: { type: 'disabled' },
        tools: [construirRouterTool(tope)],
        tool_choice: { type: 'tool', name: 'seleccionar_contenido' },
        system: [
          { type: 'text', text: PROMPT_ROUTER },
          { type: 'text', text: anclasTexto },
          { type: 'text', text: indiceTexto, cache_control: { type: 'ephemeral', ttl: '1h' } },
          { type: 'text', text: contextoTurno },
        ],
        messages: mensajesParaRouter,
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

// Palabras que aparecen en decenas o cientos de títulos (el nombre de la
// materia se repite en cada capítulo, "síntesis para estructurar la
// respuesta de examen" cierra casi todos los capítulos, etc.) -- si se
// dejaran competir como palabra clave, matchearían casi cualquier turno y
// diluirían la selección con secciones irrelevantes elegidas por azar de
// orden. Medido contando frecuencia real sobre los 269 títulos del índice.
const PALABRAS_CLAVE_GENERICAS = new Set([
  'responsabilidad', 'contractual', 'extracontractual', 'precontractual',
  'introduccion', 'sintesis', 'estructurar', 'respuesta', 'concepto',
  'analisis', 'contrato', 'posicion', 'requisitos', 'generales', 'doctrina',
  'causales',
]);

// Devuelve dos listas separadas por precisión, en vez de una sola: las
// coincidencias por número de artículo son mucho más confiables que las de
// palabra clave (que pueden matchear por una palabra genérica que aparece
// en decenas de títulos) -- elegirContenidoDelTurno las prioriza en ese
// orden al armar la selección final, para que un match genérico nunca le
// gane el lugar a uno preciso si hay que recortar por el tope.
//
// `mensajesAEscanear`: en un turno normal, los últimos 2 mensajes; en la
// llamada ampliada del cierre, la conversación completa.
// `indiceCandidato`: el índice completo, o el recortado a una sola materia
// cuando la sesión es de una sola materia (o la ampliada busca por
// separado en cada una, ver unirConTopePorMateria).
function redDeSeguridadPorPalabraClave(mensajesAEscanear, indiceCandidato) {
  const textoReciente = mensajesAEscanear.map((m) => m.content || '').join('\n');
  const normalReciente = normalizarTexto(textoReciente);
  const numeros = extraerNumerosDeArticulo(textoReciente);
  const porArticulo = [];
  const porPalabraClave = [];

  for (const entrada of indiceCandidato) {
    const tituloCompletoNormal = normalizarTexto(`${entrada.h1} ${entrada.h2}`);
    let coincideArticulo = false;
    for (const n of numeros) {
      if (new RegExp(`\\bart\\w*\\.?\\s*${n}\\b`).test(tituloCompletoNormal)) {
        coincideArticulo = true;
        break;
      }
    }
    if (coincideArticulo) {
      porArticulo.push(entrada.id);
      continue;
    }

    // Solo el título de la sección (h2), no el del capítulo (h1) -- el h1
    // repite el nombre de la materia en cada una de sus secciones. Exige
    // 2 palabras clave distintas y no genéricas para reducir falsos
    // positivos de una sola palabra suelta.
    const palabrasDelTitulo = new Set(
      normalizarTexto(entrada.h2)
        .split(/[^a-z0-9]+/)
        .filter((p) => p.length >= 8 && !PALABRAS_CLAVE_GENERICAS.has(p))
    );
    const coincidencias = [...palabrasDelTitulo].filter((p) => normalReciente.includes(p));
    if (coincidencias.length >= 2) {
      porPalabraClave.push(entrada.id);
    }
  }

  return { porArticulo, porPalabraClave };
}

function construirBloqueExtractos(ids, encabezado) {
  const partes = ids
    .map((id) => INDICE_POR_ID.get(id))
    .filter(Boolean)
    .map((entrada) => `----- ${entrada.materia} > ${entrada.h1} > ${entrada.h2} -----\n${CHUNKS_MANUALES[entrada.id]}`);
  const titulo = encabezado || '===== EXTRACTOS DEL MANUAL PARA ESTE TURNO =====';
  return (
    `${titulo}\n` +
    '(Selección automática de secciones relevantes -- NO es el manual íntegro. ' +
    'Si necesitas un pasaje que no aparece acá, no lo inventes: dilo con naturalidad ' +
    'y sigue con lo que sí puedes verificar.)\n\n' +
    partes.join('\n\n')
  );
}

const ENCABEZADO_EXTRACTOS_AMPLIOS =
  '===== EXTRACTOS AMPLIOS PARA EL CIERRE DE LA INTERROGACIÓN =====';

function textoRespaldoPorMateria(materiaSlug) {
  const texto = CONTENIDO_MANUALES.porMateria[materiaSlug];
  if (!texto) return CONTENIDO_MANUALES.completo;
  return (
    `===== MANUAL COMPLETO (respaldo -- así que en este turno SÍ tienes el manual ` +
    `completo de esta materia, no un extracto): ${materiaSlug.toUpperCase()} =====\n\n` +
    texto
  );
}

// Reparte el tope entre las 3 materias (ej. 8/8/8 con tope=24) al armar la
// selección ampliada del cierre en modo "todas": si se llenara en el orden
// en que aparecen las listas (router primero, luego artículo, luego
// palabra clave) sin repartir, los matches de una sola materia podrían
// agotar el tope antes de llegar a las otras dos -- justo en el caso que
// esta selección ampliada existe para cubrir.
function unirConTopePorMateria(listasDeIds, tope) {
  const slugs = Object.keys(ETIQUETA_POR_MATERIA);
  const topePorMateria = Math.floor(tope / slugs.length);
  const contadores = Object.fromEntries(slugs.map((s) => [s, 0]));
  const vistos = new Set();
  const resultado = [];
  const sobrantes = [];

  // Primera pasada: reparto por materia (garantiza que ninguna quede sin
  // cupo por el orden del índice). Lo que no entra por haber llenado su
  // cupo va a "sobrantes", sin perderse.
  for (const lista of listasDeIds) {
    for (const id of lista) {
      if (vistos.has(id)) continue;
      const entrada = INDICE_POR_ID.get(id);
      if (!entrada) continue;
      const slug = MATERIA_POR_ETIQUETA[entrada.materia];
      if (contadores[slug] >= topePorMateria) {
        sobrantes.push(id);
        continue;
      }
      vistos.add(id);
      contadores[slug]++;
      resultado.push(id);
    }
  }

  // Segunda pasada: si el reparto por materia dejó cupo global sin usar
  // (p. ej. una materia no tenía tantos candidatos como su cuota), se
  // llena con lo que quedó afuera, respetando el orden de prioridad
  // original en vez de descartarlo.
  for (const id of sobrantes) {
    if (resultado.length >= tope) break;
    if (vistos.has(id)) continue;
    vistos.add(id);
    resultado.push(id);
  }

  return resultado;
}

// Respaldo del cierre (anuncio de fin + EVALUACIÓN FINAL, la corrección más
// importante del producto para la alumna). Manual completo solo cuando de
// verdad hace falta, no como comportamiento automático:
// - Sesión de una sola materia: directo el manual completo de ESA materia
//   (nunca las otras dos) -- ya acota el costo a un tercio, sin necesitar
//   ningún mecanismo nuevo.
// - Sesión "todas las materias": primero se intenta una selección más
//   ancha de secciones (llamada "ampliada" al router, conversación
//   completa, hasta ROUTER_MAX_CHUNKS_AMPLIO secciones) -- y solo si eso
//   falla o el router de verdad no le alcanza, se cae a los 3 manuales
//   completos. Ahí sí está justificado: se tocaron las 3 materias a
//   propósito (modo pensado para 1-2 veces por semana, no todos los días).
async function respaldoDeCierre(messages, materiaSesion) {
  if (materiaSesion !== 'todas') {
    return textoRespaldoPorMateria(materiaSesion);
  }

  try {
    const eleccionAmplia = await llamarRouter(messages, materiaSesion, { ampliado: true });
    const idsDelRouter = Array.isArray(eleccionAmplia.chunk_ids)
      ? eleccionAmplia.chunk_ids.filter((id) => INDICE_POR_ID.has(id))
      : [];
    const { porArticulo, porPalabraClave } = redDeSeguridadPorPalabraClave(messages, INDICE_MANUALES);
    const idsFinal = unirConTopePorMateria([idsDelRouter, porArticulo, porPalabraClave], ROUTER_MAX_CHUNKS_AMPLIO);

    if (!eleccionAmplia.no_estoy_seguro && idsFinal.length > 0) {
      return construirBloqueExtractos(idsFinal, ENCABEZADO_EXTRACTOS_AMPLIOS);
    }
    // El router marcó que ni con la selección ancha le alcanza -- último
    // recurso, aceptado como costo justificado para este modo.
  } catch (e) {
    console.error('Selección ampliada del cierre falló, cae a los 3 manuales completos:', e);
  }
  return CONTENIDO_MANUALES.completo;
}

// Punto de entrada: decide qué bloque de manual va en el system prompt de
// la llamada principal de este turno. Nunca lanza -- cualquier falla cae a
// un respaldo razonable (nunca a "sin manual").
async function elegirContenidoDelTurno(messages, materiaSesion, duracionMinutos) {
  // Respaldo mecánico: a partir de este largo de conversación, ni siquiera
  // se llama al router de turno -- se asume que el cierre puede ser en
  // cualquier momento y se va directo al respaldo de cierre. No depende de
  // que el router lo detecte bien (ver UMBRAL_CIERRE_POR_DURACION).
  const umbralCierre = UMBRAL_CIERRE_POR_DURACION[duracionMinutos] || UMBRAL_MENSAJES_CIERRE_FORZADO;
  if (messages.length >= umbralCierre) {
    return respaldoDeCierre(messages, materiaSesion);
  }

  const indiceCandidato = materiaSesion === 'todas' ? INDICE_MANUALES : INDICE_POR_MATERIA[materiaSesion];

  try {
    const eleccion = await llamarRouter(messages, materiaSesion);

    // El cierre corrige y cita texto de TODA la sesión, no de un subtema
    // puntual: ahí no vale la pena fraccionar por turno, se pasa al
    // respaldo de cierre (ver más arriba).
    if (eleccion.es_cierre) {
      return respaldoDeCierre(messages, materiaSesion);
    }

    const idsDelRouter = Array.isArray(eleccion.chunk_ids)
      ? eleccion.chunk_ids.filter((id) => INDICE_POR_ID.has(id))
      : [];
    const { porArticulo, porPalabraClave } = redDeSeguridadPorPalabraClave(messages.slice(-2), indiceCandidato);

    // Orden de prioridad si hay que recortar por el tope: primero lo que
    // eligió el router, después los matches por número de artículo (muy
    // precisos), al final los matches por palabra clave (más ruidosos) --
    // así un match genérico nunca le gana el lugar a uno preciso.
    const idsFinal = [];
    for (const id of [...idsDelRouter, ...porArticulo, ...porPalabraClave]) {
      if (!idsFinal.includes(id)) idsFinal.push(id);
      if (idsFinal.length >= ROUTER_MAX_CHUNKS) break;
    }

    if (eleccion.no_estoy_seguro || idsFinal.length === 0) {
      return textoRespaldoPorMateria(materiaSesion !== 'todas' ? materiaSesion : eleccion.materia_respaldo);
    }
    return construirBloqueExtractos(idsFinal);
  } catch (e) {
    console.error('Fraccionamiento del turno falló, cae a respaldo:', e);
    return materiaSesion !== 'todas' ? textoRespaldoPorMateria(materiaSesion) : CONTENIDO_MANUALES.completo;
  }
}

const UUID_RE = /^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/i;
// Tope diario de interrogaciones completas por alumna, durante la beta.
// Se cuenta por sessionId (no por mensaje ni por confiar en el cliente):
// ver chequearYRegistrarSesion. Un sessionId ya registrado HOY nunca vuelve
// a descontar cupo (es la misma interrogación continuando); uno nuevo sí, y
// solo pasa si todavía queda cupo — sin importar qué mande el cliente en
// `messages`, así que reintentar o armar el request a mano no lo saltea.
// Regla (pedida por Laura, 2026-08-07): 2 interrogaciones al día en total,
// de las cuales como máximo 1 puede ser examen (el modo caro, en Opus). Así
// nunca se gastan las 2 en examen el mismo día, y siempre queda al menos
// una vía (práctica) disponible.
const DIARIO_LIMITE = 2;
const DIARIO_LIMITE_EXAMEN = 1;
const MENSAJE_TOPE_DIARIO =
  'Has alcanzado tu límite de interrogaciones diarias de la Beta. Se repondrán mañana a las 00:00 hrs.';
const MENSAJE_TOPE_EXAMEN =
  'Ya hiciste tu examen de hoy. Todavía te queda una interrogación de práctica disponible. Se repondrán mañana a las 00:00 hrs.';

const SUPABASE_URL = 'https://byyukzhxhtopojgvgglp.supabase.co';
const MATERIAS_MUESTRA = Object.values(ETIQUETA_POR_MATERIA);
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
// Retorna { ok: true } si hay cupo (y ya deja la sesión registrada), o
// { ok: false, motivo: 'total' | 'examen' } si no.
async function chequearYRegistrarSesion(userId, sessionId, modo) {
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
    return { ok: true };
  }

  const contadorResp = await fetch(
    `${SUPABASE_URL}/rest/v1/interrogaciones_diarias?user_id=eq.${userId}&fecha=eq.${hoy}&select=modo`,
    { headers }
  );
  if (!contadorResp.ok) {
    throw new Error(`Supabase respondió ${contadorResp.status} al contar el tope diario`);
  }
  const filasHoy = await contadorResp.json();
  if (filasHoy.length >= DIARIO_LIMITE) {
    return { ok: false, motivo: 'total' };
  }
  if (modo === 'examen' && filasHoy.filter((f) => f.modo === 'examen').length >= DIARIO_LIMITE_EXAMEN) {
    return { ok: false, motivo: 'examen' };
  }

  const insertResp = await fetch(`${SUPABASE_URL}/rest/v1/interrogaciones_diarias`, {
    method: 'POST',
    headers: { ...headers, Prefer: 'return=minimal' },
    body: JSON.stringify({ user_id: userId, session_id: sessionId, fecha: hoy, modo }),
  });
  // 409 = ya la insertó una petición en paralelo (misma alumna, dos pestañas a la vez);
  // en ese caso ya quedó contada, así que se deja pasar igual.
  if (!insertResp.ok && insertResp.status !== 409) {
    throw new Error(`Supabase respondió ${insertResp.status} al registrar la interrogación`);
  }
  return { ok: true };
}

async function obtenerMuestraPreguntas(sessionId, materiaSesion) {
  const materias = materiaSesion === 'todas' ? MATERIAS_MUESTRA : [ETIQUETA_POR_MATERIA[materiaSesion]];
  const filtro = materias.map((m) => `"${m}"`).join(',');
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
  for (const materia of materias) {
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

  const { messages, modo, sessionId, materia, duracionMinutos } = req.body || {};

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
  if (materia !== undefined && !MATERIAS_VALIDAS.has(materia)) {
    res.status(400).json({ error: 'Materia inválida' });
    return;
  }
  if (duracionMinutos !== undefined && !DURACIONES_VALIDAS.has(duracionMinutos)) {
    res.status(400).json({ error: 'Duración inválida' });
    return;
  }
  // Clientes viejos que todavía no mandan `materia` siguen viendo el
  // comportamiento de siempre (las 3 materias, modo transversal).
  const materiaSesion = MATERIAS_VALIDAS.has(materia) ? materia : 'todas';
  // Clientes viejos que todavía no mandan `duracionMinutos` siguen viendo
  // el comportamiento de siempre (la interrogación extensa de ~30 min).
  const duracionSesion = DURACIONES_VALIDAS.has(duracionMinutos) ? duracionMinutos : 30;
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

  // Clientes viejos que todavía no mandan `modo` cuentan como examen, mismo
  // default que usa CONFIG_MODO más abajo.
  const modoSesion = MODOS_VALIDOS.has(modo) ? modo : 'examen';

  let resultadoCupo;
  try {
    resultadoCupo = await chequearYRegistrarSesion(usuario.id, sessionId, modoSesion);
  } catch (e) {
    console.error('Error chequeando el tope diario:', e);
    res.status(502).json({ error: 'No se pudo verificar tu cupo diario en este momento' });
    return;
  }
  if (!resultadoCupo.ok) {
    const mensaje = resultadoCupo.motivo === 'examen' ? MENSAJE_TOPE_EXAMEN : MENSAJE_TOPE_DIARIO;
    res.status(429).json({ error: mensaje });
    return;
  }

  let muestraPreguntas;
  try {
    muestraPreguntas = await obtenerMuestraPreguntas(sessionId, materiaSesion);
  } catch (e) {
    console.error('Error trayendo la muestra de preguntas:', e);
    res.status(502).json({ error: 'No se pudo preparar la interrogación en este momento' });
    return;
  }

  // Fraccionamiento por turno: nunca lanza, ver elegirContenidoDelTurno.
  const contenidoDelTurno = await elegirContenidoDelTurno(messages, materiaSesion, duracionSesion);

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
          { type: 'text', text: construirPromptExaminador(materiaSesion, duracionSesion) },
          { type: 'text', text: CONTENIDO_CODIGO },
          // ttl 1h (no el default de 5 min): las respuestas de examen son de
          // análisis completo, tardan minutos en escribirse -- con 5 min el
          // caché caduca entre preguntas y se vuelve a pagar el precio
          // completo de este bloque en cada turno. Este es el ÚLTIMO bloque
          // cacheado (cachea todo el prefijo: reglas + código + muestra) --
          // el bloque de extractos que sigue cambia turno a turno, así que
          // va sin cache_control, pero como ahora es chico (unos pocos
          // miles de tokens, no los ~279K de los 3 manuales enteros) pagarlo
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
