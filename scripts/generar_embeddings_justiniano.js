#!/usr/bin/env node
// Genera (o regenera) los embeddings de las secciones de los manuales para
// JustinIAno, el chat de dudas de materia dentro de Práctica (ver
// docs/interrogador.md, sección "Justiniano: persona unificadora").
//
// Lee las secciones ya trozadas por scripts/extraer_contenido_interrogador.js
// (api/_interrogador-chunks.js + api/_interrogador-indice.js), le pide a
// Voyage AI (voyage-3, 1024 dimensiones, input_type "document") la huella
// numérica de cada una, y las guarda en la tabla justiniano_secciones de
// Supabase (esquema en scripts/supabase_schema.sql).
//
// Reemplaza (delete + insert) toda la materia en cada corrida, nunca upsert
// solo -- si el manual cambió, los ids de sección pueden haberse reordenado
// (ver comentario en trocearManual de extraer_contenido_interrogador.js) y no
// queremos filas viejas huérfanas quedando en la tabla.
//
// Uso:
//   node scripts/extraer_contenido_interrogador.js     (primero: actualiza los chunks)
//   node scripts/generar_embeddings_justiniano.js       (las 3 materias)
//   node scripts/generar_embeddings_justiniano.js extracontractual   (solo una)
//
// Requiere VOYAGE_API_KEY y SUPABASE_SECRET_KEY en .env.

const fs = require('fs');
const path = require('path');

const ROOT = path.resolve(__dirname, '..');
const ENV_FILE = path.join(ROOT, '.env');

function cargarEnv() {
  const valores = {};
  if (fs.existsSync(ENV_FILE)) {
    for (const linea of fs.readFileSync(ENV_FILE, 'utf-8').split('\n')) {
      const limpia = linea.trim();
      if (limpia && !limpia.startsWith('#') && limpia.includes('=')) {
        const idx = limpia.indexOf('=');
        valores[limpia.slice(0, idx).trim()] = limpia.slice(idx + 1).trim();
      }
    }
  }
  for (const k of ['VOYAGE_API_KEY', 'SUPABASE_SECRET_KEY']) {
    if (process.env[k]) valores[k] = process.env[k];
  }
  const faltan = ['VOYAGE_API_KEY', 'SUPABASE_SECRET_KEY'].filter((k) => !valores[k]);
  if (faltan.length) {
    console.error(`Falta(n) en .env: ${faltan.join(', ')}`);
    process.exit(1);
  }
  return valores;
}

const ENV = cargarEnv();

const SUPABASE_URL = 'https://byyukzhxhtopojgvgglp.supabase.co';
const VOYAGE_URL = 'https://api.voyageai.com/v1/embeddings';
const MODELO_EMBEDDING = 'voyage-3';

const MATERIA_SLUG = {
  'Responsabilidad contractual': 'contractual',
  'Responsabilidad extracontractual': 'extracontractual',
  'Responsabilidad precontractual': 'precontractual',
};

const LOTE_INSERT = 50; // filas por POST a Supabase

// Sin tarjeta cargada, Voyage limita a 10.000 "palabras" (tokens) por minuto
// además de 3 solicitudes por minuto -- las secciones de Contractual son más
// largas en promedio, así que un lote de tamaño fijo por cantidad de
// secciones se pasaba de esa cuota. Se arma cada lote por presupuesto de
// tokens (aproximado por caracteres/4, igual que aproxTokens() en
// extraer_contenido_interrogador.js), con margen bajo el límite real.
const PRESUPUESTO_TOKENS_POR_LOTE = 7000;

function aproxTokens(texto) {
  return Math.ceil(texto.length / 4);
}

function enLotesPorTokens(secciones, textoPorSeccion) {
  const lotes = [];
  let loteActual = [];
  let tokensLoteActual = 0;
  for (const s of secciones) {
    const tokens = aproxTokens(textoPorSeccion(s));
    if (loteActual.length > 0 && tokensLoteActual + tokens > PRESUPUESTO_TOKENS_POR_LOTE) {
      lotes.push(loteActual);
      loteActual = [];
      tokensLoteActual = 0;
    }
    loteActual.push(s);
    tokensLoteActual += tokens;
  }
  if (loteActual.length > 0) lotes.push(loteActual);
  return lotes;
}

const chunks = require(path.join(ROOT, 'api', '_interrogador-chunks.js'));
const indice = require(path.join(ROOT, 'api', '_interrogador-indice.js'));

function enLotes(arr, tam) {
  const lotes = [];
  for (let i = 0; i < arr.length; i += tam) lotes.push(arr.slice(i, i + tam));
  return lotes;
}

// Sin tarjeta cargada en Voyage el límite es 3 solicitudes/minuto (ver
// docs/interrogador.md o el error 429 que devuelve Voyage si se supera).
// Se espera este intervalo ANTES de cada llamada, y se reintenta con espera
// más larga si aun así llega un 429 -- así el script corre solo sin que
// haga falta cargar tarjeta. Cuando Laura la cargue, bajar/sacar esta espera.
const ESPERA_ENTRE_LLAMADAS_MS = 21000;

function esperar(ms) {
  return new Promise((resolve) => setTimeout(resolve, ms));
}

async function embeberLote(textos, intento = 1) {
  await esperar(ESPERA_ENTRE_LLAMADAS_MS);

  let resp;
  try {
    resp = await fetch(VOYAGE_URL, {
      method: 'POST',
      headers: {
        Authorization: `Bearer ${ENV.VOYAGE_API_KEY}`,
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({ model: MODELO_EMBEDDING, input: textos, input_type: 'document' }),
    });
  } catch (e) {
    // Corte de red transitorio (timeout, DNS, conexión reiniciada) -- no es
    // un error de Voyage, se reintenta igual que un 429.
    if (intento <= 4) {
      const esperaExtra = ESPERA_ENTRE_LLAMADAS_MS * intento;
      console.log(`\n  (corte de red, reintento ${intento} en ${Math.round(esperaExtra / 1000)}s...)`);
      await esperar(esperaExtra);
      return embeberLote(textos, intento + 1);
    }
    throw e;
  }

  if (resp.status === 429 && intento <= 4) {
    const esperaExtra = ESPERA_ENTRE_LLAMADAS_MS * intento;
    console.log(`\n  (límite de velocidad, reintento ${intento} en ${Math.round(esperaExtra / 1000)}s...)`);
    await esperar(esperaExtra);
    return embeberLote(textos, intento + 1);
  }
  if (!resp.ok) throw new Error(`Voyage ${resp.status}: ${await resp.text()}`);
  const data = await resp.json();
  return data.data.map((d) => d.embedding);
}

// Reintenta cortes de red transitorios (no errores HTTP de Supabase, esos se
// tiran directo) -- se vieron varios durante el desarrollo, ver historial.
async function fetchConReintento(url, opciones, intento = 1) {
  try {
    return await fetch(url, opciones);
  } catch (e) {
    if (intento <= 3) {
      const espera = 5000 * intento;
      console.log(`\n  (corte de red con Supabase, reintento ${intento} en ${Math.round(espera / 1000)}s...)`);
      await esperar(espera);
      return fetchConReintento(url, opciones, intento + 1);
    }
    throw e;
  }
}

async function borrarMateria(slug) {
  const resp = await fetchConReintento(`${SUPABASE_URL}/rest/v1/justiniano_secciones?materia=eq.${slug}`, {
    method: 'DELETE',
    headers: {
      apikey: ENV.SUPABASE_SECRET_KEY,
      Authorization: `Bearer ${ENV.SUPABASE_SECRET_KEY}`,
    },
  });
  if (!resp.ok) throw new Error(`Supabase delete ${resp.status}: ${await resp.text()}`);
}

async function insertarFilas(filas) {
  const resp = await fetchConReintento(`${SUPABASE_URL}/rest/v1/justiniano_secciones`, {
    method: 'POST',
    headers: {
      apikey: ENV.SUPABASE_SECRET_KEY,
      Authorization: `Bearer ${ENV.SUPABASE_SECRET_KEY}`,
      'Content-Type': 'application/json',
      Prefer: 'return=minimal',
    },
    body: JSON.stringify(filas),
  });
  if (!resp.ok) throw new Error(`Supabase insert ${resp.status}: ${await resp.text()}`);
}

async function procesarMateria(materiaCompleta, slug) {
  const secciones = indice.filter((s) => s.materia === materiaCompleta);
  if (secciones.length === 0) {
    console.log(`  ${materiaCompleta}: sin secciones en el índice, se salta.`);
    return;
  }

  const textoPorSeccion = (s) => `${s.h1} - ${s.h2}\n\n${chunks[s.id]}`;
  const lotesDeEmbedding = enLotesPorTokens(secciones, textoPorSeccion);
  console.log(
    `  ${materiaCompleta}: ${secciones.length} secciones en ${lotesDeEmbedding.length} lotes -- pidiendo embeddings a Voyage...`
  );
  const filas = [];
  for (const lote of lotesDeEmbedding) {
    const textos = lote.map(textoPorSeccion);
    const embeddings = await embeberLote(textos);
    lote.forEach((s, i) => {
      filas.push({
        id: s.id,
        materia: slug,
        h1: s.h1,
        h2: s.h2,
        texto: chunks[s.id],
        embedding: embeddings[i],
      });
    });
    process.stdout.write('.');
  }
  console.log('');

  console.log(`  ${materiaCompleta}: borrando filas viejas de Supabase...`);
  await borrarMateria(slug);

  console.log(`  ${materiaCompleta}: insertando ${filas.length} filas nuevas...`);
  for (const lote of enLotes(filas, LOTE_INSERT)) {
    await insertarFilas(lote);
  }

  console.log(`  ${materiaCompleta}: OK.`);
}

async function main() {
  const filtroSlug = process.argv[2];
  const materias = Object.entries(MATERIA_SLUG).filter(
    ([, slug]) => !filtroSlug || slug === filtroSlug
  );
  if (materias.length === 0) {
    console.error(`Materia desconocida: "${filtroSlug}". Usar contractual, extracontractual o precontractual.`);
    process.exit(1);
  }

  for (const [materiaCompleta, slug] of materias) {
    await procesarMateria(materiaCompleta, slug);
  }

  console.log('Listo.');
}

main().catch((err) => {
  console.error(err);
  process.exit(1);
});
