#!/usr/bin/env node
// Extrae el texto plano de los manuales de Responsabilidad (Contractual,
// Extracontractual, Precontractual) y genera los módulos que usa el
// Interrogador IA como contexto de grounding:
//   - api/_interrogador-contenido.js: texto completo (respaldo de
//     seguridad, ver api/interrogador.js) — el manual entero, completo y
//     también partido por materia.
//   - api/_interrogador-chunks.js: el mismo contenido trozado en secciones
//     (por cada título/subtítulo real de los manuales), para que en cada
//     turno el Interrogador cargue solo lo relevante en vez del manual
//     entero (ver docs/interrogador.md, sección "Grounding").
//   - api/_interrogador-indice.js: índice liviano (solo títulos, sin
//     cuerpo) de esas secciones, para la llamada chica que decide qué
//     cargar en cada turno.
//
// Se corre automáticamente en cada deploy de Vercel (ver "buildCommand" en
// vercel.json) — no depende de que alguien se acuerde de correrlo a mano.
// También se puede correr manualmente en desarrollo:
//     node scripts/extraer_contenido_interrogador.js

const fs = require('fs');
const path = require('path');

const ROOT = path.resolve(__dirname, '..');

const FUENTES = [
  { slug: 'contractual', materia: 'Responsabilidad contractual', archivo: '01_Responsabilidad_Contractual_Manual.html' },
  { slug: 'extracontractual', materia: 'Responsabilidad extracontractual', archivo: '02_Responsabilidad_Extracontractual_Manual.html' },
  { slug: 'precontractual', materia: 'Responsabilidad precontractual', archivo: '03_Responsabilidad_Precontractual_Manual.html' },
];

const SALIDA_CONTENIDO = path.join(ROOT, 'api', '_interrogador-contenido.js');
const SALIDA_CHUNKS = path.join(ROOT, 'api', '_interrogador-chunks.js');
const SALIDA_INDICE = path.join(ROOT, 'api', '_interrogador-indice.js');

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

// Saca <style>/<script> completos y se queda solo con el <body> si existe.
// Deja el resto del marcado intacto (tags incluidos) -- lo usan tanto
// htmlATexto (manual completo) como trocearManual (por secciones).
function extraerCuerpo(marcado) {
  marcado = marcado.replace(/<style[^>]*>[\s\S]*?<\/style>/gi, '');
  marcado = marcado.replace(/<script[^>]*>[\s\S]*?<\/script>/gi, '');
  const cuerpo = marcado.match(/<body[^>]*>([\s\S]*)<\/body>/i);
  return cuerpo ? cuerpo[1] : marcado;
}

// Limpieza genérica: saltos de línea antes de bloques, saca tags, decodifica
// entidades, colapsa espacios. No toca h1/h2 -- cada llamador decide qué
// hacer con esos dos niveles (htmlATexto los convierte en salto de línea
// más, trocearManual los usa como límites de sección antes de llegar acá).
function limpiarBloque(marcado) {
  marcado = marcado.replace(/<(h3|h4|p|li|div|tr|blockquote|br)[^>]*>/gi, '\n');
  marcado = marcado.replace(/<[^>]+>/g, '');
  let texto = decodificarEntidades(marcado);
  texto = texto.replace(/[ \t]+/g, ' ');
  texto = texto.replace(/\n[ \t]+/g, '\n');
  texto = texto.replace(/\n{3,}/g, '\n\n');
  return texto.trim();
}

function htmlATexto(marcado) {
  const cuerpo = extraerCuerpo(marcado);
  const conH1H2ComoSalto = cuerpo.replace(/<h[12][^>]*>/gi, '\n');
  return limpiarBloque(conH1H2ComoSalto);
}

function limpiarTitulo(marcadoTitulo) {
  return limpiarBloque(marcadoTitulo).replace(/\s*\n\s*/g, ' ').trim();
}

// La mayoría de los h1 de los manuales ya vienen numerados "A. ...", "B. ..."
// -- se usa esa letra para el ID. Si algún h1 no trae letra (no debería
// pasar hoy, pero no hay que confiar en que siga siendo así para siempre),
// se cae a A, B, C... según el orden de aparición.
function letraDesdeTitulo(titulo, indiceH1) {
  const m = titulo.match(/^([A-Z])\.\s*/);
  return m ? m[1] : String.fromCharCode(65 + indiceH1);
}

// Trocea un manual en secciones por cada h1/h2 real del HTML fuente. Cada
// h2 (con cualquier h3/h4 anidado, que queda como parte de su texto) es una
// sección propia; el texto de un h1 ANTES de su primer h2 (si tiene
// contenido real, no solo un párrafo de transición) también se guarda como
// una sección "(introducción)" de ese capítulo -- si no, se perdería.
//
// No se puede confiar en los `id` que ya traen los <h1>/<h2> del HTML: al
// verificar los 3 manuales fuente, solo 01_Contractual tiene `id` en sus
// h2 -- 02_Extracontractual y 03_Precontractual no tienen ninguno. Por eso
// acá se generan IDs propios, estables solo dentro de un mismo build (no
// hace falta que sobrevivan entre deploys: el navegador nunca los ve ni los
// reenvía, el router los recalcula cada turno contra el índice del build
// actual).
function trocearManual(marcadoCrudo, slug, materia) {
  const cuerpo = extraerCuerpo(marcadoCrudo);
  const re = /<h([12])\b[^>]*>([\s\S]*?)<\/h\1>/gi;
  const encabezados = [];
  let m;
  while ((m = re.exec(cuerpo)) !== null) {
    encabezados.push({ nivel: Number(m[1]), tituloCrudo: m[2], finTitulo: re.lastIndex, inicio: m.index });
  }

  const chunks = [];
  const indice = [];
  let h1Actual = null;
  let contadorH1 = -1;
  let contadorH2 = 0;

  for (let i = 0; i < encabezados.length; i++) {
    const enc = encabezados[i];
    const finSeccion = i + 1 < encabezados.length ? encabezados[i + 1].inicio : cuerpo.length;
    const textoSeccion = limpiarBloque(cuerpo.slice(enc.finTitulo, finSeccion));
    const titulo = limpiarTitulo(enc.tituloCrudo);

    if (enc.nivel === 1) {
      contadorH1++;
      contadorH2 = 0;
      const letra = letraDesdeTitulo(titulo, contadorH1);
      h1Actual = { letra, titulo };
      if (textoSeccion.length > 40) {
        const id = `${slug}-${letra}-0`;
        chunks.push([id, `${titulo}\n\n${textoSeccion}`]);
        indice.push({ id, materia, h1: titulo, h2: '(introducción)' });
      }
    } else {
      if (!h1Actual) {
        contadorH1++;
        h1Actual = { letra: String.fromCharCode(65 + contadorH1), titulo: '(sin título de capítulo)' };
        contadorH2 = 0;
      }
      contadorH2++;
      const id = `${slug}-${h1Actual.letra}-${contadorH2}`;
      chunks.push([id, `${h1Actual.titulo}\n${titulo}\n\n${textoSeccion}`]);
      indice.push({ id, materia, h1: h1Actual.titulo, h2: titulo });
    }
  }

  return { chunks, indice };
}

function escribirModulo(ruta, valor, comentario) {
  fs.mkdirSync(path.dirname(ruta), { recursive: true });
  fs.writeFileSync(
    ruta,
    '// Generado automáticamente por scripts/extraer_contenido_interrogador.js\n' +
      `// No editar a mano -- se regenera solo en cada deploy de Vercel (ver vercel.json).\n` +
      (comentario ? `// ${comentario}\n` : '') +
      `module.exports = ${JSON.stringify(valor, null, 2)};\n`,
    'utf-8'
  );
}

function aproxTokens(texto) {
  return Math.floor(texto.length / 4);
}

function main() {
  const porMateria = {};
  const completoPartes = [];
  const todosLosChunks = {};
  const indiceCompleto = [];

  for (const { slug, materia, archivo } of FUENTES) {
    const ruta = path.join(ROOT, archivo);
    if (!fs.existsSync(ruta)) {
      console.error(`No encontré el manual: ${ruta}`);
      process.exit(1);
    }
    const crudo = fs.readFileSync(ruta, 'utf-8');

    const textoCompleto = htmlATexto(crudo);
    porMateria[slug] = textoCompleto;
    completoPartes.push(`===== MANUAL: ${materia.toUpperCase()} =====\n\n${textoCompleto}`);

    const { chunks, indice } = trocearManual(crudo, slug, materia);
    for (const [id, texto] of chunks) todosLosChunks[id] = texto;
    indiceCompleto.push(...indice);

    console.log(
      `  ${materia}: ${chunks.length} secciones, ~${aproxTokens(textoCompleto).toLocaleString('es-CL')} tokens`
    );
  }

  escribirModulo(
    SALIDA_CONTENIDO,
    { completo: completoPartes.join('\n\n\n'), porMateria },
    'Respaldo de seguridad del Interrogador: se usa solo si el fraccionamiento por turno falla o no está seguro (ver api/interrogador.js).'
  );
  escribirModulo(
    SALIDA_CHUNKS,
    todosLosChunks,
    'Mapa { id: texto } de cada sección de los manuales, para cargar solo lo relevante por turno (ver api/interrogador.js).'
  );
  escribirModulo(
    SALIDA_INDICE,
    indiceCompleto,
    'Índice liviano (solo títulos) de las secciones de _interrogador-chunks.js, para la llamada chica que decide qué cargar en cada turno.'
  );

  const totalTokensCompleto = Object.values(porMateria).reduce((acc, t) => acc + aproxTokens(t), 0);
  const totalTokensIndice = aproxTokens(JSON.stringify(indiceCompleto));
  console.log(
    `OK: ${indiceCompleto.length} secciones en total. Manuales completos (respaldo): ~${totalTokensCompleto.toLocaleString('es-CL')} tokens. Índice: ~${totalTokensIndice.toLocaleString('es-CL')} tokens.`
  );
}

main();
