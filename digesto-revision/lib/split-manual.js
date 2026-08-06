const fs = require('fs');
const path = require('path');
const pdfParse = require('pdf-parse');

// Adjust this if your manual's headings use a different pattern.
// Default matches lines like: "A. Concepto de responsabilidad..." / "Eje B:" / "C -"
const EJE_HEADING_REGEX = /^\s*(?:Eje\s+)?([A-Y])[\.\-:)]\s+(.+)$/gm;

async function loadAllPdfText(dirPath) {
  if (!fs.existsSync(dirPath)) {
    console.warn(`⚠️  Directorio no encontrado: ${dirPath}`);
    return '';
  }
  const files = fs.readdirSync(dirPath).filter(f => f.endsWith('.pdf'));
  let combined = '';
  for (const file of files) {
    const buffer = fs.readFileSync(path.join(dirPath, file));
    const data = await pdfParse(buffer);
    console.log(`  📄 ${file}: ${data.numpages} páginas, ${data.text.length} caracteres`);
    combined += '\n' + data.text;
  }
  return combined;
}

// Matches a PDF filename to one of the 3 Digesto bases. Check the longer,
// more specific names first so "Extracontractual" doesn't match "contractual".
function detectBaseFromFilename(filename) {
  const lower = filename.toLowerCase();
  if (lower.includes('extracontractual')) return 'extracontractual';
  if (lower.includes('precontractual')) return 'precontractual';
  if (lower.includes('contractual')) return 'contractual';
  return null;
}

// Loads PDFs keeping each manual tied to its own base — Contractual,
// Extracontractual, and Precontractual each have their own independent
// A–Y scheme, so they must never be merged into one blob before splitting.
async function loadManualsByBase(dirPath) {
  const result = {};
  if (!fs.existsSync(dirPath)) {
    console.warn(`⚠️  Directorio no encontrado: ${dirPath}`);
    return result;
  }
  const files = fs.readdirSync(dirPath).filter(f => f.endsWith('.pdf'));
  for (const file of files) {
    const baseName = detectBaseFromFilename(file);
    if (!baseName) {
      console.warn(`⚠️  No pude asociar "${file}" a contractual/extracontractual/precontractual — se omite.`);
      continue;
    }
    const buffer = fs.readFileSync(path.join(dirPath, file));
    const data = await pdfParse(buffer);
    console.log(`  📄 ${file} → base "${baseName}": ${data.numpages} páginas, ${data.text.length} caracteres`);
    result[baseName] = (result[baseName] || '') + '\n' + data.text;
  }
  return result;
}

// Splits manual text into { letter, title, content } chunks by detected eje headings.
// Returns them in document order. If no headings are detected, returns a single
// chunk with letter 'TODO' so callers can fall back gracefully — but this should
// be treated as a signal to fix EJE_HEADING_REGEX, not run as-is.
// Table-of-contents entries produce short "chunks" using the same letters as
// the real chapters that follow them later in the document. Anything shorter
// than this is treated as a TOC line, not a chapter, and discarded.
const MIN_EJE_CONTENT_CHARS = 800;

function splitIntoEjes(fullText) {
  const matches = [...fullText.matchAll(EJE_HEADING_REGEX)];

  if (matches.length === 0) {
    console.warn('⚠️  No se detectaron encabezados de eje con el patrón actual.');
    console.warn('    Ajusta EJE_HEADING_REGEX en lib/split-manual.js para que coincida con tu manual.');
    return [{ letter: 'TODO', title: '(sin dividir)', content: fullText }];
  }

  const rawChunks = [];
  for (let i = 0; i < matches.length; i++) {
    const start = matches[i].index;
    const end = i + 1 < matches.length ? matches[i + 1].index : fullText.length;
    rawChunks.push({
      letter: matches[i][1],
      title: matches[i][2].trim().slice(0, 80),
      content: fullText.slice(start, end).trim(),
    });
  }

  // Keep the longest chunk per letter (the real chapter), drop the rest (TOC lines).
  const byLetter = {};
  for (const chunk of rawChunks) {
    if (chunk.content.length < MIN_EJE_CONTENT_CHARS) continue;
    if (!byLetter[chunk.letter] || chunk.content.length > byLetter[chunk.letter].content.length) {
      byLetter[chunk.letter] = chunk;
    }
  }

  const ejes = Object.values(byLetter).sort((a, b) => a.letter.localeCompare(b.letter));
  if (ejes.length === 0) {
    console.warn(`⚠️  Todos los chunks quedaron bajo ${MIN_EJE_CONTENT_CHARS} caracteres — revisa MIN_EJE_CONTENT_CHARS.`);
    return [{ letter: 'TODO', title: '(sin dividir)', content: fullText }];
  }
  return ejes;
}

module.exports = { loadAllPdfText, loadManualsByBase, detectBaseFromFilename, splitIntoEjes, EJE_HEADING_REGEX };
