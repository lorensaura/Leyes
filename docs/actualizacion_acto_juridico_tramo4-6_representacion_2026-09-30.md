# Acto Jurídico — Tramo 4, sub-tramo 4.6: La representación, V.1 a V.5 (concepto a influencia de circunstancias personales)

> Informe de cambios propuestos. Sigue el método de
> `docs/manuales/actualizar-manuales-existentes.md`. No se ha tocado el
> manual todavía: este documento se detiene a la espera de la
> aprobación de Laura.

## 0. Alcance y fuentes

- Fuente principal: Boetsch `principal_16` (el mismo PDF de 4.5,
  "Otras causales de ineficacia" y "La representación", pp. 186 a 208
  de 221). Este tramo cubre **V.1 a V.5** (pp. 190-199 de 221; el punto
  5.5 termina a mitad de la p. 200, se incluyó completo). El punto
  "V.6. Requisitos necesarios para que exista representación..."
  empieza justo después, en la p. 200: es la fuente del sub-tramo 4.7,
  no se toca acá.
- Anexo secundario (`Anexo_secundario_AJ_ elementos principales e
  ineficacia.pdf`, Bozzo e Ibarra): revisado completo por búsqueda de
  texto. Solo tiene tres menciones sueltas de la palabra
  "represent-" (ninguna es una sección dedicada a la institución): no
  aporta contenido de fondo a este tramo. El anexo trata ineficacia
  jurídica, no la representación como mecanismo de formación del acto.
- Manual actual: `04_Acto_Juridico_Manual.html`, líneas 3082-3167
  (`id="cV"` a `id="cV-5-5"`, justo antes de `id="cV-6"`).
- **Nota sobre la base de esta rama:** se sigue trabajando en
  `worktree-acto-juridico-tramo4-5-otras-causales`, que trae también
  los cambios de 4.2, 4.3, 4.4 y 4.5, todavía sin mergear. El capítulo
  V no fue tocado por ninguno de esos cinco tramos.

## 1. Qué se hizo para este informe

- Extracción completa de `principal_16` con `fitz`, páginas 190-201 (la
  200-201 para confirmar dónde termina 5.5 y empieza el punto 6, fuera
  de este tramo).
- Lectura completa del capítulo V actual del manual (líneas 3082-3167).
- A diferencia de los tramos 4.1-4.5, **este punto de partida no viene
  de una reescritura anterior de esta sesión**: es contenido que ya
  estaba en el manual, en el formato nuevo (etiquetas `h1`/`h2`/`h3`
  correctas, `span.art`, cajas `.callout` y `.jurisprudencia`), pero
  nunca auditado unidad por unidad contra Boetsch. El inventario de
  abajo es la primera vez que se hace esa comparación.
- Verificación artículo por artículo contra `Apuntes/Codigo Civil
  Chileno.pdf` de los 11 artículos del Código Civil citados en el
  tramo (43, 671, 672, 673, 678, 721, 1004, 1448, 2116, 2128, 2151):
  **los 11 coinciden exactamente**, con una salvedad en el art. 43 (ver
  3.3). Dos citas no son del Código Civil y no se pueden verificar con
  esta fuente: art. 15 inc. 2° de la Ley de Registro Civil y art. 20 de
  la Ley de Matrimonio Civil (en V.2). El art. 659 que cita Boetsch
  para el partidor es del **Código de Procedimiento Civil**, no del
  Código Civil (el art. 659 del Código Civil trata de la accesión de
  cosas muebles, un tema distinto); el manual ya lo cita correctamente
  como "art. 659 C.P.C.", sin error.
- Chequeo mecánico (balance de etiquetas, guiones largos, párrafos de
  más de 1.200 caracteres) corrido **sobre el capítulo V actual,
  antes** de proponer cambios: balance de etiquetas OK, cero guiones
  largos y guillemets, pero **un párrafo de 1.288 caracteres** en V.3.3
  (Mandato y representación voluntaria), que ya excedía el máximo antes
  de tocarlo.

## 2. Inventario unidad por unidad

| Unidad | Fuente | Manual actual | Estado |
|---|---|---|---|
| V.1 Concepto | Boetsch p. 190 | Presente la primera definición y la idea de que los efectos se radican en el representado; falta la segunda definición alternativa que también trae Boetsch | **Parcial** (3.1) |
| V.2 Utilidad y ámbito de aplicación | Boetsch pp. 190-191 | Presente en sustancia; faltan dos ejemplos puntuales de la fuente (sordomudos, procuradores) | **Parcial** (3.2) |
| V.3.1 Conceptos generales | Boetsch p. 191 | Presente, completo | **Está** |
| V.3.2 Clases de representación, (i) legal | Boetsch pp. 191-192 | Presente el concepto y los ejemplos (juez, partidor); falta el párrafo sobre representación de origen judicial y la precisión de que los curadores dativos también son representantes legales | **Parcial** (3.3) |
| V.3.2 Clases de representación, (ii) voluntaria | Boetsch p. 192 | Presente, completo | **Está** |
| V.3.3 Mandato y representación voluntaria | Boetsch pp. 192-194 | Presente el núcleo de las tres conclusiones, resumido; falta la definición de agencia oficiosa y el párrafo final sobre el mandatario que obra a nombre propio (quién es titular de los derechos frente a terceros); además, el párrafo actual mide 1.288 caracteres, sobre el máximo | **Parcial** (3.4) |
| V.4.1 Teoría de la ficción | Boetsch p. 194 | Presente, completo | **Está** |
| V.4.2 Teoría del nuntius | Boetsch pp. 194-195 | Presente, completo | **Está** |
| V.4.3 Teoría de la cooperación de voluntades | Boetsch p. 195 | Presente, completo | **Está** |
| V.4.4 Teoría de la representación modalidad | Boetsch pp. 195-197 | Presente la explicación y ALESSANDRI; la caja de jurisprudencia solo recoge el tramo final del fallo (la conclusión), no el razonamiento donde la Corte descarta expresamente las tres teorías anteriores | **Parcial** (3.5) |
| V.5.1 En relación a la capacidad | Boetsch p. 197 | Presente en sustancia; falta la razón de por qué el representado debe ser capaz en la voluntaria, y la consecuencia (nulidad) de las obligaciones del mandatario incapaz sin autorización | **Parcial** (3.6) |
| V.5.2 En relación con las formalidades habilitantes | Boetsch pp. 197-198 | Presente, completo | **Está** |
| V.5.3 En relación con los vicios del consentimiento | Boetsch p. 199 | Presente el contenido de las tres distinciones de VIAL, en un párrafo corrido; falta la oración introductoria que contrasta las teorías, y el formato de lista que usa el manual en otros puntos similares | **Parcial** (3.7) |
| V.5.4 En relación a la buena o mala fe | Boetsch p. 199 | Presente el núcleo; falta la oración introductoria con el ejemplo posesorio | **Parcial** (3.8) |
| V.5.5 En relación al principio *nemo auditur propiam turpitudinem allegans* | Boetsch pp. 199-200 | Presente el núcleo y la solución de la Corte Suprema; falta la mención de que el punto fue objeto de discusión doctrinal y jurisprudencial, y la extensión final a la causa u objeto ilícito | **Parcial** (3.9) |

**Conclusión del inventario:** a diferencia de 4.1-4.5, acá no hubo que
reescribir contenido comprimido ni corregir errores de fondo: el
capítulo V ya estaba en el formato nuevo y fiel a Boetsch en su
estructura. Lo que falta es contenido puntual que la versión actual
resumió de más, en casi todas las unidades. Es más granular que los
tramos anteriores, pero cada punto es menor por separado.

## 3. Cambios propuestos

### 3.1 Completar V.1 (Concepto) con la segunda definición de Boetsch

Boetsch trae dos definiciones de representación; el manual solo tiene
la primera.

> Al final del párrafo de V.1, después de la oración sobre el art.
> 1448, agregar: "También se la ha definido, en términos más simples,
> como la institución jurídica en cuya virtud los efectos del acto que
> celebra una persona que actúa a nombre o en lugar de otra se radican
> en forma inmediata y directa en esta última, como si ella misma lo
> hubiera celebrado."

### 3.2 Completar V.2 (Utilidad y ámbito) con dos ejemplos de la fuente

> En la primera oración, después de "absolutamente incapaces", agregar
> el paréntesis: "(impúberes, dementes, sordomudos que no pueden darse
> a entender por escrito)".

> En la oración sobre representación voluntaria, cambiar "como el
> abogado en un pleito" por "como el abogado o el procurador en un
> pleito".

### 3.3 Completar V.3.2 (i) con el párrafo sobre representación de origen judicial

Boetsch agrega una precisión que el manual no tiene: cuando el
carácter de representante viene de una resolución judicial (el juez en
las ventas forzadas, el partidor en las particiones), sigue siendo la
ley la que atribuye ese carácter, no el juez; y por eso los curadores
dativos también son representantes legales y no "judiciales", aunque
los nombre un juez.

> Al final del párrafo de V.3.2 (i), agregar: "Cuando el carácter de
> representante emana de una resolución judicial, como en los dos
> casos anteriores, es igualmente la ley la que se lo atribuye a la
> persona designada: el juez solo determina quién ocupa ese lugar.
> Sostener lo contrario, esto es, que toda persona nombrada por el juez
> ejerce una representación de origen judicial y no legal, llevaría a
> negarle ese carácter a los curadores dativos, en circunstancias que
> el <span class="art">art. 43</span> los incluye expresamente entre
> los representantes legales."

De paso, una corrección menor de actualidad legislativa: el manual
dice "al padre o madre" al parafrasear el art. 43; desde la reforma de
la Ley 21.400 (2021), el texto vigente dice "uno o ambos progenitores"
(lenguaje neutro para la corresponsabilidad parental, ya no distingue
quién es padre o madre). Propongo actualizar la paráfrasis a "a uno o
ambos progenitores" para que coincida con el texto hoy vigente.

### 3.4 Completar V.3.3 (Mandato y representación voluntaria) y dividir el párrafo largo

Este punto necesita tres cambios: (a) agregar la definición de agencia
oficiosa que trae Boetsch entre paréntesis, (b) dividir el párrafo
actual (1.288 caracteres, sobre el máximo) en dos, en el punto natural
donde Boetsch pasa de explicar los conceptos a sacar las conclusiones,
y (c) agregar al final de la caja "No confundir" la frase que falta
sobre quién es titular de los derechos frente a terceros.

> Párrafo actual (V.3.3, después del título) se reemplaza por dos:

```html
<p>El mandato es el contrato en que una persona (el mandante) confía la gestión de uno o más negocios a otra (el mandatario), que se hace cargo de ellos por cuenta y riesgo de la primera (<span class="art">art. 2116</span>). Aunque relacionados, mandato y apoderamiento son conceptos distintos: el mandato es una relación contractual, mientras que el apoderamiento es un acto jurídico <strong>unilateral</strong> por el que una persona confiere a otra la facultad de representarla. La representación es, además, independiente del mandato: puede haber mandato sin representación (si el mandatario obra a su propio nombre) y representación sin mandato (en la representación legal, o en la agencia oficiosa, cuasicontrato por el cual quien administra sin mandato los negocios de otra persona se obliga para con ella, y la obliga en ciertos casos).</p>

<p>De esta independencia se siguen dos precisiones: la representación voluntaria no supone necesariamente un mandato, porque el poder de representar puede existir antes de que el mandato se perfeccione, aunque otorgarlo ya implica ofrecer, al menos tácitamente, la celebración de uno; pero, aun pudiendo el apoderamiento preceder al mandato como acto separado, no puede concebirse el <em>ejercicio</em> del poder desligado del cumplimiento del mandato mismo. Como esa facultad de representar no requiere mención especial para entenderse conferida, se concluye que la representación es de la <strong>naturaleza</strong> del mandato, aunque no de su esencia.</p>
```

(799 y 627 caracteres respectivamente, ambos bajo el máximo.)

> Caja "No confundir": agregar al final la oración: "Frente a los
> terceros, el mandatario es el titular de los derechos emergentes del
> acto que celebró; frente al mandante, en cambio, sigue siendo su
> mandatario."

### 3.5 Enriquecer la caja de jurisprudencia de V.4.4 con el razonamiento que descarta las otras tres teorías

La caja actual solo recoge la conclusión del fallo. Antes de llegar a
ella, la Corte repasa y descarta expresamente las tres teorías de
V.4.1-4.3 (ficción, nuntius, cooperación de voluntades), lo que conecta
directamente este punto con los tres anteriores.

> Al inicio del contenido de la caja de jurisprudencia (antes de "Sobre
> la base de una concepción objetiva..."), agregar: "Ante la pregunta
> de cuál es la voluntad que contrata, la del representante o la del
> representado, la Corte repasa las teorías: la de la ficción (el
> representado manifiesta su voluntad por una ficción legal,
> transportada por el representante), la del <em>nuntius</em> o
> mensajero (el representante solo porta o transmite la voluntad
> ajena) y la de la cooperación de voluntades (intervienen ambas).
> Descarta las tres por incurrir en una confusión entre el acto de
> apoderamiento y el acto representativo, y sobre todo por su
> dificultad para explicar la representación legal, donde no hay
> capacidad del representado que pudiera ser transportada o que
> pudiera cooperar."

No se encontró el rol de este fallo (Corte Suprema, 9 de enero de
2017) por búsqueda web: Boetsch no lo cita y las búsquedas no dieron
con él. Queda pendiente si Laura lo tiene o prefiere dejarlo sin rol
(la caja igual califica para tener jurisprudencia, porque el fallo está
desarrollado, no necesita rol además).

### 3.6 Completar V.5.1 (capacidad) con la razón y la consecuencia que faltan

> En la oración sobre la representación voluntaria, después de
> "porque la capacidad es requisito de la eficacia del apoderamiento",
> agregar: "si el representado fuera incapaz, el poder de
> representación no sería válido".

> Al final del párrafo, después de "sigan las reglas generales de
> capacidad", agregar: ": serán nulas, si se contrajeron sin la
> autorización de su representante legal (<span class="art">art.
> 2128</span>)".

### 3.7 Completar V.5.3 (vicios del consentimiento): oración introductoria y formato de lista

Boetsch contrasta primero las teorías (bajo ficción o nuncio, los
vicios solo importan si afectan al representado; bajo la modalidad,
solo importan si afectan al representante) y después da las tres
distinciones de VIAL. El manual solo tiene las distinciones, resumidas
en un párrafo corrido. Propongo agregar el contraste y convertir las
tres distinciones al formato de lista con letras que ya usa el manual
en otros puntos (por ejemplo, las contraescrituras del tramo 4.3).

> Párrafo actual de V.5.3 se reemplaza por:

```html
<p>La aceptación de la teoría de la ficción o del nuncio llevaría a concluir que el error, la fuerza o el dolo solo tienen relevancia en la medida en que afecten al representado; la teoría de la modalidad, en cambio, lleva a concluir que esos vicios solo son relevantes en cuanto afecten al representante. Sobre esa base, VIAL propone las siguientes distinciones:</p>

<span class="enum-a lista">a) El error del representante vicia el consentimiento siempre que dicho error sea también relevante para el representado.</span>
<p>Por ejemplo, A da poder a B para que le compre un reloj, siéndole indiferente el material. Si B lo compra creyendo que es de oro y luego resulta ser de bronce, ese error sustancial de B no invalida el contrato, porque no es relevante para A, la parte a quien afectan sus resultados.</p>

<span class="enum-a lista">b) La fuerza o el dolo determinante que se ejerce sobre el representante vicia el consentimiento y permite rescindir el contrato en que existió el vicio.</span>

<span class="enum-a lista">c) El error relevante del representado, o la fuerza o el dolo que se hubiera ejercido sobre él, hace anulable el poder y, a través de este, el acto representativo.</span>
```

(Uso `enum-a lista` porque son distinciones/argumentos, no una
clasificación que abre con letra en negrita; sigue la convención de
`decisiones.md`. Si Laura prefiere mantenerlo en prosa corrida, se
puede dejar solo con la oración introductoria agregada, sin el cambio
de formato.)

### 3.8 Completar V.5.4 (buena o mala fe) con la oración introductoria

> Al inicio del párrafo de V.5.4, agregar: "La ley, en numerosos casos,
> atiende a la buena o mala fe del sujeto, dando a cada una efectos
> distintos (por ejemplo, en materia posesoria)."

### 3.9 Completar V.5.5 (nemo auditur) con la discusión doctrinal y la extensión final

> Después de la primera oración de V.5.5, agregar: "El punto ha sido,
> sin embargo, objeto de discusión doctrinal y jurisprudencial cuando
> esas circunstancias concurren respecto del representante, y no del
> representado."

> Al final del párrafo, agregar: "Lo mismo puede decirse del objeto o
> la causa ilícita: el representado puede pedir la nulidad aun cuando
> el representante haya conocido el vicio."

## 4. Verificación de artículos y jurisprudencia

Los 11 artículos del Código Civil citados en este tramo se verificaron
íntegros contra `Apuntes/Codigo Civil Chileno.pdf`: **los 11
coinciden** (43, 671, 672, 673, 678, 721, 1004, 1448, 2116, 2128,
2151), con la salvedad ya señalada en 3.3 sobre el texto vigente del
art. 43 (reforma 2021). El art. 659 que cita Boetsch es del Código de
Procedimiento Civil, ya correctamente distinguido en el manual. Dos
citas de leyes especiales (Ley de Registro Civil, Ley de Matrimonio
Civil) no se pudieron verificar con la fuente disponible. Un solo
fallo con desarrollo (Corte Suprema, 9 de enero de 2017), sin rol
disponible (ver 3.5).

## 5. Pendiente para Laura

1. Aprobar 3.1 a 3.9 (o indicar cuáles no incorporar).
2. Decidir sobre el formato de lista propuesto en 3.7 (`enum-a lista`
   vs. mantener en prosa).
3. Confirmar si corresponde actualizar la paráfrasis del art. 43 al
   texto vigente ("uno o ambos progenitores", 3.3).
4. Indicar si tiene el rol del fallo de la Corte Suprema del 9 de
   enero de 2017 (V.4.4, 3.5); si no, queda sin rol.

Con la aprobación se reescribe V.1-V.5 con `Edit`, se verifica (balance
de etiquetas, cero guiones largos, ningún párrafo sobre 1.200
caracteres, frases clave del inventario presentes, diff línea por
línea de lo eliminado), se muestran capturas de Chrome headless, y se
sigue con el sub-tramo 4.7 (V.6-V.10, Requisitos a otras hipótesis).
