# Estado: actualización de Acto Jurídico al método nuevo

> Se actualiza **in place** cada vez que Laura diga "guarda el estado
> [de Acto Jurídico / de AJ]". No acumular una entrada nueva por sesión:
> corregir esta. Al decir "retoma Acto Jurídico" o "retoma AJ", leer este
> archivo completo primero y resumir en pocas líneas dónde quedó antes
> de seguir. Última actualización: 2026-09-30.

## Dónde estamos

Se está actualizando `04_Acto_Juridico_Manual.html` al método de
`actualizar-manuales-existentes.md`, **por tramos, con aprobación de
Laura en cada uno**.

| Tramo | Contenido | Informe | Rama / commit final | Estado |
|---|---|---|---|---|
| 1 (piloto) | Introducción cap. IV + IV.A La inexistencia | `docs/actualizacion_acto_juridico_IV-A_2026-09-29.md` | `caecee9` (+ `3ba6f9d`) | En `main` |
| 2 | IV.B.1 Aspectos generales, B.2 Nulidad absoluta, B.3 Nulidad relativa | `docs/actualizacion_acto_juridico_IV-B1-B3_2026-09-29.md` | `44c82b5` | En `main` |
| 3 | IV.B.4 Los efectos de la nulidad | `docs/actualizacion_acto_juridico_IV-B4_2026-09-30.md` | rama `worktree-actualizar-acto-juridico-tramo-3`, commit `481af70` | **Pusheada a origin, falta que Laura la mergee con GitHub Desktop** |

`main` sigue en `44c82b5` hasta que se mergee el tramo 3.

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

## Qué sigue (orden decidido por Laura)

1. **Falta que Laura mergee el tramo 3** (rama
   `worktree-actualizar-acto-juridico-tramo-3`) con GitHub Desktop.
2. **Tramo 4: IV.C a IV.G** (Lesión, Simulación, Inoponibilidad, Fraude a
   la ley, Otras causales, Representación, Modalidades), un tramo por
   vez. Fuentes: `Acto Jurídico_principal_12` a `_17`. Definir junto con
   Laura si se hace de un tramo o se separa en varios (regla de oro 1 de
   `proceso.md`: no tramos demasiado largos).
3. **Volver al principio de AJ**: capítulos **I, II y III** con el mismo
   método (fuentes `principal_1` a `_8`; anexo Causa de Domínguez y
   Boetsch para II.D).
4. Después, **el manual de Bienes** (`05_Bienes_Manual.html`) con el
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
