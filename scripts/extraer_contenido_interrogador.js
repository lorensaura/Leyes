#!/usr/bin/env node
// Extrae el texto plano de los manuales de Responsabilidad Contractual y
// Extracontractual y genera api/_interrogador-contenido.js (un módulo JS que
// exporta el texto), para que el Interrogador IA lo use como contexto de
// grounding en el system prompt.
//
// Se corre automáticamente en cada deploy de Vercel (ver "buildCommand" en
// vercel.json) — no depende de que alguien se acuerde de correrlo a mano.
// También se puede correr manualmente en desarrollo:
//     node scripts/extraer_contenido_interrogador.js

const fs = require('fs');
const path = require('path');

const ROOT = path.resolve(__dirname, '..');

const FUENTES = [
  ['Responsabilidad Contractual', path.join(ROOT, '01_Responsabilidad_Contractual_Manual.html')],
  ['Responsabilidad Extracontractual', path.join(ROOT, '02_Responsabilidad_Extracontractual_Manual.html')],
];

const SALIDA = path.join(ROOT, 'api', '_interrogador-contenido.js');

const ENTIDADES_NOMBRADAS = {
  amp: '&', lt: '<', gt: '>', quot: '"', apos: "'", nbsp: ' ',
};

function decodificarEntidades(texto) {
  return texto.replace(/&(#x?[0-9a-fA-F]+|[a-zA-Z]+);/g, (match, cuerpo) => {
    if (cuerpo[0] === '#') {
      const esHex = cuerpo[1] === 'x' || cuerpo[1] === 'X';
      const codigo = parseInt(cuerpo.slice(esHex ? 2 : 1), esHex ? 16 : 10);
      return Number.isNaN(codigo) ? match : String.fromCodePoint(codigo);
    }
    return ENTIDADES_NOMBRADAS[cuerpo] !== undefined ? ENTIDADES_NOMBRADAS[cuerpo] : match;
  });
}

function htmlATexto(marcado) {
  // Saca <style>...</style> y <script>...</script> completos (con su contenido)
  marcado = marcado.replace(/<style[^>]*>[\s\S]*?<\/style>/gi, '');
  marcado = marcado.replace(/<script[^>]*>[\s\S]*?<\/script>/gi, '');

  // Solo el <body> si existe
  const cuerpo = marcado.match(/<body[^>]*>([\s\S]*)<\/body>/i);
  if (cuerpo) marcado = cuerpo[1];

  // Saltos de línea antes de bloques para no pegar palabras entre etiquetas
  marcado = marcado.replace(/<(h1|h2|h3|h4|p|li|div|tr|blockquote|br)[^>]*>/gi, '\n');

  // Saca cualquier otra etiqueta
  marcado = marcado.replace(/<[^>]+>/g, '');

  // Decodifica entidades HTML (&aacute;, &amp;, etc.)
  let texto = decodificarEntidades(marcado);

  // Colapsa espacios y líneas en blanco repetidas
  texto = texto.replace(/[ \t]+/g, ' ');
  texto = texto.replace(/\n[ \t]+/g, '\n');
  texto = texto.replace(/\n{3,}/g, '\n\n');

  return texto.trim();
}

function main() {
  const partes = [];
  for (const [titulo, ruta] of FUENTES) {
    if (!fs.existsSync(ruta)) {
      console.error(`No encontré el manual: ${ruta}`);
      process.exit(1);
    }
    const crudo = fs.readFileSync(ruta, 'utf-8');
    const texto = htmlATexto(crudo);
    partes.push(`===== MANUAL: ${titulo.toUpperCase()} =====\n\n${texto}`);
  }

  const contenidoFinal = partes.join('\n\n\n');

  // Backtick, backslash y ${...} deben escaparse dentro de un template
  // literal de JS para no romper la sintaxis del archivo generado.
  const escapado = contenidoFinal
    .replace(/\\/g, '\\\\')
    .replace(/`/g, '\\`')
    .replace(/\$\{/g, '\\${');

  fs.mkdirSync(path.dirname(SALIDA), { recursive: true });
  fs.writeFileSync(
    SALIDA,
    '// Generado automáticamente por scripts/extraer_contenido_interrogador.js\n' +
      '// No editar a mano — se regenera solo en cada deploy de Vercel (ver vercel.json).\n' +
      `module.exports = \`${escapado}\`;\n`,
    'utf-8'
  );

  console.log(
    `OK: ${path.relative(ROOT, SALIDA)} (${contenidoFinal.length.toLocaleString('es-CL')} caracteres, ~${Math.floor(contenidoFinal.length / 4).toLocaleString('es-CL')} tokens aprox.)`
  );
}

main();
