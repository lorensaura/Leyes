# Proceso de construcción de un manual

> Ábrelo cuando toque construir el manual de una materia nueva de Civil o
> Procesal (Bienes, Contratos, Obligaciones, Familia, Sucesorio, Procesal
> Civil, Procesal Penal, etc.), o reparar un tramo de un manual
> existente. Cómo debe verse está en `formato.md`; con qué criterio se
> escribe, en `guia-editorial.md`; la auditoría de cobertura del manual
> terminado, en `auditoria.md`; poner al día un manual escrito con las
> reglas antiguas, en `actualizar-manuales-existentes.md`. Generar preguntas de práctica a partir de
> un manual ya escrito es otro paso: `docs/prompt-generacion-contenido-practica.md`.

---

## 0. Reglas de oro

Leer antes de escribir una sola línea. No se relajan por volumen ni por
apuro.

1. **Se trabaja de a tandas, nunca el manual completo de una pasada.**
   Por eje, o en tramos cortos si un eje es muy largo. Se cierra, se
   verifica (sección 4) y se entrega un tramo antes de abrir el
   siguiente. Leer de a poco reduce el riesgo de mezclar el contenido de
   un eje con otro o de "completar de memoria" algo que ya salió de la
   lectura reciente.
2. **Prohibido alucinar.** Todo el contenido jurídico sale
   exclusivamente del material que Laura entregó para esa materia y,
   cuando corresponde citar un artículo, del texto oficial y vigente del
   Código, verificado contra una fuente textual confiable. **Nunca se
   completa, redondea ni verifica con información de internet en general
   ni con el conocimiento de memoria del modelo.** Si un dato no está en
   ese material y no se puede verificar contra el Código, no se escribe:
   se deja el hueco marcado, por ejemplo
   `[FALTA: verificar cita de jurisprudencia]`, para que Laura lo
   complete. Nunca se aproxima ni se inventa para no dejar un vacío.
3. **Todo contenido queda pendiente de revisión de Laura.** Nunca se
   marca como "revisado" o "definitivo" solo porque el modelo lo generó.
4. **Prohibido resumir. Reformatear no es sintetizar.** Esta regla
   existe porque se violó de verdad: Bienes y Acto Jurídico quedaron con
   49-57% del contenido de su fuente, mientras Contractual quedó en 92%.
   La causa fue redactar el párrafo final de memoria desde la lectura de
   la fuente, sin registrar antes qué decía. Por eso el inventario de la
   fuente (sección 2, paso 2) es obligatorio: lo que protege contra la
   pérdida de contenido es el registro de qué dice la fuente, no una
   copia de ella. Caso completo en
   `docs/incidente_compresion_manuales.md`.

**Marca única de pendiente:** `[FALTA: ...]`, tanto para un dato que no
se pudo verificar como para una decisión que le corresponde a Laura.

---

## 1. Material fuente

Toda materia nueva llega con la misma estructura: **un apunte principal**
(uno o varios PDF, típicamente de Boetsch, cortados por tema) **más
varios anexos y documentos secundarios**, cada uno acotado a uno o dos
temas (jurisprudencia, un resumen de otro autor como Peñailillo o Vial,
apuntes de interrogación de compañeros, un decreto ley específico,
etc.). El proceso de abajo asume esa entrada. Patrón ya usado:
`Apuntes/Ejes_Responsabilidad_Extracontractual_Borrador/` y
`Apuntes/Ejes_Responsabilidad_Precontractual_Borrador/`, con un `.md`
por eje.

---

## 2. Apunte principal: paso a paso

1. **Insumo.** El apunte principal de la materia, dividido en un archivo
   por eje o subtema (si no lo está, dividirlo antes de escribir, para
   poder trabajar de a tandas). Extraer el texto plano de cada PDF una
   sola vez (por ejemplo con `fitz`/PyMuPDF) y guardarlo, para releerlo
   sin abrir el PDF y para el chequeo de fidelidad de la sección 4.1.

2. **Inventario de la fuente (interno).** Antes de redactar, se recorre
   la fuente del tramo **directamente** (el texto extraído del PDF, nunca
   de memoria ni desde un resumen), **párrafo por párrafo**, y se anota
   cada unidad de contenido: definiciones, argumentos, excepciones,
   distinciones, tesis con sus autores, fallos, y el punto que ilustra
   cada ejemplo. **Cada párrafo de la fuente aporta al menos una unidad o
   queda anotado como "sin contenido nuevo"**, para que ninguno se salte
   sin que se note. El inventario es un insumo de trabajo: **nunca se
   publica**, y es la lista contra la que se verifica el texto final
   (sección 4.2).

3. **Redacción final con voz propia**, con la fuente y el inventario a
   la vista. Se redacta el texto final según `guia-editorial.md` (sección 3): se reestructura la
   exposición y se mantiene idéntico el vocabulario técnico. Aquí se
   aplica todo `formato.md`: la escalera de numeración con la regla de
   ascenso, las enumeraciones, la negrita y la cursiva, los bloques
   `.ley` y `.definicion`, los recuadros, los artículos en rojo, los
   autores en negrita y mayúscula, sin guiones largos. Los ejemplos se
   crean originales (`guia-editorial.md`, sección 5).
   Lo que nunca puede pasar en este paso es que una unidad del
   inventario quede fuera: la densidad se logra partiendo en más piezas,
   no descartando piezas.

4. **Cierre del tramo.** Verificación y segunda pasada (sección 4). No se
   abre el siguiente tramo sin cerrar este.

5. **Archivo final:** `0X_<Materia>_Manual.html` en la raíz del
   repositorio, siguiendo la numeración ya usada.

**Manuales existentes en reparación** (por ejemplo, Bienes): siguen
reparándose con el proceso vigente hasta ahora, sin el paso 3 de voz
propia, para no frenar el avance. La voz propia se les aplicará al
actualizarlos (`actualizar-manuales-existentes.md`).

---

## 3. Densidad: párrafos cortos, documento espaciado, cero contenido perdido

El estándar es Contractual y Precontractual (620 y 512 caracteres por
párrafo en promedio, con recuadros frecuentes). Pero medir solo el
tamaño de párrafo no basta: Bienes y Acto Jurídico cumplían la regla de
párrafos cortos y aun así terminaron con menos de la mitad del contenido
de su fuente, porque lo "corto" se logró recortando argumentos enteros.
Ejemplo real de Bienes: la fuente traía dos argumentos seguidos contra la
clasificación de "cosas incorporales", el segundo con un ejemplo
trabajado de cadena infinita; el manual solo tenía el primero, y el
segundo desapareció sin que nadie lo marcara.

- **Un párrafo apunta a 400-700 caracteres.** Si se acerca a 1200, se
  parte en dos o una parte pasa a un recuadro. Partir es hacer más
  párrafos o más recuadros, **nunca eliminar una oración, un argumento o
  un ejemplo**.
- **Espaciar no es resumir.** Un documento espaciado tiene más
  encabezados, más recuadros y párrafos más cortos que uno denso con el
  mismo contenido jurídico, no menos contenido.
- **Cada capítulo (lo que antes se llamaba eje) lleva al menos un recuadro de Ejemplo.** Si la
  fuente trae jurisprudencia o una distinción que merece un No confundir,
  se agregan también. Un tramo largo sin ningún recuadro es señal de que
  quedó denso.
- **Toda omisión es una decisión visible, nunca un accidente
  silencioso.** Si de verdad conviene condensar algo (por ejemplo, una
  casuística de otra materia que solo se menciona de pasada, como se hizo
  a propósito con la Sucesión dentro de Bienes), se dice en el texto del
  manual o, como mínimo, en el mensaje del commit del tramo: qué se
  condensó y por qué.

---

## 4. Verificación y segunda pasada, por tramo

**Laura revisa y aprueba cada tramo contra la fuente antes de que se
abra el siguiente.** Los chequeos de abajo son el piso mínimo y no
reemplazan su lectura. Aplica a manuales nuevos y a reparaciones de
manuales existentes.

### 4.1 Chequeos mecánicos

- **Balance de etiquetas.** Cada `div`, `p`, `em` y `strong` abierto
  tiene su cierre (conteo y pila de anidamiento). Bug conocido: al
  insertar un recuadro justo antes de un párrafo existente, es fácil
  dejar el `<p>` de apertura fuera del bloque, dejando un `<p>` sin
  cerrar o un recuadro mal anidado. Revisar ese punto cada vez que se
  inserta un recuadro entre contenido ya escrito.
- **Cero guiones largos y cero guillemets** en cualquier parte del tramo.
- **Ningún artículo, fallo o atribución doctrinal que no esté
  literalmente en el material fuente** de Laura.
- **Fidelidad de caracteres.** Se cuentan los caracteres del texto plano
  de la fuente del tramo (sin encabezados de página repetidos) y los del
  HTML escrito (sin etiquetas). La razón debe rondar **80-90%**. Bajo
  ~75%, se relee el tramo contra la fuente y se encuentra lo perdido
  antes de cerrarlo. Script mínimo:

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

  Con voz propia el largo puede variar un poco, así que este número es un
  piso, no la prueba principal: la prueba principal es la 4.2.

### 4.2 Chequeo de unidades

Cada unidad del inventario de la fuente (sección 2, paso 2) tiene que
estar en el texto final. Una unidad que falta se agrega antes de cerrar el tramo. Es
lo que detecta una omisión aunque el conteo de caracteres pase.

### 4.3 Segunda pasada: informe para Laura

Con el tramo escrito, se relee completo como un revisor externo buscando
temas omitidos frente a la fuente, errores de redacción y errores de
formato. El resultado es un informe breve para Laura con:

1. **Cobertura:** unidades faltantes (o la confirmación de que están
   todas) y la razón de caracteres.
2. **Redacción:** errores corregidos y frases dudosas.
3. **Formato:** numeración según la escalera (y dónde se usó `A.1` y
   por qué), enumeraciones, negrita y cursiva, bloques `.ley` y
   `.definicion`, puntuación.
4. **Recuadros:** cuántos hay por punto y qué puntos pasan de dos
   recuadros pedagógicos.
5. **Pendientes:** todos los `[FALTA: ...]` del tramo, en una lista.
6. **Artículos transcritos:** verificados contra la fuente textual, y
   cuáles quedan por confirmar.
7. **Conexiones** con página pendiente (`p. __`).
8. **Preguntas clásicas:** dónde quedó cada una de las que envió Laura,
   y los puntos que la fuente marca como típicos de examen, para que ella
   decida (`guia-editorial.md`, sección 6).
9. **Cuadros comparativos:** paralelos y discusiones doctrinales del
   tramo, y si quedaron en cuadro comparativo (`guia-editorial.md`,
   sección 4.12).

El informe también se usa al actualizar un manual ya escrito
(`actualizar-manuales-existentes.md`).

---

## 5. Anexos y documentos secundarios

Con el apunte principal completo, se revisan los anexos para agregar lo
que corresponda en las secciones ya escritas. No son un eje nuevo al
final: la mayoría trata uno o dos temas que ya tienen lugar en el
manual, así que la edición queda repartida por todo el documento.
Proceso (basado en lo que funcionó con los 12 anexos de Bienes):

1. **Un inventario por anexo.** Cada anexo tiene su propio inventario,
   sacado directamente del anexo (texto extraído, párrafo por párrafo,
   igual que en la sección 2, paso 2).

   **Anexos muy grandes** (un libro completo o un resumen de 60-80
   páginas):
   - **Primero, un mapa del anexo:** qué trata cada capítulo o sección,
     armado desde su índice y sus títulos.
   - **Después, el inventario párrafo por párrafo solo de las secciones
     que tocan temas del manual** y no son repetición del apunte
     principal.
   - **Las secciones que se dejan fuera quedan anotadas en el mapa, con
     la razón** (por ejemplo: "otra materia", "repite el apunte
     principal, pp. 12-30").
   - **La búsqueda por términos no reemplaza al inventario:** solo sirve
     para ubicar secciones dentro del mapa.
2. **Cada unidad se compara con el texto principal y se clasifica:**
   - **Ya está en el texto principal:** no se agrega. Nunca se duplica.
   - **Agrega algo** (un dato, una característica, una anotación, otro
     autor, un fallo): se incorpora en el **lugar exacto** del texto
     principal, integrado a la explicación y con su autor.
   - **Contradice al texto principal:** se exponen ambas versiones, cada
     una con su fuente, o se marca `[FALTA: decidir entre ...]` para que
     Laura decida.
3. **Tabla antes de tocar el HTML.** Con la clasificación hecha, se arma
   una tabla **anexo → unidad → sección del manual → acción** (no se
   agrega / se incorpora / se exponen ambas / FALTA). Recién con esa
   tabla se edita el HTML.
4. **La confiabilidad de la fuente define cuánto se verifica.** Un
   apunte de cátedra (Boetsch, Peñailillo, Vial, Orrego) se usa directo,
   con la misma regla anti alucinación. Un apunte de compañeros
   (interrogaciones, resúmenes de otro alumno) es de menor confiabilidad:
   antes de agregarlo se cruza con una fuente de cátedra. Si no se puede
   corroborar, no entra, salvo que Laura confirme ese punto específico
   (su confirmación vale para ese punto, no baja el estándar del resto).
5. **Nada de pendientes silenciosos.** Si un anexo trae contenido
   relevante que no se pudo verificar, o que se decidió no usar, se dice
   al reportar el lote: qué anexo, qué contenido y por qué no entró.
6. **Lotes chicos, un commit por lote.** No se juntan todos los anexos
   en un solo commit al final.

---

## 6. Después del manual completo

- Auditoría de cobertura: `auditoria.md`.
- Regenerar el PDF con `scripts/generar_pdf_manual.py` y revisarlo
  visualmente (incluida la prueba en blanco y negro).
- Correr `scripts/agregar_anclas_manuales.js`, previa entrada nueva en su
  arreglo `FUENTES`, para las anclas de sección.
- Conectar el manual a la app (`app/manuales.html`), a Airtable y
  Supabase: fuera de este documento.
