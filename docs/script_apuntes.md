# Plantilla para generar manuales nuevos

> Ábrelo cuando toque construir el manual de una materia nueva de Civil o
> Procesal (Bienes, Contratos, Obligaciones, Familia, Sucesorio, Procesal
> Civil, Procesal Penal, etc.). Es el template de **formato y proceso**,
> generalizado a partir de los 3 manuales de Responsabilidad ya publicados.
> No reemplaza `docs/prompt-generacion-contenido-practica.md` (eso es para
> generar preguntas de Práctica a partir de un manual ya escrito, un paso
> posterior y todavía no cubierto por este documento).

---

## 0. Regla de oro (leer antes de escribir una sola línea)

Estas cuatro reglas no son negociables ni se relajan por volumen o apuro:

1. **Trabaja de a tandas, nunca el manual completo de una sola pasada.**
   Por eje, o en tramos cortos si un eje es muy largo. Cierra, verifica
   (sección 4) y entrega un tramo antes de abrir el siguiente. Leer de a
   poco reduce el riesgo de mezclar el contenido de un eje con otro o de
   "completar de memoria" un punto que ya salió de la ventana de lectura
   reciente.
2. **Prohibido alucinar.** Todo el contenido jurídico sale exclusivamente
   del material que Laura entregó para esa materia (su borrador o apuntes
   propios) y, cuando corresponda citar un artículo, del texto oficial y
   vigente del Código respectivo, verificado contra una fuente textual
   confiable. **Nunca se completa, redondea ni verifica con información de
   internet en general ni con el conocimiento de memoria del modelo** — la
   única fuente válida es el material que Laura entregó más el texto legal
   verificado. Si un dato no está en ese material y no se puede verificar
   contra el Código, no se escribe: se deja el hueco marcado explícitamente
   (ej. `[FALTA: verificar cita de jurisprudencia]`) para que Laura lo
   complete. Nunca se aproxima ni se inventa para no dejar un vacío.
3. **Todo contenido queda pendiente de revisión de Laura.** Nunca se marca
   como "revisado" o "definitivo" solo porque el modelo lo generó.
4. **Prohibido resumir. Reformatear no es sintetizar.** Esta regla existe
   porque se violó de verdad: los manuales de Bienes y de Acto Jurídico
   quedaron con 49-57% del contenido de su fuente (medido en caracteres,
   fuente vs. manual, sin encabezados de página), mientras que Contractual
   quedó en 92%, con el mismo proceso "en teoría". La causa no fue mala fe
   ni apuro: fue redactar el párrafo final directo desde la lectura de la
   fuente, en vez de partir de una transcripción cercana y solo ahí
   recortar en párrafos cortos. Al redactar de síntesis, es fácil que un
   segundo argumento, una excepción o un ejemplo de la fuente simplemente
   no aparezca, sin que nadie lo note ni lo marque. La sección 2 exige
   ahora un paso intermedio de transcripción cercana antes de formatear,
   justamente para que esto sea mecánicamente difícil de que vuelva a
   pasar. Ver `docs/incidente_compresion_manuales.md` para el caso real y
   la evidencia.

---

## 1. Formato

El estándar es el de **Responsabilidad Contractual y Precontractual**
(ver sección 1.6, "por qué no REX" en su versión original). **Actualizado
2026-08-12: REX ya fue reformateada a este mismo estándar**, eje por eje,
con verificación mecánica de que no se perdió contenido (ver
`docs/notas_reformato_rex.md` para el detalle de qué se agregó en cada
eje). Los tres manuales publicados siguen hoy el mismo formato.

### 1.1 Jerarquía de títulos y numeración

Las secciones de nivel superior pasan de número a **letra** para que los
niveles inferiores puedan numerarse con menos dígitos (un subtítulo de
tercer nivel dentro de la sección 5, punto 10, es `10.1`, no `5.10.1`).

| Nivel | Elemento | Numeración | Tratamiento |
|---|---|---|---|
| 0 (`h1`) | Sección/Eje | `A.`, `B.`, `C.`... | Centrado, negrita, subrayado, MAYÚSCULA, sans-serif (no la serif del cuerpo), color `var(--accent2)`. **Salto de página obligatorio antes** (`page-break-before:always`). |
| 1 (`h2`) | Punto | `1.`, `2.`... (reinicia en 1 dentro de cada sección con letra, nunca "A.1") | Rojo (`var(--accent)`), MAYÚSCULA, subrayado, alineado a la izquierda, sans-serif. |
| 2 (`h3`) | Subtema | `N.M` (ej. "10.1") | Negrita, subrayado, **serif igual al cuerpo** (acá cambia la fuente), minúscula normal, color `#222`. |
| 3 (`h4`) | Sub-subtema con letra, cuando el punto merece su propio encabezado | `a)`, `b)`, `c)` | Mismo tratamiento que `h3`. |
| 4 (`h5`, reservado) | Para un futuro "c.1", "c.2" | | Cursiva, sin negrita, sin subrayado, serif. |

Todo `h2`/`h3`/`h4` debe llevar su número: no se dejan subtítulos sin
numerar.

### 1.2 Enumeraciones dentro de un párrafo

Nunca `<ul><li>` de bullets para requisitos, características o categorías
legales. Cada punto en su propio párrafo (salto de línea entre el
encabezado del punto y el párrafo que lo desarrolla):

- **`.enum-i`** — números romanos en negrita `(i)` `(ii)` `(iii)`: cuando es
  la **única enumeración** del punto (requisitos, elementos, excepciones,
  pasos, casos).
- **`.enum-a`** — letras subrayadas `a.` `b.` `c.`: cuando los puntos son
  **características, categorías o tipos** de un mismo concepto (una
  clasificación en subtipos, no una lista de requisitos).
- **`.enum-c`** — cursiva, sin negrita ni subrayado (reservada, poco usada):
  un cuarto nivel más profundo (ej. "c.1", "c.2"), cuando hay una
  subdivisión dentro de una letra.
- Si el punto es un mini-título (ej. "(iii) Elementos."), la frase corta
  entera va en negrita/subrayado según su nivel, seguida de un párrafo
  aparte. Si el punto es continuación gramatical de una frase que lo
  introduce, solo la palabra o frase clave dentro del punto va en negrita,
  no la línea completa.

### 1.3 Recuadros pedagógicos

Cinco tipos, todos con el mismo formato de **dos líneas centradas**: tipo
de recuadro (`.caja-tipo`, mayúscula, negrita, 9pt) + título o cita
específica (`.caja-titulo`, negrita, 10pt). Markup real (tomado del manual
de Contractual):

```html
<div class="jurisprudencia">
  <span class="caja-tipo">Jurisprudencia</span>
  <span class="caja-titulo">Noción de responsabilidad</span>
  <p>La Corte Suprema ha definido la responsabilidad, en general, como
  <strong><em>la obligación en que se coloca una persona para reparar
  adecuadamente todo daño o perjuicio causado</em></strong>.</p>
</div>

<div class="ejemplo">
  <span class="caja-tipo">Ejemplo</span>
  <span class="caja-titulo">La opción del art. 1489 en acción</span>
  <p>Pedro vende a Juan un departamento por $120.000.000 y Juan no paga el
  saldo de precio. Pedro, contratante diligente, puede a su arbitrio...</p>
</div>

<div class="dato-grado">
  <span class="caja-tipo">Dato de grado</span>
  <span class="caja-titulo">¿Cuál es el estatuto <em>de derecho común</em>?</span>
  <p>Pregunta clásica de cédula. <strong>Tesis tradicional</strong>...</p>
</div>

<div class="callout">
  <span class="caja-tipo">No confundir</span>
  <span class="caja-titulo">Efectos del contrato vs. efectos de la obligación</span>
  <p>El <strong>efecto del contrato</strong> es <em>crear obligaciones</em>...</p>
</div>

<div class="warn">
  <span class="caja-tipo">Advertencia</span>
  <span class="caja-titulo">Trampa típica de examen</span>
  <p>...</p>
</div>
```

Uso de cada tipo:

- **Jurisprudencia:** un fallo real y verificable, citado tal como aparece
  en el material fuente (rol, tribunal, fecha si están disponibles). Nunca
  se inventa un rol o una fecha. **Varios fallos seguidos sobre el mismo
  punto van en un solo recuadro**, no uno por fallo: un `.caja-tipo`
  "JURISPRUDENCIA" arriba, y luego, repetido tantas veces como fallos, una
  línea `.caja-titulo` con el rol/corte/fecha + tema, seguida de su propio
  párrafo, sin cerrar el `<div>` hasta el final.
- **Ejemplo:** un caso ficticio breve (nombres inventados) que ilustra el
  concepto que se acaba de explicar.
- **Dato de grado:** una pregunta típica de examen oral/cédula sobre ese
  punto, con la respuesta esperada o las tesis en juego.
- **Callout ("No confundir" u otro título corto):** una precisión doctrinal
  destacada, una distinción que conviene remarcar.
- **Advertencia:** una trampa típica de examen, un error común que comete
  quien no domina bien el punto.
- **Pausa (checkpoint de comprensión lectora):** excepción al formato de
  dos líneas, se queda en una sola: `Pausa: Comprensión lectora` (con dos
  puntos), porque es un aviso de navegación, no contenido doctrinal. Las
  preguntas y palabras clave del checkpoint se definen en `app/manuales.html`
  (paso de código, fuera de este documento), no en el HTML del manual.

### 1.4 Puntuación y otras convenciones fijas

- **Cero guiones largos (—)**, en ningún lado. Reemplazar por coma, punto,
  punto y coma, dos puntos o paréntesis, según qué función cumplía.
- **Cero guillemets («»)**. El texto citado va en cursiva (`<em>`).
- **Autores citados: negrita + MAYÚSCULA completa** (ej.
  `<strong>ALESSANDRI</strong>`).
- **Artículos legales en rojo**, cubriendo tanto la palabra
  ("artículo"/"art."/"arts."/"artículos") como el número:
  `<span class="art">artículo 1489</span>`.
- Todo en español.

### 1.5 Hoja de estilos base (copiar tal cual, sin reinventar)

Este es el `<style>` real del manual de Contractual. Úsalo como punto de
partida exacto para el manual nuevo (ajustando solo el `<title>` y, si hace
falta, `--accent`/`--accent2` u otro color de marca, nunca la estructura):

```html
<style>
  :root{
    --accent:#C41E2E;--accent2:#111111;--light:#E8D8B8;--soft:#F5EAD4;
    --grey:#7A6E5F;--warn:#8A5A00;--warnbg:#FFF6E5;
    --green:#1A6B3A;--greenbg:#F4FAF6;--greenborder:#4CAF50;
    --orange:#7B3F00;--orangebg:#FFFAF4;--orangeborder:#C87028;
    --juris:#111111;--jurisbg:#F5EAD4;--jurisborder:#2A2A2A;
  }
  *{box-sizing:border-box;}
  body{
    font-family:'Times New Roman',Times,Georgia,serif;
    font-size:11pt;color:#111;line-height:1.45;max-width:800px;
    margin:0 auto;padding:52px 58px 88px;background:#fff;
    text-align:justify;hyphens:auto;-webkit-hyphens:auto;
  }
  h1{
    font-family:-apple-system,"Segoe UI",Arial,sans-serif;font-weight:700;
    color:var(--accent2);font-size:1.35rem;margin:0 0 .9rem;text-align:center;
    text-transform:uppercase;text-decoration:underline;letter-spacing:.03em;
    page-break-before:always;page-break-after:avoid;
  }
  h2{
    font-family:-apple-system,"Segoe UI",Arial,sans-serif;color:var(--accent);
    font-size:1.1rem;margin:2.4rem 0 .45rem;text-align:left;
    text-transform:uppercase;text-decoration:underline;page-break-after:avoid;
  }
  h3{
    font-family:'Times New Roman',Times,Georgia,serif;font-weight:700;
    color:#222;font-size:1.02rem;margin:1.7rem 0 .3rem;text-align:left;
    text-decoration:underline;page-break-after:avoid;
  }
  h4{
    font-family:'Times New Roman',Times,Georgia,serif;font-weight:700;
    color:#222;font-size:1.02rem;margin:1.3rem 0 .2rem;text-align:left;
    text-decoration:underline;page-break-after:avoid;
  }
  h5{
    font-family:'Times New Roman',Times,Georgia,serif;font-weight:400;
    font-style:italic;color:#333;font-size:1rem;margin:1rem 0 .2rem;
    text-align:left;page-break-after:avoid;
  }
  .enum-i{display:block;font-weight:700;margin:.9rem 0 .15rem;}
  .enum-a{display:block;text-decoration:underline;margin:.7rem 0 .15rem;}
  .enum-c{display:block;font-style:italic;margin:.6rem 0 .15rem;}
  p{margin:.75rem 0 .75rem;text-align:justify;}
  ul,ol{margin:.55rem 0 .95rem;padding-left:1.5rem;text-align:left;}
  li{margin:.4rem 0;text-align:justify;}
  table{border-collapse:collapse;width:100%;margin:1.2rem 0;font-size:10pt;
    font-family:-apple-system,"Segoe UI",Arial,sans-serif;}
  th{background:var(--accent);color:#fff;text-align:left;padding:7px 10px;font-size:9pt;}
  td{border:1px solid #bbb;padding:7px 10px;vertical-align:top;}
  tr:nth-child(even) td{background:var(--soft);}
  .art{font-weight:700;color:var(--accent);white-space:nowrap;}

  .caja-tipo{display:block;text-align:center;font-weight:700;text-transform:uppercase;
    letter-spacing:.08em;font-size:9pt;margin-bottom:4px;}
  .caja-titulo{display:block;text-align:center;font-weight:700;font-size:10pt;margin-bottom:.4rem;}
  .jurisprudencia .caja-titulo{text-transform:uppercase;font-size:9.5pt;margin-bottom:6px;
    padding-bottom:5px;border-bottom:1px solid var(--jurisborder);}
  .callout .caja-tipo{color:var(--accent);}
  .warn .caja-tipo{color:var(--warn);}
  .jurisprudencia .caja-tipo{color:var(--juris);}
  .ejemplo .caja-tipo{color:var(--green);}
  .dato-grado .caja-tipo{color:var(--orange);}

  .callout{border-left:5px solid var(--accent);background:var(--soft);padding:12px 16px;margin:1.3rem 0;}
  .warn{border-left:5px solid var(--warn);background:var(--warnbg);padding:12px 16px;margin:1.3rem 0;}
  .jurisprudencia{border:1px solid var(--jurisborder);background:var(--jurisbg);
    padding:10px 14px;margin:1.5rem 0;font-size:12pt;line-height:1.2;}
  .jurisprudencia .titulo-bloque{font-family:-apple-system,"Segoe UI",Arial,sans-serif;
    font-weight:700;color:var(--juris);display:block;margin-bottom:6px;padding-bottom:5px;
    border-bottom:1px solid var(--jurisborder);font-size:9pt;text-transform:uppercase;
    letter-spacing:.04em;text-align:left;}
  .jurisprudencia p,.jurisprudencia strong{font-size:12pt;}
  .jurisprudencia strong{color:#333;}
  .ejemplo{border-left:4px solid var(--greenborder);background:var(--greenbg);padding:12px 16px;margin:1.3rem 0;}
  .dato-grado{border:2px dashed var(--orangeborder);background:var(--orangebg);padding:12px 16px;margin:1.3rem 0;}

  .repaso{border-left:4px solid var(--accent);background:#FCF7EC;padding:11px 16px;
    margin:2.4rem 0 .4rem;font-family:-apple-system,"Segoe UI",Arial,sans-serif;
    font-size:9.5pt;line-height:1.4;color:#5a5043;text-align:left;page-break-inside:avoid;}

  .cover{text-align:center;padding:96px 20px 60px;border-bottom:none;margin-bottom:2rem;}
  .cover .brand{font-family:'Bebas Neue',-apple-system,Arial,sans-serif;display:inline-block;
    background:var(--accent2);color:var(--light);font-size:1.5rem;letter-spacing:7px;
    font-weight:400;padding:9px 28px 6px;text-indent:7px;}
  .cover .doc{font-family:'Bebas Neue',-apple-system,Arial,sans-serif;color:var(--accent2);
    font-size:4.4rem;font-weight:400;line-height:.92;letter-spacing:1px;margin-top:2.2rem;
    text-transform:uppercase;}
  .cover .rule{width:84px;height:4px;background:var(--accent);margin:1.8rem auto 1.5rem;}
  .cover .sub{font-family:'Inter',-apple-system,Arial,sans-serif;color:var(--accent);
    font-size:.78rem;font-weight:600;letter-spacing:2.5px;text-transform:uppercase;}
  .cover .author{font-family:'Inter',-apple-system,Arial,sans-serif;color:var(--accent2);
    font-size:1.05rem;font-weight:400;margin-top:1.7rem;}
  .cover .meta{font-family:'Inter',-apple-system,Arial,sans-serif;color:var(--grey);
    margin-top:1.3rem;font-size:.8rem;font-weight:300;line-height:1.55;max-width:460px;
    margin-left:auto;margin-right:auto;}

  .toc{background:var(--soft);border:1px solid var(--light);padding:14px 22px;
    margin-bottom:2rem;font-family:-apple-system,"Segoe UI",Arial,sans-serif;font-size:10pt;}
  .toc a{color:var(--accent);text-decoration:none;}
  .toc a:hover{text-decoration:underline;}
  .toc ol{text-align:left;}

  @media print{
    body{margin:0;padding:0;max-width:none;font-size:12pt;line-height:1.3;}
    h1{page-break-after:avoid;} h2,h3{page-break-after:avoid;}
    .callout,.warn,.jurisprudencia,.ejemplo,.dato-grado,.repaso,table,tr,li{page-break-inside:avoid;}
    .cover{page-break-after:always;display:flex;flex-direction:column;justify-content:center;
      align-items:center;min-height:23cm;box-sizing:border-box;padding:0 20px;margin:0;}
    .toc{page-break-after:always;margin-bottom:1.4rem;}
  }
</style>
```

(La fuente `Bebas Neue`/`Inter` de la portada se carga con el mismo
`<link>` de Google Fonts que ya usan los 3 manuales existentes.)

### 1.6 Densidad de texto: párrafos cortos, documento espaciado, cero contenido perdido

**Este fue el punto que más se corrigió al escribir este template, y el
que después igual falló en la práctica.** El estándar es Contractual y
Precontractual. Al medirlos originalmente (antes del reformato de
2026-08-12), Extracontractual promediaba 1048 caracteres por párrafo (con
párrafos de hasta **10.529 caracteres seguidos**, sin ningún recuadro
`.callout` ni `.warn` en todo el documento), mientras que Contractual
promediaba 620 caracteres (máximo 1770) y Precontractual 512 (máximo
1650), ambos con recuadros frecuentes intercalados. Extracontractual ya
fue reformateada a este mismo estándar (2026-08-12, ver
`docs/notas_reformato_rex.md`).

Pero medir solo el tamaño de párrafo no alcanza para detectar el problema
real, que apareció después en Bienes y Acto Jurídico: **ambos cumplían la
regla de párrafos cortos y tenían recuadros frecuentes, y aun así
terminaron con menos de la mitad del contenido de su fuente**, porque
"corto" se logró recortando argumentos enteros, no solo acortando
oraciones. Ejemplo real, de Bienes, Eje A: la fuente trae dos argumentos
seguidos contra la clasificación de "cosas incorporales" (uno sobre la
relación vertical/horizontal entre cosa y derecho, otro distinto sobre
por qué el dominio no puede a su vez ser "cosa", con un ejemplo trabajado
de cadena infinita: derecho de propiedad sobre un auto, derecho de
propiedad sobre ese derecho, y así). El párrafo final del manual, con
buena densidad de caracteres, solo tiene el primer argumento. El segundo
argumento y su ejemplo no están en ningún lado del manual: no se cortaron
a un recuadro, no se marcaron como omitidos, desaparecieron.

Reglas concretas:

- **Un párrafo apunta a 400-700 caracteres.** Si se está acercando a los
  1200, córtalo en dos o convierte parte del contenido en un recuadro
  (ejemplo, dato de grado, jurisprudencia) en vez de seguir en un solo
  bloque de texto corrido. Cortar es partir en más párrafos o más
  recuadros, **nunca es eliminar una oración, un argumento o un ejemplo**
  de la fuente para que el párrafo quede más corto.
- Un documento "espaciado" tiene **más encabezados, más recuadros y
  párrafos más cortos** que uno "denso" con el mismo contenido jurídico,
  no menos contenido: espaciar no es resumir. Si un párrafo de la fuente
  trae dos argumentos, un ejemplo o una excepción, el manual debe tener
  ese mismo contenido, repartido en dos o tres párrafos si hace falta
  para respetar el límite de caracteres, no comprimido en uno solo que
  se queda con la mitad.
- Cada eje debe llevar al menos un recuadro de Ejemplo o Dato de grado; si
  el material fuente trae jurisprudencia o una distinción que merece un
  callout, agrégalos también. Un tramo largo de puro texto corrido, sin
  ningún recuadro, es la señal de que el tramo quedó denso en vez de
  espaciado.
- **Chequeo mecánico obligatorio de fidelidad, al cerrar cada tramo**
  (además de los chequeos de la sección 3): contar los caracteres del
  texto plano de la fuente de ese tramo (quitando encabezados de página
  repetidos tipo "Facultad de Derecho UC" / nombre de la materia / autor
  / "Página X de Y") y los del HTML ya escrito para ese mismo tramo
  (quitando etiquetas). La razón (caracteres del manual ÷ caracteres de
  la fuente limpia) **debe rondar 80-90%**, igual que en Contractual. Un
  script mínimo para esto:

  ```python
  import re
  def clean(text, materia_marker, autor_marker):
      lines = [l for l in text.split("\n")
               if "Facultad de Derecho" not in l
               and materia_marker not in l
               and autor_marker not in l
               and not l.strip().startswith("__")
               and "Página" not in l]
      return " ".join(l.strip() for l in lines if l.strip())

  fuente_limpia = clean(texto_fuente_del_tramo, "NOMBRE MATERIA", "Autor Apellido")
  manual_texto = re.sub(r"\s+", " ", re.sub(r"<[^>]+>", " ", html_del_tramo)).strip()
  print(len(manual_texto) / len(fuente_limpia))
  ```

  Si la razón cae bajo ~75%, releer el tramo contra la fuente antes de
  cerrarlo y encontrar qué se perdió: no es aceptable cerrar un tramo
  solo porque pasó el chequeo de densidad de párrafo y de etiquetas si
  no pasó este.
- **Toda omisión de contenido debe ser una decisión visible, no un
  accidente silencioso.** Si de verdad conviene condensar algo (por
  ejemplo, una casuística que pertenece a otra materia y solo se
  menciona de pasada, como pasó a propósito con la Sucesión dentro de
  Bienes), decirlo explícitamente en el propio texto del manual o, como
  mínimo, en el mensaje del commit de ese tramo: qué se condensó y por
  qué. Una razón de fidelidad baja "porque se decidió condensar
  deliberadamente" es aceptable; una razón de fidelidad baja porque
  nadie se dio cuenta, no.

### 1.7 Índice con subtemas (requisito nuevo para manuales nuevos)

Los 3 manuales existentes solo listan en su índice los ejes de nivel
superior (nivel 0, letra). Laura pidió (2026-07-31) que el índice liste
también los subtemas de nivel 2 (`h3`, tipo "10.1"); nunca se implementó en
los manuales viejos. **Para un manual nuevo, el índice debe incluir esos
subtemas desde el principio**, para no heredar esa deuda.

---

## 2. Proceso de construcción

Generaliza el patrón ya usado con Extracontractual y Precontractual
(carpetas `Apuntes/Ejes_Responsabilidad_Extracontractual_Borrador/` y
`Apuntes/Ejes_Responsabilidad_Precontractual_Borrador/`, cada una con un
`.md` por eje). El estándar de material fuente, confirmado con Bienes, es
**un apunte principal (uno o varios PDF, típicamente de Boetsch, cortados
por tema) más varios anexos y documentos secundarios**, cada uno acotado
a uno o dos temas puntuales (jurisprudencia, un resumen de otro autor
como Peñailillo o Vial, apuntes de interrogación de compañeros, un
decreto ley específico, etc.). Toda materia civil o procesal nueva va a
llegar así: el proceso de abajo asume esa estructura de entrada.

### 2.1 Apunte principal

1. **Insumo:** el apunte principal de Laura para la materia nueva,
   idealmente ya dividido en un archivo por eje o subtema (si no lo está,
   dividirlo primero antes de escribir nada, para poder trabajar de a
   tandas según la sección 0). Extraer el texto plano de cada PDF una
   sola vez (ej. con `fitz`/PyMuPDF) y guardarlo, para poder releerlo
   sin volver a abrir el PDF y para poder correr el chequeo de fidelidad
   de la sección 1.6 contra él.
2. **Transcripción cercana, tramo por tramo, ANTES de dar por escrito un
   párrafo final.** Este es el paso que falló en Bienes y Acto Jurídico
   y que ahora es obligatorio y no salteable: para cada tramo (eje o
   subtema), primero volcar el contenido de la fuente casi tal cual —
   mismas oraciones, mismos argumentos, mismos ejemplos, con edición
   mínima (arreglar una redacción torpe, unificar terminología) — en un
   borrador intermedio. Recién sobre ese borrador, en un segundo paso,
   aplicar la jerarquía, las enumeraciones, los recuadros y la densidad
   de párrafo de la sección 1: cortar oraciones largas en varios
   párrafos cortos, convertir una lista en `.enum-a`/`.enum-i`, sacar un
   ejemplo o una distinción a su propio recuadro. Lo que nunca puede
   pasar en este segundo paso es que un argumento, una excepción o un
   ejemplo del borrador intermedio quede afuera del HTML final: la
   densidad se logra partiendo el borrador en más piezas, no
   descartando piezas.
   - El borrador intermedio no necesita ser un archivo aparte (aunque
     puede serlo, como los `BORRADOR_manual_*.html` de Extracontractual y
     Precontractual): alcanza con tenerlo presente como paso mental
     explícito antes de escribir el HTML final de un tramo. Lo que no es
     opcional es el chequeo de fidelidad de la sección 1.6 al cerrar el
     tramo, que es lo que detecta si este paso se saltó.
3. **Formateo y cierre, en tandas:** aplicar el resto de la sección 1
   (títulos, artículos en rojo, autores en versalita, sin guiones
   largos), eje por eje o en tramos cortos. No avanzar al siguiente
   tramo sin cerrar y verificar el actual (sección 3), incluido el
   chequeo de fidelidad.
4. **Archivo final:** `0X_<Materia>_Manual.html` en la raíz del repo,
   siguiendo la numeración ya usada.

### 2.2 Anexos y documentos secundarios (después del apunte principal)

Una vez completo el apunte principal, se revisan los anexos para agregar
lo que corresponda en las secciones ya escritas. No son un eje nuevo al
final: la mayoría trata uno o dos temas puntuales que ya tienen su lugar
en el manual, así que la edición queda dispersa por todo el documento.
Proceso que funcionó con los 12 anexos de Bienes:

1. **Extraer y mapear primero, escribir después.** Extraer el texto de
   cada anexo, leerlo, y anotar a qué sección exacta del manual apunta
   cada uno (una tabla anexo → sección basta) antes de tocar el HTML.
   Los anexos muy grandes (un libro completo o un resumen de 60-80
   páginas) casi seguro solapan con el apunte principal: no leerlos de
   corrido, buscarlos por término dirigido a los huecos que ya se
   conocen del manual (`grep`/búsqueda de texto sobre el archivo
   extraído).
2. **Confiabilidad de la fuente determina el estándar de verificación.**
   Un apunte de cátedra (Boetsch, Peñailillo, Vial, Orrego) se usa
   directo, con la misma regla anti-alucinación de siempre. Un apunte de
   compañeros de curso (interrogaciones, resúmenes de otro alumno) es
   contenido de menor confiabilidad: antes de agregarlo, cruzarlo contra
   una fuente de cátedra disponible. Si no se puede corroborar, no entra
   — salvo que Laura confirme el punto puntualmente, caso en que su
   confirmación reemplaza la corroboración documental para ese punto
   específico (no es licencia general para bajar el estándar en el
   resto).
3. **Nada de pendientes silenciosos.** Si un anexo trae contenido
   relevante que no se pudo verificar, o que se revisó y se decidió no
   usar, decirlo explícitamente al reportar el lote (qué anexo, qué
   contenido, por qué no entró), no simplemente omitirlo sin comentario.
4. **Lotes chicos, un commit por lote,** igual que con el apunte
   principal: no juntar los 12 anexos en un solo commit al final.

Este template no cubre todavía cómo conectar el manual nuevo a la app
(`app/manuales.html`), a Airtable/Supabase, ni la generación de PDF
(`scripts/generar_pdf_manual.py`) — son pasos posteriores, deliberadamente
fuera de esta primera versión del template.

---

## 3. Verificación antes de dar un tramo por terminado

- **Balance de etiquetas.** Verificar (conteo + pila de anidamiento) que
  cada `div`, `p`, `em`, `strong` abierto tenga su cierre. Hay un bug real
  ya conocido: al insertar un recuadro justo antes de un párrafo existente,
  es fácil dejar ese `<p>` de apertura fuera del bloque que se está
  insertando, generando un `<p>` sin cerrar o un recuadro mal anidado.
  Revisar específicamente ese punto cada vez que se inserta un recuadro
  entre contenido ya escrito.
- **Cero guiones largos, cero guillemets**, en cualquier campo del tramo.
- **Ningún artículo, fallo o atribución doctrinal que no esté literalmente
  en el material fuente de Laura** (regla de la sección 0, repetida acá
  porque es el punto donde más fácil se cuela una alucinación).
- **Contenido jurídico del tramo queda marcado como pendiente de revisión
  de Laura**, nunca como definitivo.

Una vez exista el manual completo (fuera del alcance de esta primera
versión del template): regenerar el PDF con `scripts/generar_pdf_manual.py`
y revisarlo visualmente, y correr `scripts/agregar_anclas_manuales.js`
(previa entrada nueva en su array `FUENTES`) para las anclas de sección.
