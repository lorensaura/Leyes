#!/usr/bin/env node
// Agrega anclas invisibles (<span id="...">) antes de cada h1/h2 de los 3
// manuales fuente, con el MISMO id que calcula trocearManual() en
// scripts/extraer_contenido_interrogador.js para cada sección -- así
// JustinIAno puede enlazar directo a la sección exacta del manual
// (manuales.html#<id>) sin depender de los ids "s1"/"eje1" que ya existen
// (esos siguen igual, los usa app/manuales.html para insertar los
// checkpoints -- este script nunca los toca).
//
// Es seguro correrlo de nuevo (idempotente): si una sección ya tiene su
// ancla, no la duplica.
//
// Uso: node scripts/agregar_anclas_manuales.js

const fs = require('fs');
const path = require('path');

const ROOT = path.resolve(__dirname, '..');

const FUENTES = [
  { slug: 'contractual', archivo: '01_Responsabilidad_Contractual_Manual.html' },
  { slug: 'extracontractual', archivo: '02_Responsabilidad_Extracontractual_Manual.html' },
  { slug: 'precontractual', archivo: '03_Responsabilidad_Precontractual_Manual.html' },
];

// --- misma lógica que extraer_contenido_interrogador.js (no se puede reusar
// directo porque ese script exporta módulos generados, no funciones) ---

function limpiarBloque(marcado) {
  marcado = marcado.replace(/<(h3|h4|p|li|div|tr|blockquote|br)[^>]*>/gi, '\n');
  marcado = marcado.replace(/<[^>]+>/g, '');
  let texto = marcado.replace(/&(#x?[0-9a-fA-F]+|[a-zA-Z]+);/g, (m) => m); // no hace falta decodificar para medir longitud
  texto = texto.replace(/[ \t]+/g, ' ');
  texto = texto.replace(/\n[ \t]+/g, '\n');
  texto = texto.replace(/\n{3,}/g, '\n\n');
  return texto.trim();
}

function limpiarTitulo(marcadoTitulo) {
  return limpiarBloque(marcadoTitulo).replace(/\s*\n\s*/g, ' ').trim();
}

function letraDesdeTitulo(titulo, indiceH1) {
  const m = titulo.match(/^([A-Z])\.\s*/);
  return m ? m[1] : String.fromCharCode(65 + indiceH1);
}

// Calcula, para cada h1/h2 del body, el id de sección (o null si esa
// posición no genera chunk -- solo pasa con h1 cuyo texto de introducción
// es demasiado corto, igual que en trocearManual).
function calcularIdsPorPosicion(cuerpo, slug) {
  const re = /<h([12])\b[^>]*>([\s\S]*?)<\/h\1>/gi;
  const encabezados = [];
  let m;
  while ((m = re.exec(cuerpo)) !== null) {
    encabezados.push({ nivel: Number(m[1]), tituloCrudo: m[2], finTitulo: re.lastIndex, inicio: m.index });
  }

  const resultado = []; // { inicio, id }
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
        resultado.push({ inicio: enc.inicio, id: `${slug}-${letra}-0` });
      }
    } else {
      if (!h1Actual) {
        contadorH1++;
        h1Actual = { letra: String.fromCharCode(65 + contadorH1), titulo: '(sin título de capítulo)' };
        contadorH2 = 0;
      }
      contadorH2++;
      resultado.push({ inicio: enc.inicio, id: `${slug}-${h1Actual.letra}-${contadorH2}` });
    }
  }

  return resultado;
}

function procesarArchivo(slug, archivo) {
  const ruta = path.join(ROOT, archivo);
  const original = fs.readFileSync(ruta, 'utf-8');

  const bodyMatch = original.match(/<body[^>]*>([\s\S]*)<\/body>/i);
  if (!bodyMatch) {
    console.error(`  ${archivo}: no encontré <body>, se salta.`);
    return;
  }
  const cuerpo = bodyMatch[1];
  const inicioCuerpo = bodyMatch.index + bodyMatch[0].indexOf(cuerpo);

  const anclas = calcularIdsPorPosicion(cuerpo, slug);

  // Insertar de atrás hacia adelante para no invalidar los índices ya calculados.
  let cuerpoNuevo = cuerpo;
  let agregadas = 0;
  let yaExistian = 0;
  for (let i = anclas.length - 1; i >= 0; i--) {
    const { inicio, id } = anclas[i];
    const yaTieneAncla = cuerpoNuevo.slice(Math.max(0, inicio - 80), inicio).includes(`id="${id}"`);
    if (yaTieneAncla) {
      yaExistian++;
      continue;
    }
    const ancla = `<span id="${id}" class="justiniano-ancla"></span>`;
    cuerpoNuevo = cuerpoNuevo.slice(0, inicio) + ancla + cuerpoNuevo.slice(inicio);
    agregadas++;
  }

  if (agregadas === 0) {
    console.log(`  ${archivo}: ya tenía las ${yaExistian} anclas, nada que hacer.`);
    return;
  }

  const nuevoContenido =
    original.slice(0, inicioCuerpo) + cuerpoNuevo + original.slice(inicioCuerpo + cuerpo.length);

  fs.writeFileSync(ruta, nuevoContenido, 'utf-8');
  console.log(`  ${archivo}: ${agregadas} anclas agregadas (${yaExistian} ya existían).`);
}

function main() {
  for (const { slug, archivo } of FUENTES) {
    procesarArchivo(slug, archivo);
  }
  console.log('Listo. Verificar con: node scripts/extraer_contenido_interrogador.js (los ids/chunks deben quedar iguales que antes).');
}

main();
