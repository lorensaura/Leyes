# Incidente: compresión de contenido en Bienes y Acto Jurídico

> Ábrelo antes de retomar la reparación de Acto Jurídico o de Bienes. Es
> el registro del problema, la evidencia y el plan de arreglo por partes.
> El fix del proceso para que esto no vuelva a pasar está en
> `docs/script_apuntes.md` (secciones 0.4, 1.6 y 2.1), no acá.
>
> **Acto Jurídico ya no está "sin empezar": ver la sección "Fase 1"
> más abajo antes de creer el 49% de la tabla de arriba.** Existe una
> auditoría independiente y más precisa (`docs/auditoria_acto_juridico_2026-08-13.md`)
> con sus 49 hallazgos ya corregidos en una rama sin fusionar a `main`
> (detalle en `.claude/handoff/ESTADO_ACTUAL.md`, Hilo 23). Lo que falta
> ahí es un merge de git, no releer fuentes ni escribir contenido nuevo.

## Qué pasó

Laura notó, al revisar el PDF de Bienes (205 páginas), que era poco más
de la mitad de las 382 páginas de su apunte fuente, pese a haber
trabajado con más documentos (apunte principal + 12 anexos). Preguntó si
lo mismo le había pasado a Acto Jurídico. Sí.

Medido en caracteres de texto plano (fuente y manual, sin encabezados de
página repetidos tipo "Facultad de Derecho UC" / materia / autor /
"Página X de Y"):

| Manual | Fuente (chars) | Manual (chars) | Fidelidad |
|---|---|---|---|
| Responsabilidad Contractual | 358.083 | 329.143 | **92%** |
| Acto Jurídico | 507.205 | 246.760 | **49%** |
| Bienes | 827.240 | 472.946 | **57%** |

Contractual (y por extensión Precontractual, construida con el mismo
proceso, sin verificar todavía con este método) prácticamente no perdió
contenido. Acto Jurídico y Bienes se quedaron con poco menos de la mitad
de su fuente cada uno.

## Causa raíz

No fue apuro ni mala fe: fue redactar el párrafo final del manual
directamente desde la lectura de la fuente (síntesis), en vez de partir
de una transcripción cercana y solo ahí cortar en párrafos densos. La
regla de densidad de párrafo (`docs/script_apuntes.md` §1.6, "espaciar no
es resumir") ya existía y se cumplió en la forma: los párrafos de Bienes
sí quedan en 400-700 caracteres. Pero cumplir esa forma sintetizando de
memoria en vez de recortando una transcripción cercana hace fácil que un
argumento completo, una excepción o un ejemplo de la fuente no aparezca
en ningún lado del manual, sin que quede marca de que se omitió.

**Ejemplo concreto** (Bienes, Eje A, "Bienes corporales e incorporales",
crítica a la clasificación): la fuente trae dos argumentos seguidos.

1. La clasificación cosifica los derechos: los objeta la doctrina
   extranjera porque la relación cosa-derecho es vertical (la cosa es
   objeto del derecho) y no debería poder invertirse en horizontal (el
   derecho, a su vez, siendo cosa).
2. Un argumento distinto: el derecho de propiedad específicamente no
   puede considerarse "cosa", porque generaría una cadena infinita e
   inútil de derechos sobre derechos, con un ejemplo trabajado (derecho
   de propiedad sobre un automóvil, derecho de propiedad sobre ese
   derecho, y así sucesivamente).

El manual solo tiene el primer argumento. El segundo, con su ejemplo, no
está en ningún lado: no fue cortado a un recuadro ni se marcó como
omitido a propósito, simplemente no se transcribió.

Este patrón no está concentrado en un par de puntos aislados: la brecha
de 43-51 puntos porcentuales frente a Contractual está repartida de forma
pareja a lo largo de todo el documento (se verificó comparando Eje W,
escrito más al final de la sesión de Bienes, contra su fuente: 67% de
fidelidad, mejor que el promedio pero igual lejos de Contractual). No es
"dos ejes que quedaron flacos", es el método usado en el 100% de ambos
manuales.

**Lo que esto NO incluye:** las condensaciones que sí quedaron marcadas
a propósito (Eje U de Bienes, sucesión acotada porque ese detalle
pertenece a Derecho Sucesorio; Eje V, mejoras de la propiedad fiduciaria
remitidas a las reglas del usufructo) siguen siendo decisiones válidas,
documentadas en su momento en el commit correspondiente. El problema es
todo lo demás: el contenido que se perdió sin que nadie lo decidiera ni
lo anotara.

## Fix de proceso (ya aplicado)

`docs/script_apuntes.md`, tres cambios:

- **§0.4** (regla de oro nueva): prohíbe explícitamente resumir al
  reformatear, con referencia a este documento.
- **§1.6**: agrega el ejemplo real de arriba como ilustración canónica
  del anti-patrón, y un chequeo mecánico obligatorio de fidelidad
  (razón caracteres-manual ÷ caracteres-fuente-limpia, objetivo 80-90%,
  con el script de referencia) que se corre al cerrar cada tramo, no
  solo al final del manual.
- **§2.1**: el paso de "ensamblado" pasa de ser una sugerencia a un paso
  obligatorio y explícito: transcripción cercana del tramo primero,
  reformateo de esa transcripción después, nunca redacción directa desde
  la fuente al párrafo final.

Manuales nuevos que se construyan desde ahora siguen ese proceso. Esto no
repara los dos manuales ya afectados, que es lo que sigue abajo.

## Plan de reparación, por partes

**Instrucción explícita de Laura: avanzar por partes, un lote a la vez,
para que no quede a medias.** No se reescribe ningún manual completo de
una sola pasada. Orden acordado: **primero Acto Jurídico, después
Bienes.**

Estado a la fecha de este documento: **no ha empezado ninguna reparación
de contenido**, en ninguno de los dos manuales. Solo existe el
diagnóstico y el fix de proceso de arriba.

### Método por tramo (igual para ambos manuales)

Para cada eje (o tramo corto, si el eje es largo):

1. Releer el texto plano de la fuente de ese eje (ya extraído, o
   extraer de nuevo con `fitz` si no está a mano).
2. Releer el HTML ya escrito de ese mismo eje.
3. Correr el chequeo de fidelidad de `docs/script_apuntes.md` §1.6 sobre
   ese tramo, para tener un número de partida.
4. Identificar qué se perdió: argumentos completos, excepciones,
   ejemplos, casuística, autores citados en la fuente que no llegaron al
   manual. No hace falta reescribir lo que ya está bien; solo agregar lo
   que falta, respetando el formato y la densidad de párrafo ya
   aplicados (más párrafos y recuadros, no párrafos más largos).
5. Verificar el tramo con las mismas herramientas ya usadas en cada
   manual (balance de etiquetas, cero guiones largos, densidad de
   párrafo, artículos citados correctos) antes de cerrarlo.
6. Un commit por tramo, con el detalle de qué se agregó y la fidelidad
   antes/después. No pasar al siguiente tramo sin cerrar el anterior.

### Fase 1: Acto Jurídico — CORRECCIÓN: ya está hecha, en otra rama sin mergear

**Esto es una corrección sobre lo que este documento decía antes ("sin
empezar"). Era incorrecto.** Al escribir la primera versión de este
documento no se sabía que ya existía una auditoría independiente,
completa y verificada, de Acto Jurídico: `docs/auditoria_acto_juridico_2026-08-13.md`,
hecha en la rama `worktree-auditoria-acto-juridico` con una metodología
más precisa que la de este documento (comparación cualitativa eje por
eje contra las 17 fuentes PDF + secundarias, con 7 categorías de
hallazgo, no solo una razón de caracteres). Según
`.claude/handoff/ESTADO_ACTUAL.md` (Hilo 23, verificado con `git log`),
**los 49 hallazgos de esa auditoría ya están cerrados y corregidos en el
HTML**, en esa rama.

El 49% de fidelidad medido en este documento (507.205 → 246.760
caracteres) se calculó contra una copia de `04_Acto_Juridico_Manual.html`
que no tenía esas correcciones aplicadas: no es una medición del estado
final corregido, es del estado que la auditoría diagnosticó como
insuficiente. **No usar este número para decidir si falta trabajo**: la
auditoría ya es la referencia correcta.

**Lo que sí sigue pendiente, y no es un problema de contenido sino de
git:** `main` solo tiene fusionada la primera tanda de esa rama (ejes N,
H, C). El resto del trabajo (ejes B, D, E-G, `sI9`, L-M, `sO2-1`, P-R, y
un ajuste estructural del eje S) sigue solo en la rama, sin fusionar.
Además apareció un commit directo en `main` (`53757d9`, "arreglo apunte
Acto jurídico") que también toca el eje B, la misma sección que la rama
sin fusionar también corrige: **antes de fusionar la rama hay que
comparar ambos cambios al eje B para no duplicar o pisar una corrección**
(instrucciones exactas en el Hilo 23 del handoff). Este análisis y el
merge en sí son trabajo de git/integración, no de redacción de
contenido: no requieren releer las fuentes ni escribir nada nuevo.

### Fase 2: Bienes

- Fuente: los 20 `BIENES_principal_N_*.pdf` / `Bienes_principal_N_*.pdf`
  de `Apuntes/CIVIL/Bienes/` (354-382 páginas según se cuenten por
  extracción o por el número de página impreso en el pie).
- Manual: `05_Bienes_Manual.html` → `app/pdf/Bienes.pdf`.
- Fidelidad medida: 57% (827.240 → 472.946 caracteres).
- Los 12 anexos de Bienes ya se revisaron e incorporaron lo verificable
  (detalle en la memoria del proyecto, entrada
  `project_apunte_bienes_anexos_pendiente.md`, no en esta carpeta
  `docs/`); esa parte no se repite. Lo que falta es releer el apunte
  principal contra lo ya escrito, eje por eje, y completar lo que se
  perdió.
- Sin empezar.
