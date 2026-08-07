#!/usr/bin/env node
// Run estimate-cost.js FIRST. This script makes real, billed API calls.
//
// Strategy: for each eje temático, send that eje's manual chunk ONCE, plus a
// batch of every question tagged with that eje across all 6 question tables
// (Justificación, detección de error, aplicación, discriminación MC,
// Preguntas_Evaluación, Flashcards). Claude returns one verdict per question
// in a single response, instead of re-sending the manual per question.
//
// UPDATED: Now skips questions that already have Revision_status set,
// so re-runs don't waste API calls on already-validated questions.

const path = require('path');
const Anthropic = require('@anthropic-ai/sdk');
const { loadManualsByBase, splitIntoEjes } = require('./lib/split-manual');

const anthropic = new Anthropic({ apiKey: process.env.ANTHROPIC_API_KEY });
const MODEL = 'claude-sonnet-5';

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

// Columns that live directly on each question-type table (not a separate table).
const STATUS_FIELD = process.env.REVISION_STATUS_FIELD || 'Revision_status'; // multi-select: Revisar / Verificado
const NOTES_FIELD = process.env.REVISION_NOTES_FIELD || 'Revision_notes';
const STATUS_VALUE_FLAG = 'Revisar';
const STATUS_VALUE_OK = 'Verificado';

const BATCH_SIZE = 12;

async function fetchTemasMap(baseId) {
  // 'tema' on question tables is a LINKED RECORD to the Temas table, so the API
  // returns record IDs, not readable text. Temas itself has a clean 'numero'
  // column, so resolve through that instead of guessing at the linked field.
  const map = {};
  let offset;
  do {
    const url = new URL(`https://api.airtable.com/v0/${baseId}/Temas`);
    url.searchParams.set('pageSize', '100');
    if (offset) url.searchParams.set('offset', offset);
    const res = await fetch(url, { headers: { Authorization: `Bearer ${AIRTABLE_TOKEN}` } });
    if (!res.ok) {
      console.error(`  ⚠️  No pude leer la tabla Temas: ${res.status} ${res.statusText}`);
      return map;
    }
    const data = await res.json();
    for (const rec of data.records) {
      if (rec.fields.numero !== undefined) map[rec.id] = rec.fields.numero;
    }
    offset = data.offset;
  } while (offset);
  return map;
}

async function buildIdToEjeMap(baseId, temasMap, ejes) {
  // Preguntas_Evaluacion's own 'tema' link is unpopulated, but its 'id' field
  // reuses the exact same IDs as the other 5 tables — so borrow their
  // already-resolved eje via that shared id instead of guessing.
  const map = {};
  const sourceTypes = QUESTION_TYPES.filter(t => t !== 'Preguntas_Evaluacion');
  for (const type of sourceTypes) {
    let records = [];
    let offset;
    do {
      const url = new URL(`https://api.airtable.com/v0/${baseId}/${encodeURIComponent(type)}`);
      url.searchParams.set('pageSize', '100');
      if (offset) url.searchParams.set('offset', offset);
      const res = await fetch(url, { headers: { Authorization: `Bearer ${AIRTABLE_TOKEN}` } });
      if (!res.ok) continue;
      const data = await res.json();
      records.push(...data.records);
      offset = data.offset;
    } while (offset);

    for (const r of records) {
      const linked = r.fields.tema;
      const idField = r.fields.id;
      if (!idField || !Array.isArray(linked) || linked.length === 0) continue;
      const numero = temasMap[linked[0]];
      if (numero !== undefined) map[idField] = Number(numero);
    }
  }
  return map;
}

function hasStatus(question) {
  // Returns true if the question already has a Revision_status value set.
  const status = question.fields[STATUS_FIELD];
  if (Array.isArray(status)) {
    return status.length > 0; // multi-select with at least one value
  }
  return !!status; // single-select or plain value
}

async function fetchQuestionsForEje(baseId, tableName, matchNumero, temasMap, idToEjeMap) {
  let records = [];
  let offset;
  do {
    const url = new URL(`https://api.airtable.com/v0/${baseId}/${encodeURIComponent(tableName)}`);
    url.searchParams.set('pageSize', '100');
    if (offset) url.searchParams.set('offset', offset);
    const res = await fetch(url, { headers: { Authorization: `Bearer ${AIRTABLE_TOKEN}` } });
    if (!res.ok) {
      console.error(`  ⚠️  Error leyendo ${tableName}: ${res.statusText}`);
      return [];
    }
    const data = await res.json();
    records.push(...data.records);
    offset = data.offset;
  } while (offset);

  function resolveNumero(r) {
    const linked = r.fields.tema;
    if (Array.isArray(linked) && linked.length > 0) {
      const numero = temasMap[linked[0]];
      if (numero !== undefined) return Number(numero);
    }
    const temaTexto = (r.fields.tema_texto || '').toString().trim();
    const m = temaTexto.match(/^(\d+)\./);
    if (m) return Number(m[1]);
    if (idToEjeMap && r.fields.id && idToEjeMap[r.fields.id] !== undefined) {
      return idToEjeMap[r.fields.id];
    }
    return null;
  }

  return records
    .map(r => ({ ...r, _table: tableName, _numero: resolveNumero(r) }))
    .filter(r => r._numero !== null && matchNumero(r._numero));
}

const tableFieldTypes = {}; // tableName -> 'multipleSelects' | 'singleSelect' | other

async function preflightCheckFields(baseId, tableName) {
  const url = `https://api.airtable.com/v0/meta/bases/${baseId}/tables`;
  const res = await fetch(url, { headers: { Authorization: `Bearer ${AIRTABLE_TOKEN}` } });
  if (!res.ok) {
    console.warn(`  ⚠️  No pude verificar el schema (${res.status}). Requiere scope schema.bases:read en tu token.`);
    return true;
  }
  const data = await res.json();
  const table = data.tables.find(t => t.name === tableName);
  if (!table) {
    console.error(`  ❌ Tabla "${tableName}" no encontrada en la base.`);
    return false;
  }
  const fieldNames = table.fields.map(f => f.name);
  const missing = [STATUS_FIELD, NOTES_FIELD].filter(f => !fieldNames.includes(f));
  if (missing.length) {
    console.error(`  ❌ Faltan campos en "${tableName}": ${missing.join(', ')}`);
    console.error(`     Créalos manualmente en Airtable antes de correr esto (Airtable no los crea via API).`);
    return false;
  }
  const statusField = table.fields.find(f => f.name === STATUS_FIELD);
  tableFieldTypes[tableName] = statusField?.type || 'unknown';
  return true;
}

async function updateRecord(baseId, tableName, recordId, status, notes) {
  const url = `https://api.airtable.com/v0/${baseId}/${encodeURIComponent(tableName)}/${recordId}`;
  const fieldType = tableFieldTypes[tableName];
  // multipleSelects wants an array; singleSelect (and most others) want a plain string.
  const statusValue = fieldType === 'multipleSelects' ? [status] : status;
  const res = await fetch(url, {
    method: 'PATCH',
    headers: { Authorization: `Bearer ${AIRTABLE_TOKEN}`, 'Content-Type': 'application/json' },
    body: JSON.stringify({
      fields: { [STATUS_FIELD]: statusValue, [NOTES_FIELD]: notes },
      typecast: true,
    }),
  });
  if (!res.ok) {
    const body = await res.text();
    console.error(`    ⚠️  Falló update de ${recordId}: ${res.status} ${body.slice(0, 200)}`);
    return false;
  }
  return true;
}

// Different table types use different fields (confirmed from your Airtable screenshots):
// Justificación/Detección de error/Aplicación: enunciado + respuesta_modelo + elementos_clave
// Discriminación MC: opcion_a..d + rationale_a..d + correcta (no respuesta_modelo)
// Flashcards: pregunta + respuesta (no caso/elementos_clave/articulos_referencia)
// Preguntas_Evaluacion: mixed/rollup, uses tema_texto + tipo + materia
// Rather than hardcode per table, only include fields that are actually present.
const DISPLAY_FIELDS = [
  ['tema_texto', 'Tema'], ['tema', 'Tema'], ['subtema', 'Subtema'], ['tipo', 'Tipo'],
  ['caso', 'Caso'], ['enunciado', 'Enunciado'], ['pregunta', 'Pregunta'],
  ['respuesta_modelo', 'Respuesta modelo'], ['respuesta', 'Respuesta'],
  ['elementos_clave', 'Elementos clave'],
  ['opcion_a', 'Opción A'], ['rationale_a', 'Rationale A'],
  ['opcion_b', 'Opción B'], ['rationale_b', 'Rationale B'],
  ['opcion_c', 'Opción C'], ['rationale_c', 'Rationale C'],
  ['opcion_d', 'Opción D'], ['rationale_d', 'Rationale D'],
  ['correcta', 'Correcta'],
  ['articulos_referencia', 'Artículos referencia'],
];

function formatQuestion(q, index) {
  const lines = [`--- PREGUNTA ${index + 1} (tabla: ${q._table}, id: ${q.id}) ---`];
  for (const [field, label] of DISPLAY_FIELDS) {
    const val = q.fields[field];
    if (val !== undefined && val !== null && val !== '') {
      lines.push(`${label}: ${Array.isArray(val) ? val.join(', ') : val}`);
    }
  }
  return lines.join('\n');
}

async function reviseBatch(ejeChunk, questions) {
  const questionsBlock = questions.map((q, i) => formatQuestion(q, i)).join('\n\n');

  const prompt = `Eres revisor experto en derecho civil chileno, especialista en exámenes de grado.

=== MANUAL DE ESTUDIO — EJE ${ejeChunk.letter}: ${ejeChunk.title} ===
${ejeChunk.content}

=== PREGUNTAS A VALIDAR CONTRA ESTE EJE ===
${questionsBlock}

Para cada pregunta, verifica: doctrina correcta según el manual, artículos bien citados,
sin jurisprudencia inventada, enunciado claro, nivel grado, consistencia interna.

IMPORTANTE sobre el eje: algunas preguntas pueden estar etiquetadas con un eje que no
corresponde a su contenido real (un problema de clasificación en Airtable, no de fondo).
NO marques [REVISAR] solo porque el contenido no coincide con el Eje ${ejeChunk.letter}
PERO sí pertenece a responsabilidad contractual/extracontractual/precontractual en general.
Evalúa el contenido de la pregunta con tu propio conocimiento del derecho civil chileno
en ese caso.

IMPORTANTE sobre el alcance de la materia: SÍ marca [REVISAR] cuando la pregunta trata
una materia que NO pertenece a este apunte en absoluto — por ejemplo, temas de teoría
general del contrato (efecto relativo de los contratos, interpretación contractual y
buena fe, formación del consentimiento, requisitos de existencia y validez del acto
jurídico) NO son responsabilidad contractual/extracontractual/precontractual, aunque
compartan vocabulario similar. En esos casos usa notes para indicar específicamente que
la materia corresponde a otra área (ej. "Corresponde a teoría general del contrato, no a
responsabilidad — efecto relativo del contrato").

Marca [REVISAR] cuando haya: doctrina incorrecta, artículo mal citado, jurisprudencia
inventada, ambigüedad genuina, nivel inapropiado, O materia fuera del alcance de este
apunte según lo anterior.

Responde ÚNICAMENTE un array JSON, un objeto por pregunta, en este formato exacto:
[{"id": "<record id>", "status": "VERIFICADO"}, {"id": "<record id>", "status": "REVISAR", "notes": "<problema específico, breve>"}]

Sin texto fuera del JSON.`;

  const message = await anthropic.messages.create({
    model: MODEL,
    max_tokens: 8000,
    messages: [{ role: 'user', content: prompt }],
  });

  const textBlock = message.content.find(b => b.type === 'text');
  const raw = textBlock ? textBlock.text : '[]';
  if (!textBlock) {
    console.error(`    ⚠️  Sin bloque de texto — stop_reason: ${message.stop_reason}, bloques: ${message.content.map(b => b.type).join(', ') || '(vacío)'}`);
  }
  try {
    const cleaned = raw.replace(/```json|```/g, '').trim();
    const parsed = JSON.parse(cleaned);
    if (!Array.isArray(parsed) || parsed.length === 0) {
      console.error(`    ⚠️  Claude devolvió un array vacío o inválido para ${questions.length} preguntas. Respuesta cruda: ${raw.slice(0, 300)}`);
    }
    return parsed;
  } catch (e) {
    console.error(`    ⚠️  No pude parsear la respuesta como JSON: ${raw.slice(0, 300)}`);
    return questions.map(q => ({ id: q.id, status: 'REVISAR', notes: 'Respuesta del modelo no parseable — revisar manualmente' }));
  }
}

async function main() {
  console.log('🚀 Digesto — revisión por eje (Sonnet 5) — CON SKIP DE YA REVISADAS\n');

  const manualPath = path.join(process.env.HOME, 'Desktop/DERECHO LIBRE/Derecho Libre/app/pdf');
  const manualsByBase = await loadManualsByBase(manualPath);

  for (const [baseName, baseId] of Object.entries(BASES)) {
    if (!baseId) continue;
    if (process.env.ONLY_BASE && baseName !== process.env.ONLY_BASE) continue;
    console.log(`\n🔍 Base: ${baseName}`);
    console.log('='.repeat(50));

    const manualText = manualsByBase[baseName];
    if (!manualText) {
      console.error(`  ❌ No encontré el PDF del manual para "${baseName}" — se omite.`);
      continue;
    }
    const ejes = splitIntoEjes(manualText);
    if (ejes.length === 1 && ejes[0].letter === 'TODO') {
      console.error(`  🛑 El manual de "${baseName}" no se pudo fragmentar por eje. Corre`);
      console.error('     estimate-cost.js y ajusta el patrón de encabezados antes de seguir.');
      continue;
    }
    console.log(`  📖 ${ejes.length} ejes detectados para ${baseName}.`);

    const temasMap = await fetchTemasMap(baseId);
    console.log(`  📋 Temas cargados: ${Object.keys(temasMap).length} registros con número.`);

    const idToEjeMap = await buildIdToEjeMap(baseId, temasMap, ejes);
    console.log(`  🔗 Mapa id→eje (para Preguntas_Evaluacion) construido: ${Object.keys(idToEjeMap).length} ids.`);

    let allFieldsOk = true;
    for (const type of QUESTION_TYPES) {
      const ok = await preflightCheckFields(baseId, type);
      allFieldsOk = allFieldsOk && ok;
    }
    if (!allFieldsOk) {
      console.error(`\n❌ Saltando base "${baseName}" — corrige los campos faltantes arriba y vuelve a correr.\n`);
      continue;
    }

    let totalVerificado = 0, totalRevisar = 0;
    let totalSkipped = 0; // Track how many we skipped
    const matchedIds = new Set(); // track which records got matched to *some* eje

    for (let ejeIndex = 0; ejeIndex < ejes.length; ejeIndex++) {
      const eje = ejes[ejeIndex];
      const ejeNumber = ejeIndex + 1;
      console.log(`\n  Eje ${eje.letter} (nº ${ejeNumber}): ${eje.title}`);

      let ejeQuestions = [];
      for (const type of QUESTION_TYPES) {
        const matches = await fetchQuestionsForEje(baseId, type, n => n === ejeNumber, temasMap, idToEjeMap);
        ejeQuestions.push(...matches);
      }

      // FILTER: Skip questions that already have Revision_status set
      const questionsToReview = ejeQuestions.filter(q => !hasStatus(q));
      const skippedInThisEje = ejeQuestions.length - questionsToReview.length;
      totalSkipped += skippedInThisEje;

      questionsToReview.forEach(q => matchedIds.add(`${q._table}:${q.id}`));
      ejeQuestions.forEach(q => matchedIds.add(`${q._table}:${q.id}`)); // Mark all as matched, even skipped

      if (questionsToReview.length === 0) {
        if (skippedInThisEje > 0) {
          console.log(`     ${ejeQuestions.length} preguntas — todas ya revisadas, saltando`);
        } else {
          console.log(`     (sin preguntas asociadas a este eje — revisa el mapeo Tema↔eje si esperabas encontrar algo)`);
        }
        continue;
      }
      console.log(`     ${questionsToReview.length} preguntas a revisar (${skippedInThisEje} ya revisadas, saltadas)`);

      for (let i = 0; i < questionsToReview.length; i += BATCH_SIZE) {
        const batch = questionsToReview.slice(i, i + BATCH_SIZE);
        console.log(`     Enviando lote ${Math.floor(i / BATCH_SIZE) + 1} (${batch.length} preguntas) a Claude...`);
        const results = await reviseBatch(eje, batch);
        console.log(`     Respuesta recibida, actualizando Airtable...`);

        for (const r of results) {
          const q = batch.find(b => b.id === r.id);
          if (!q) continue;
          const status = r.status === 'VERIFICADO' ? STATUS_VALUE_OK : STATUS_VALUE_FLAG;
          const notes = r.notes || '';
          await updateRecord(baseId, q._table, q.id, status, notes);
          if (status === STATUS_VALUE_OK) totalVerificado++; else totalRevisar++;
        }
        console.log(`     ✓ Lote completo: ${results.filter(r => r.status === 'VERIFICADO').length} verificadas, ${results.filter(r => r.status !== 'VERIFICADO').length} a revisar`);
        await new Promise(res => setTimeout(res, 300));
      }
    }

    // Extra pass: Temas whose numero exceeds the manual's detected chapter
    // count (e.g. Contractual has 20 temas but only 8 manual chapters) have
    // no safe fragment to use — give them the full manual instead of guessing.
    const maxNumero = Math.max(0, ...Object.values(temasMap).map(Number));
    if (maxNumero > ejes.length) {
      console.log(`\n  Temas ${ejes.length + 1}–${maxNumero} (fuera de los ${ejes.length} capítulos detectados en el manual):`);
      let extraQuestions = [];
      for (const type of QUESTION_TYPES) {
        const matches = await fetchQuestionsForEje(baseId, type, n => n > ejes.length, temasMap, idToEjeMap);
        extraQuestions.push(...matches);
      }

      // FILTER: Skip already-reviewed in extra pass too
      const extraToReview = extraQuestions.filter(q => !hasStatus(q));
      const skippedExtra = extraQuestions.length - extraToReview.length;
      totalSkipped += skippedExtra;

      extraToReview.forEach(q => matchedIds.add(`${q._table}:${q.id}`));
      extraQuestions.forEach(q => matchedIds.add(`${q._table}:${q.id}`));

      if (extraToReview.length > 0) {
        console.log(`     ${extraToReview.length} preguntas a revisar${skippedExtra > 0 ? ` (${skippedExtra} ya revisadas, saltadas)` : ''} (usando el manual completo como contexto)`);
        const fullManualChunk = { letter: '*', title: 'Manual completo', content: manualText };
        for (let i = 0; i < extraToReview.length; i += BATCH_SIZE) {
          const batch = extraToReview.slice(i, i + BATCH_SIZE);
          console.log(`     Enviando lote ${Math.floor(i / BATCH_SIZE) + 1} (${batch.length} preguntas) a Claude...`);
          const results = await reviseBatch(fullManualChunk, batch);
          console.log(`     Respuesta recibida, actualizando Airtable...`);
          for (const r of results) {
            const q = batch.find(b => b.id === r.id);
            if (!q) continue;
            const status = r.status === 'VERIFICADO' ? STATUS_VALUE_OK : STATUS_VALUE_FLAG;
            await updateRecord(baseId, q._table, q.id, status, r.notes || '');
            if (status === STATUS_VALUE_OK) totalVerificado++; else totalRevisar++;
          }
          await new Promise(res => setTimeout(res, 300));
        }
      } else if (skippedExtra > 0) {
        console.log(`     ${extraQuestions.length} preguntas — todas ya revisadas, saltando`);
      }
    }

    console.log(`\n  📊 Resumen ${baseName}: ✅ ${totalVerificado} verificadas · ⚠️ ${totalRevisar} a revisar`);

    // Final catch-all: anything still unmatched by this point (no tema link,
    // no tema_texto, no id match elsewhere) gets reviewed anyway using the
    // full manual — guarantees no question is silently skipped.
    console.log(`\n  🧹 Buscando preguntas aún sin resolver (pase final)...`);
    let leftovers = [];
    for (const type of QUESTION_TYPES) {
      let records = [];
      let offset;
      do {
        const url = new URL(`https://api.airtable.com/v0/${baseId}/${encodeURIComponent(type)}`);
        url.searchParams.set('pageSize', '100');
        if (offset) url.searchParams.set('offset', offset);
        const res = await fetch(url, { headers: { Authorization: `Bearer ${AIRTABLE_TOKEN}` } });
        if (!res.ok) continue;
        const data = await res.json();
        records.push(...data.records);
        offset = data.offset;
      } while (offset);
      const unmatched = records.filter(r => !matchedIds.has(`${type}:${r.id}`));
      leftovers.push(...unmatched.map(r => ({ ...r, _table: type })));
    }

    // FILTER: Skip already-reviewed in catch-all too
    const leftoversToReview = leftovers.filter(q => !hasStatus(q));
    const skippedCatchAll = leftovers.length - leftoversToReview.length;
    totalSkipped += skippedCatchAll;

    if (leftoversToReview.length > 0) {
      console.log(`     ${leftoversToReview.length} preguntas sin resolver${skippedCatchAll > 0 ? ` (${skippedCatchAll} ya revisadas, saltadas)` : ''} — revisando con el manual completo como contexto`);
      const fullManualChunk = { letter: '*', title: 'Manual completo', content: manualText };
      for (let i = 0; i < leftoversToReview.length; i += BATCH_SIZE) {
        const batch = leftoversToReview.slice(i, i + BATCH_SIZE);
        console.log(`     Enviando lote ${Math.floor(i / BATCH_SIZE) + 1} (${batch.length} preguntas) a Claude...`);
        const results = await reviseBatch(fullManualChunk, batch);
        console.log(`     Respuesta recibida, actualizando Airtable...`);
        for (const r of results) {
          const q = batch.find(b => b.id === r.id);
          if (!q) continue;
          const status = r.status === 'VERIFICADO' ? STATUS_VALUE_OK : STATUS_VALUE_FLAG;
          await updateRecord(baseId, q._table, q.id, status, r.notes || '');
          matchedIds.add(`${q._table}:${q.id}`);
          if (status === STATUS_VALUE_OK) totalVerificado++; else totalRevisar++;
        }
        await new Promise(res => setTimeout(res, 300));
      }
      console.log(`  📊 Resumen final ${baseName}: ✅ ${totalVerificado} verificadas · ⚠️ ${totalRevisar} a revisar`);
    } else {
      if (skippedCatchAll > 0) {
        console.log(`     Ninguna sin resolver (${skippedCatchAll} ya revisadas en el pase final).`);
      } else {
        console.log(`     Ninguna — cobertura completa.`);
      }
    }

    console.log(`\n  ⏭️  Total saltadas (ya revisadas): ${totalSkipped} preguntas`);
  }

  console.log('\n✨ Listo. Filtra Airtable por "Revisar" para ver qué necesita tu revisión manual.');
}

main().catch(err => {
  console.error('Fatal error:', err);
  process.exit(1);
});
