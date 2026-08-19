# Incidente: compresión de contenido en Bienes y Acto Jurídico

> Ábrelo antes de retomar la reparación de Acto Jurídico o de Bienes. Es
> el registro del problema, la evidencia y el plan de arreglo por partes.
> El fix del proceso para que esto no vuelva a pasar está en
> `docs/script_apuntes.md` (secciones 0.4, 1.6 y 2.1), no acá.
>
> **Actualizado 2026-08-19: Acto Jurídico está terminado, no solo
> "empezado".** Ver la sección "Fase 1" más abajo antes de creer el 49%
> de la tabla de arriba: ese número mide un estado ya superado. La rama
> `worktree-auditoria-acto-juridico` tiene los 49 hallazgos de la
> auditoría corregidos, más una segunda pasada de comparación directa
> contra los 17 PDF fuente ("reparación de compresión") y una tercera de
> fuentes secundarias (Fase B), PDF regenerado (134 páginas), y el
> conflicto de merge con `main` (en `docs/auditoria_acto_juridico_2026-08-13.md`)
> ya resuelto y pusheado. Solo falta que Laura mergee esa rama a `main`
> desde GitHub Desktop, revise el contenido, y la enlace en
> `app/manuales.html`.

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

### Fase 1: Acto Jurídico, terminada, incluido el merge con `main`

**Estado al 2026-08-19: completo en tres pasadas, en la rama
`worktree-auditoria-acto-juridico`, sin bloqueos de git pendientes.**

1. Los 49 hallazgos de `docs/auditoria_acto_juridico_2026-08-13.md`
   (comparación cualitativa eje por eje contra las 17 fuentes PDF +
   secundarias, 7 categorías de hallazgo) se cerraron primero.
2. Una segunda pasada, más profunda ("reparación de compresión",
   documentada en `corrección_manual_actojuridico.md` dentro de esa
   misma rama), volvió a comparar cada uno de los 21 ejes directamente
   contra el texto completo de los 17 PDF de Boetsch. Encontró huecos que
   la auditoría por categorías no había detectado (ej. el eje A, que la
   auditoría marcó "sin hallazgos", tenía 3 argumentos completos
   faltantes).
3. Una tercera pasada (Fase B) agregó los argumentos de las fuentes
   secundarias (Bozzo e Ibarra, Domínguez/Boetsch) que todavía faltaban
   en 7 ejes.

El 49% de fidelidad medido en este documento (507.205 → 246.760
caracteres) se calculó contra el estado previo a las tres pasadas: **no
usar este número**, ya no describe el manual actual.

**El commit directo en `main` (`53757d9`, "arreglo apunte Acto
jurídico") que preocupaba en la versión anterior de esta nota ya se
revisó**: tocaba el eje B, la misma sección que la rama corrige de forma
independiente, pero en líneas distintas del archivo (confirmado con
`git merge-tree`, sin conflicto real en el HTML). El único conflicto de
verdad estaba en el documento de seguimiento
`docs/auditoria_acto_juridico_2026-08-13.md` (ambas ramas habían
actualizado su resumen ejecutivo de forma distinta); se resolvió
fusionando `main` dentro de la rama, con un commit de merge que además
actualiza ese resumen para reflejar las tres pasadas completas, y ya se
pusheó. Confirmado con `git merge-tree --write-tree main
origin/worktree-auditoria-acto-juridico`: fusiona limpio.

El PDF (`app/pdf/Acto_Juridico.pdf`, 134 páginas) se regeneró al cierre
de la Fase B. **Lo único que falta es que Laura mergee la rama a `main`
desde GitHub Desktop** (ya no debería mostrar conflictos), revise el
contenido, y la enlace en `app/manuales.html`.

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
