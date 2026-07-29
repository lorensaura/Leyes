# Estudio de cobertura por eje: REC y REP (2026-07-29)

> Mismo tipo de clasificación que se hizo para Extracontractual (ver
> `docs/preguntas_pendientes_ejes_debiles_2026-07.md`), esta vez para
> Contractual y Precontractual. Cuenta las preguntas de **Preguntas_Evaluacion**
> (banco de examen real, grounding del Interrogador) + **Evaluación**
> (Aplicación/Detección de error/Justificación/Discriminación MC, el módulo
> de Práctica), clasificadas por eje del manual a partir del campo
> `subtema` de cada pregunta (ninguna de las dos materias tiene el link a
> `Tema` completo todavía, ver `docs/contenido-airtable-supabase.md`, así
> que esta clasificación es manual, hecha por Claude leyendo cada
> `subtema`/`enunciado`, no una lectura directa de Airtable). Script y
> datos crudos en `.claude/jobs/e9f53baa/tmp/` de la sesión que hizo este
> estudio (no versionado, solo referencia).

## REC (Responsabilidad Contractual) — 98 preguntas en 21 ejes

| Eje | Total | Detalle por tipo |
|---|---|---|
| 1. Efecto de las obligaciones y sistema de remedios | 8 | 4 justificación, 2 aplicación, 1 detección de error, 1 discriminación MC |
| 2. El pago (cumplimiento) y sus principios | **1** | 1 justificación |
| 3. El incumplimiento: noción objetiva | **1** | 1 justificación |
| 4. Obligaciones de medios y de resultado | 3 | 2 justificación, 1 aplicación |
| 5. Requisitos de la indemnización de perjuicios | **1** | 1 justificación |
| 6. La culpa contractual y su graduación | 7 | 4 justificación, 2 aplicación, 1 discriminación MC |
| 7. El dolo contractual | 2 | 1 justificación, 1 detección de error |
| 8. Presunción de culpa y carga de la prueba | 7 | 2 justificación, 3 aplicación, 2 detección de error |
| 9. La mora | 5 | 3 detección de error, 1 justificación, 1 discriminación MC |
| 10. El caso fortuito o fuerza mayor | 5 | 1 justificación, 2 aplicación, 1 detección de error, 1 discriminación MC |
| 11. La teoría de los riesgos | **1** | 1 discriminación MC (único ítem de todo el eje) |
| 12. Los perjuicios indemnizables | 7 | 2 justificación, 5 aplicación |
| 13. Avaluación de perjuicios y cláusula penal | 3 | 2 justificación, 1 aplicación |
| 14. El cumplimiento forzado | 7 | 4 justificación, 2 aplicación, 1 detección de error |
| 15. La resolución y el pacto comisorio | **20** | 14 justificación, 4 aplicación, 1 detección de error, 1 discriminación MC — casi un tercio de todo REC |
| 16. La autonomía de la acción indemnizatoria | 2 | 2 justificación |
| 17. Las eximentes de responsabilidad | 2 | 1 justificación, 1 discriminación MC |
| 18. Imprevisión y frustración del fin del contrato | 2 | 2 justificación |
| 19. Los derechos auxiliares del acreedor | 7 | 4 justificación, 1 aplicación, 1 detección de error, 1 discriminación MC |
| 20. Cláusulas modificatorias de responsabilidad | 5 | 2 aplicación, 2 justificación, 1 discriminación MC |
| 21. Prescripción de las acciones | **1** | 1 justificación |

**Ejes más débiles (1 pregunta cada uno):** 2 (el pago), 3 (incumplimiento
como concepto objetivo), 5 (requisitos de la indemnización), 11 (teoría de
los riesgos), 21 (prescripción). Después, con 2: 7 (dolo), 16 (autonomía
acción indemnizatoria), 17 (eximentes), 18 (imprevisión).

**Sobrerrepresentado:** eje 15 (resolución/pacto comisorio) con 20
preguntas, el doble que el segundo eje más cubierto. Vale la pena
priorizar los ejes débiles antes de sumar más a este.

**Anomalía encontrada:** el ítem `rc-aplic-002` ("Responsabilidad por
hecho ajeno / art. 2320", en la tabla Evaluación → Aplicación de
Contractual) no encaja en ningún eje de Contractual — el art. 2320 es un
tema de Extracontractual (responsabilidad del empresario por el hecho de
sus dependientes). Revisar si está en la base equivocada.

**Contenido repetido entre los dos modelos:** 5 ítems tienen el mismo
`id` en Preguntas_Evaluacion y en Evaluación (`cont-aplic-001`,
`cont-just-001`, `rc-aplic-001`, `rc-aplic-003`, `rc-detect-001`) — el
mismo enunciado parece existir en ambas tablas. Puede ser intencional
(reusar un ítem bueno en los dos modelos) o un descuido; no se tocó, solo
se deja anotado.

## REP (Responsabilidad Precontractual) — 159 preguntas en 10 ejes

Los 10 ejes vienen del manual (`03_Responsabilidad_Precontractual_Manual.html`,
ejes A-J), no de Airtable: la tabla `Temas` de Precontractual está vacía
hoy (ver `docs/contenido-airtable-supabase.md`), así que no hay catálogo
de ejes cargado ahí todavía.

| Eje | Total | Detalle por tipo |
|---|---|---|
| A. Planteamiento del problema y concepto | 12 | 8 justificación, 2 discriminación MC, 2 aplicación |
| B. Evolución doctrinaria | **11** | 5 justificación, 3 aplicación, 3 detección de error |
| C. Etapas del proceso de formación del contrato | 22 | 7 justificación, 4 aplicación, 5 discriminación MC, 6 detección de error |
| D. Interés protegido y fundamento de la buena fe | 15 | 5 aplicación, 5 detección de error, 2 justificación, 3 discriminación MC |
| E. Naturaleza jurídica de la RPC | 13 | 2 aplicación, 7 justificación, 3 detección de error, 1 discriminación MC |
| F. Determinación de los daños a resarcir | 21 | 5 aplicación, 5 discriminación MC, 8 justificación, 3 detección de error |
| G. Requisitos para que nazca el derecho a reparación | 22 | 3 discriminación MC, 3 detección de error, 7 justificación, 9 aplicación |
| H. Responsabilidad por la nulidad del contrato | 16 | 4 aplicación, 5 discriminación MC, 6 justificación, 1 detección de error |
| I. Responsabilidad postcontractual | 13 | 3 detección de error, 4 justificación, 3 discriminación MC, 3 aplicación |
| J. Derecho comparado y síntesis general | 14 | 4 aplicación, 5 justificación, 2 detección de error, 3 discriminación MC |

**A diferencia de REC y de REX (antes de reforzarla), acá no hay ningún
eje débil.** El mínimo es 11 preguntas (eje B) y el máximo 22 (ejes C y
G) — una diferencia de solo 2x, contra el 20x que hay en REC entre el eje
más débil (1) y el más fuerte (20). Precontractual ya tiene cobertura
pareja en los 10 ejes.

## Conclusión para decidir qué sigue

- **REC necesita refuerzo puntual**, no una revisión completa: 9 de los
  21 ejes tienen 1-2 preguntas (2, 3, 5, 7, 11, 16, 17, 18, 21), mientras
  el eje 15 concentra 20. Ahí sí conviene generar contenido nuevo, con el
  mismo proceso que se usó para los 5 ejes débiles de Extracontractual
  (`docs/preguntas_pendientes_ejes_debiles_2026-07.md`).
- **REP ya está pareja y bien cubierta en los 10 ejes** — no parece
  necesitar más preguntas por ahora. Se puede pasar a otra materia sin
  pendiente aquí, salvo que Laura quiera revisar la anomalía y los
  duplicados anotados arriba.
