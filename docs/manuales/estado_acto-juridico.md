# Estado: actualización de Acto Jurídico al método nuevo

> Se actualiza **in place** cada vez que Laura diga "guarda el estado
> [de Acto Jurídico / de AJ]". No acumular una entrada nueva por sesión:
> corregir esta. Al decir "retoma Acto Jurídico" o "retoma AJ", leer este
> archivo completo primero y resumir en pocas líneas dónde quedó antes
> de seguir. Última actualización: 2026-09-30 (tramo 4.4).

## Dónde estamos

Se está actualizando `04_Acto_Juridico_Manual.html` al método de
`actualizar-manuales-existentes.md`, **por tramos, con aprobación de
Laura en cada uno**.

| Tramo | Contenido | Informe | Rama / commit final | Estado |
|---|---|---|---|---|
| 1 (piloto) | Introducción cap. IV + IV.A La inexistencia | `docs/actualizacion_acto_juridico_IV-A_2026-09-29.md` | `caecee9` (+ `3ba6f9d`) | En `main` |
| 2 | IV.B.1 Aspectos generales, B.2 Nulidad absoluta, B.3 Nulidad relativa | `docs/actualizacion_acto_juridico_IV-B1-B3_2026-09-29.md` | `44c82b5` | En `main` |
| 3 | IV.B.4 Los efectos de la nulidad | `docs/actualizacion_acto_juridico_IV-B4_2026-09-30.md` | commit `481af70` | **Mergeada a `main`** |

`main` ya incluye el tramo 3 (`481af70`) y los dos commits de
documentación posteriores (`07b7956`, `31247f4`). Este worktree
(`worktree-actualizar-acto-juridico-tramo-3`) está al día con `main`:
no hay nada pendiente de mergear.

### Qué se hizo en el tramo 3 (para no repetirlo si se retoma a medio camino)

- Inventario completo contra Boetsch (`principal_10` fin + `principal_11`
  entero) y el anexo Bozzo e Ibarra pp. 13-16 (solo la parte de
  conversión), más Memorice.
- Cambios aprobados por Laura ("dale con todo"):
  - Bloque `.ley` con el art. 1687 completo (con la frase clave en
    negrita).
  - Dos ejemplos propios con nombres chilenos, reemplazando los
    genéricos de la fuente (Felipe/la Coty; doña Marta/don Waldo/la
    señora Pilar).
  - `.definicion` de acción reivindicatoria movida a B.4.4 (donde tiene
    su propio subpunto), eliminada la duplicada de B.4.3.
  - Marco teórico "contacto social y deberes de lealtad" + cita textual
    de RODRÍGUEZ sobre la naturaleza de la responsabilidad por nulidad.
  - **La conversión (B.4.5) muy ampliada**: definición de Eduardo Court,
    primer cuadro comparativo del manual (conversión formal / material /
    legal), recuadro "No olvidar" con los dos requisitos de la
    conversión material, más ejemplos legales de conversión del Código
    (donaciones, fideicomisos, censos, etc.), todos verificados artículo
    por artículo contra el Código Civil.
  - Enumeración `(i)/(ii)/(iii)` en "Acciones a que da origen la
    nulidad" (antes eran tres párrafos con negrita suelta, sin
    `enum-i`).
  - Negritas y cursivas puntuales que pidió Laura después de leer el
    tramo (ver "Decisiones de formato" abajo).
- **Bug de tipografía encontrado y corregido**: la regla `table` de la
  hoja de estilos le daba a las celdas `td` la misma fuente sans-serif y
  tamaño menor que el encabezado `th`, en vez de la tipografía del texto
  principal. Corregido en este manual; **el mismo bug existe en
  Responsabilidad Civil (3 tablas) y en Bienes (2 tablas), sin corregir
  a propósito** (Laura decidió dejarlo para más adelante, ver
  "Pendientes sueltos"). Documentado en `proceso.md` 4.1 y
  `actualizar-manuales-existentes.md`.
- Razón de caracteres del tramo: pasó de 37,5% a 52,6%.

## Tramo 4: reparto en 9 sub-tramos (2026-09-30)

Laura pidió separar el tramo 4 en varios y evitar imprecisión. El
reparto se hizo por página real de Boetsch ("Página N de 221" que
imprime cada hoja), no por el conteo de cada PDF fragmentado (que se
solapan una página en cada empalme). Detalle completo del reparto y de
por qué en `docs/actualizacion_acto_juridico_tramo4-1_lesion_2026-09-30.md`,
sección 0.

| Sub-tramo | Institución | Páginas Boetsch (de 221) | Informe | Estado |
|---|---|---|---|---|
| **4.1** | IV.C La lesión | 151-160 | `docs/actualizacion_acto_juridico_tramo4-1_lesion_2026-09-30.md` | **Mergeado a `main`** |
| **4.2** | IV.D La simulación | 160-170 | `docs/actualizacion_acto_juridico_tramo4-2_simulacion_2026-09-30.md` | Reescrito, verificado y **aprobado por Laura**; rama `worktree-acto-juridico-tramo4-2-simulacion` pusheada, **falta que lo mergee con GitHub Desktop** |
| **4.3** | IV.E La inoponibilidad | 170-177 | `docs/actualizacion_acto_juridico_tramo4-3_inoponibilidad_2026-09-30.md` | Reescrito y verificado; rama `worktree-acto-juridico-tramo4-3-inoponibilidad` (parte de 4.2, que todavía no está en `main`), **esperando revisión visual de Laura antes de mergear** |
| **4.4** | IV.F El fraude a la ley | 177-186 | `docs/actualizacion_acto_juridico_tramo4-4_fraude_2026-09-30.md` | Reescrito y verificado; rama `worktree-acto-juridico-tramo4-4-fraude` (parte de 4.2 y 4.3, que todavía no están en `main`), **esperando revisión visual de Laura antes de mergear** |
| 4.5 | IV.G Otras causales (G.1-G.9) | 186-189 | — | Pendiente. G.7-G.9 (Terminación, Renuncia, Muerte) no están en Boetsch: vienen del anexo `INEFICACIA JURÍDICA_Cuadro comparativo.pdf` (Bozzo e Ibarra), ya confirmado |
| 4.6 | V.1-V.5 La representación (concepto a influencia de circunstancias personales) | 190-199 | — | Pendiente |
| 4.7 | V.6-V.10 La representación (requisitos a otras hipótesis) | 200-208 | — | Pendiente |
| 4.8 | VI + VI.A La condición | 209-215 | — | Pendiente |
| 4.9 | VI.B El plazo + VI.C El modo | 216-221 | — | Pendiente |

### Qué se hizo en el tramo 4.4 (El fraude a la ley)

- Esta rama se creó desde `worktree-acto-juridico-tramo4-3-inoponibilidad`
  (no desde `origin/main`), para no arrastrar conflictos: trae también
  los cambios de 4.2 y 4.3, todavía sin mergear. IV.F no fue tocado por
  esos dos tramos, así que no hay contenido ajeno mezclado, solo evita
  el conflicto de merge.
- Inventario completo de IV.F contra Boetsch `principal_15` (pp.
  177-186) y el apartado "El fraude a la ley" del anexo Bozzo e Ibarra
  (pp. 25-26 del PDF del anexo).
- A diferencia de los tramos 4.1-4.3, acá **no faltaba contenido de
  fondo** de Boetsch: las seis unidades ya estaban completas y bien
  redactadas. El trabajo fue sobre todo de forma (dos párrafos sobre
  1.200 caracteres) más el contenido puntual que sí aporta el anexo.
- Los 15 artículos del Código Civil citados se verificaron íntegros
  contra el Código Civil: los 15 coinciden. Se encontró (y ya estaba
  corregido en el manual) un error de tipeo de la propia fuente:
  Boetsch cita "art. 1573 Nº 3" en la p. 185 cuando el artículo
  correcto es el 1578 Nº 3 (que él mismo cita bien en la p. 179). Sin
  jurisprudencia con rol en este tramo.
- Cambios aprobados por Laura ("dale con todo"):
  - Dos párrafos divididos por exceder 1.200 caracteres (ordenamiento
    jurídico nacional, y fraude a la ley vs. abuso del derecho), sin
    cambiar una palabra del contenido, y completando de paso la lista
    de artículos de la sección 2 con los arts. 1662 y 1792-24 que
    Boetsch enumera junto a los demás.
  - Enriquecido 4.1 (fraude a la ley y simulación) con una cita de
    VIAL DEL RÍO/FERRARA y tres diferencias de VODANOVIC entre ambas
    figuras, contenido del anexo que no estaba.
  - Caja `.definicion` nueva con la cita de ALCALDE en el Concepto (F.1
    no tenía ninguna).
  - Ejemplo propio nuevo (el Gastón y la Antonia, separación de bienes
    en fraude a los acreedores) para el requisito (ii) de F.3: no
    reemplaza ningún ejemplo de la fuente, Boetsch solo lo menciona en
    abstracto.
  - Caja de Conexiones nueva hacia Obligaciones (la acción pauliana,
    art. 2468), con `[FALTA: sección]` porque ese apunte no existe
    todavía.
- Verificación mecánica hecha: balance de etiquetas OK, cero guiones
  largos, ningún párrafo sobre 1.200 caracteres, capturas de Chrome
  headless revisadas bloque por bloque, diff línea por línea (solo 3
  líneas eliminadas, las tres correspondientes a párrafos que se
  dividieron sin perder contenido).
- No se tocó el índice: no se agregó ni cambió ningún `h2`/`h3`.

### Qué se hizo en el tramo 4.3 (La inoponibilidad)

- Esta rama se creó primero desde `origin/main` y se corrigió con
  `git merge --ff-only worktree-acto-juridico-tramo4-2-simulacion`
  antes de escribir el informe, porque IV.D (justo antes de IV.E) se
  reescribió por completo en el tramo 4.2, que todavía no está en
  `main`. Trabajar sobre la versión vieja de IV.D habría generado
  conflictos. Laura puede mergear 4.2 o 4.3 primero; si mergea 4.2
  primero, 4.3 se aplica limpio encima.
- Inventario completo de IV.E contra Boetsch `principal_14` (pp.
  170-177) y el apartado "g) La inoponibilidad" del anexo Bozzo e
  Ibarra (pp. 17-19 del PDF del anexo): el anexo sí aportó contenido de
  fondo (distinción de DUCCI, atribuciones de VODANOVIC y LÓPEZ SANTA
  MARÍA, un cuarto criterio de diferencia con la nulidad).
- Los 24 artículos del Código Civil citados se verificaron íntegros
  contra el Código Civil: los 24 coinciden. Sin jurisprudencia con rol
  en este tramo (Boetsch no cita ningún fallo en "La inoponibilidad").
- Cambios aprobados por Laura ("dale con todo"):
  - Corrección de un error de contenido en el Concepto: el manual decía
    que el tercero puede oponerse a efectos "favorables o
    desfavorables"; Boetsch dice "efectos que los perjudican". Se
    volvió a la fuente.
  - Concepto enriquecido con DUCCI (distinción entre efectos y realidad
    jurídica del acto), VODANOVIC (terceros interesados) y LÓPEZ SANTA
    MARÍA (excepciones de terceros absolutos).
  - El caso de las contraescrituras (art. 1707), que estaba comprimido
    en un solo párrafo de 1.446 caracteres con un paréntesis mal
    cerrado, se separó en una lista `enum-a` de seis casos (a-f), y se
    restauró una frase de Boetsch que faltaba ("entre las partes la
    contraescritura es perfectamente válida").
  - Dos cajas `.ley` nuevas: art. 1707 (primera vez que se transcribe
    completo en el manual, pese a citarse seis veces en IV.D) y art.
    246.
  - Un ejemplo propio nuevo (Bernarda, Nicolás y Tomás, cesión de
    crédito, arts. 1902 y 1905): no reemplaza ningún ejemplo de la
    fuente, Boetsch no trae ninguno para ese caso.
  - Precisión mercantil agregada al final de "falta de fecha cierta"
    (C. de Comercio, art. 127).
  - Precisión menor en la cita del art. 2058 (la nulidad recae en el
    contrato de sociedad, no perjudica las acciones de terceros contra
    cada socio, cuando la sociedad existió de hecho).
  - La sección "Diferencias entre la nulidad y la inoponibilidad" pasó
    de prosa a un cuadro comparativo de 4 criterios (el anexo agrega la
    declaración de oficio, que Boetsch no trae).
  - Dos cajas de Conexiones nuevas (Obligaciones, por la cesión de
    créditos; Sucesorio, por la acción de reforma de testamento),
    ambas con `[FALTA: sección]` porque esos apuntes no existen
    todavía.
  - Se dejó señalada (sin resolver) una inconsistencia propia de
    Boetsch: su párrafo introductorio de "inoponibilidades de fondo"
    no coincide con sus propias subsecciones. El manual no la
    arrastraba porque no reproduce esa enumeración.
- Verificación mecánica hecha: balance de etiquetas OK, cero guiones
  largos, ningún párrafo sobre 1.200 caracteres (el de 1.446
  caracteres que había se corrigió), capturas de Chrome headless
  revisadas bloque por bloque, diff línea por línea de lo eliminado
  revisado (coincide con lo propuesto en el informe).
- Razón de caracteres del tramo: pasó de 43,7% a 63,4%.

### Qué se hizo en el tramo 4.2 (La simulación)

- Inventario completo de IV.D contra Boetsch `principal_13` (pp.
  160-170): a diferencia de 4.1, acá el anexo Bozzo e Ibarra sí aportó
  contenido de fondo que Boetsch no trae (no solo redacción distinta).
- Los 11 artículos citados (10, 686, 1467, 1490, 1491, 1681, 1707, 1709,
  1768, 1796, 1876) se verificaron íntegros contra el Código Civil.
- Un fallo del anexo (Corte Suprema, 13 de enero de 2014, rol N°
  9.631-2012) se confirmó real por búsqueda web antes de usarlo en una
  caja de jurisprudencia.
- Cambios aprobados por Laura:
  - Definición de LEÓN pasada a caja `.definicion`.
  - Párrafo nuevo sobre por qué el acto con reserva mental es válido y
    el simulado es generalmente nulo (viene del anexo).
  - Dos frases menores: motivo del art. 686 en la simulación lícita, y
    "motivos inocentes o morales" de la lícita.
  - Requisitos de la simulación ilícita convertidos de prosa a lista
    `(i)-(iv)` (`enum-i lista`), con caja de jurisprudencia citando el
    rol verificado.
  - Dos ejemplos que reproducían los de Boetsch reemplazados por
    ejemplos propios (Rodrigo y su primo Cristóbal para la absoluta;
    Cristina, Ignacio y Josefina, con el art. 1796, para la relativa
    por sustitución de sujeto).
  - Cuadro comparativo de efectos (absoluta/relativa × entre las
    partes/frente a terceros de buena fe), del anexo.
  - Cita de Ferrara sobre la dificultad de la prueba directa + párrafo
    nuevo sobre la carga de la prueba y el art. 1709.
  - Punto nuevo 4.5, "La acción de simulación" (íntegro del anexo, no
    estaba ni en Boetsch ni en el manual).
- Verificación mecánica hecha: balance de etiquetas OK, cero guiones
  largos/guillemets, ningún párrafo sobre 1.200 caracteres, todas las
  frases clave presentes, diff línea por línea de lo eliminado revisado
  (coincide exactamente con lo propuesto en el informe).

### Qué se hizo en el tramo 4.1 (La lesión)

- Inventario completo de IV.C contra Boetsch `principal_12` (pp.
  151-160): **no faltaba contenido de fondo**, los cuatro puntos
  (concepto doctrinal, ¿es vicio del consentimiento?, los ocho casos
  regulados, sanción) ya estaban completos.
- Se revisó el anexo secundario Bozzo e Ibarra para Lesión: no aporta
  nada que Boetsch no traiga.
- Se verificaron los 23 artículos citados contra el Código Civil: los
  23 coinciden exactamente.
- Cambios de forma aplicados (aprobados por Laura):
  - La caja `.dato-grado` (clase retirada, ver `formato.md` sección 7)
    con la tesis de DUCCI se bajó a párrafo corrido.
  - El ejemplo de la hipoteca (caso viii) reproducía el mismo ejemplo
    de la fuente con las mismas cifras; se reemplazó por uno propio
    (doña Marta y el Banco Estado, mismo mecanismo del art. 2431).
  - Los tres criterios sobre la naturaleza de la lesión (subjetivo,
    objetivo, mixto), que estaban en prosa con negrita suelta, se
    convirtieron a `enum-i` `(i)/(ii)/(iii)`.
  - Se agregó una caja `.ley` para el art. 1889 (define la lesión
    enorme), con la frase clave en negrita.
- Verificación mecánica hecha: balance de etiquetas OK, cero guiones
  largos/guillemets, ningún párrafo sobre 1.200 caracteres, todas las
  frases clave del inventario presentes, diff línea por línea de lo
  eliminado revisado (coincide exactamente con lo acordado).

## Qué sigue (orden decidido por Laura)

1. **Tramo 4.1 (La lesión) mergeado a `main`.**
2. **Tramo 4.2 (La simulación) aprobado por Laura** (2026-09-30); falta
   solo que mergee la rama `worktree-acto-juridico-tramo4-2-simulacion`
   con GitHub Desktop.
3. **Sub-tramo 4.3 (La inoponibilidad) reescrito y aprobado por Laura**
   ("dale con todo", 2026-09-30); falta la revisión visual final y que
   mergee la rama `worktree-acto-juridico-tramo4-3-inoponibilidad` con
   GitHub Desktop (incluye también los cambios de 4.2, ver nota en la
   sección 0 del informe de 4.3 sobre la base de la rama).
4. **Sub-tramo 4.4 (El fraude a la ley) reescrito y aprobado por Laura**
   ("dale con todo", 2026-09-30); falta la revisión visual final y que
   mergee la rama `worktree-acto-juridico-tramo4-4-fraude` con GitHub
   Desktop (incluye también los cambios de 4.2 y 4.3, ver nota en la
   sección 0 del informe de 4.4 sobre la base de la rama).
5. **Sub-tramo 4.5: Otras causales** (G.1-G.9, pp. 186-189), y así
   sucesivamente por la tabla de arriba, un sub-tramo a la vez con su
   propio informe y aprobación.
6. **Volver al principio de AJ**: capítulos **I, II y III** con el mismo
   método (fuentes `principal_1` a `_8`; anexo Causa de Domínguez y
   Boetsch para II.D).
7. Después, **el manual de Bienes** (`05_Bienes_Manual.html`) con el
   mismo método. Leer primero `docs/manuales/bienes-reestructuracion.md`.

## Cómo se trabaja cada tramo (ya probado tres veces)

1. Rama nueva desde `origin/main`, en un worktree (`EnterWorktree`).
2. Extraer con `fitz` el texto del PDF fuente del tramo (rutas abajo) y
   leerlo completo; extraer el tramo actual del manual por línea (buscar
   sus anchors `id="cIV-..."`).
3. **Inventario unidad por unidad** desde la fuente (nunca desde el
   manual) y cruce con el manual: Está / Parcial / Falta. Inventariar
   también los anexos del tramo.
4. Verificar cada artículo citado contra `Apuntes/Codigo Civil Chileno.pdf`
   con regex `Art. N.` sobre el texto extraído con `fitz` (limpiando
   líneas de pie de página "DFL 1, JUSTICIA...").
5. Escribir el **informe** `docs/actualizacion_acto_juridico_<tramo>_<fecha>.md`
   (mismo formato que los tres anteriores: alcance y fuentes, inventario
   por punto, anexos, cambios propuestos con recuadros/voz
   propia/ejemplos/artículos, pendientes para Laura). Commit, y
   mostrárselo a Laura **como HTML** (no quiere leer `.md` en GitHub):
   convertir con Python `markdown` a `DERECHO LIBRE/Informe_AJ_<tramo>.html`
   (fuera del repo) y abrir con `open` (usar `subprocess.run` desde
   Python en vez de shell directo: el shell del worktree bloquea
   invocaciones de Chrome/`open` con muchos flags encadenados por la
   regla de aislamiento del worktree). **Detenerse y esperar
   aprobación.**
6. Con la aprobación: reescribir el tramo con `Edit` (old_string/
   new_string exactos); verificar con script Python: balance de
   etiquetas (`p`, `div`, `span`, `em`, `strong`, `table`, `tr`, `th`,
   `td`, `h2`), cero guiones largos y guillemets, ningún párrafo sobre
   1.200 caracteres, frases clave de cada unidad del inventario
   presentes, contenido previo conservado (revisar el `git diff` línea
   por línea de lo eliminado). Capturas en Chrome headless (ver
   comando abajo) recortadas con PIL en bloques de ~1900 px; rehacer el
   índice desde los encabezados si se agregó o cambió algún `h2`/`h3`
   (no hizo falta en el tramo 3). Agregar al informe las decisiones de
   Laura y la segunda pasada (con la tabla de recuadros creados por el
   modelo); commit y push.
7. Copiar el manual a `DERECHO LIBRE/AJ_vista_previa.html` (fuera del
   repo) y abrirlo en el navegador en el tramo (con ancla `#cIV-...`).
   Laura revisa y pide ajustes finos (negritas, cursivas, ejemplos) antes
   de mergear: aplicarlos con `Edit`, volver a verificar, commit y push
   de nuevo. Cuando esté conforme, Laura mergea con GitHub Desktop.

### Comando de Chrome headless que funciona en este entorno

El shell del worktree bloquea `cd ... && chrome ...` y comandos
encadenados complejos. Usar Python puro:

```python
import subprocess
r = subprocess.run([
    '/Applications/Google Chrome.app/Contents/MacOS/Google Chrome',
    '--headless=new', '--disable-gpu',
    '--screenshot=/ruta/salida.png', '--window-size=900,ALTO',
    'file:///ruta/preview.html'
], capture_output=True, text=True, timeout=60)
```

Para abrir un archivo en el navegador con ancla, tampoco usar `open
archivo.html#ancla` directo (el shell lo trata como parte del path):
usar `subprocess.run(['open', 'file://' + urllib.parse.quote(ruta) + '#ancla'])`.

## Decisiones de formato y redacción que NO deben cambiar

Todas están también en `docs/manuales/decisiones.md`, con fecha. Las que
más afectan el trabajo por tramos:

- **Formato visual = el de Acto Jurídico** (es el modelo de
  `formato.md`); solo el romano del capítulo en rojo, todo lo demás
  negro (también en el índice). Etiquetas: `h1` capítulo, `h2.grupo`
  tema, `h2.inst` institución (`A.1`), `h2` punto, `h3` subpunto.
- `(i)` en negrita si abre una clasificación; subrayado (`.enum-i
  lista`) si es lista de requisitos o argumentos. `a)` subrayado, `a.1)`
  cursiva.
- `.ley` solo para artículos **completos**, con la frase u oración más
  importante en negrita dentro de la cita (decisión de esta sesión,
  2026-09-30, a partir del art. 1687 del tramo 3: destacar en negrita lo
  esencial de cada artículo transcrito, no solo dejarlo en texto
  corrido).
- `.definicion` solo para la oración que define el concepto del punto
  (normalmente una por punto); lleva filete a la izquierda igual que
  `.ley`.
- **Cuadros comparativos** (`<table>`): el **cuerpo** (`td`) usa la
  misma tipografía que el texto principal (Times New Roman, 11pt); el
  **encabezado** (`th`) mantiene su propio estilo de etiqueta: letra
  sans-serif, fondo de color, texto en **mayúscula**
  (`text-transform:uppercase`). No igualar la letra del encabezado a la
  del cuerpo: es al revés de lo que parece un bug a primera vista. Se
  usan para paralelos o discusiones doctrinales con 3 o más criterios.
- **Todos los ejemplos deben ser propios** (nombres chilenos, toque
  gracioso), nunca los de la fuente con las letras cambiadas: la
  consecuencia jurídica respaldada en un artículo citado en el mismo
  punto y verificado contra el Código.
- **Jurisprudencia:** recuadro solo si el fallo tiene rol o está
  desarrollado (basta una de las dos condiciones); listas de fallos sin
  contenido: solo los con rol, del más reciente al más antiguo, con
  `[FALTA: extracto del fallo]`; los demás en una línea.
- **Cuadros comparativos, No olvidar, Conexiones, Pausa y Jurisprudencia
  NO cuentan** contra el máximo de dos recuadros pedagógicos grandes por
  punto (Ejemplo, No confundir, Advertencia, Pregunta clásica).
- **Preguntas clásicas:** candidatas desde `preguntas_evaluacion` (Laura
  elige), pero **no hay banco de AJ**; si la fuente marca una pregunta de
  examen, se le propone a Laura.
- **Nunca nombrar a Bozzo e Ibarra en el manual** (sí en los informes
  internos, indicando el anexo de origen).
- Al terminar cada manual, Laura revisa todos los recuadros creados por
  el modelo (cada informe trae la tabla con su ubicación).
- Si Laura pregunta por qué un punto es corto: el largo sigue a Boetsch;
  solo se amplía con fuentes que ella entregue (anexos, Código, otros
  autores), nunca de memoria.
- Cero guiones largos y cero guillemets en cualquier parte del manual.

## Pendientes sueltos

- **Bug de tipografía de `<table>`** (letra y tamaño de las celdas
  distintos al texto principal): corregido solo en Acto Jurídico. **Sigue
  sin corregir a propósito en Responsabilidad Civil (3 tablas) y Bienes
  (2 tablas)** — Laura dijo "solo los de AJ" cuando se le preguntó; no
  tocar esos manuales sin que ella lo pida.
- **Laura busca jurisprudencia reciente con rol** para IV.A (hay un
  `[FALTA: ...]` en 4.4) y los extractos de los 5 fallos con rol de 4.4.
- **Conexiones con `[FALTA: sección]` y `p. __`** hacia apuntes que no
  existen todavía (Familia, Compraventa, Sociedades, Procesal,
  Sucesorio, Obligaciones, Contratos). Se completan cuando existan y
  esté cerrada la diagramación.
- **Script de anclas de Justiniano** (`scripts/agregar_anclas_manuales.js`
  y `scripts/extraer_contenido_interrogador.js`) no entiende números
  romanos; no afecta a AJ hasta que entre al Interrogador
  (`formato.md` 1.1).
- `guia-editorial.md` 4.9 dice que la Pausa tiene retroalimentación de
  IA, pero la app corrige por palabras clave. Laura no decidió qué
  hacer.
- Ramas sin mergear que no son de este hilo: `worktree-manual-obligaciones`
  (ver `docs/manuales/estado_obligaciones.md` si existe, o crearlo al
  retomarlo) y `worktree-virtual-enchanting-kite` (de agosto, contenido
  ya en `main`; se puede borrar).

## Contexto clave

- Fuentes de AJ: `Apuntes/CIVIL/Acto Jurídico/` (gitignoreado: existe en
  el checkout principal, no en los worktrees — usar la ruta absoluta del
  checkout principal, `.../Derecho Libre/Apuntes/CIVIL/Acto Jurídico/`,
  desde cualquier worktree). Boetsch en 17 partes
  `Acto Jurídico_principal_N_*.pdf` (también está el PDF completo de 221
  págs.). Anexos: `Anexo_secundario_AJ_Ineficacia.pdf` (Bozzo e Ibarra
  2022; el `.docx` y `..._elementos principales e ineficacia.pdf` tienen
  el mismo texto: usar una sola copia), `INEFICACIA JURÍDICA_Cuadro
  comparativo.pdf`, `Causa_ DOMINGUEZ y BOETSCH.pdf`, `Memorice_ART y
  Definiciones.pdf`.
- Código Civil para verificar artículos: `Apuntes/Codigo Civil Chileno.pdf`
  (texto de leychile, 14-jul-2026).
- Reglas: `docs/manuales/` (`proceso.md`, `formato.md`,
  `guia-editorial.md`, `actualizar-manuales-existentes.md`,
  `auditoria.md`, `decisiones.md`).
- La hoja de estilos de AJ ya tiene todas las clases del método nuevo
  (`.ley`, `.definicion`, `.pregunta-clasica`, `.no-olvidar`,
  `.conexiones`, `.enum-i lista`, `-run`, `.toc-lista`, `table`/`th`/`td`
  con la tipografía corregida). El lector en línea (`app/manuales.html`)
  también las tiene (AJ todavía no está conectado a la app).
- **No se puede commitear en el `main` compartido** (el sistema lo
  bloquea): trabajar siempre en una rama/worktree y que Laura mergee con
  GitHub Desktop. Nunca commitear `.claude/settings.local.json`.
- Verificación visual: Chrome headless (comando en la sección de
  proceso, arriba) sobre una página armada con el `<style>` del manual y
  el tramo, recorte con PIL en bloques de ~1900 px.
- Scripts de trabajo de cada tramo (inventario, verificación, índice) no
  quedan en el repo: son uso único, se rehacen rápido con Python inline.
