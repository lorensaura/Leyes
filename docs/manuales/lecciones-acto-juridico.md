# Lecciones de Acto Jurídico (para hacer Bienes más rápido)

> Reporte de cierre de la actualización de `04_Acto_Juridico_Manual.html`
> (terminada el 2026-10-07). Cuenta cómo se trabajó, qué cambió en el
> camino, qué ayudó, qué errores se cometieron y qué hacer distinto en
> Bienes. **Leerlo antes de empezar Bienes** (o cualquier manual que se
> actualice). No reemplaza a `proceso.md` ni a
> `actualizar-manuales-existentes.md`: las reglas viven allá; aquí está
> la experiencia.

---

## 1. En números

- **Cuatro pasadas por el mismo manual**, no dos:
  1. Construcción (hasta el 2026-08-12): 21 ejes A-U.
  2. Auditoría y corrección (13 al 19 de agosto): 49 hallazgos.
  3. Reformato visual (18 al 29 de septiembre): índice de Laura, capítulos
     romanos I-VI, escalera de numeración.
  4. Actualización al método nuevo (29 de septiembre al 7 de octubre), que
     a su vez tuvo **dos vueltas** sobre I, IV, V y VI por la paráfrasis
     cercana.
- 32 informes de tramo en `docs/actualizacion_acto_juridico_*.md`.
- 59 commits que tocaron el manual desde el 29 de septiembre.
- Los capítulos II y III, hechos al final con todas las reglas ya
  maduras, salieron **en una sola pasada** (9 tramos en dos días, 6 y 7
  de octubre). Es la prueba de que el método, aplicado completo desde el
  inicio, funciona sin volver atrás.

## 2. Por qué hubo que pasar dos veces

La causa de fondo: **las reglas nacieron mientras se trabajaba**, y cada
regla nueva obligaba a volver sobre lo ya terminado.

| Momento | Qué pasó | Consecuencia |
|---|---|---|
| Agosto | El manual se había redactado sintetizando la fuente, no siguiéndola de cerca: quedó con el 49% del contenido de Boetsch. | Auditoría de 49 hallazgos y nuevas reglas contra la compresión. |
| 28 sept | Nacen la voz propia, los ejemplos propios, los recuadros nuevos y la escalera de numeración. | Todo lo escrito antes quedó "viejo" de golpe. |
| 29-30 sept | Se reescriben IV, V y VI con el método nuevo. La regla de paráfrasis cercana existía, pero **no tenía método para chequearla** y no se aplicó. | Esos tramos se mergearon con paráfrasis de Boetsch. |
| 30 sept-1 oct | Al auditar el capítulo I aparece el patrón en todos lados. Se precisa la regla (autor con nombre: se atribuye; prosa sin autor: se reestructura). | **Segunda vuelta** por I, IV completo, V y VI (1 al 5 de octubre). |
| 6 oct | Laura precisa que también los ejemplos "de texto" de Boetsch deben ser propios. | I y VI quedaron con ejemplos genéricos; pendiente para la revisión final. |
| 6-7 oct | II y III se hacen con todas las reglas desde el principio. | Una sola pasada. |

**La lección central para Bienes:** antes de empezar, juntar **todas**
las reglas en un solo checklist y aplicarlas completas en cada tramo,
una sola vez. Si en el camino nace una regla nueva, decidir en ese
momento (con Laura) si se aplica hacia atrás o no, y anotarlo, en vez
de descubrirlo días después.

## 3. Lo que cambió en el camino (decisiones de Laura)

Todas están con fecha en `decisiones.md`. Las que más afectaron el
trabajo:

- **Inventario de la fuente** en vez de borrador de transcripción (29
  sept): lo que protege contra perder contenido es el registro de qué
  dice la fuente, no la copia.
- **Voz propia y paráfrasis cercana** (28 y 30 sept): autor con nombre,
  se cita entre comillas; prosa de conexión de Boetsch, se reestructura
  de verdad.
- **Tabla exhaustiva por sub-punto** (1 oct): una fila por punto con su
  veredicto, nunca "los casos más claros".
- **Ejemplos siempre propios** (28 sept, ampliado el 6 oct a los
  ejemplos genéricos): nombres chilenos, toque gracioso, consecuencia
  respaldada en un artículo verificado.
- **Menos cajas** (6 oct): "se ve mucha caja". La Advertencia se retiró
  y pasó a No confundir en todos los manuales. El Dato de grado ya se
  había retirado (28 sept).
- **Leyes especiales resumidas**, no transcritas (6 oct). `.ley` completo
  solo para códigos.
- **Definición sin autor:** "la definición que le ha dado la doctrina
  es..." (5 oct), para todos los manuales.
- **Sin latinazgos innecesarios** (6 oct, II.A.3.2 y II.C).
- **Casos para resolver** fuera de los manuales, para después del
  lanzamiento (6 oct).
- **Formato visual de AJ = modelo** de `formato.md` (29 sept): solo el
  romano del capítulo en rojo.
- **Cuadros comparativos** para paralelos y discusiones de 3 o más
  criterios (29 sept), con la tipografía y el ancho de columna
  corregidos (30 sept y 5 oct).

## 4. Qué ayudó

- **Tramos chicos con aprobación de Laura antes de tocar el manual.** El
  informe en HTML (en `Informes/`) le permitió decidir rápido; ella
  aprobó con "ok" o ajustó lo puntual; ningún informe se rechazó. (Lo
  que sí hubo que rehacer, la segunda vuelta de paráfrasis, no vino de
  un rechazo de Laura sino de una regla mal aplicada, ver 2.) Cuando el tramo era muy preguntado (el error, 5.2), se
  dividió en tres.
- **Repartir por página real de Boetsch** ("Página N de 221"), no por
  PDF fragmentado, para que no se solapen ni se salten páginas.
- **El inventario desde la fuente, no desde el manual.** Encontró
  unidades que la auditoría de agosto no había visto (Laura lo valoró
  en el tramo piloto).
- **Verificar cada artículo contra el Código vigente** en
  `Apuntes/CODIGOS/`. Encontró errores reales de la fuente: Boetsch usa
  la numeración anterior a la Ley 19.585 (en II.E, art. 254 en vez de
  255, y arts. 260 y 440 inc. 2° en vez de 253, 254 y 439), y había
  textos desactualizados (arts. 589, 1204, 1509). La carpeta de códigos, armada el 6 de octubre, aceleró mucho
  esto.
- **Las fuentes extra que trajo Laura** (VIAL, FIGUEROA, León Hurtado,
  fallos con rol). No solo agregaron profundidad: **corrigieron
  errores** (en II.C la tesis de Velasco aparecía como "la doctrina";
  en IV.F una definición estaba atribuida a VIAL cuando era de
  LIGEROPOULO).
- **Preguntarle a Laura al empezar cada tramo** si tiene material
  propio sobre el tema.
- **El archivo de estado por manual** (`estado_acto-juridico.md`):
  permitió cortar y retomar sin recapitular, con el siguiente paso
  exacto escrito.
- **La vista previa en `Vista_previa/` abierta en el ancla del tramo**:
  Laura revisa en el navegador lo mismo que verá la alumna.
- **Verificación mecánica con scripts** después de cada reescritura
  (etiquetas balanceadas, cero guiones largos, párrafos de menos de
  1.200 caracteres, artículos presentes, revisión del diff de lo
  eliminado) y capturas en Chrome headless.

## 5. Errores que se cometieron (y cómo evitarlos)

**De contenido:**

1. **Sintetizar en vez de seguir la fuente** (construcción original):
   49% del contenido. Evitarlo: inventario unidad por unidad, siempre.
2. **Aplicar una regla sin método para chequearla** (paráfrasis, 29-30
   sept): se dio por cumplida y no lo estaba. Evitarlo: cada regla del
   checklist tiene que tener una forma concreta de comprobarse en el
   informe.
3. **Inventario "de un tirón"** sobre B.1-B.4: se anunció como muestra
   y dejó fuera dos párrafos completos. Evitarlo: tabla exhaustiva, un
   sub-punto a la vez, contra el texto extraído del PDF.
4. **Decidir por criterio propio dejar ejemplos genéricos** de Boetsch
   en I y VI. Evitarlo: ante la duda sobre una regla, preguntar a
   Laura, no resolver en silencio.
5. **Presentar una tesis como "la doctrina"** sin serlo (Velasco en
   II.C) o como acuerdo general lo que es la opinión de un autor (la
   "coincidencia" de VIAL en IV.F). Evitarlo: cada afirmación de "la
   doctrina" se contrasta con el resto de las fuentes del tramo.
6. **Atribuir mal una cita** (definición de LIGEROPOULO como de VIAL):
   salió de un anexo que resumía a VIAL sin sus notas al pie. Evitarlo:
   cuando una cita viene de un resumen, marcarla como "no verificada en
   el original" hasta tener la página.
7. **Confiar en la numeración de artículos de la fuente.** Boetsch es
   anterior a varias reformas. Evitarlo: todo artículo, contra el
   Código vigente.
8. **Exceso de cajas y leyes especiales transcritas completas**:
   corregido por Laura en vista previa. Evitarlo: ya está en las reglas.

**De proceso y de Git:**

9. **Estado y memorias desactualizados**: más de una vez el estado
   decía "sin empezar" o "falta merge" cuando ya estaba hecho. Evitarlo:
   al retomar, verificar contra Git antes de creerle al documento.
10. **Archivos que no debían versionarse** (informes HTML, vista previa,
    `settings.local.json`) se colaron en commits y provocaron un
    conflicto al mergear el 5 de octubre. Evitarlo: informes y vista
    previa siempre fuera del repo.
11. **Ramas viejas que siguieron vivas** (`tramo4-5-otras-causales`),
    que GitHub Desktop ofrecía mergear con conflictos. Evitarlo: al
    mergear una rama, borrarla en el mismo momento.
12. **Bugs de la hoja de estilos** (tipografía de las tablas, columna
    "Criterio" partida con guiones) descubiertos a mitad de camino.
    Evitarlo: revisar la hoja de estilos del manual una vez, al inicio.
13. **Imprecisiones al resumirle a Laura** (el 7 de octubre se le dijo
    "capítulo III" por "II.E.2.1"). Evitarlo: citar el número exacto
    copiándolo del manual, no de memoria.

## 6. Recomendaciones para Bienes

**Ojo: Bienes está hoy en la misma situación que obligó a pasar dos
veces por AJ.** Los tramos I a V.4.B figuran como "revisados", pero se
revisaron solo por fidelidad a la fuente (el método de agosto), antes
de que existieran la voz propia, el inventario, los ejemplos propios y
las cajas nuevas (`bienes-reestructuracion.md` lo dice: "sin el paso de
voz propia"). Recomendación: **tratar todo Bienes con el método
completo, en una sola pasada por tramo, incluidos los tramos ya
"revisados"**, conservando lo que Laura agregó o corrigió.

Antes de empezar:

1. **Decidir lo de los ejemplos.** Laura está trabajando una idea sobre
   los ejemplos. Conviene definirla antes de Bienes (o acordar que los
   ejemplos se hacen al final, en una pasada aparte para todos los
   manuales), para no abrir una tercera vuelta.
2. **Mapa de fuentes y anexos.** Bienes tiene 20 partes de Boetsch y
   anexos grandes (PEÑAILILLO, un libro; dos de VIAL; ORREGO; posesión
   inscrita; paralelo de derechos reales y personales). Para los
   grandes: mapa primero y Laura elige qué entra (`proceso.md` 5).
3. **Revisar la hoja de estilos de Bienes** contra la de AJ (está
   pendiente el bug de tipografía de sus 2 tablas, y faltan las clases
   nuevas). Con el visto bueno de Laura, igualarla al inicio.
4. **Armar el reparto de tramos** por página real de Boetsch, de unas
   10 páginas cada uno (más chico si el tema es muy preguntado), y
   anotarlo en un `estado_bienes.md` nuevo.

En cada tramo, **un solo checklist con todo**:

- Inventario de la fuente y de los anexos del tramo (tabla exhaustiva
  por sub-punto).
- Preguntarle a Laura si tiene material extra sobre ese tema.
- Artículos verificados contra `Apuntes/CODIGOS/` (texto vigente).
- Paráfrasis cercana: autor con nombre se cita; prosa sin autor se
  reestructura.
- "La doctrina" contrastada con todas las fuentes; definiciones sin
  autor con la fórmula fija.
- Ejemplos propios (según lo que se decida en el punto 1).
- Pocas cajas: No confundir, Pregunta clásica, Ejemplo; sin Advertencia
  ni Dato de grado. Cuadro comparativo solo con 3 o más criterios.
- Leyes especiales resumidas; sin latinazgos innecesarios.
- Formato: escalera de `formato.md` (modelo AJ).
- Informe en HTML, aprobación, reescritura, verificación con scripts,
  vista previa, merge y borrar la rama.
