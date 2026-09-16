# Plantilla para generar manuales nuevos

> Ábrelo cuando toque construir el manual de una materia nueva de Civil o
> Procesal (Bienes, Contratos, Obligaciones, Familia, Sucesorio, Procesal
> Civil, Procesal Penal, etc.). Es el template de **formato y proceso**,
> generalizado a partir de los 3 manuales de Responsabilidad ya publicados.
> No reemplaza `docs/prompt-generacion-contenido-practica.md` (eso es para
> generar preguntas de Práctica a partir de un manual ya escrito, un paso
> posterior y todavía no cubierto por este documento). **La sección 4
> (auditoría de cobertura) también aplica a un manual ya publicado**, no
> solo a uno nuevo: es el proceso a seguir cuando se sospecha (o se quiere
> descartar) que un manual terminado tiene huecos frente a sus fuentes,
> con o sin relación a estar construyendo contenido nuevo en ese momento.

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

**Regla permanente, corregida 2026-09-16 a pedido explícito de Laura: se
sigue siempre, en todos los manuales, no solo en el tramo donde se
detectó.** Nunca `<ul><li>` de bullets para requisitos, características
o categorías legales. Nunca, tampoco, un párrafo corrido con los puntos
separados por punto y coma ("son requisitos: que..., que..., y
que..."): eso obliga a releer la frase para separar los puntos a
mano, y es exactamente lo que este formato existe para evitar. Cada vez
que un párrafo va a enumerar varios requisitos, elementos, soluciones,
posturas o pasos:

1. La frase que introduce la enumeración **termina en dos puntos** (":"),
   en su propio párrafo, no en punto seguido.
2. Cada punto va **en su propio párrafo** (salto de línea entre punto y
   punto). Si el punto es un mini-título con desarrollo propio abajo
   (ej. "(iii) Elementos."), la frase corta entera va en negrita o
   subrayado según su nivel, seguida de un párrafo aparte que lo
   desarrolla (ver clases `.enum-i`/`.enum-a` de bloque, abajo). Si el
   punto es una oración corta y autocontenida, sin desarrollo aparte
   (como un requisito de una sola frase), va como texto corrido normal
   con un marcador `(i)`/`(ii)`/`(iii)` al inicio (`<span
   class="num">`, sin negrita ni cursiva propia — ver 1.8).
3. **Dentro de cada punto, resaltar (negrita) solo la palabra o frase
   clave, nunca el punto completo.** Poner en negrita o cursiva la
   oración entera (como pasó en la primera versión de este arreglo, con
   toda la frase en cursiva) le quita peso exactamente a lo que se
   quiere destacar: si todo resalta, nada resalta. Ejemplo correcto:
   "Que se **ejerza un derecho**, a lo menos con apariencia de
   **legalidad**." — no la frase completa en negrita ni en cursiva.
4. Cuando la enumeración se presenta con palabras ordinales en vez de
   números/letras ("la primera... la segunda...", "en primer
   lugar... en segundo lugar..."), esas palabras ordinales van en
   negrita, mismo criterio de "resaltar el marcador, no todo el punto".

Clases disponibles para el nivel de bloque (punto con desarrollo propio
en un párrafo aparte):

- **`.enum-i`** — números romanos en **cursiva** `(i)` `(ii)` `(iii)`
  (cambiado de negrita a cursiva el 2026-09-16, ver 1.8): cuando es la
  **única enumeración** del punto (requisitos, elementos, excepciones,
  pasos, casos).
- **`.enum-a`** — letras subrayadas `a.` `b.` `c.`: cuando los puntos son
  **características, categorías o tipos** de un mismo concepto (una
  clasificación en subtipos, no una lista de requisitos).
- **`.enum-a-inline`** — variante de `.enum-a` en cursiva, sin salto de
  línea: cuando el punto es una etiqueta corta seguida de dos puntos y
  el desarrollo sigue en la misma oración (ej. "*Compraventa:* la de
  bienes raíces es solemne..."). Aquí la cursiva va solo en la etiqueta
  ("Compraventa:"), nunca en el desarrollo que sigue.
- **`.enum-c`** — cursiva, sin negrita ni subrayado (reservada, poco usada):
  un cuarto nivel más profundo (ej. "c.1", "c.2"), cuando hay una
  subdivisión dentro de una letra.

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
  .enum-i{display:block;font-style:italic;margin:.9rem 0 .15rem;}
  .enum-a{display:block;text-decoration:underline;margin:.7rem 0 .15rem;}
  .enum-a-inline{font-style:italic;}
  .enum-a-inline .tit{text-decoration:none;}
  .enum-c{display:block;font-style:italic;margin:.6rem 0 .15rem;}
  .num{text-decoration:none;}
  .tit{text-decoration:underline;}
  h4 .tit{text-decoration:none;}
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

### 1.7 Ejes que se dividen en varios bloques temáticos: pasan a ser capítulos romanos propios

**2026-09-15, piloto en Bienes Eje A. Corregido 2026-09-16, a pedido de
Laura, antes de que se replicara el error en otro eje.** La primera
versión de este punto (ver historial de git si hace falta el detalle)
proponía un divisor `.parte` *dentro* del Eje A, sin salto de página,
solo como agrupador visual. Laura pidió algo distinto: cuando un eje
tiene varios bloques temáticos bien distintos en la fuente
(típicamente "aspectos generales" y "clasificación"), **cada bloque se
convierte en su propio capítulo de nivel superior**, con número romano
correlativo (I, II, III...), al mismo nivel que los demás ejes del
manual (letra A-Z hoy) — no en un nivel intermedio nuevo.

En la práctica: el Eje A se transformó en dos capítulos `h1`
independientes, exactamente con el mismo formato que cualquier otro
eje (salto de página incluido):

```html
<h1 id="cI">I. Aspectos generales</h1>
...
<h1 id="cII">II. Clasificación de los bienes</h1>
```

Los antiguos subtemas de primer nivel del bloque II (que eran "4.
Bienes corporales...", numerados) pasan a un nivel de "clasificación"
con letra mayúscula (`h2`, sigue el mismo patrón `.num`/`.tit` que
cualquier otro `h2` del manual), y sus antiguos subtemas `N.M` (que
eran `h3`) se renumeran `1.`, `2.`... reiniciando dentro de cada letra.
Los `h4` (a, b, c...) debajo no cambian.

**Ids: usar el prefijo `c` (capítulo), nunca `s` + número romano.**
Los ejes existentes ya usan ids de una sola letra (`sB`, `sC`... y
también `sI`, para el eje "La tradición del derecho real de herencia",
noveno en el orden A-Z). Si un capítulo romano nuevo usara `id="sI"`
para "I. Aspectos generales", **choca directo con ese `sI` que ya
existe** — pasó en la primera pasada de esta corrección, detectado
recién con un chequeo de ids duplicados antes de dar el tramo por
bueno. Por eso los capítulos romanos usan `id="cI"`, `id="cII"`, etc.
(y sub-ids `cI-1`, `cII-A`, `cII-A-1`...), un namespace que nunca
choca con las letras `sA`-`sZ` todavía en uso.

**No hace falta saltar ninguna letra.** Como el número romano del
capítulo y las letras de clasificación quedan en niveles visuales
distintos (título de capítulo centrado arriba vs. subtítulos A, B, C
más abajo), no compiten por el mismo golpe de vista. La primera
versión de este punto recomendaba saltar la letra "I" en la secuencia
de clasificaciones para no chocar con un romano "I." vecino: ya no
aplica, la secuencia de clasificación va A, B, C... sin saltos.

**Alcance: aplicación progresiva, eje por eje, no de una sola vez.**
Laura decidió (2026-09-16) no renumerar los 26 ejes del manual completo
de golpe, porque en ese momento 24 de ellos todavía no habían pasado
por la revisión de fidelidad de contenido (sección 3). El plan es: a
medida que se revisa cada eje contra la fuente, si tiene varios
bloques temáticos, se convierte en el (los) siguiente(s) número(s)
romano(s) correlativo(s) del manual. Si un eje no tiene bloques
temáticos distintos, simplemente se convierte en un solo número romano
(mismo título, mismo contenido, solo cambia el id y el numeral). Hecho
hasta ahora: el Eje A se volvió I y II; B (El dominio) se volvió III;
C (La copropiedad) se volvió IV (2026-09-16, ambos ya revisados contra
la fuente). Mientras el resto no se revise, el índice sigue mostrando
una mezcla de romanos y letras (D, E, F...).

**Plan ya acordado para "V. Los modos de adquirir" (D-U), a aplicar
cuando le toque el turno a esos ejes — no ejecutado todavía porque
ninguno de esos 18 ejes pasó aún por la revisión de contenido.**
Laura pidió seguir la estructura real de Boetsch en vez de inventar
una propia, verificada el 2026-09-16 leyendo los PDF fuente
directamente (`BIENES_principal_5` a `_17`):

- **V.1 Aspectos generales** y **V.2 La ocupación** — hoy fusionados en
  el título del Eje D ("Los modos de adquirir: aspectos generales y la
  ocupación"); Boetsch los trata como dos puntos `IV.1`/`IV.2`
  separados dentro del mismo PDF. Separarlos en dos números al
  reformatear.
- **V.3 La accesión** = Eje E actual, sin cambios de fondo.
- **V.4 La tradición** = Ejes F, G, H, I actuales, que pasan a ser las
  letras **A** (F: descripción general, requisitos y efectos — Boetsch
  trae esto en tres letras A/B/C separadas, pero nuestro manual ya las
  fusionó en un eje, y eso se conserva), **B** (G: tradición de
  muebles), **C** (H: tradición de inmuebles) y **D** (I: tradición del
  derecho real de herencia).
- **V.5 La prescripción** = Ejes J a T actuales completos (¡11 ejes!),
  porque Boetsch mete **toda** la Posesión como preámbulo necesario de
  la Prescripción, no como tema aparte. Se divide en dos letras: **A.
  La posesión** (Ejes J-P actuales: aspectos generales, clases, mera
  tenencia, adquisición/pérdida en muebles, posesión inscrita,
  adquisición/pérdida en inmuebles inscritos, prueba — con su propia
  sub-numeración `A.1`-`A.7`) y **B. La prescripción adquisitiva**
  (Ejes Q-T actuales, sub-numerados `B.1`-`B.4`). **Decisión explícita
  de Laura (2026-09-16): seguir a Boetsch tal cual, sin darle a la
  Posesión su propio número romano pese a ser mucho contenido** (7
  ejes) escondido dos niveles abajo del índice.
- **V.6 La sucesión por causa de muerte** = Eje U actual, sin cambios
  de fondo.

No verificado todavía: qué pasa en el límite con el Eje V actual (La
propiedad fiduciaria) en adelante — probablemente Boetsch abre ahí un
capítulo romano nuevo ("V. Los derechos reales limitados" o similar),
a confirmar contra la fuente cuando se llegue a ese punto del manual.

### 1.8 Espaciado después del número o letra de cada encabezado

**2026-09-15, piloto en Bienes Eje A. Extendido a todo el manual y a
`h1` el 2026-09-16, a pedido explícito de Laura: "que esto aplique a
todos los enunciados numerales".** Después del número/letra/romano de
cualquier título o enumeración (`h1`, `h2`, `h3`, `h4`, `.enum-a`,
`.enum-i`, y los marcadores `(i)/(ii)/(iii)` sueltos dentro de un
párrafo, ver 1.2), va `&nbsp;&nbsp;&nbsp;&nbsp;` (cuatro espacios
duros) antes de empezar el texto, en vez de un espacio simple. Un
espacio simple se colapsa igual en HTML, por eso hace falta `&nbsp;`.
Objetivo: que el número se distinga del título de un vistazo rápido.

**Regla permanente: el subrayado va solo en las palabras del título,
nunca en el número/letra/romano.** El número y el espacio van
envueltos en `<span class="num">` (`.num{text-decoration:none}`) y el
título en `<span class="tit">` (`.tit{text-decoration:underline}`), en
los niveles que llevan subrayado (`h1`, `h2`, `h3`, `h4`, `.enum-a`,
`.enum-a-inline`): sin ese envoltorio, el subrayado del encabezado se
extiende también por debajo del número y del espacio, no solo del
título, que es el error que salió en la primera pasada de Bienes. El
`h4` además pierde el subrayado del todo (`h4 .tit{text-decoration:none}`,
ver 1.2) para no tener el mismo peso visual que el `h3` de arriba.

**Aplica a los 27 `h1` del manual completo, no solo a los capítulos
romanos nuevos.** La primera versión de este punto eximía a `h1`
("un solo espacio normal, sin `span`") porque se pensó que el
problema de lectura solo aparecía en encabezados chicos y densos, no
en un título grande y centrado. Laura corrigió eso: la regla es
"todos los enunciados numerales", sin excepción. Como el texto de los
27 `h1` (letra/romano + título) no cambia, esto se aplicó de una sola
vez a todo el documento (no hace falta esperar a la revisión de
contenido de cada eje, es un cambio puramente de formato, igual que el
resto de este punto): `<h1 id="sB" style="text-decoration:none"><span
class="num">B.&nbsp;&nbsp;&nbsp;&nbsp;</span><span class="tit">El
dominio</span></h1>`. Mismo criterio para `h2`/`h3`/`h4`: como el
envoltorio no cambia el texto ni el esquema de numeración de cada eje
(sigue "N." para `h2`, "N.M." para `h3` en los ejes sin revisar,
"1., 2., 3..." reiniciado por letra donde ya se aplicó 1.7), se
aplicó de una sola vez a los 27 ejes existentes. Lo que sigue
progresivo, eje por eje, es únicamente la reparación de **contenido**
(fidelidad, cobertura) y la conversión a capítulos romanos de 1.7 — no
el formato de espaciado/subrayado, que ya es parejo en todo el
manual.

### 1.9 Índice con subtemas (requisito nuevo para manuales nuevos)

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

**2026-09-14: Laura revisa y aprueba cada tramo contra la fuente antes de
abrir el siguiente.** Los chequeos mecánicos de abajo (balance de
etiquetas, guiones largos, fidelidad de caracteres) son piso mínimo, no
cierre: no reemplazan la lectura de Laura. Nace de que la auditoría de
cobertura (sección 4) solo corre al final del manual completo, y para
entonces ya se coló contenido comprimido (Bienes, Acto Jurídico) o un
hueco frente a una fuente secundaria (Contractual, ver sección 4.1) sin
que nadie lo note hasta mucho después. Aplica a manuales nuevos y a
reparación de manuales existentes por igual.

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

---

## 4. Auditoría de cobertura al terminar el manual (obligatoria)

> Origen de esta sección: el 2026-08-13/14 se auditó `04_Acto_Juridico_Manual.html`
> completo contra sus 17 fuentes (`docs/auditoria_acto_juridico_2026-08-13.md`,
> 49 hallazgos en 21 ejes) y el 2026-08-18 Laura encontró a mano, revisando
> una pregunta de Airtable, dos huecos reales en Contractual que ese
> proceso no habría atrapado del todo. Ambos casos quedan documentados
> abajo como ejemplo de trabajo real, no hipotético.

### 4.1 Por qué el chequeo de la sección 1.6 no alcanza

El chequeo de fidelidad de la sección 1.6 (razón caracteres del
manual/caracteres de la fuente, tramo por tramo, apuntando a 80-90%) mide
si un tramo es fiel **a la fuente que se usó para escribirlo**. No mide
si esa fue la única fuente relevante para el tema. Contractual pasa ese
chequeo con 92% de fidelidad a Boetsch (su fuente principal) y aun así
le faltaba, verificado el 2026-08-18, todo el tratamiento que Orrego
("Efectos de las obligaciones") hace de la misma pregunta sistemática
(qué estatuto rige las obligaciones legales y cuasicontractuales),
con una lista de autores distinta y más completa que la de Boetsch.
**Un tramo fiel a su fuente puede seguir siendo un manual incompleto**
si existe una fuente secundaria que trata el mismo tema con más
profundidad y esa fuente nunca se cruzó. Esta sección 4 existe para
atrapar justamente ese tipo de vacío, que el chequeo de tramo no puede
ver por construcción.

### 4.2 Cuándo corre

Al terminar el apunte principal completo de una materia nueva (antes o
después de incorporar los anexos de la sección 2.2, según convenga), y
también, por separado, sobre cualquiera de los 3 manuales ya publicados
cuando haya motivo para sospechar un hueco (un hallazgo suelto de Laura,
como el de Contractual del 2026-08-18, o simplemente porque nunca se
auditó formalmente, como sigue siendo el caso de Extracontractual y
Precontractual). No es parte del ciclo de cada tramo (eso lo cubre la
sección 3): es un paso final, sobre el manual ya cerrado.

### 4.3 El artefacto central: tabla tema × fuente

Antes de escribir un solo hallazgo, construir una tabla con **una fila
por tema o subtema del manual** (los `h2`/`h3` ya numerados) y **una
columna por fuente disponible para esa materia**: el apunte principal,
cada documento secundario (aunque solo cubra uno o dos temas), y los
documentos que son solo jurisprudencia (fallos sueltos, sentencias). Cada
celda se marca:

- **Tratado** — el tema aparece en esa fuente y el manual ya lo recoge
  con fidelidad equivalente.
- **No tratado** — esa fuente no toca el tema (normal, no es un hueco).
- **Tratado con más detalle en la fuente** — la fuente trata el tema y
  el manual, aunque no esté vacío en ese punto, se quedó corto frente a
  *esa* fuente en particular (autores distintos, un argumento adicional,
  jurisprudencia no citada, etc.). **Esta es la celda que genera un
  hallazgo:** cada una se convierte en un ítem de la categoría 1 o 5 de
  la sección 4.4, con su prioridad.

Esta tabla es lo que obliga a cruzar cada fuente secundaria contra
**cada** tema al que podría aplicar, no solo contra el tema para el que
se abrió originalmente esa fuente (que es como se coló el hueco de
Orrego: se leyó para otro punto, nunca se buscó "estatuto de derecho
común" en ella). Se construye leyendo cada fuente completa una vez
(extracción de texto con `fitz`/PyMuPDF, igual que en la sección 2.1) y
anotando, por búsqueda dirigida a los temas del manual, en qué páginas
aparece cada uno. El mismo patrón de "extraer y mapear primero, escribir
después" de la sección 2.2 para anexos.

### 4.4 Categorías de hallazgo (heredadas de la auditoría de Acto Jurídico)

Sobre la tabla de 4.3, revisar cada eje en tandas cortas (un eje o un
grupo chico de ejes emparentados con su misma fuente, nunca el manual
completo de una pasada) contra estas siete categorías. Si una categoría
no tiene hallazgos en esa tanda, se deja **"Sin hallazgos."** explícito,
nunca se omite la categoría:

1. **Profundidad insuficiente** — un argumento, una excepción o un matiz
   de alguna fuente (principal o secundaria) que no llegó al manual.
2. **Falta de ejemplos** — un ejemplo concreto de la fuente, ausente.
3. **Jurisprudencia en la fuente, ausente en el manual** — un fallo real
   (rol/tribunal/fecha o cita de RDJ) que la fuente trae y el manual no.
4. **Dato de grado marcado en la fuente, ausente en el manual** — una
   pregunta clásica de examen oral que la fuente señala como tal y el
   manual no destaca en ningún recuadro.
5. **Debate doctrinal aplanado** — cuando dos o más fuentes tratan la
   misma controversia con autores distintos y el manual solo usó la
   lista de una de ellas, o cuando el manual toma partido sin mostrar
   ambas tesis con la misma extensión que la fuente. **No mezclar los
   autores de fuentes distintas en una sola lista compuesta**: si Boetsch
   atribuye una tesis a Stitchkin y Alessandri, y Orrego la misma tesis a
   Claro Solar, Alessandri, Meza Barros y Abeliuk, eso se reporta como
   dos atribuciones distintas de dos fuentes distintas (posible punto a
   decidir por Laura), nunca se funde en una lista única sin fuente
   verificable para la combinación completa.
6. **Coherencia estructural** — numeración, orden, contenido bien escrito
   pero en el eje o sección equivocada.
7. **Contenido del manual sin respaldo en fuente** — la contracara de
   todo lo anterior: una afirmación, cita o atribución del manual que no
   se pudo encontrar en ninguna fuente disponible. Es la categoría que
   detecta alucinación real, a diferencia de las seis anteriores que
   detectan omisión.

Cada hallazgo lleva prioridad **alto/medio/bajo**, igual criterio que la
auditoría de Acto Jurídico: alto cuando falta algo que sostiene la tesis
central de la sección (ej. jurisprudencia que respalda directamente un
punto clave), medio para vacíos de fondo puntuales, bajo para matices
menores (una referencia comparada, un ejemplo adicional al ya existente).

### 4.5 Reporte, no reescritura

El resultado es un documento nuevo, `docs/auditoria_<materia>_<fecha>.md`,
con el mismo formato que `docs/auditoria_acto_juridico_2026-08-13.md`:
resumen ejecutivo con tabla de tandas × prioridad, luego una sección por
tanda con las 7 categorías (explícito "Sin hallazgos." donde corresponda)
y un resumen de tanda al cierre. **Es un reporte de brechas, no una
reescritura del manual**: la corrección del HTML es una fase 2 aparte,
que Laura prioriza y aprueba tanda por tanda, igual que se hizo con Acto
Jurídico (ejes N, H, C y B corregidos primero por concentración de
jurisprudencia real, el resto pendiente). No se agrega jurisprudencia ni
doctrina de conocimiento general del modelo: todo hallazgo debe señalar
contenido que ya existe en una fuente concreta de Laura y que el manual
omitió, o marcar explícitamente si no se pudo verificar contra ninguna.
