# Actualizar un manual existente a las reglas nuevas

> Ábrelo cuando toque poner al día un manual escrito con las reglas
> antiguas. Hoy son cinco: Contractual, Extracontractual, Precontractual,
> Bienes y Acto Jurídico. No confundir con la **auditoría** (`auditoria.md`),
> que compara un manual terminado contra todas sus fuentes para encontrar
> lo que falta, sin reescribir. Actualizar sí reescribe, pero solo con los
> cambios que Laura aprueba.
>
> Se hace **cuando Laura lo pida**, sin frenar los manuales nuevos:
> primero se avanza con el contenido nuevo y, cuando ese formato esté
> probado y organizado, se usa el mismo para actualizar los antiguos.

---

## 1. Regla central: nada de lo que hoy está en el manual se pierde

- **Lo que Laura agregó o corrigió en revisiones anteriores se conserva**,
  aunque no esté en la fuente principal. El manual actual no es un
  borrador descartable: tiene trabajo de revisión encima.
- **Lo que está en la fuente y falta en el manual se reporta** en el
  informe del tramo (sección 2, paso c), no se agrega en silencio.
- **Los cuadros comparativos que ya existen en un manual se conservan
  siempre.**
- **El cuerpo de todo recuadro y de cada celda `td` de un cuadro
  comparativo usa la misma fuente y el mismo tamaño de letra que el
  texto principal del manual** (`proceso.md`, sección 4.1); el
  encabezado (`th`, o el `.caja-tipo`/`.caja-titulo`) puede mantener su
  propio estilo de etiqueta. Al revisar o agregar uno, comprobar la
  hoja de estilos del manual, no solo el HTML del recuadro: en Acto
  Jurídico la regla `table` le daba a las celdas `td` la misma fuente y
  tamaño del encabezado, ajenos al cuerpo del texto (corregido
  2026-09-30).
- Las reglas de oro de `proceso.md` (sección 0) valen igual: prohibido
  alucinar, prohibido resumir, todo queda pendiente de revisión de Laura.

## 2. Por tramos, con aprobación de Laura

Se trabaja por tramos (un capítulo o una parte de él), y **Laura aprueba
cada tramo antes de seguir**, igual que en `proceso.md`. En cada tramo:

**a) Inventario desde la fuente.** Igual que en `proceso.md` (sección 2,
paso 2): se recorre la fuente directamente, párrafo por párrafo, sobre el
apunte principal y los anexos del tramo. Si un anexo es muy grande, se
aplica la misma regla de `proceso.md`, sección 5: se arma su mapa, **se
presenta a Laura antes del inventario del tramo**, se inventarían solo
las secciones que ella confirma, y las excluidas se listan en el informe
con su motivo.

**b) Comparación con el manual actual.** Cada unidad del inventario se
busca en el texto actual del tramo, y cada parte del texto actual se
revisa contra el inventario:

- Unidades de la fuente que faltan en el manual: se reportan.
- Contenido del manual que no está en la fuente principal: se conserva
  (puede venir de un anexo o de una revisión de Laura). Si no se
  encuentra en ninguna fuente, se reporta como en `auditoria.md`,
  categoría 7, pero **no se borra** sin su aprobación.

**c) Informe de cambios propuestos, antes de tocar el HTML.** Se entrega
a Laura una lista con:

- Pasajes con paráfrasis cercana de la fuente (`guia-editorial.md`,
  sección 3), con la frase señalada.
- Ejemplos adaptados de la fuente en vez de originales, y ejemplos que
  deberían pasar de caja a texto o al revés (`guia-editorial.md`,
  secciones 4.2 y 5).
- Recuadros de Dato de grado y su reclasificación (`guia-editorial.md`,
  sección 4.10).
- Recuadros con el formato antiguo (título en una sola línea con
  `.titulo-bloque`, en vez de las dos líneas `.caja-tipo`/`.caja-titulo`
  de `formato.md`, sección 7).
- Recuadros nuevos que corresponderían (No confundir, Advertencia, No
  olvidar, Conexiones).
- Candidatas a Pregunta clásica, con el mismo flujo que en un manual
  nuevo (`guia-editorial.md`, sección 6): se lee el banco, se agrupan
  las equivalentes, se cuenta la frecuencia y se proponen ordenadas;
  Laura elige. Una pregunta que hoy está en un Dato de grado también
  puede proponerse, indicando su origen ("viene de un Dato de grado del
  manual, no de `preguntas_evaluacion`"); solo entra si Laura la
  aprueba.
- Paralelos o discusiones doctrinales que deberían ir en cuadro
  comparativo (`guia-editorial.md`, sección 4.12).
- Artículos transcritos y definiciones que deberían ir en bloques `.ley`
  y `.definicion` (`formato.md`, sección 4).
- Diferencias con la escalera de numeración y la regla de ascenso
  (`formato.md`, sección 1). **Solo se listan; no se renumera sin
  aprobación.**
- Lo que falta de la fuente (paso b).

**d) Reescritura.** Con la aprobación de Laura, se reescribe el tramo con
voz propia (`guia-editorial.md`, sección 3), aplicando **solo los cambios
aprobados**.

**e) Verificación y segunda pasada** (`proceso.md`, sección 4): cada
unidad del inventario **y todo lo que el manual tenía antes** está en el
texto nuevo. El informe de segunda pasada (`proceso.md`, sección 4.3)
agrega una línea: qué contenido previo del manual se conservó sin estar
en la fuente principal.

**Al terminar el manual completo**, igual que en uno nuevo (`proceso.md`,
sección 6): revisión final de artículos, jurisprudencia y de todos los
recuadros creados por el modelo, con la lista de su ubicación.

## 3. Chequeo retroactivo de un tramo ya actualizado

Aplica cuando un tramo ya pasó por los pasos de la sección 2 (reescrito,
achilenizado, con sus cuadros y recuadros al día) pero se escribió antes
de que el chequeo de paráfrasis cercana del paso 2.c se aplicara con
rigor, o antes de que existiera. Nace del caso de Acto Jurídico IV.B: los
tramos 2 y 3 se redactaron el 29-30 de septiembre de 2026, el día después
de nacer la regla de voz propia, sin que todavía hubiera un método para
chequearla (ver `decisiones.md`, fila del 2026-09-30).

- **Por sub-punto, no por capítulo.** No se compara el bloque completo
  (p. ej. B.1 a B.4 de un tirón) contra la fuente en una sola pasada:
  cada sub-punto (B.2, B.3, B.4...) se audita justo antes de reescribirlo.
  Una pasada grande produce una lista de "los casos más claros", no una
  lista completa: así quedó corto el primer intento con B.1-B.4 juntos,
  y se escaparon dos párrafos enteros de B.2 (B.2.5 completo y el primer
  párrafo de B.2.7) que solo aparecieron al comparar de nuevo, más fino.
- **Contra el texto de la fuente extraído directo, no contra un resumen.**
  Se extrae el texto de la fuente (PDF) con un script y se compara
  oración por oración contra el manual, igual que el inventario de
  `proceso.md`. No sirve apoyarse en un informe de una sesión anterior ni
  en lo que se recuerda de la fuente.
- **Checklist exhaustivo, una fila por punto numerado**, con su veredicto:
  verbatim (se reescribe), paráfrasis cercana (se reescribe), atribuido
  con autor nombrado (no se toca), o genuinamente reestructurado (no se
  toca). No una lista de ejemplos representativos.
- **Mismas categorías del informe de cambios del paso 2.c, no solo
  paráfrasis.** Si de paso aparece un párrafo que supera los 1.200
  caracteres, un ejemplo sin achilenizar, un recuadro con formato viejo o
  un paralelo que debería ir en cuadro comparativo, se corrige en el
  mismo tramo: no se difiere a una pasada aparte. El informe del tramo
  deja constancia de qué otras categorías se revisaron y que no había
  nada que corregir en ellas, para que quede explícito y no asumido.

Si hace falta registrar en qué va la actualización de un manual, se hace
en un documento aparte para ese manual (como `bienes-reestructuracion.md`),
no aquí: este documento solo contiene reglas.
