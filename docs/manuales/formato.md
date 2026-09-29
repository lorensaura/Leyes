# Formato de los manuales

> Cómo se ve un manual: numeración, enumeraciones, negrita y cursiva,
> jerarquía de lectura, puntuación, código de los recuadros y hoja de
> estilos. **Cuándo** usar cada recuadro y con qué criterio se escribe
> está en `guia-editorial.md`; cómo se construye un manual, en
> `proceso.md`. El porqué de cada regla, con fechas, está en
> `decisiones.md`.

El estándar de densidad y de recuadros es el de Responsabilidad
Contractual y Precontractual. La numeración y las etiquetas de los
encabezados siguen a Acto Jurídico, donde nació la escalera.

---

## 1. Numeración: la escalera

Todo manual nuevo usa esta escalera, de arriba hacia abajo. Ningún nivel
se inventa fuera de ella.

| Nivel | Marcador | Qué es | Etiqueta HTML | Cómo se ve |
|---|---|---|---|---|
| 1 | `I.`, `II.` | Capítulo (el tema del manual) | `h1` | **Negro**, centrado, **negrita**, MAYÚSCULA, título subrayado (1.35rem). Salto de página antes |
| 2 | `A.`, `B.` | Tema (subtema del capítulo) | `h2 class="grupo"` | Negro, centrado, negrita, MAYÚSCULA, **sin subrayado** (1.3rem) |
| 3 (opcional) | `A.1`, `A.2` | Institución (subtema del subtema, solo si hace falta) | `h2 class="inst"` | Negro, centrado, MAYÚSCULA, **sin negrita y sin subrayado**, algo más chico que el tema (1.2rem). Nivel nuevo: Acto Jurídico todavía no lo usa |
| 4 | `1.`, `2.` | Punto | `h2` (sin clase) | **Rojo**, a la izquierda, **negrita**, MAYÚSCULA, título subrayado (1.1rem) |
| 5 | `1.1.`, `2.1.` | Subpunto con título | `h3` | A la izquierda, **negrita**, título subrayado, mayúscula solo en la inicial |
| 6a | `(i)`, `(ii)` | Elemento que abre una **clasificación nueva** | `.enum-i` | **Negrita**, sin subrayado, mayúscula solo en la inicial |
| 6b | `(i)`, `(ii)` | Elemento de una **lista de requisitos o circunstancias** | `.enum-i` + clase `lista` | Título **subrayado**, sin negrita, mayúscula solo en la inicial |
| 7 | `a)`, `b)` | Subelemento | `.enum-a` | Título subrayado, sin negrita, mayúscula solo en la inicial |
| 8 | `a.1)`, `a.2)` | Último nivel | `.enum-c` | *Cursiva* |

**Por qué estas etiquetas:** son las que ya usa Acto Jurídico. Además, el
punto `1.` queda en `h2`, igual que en los manuales de Responsabilidad, y
el subpunto en `h3`, así que el lector en línea (`app/manuales.html`) y
los scripts que arman secciones a partir de `h1`/`h2` tratan igual los
manuales antiguos y los nuevos. `h4` y `h5` no se usan en contenido nuevo.

Es el aspecto que ya tiene Acto Jurídico, que es el modelo visual. Los
niveles 1 a 4 van en la fuente sans serif de los títulos; del 5 en
adelante, en la serif del cuerpo. El rojo de los títulos queda **solo en
el punto** (`1.`); capítulo, tema, institución y subpunto van en negro.
Los artículos siguen en rojo y los recuadros mantienen sus colores.

**Manuales antiguos:** usan otras combinaciones (letra como `h1`, `N.M`
como `h3`, `h4` para `a)`). Se mantienen como están hasta que se revise
cada uno.

Los marcadores se ordenan **por profundidad**, no por el tipo de lista:
bajo un subpunto `1.1.`, el primer nivel siempre es `(i)`, el siguiente
siempre es `a)` y el último `a.1)`. Esto reemplaza la regla anterior que
elegía `(i)` para requisitos y `a.` para categorías.

Lo que sí depende del tipo de lista es el **estilo** de `(i)`, no el
marcador:

- **Clasificación nueva** (el `(i)` abre categorías o clases que después
  se desarrollan, por ejemplo "(i) Actos unilaterales, (ii) Actos
  bilaterales"): **negrita, sin subrayado** (`.enum-i`).
- **Lista de requisitos o circunstancias** (el `(i)` solo enumera
  condiciones, casos o elementos de algo ya definido, por ejemplo los
  requisitos del error): **basta el subrayado del título, sin negrita**
  (`.enum-i lista`).
- Si hay duda, se deja `[FALTA: ¿clasificación o lista?]` para que Laura
  decida.

**¿`1.1.` o `(i)`?** Prueba: *¿la parte tiene título propio y un
desarrollo de varios párrafos, o enumeraciones propias debajo?* Entonces
es `1.1.` (por ejemplo, "2.1. Seriedad de la voluntad"). Si es uno de los
elementos de una enumeración introducida por una frase que termina en dos
puntos (requisitos, clases, casos), es `(i)`. Un punto `1.` sin
subdivisiones con título pasa directo a `(i)`.

### 1.1 Regla de ascenso (cuándo se usa A.1)

El nivel `A.1` es el que evita armar un índice a mano en cada manual. Se
decide con esta regla, siempre la misma:

1. **Una parte sube a `A.1` cuando es una institución con desarrollo
   propio.** Prueba: *¿esta parte tiene su propio "1. Concepto"?* La
   nulidad relativa sí: va como `B.1`. El menor adulto no: queda como
   `a)`.
2. **Todo o nada dentro de la letra.** Si una letra tiene `B.1`, todo lo
   que depende de ella va en `B.1`, `B.2`... Nunca se mezclan `B.1` y
   puntos `1.` sueltos al mismo nivel. Lo que es común a todas las
   instituciones de la letra (por ejemplo, lo que aplica a ambas
   nulidades) va directamente bajo `B.`, sin número, antes de `B.1`.
3. **La numeración `1.`, `2.` vuelve a empezar** dentro de cada `A.1`, o
   dentro de la letra si esa letra no tiene `A.1`.
4. **Nunca `a.1.1)`.** Si algo necesita bajar de `a.1)`, no se crea un
   nivel nuevo: es la señal de que un nivel superior debía subir (un
   elemento a `1.1.`, o una parte de la letra a `A.1`).

Ejemplo:

```
I.  Ineficacia
    A.  Inexistencia
        1. Concepto
        2. ...
    B.  Nulidad
        (texto común a ambas nulidades, sin número)
        B.1  Nulidad relativa
             1. Concepto
             2. Causales
                2.1. Incapacidad relativa
                     (i) Menores adultos
                     (ii) Disipadores interdictos
                2.2. Vicios del consentimiento
                     (i) Error
                         a) Error de hecho
                            a.1) Error esencial
        B.2  Nulidad absoluta
             1. Concepto
             ...
```

Inexistencia va directo a `1.` porque no contiene instituciones con
desarrollo propio; Nulidad sube a `B.1` y `B.2` porque contiene dos.

**Manuales existentes:** no se renumeran. Cuando se revise uno (por
ejemplo Acto Jurídico, cuyo índice Laura armó a mano), se compara contra
esta regla y se **listan las diferencias** para que Laura decida. No se
cambia nada sin su aprobación.

**Estado de las herramientas frente a la escalera (revisado
2026-09-29):**

- **PDF** (`scripts/generar_pdf_manual.py`): imprime la página con su
  propia hoja de estilos, así que reconoce todos los niveles sin ajustes.
- **Índice**: se escribe a mano, con los números como texto (1.4).
- **Lector en línea** (`app/manuales.html`): tiene reglas para todos los
  niveles y recuadros de este documento desde el 2026-09-29.
- **Anclas de Justiniano** (`scripts/agregar_anclas_manuales.js`, que
  copia la lógica de `scripts/extraer_contenido_interrogador.js`): tratan
  `h2.grupo`, `h2.inst` y `h2` como secciones del mismo nivel, y **no
  entienden los números romanos** (asignan letras sin sentido y pueden
  repetir ids). Pendiente de ajustar en los dos scripts, solo cuando un
  manual nuevo entre al Interrogador.

### 1.2 Capítulos romanos e ids

- Cada capítulo romano es un `h1`, con salto de página antes, igual que
  cualquier otro capítulo.
- Cuando un eje de un manual antiguo tiene varios bloques temáticos
  distintos en la fuente (típicamente "aspectos generales" y
  "clasificación"), cada bloque pasa a ser su propio capítulo romano.
- **Ids con prefijo `c`, nunca `s` + romano**, porque los ejes antiguos
  ya usan `sA`...`sZ` (incluido `sI`) y chocarían. Patrón:
  - Capítulo: `cI`, `cII`
  - Tema: `cII-A`
  - Institución: `cI-B1`
  - Punto: `cII-A-1`, o `cI-B1-2` dentro de una institución
  - Subpunto: `cII-A-4-1` (el 4.1. del tema A)
- La secuencia de letras va A, B, C... sin saltarse ninguna.

### 1.3 Espaciado y subrayado después del número

En **todo** encabezado o enumeración numerada (`h1`, `h2.grupo`,
`h2.inst`, `h2`, `h3`, `.enum-i`, `.enum-a`, `.enum-c` y sus versiones en
la misma línea de la sección 2):

- Después del número, letra o romano van **cuatro espacios duros**
  (`&nbsp;&nbsp;&nbsp;&nbsp;`), no un espacio simple.
- El número y sus espacios van en `<span class="num">`; el título, en
  `<span class="tit">`. El subrayado va **solo en las palabras del
  título**, nunca en el número.
- El contenedor lleva `style="text-decoration:none"` (el subrayado de un
  elemento padre se propaga y el `.num` no puede anularlo):

```html
<h1 id="cI" style="text-decoration:none"><span class="num">I.&nbsp;&nbsp;&nbsp;&nbsp;</span><span class="tit">Ineficacia</span></h1>
<h2 id="cI-B" class="grupo" style="text-decoration:none"><span class="num">B.&nbsp;&nbsp;&nbsp;&nbsp;</span><span class="tit">Nulidad</span></h2>
<h2 id="cI-B1" class="inst" style="text-decoration:none"><span class="num">B.1&nbsp;&nbsp;&nbsp;&nbsp;</span><span class="tit">Nulidad relativa</span></h2>
<h2 id="cI-B1-1" style="text-decoration:none"><span class="num">1.&nbsp;&nbsp;&nbsp;&nbsp;</span><span class="tit">Concepto</span></h2>
<h3 id="cI-B1-2-1" style="text-decoration:none"><span class="num">2.1.&nbsp;&nbsp;&nbsp;&nbsp;</span><span class="tit">Seriedad de la voluntad</span></h3>
```

Todo `h1`, `h2` y `h3` lleva su número: no hay subtítulos sin numerar.
Las mayúsculas de los niveles 1 a 4 las pone la hoja de estilos: en el
HTML el título se escribe normal ("Concepto", no "CONCEPTO").

### 1.4 Índice

El índice de un manual nuevo lista los niveles 1 a 5: capítulos (`I.`),
temas (`A.`), instituciones (`A.1`), puntos (`1.`) y subpuntos (`1.1.`). Los manuales
antiguos que solo listan el nivel superior se completan cuando se
revisen.

**Los números del índice se escriben como texto**, igual que en el
encabezado, dentro de listas sin numeración automática. La numeración
automática de las listas no puede mostrar `A.1` ni `1.1.`. El índice se
escribe a mano (ningún script lo genera), así que al agregar o mover un
encabezado se actualiza también su línea del índice.

```html
<div class="toc">
<strong>Índice</strong>
<ol class="toc-lista">
  <li><a href="#cI"><span class="num">I.</span> Ineficacia</a>
    <ol class="toc-lista">
      <li><a href="#cI-B"><span class="num">B.</span> Nulidad</a>
        <ol class="toc-lista">
          <li><a href="#cI-B1"><span class="num">B.1</span> Nulidad relativa</a>
            <ol class="toc-lista">
              <li><a href="#cI-B1-2"><span class="num">2.</span> Causales</a>
                <ol class="toc-lista">
                  <li><a href="#cI-B1-2-1"><span class="num">2.1.</span> Incapacidad relativa</a></li>
                </ol>
              </li>
            </ol>
          </li>
        </ol>
      </li>
    </ol>
  </li>
</ol>
</div>
```

---

## 2. Enumeraciones dentro de un punto

**Regla permanente, en todos los manuales.** Nunca `<ul><li>` con viñetas
para requisitos, características o categorías legales. Nunca, tampoco,
un párrafo corrido con los puntos separados por punto y coma ("son
requisitos: que..., que..., y que..."): obliga a releer la frase para
separar los puntos.

Cada vez que se enumeran requisitos, elementos, soluciones, posturas o
pasos:

1. La frase que introduce la enumeración **termina en dos puntos**, en
   su propio párrafo.
2. Cada punto va **en su propio párrafo**. El marcador depende de la
   profundidad (sección 1): `(i)`, luego `a)`, luego `a.1)`. Cómo se
   escribe depende del largo de su explicación:
   - **Explicación de menos de dos líneas** (unos 200 caracteres): va
     **en la misma línea**, después del título y dos puntos. El título
     lleva el estilo de su nivel; los dos puntos y el texto que sigue, no.
     Clases: `.enum-i-run`, `.enum-a-run`, `.enum-c-run`, dentro de un
     `<p>`.
   - **Explicación de dos líneas o más:** el título va solo, como bloque
     (`.enum-i`, `.enum-a`, `.enum-c`), y la explicación en un párrafo
     aparte debajo.
   - Si el punto es solo una oración corta sin título (como un requisito
     de una frase), va como texto corrido con el marcador al inicio en
     `<span class="num">`.
   - `.enum-a-inline` (etiqueta en cursiva con dos puntos) queda solo en
     los manuales antiguos; en contenido nuevo se usa la versión en la
     misma línea de cada nivel.

   ```html
   <!-- Explicación corta: misma línea -->
   <p><span class="enum-a-run" style="text-decoration:none"><span class="num">a)&nbsp;&nbsp;&nbsp;&nbsp;</span><span class="tit">Menores adultos</span></span>: actúan válidamente representados o autorizados por su representante legal.</p>

   <!-- Explicación larga: título solo y párrafo aparte (clasificación: negrita) -->
   <span class="enum-i"><span class="num">(i)&nbsp;&nbsp;&nbsp;&nbsp;</span><span class="tit">Manifestación de voluntad expresa</span></span>
   <p>Es aquella que se formula en términos explícitos y directos...</p>

   <!-- Lista de requisitos o circunstancias: subrayado, sin negrita -->
   <p><span class="enum-i-run lista" style="text-decoration:none"><span class="num">(i)&nbsp;&nbsp;&nbsp;&nbsp;</span><span class="tit">Que sea real</span></span>: ...</p>
   ```
3. **Dentro de cada punto, se resalta solo la palabra o frase clave,
   nunca el punto completo.** Si todo resalta, nada resalta. Correcto:
   "Que se **ejerza un derecho**, a lo menos con apariencia de
   **legalidad**."
4. Cuando la enumeración usa ordinales ("la primera... la segunda...",
   "en primer lugar..."), los ordinales van en negrita.

---

## 3. Negrita y cursiva

Se aplica a toda la prosa del manual, dentro y fuera de enumeraciones y
citas. La pregunta que decide no es "¿es un concepto importante?" (casi
todo lo es), sino: **¿esta frase es la protagonista de su punto u
oración, o es un detalle que apoya una idea más grande?**

- **Negrita**: la frase es el término o la regla que se está definiendo o
  nombrando; responde "¿qué es esto?" o "¿qué establece este artículo?".
  Ejemplos reales:
  - "esta clasificación se funda en la **fijeza**"
  - "Muebles son las cosas que pueden **transportarse de un lugar a
    otro**" (la frase es la definición legal)
  - "se dividen en **semovientes** y **cosas inanimadas**" (las dos
    categorías que el punto introduce)
  - "el art. 580... **según lo sea la cosa en que han de ejercerse**"
    (el criterio operativo del artículo)
  - "Hay **derechos reales** que..." / "Tratándose de **derechos
    personales**..." (el sujeto de todo el párrafo)
- **Cursiva**: la frase está dentro de una oración cuyo tema principal es
  otro; describe, matiza, ejemplifica o precisa algo secundario.
  Ejemplos reales:
  - "sea moviéndose ellas *a sí mismas*... sea que solo se muevan por
    una *fuerza externa*" (el modo de movimiento es un detalle de la
    definición de mueble)
  - "Los *productos de los inmuebles*, y las *cosas accesorias a
    ellos*..." (describe qué cubre el artículo; el efecto que establece
    va en negrita más adelante)
  - "en las *obligaciones de dar*... En las *obligaciones de hacer y de
    no hacer*..." (subcasos de una regla que ya llevó su negrita)
- **Prueba práctica:** si de un punto o cita solo quedara el texto en
  negrita, debería seguir respondiendo "qué es esto" o "qué establece la
  norma". Si lo que queda es apenas un ingrediente, probablemente es
  cursiva.
- Puede haber más de una negrita en una cita cuando dos frases son partes
  co-iguales de la misma definición (el art. 568 define inmueble con dos
  criterios alternativos, ambos en negrita). Si hay un concepto
  principal y un detalle, el principal va en negrita y el detalle en
  cursiva.
- Como referencia, no más de dos negritas por párrafo corriente (fuera de
  los bloques de la sección 4). Más que eso diluye el resaltado.

---

## 4. Jerarquía de lectura: negritas e interlineados

El objetivo es que el estudiante encuentre de un vistazo lo importante:
los artículos, las definiciones y los términos clave. Cada tipo de
elemento tiene un tratamiento distinto y fijo:

| Elemento | Tratamiento |
|---|---|
| Artículo citado dentro del texto | Rojo y negrita: `<span class="art">artículo 1489</span>`, cubriendo la palabra y el número |
| **Artículo transcrito completo** | Bloque propio `.ley`: párrafo aparte, con sangría a ambos lados e interlineado más abierto. Empieza con el número en rojo y negrita (`<span class="ley-num">Art. 1681.</span>`) y el texto va entre comillas rectas |
| **Definición del punto** (legal o doctrinal) | Bloque propio `.definicion`: párrafo aparte, con un filete fino a la izquierda e interlineado más abierto. El término definido va en negrita. Si es una definición doctrinal, cita textual con su autor |
| Término protagonista | Negrita (sección 3) |
| Detalle o matiz | Cursiva (sección 3) |
| Autor citado | **NEGRITA Y MAYÚSCULA** (`<strong>ALESSANDRI</strong>`) |

Reglas de uso:

- `.ley` es solo para artículos transcritos **completos** o incisos
  completos. Un fragmento breve citado dentro de una oración va entre
  comillas en el texto corrido, con su `span.art`.
- `.definicion` es solo para **la** oración que define el concepto del
  punto, normalmente una por punto. No se usa para cualquier frase
  importante.
- Dentro de `.ley` y `.definicion`, la negrita y la cursiva siguen la
  sección 3.
- Funciona en blanco y negro: la separación depende del espacio y del
  peso de la letra, no solo del color.

```html
<p class="ley"><span class="ley-num">Art. 1681.</span>"Es nulo todo acto o contrato a que falta alguno de los requisitos que la ley prescribe para el <strong>valor del mismo acto o contrato</strong>, según su especie y la calidad o estado de las partes. La nulidad puede ser <strong>absoluta</strong> o <strong>relativa</strong>."</p>

<p class="definicion">La <strong>nulidad relativa</strong> es la sanción legal de los actos o contratos que adolecen de un vicio establecido en consideración a la <em>calidad o estado de las partes</em>.</p>
```

`muestra_jerarquia.png` muestra los bloques `.ley` y `.definicion`; sus
encabezados son del diseño del 2026-09-28 (capítulo en rojo), ya
reemplazado por el aspecto de Acto Jurídico.

---

## 5. Transcripción de artículos

- Cuando el texto dice "lo define el art. X", "el art. X dispone
  que..." o equivalente, se transcribe el artículo **completo y textual,
  entre comillas rectas**, en un bloque `.ley` (sección 4). Nunca una
  paráfrasis del artículo.
- Se verifica contra la fuente: los apuntes de Boetsch citan la mayoría
  de los artículos relevantes en forma textual. Buscar el número de
  artículo en el PDF fuente antes de transcribir; **nunca completar de
  memoria**.

---

## 6. Puntuación y otras convenciones fijas

- **Cero guiones largos (—)**, en ningún lado. Se reemplazan por coma,
  punto, punto y coma, dos puntos o paréntesis, según su función.
- **Cero guillemets («»).** Los artículos transcritos van entre comillas
  rectas (sección 5). Las citas textuales de fallos siguen el código del
  recuadro de Jurisprudencia (sección 7).
- **Autores:** negrita y mayúscula completa.
- **Artículos:** en rojo con `span.art`, cubriendo "artículo"/"art."/
  "arts." y el número.
- Todo en español.

---

## 7. Recuadros: código

Todos tienen el mismo formato de **dos líneas centradas**: el tipo de
recuadro (`.caja-tipo`, mayúscula, negrita, 9pt) y el título o cita
específica (`.caja-titulo`, negrita, 10pt). La única excepción es la
Pausa, que tiene su propio formato (al final de esta sección). Cuándo usar cada uno está en
`guia-editorial.md`, sección 4.

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
  <p>...</p>
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

<div class="pregunta-clasica">
  <span class="caja-tipo">Pregunta clásica</span>
  <span class="caja-titulo">¿Se pueden vender las cosas del art. 1464?</span>
  <p>...</p>
</div>

<!-- No confundir + Pregunta clásica fusionados (misma pregunta) -->
<div class="callout fusion">
  <span class="caja-tipo">No confundir<span class="sep">|</span><span class="t-pc">Pregunta clásica</span></span>
  <span class="caja-titulo">¿Se puede vender lo que no se puede enajenar?</span>
  <p>...</p>
</div>

<div class="no-olvidar">
  <span class="caja-tipo">No olvidar</span>
  <span class="caja-titulo">Plazo de la acción rescisoria</span>
  <p>...</p>
</div>

<div class="conexiones">
  <span class="caja-tipo">Conexiones</span>
  <span class="caja-titulo">Nombre del punto</span>
  <p><strong>Compraventa</strong> (<span class="art">art. 1810</span>): misma prohibición, aplicada al contrato. Revisar apunte de Compraventa, II.B (p. __).</p>
</div>
```

- **Jurisprudencia con varios fallos sobre el mismo punto:** un solo
  recuadro. Un `.caja-tipo` "Jurisprudencia" arriba y luego, por cada
  fallo, una línea `.caja-titulo` con rol, corte, fecha y tema, seguida
  de su párrafo, sin cerrar el `<div>` hasta el final.
- **Pausa (checkpoint de comprensión lectora):** va al cierre de cada
  capítulo. Es un aviso, no un recuadro de contenido: usa `.repaso` con
  un título `.titulo-bloque` y una frase que dice dónde responder. Las
  preguntas viven en la plataforma (`app/manuales.html`, dentro del
  código de la página, una lista por manual), nunca en el HTML del
  manual. Así está hoy en los tres manuales de Responsabilidad:

  ```html
  <div class="repaso">
    <span class="titulo-bloque">Pausa: Comprensión lectora</span>
    Has terminado <strong>I. Ineficacia</strong>. Responde las preguntas de comprensión lectora de este capítulo en digesto.cl.
  </div>
  ```
- **`.dato-grado` está retirado.** No se usa en contenido nuevo. Queda
  en la hoja de estilos solo para los manuales que todavía lo tienen,
  hasta su revisión (`guia-editorial.md`, sección 4.9).

---

## 8. Hoja de estilos

Base: la hoja común de los manuales. Sale de la de Contractual, con los
ajustes que se sumaron en Bienes y Acto Jurídico (spans `.num`/`.tit`,
títulos de recuadro en dos líneas), así que no es una copia literal de
ningún manual publicado. Se copia tal cual, ajustando solo el `<title>`
y, si hace falta, los colores de marca, nunca la estructura. Después de
la base va la **extensión**, que define el aspecto de cada nivel de la
escalera (sección 1), los bloques de lectura y los recuadros nuevos. En
los manuales nuevos, la extensión manda sobre la base.

Esta hoja solo se ve en el HTML abierto directo y en el PDF. El lector en
línea de la app (`app/manuales.html`) descarta el `<style>` del manual y
usa sus propias reglas (`.manual-body ...`): toda clase nueva que se
agregue aquí tiene que agregarse también allá.

La fuente de la portada (`Bebas Neue`/`Inter`) se carga con el mismo
`<link>` de Google Fonts que ya usan los manuales existentes.

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
  .repaso .titulo-bloque{font-weight:700;font-size:9pt;color:var(--accent);display:block;
    margin-bottom:.3rem;text-transform:uppercase;letter-spacing:.04em;}
  .repaso strong{color:var(--accent);font-weight:700;}

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

Extensión (va dentro del mismo `<style>`, antes de `</style>`):

```css
  /* Extensión 2026-09-28 (ajustada 2026-09-29/30): escalera de niveles, jerarquía de lectura y
     recuadros nuevos. Etiquetas como en Acto Jurídico: h1 capítulo, h2.grupo tema,
     h2.inst institución, h2 punto, h3 subpunto. Manda sobre la base en los manuales nuevos. */
  :root{
    --navy:#2C4A6E;--navybg:#EEF3F8;
    --purple:#5B3F86;--purplebg:#F4F0F8;
  }
  /* I. Capítulo (h1), 1. Punto (h2) y 1.1. Subpunto (h3): los de la base, como en Acto Jurídico
     (capítulo negro centrado y subrayado; punto rojo, a la izquierda y subrayado; subpunto serif
     en negrita y subrayado). Solo se agregan el tema y la institución. */
  /* A. Tema: negro, centrado, negrita, mayúscula, sin subrayado */
  h2.grupo{color:var(--accent2);font-size:1.3rem;text-align:center;
    text-decoration:none;margin:2.6rem 0 .9rem;}
  /* A.1 Institución: negro, centrado, mayúscula, sin negrita, sin subrayado */
  h2.inst{color:var(--accent2);font-weight:400;font-size:1.2rem;text-align:center;
    text-decoration:none;margin:2rem 0 .8rem;}
  h2.grupo .tit,h2.inst .tit{text-decoration:none;}
  /* (i) de clasificación nueva: negrita, sin subrayado */
  .enum-i,.enum-i-run{font-style:normal;font-weight:700;text-decoration:none;}
  .enum-i .tit,.enum-i-run .tit{text-decoration:none;}
  /* (i) de lista de requisitos o circunstancias: subrayado solo en el título, sin negrita */
  .enum-i.lista,.enum-i-run.lista{font-weight:400;}
  .enum-i.lista .tit,.enum-i-run.lista .tit{text-decoration:underline;}
  /* a): subrayado solo en el título, sin negrita */
  .enum-a,.enum-a-run{font-weight:400;font-style:normal;text-decoration:none;}
  .enum-a .tit,.enum-a-run .tit{text-decoration:underline;}
  /* a.1): cursiva, sin subrayado */
  .enum-c,.enum-c-run{font-style:italic;font-weight:400;text-decoration:none;}
  .enum-c .tit,.enum-c-run .tit{text-decoration:none;}
  /* Índice: números escritos como texto, sin numeración automática */
  .toc-lista{list-style:none;padding-left:1.1rem;}
  .toc > .toc-lista{padding-left:0;}
  /* Explicación corta en la misma línea: el título lleva el estilo de su nivel, el texto que sigue no */
  .enum-i-run,.enum-a-run,.enum-c-run{display:inline;}
  /* Jerarquía de lectura */
  .ley{margin:1.1rem 1.6rem;line-height:1.65;}
  .ley .ley-num{font-weight:700;color:var(--accent);margin-right:.35em;}
  .definicion{margin:1.1rem 0;padding:.15rem 0 .15rem .9rem;
    border-left:2px solid var(--light);line-height:1.65;}
  /* Recuadros nuevos */
  .pregunta-clasica{border-left:4px solid var(--navy);background:var(--navybg);padding:12px 16px;margin:1.3rem 0;}
  .pregunta-clasica .caja-tipo{color:var(--navy);}
  .fusion .t-pc{color:var(--navy);}
  .fusion .sep{color:#bbb;font-weight:400;margin:0 .7em;}
  .no-olvidar{border:2px dashed var(--orangeborder);background:var(--orangebg);padding:10px 16px;margin:1.3rem 0;}
  .no-olvidar .caja-tipo{color:var(--orange);}
  .conexiones{border-left:4px solid var(--purple);background:var(--purplebg);padding:12px 16px;margin:1.6rem 0 1.3rem;}
  .conexiones .caja-tipo{color:var(--purple);}
  .conexiones p{margin:.45rem 0;}
  @media print{
    .ley,.definicion,.pregunta-clasica,.no-olvidar,.conexiones{page-break-inside:avoid;}
  }
```

---

## 9. Notación rápida de Laura

Cuando Laura pega un tramo y lo anota a mano en vez de describir cada
cambio, usa esta notación (no es Markdown estándar; la definió ella para
este proyecto):

- `*palabra*` (un asterisco a cada lado) → **negrita**.
- `**palabra**` (dos asteriscos a cada lado) → *cursiva*.
- Guion largo entre dos oraciones → cortar ahí y empezar un **párrafo
  nuevo**. Es una instrucción, no contenido: el guion largo nunca pasa
  al HTML.
- Comillas (`"..."`) alrededor de un tramo: sí van al HTML final
  (transcripción textual, sección 5).
- Un número o letra seguido de texto entre paréntesis, ej.: "1.1. Desde
  un punto de vista objetivo (negrita y subrayado)", es una instrucción
  de **crear un encabezado nuevo** en ese punto, no texto a transcribir.
- La negrita y la cursiva se aplican tal como ella las marca, sin
  recalcularlas con la sección 3: su anotación reemplaza el criterio
  general en ese tramo.
