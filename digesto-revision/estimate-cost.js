#!/usr/bin/env node
// Run this FIRST. It makes zero Claude API calls — it only reads your PDFs and
// counts your Airtable records, then projects cost for the real run.
//
// Usage: node estimate-cost.js

const path = require('path');
const { loadManualsByBase, splitIntoEjes } = require('./lib/split-manual');

const AIRTABLE_TOKEN = process.env.AIRTABLE_TOKEN;
const BASES = {
  contractual: process.env.AIRTABLE_BASE_CONTRACTUAL,
  extracontractual: process.env.AIRTABLE_BASE_EXTRACONTRACTUAL,
  precontractual: process.env.AIRTABLE_BASE_PRECONTRACTUAL,
};
const QUESTION_TYPES = [
  'Justificación', 'Detección de error', 'Aplicación',
  'Discriminación MC', 'Preguntas_Evaluacion', 'Flashcards',
];

// Sonnet 5 intro pricing, verified against Anthropic's pricing page as of
// early Aug 2026. Confirm at anthropic.com/pricing before trusting this for
// a large run — the intro rate expires Aug 31, 2026.
const PRICE_PER_M_INPUT = 2.00;
const PRICE_PER_M_OUTPUT = 10.00;
const CHARS_PER_TOKEN = 4; // rough approximation, English/Spanish prose

async function fetchRecordCount(baseId, tableName) {
  // Only fetches record IDs + the Tema field — not full content — to keep this cheap.
  let count = 0;
  let ejeCounts = {};
  let offset;
  do {
    const url = new URL(`https://api.airtable.com/v0/${baseId}/${encodeURIComponent(tableName)}`);
    url.searchParams.set('pageSize', '100');
    if (offset) url.searchParams.set('offset', offset);
    const res = await fetch(url, { headers: { Authorization: `Bearer ${AIRTABLE_TOKEN}` } });
    if (!res.ok) {
      const body = await res.text();
      console.error(`  ⚠️  Error leyendo ${tableName}: ${res.status} — ${body.slice(0, 300)}`);
      return { count: 0, ejeCounts: {} };
    }
    const data = await res.json();
    for (const rec of data.records) {
      count++;
      const tema = (rec.fields.tema_texto || rec.fields.tema || 'SIN_TEMA').toString().trim();
      ejeCounts[tema] = (ejeCounts[tema] || 0) + 1;
    }
    offset = data.offset;
  } while (offset);
  return { count, ejeCounts };
}

async function main() {
  console.log('📊 ESTIMACIÓN DE COSTO — sin llamadas a la API de Claude\n');

  console.log('📚 Leyendo manuales (uno por base)...');
  const manualPath = path.join(process.env.HOME, 'Desktop/DERECHO LIBRE/Derecho Libre/app/pdf');
  const manualsByBase = await loadManualsByBase(manualPath);

  const AVG_CHARS_PER_QUESTION = 600;
  const BATCH_SIZE = 20;

  let grandTotalInputTokens = 0;
  let grandTotalOutputTokens = 0;
  let grandTotalQuestions = 0;

  for (const [baseName, baseId] of Object.entries(BASES)) {
    console.log(`\n${'='.repeat(60)}\nBASE: ${baseName}\n${'='.repeat(60)}`);

    const manualText = manualsByBase[baseName];
    if (!manualText) {
      console.warn(`⚠️  No se encontró un PDF de manual para "${baseName}" — se omite esta base.`);
      continue;
    }
    const ejes = splitIntoEjes(manualText);
    console.log(`📖 Ejes detectados: ${ejes.length}`);
    for (const eje of ejes) {
      console.log(`   ${eje.letter}: "${eje.title}" — ${eje.content.length} caracteres`);
    }
    if (ejes.length === 1 && ejes[0].letter === 'TODO') {
      console.log('🛑 No se pudo fragmentar este manual por eje — no continúes con el script real');
      console.log('   hasta ajustar el patrón de encabezados.');
      continue;
    }

    if (!baseId) {
      console.warn(`⚠️  AIRTABLE_BASE_${baseName.toUpperCase()} no configurado — no puedo contar preguntas reales.`);
      console.warn(`   Revisa tu .env y que hayas corrido "export $(cat .env | xargs)" en esta sesión.`);
      continue;
    }

    console.log(`\n🔢 Contando preguntas por tabla...`);
    let baseTotalQuestions = 0;
    for (const type of QUESTION_TYPES) {
      const { count } = await fetchRecordCount(baseId, type);
      console.log(`  ${type}: ${count} preguntas`);
      baseTotalQuestions += count;
    }
    console.log(`  Total ${baseName}: ${baseTotalQuestions} preguntas`);
    grandTotalQuestions += baseTotalQuestions;

    // Cost model: manual chunk sent ONCE per batch of ~20 questions, not per question.
    const numBatches = Math.ceil(baseTotalQuestions / BATCH_SIZE);
    const avgEjeChunkChars = ejes.reduce((sum, e) => sum + e.content.length, 0) / ejes.length;
    const inputCharsPerBatch = avgEjeChunkChars + (BATCH_SIZE * AVG_CHARS_PER_QUESTION) + 1500;
    const outputCharsPerBatch = BATCH_SIZE * 150;

    const inputTokens = (numBatches * inputCharsPerBatch) / CHARS_PER_TOKEN;
    const outputTokens = (numBatches * outputCharsPerBatch) / CHARS_PER_TOKEN;
    grandTotalInputTokens += inputTokens;
    grandTotalOutputTokens += outputTokens;

    const inputCost = (inputTokens / 1_000_000) * PRICE_PER_M_INPUT;
    const outputCost = (outputTokens / 1_000_000) * PRICE_PER_M_OUTPUT;
    console.log(`\n💰 Costo estimado para ${baseName}: ~$${(inputCost + outputCost).toFixed(2)} (${numBatches} llamadas)`);
  }

  const grandInputCost = (grandTotalInputTokens / 1_000_000) * PRICE_PER_M_INPUT;
  const grandOutputCost = (grandTotalOutputTokens / 1_000_000) * PRICE_PER_M_OUTPUT;

  console.log(`\n${'='.repeat(60)}`);
  console.log(`TOTAL — las 3 bases`);
  console.log('='.repeat(60));
  console.log(`   Preguntas: ${grandTotalQuestions}`);
  console.log(`   COSTO TOTAL ESTIMADO: $${(grandInputCost + grandOutputCost).toFixed(2)}`);
  console.log('='.repeat(60));

  console.log('\n⚠️  Esto es una aproximación (chars/4 como proxy de tokens, tamaño de');
  console.log('   pregunta promediado). Trátalo como orden de magnitud, no cifra exacta.');
  console.log('   Verifica también el precio vigente en anthropic.com/pricing — la tarifa');
  console.log('   promocional de Sonnet 5 ($2/$10) vence el 31 de agosto de 2026.\n');

  console.log('👉 Si el número de ejes detectados arriba no coincide con tus 25 ejes reales,');
  console.log('   NO corras el script principal todavía — ajusta EJE_HEADING_REGEX primero.');
}

main().catch(err => {
  console.error('Error:', err);
  process.exit(1);
});
