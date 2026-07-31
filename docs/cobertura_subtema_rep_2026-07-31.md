# Fase 1 REP: tabla de cobertura por eje (2026-07-31)

> Fase 1 del plan "llevar Evaluación a su techo por tema/subtema" (REX → REC
> → REP, ver `docs/camino-a-beta.md`), después de la Fase 0 de Precontractual
> (`docs/fase0_rep_clasificacion_2026-07-31.md`). **Importante, igual que en
> REC: la Fase 0 de Precontractual todavía NO se aplicó en Supabase.** Son 59
> `UPDATE` propuestos, pendientes de que Laura los corra en el SQL Editor.
> Por eso este documento mezcla dos tipos de dato:
> - La columna **Evaluación** (Aplic/DetE/Just/DiscMC) muestra **cómo va a
>   quedar la cobertura una vez corridos esos 59 `UPDATE`**, no el estado
>   actual de Supabase (hoy las 60 filas todavía tienen `tema = null`).
> - Las columnas **Flashcards** y **Alternativas** sí son estado en vivo de
>   hoy 2026-07-31 (la Fase 0 nunca tocó esas tablas).
>
> El catálogo de 10 ejes se verificó en vivo contra Airtable (`Digesto
> Precontractual`, tabla `Temas`, `baseId appeZI0TkAC3uaeVW`): son
> exactamente 10 registros, letra por letra idénticos a los 10 `<h1>` de
> `03_Responsabilidad_Precontractual_Manual.html` (ya lo había confirmado la
> Fase 0; esta Fase 1 lo recontó en vivo, sin cambios).

## Aritmética de partida: 60 filas, 59 clasificadas + 1 sin resolver

A diferencia de Extracontractual y Contractual, acá no hubo ningún ítem de
otra materia ni ninguna fila corrupta: las 60 filas de `evaluacion_practica`
con `materia = 'Responsabilidad precontractual'` reparten limpio en 59
clasificados + 1 genuinamente ambiguo (`hist-pre-mc-015`, entre eje B y eje
J, ver sección propia de `docs/fase0_rep_clasificacion_2026-07-31.md`). Esta
tabla **no fuerza `hist-pre-mc-015` a ningún eje**: se muestra aparte, no
sumado a B ni a J.

Verificación por tipo contra las 60 filas en vivo (`select codigo, tipo, tema` a
`evaluacion_practica`, consultado hoy mismo): las 60 confirmadas, con `tema`
en `null` en el 100% de los casos (la Fase 0 todavía no se corrió) y el
conjunto de 60 `codigo` coincide exacto, uno a uno, con los 59 del bloque
SQL de la Fase 0 más `hist-pre-mc-015` (0 códigos de más, 0 de menos).

| Tipo | En vivo (60) | Clasificados (59) | Sin resolver |
|---|---|---|---|
| aplicación | 10 | 10 | 0 |
| justificación | 10 | 10 | 0 |
| detección de error | 10 | 10 | 0 |
| discriminación MC | 30 | 29 | 1 (`hist-pre-mc-015`) |
| **Total** | **60** | **59** | **1** |

Cuadra exacto: 59 + 1 = 60.

## Tabla maestra: los 10 ejes × 7 columnas

**Flashcards**: consultado en vivo contra `flashcards` filtrando
`materia = eq.Responsabilidad precontractual`, campo `tema` (link real a
`Temas`, no clasificación manual). 59 flashcards totales, las 59 con `tema`
asignado (ninguna en `null`).

**Alternativas**: la tabla `alternativas` usa `materia = 'precontractual'`
(formato distinto al de `evaluacion_practica`, verificado en vivo: los
valores en esa tabla son `contractual` / `precontractual` / `extracontractual`
/ `transversal`, 47 filas para precontractual). No tiene columna `tema` en
Supabase, así que su columna es clasificación manual hecha para este
documento, leyendo cada `pregunta`/`subtema`/`fuente` de las 47 filas contra
`03_Responsabilidad_Precontractual_Manual.html` línea por línea. **Las 47 se
pudieron clasificar con confianza** (a diferencia de REX, donde 1 de 41
quedó sin ubicar): varias se verificaron contra el texto exacto del manual,
no solo contra el `subtema`, cuando el ítem citaba doctrina o artículos que
aparecen en más de un eje (ej. Boffi/art. 99 aparece en el Eje E como
fundamento y se referencia de nuevo en el Eje H, se verificó el pasaje
completo para no confundirlos).

| Eje | Aplic | DetE | Just | DiscMC | **Total Eval** | Flash | Altern |
|---|---|---|---|---|---|---|---|
| A. Planteamiento del problema y concepto de responsabilidad precontractual | 1 | 1 | 1 | 3 | **6** | 6 | 4 |
| B. Evolución doctrinaria: de la doctrina tradicional a la doctrina moderna | 1 | 1 | 1 | 2 | **5** | 6 | 5 |
| C. Las etapas del proceso de formación del contrato y el estatuto de responsabilidad aplicable en cada una | 1 | 1 | 1 | 3 | **6** | 6 | 5 |
| D. El interés jurídicamente protegido y el fundamento de la buena fe | 1 | 1 | 1 | 3 | **6** | 6 | 5 |
| E. Naturaleza jurídica de la responsabilidad precontractual | 1 | 1 | 1 | 3 | **6** | 6 | 5 |
| F. Determinación de los daños a resarcir en la responsabilidad precontractual | 1 | 1 | 1 | 3 | **6** | 6 | 5 |
| G. Los requisitos para que nazca el derecho a la reparación y su aplicación jurisprudencial | 1 | 1 | 1 | 3 | **6** | 6 | 5 |
| H. La responsabilidad de quien causa la nulidad del contrato | 1 | 1 | 1 | 3 | **6** | 6 | 5 |
| I. La responsabilidad postcontractual | 1 | 1 | 1 | 3 | **6** | 5 | 4 |
| J. La responsabilidad precontractual en el derecho comparado y síntesis general de la materia | 1 | 1 | 1 | 3 | **6** | 6 | 4 |
| *(sin resolver: `hist-pre-mc-015`, entre B y J)* | - | - | - | 1 | **1** | - | - |

Totales: 59 Evaluación clasificada (+1 sin resolver = 60 en vivo), 59
Flashcards, 47 Alternativas. En Evaluación, el único eje bajo el resto es
**B (5, todos los demás en 6)**, y es un artefacto directo de
`hist-pre-mc-015` sin resolver (ver hallazgo 3): si se asignara a B, los 10
ejes quedarían parejos en 6. En Flashcards, el único eje bajo el resto es
**I (5, todos los demás en 6)**, un eje distinto de B, sin relación entre
ambos huecos (ver hallazgo 2).

## Hallazgo 1 (el más importante): cobertura extraordinariamente pareja, sin ejes en cero ni concentración anómala

A diferencia de Extracontractual (rango 2-14 en Evaluación, 7-12 en
Flashcards) y sobre todo de Contractual (5 ejes en cero en Evaluación, 19 de
21 ejes en cero en Flashcards por la concentración en solo 2 ejes),
**Precontractual llega a esta Fase 1 sin ningún hueco estructural**:

- **Evaluación:** 9 de los 10 ejes quedan parejos en 6 ítems (post-`UPDATE`);
  solo B queda en 5, y es un artefacto puntual de `hist-pre-mc-015` sin
  resolver (hallazgo 3), no un hueco de contenido real. Ningún eje en cero.
- **Flashcards:** se verificó explícitamente si iba a repetirse la
  concentración de Contractual (200 de 225 tarjetas en un solo eje): **no
  pasa acá**. Los 10 ejes tienen 6 flashcards cada uno, salvo el eje I con
  5. Es la distribución más pareja de las tres materias vistas hasta ahora.
- **Alternativas:** 4-5 por eje (A, I y J con 4; el resto con 5), sin ningún
  eje en cero y sin ningún ítem sin ubicar.

La razón más probable es que, a diferencia de Extracontractual (2428
líneas, 25 ejes) y Contractual (2058 líneas, 21 ejes, con secciones que
además no calzan 1:1 con Airtable), el manual de Precontractual es
sensiblemente más corto (1304 líneas, verificado en vivo) y tiene solo 10
secciones parejas, cada una un `<h1>` propio, y aparentemente el contenido
de Práctica se generó sistemáticamente eje por eje, en tandas parejas
(visible en el propio patrón "1 aplicación + 1 detección + 1 justificación
+ 3 discriminación MC por eje" que aparece en 9 de los 10 ejes tras la
Fase 0, y en el "6 flashcards por eje" casi uniforme).

## Hallazgo 2: ningún eje queda débil en las tres columnas a la vez; el eje I es el laggard más consistente, pero solo en dos de las tres

A diferencia de lo que se podría esperar, **el eje bajo el resto en
Evaluación (B) y el eje bajo el resto en Flashcards (I) son ejes distintos,
sin relación entre sí** (B por el ítem sin resolver, I por una razón propia
de esa tabla que no se investigó más a fondo, fuera de alcance de esta
Fase 1 de solo lectura). El eje I sí es el que aparece con menos ítems en
dos de las tres columnas (Flashcards con 5 en vez de 6, Alternativas con 4
en vez de 5, empatado con A y J), pero en Evaluación queda igual que los
otros 8 ejes ya cerrados (6). No hay, en esta materia, un eje que sea el
"más débil" de forma inequívoca en las tres columnas simultáneamente, como
sí ocurría con los ejes en cero de Contractual.

## Hallazgo 3: el ítem sin resolver (`hist-pre-mc-015`) es la única causa del desbalance en Evaluación

Si `hist-pre-mc-015` termina asignándose a B, ese eje sube de 5 a 6 y los 10
ejes quedan exactamente parejos en Evaluación, sin ningún eje por debajo del
resto. Si se asigna a J, J queda con 7 y B se mantiene en 5, único eje bajo
la media. En ningún escenario aparece un hueco estructural nuevo: la
decisión de Laura sobre este ítem (ver
`docs/fase0_rep_clasificacion_2026-07-31.md`) es de detalle, no de
prioridad urgente de cobertura.

## Comparación rápida con REX y REC (contexto, no parte de esta Fase 1)

| Materia | Ejes | Rango Evaluación | Ejes en cero (Eval) | Rango Flashcards | Concentración anómala en Flash |
|---|---|---|---|---|---|
| REX (Extracontractual) | 25 | 2-14 | 0 | 7-12 | No |
| REC (Contractual) | 21 | 0-6 | 5 | 0-200 | Sí (200/225 en 2 ejes) |
| REP (Precontractual) | 10 | 5-6 (+1 sin resolver) | 0 | 5-6 | No |

Precontractual es, de las tres materias revisadas hasta ahora, la que llega
a su Fase 1 en mejor estado relativo de cobertura pareja.

## Qué sigue (decisiones pendientes de Laura)

1. **Correr los 59 `UPDATE` de `docs/fase0_rep_clasificacion_2026-07-31.md`**
   en el SQL Editor de Supabase: esta tabla de cobertura recién refleja el
   estado real de Evaluación una vez hecho esto.
2. **Decidir sobre `hist-pre-mc-015`** (eje B vs. eje J, ver sección propia
   de la Fase 0): no es urgente para la cobertura (hallazgo 3), pero queda
   pendiente de cierre.
3. **Sin ejes débiles que ameriten generación de contenido nueva por ahora**
   (a diferencia de REX y REC, que sí dejaron candidatos claros): la única
   señal de asimetría es el eje I, un ítem por debajo del resto en
   Flashcards y Alternativas (no en Evaluación), no un hueco real.

No hay una "Fase 2" definida para Precontractual (mismo estado que REX y
REC al cerrar su Fase 1): la cobertura al techo real de los 10 ejes es meta
post-beta, no de esta ronda. Con esto, las tres materias de Responsabilidad
(REX, REC, REP) quedan con su Fase 0 + Fase 1 completas.
