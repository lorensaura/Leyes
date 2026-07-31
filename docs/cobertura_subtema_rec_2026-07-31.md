# Fase 1 REC: tabla de cobertura por tema/subtema (2026-07-31)

> Fase 1 del plan "llevar Evaluación a su techo por tema/subtema" (REX → REC
> → REP, ver `docs/camino-a-beta.md`), después de la Fase 0 de Contractual
> (`docs/fase0_rec_clasificacion_2026-07-31.md`). **Importante, a diferencia
> del doc equivalente de REX: la Fase 0 de Contractual todavía NO se aplicó
> en Supabase.** Son 40 `UPDATE` propuestos, pendientes de que Laura los
> corra en el SQL Editor. Por eso este documento mezcla dos tipos de dato:
> - La columna **Evaluación** (Aplic/DetE/Just/DiscMC) muestra **cómo va a
>   quedar la cobertura una vez corridos esos 40 `UPDATE`**, no el estado
>   actual de Supabase (hoy la mayoría de esas filas todavía tienen
>   `tema = null`).
> - Las columnas **Flashcards** y **Alternativas** sí son estado en vivo de
>   hoy 2026-07-31 (la Fase 0 nunca tocó esas tablas).
>
> El catálogo de 21 ejes se verificó en vivo contra Airtable (`Digesto
> Contractual`, tabla `Temas`, `baseId appxeVxAE53yIqRPa`): son exactamente
> 21 registros limpios. El registro fantasma `"rc-detect-001"` que la Fase 0
> había reportado contaminando esa tabla **ya no existe** (Laura lo limpió).

## Aritmética de partida: 48, no 46

El encargo de esta tarea estimaba "46 ítems (8 + 40 - 2)" para la columna
Evaluación. Ese cálculo resta dos veces: `rc-aplic-002` y `rc-just-001` **ya
estaban excluidos de los 40** clasificados en la Fase 0 (eran, junto con
`rc-detect-001`, las filas que la Fase 0 dejó fuera de su lote de 40 por
razones distintas: los dos primeros por resultar de otra materia, el
tercero por estar corrupto). Restarlos de nuevo de "8 + 40" no corresponde.
La cuenta real, verificada en vivo:

| Filtro sobre las 51 filas de `evaluacion_practica` con `materia = 'Responsabilidad contractual'` | Filas |
|---|---|
| Total en vivo hoy | 51 |
| `rc-detect-001` (corrupta, todos los campos contienen ese texto literal) | -1 |
| `rc-aplic-002` (se mueve a Extracontractual, eje 14) | -1 |
| `rc-just-001` (se mueve a Extracontractual, eje 23) | -1 |
| **Quedan como Contractual, clasificadas (8 ya existentes + 40 de la Fase 0)** | **48** |

Verificación por tipo contra los 51 datos en vivo (`select tipo, count(*)`):

| Tipo | En vivo (51) | En esta tabla (48) | Diferencia | Motivo |
|---|---|---|---|---|
| aplicación | 13 | 12 | 1 | `rc-aplic-002` → Extracontractual |
| justificación | 11 | 10 | 1 | `rc-just-001` → Extracontractual |
| detección de error | 10 | 9 | 1 | `rc-detect-001` (corrupta) |
| discriminación MC | 17 | 17 | 0 | — |
| **Total** | **51** | **48** | **3** | una fila por motivo de exclusión |

Cuadra exacto: 51 - 3 = 48. La tabla maestra de abajo usa 48, no 46.

## Tabla maestra: los 21 ejes × 7 columnas

Alternativas no tiene link a `Temas` en Supabase (mismo caso que
Extracontractual): su columna es clasificación manual hecha para este
documento, leyendo cada `pregunta`/`subtema`/`fuente` contra
`01_Responsabilidad_Contractual_Manual.html` línea por línea. A diferencia
de REX (donde 1 de 41 ítems quedó sin ubicar), **los 28 ítems de
Alternativas de Contractual se pudieron clasificar con confianza**, varios
verificados contra el texto exacto del manual (no solo contra el
`subtema`) cuando el ítem era ambiguo entre dos ejes vecinos (detalle en
"Hallazgos" más abajo).

| Eje | Aplic | DetE | Just | DiscMC | **Total Eval** | Flash | Altern |
|---|---|---|---|---|---|---|---|
| 1. Efecto de las obligaciones y sistema de remedios | 1 | 2 | 2 | 1 | **6** | 25 | 2 |
| 2. El pago (cumplimiento) y sus principios | 0 | 0 | 0 | 0 | **0** | 0 | 0 |
| 3. El incumplimiento: noción objetiva | 0 | 0 | 0 | 1 | **1** | 0 | 1 |
| 4. Obligaciones de medios y de resultado | 1 | 0 | 1 | 0 | **2** | 0 | 1 |
| 5. Requisitos de la indemnización de perjuicios | 0 | 0 | 0 | 0 | **0** | 0 | 0 |
| 6. La culpa contractual y su graduación | 1 | 0 | 1 | 1 | **3** | 200 | 1 |
| 7. El dolo contractual | 0 | 1 | 0 | 1 | **2** | 0 | 0 |
| 8. Presunción de culpa y carga de la prueba | 1 | 2 | 0 | 0 | **3** | 0 | 0 |
| 9. La mora | 0 | 1 | 0 | 1 | **2** | 0 | 1 |
| 10. El caso fortuito o fuerza mayor | 1 | 0 | 0 | 2 | **3** | 0 | 2 |
| 11. La teoría de los riesgos | 0 | 0 | 0 | 0 | **0** | 0 | 0 |
| 12. Los perjuicios indemnizables | 3 | 0 | 1 | 1 | **5** | 0 | 2 |
| 13. Avaluación de perjuicios y cláusula penal | 0 | 0 | 0 | 0 | **0** | 0 | 2 |
| 14. El cumplimiento forzado | 1 | 0 | 0 | 0 | **1** | 0 | 3 |
| 15. La resolución y el pacto comisorio | 1 | 1 | 1 | 2 | **5** | 0 | 3 |
| 16. La autonomía de la acción indemnizatoria | 0 | 0 | 1 | 1 | **2** | 0 | 1 |
| 17. Las eximentes de responsabilidad | 0 | 0 | 0 | 1 | **1** | 0 | 1 |
| 18. Imprevisión y frustración del fin del contrato | 0 | 1 | 1 | 1 | **3** | 0 | 1 |
| 19. Los derechos auxiliares del acreedor | 1 | 1 | 1 | 2 | **5** | 0 | 4 |
| 20. Cláusulas modificatorias de responsabilidad | 1 | 0 | 1 | 2 | **4** | 0 | 3 |
| 21. Prescripción de las acciones | 0 | 0 | 0 | 0 | **0** | 0 | 0 |

Totales: 48 Evaluación (proyectado post-`UPDATE`), 225 Flashcards, 28
Alternativas.

## Hallazgo 1 (el más grave): Flashcards de Contractual, 225 tarjetas concentradas en solo 2 de los 21 ejes

A diferencia de Extracontractual (204 flashcards repartidas 7-12 por cada
uno de sus 25 ejes, confirmado en vivo como control), **las 225 flashcards
de Contractual solo tienen `tema` asignado a dos ejes**: 200 al eje 6 (La
culpa contractual y su graduación) y 25 al eje 1 (Efecto de las
obligaciones y sistema de remedios). **Los otros 19 ejes tienen cero
flashcards.** Esto no es un problema de sincronización Airtable-Supabase
(se verificó directo en Airtable: el campo de link `tema` de la tabla
`Flashcards` apunta genuinamente a esos dos registros de `Temas`, ninguno
más, y el campo `id` interno de cada tarjeta, con prefijo `"1-"` o `"6-"`,
confirma que la propia tarjeta fue etiquetada así al crearla, no en un
backfill posterior). Es contenido real y mayoritariamente pertinente al
eje que dice (verificado leyendo una muestra al azar), pero la cobertura
temática de Flashcards para Contractual está, en la práctica, sin empezar
para 19 de sus 21 ejes.

**Dentro del bucket del eje 6 hay además una señal de mezcla de temas.**
Una revisión por palabra clave (no una reclasificación completa, fuera de
alcance de esta Fase 1 de solo lectura) encuentra que:
- **13 tarjetas** giran específicamente en torno a la distinción
  "obligaciones de medios vs. de resultado" (tema del eje 4, no del eje 6):
  ids `6-083`, `6-084`, `6-085`, `6-086`, `6-087`, `6-088`, `6-107`,
  `6-160`, `6-161`, `6-162`, `6-188`, `6-190`, `6-195`. Ejemplo: "¿Cuál de
  los dos tipos de obligación constituye la regla general: de medios o de
  resultado?" no trata sobre graduación de la culpa.
- **18 tarjetas más** giran sobre la presunción de culpa y la carga de la
  prueba en general (tema del eje 8), sin referirse a los grados de culpa
  del art. 44: ids `6-004`, `6-032`, `6-050`, `6-051`, `6-052`, `6-053`,
  `6-058`, `6-080`, `6-081`, `6-134`, `6-139`, `6-164`, `6-165`, `6-166`,
  `6-167`, `6-189`, `6-198`, `6-199`. Ejemplo: "¿Qué dos disposiciones
  citadas por Orrego fundan que la culpa contractual se presume?".

Esto sugiere que, de las 200 tarjetas hoy en eje 6, del orden de 30
(15%) probablemente pertenecen a otro eje (sobre todo 4 y 8), y que el
resto sí es contenido genuino de graduación de la culpa. **No se
recalificó nada acá** (es un dato de solo lectura para que Laura decida si
amerita una pasada de reetiquetado); es una hipótesis con evidencia, no un
hecho consumado, a diferencia de las clasificaciones de la Fase 0 que sí
se verificaron contra el manual una por una.

## Hallazgo 2: ejes 2, 11 y 21 en cero por diseño del manual, no por falta de contenido

Ya lo había encontrado la Fase 0: los ejes 2 ("El pago"), 11 ("La teoría
de los riesgos") y 21 ("Prescripción de las acciones") no tienen una
sección propia en `01_Responsabilidad_Contractual_Manual.html` con ese
nombre. Esta Fase 1 lo confirma y le agrega una segunda pata: **el
contenido relacionado con esos tres puntos existe, pero vive absorbido
dentro de la sección de un eje vecino**, no falta de verdad:
- Eje 2 (el pago): la sección `s2a` (eje 3, El incumplimiento) abre
  definiendo el incumplimiento a través de su reverso, el pago (art. 1568,
  identidad e integridad) — el punto está ahí, sin sección propia.
- Eje 11 (teoría de los riesgos): el ítem más cercano a ese tema
  (`rc-mc-003`, "Imposibilidad y pérdida de la cosa debida") quedó
  clasificado en el eje 10 porque el pasaje que responde la pregunta está
  físicamente dentro de `s6a` (caso fortuito), no en una sección de
  "riesgos" con nombre propio.
- Eje 21 (prescripción): las tres Alternativas sobre prescripción de
  distintas acciones contractuales no cayeron en un eje "prescripción",
  cayeron cada una dentro de la sección de la acción que prescribe:
  `rc-alt-009` (prescripción de la acción ejecutiva) en `s3e`/eje 14,
  `rc-alt-011` (prescripción de la acción resolutoria) en `s4f`/eje 15, y
  `rc-alt-024` (prescripción de la acción pauliana) en `s7d`/eje 19. La
  prescripción en Contractual no tiene un desarrollo unificado, se trata
  norma por norma dentro de cada institución.

**Consecuencia práctica, para que Laura decida:** estos tres ejes van a
seguir en cero en Evaluación y Alternativas mientras el manual no les dé
una sección propia. La alternativa es dejarlos como "ceros estructurales"
permanentes (el contenido en la práctica se sigue viendo dentro de sus
vecinos) y no tratarlos como huecos que haya que llenar en una futura
ronda de generación de contenido — a menos que Laura prefiera que el
manual desarrolle estos tres puntos aparte.

## Hallazgo 3: eje 5 es distinto de 2/11/21 — sección propia, pero cero real en las tres columnas

El eje 5 ("Requisitos de la indemnización de perjuicios") sí tiene una
sección propia y explícita en el manual (la enumeración de los 6
requisitos al comienzo de `s5d`), a diferencia de 2, 11 y 21. Sin embargo,
**queda en cero en Evaluación, Flashcards y Alternativas simultáneamente**:
ningún ítem de los tres modos pregunta por el listado general de
requisitos (cada uno de los 6 requisitos individuales sí está cubierto por
separado, en los ejes 6, 7, 8, 9, 10 y 12, pero el eje 5 como enumeración
propia no tiene ningún ítem dedicado). Este es un hueco de contenido real
que sí amerita generación nueva, a diferencia de 2/11/21 que son una
cuestión de estructura del manual.

## Hallazgo 4: eje 13 tiene sección, cero en Evaluación, pero sí Alternativas

El eje 13 ("Avaluación de perjuicios y cláusula penal") tiene sección
completa (`s5h`-`s5j`) y 2 Alternativas (`rc-alt-017` sobre acumulación de
cláusula penal y cumplimiento, `rc-alt-018` sobre cláusula penal enorme),
pero **cero ítems de Evaluación** en las cuatro columnas. Es un hueco
específico de la columna Evaluación, no de contenido cero como el eje 5.

## Ejes más débiles en Evaluación (post-`UPDATE`)

De más débil a menos, una vez aplicados los 40 `UPDATE` de la Fase 0:
- **En cero (5 ejes):** 2, 5, 11, 13, 21 — de estos, 2/11/21 son "ceros
  estructurales" (hallazgo 2), 5 y 13 son huecos reales de contenido
  (hallazgos 3 y 4).
- **Con 1 solo ítem (3 ejes):** 3 (El incumplimiento: noción objetiva), 14
  (El cumplimiento forzado), 17 (Las eximentes de responsabilidad). Los
  tres tienen sección propia desarrollada en el manual y ya tienen
  Alternativas (1, 3 y 1 respectivamente), así que el hueco es
  específicamente de Evaluación.
- **Con 2 ítems (5 ejes):** 4, 7, 9, 16, 18.

Los ejes mejor cubiertos en Evaluación son 12 (Los perjuicios
indemnizables) y 19 (Los derechos auxiliares del acreedor), con 5 ítems
cada uno, seguidos de 15 (La resolución y el pacto comisorio) también con
5.

## Qué sigue (decisiones pendientes de Laura)

1. **Correr los 40 `UPDATE` de `docs/fase0_rec_clasificacion_2026-07-31.md`**
   en el SQL Editor de Supabase — esta tabla de cobertura recién refleja el
   estado real de Evaluación una vez hecho esto.
2. **Mover `rc-aplic-002` y `rc-just-001` a Extracontractual**, según
   `docs/fix_justificacion_menciona_n_de_m_2026-07-31.md` (incluye además
   la corrección del bug de calificación "menciona N de M" en
   `rc-just-001`).
3. **Revisar el hallazgo de Flashcards (hallazgo 1):** decidir si conviene
   una pasada de reetiquetado sobre las ~30 tarjetas del eje 6 que
   temáticamente parecen ser de eje 4 u 8, y si se prioriza generar
   Flashcards nuevas para los 19 ejes que hoy están en cero.
4. **Decidir sobre ejes 2, 11 y 21** (hallazgo 2): dejarlos como ceros
   estructurales permanentes, o pedir que el manual desarrolle esos tres
   puntos como secciones propias.
5. **Generar contenido nuevo para el eje 5** (hallazgo 3, cero en las tres
   columnas pese a tener sección propia) y cerrar el hueco de Evaluación
   del eje 13 (hallazgo 4).
6. Los ejes de 1 solo ítem de Evaluación (3, 14, 17) y de 2 ítems (4, 7, 9,
   16, 18) quedan como candidatos de segunda prioridad, mismo criterio que
   se usó en REX para 1, 15 y 21 antes de cerrarlos.

No hay una "Fase 2" definida todavía para Contractual (mismo estado que
REX al cerrar su Fase 1): la cobertura al techo real de los 21 ejes es
meta post-beta, no de esta ronda.
