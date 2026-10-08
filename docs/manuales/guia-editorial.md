# Guía editorial de los manuales

> Qué se escribe y con qué criterio: estándar, vocabulario, atribución,
> voz propia, recuadros, ejemplos, preguntas clásicas e impresión. Cómo se
> ve está en `formato.md`; cómo se construye, en `proceso.md`. Las reglas
> de oro de `proceso.md` (sección 0) valen también aquí: prohibido
> alucinar, prohibido resumir, todo queda pendiente de revisión de Laura.

---

## 1. El estándar: completo, serio y pedagógico

- **Completo.** Un manual de Digesto es todo lo que un estudiante
  necesita sobre la materia: el apunte principal más los anexos, con
  todos los argumentos, excepciones, distinciones, posturas, autores y
  fallos de las fuentes. Nunca se resume.
- **Serio.** El estudiante tiene que poder confiar en que aprende de
  aquí lo que la comisión espera, con el vocabulario jurídico exacto.
- **Pedagógico, que no es lo mismo que coloquial.** Lo pedagógico está
  en la estructura (párrafos cortos, enumeraciones, jerarquía de
  lectura, recuadros) y en los ejemplos. Nunca en rebajar el lenguaje
  técnico.

### 1.1 Vocabulario jurídico

- El cuerpo del texto usa **siempre el término técnico**, y lo explica la
  primera vez que aparece: "tradición", nunca "entrega"; "acreedor",
  nunca "a quien le deben"; "inoponibilidad", "título y modo",
  "rescisión".
- Lo que se elimina son las muletillas ("cabe hacer presente que", "a
  mayor abundamiento") y las oraciones kilométricas. Los términos no se
  tocan.
- El registro relajado vive **solo** en los recuadros de Ejemplo.

Así se ve la diferencia: el concepto de error sustancial se explica con
todo su rigor técnico en el texto; el ejemplo que lo ilustra ya no es
"un candelabro de plata en vez de uno de oro", sino "una botella firmada
por todos los integrantes de Coldplay que resulta estar firmada por la
banda tributo".

---

## 2. Atribución: nada se presenta como propio

- Todo manual declara al inicio sus fuentes (por ejemplo: basado en los
  apuntes de Cristian Boetsch y los anexos que correspondan).
- Cada tesis, clasificación, crítica o definición doctrinal lleva **su
  autor**, en negrita y mayúscula, tal como la atribuye la fuente.
- Nunca se afirma como conclusión propia algo que viene de un autor.
- Si dos fuentes atribuyen la misma tesis a autores distintos, no se
  funden en una sola lista: se reporta (`auditoria.md`, categoría 5).
- **Los anexos que son apuntes recopilados (por ejemplo, Bozzo e Ibarra)
  no se nombran en el manual.** Su contenido se integra sin atribuírselo a
  quienes lo recopilaron; las tesis se atribuyen a sus autores
  doctrinales, cuando la fuente los nombra. En los informes internos sí se
  indica de qué anexo viene cada unidad.

---

## 3. Voz propia: reestructurar, no relajar ni resumir

Citar la fuente y no reproducir su redacción son dos cosas distintas, y
se necesitan las dos:

- **Citar la fuente** resuelve la honestidad académica: no se hace pasar
  la idea de otro como propia.
- **No reproducir su redacción** resuelve la propiedad intelectual: el
  texto final no puede ser la prosa de Boetsch con algunas palabras
  cambiadas, aunque se le dé crédito.

**Qué cambia:** la construcción del texto. El orden de las oraciones
dentro de un párrafo, la estructura de cada oración, la división en
enumeraciones y párrafos cortos, qué va a un recuadro.

**Qué no cambia nunca:**

- **El vocabulario técnico**: idéntico al de la fuente.
- **El contenido**: cada argumento, excepción, distinción, autor y fallo
  de la fuente, verificado contra el inventario, tiene que aparecer en
  el texto final. Esto se
  verifica unidad por unidad (`proceso.md`, sección 4.2).
- **Las definiciones legales**: textuales, como artículo transcrito en
  bloque `.ley`.
- **Las definiciones doctrinales**: textuales, entre comillas y con su
  autor, en bloque `.definicion`. Citar una definición con su autor es
  legítimo y le da al texto la seriedad que el estudiante necesita.
- **Si la definición no tiene autor** (ni la fuente se lo atribuye a
  nadie), no se inventa uno: se presenta como "la definición que le ha
  dado la doctrina es...", sin comillas si no se tiene el texto exacto
  (decisión 2026-10-05, ver `decisiones.md`).

**Ejemplo:**

- *Fuente:* "El objeto de la declaración de voluntad debe ser un hecho
  positivo o negativo, física y moralmente posible, y que se encuentre
  determinado o sea determinable conforme a los términos del acto o
  contrato."
- *Paráfrasis cercana (evitar):* "El objeto de la declaración de
  voluntad tiene que ser un hecho positivo o negativo, físicamente y
  moralmente posible, que esté determinado o sea determinable de acuerdo
  a los términos del acto o contrato." Es la misma oración con
  sinónimos.
- *Voz propia (correcto):* "Cuando el objeto de la declaración de
  voluntad es un hecho, debe cumplir cuatro requisitos:" seguido de una
  enumeración: (i) ser **positivo o negativo**; (ii) ser **físicamente
  posible**; (iii) ser **moralmente posible**; y (iv) estar
  **determinado o ser determinable** conforme a los términos del acto o
  contrato. Mismos términos, mismo contenido, otra construcción. (En el
  manual, cada requisito va en su propio párrafo, según `formato.md`,
  sección 2.)

**Prueba:** ¿se reconoce la oración de la fuente con sinónimos cambiados?
Entonces hay que reestructurarla. ¿Falta algún término técnico o alguna
unidad de contenido? Entonces hay que volver a la fuente.

**Sin referencias internas (Laura, 2026-10-08):** el texto no remite a
otras partes del manual. No se escriben, y se borran si vienen de la
fuente, frases como "se desarrolla más abajo", "como se vio", "según se
verá", "como se adelantó", "en el apartado siguiente" o "(punto 4.3)".
Cada punto se lee solo.

**Alcance:** se aplica a los manuales nuevos desde el primer tramo. Los
manuales ya escritos se actualizarán por tramos, cuando Laura lo pida
(`actualizar-manuales-existentes.md`).

---

## 4. Recuadros: cuándo usar cada uno

| Recuadro | Clase | Para qué sirve | Regla clave |
|---|---|---|---|
| Jurisprudencia | `.jurisprudencia` | Un fallo real | Tal como aparece en la fuente. Nunca se inventa un rol ni una fecha |
| Ejemplo | `.ejemplo` | Un caso ficticio que fija el concepto | Siempre original (sección 5) |
| No confundir | `.callout` | Dos conceptos que se confunden | Concepto A, concepto B y el criterio que los distingue |
| ~~Advertencia~~ | `.warn` | **Retirada (2026-10-06)**: lo que iría aquí va como No confundir | Ver 4.4 |
| Pregunta clásica | `.pregunta-clasica` | Una pregunta real de examen | Solo las que Laura selecciona de las candidatas (sección 6) |
| No olvidar | `.no-olvidar` | Un dato duro y puntual | Una o dos líneas; nunca explica materia |
| Conexiones | `.conexiones` | Relación con otras materias | Al cierre de cada punto (nivel `1.`) |
| Pausa | una línea | Aviso de comprensión lectora | Las preguntas están en la plataforma, no en el apunte |
| Cuadro comparativo | tabla | Un paralelo entre instituciones o una discusión doctrinal | Una columna por institución o tesis; no pierde contenido (sección 4.12) |

El código de cada uno está en `formato.md`, sección 7.

### 4.1 Jurisprudencia

- Solo fallos reales y verificables, citados como aparecen en la fuente
  (rol, tribunal y fecha si están). Si falta un dato: `[FALTA: ...]`.
- **El recuadro de Jurisprudencia se usa solo si el fallo tiene rol (para
  que se pueda revisar) o si la fuente lo desarrolla lo suficiente para
  explicar algo.** Una frase suelta de un fallo sin rol no justifica un
  recuadro: se omite y se deja `[FALTA: jurisprudencia reciente, con rol]`
  para que Laura busque una más actual.
- Varios fallos sobre el mismo punto van en un solo recuadro.
- **Listas de fallos citados sin contenido** (solo la referencia): se dejan
  los que tienen **rol**, para que el estudiante pueda buscarlos, empezando
  por los más recientes, cada uno con `[FALTA: extracto del fallo]` para que
  Laura agregue el pasaje. Los que solo tienen cita de revista (RDJ,
  Gaceta, Fallos del Mes) no se listan uno por uno: se dice cuántos son y
  entre qué años, para que la omisión sea visible.

### 4.2 Ejemplo: ¿en caja o en el texto?

Pregunta de prueba: *¿el ejemplo enseña algo que el párrafo no dice, o
necesita una historia de más de dos oraciones?*

- **Sí: recuadro Ejemplo.** Por ejemplo, el de la Luna, que muestra que
  la imposibilidad física cambia con el tiempo.
- **No: va en el texto**, en una o dos oraciones en cursiva que parten
  con "Así," o "Por ejemplo,". Por ejemplo, el de Pancho, que solo
  aplica la regla del párrafo.

No todos los puntos necesitan un Ejemplo en caja. Si tres puntos
seguidos lo tienen, el verde deja de señalar algo especial.

### 4.3 No confundir

- **Estructura fija:** concepto A, concepto B y el criterio que los
  distingue. Cierra con la línea que resume la diferencia (por ejemplo:
  "número de partes vs. número de obligados").
- Cuando se pueda, el título se formula como pregunta.
- La estructura fija importa también fuera del manual: los No confundir
  son la materia prima natural de las Flashcards (sección 7).
- Sirve para dos conceptos que se distinguen con **un solo criterio**.
  Si la distinción necesita tres criterios o más, va en cuadro
  comparativo (sección 4.12).

### 4.4 Advertencia (retirada)

- **No se usa como caja** (Laura, 2026-10-06). Una trampa típica de
  examen o un error de quien no domina el punto va en un **No
  confundir**, diciendo cuál es el error y por qué lo es.
- `.warn` queda en la hoja de estilos solo por compatibilidad; en
  Acto Jurídico ya no queda ninguna.

### 4.5 Pregunta clásica

- **Nunca se inventa.** Solo entran las preguntas que Laura selecciona
  (sección 6). Si un punto no tiene pregunta seleccionada, no lleva
  recuadro.
- La pregunta se transcribe **tal como está en el banco**, sin
  reformularla.
- **Ubicación:** justo después del párrafo que la responde.
- **Respuesta:** solo el esqueleto, sin repetir la explicación del texto,
  modelando cómo se responde en un examen. "Depende" nunca es una
  respuesta completa: siempre "depende **de X**: si A, ...; si B, ...".
  Ejemplo: "Depende del numeral. En los Nº 1 y 2 hay ley prohibitiva:
  tampoco pueden venderse. En los Nº 3 y 4, la venta sería válida,
  porque el impedimento puede alzarse antes de la tradición."

### 4.6 Fusión de No confundir y Pregunta clásica

Cuando son **la misma pregunta**, no se duplican: van en un solo
recuadro con encabezado doble ("No confundir | Pregunta clásica"), un
solo título y un solo cuerpo (código en `formato.md`, sección 7).

Prueba: *¿el título del No confundir es una pregunta que la comisión
hace tal cual, y está entre las preguntas seleccionadas?* Si la respuesta
es sí, se fusionan. Si es no, van separados. Si hay duda, separados y con
`[FALTA: decidir si se fusiona]`.

Caso de referencia: "¿Se puede vender lo que no se puede enajenar?"
(arts. 1464 y 1810).

### 4.7 No olvidar

- Solo para un **dato duro y puntual**: un plazo, un número, un requisito
  enumerado. Una o dos líneas. Borde punteado: es más liviano que los
  demás.
- Nunca para explicar materia. Si hace falta explicar, va en el texto.
- Si todo es "no olvidar", nada lo es.

### 4.8 Conexiones

- **Ubicación:** una sola caja al cierre de cada punto (nivel `1.`), y
  solo si ese punto tiene conexiones reales con otra materia. No en cada
  subpunto, no en líneas sueltas dentro del texto y no en una sola caja
  al final de todo el capítulo.
- **Formato de cada línea:** "**Compraventa** (art. 1810): misma
  prohibición del 1464, aplicada al contrato. Revisar apunte de
  Compraventa, II.B (p. __)."
- Se cita **la sección y la página**. La sección no cambia al editar el
  otro manual; la página se completa cuando la diagramación está cerrada
  (mientras tanto queda `p. __`).
- **Sin enlaces:** los estudiantes imprimen.
- El texto puede seguir mencionando otros artículos con normalidad; la
  caja es el resumen ordenado.

### 4.9 Pausa (comprensión lectora)

- En el manual solo aparece el aviso de una línea. Las preguntas se
  responden **en la plataforma**, donde el estudiante recibe
  retroalimentación de la IA. Nunca se escriben en el apunte.
- En el PDF impreso, la pausa debe decir dónde responder (por ejemplo:
  "Pausa: Comprensión lectora. Responde en digesto.cl"), porque en papel
  no hay otra forma de llegar a las preguntas.

### 4.10 Dato de grado (retirado)

El recuadro Dato de grado **ya no se usa en contenido nuevo**. En la
práctica terminó conteniendo materia en vez de preguntas de examen. Al
revisar un manual que lo tenga, su contenido se reclasifica:

| Si el Dato de grado era... | Va a... |
|---|---|
| Materia (lo más común) | El cuerpo del texto |
| Una pregunta de examen | Candidata a Pregunta clásica, indicando que viene de un Dato de grado; entra solo si Laura la aprueba (sección 6) |
| Un dato duro y puntual | No olvidar |
| Un error típico | No confundir |

Prueba: *si se quita el recuadro, ¿el texto principal queda incompleto?*
Si la respuesta es sí, era materia y vuelve al texto. Ejemplo real: "Los
actos recepticios son irrevocables desde que el destinatario los conoce"
era materia, no un dato de examen.

### 4.11 Cantidad y orden

- **Criterio (no regla dura):** como referencia, no más de **dos
  recuadros pedagógicos grandes por punto** (Ejemplo en caja, No
  confundir, Pregunta clásica o el recuadro fusionado).
  Jurisprudencia, No olvidar, Conexiones, Pausa y los cuadros
  comparativos no cuentan: la
  jurisprudencia es contenido de la fuente y nunca se recorta para
  cumplir un máximo.
- Si un punto pasa de dos, **no se borra nada**: se anota en el informe
  de segunda pasada (`proceso.md`, sección 4.3) para que Laura decida.
- **Mínimo:** cada capítulo (lo que antes se llamaba eje) lleva al menos un Ejemplo. Ya no se exige
  "Ejemplo o Dato de grado", porque las Preguntas clásicas solo salen de
  la selección de Laura y exigirlas empujaría a inventarlas.
- **Orden:** la caja de Conexiones es lo último de cada punto.

### 4.12 Cuadros comparativos

- **Paralelos y comparaciones.** Cada vez que la fuente hace un
  paralelo, una comparación o señala las diferencias entre dos o más
  instituciones ("paralelo entre A y B", "diferencias entre..."), se
  presenta en un **cuadro comparativo**: una columna por institución y
  una fila por criterio de comparación.
- **Discusiones doctrinales.** Lo mismo cuando las tesis responden los
  mismos puntos en sentido contrario: una columna por tesis, con **sus
  autores en el encabezado**, y una fila por punto o argumento. **Debajo
  del cuadro** va la postura mayoritaria o la de la jurisprudencia.
- **El cuadro no puede perder contenido.** Cada unidad del inventario
  queda en el cuadro o en el texto que lo acompaña. Si un argumento
  necesita más desarrollo del que cabe en una celda, se desarrolla en el
  texto y el cuadro lo nombra.
- **Se introduce con una frase que termina en dos puntos**, por ejemplo:
  "Paralelo entre nulidad absoluta y relativa:".
- **Diferencia con No confundir:** No confundir es para dos conceptos
  que se distinguen con un solo criterio; si la distinción necesita tres
  criterios o más, va en cuadro comparativo.
- **No cuentan** para el máximo de recuadros pedagógicos por punto
  (sección 4.11).
- Cómo se ve: `formato.md`, sección 4.1.

---

## 5. Ejemplos

- **Siempre originales.** Ningún ejemplo se adapta de la fuente
  cambiándole los nombres: se inventa desde cero. El ejemplo de la
  fuente sí dice algo importante: el punto que ilustra tiene que quedar
  cubierto, con un ejemplo propio.
- **Nombres propios reales de persona**, chilenos y variados (Diego,
  Valentina, Matías, Pancho, Valeria, Sebastián). Nunca "una persona A"
  y "otra persona B". Contexto chileno (lucas, Ñuñoa, la Alameda).
- **Toque gracioso** siempre que el concepto lo permita sin forzarlo: el
  ejemplo se recuerda mejor si hace sonreír. El humor sale de lo absurdo
  de la situación (Pancho disfrazado de dinosaurio bailando reguetón),
  **nunca** de desnudez, humillación, violencia, política o religión.
- **Personas reales:** solo en roles neutros o positivos. "Quizás Elon
  Musk convierta llegar a Marte en un hecho posible" está bien; una
  celebridad estafando a alguien, no.
- **La consecuencia jurídica del ejemplo** tiene que poder respaldarse en
  un artículo citado en el mismo punto. Un ejemplo no introduce una
  regla que el texto no enseña.
- **Referencias actuales**, prefiriendo las que no envejezcan en un año.
- **Aplicación en manuales existentes:** todos los ejemplos deben ser
  propios. Al actualizar cada tramo (`actualizar-manuales-existentes.md`),
  los ejemplos que vienen de la fuente se reemplazan por ejemplos
  originales. **Esto incluye los ejemplos genéricos o "de texto"** de
  la fuente, aunque no tengan nombres ni sean casos armados (la obra de
  teatro, "te vendo tal cosa a tal precio", la lista de ofertas tácitas,
  la carta depositada en el correo): también se reemplazan. Lo que no es
  ejemplo sino materia (el testamento como acto no recepticio, el
  desahucio como recepticio, los contratos en que se pacta prórroga
  tácita) se conserva tal cual.
- **Cajas de Ejemplo y ejemplos nuevos (Laura, 2026-10-08):** en cada
  tramo, toda caja de Ejemplo se reescribe como propia en ese mismo
  tramo, y se crean ejemplos nuevos donde ayuden, sin preguntar: Laura
  quiere los manuales llenos de ejemplos propios. Lo único que puede
  quedar para una pasada final común son los ejemplos genéricos dentro
  del texto corrido.

### 5.1 Antes y después (casos reales)

**1. Un ejemplo que era aplicación directa pasa al texto.**
Antes: recuadro "Hecho indeterminado: la sorpresa de Pancho".
Después, al final del párrafo, en cursiva: *"Así, si Valentina le dice a
Pancho que le paga si 'hace algo que la sorprenda', sin precisar qué
hecho, ninguno de los dos puede exigir judicialmente el cumplimiento de
lo pactado: falta un hecho determinado."*

**2. Un ejemplo sensible y jurídicamente impreciso se reemplaza.**
Antes: Diego vende su celular a Matías "con la condición" de que este se
pasee sin ropa por la Alameda, y se concluye que Matías puede exigir la
venta sin cumplir la condición. Tenía dos problemas: el tema era
innecesariamente sensible, y la conclusión depende de si la condición es
suspensiva (se tiene por fallida) o resolutoria (se tiene por no
escrita), algo que el texto del punto no desarrollaba.
Después: *Valeria le ofrece a Sebastián 40 lucas para que rinda el
examen de grado en su lugar. El hecho prometido es moralmente imposible:
hay objeto ilícito y el pacto es nulo (art. 10), así que ninguno puede
exigirle al otro su cumplimiento.* Aquí el hecho ilícito es el objeto
mismo de la promesa, y la consecuencia se apoya en el art. 10, citado en
el mismo punto.

**3. Un ejemplo que sí merece caja se mantiene.**
"Ayer imposible, hoy posible: llegar a la Luna". Enseña algo que el
párrafo no dice (la variabilidad en el tiempo) y necesita la historia
para funcionar.

---

## 6. Preguntas clásicas: selección desde `preguntas_evaluacion`

`preguntas_evaluacion` es el banco de preguntas de exámenes reales que
Laura cargó desde sus PDF. Es también la base del Interrogador IA. Para
las Preguntas clásicas del manual **se lee, nunca se modifica**. El
flujo es el mismo para manuales nuevos y para manuales existentes
(`actualizar-manuales-existentes.md`):

1. **Leer el banco.** Para el tema que se está escribiendo, listar las
   preguntas del banco que corresponden a cada punto. Si el modelo no
   tiene acceso a la tabla, **Laura entrega el banco completo
   exportado** y el resto del flujo sigue igual.
2. **Agrupar.** Las preguntas equivalentes con distinta redacción se
   agrupan, conservando cada variante textual.
3. **Contar.** La frecuencia de cada grupo (cuántas veces aparece en el
   banco) es lo que define que una pregunta sea "clásica".
4. **Proponer.** Entregar a Laura, por punto, las candidatas ordenadas
   por frecuencia, con su texto literal y los datos que traiga el banco.
   Si el banco no trae un dato (universidad, año), no se completa.
5. **Seleccionar.** Laura elige. Solo las elegidas entran al manual.
6. **Ubicar y responder.** El recuadro va justo después del párrafo que
   la responde, con solo el esqueleto de la respuesta, a partir del texto
   del manual (sección 4.5). Si no es claro dónde va, se deja
   `[FALTA: ubicación de la pregunta clásica]`; si el manual no trae lo
   necesario para responderla, no se completa de memoria: se avisa a
   Laura. Se fusiona con un No confundir si corresponde (sección 4.6).

**Preguntas que vienen de un Dato de grado** (solo al actualizar un
manual existente): una pregunta que hoy está en un recuadro de Dato de
grado puede proponerse como candidata, **indicando su origen** ("viene de
un Dato de grado del manual, no de `preguntas_evaluacion`"). Solo entra
si Laura la aprueba.

## 7. Relación con los formatos de práctica

El manual es la **fuente de verdad** de todo el contenido de práctica de
Digesto: Evaluación (Aplicación, Detección de error, Justificación,
Discriminación MC), Alternativas, Flashcards y Memorice. Esos formatos
apuntan a entender más que a recitar, y a las universidades con exámenes
prácticos, así que son mucho más amplios que las preguntas de un examen
oral.

- Se generan en un paso posterior, con
  `docs/prompt-generacion-contenido-practica.md` y el skill
  `generar-practica`. **Ninguno se escribe dentro del manual.**
- La Pregunta clásica es otra cosa: la pregunta literal de examen, dentro
  del manual, para preparar la interrogación.
- Lo único que el manual hace pensando en esos formatos es mantener bien
  su estructura: los No confundir con su forma fija alimentan las
  Flashcards, y los artículos transcritos en `.ley` facilitan elegir los
  de Memorice (cuyo texto literal igual lo entrega siempre Laura).

---

## 8. Impresión

La mayoría de los estudiantes imprime los apuntes.

- **Sin enlaces** en el texto. Las referencias a otros apuntes se hacen
  por sección y página (sección 4.8).
- **Blanco y negro:** cada recuadro lleva siempre su etiqueta escrita,
  porque el color solo no basta para distinguirlos. Antes de cerrar el
  diseño de un manual se imprime una página de prueba en blanco y negro.
- **Pie de página:** nombre del manual, versión y fecha. Más adelante se
  agregará un código QR "¿Encontraste un error?" que lleve a un
  formulario; hay que dejar el espacio previsto.
- **Antes de publicar**, con la diagramación cerrada, se completan todas
  las páginas pendientes (`p. __`) de las Conexiones.
- **Pausa:** en el impreso indica dónde responder (sección 4.9).

---

## 9. Fuera de alcance por ahora

No se implementa hasta que Laura lo decida:

- **Examen oral vs. escrito.** La distinción existe, pero se abordará
  más adelante. No se agregan indicaciones del tipo "especialmente si tu
  examen es oral".
- **Índice de artículos** (en cada apunte y cruzando todos los apuntes de
  Digesto). Se evaluará cuando estén terminados todos los apuntes,
  incluidos los de Procesal.
- **Recuadro de Discusión doctrinal.** No existe: la doctrina es materia
  y va en el texto, siempre con sus tesis y autores (o en cuadro
  comparativo cuando las tesis se contraponen punto por punto, sección
  4.12).
- **Reescritura con voz propia de los manuales ya escritos.** Se hará
  por tramos, cuando Laura la pida (`actualizar-manuales-existentes.md`).
