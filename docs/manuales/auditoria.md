# Auditoría de cobertura de un manual

> Se usa al terminar el apunte principal de una materia nueva, y también
> sobre cualquier manual ya publicado cuando se sospecha (o se quiere
> descartar) que tiene huecos frente a sus fuentes. Es un paso final
> sobre el manual cerrado, no parte del ciclo de cada tramo (eso está en
> `proceso.md`, sección 4).
>
> Origen: el 2026-08-13/14 se auditó `04_Acto_Juridico_Manual.html`
> contra sus 17 fuentes (`docs/auditoria_acto_juridico_2026-08-13.md`,
> 49 hallazgos en 21 ejes), y el 2026-08-18 Laura encontró a mano dos
> huecos reales en Contractual que el proceso por tramo no habría
> atrapado.

---

## 1. Por qué no basta el chequeo por tramo

El chequeo de fidelidad por tramo mide si un tramo es fiel **a la fuente
que se usó para escribirlo**. No mide si esa era la única fuente
relevante. Contractual pasa ese chequeo con 92% de fidelidad a Boetsch y
aun así le faltaba todo el tratamiento que Orrego ("Efectos de las
obligaciones") hace de la misma pregunta (qué estatuto rige las
obligaciones legales y cuasicontractuales), con una lista de autores
distinta y más completa. **Un tramo fiel a su fuente puede seguir siendo
parte de un manual incompleto** si hay una fuente secundaria que trata
el mismo tema con más profundidad y nunca se cruzó. Esta auditoría existe
para encontrar ese tipo de vacío.

## 2. Cuándo se hace

- Al terminar el apunte principal completo de una materia nueva (antes o
  después de incorporar los anexos, según convenga).
- Sobre un manual publicado, cuando haya motivo: un hallazgo suelto de
  Laura, o simplemente porque nunca se auditó formalmente (hoy es el caso
  de Extracontractual y Precontractual).

## 3. La tabla tema × fuente

Antes de escribir un solo hallazgo, se arma una tabla con **una fila por
tema o punto del manual** (los encabezados ya numerados) y **una columna
por fuente disponible**: el apunte principal, cada documento secundario
(aunque solo cubra uno o dos temas) y los documentos que son solo
jurisprudencia. Cada celda se marca:

- **Tratado:** el tema aparece en esa fuente y el manual ya lo recoge con
  fidelidad equivalente.
- **No tratado:** esa fuente no toca el tema. Es normal, no es un hueco.
- **Tratado con más detalle en la fuente:** la fuente trata el tema y el
  manual, aunque no esté vacío, se quedó corto frente a esa fuente
  (autores distintos, un argumento adicional, jurisprudencia no citada).
  **Esta celda genera un hallazgo**, de la categoría 1 o 5 de la sección
  4, con su prioridad.

La tabla obliga a cruzar cada fuente secundaria con **cada** tema al que
podría aplicar, no solo con el tema para el que se abrió (así se coló el
hueco de Orrego: se leyó para otro punto y nunca se buscó "estatuto de
derecho común" en ella). Se construye leyendo cada fuente completa una
vez (extracción de texto con `fitz`/PyMuPDF) y anotando, por búsqueda
dirigida a los temas del manual, en qué páginas aparece cada uno.

## 4. Categorías de hallazgo

Sobre la tabla, se revisa cada eje o capítulo en tandas cortas (uno, o un
grupo chico que comparte fuente, nunca el manual completo de una vez)
contra estas siete categorías. Si una categoría no tiene hallazgos en esa
tanda, se escribe **"Sin hallazgos."**, nunca se omite.

1. **Profundidad insuficiente:** un argumento, una excepción o un matiz
   de alguna fuente (principal o secundaria) que no llegó al manual.
2. **Punto ilustrado sin ejemplo:** la fuente ilustra un punto con un
   ejemplo y el manual no tiene ejemplo para ese punto. **Se resuelve con
   un ejemplo original**, nunca copiando el de la fuente
   (`guia-editorial.md`, sección 5).
3. **Jurisprudencia de la fuente ausente en el manual:** un fallo real
   (rol, tribunal y fecha, o cita de RDJ) que la fuente trae y el manual
   no.
4. **Pregunta de examen señalada en la fuente, sin destacar:** la fuente
   marca un punto como pregunta típica de examen y el manual no lo
   destaca. Se revisa si está en `preguntas_evaluacion`: si está, pasa a
   las candidatas a Pregunta clásica para que Laura decida; si no, se
   reporta igual.
5. **Debate doctrinal aplanado:** dos o más fuentes tratan la misma
   controversia con autores distintos y el manual solo usó la lista de
   una, o el manual toma partido sin mostrar ambas tesis con la misma
   extensión que la fuente. **No se mezclan los autores de fuentes
   distintas en una sola lista:** si Boetsch atribuye una tesis a
   Stitchkin y Alessandri, y Orrego la misma tesis a Claro Solar,
   Alessandri, Meza Barros y Abeliuk, se reporta como dos atribuciones
   de dos fuentes (posible punto a decidir por Laura), nunca como una
   lista única sin fuente verificable para la combinación.
6. **Coherencia estructural:** numeración (incluida la escalera y la
   regla de ascenso de `formato.md`), orden, o contenido bien escrito
   pero en el lugar equivocado.
7. **Contenido sin respaldo en fuente:** una afirmación, cita o
   atribución del manual que no aparece en ninguna fuente disponible. Es
   la categoría que detecta alucinación; las seis anteriores detectan
   omisión.

Cada hallazgo lleva prioridad:

- **Alta:** falta algo que sostiene la tesis central de la sección (por
  ejemplo, jurisprudencia que respalda directamente un punto clave).
- **Media:** vacíos de fondo puntuales.
- **Baja:** matices menores (una referencia comparada, un ejemplo
  adicional al que ya existe).

## 5. Reporte, no reescritura

El resultado es un documento nuevo, `docs/auditoria_<materia>_<fecha>.md`,
con el formato de `docs/auditoria_acto_juridico_2026-08-13.md`: resumen
ejecutivo con una tabla de tandas por prioridad, luego una sección por
tanda con las siete categorías ("Sin hallazgos." donde corresponda) y un
resumen al cierre de cada tanda.

**Es un reporte de brechas, no una reescritura.** La corrección del HTML
es una fase aparte que Laura prioriza y aprueba tanda por tanda, como se
hizo con Acto Jurídico (ejes N, H, C y B primero, por su concentración de
jurisprudencia real). No se agrega jurisprudencia ni doctrina del
conocimiento general del modelo: todo hallazgo señala contenido que ya
existe en una fuente concreta de Laura, o marca explícitamente que no se
pudo verificar contra ninguna.

## 6. Revisión de manuales ya escritos (pendiente, a pedido de Laura)

Los manuales escritos antes del 2026-09-28 (Contractual,
Extracontractual, Precontractual, Bienes y Acto Jurídico) no siguen
todavía la guía editorial completa. Se revisarán **cuando Laura lo
pida**, sin frenar los manuales nuevos, en dos pasadas:

**Pasada 1: marcar.** Sin reescribir nada, se listan en un reporte:

- Pasajes con posible paráfrasis cercana de la fuente
  (`guia-editorial.md`, sección 3), con la frase señalada.
- Ejemplos que parecen adaptados de la fuente en vez de originales.
- Recuadros de Dato de grado, con su reclasificación propuesta
  (`guia-editorial.md`, sección 4.10).
- Diferencias de numeración frente a la escalera y la regla de ascenso
  (`formato.md`, sección 1). No se renumera: solo se listan.

**Pasada 2: reescribir.** Con el reporte aprobado por Laura, se
reescriben los pasajes marcados con voz propia, se reemplazan los
ejemplos adaptados por originales y se aplican las reclasificaciones. Se
hace como una pasada dedicada sobre todos los manuales, para mantener el
mismo criterio en todos.
