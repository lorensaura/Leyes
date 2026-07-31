# Fase 1 REX: tabla de cobertura por tema/subtema (2026-07-30)

> Fase 1 del plan "llevar Evaluación a su techo por tema/subtema" (REX → REC
> → REP, ver `docs/camino-a-beta.md`), después de que la Fase 0 dejó los 119
> ítems de Evaluación de Extracontractual linkeados a los 25 ejes reales de
> `Temas`. Sección 1 del skill `generar-evaluacion` pide seis columnas
> (Aplicación/Detección de error/Justificación/Discriminación MC/Flashcards/
> Alternativas), no solo las cuatro de Evaluación. Datos contados contra
> Supabase/Airtable en vivo (nunca contra un doc anterior), 2026-07-30.

## Tabla maestra: los 25 ejes × 6 columnas

Alternativas no tiene link a `Temas` en Supabase (decisión 2026-07-27, ver
`docs/contenido-airtable-supabase.md`), así que su columna es clasificación
manual por `subtema` (keyword + verificación contra el manual línea por
línea), no una consulta directa. **1 de los 41 ítems (`ext-alt-029`,
"Improcedencia de la reserva de perjuicios en materia extracontractual") no
se pudo ubicar con confianza en el manual** (no aparece la frase "reserva de
perjuicios" en `02_Responsabilidad_Extracontractual_Manual.html`) — queda
sin eje asignado, no se adivinó.

| Eje | Aplic | DetE | Just | DiscMC | **Total Eval** | Flash | Altern |
|---|---|---|---|---|---|---|---|
| 1. Concepto, regulación y funciones | 0 | 0 | 1 | 0 | **1** | 11 | 2 |
| 2. Responsabilidad civil y penal | 2 | 0 | 1 | 6 | **9** | 12 | 1 |
| 3. Delimitación de estatutos | 0 | 1 | 1 | 3 | **5** | 9 | 1 |
| 4. Sistemas o modelos de atribución | 1 | 1 | 1 | 4 | **7** | 8 | 2 |
| 5. La capacidad delictual | 1 | 1 | 0 | 1 | **3** | 9 | 1 |
| 6. El hecho voluntario. Caso fortuito y personas jurídicas | 1 | 0 | 1 | 0 | **2** | 7 | 1 |
| 7. La antijuridicidad y las causales de justificación | 1 | 1 | 1 | 1 | **4** | 8 | 1 |
| 8. La culpabilidad: dolo y culpa | 1 | 1 | 1 | 1 | **4** | 8 | 0 |
| 9. Prueba de la culpa y presunciones (art. 2329) | 1 | 2 | 1 | 3 | **7** | 8 | 1 |
| 10. El daño: concepto y requisitos de resarcibilidad | 0 | 2 | 0 | 1 | **3** | 9 | 4 |
| 11. Clases de daño (I): daño patrimonial | 2 | 2 | 0 | 1 | **5** | 7 | 1 |
| 12. Clases de daño (II): daño moral | 1 | 2 | 1 | 1 | **5** | 7 | 1 |
| 13. La causalidad | 0 | 1 | 1 | 0 | **2** | 8 | 1 |
| 14. Hecho ajeno, régimen general (art. 2320) | 3 | 2 | 4 | 5 | **14** | 8 | 1 |
| 15. Responsabilidad del empresario | 0 | 0 | 1 | 0 | **1** | 7 | 1 |
| 16. Hecho de las cosas | 1 | 1 | 1 | 0 | **3** | 7 | 1 |
| 17. Regímenes legales de responsabilidad objetiva | 1 | 1 | 0 | 0 | **2** | 8 | 0 |
| 18. Responsabilidad del Estado | 1 | 2 | 1 | 0 | **4** | 9 | 1 |
| 19. Acción por daño contingente (art. 2333) | 1 | 1 | 2 | 1 | **5** | 8 | 0 |
| 20. Objeto y extensión de la reparación | 3 | 2 | 4 | 4 | **13** | 9 | 1 |
| 21. Legitimación activa y pasiva | 1 | 0 | 0 | 0 | **1** | 7 | 5 |
| 22. Tribunal, procedimiento, prescripción (art. 2332) | 1 | 1 | 0 | 0 | **2** | 7 | 3 |
| 23. Dualidad o unidad de regímenes | 1 | 1 | 2 | 3 | **7** | 8 | 3 |
| 24. Cúmulo o concurso de responsabilidades | 1 | 2 | 1 | 0 | **4** | 7 | 3 |
| 25. Precontractual, nulidad y postcontractual | 2 | 2 | 1 | 1 | **6** | 8 | 4 |

Totales: 119 Evaluación, 204 Flashcards, 41 Alternativas (40 clasificadas +
1 sin ubicar).

**Los tres ejes más débiles son 1, 15 y 21 (1 ítem de Evaluación cada
uno)**, tal como quedó anotado en `docs/camino-a-beta.md` al cerrar la Fase
0. Pero esto es débil **solo en Evaluación**: el eje 1 tiene 11 Flashcards
(el número más alto de toda la tabla) que ya cubren buena parte de lo que
trae el manual en ese eje (las cuatro funciones, si el Código define la
responsabilidad, daños punitivos, función primordial). Generar contenido
nuevo de Evaluación para el eje 1 sin mirar esas Flashcards corre el riesgo
de redactar preguntas que solo repiten lo que ya está en Flashcards con
otro formato.

## Hallazgo que cambia el plan: hay contenido ya redactado para 15 y 21, sin subir

`docs/preguntas_pendientes_ejes_debiles_2026-07.md` (2026-07-27) es un
borrador de 31 preguntas para 5 ejes que en ese momento salían débiles
(11, 15, 18, 21, 25), con esta nota en su encabezado: *"Nada de esto está
en Airtable ni en Supabase"*.

**Primera lectura (equivocada, corregida acá): "el borrador se subió, con
el `tipo` editado".** El `subtema` de varios ítems vivos de los ejes 11, 18
y 25 se parece mucho al `subtema` de ítems del borrador, lo que en un
primer vistazo parecía confirmar que se habían subido. **Comparar el
`enunciado`/`caso` completo (no solo el `subtema`) descarta esa lectura:**
por ejemplo, el ítem vivo de eje 25 sobre los tres requisitos de Rosende
(`re-aplic-026`) plantea el caso de "Cuidar Spa" y la residencia "Los
Aromos" (ocho meses de negociación, estudio de compatibilidad de
protocolos), mientras que el ítem 2 del borrador para el mismo subtema
plantea un arriendo de local comercial para un restaurante (cuatro meses,
estudio de factibilidad sanitaria) — incompatible con ser el mismo ítem
subido con ediciones menores. Mismo patrón en eje 11 (ítem vivo de
detección de error sobre "daño patrimonial puro" pregunta por un caso de
competencia desleal que el borrador nunca describió así) y eje 18 (el ítem
vivo de aplicación sobre falta de servicio municipal usa un columpio roto
en una plaza, hecho que no está en el borrador).

**Lectura correcta: los ítems vivos de 11, 18 y 25 son contenido
redactado de forma independiente el 2026-07-28** (mismo
`actualizado_en` en varios de ellos, un día después del borrador,
`codigo` con prefijo `re-`, no `hist-`), que cubre terreno doctrinal
parecido al del borrador pero con hechos y, a veces, `tipo` distintos.
Probablemente una sesión posterior generó contenido nuevo para los mismos
ejes débiles sin usar este borrador como fuente. Consecuencia: **para los
ejes 11, 18 y 25, los ítems del borrador que se solapan en subtema con
contenido ya vivo son redundantes tal como están redactados** (mismo
ángulo doctrinal, ya cubierto) — no conviene subirlos sin reescribirlos
para cubrir un ángulo distinto:
- Eje 11: ítems 3 (concepto abstracto/concreto) y 4 (daño patrimonial
  puro) del borrador se solapan con los ítems vivos de detección de
  error/discriminación MC del mismo nombre.
- Eje 18: ítems 3 (falta de servicio, aplicación) y 5 (falta de servicio
  vs. estricta pura, discriminación MC) se solapan con los ítems vivos
  equivalentes.
- Eje 25: ítem 2 (ruptura de negociaciones) se solapa con `re-aplic-026`
  (caso Cuidar Spa/Los Aromos). Los ítems 1, 3, 4, 6 también tocan
  subtemas ya cubiertos en vivo (Rosende, naturaleza precontractual,
  nulidad); el ítem 5 (responsabilidad postcontractual como subtema
  propio) es el único de eje 25 que parece no tener contraparte viva.

**Eje 15 y eje 21 son distintos: ahí el solape es parcial, no total.**
El único ítem vivo de eje 15 (`re-just-016`, "La convergencia entre el
hecho ajeno riguroso y el hecho propio del órgano") toca el mismo ángulo
que el **ítem 6 del borrador** ("hecho propio de la organización"), pero
con un enfoque distinto (convergencia práctica entre las dos vías, no la
diferencia entre ellas) — se superponen sin ser idénticos. **Los ítems 1
a 5 del borrador (evolución del criterio de dependencia, en ejercicio vs.
con ocasión de las funciones, tres requisitos de la presunción, descarga
de la presunción, art. 2320 inc. 4° vs. 2322) no tienen contraparte en
Evaluación, y tampoco en Alternativas: el eje 15 solo tiene un ítem de
Alternativas (`ext-alt-016`) y ese cae sobre el ítem 6, no sobre 1-5 — así
que los ítems 1-5 son huecos reales en las dos columnas.**

Eje 21 es más matizado: el único ítem vivo de Evaluación (`re-aplic-022`,
"mero tenedor", un caso de arrendatario) toca el mismo tema que el
**ítem 1 del borrador** ("mero tenedor vs. dueño"), y de los ítems 2 a 6,
**cuatro ya tienen una contraparte en Alternativas** (columna distinta,
no en Evaluación): el ítem 2 ("titulares por derecho derivado") con
`ext-alt-023` (cesión del derecho a la indemnización ya devengada), el
ítem 3 ("ausencia de acciones de clase") se acerca a `ext-alt-020`
(acción individual vs. acción popular, mismo subtema 1.4 del manual), el
ítem 4 ("acción restitutoria del art. 2316 inc. 2°") con `ext-alt-025`
(medida de la acción del mismo artículo), y el ítem 6 ("provecho del dolo
ajeno") con `ext-alt-009` (acción restitutoria contra el tercero
beneficiado del dolo ajeno). Esto no los vuelve redundantes para subir —
Alternativas es un modo de práctica distinto (opción múltiple simple) y la
tabla de cobertura los trata como columnas separadas a propósito — pero sí
significa que **el hueco real de eje 21 es específicamente en la columna
Evaluación**, con Alternativas ya cubriendo el mismo ángulo en 4 de los 5
ítems. Solo el **ítem 5 ("legitimación pasiva del autor") no tiene
contraparte en ninguna de las dos columnas.**

**Consecuencia práctica: para 15 y 21, el siguiente paso no es generar
contenido nuevo desde cero, es revisar (y probablemente reescribir el
caso concreto de cada uno, ya que quien redactó los ítems vivos de otros
ejes optó por hechos nuevos en vez de reusar el caso del borrador tal
cual) hasta 5 ítems por eje** (1-5 de eje 15, todos huecos completos; 2-6
de eje 21, aunque 4 de esos 5 ya tienen contraparte en Alternativas, así
que el hueco ahí es solo de Evaluación, no de contenido cero) en
`docs/preguntas_pendientes_ejes_debiles_2026-07.md` — pendientes de la
revisión de Laura, nunca marcados como tal en `docs/camino-a-beta.md`
hasta ahora (se corrige en ese doc). Para el **eje 1, en cambio, no hay
ningún borrador ni contraparte viva parcial**: ahí sí hace falta generar
contenido nuevo desde cero, con la salvedad de arriba sobre las 11
Flashcards ya existentes.

**Dos errores de clasificación de eje, sin corregir, solo anotados:**
"Incapacidad permanente vs. falta transitoria de voluntariedad" (eje 18,
Estado) y "Error de llamar 'subjetiva' a la responsabilidad por culpa"
(eje 25, precontractual) no encajan temáticamente en el eje donde están
etiquetados hoy — el primero suena a capacidad delictual o hecho
voluntario, el segundo a culpabilidad (eje 8). Los dos tienen
`actualizado_en: 2026-07-28T20:47:13`, idéntico al resto del lote nuevo
de esa fecha, y su `tema` ya venía asignado desde que se crearon, no
desde un backfill posterior — **son un error de etiquetado de esa sesión
del 2026-07-28, no de la Fase 0** (la Fase 0, del 2026-07-30, solo
backfilleó el link de contenido histórico que antes tenía `tema = null`;
nunca tocó estos dos ítems). Revisar cuando se toquen esos ejes, no
re-auditar la Fase 0 buscando este bug ahí.

## Nota lateral: Alternativas de Extracontractual ya cubre parcialmente 15 y 21

Al clasificar los 41 ítems de Alternativas por eje, aparecieron dos que
tocan los mismos huecos:
- `ext-alt-016` ("Culpa difusa y responsabilidad por el hecho propio de la
  organización") → eje 15, mismo subtema que el ítem 6 del borrador y el
  único ítem vivo de Evaluación ahí. Ese ángulo puntual del eje 15 ya tiene
  triple cobertura (Evaluación + Alternativas, y el ítem 6 del borrador es
  redundante si se sube tal cual).
- `ext-alt-022` ("Legitimación del mero tenedor") y `ext-alt-025` ("Medida
  de la acción del art. 2316 inciso 2°") → eje 21, tocan los mismos ángulos
  que el ítem 1 y el ítem 4 del borrador respectivamente.

No cambia la recomendación (igual conviene subir los ítems 1-5 de eje 15 y
2-6 de eje 21 del borrador, revisando primero si alguno quedó redundante
con Alternativas), pero vale la pena que quien suba el lote lo tenga
presente para no duplicar el mismo ángulo tres veces.

## Desacuerdo sin resolver: "pérdida de una chance", ¿eje 10 u 11?

El ítem vivo de Evaluación "Pérdida de una oportunidad (chance) como daño
autónomo" está etiquetado como eje 11 (daño patrimonial) en
`evaluacion_practica`. Pero el texto del manual que desarrolla esa figura
(líneas 1195-1197 de `02_Responsabilidad_Extracontractual_Manual.html`,
"pérdida de una oportunidad o chance... categoría intermedia... daño
autónomo") está dentro de la sección del **eje 10** (El daño: concepto y
requisitos de resarcibilidad, líneas 1165-1269), no de la del eje 11
(1270-1356). Este ítem también es del lote nuevo del 2026-07-28 (no de la
Fase 0): es una etiqueta de eje puesta al redactarlo, no un resultado del
matching automático de la Fase 0. Este doc no corrigió el eje del ítem
vivo — la tabla maestra de arriba lo sigue contando en 11, como está hoy en
Supabase. Se anota acá para que alguien decida si mover el link a `Temas`
de ese ítem a eje 10.

## Qué sigue (decisión de Laura)

Eje 15 y eje 21 quedaron cerrados el 2026-07-30 (9 de los 10 ítems
pendientes aprobados y subidos, 1 descartado por ambigüedad real, ver
`docs/camino-a-beta.md`).

1. Eje 1 cerrado 2026-07-30: los 3 ítems (Aplicación, Detección de error,
   Discriminación MC) de `docs/preguntas_pendientes_eje1_2026-07-30.md`
   ya están en Airtable y sincronizados. Extracontractual queda en
   131 ítems de Evaluación. Pendiente la revisión de fondo del
   contenido por Laura (no reemplazada por la subida).
2. `ext-alt-002`/`ext-alt-033` (redundantes entre sí, ambos sobre el
   art. 1437): se conserva `ext-alt-033`, falta que Laura borre
   `ext-alt-002` en el SQL Editor de Supabase (statement en
   `docs/camino-a-beta.md`).
3. Revisar la posible mala clasificación de "Incapacidad permanente vs.
   falta transitoria de voluntariedad" (hoy en eje 18, Estado) y ubicar
   `ext-alt-029` ("reserva de perjuicios") en su eje real.
