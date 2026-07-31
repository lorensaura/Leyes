# Fase 0 REC: clasificación por eje de Evaluación de Contractual (2026-07-31)

> Fase 0 del plan "llevar Evaluación a su techo por tema/subtema" (REX → REC
> → REP, ver `docs/camino-a-beta.md`), análoga a la que ya se hizo para
> Extracontractual el 2026-07-30 (`docs/cobertura_subtema_rex_2026-07-30.md`).
> Este doc cubre solo el paso de clasificación (linkear cada ítem de
> Evaluación de Contractual a su eje real vía el campo `tema`), no la tabla
> de cobertura completa por tipo, eso es Fase 1, un paso posterior. Nada de
> esto se aplicó a Supabase: es una propuesta para que Laura la revise y,
> si la aprueba, corra los `UPDATE` del final en el SQL Editor.

## Desvío importante respecto de la instrucción original: la fuente del catálogo de ejes

La consigna original pedía extraer los ejes de los `<h1>` de
`01_Responsabilidad_Contractual_Manual.html`. Al abrir el manual, sus
`<h1>` no son un listado plano de ejes: son **8 secciones letradas A-H**
(Marco general, El incumplimiento, La acción de cumplimiento, La
resolución, La indemnización de perjuicios, Causales de exención, Los
derechos auxiliares, Cláusulas modificatorias), cada una con sus propios
sub-numerales `1.`, `2.`, `3.`... que **reinician en cada sección** (a
diferencia del manual de Extracontractual, donde cada `<h1>` es
literalmente un eje con numeración plana `eje1`...`eje25`).

Los 8 ítems de Contractual que **ya** tenían `tema` asignado (de antes de
esta fase) usan, en cambio, una numeración plana 1-21 con títulos que no
calzan letra por letra con ningún `<h1>` ni `<h2>` (ej. "7. El dolo
contractual", "16. La autonomía de la acción indemnizatoria"). Se
verificó contra Airtable (`Digesto Contractual`, tabla `Temas`,
`baseId appxeVxAE53yIqRPa`) que existe un catálogo canónico de **21 ejes**
con esos mismos títulos exactos: es la tabla real de la que `tema` es un
link, y de la que cuelgan también las 225 Flashcards y las 53
`Preguntas_Evaluacion` ya linkeadas. Clasificar contra los `<h1>` del
manual habría producido strings que no existen en ese catálogo y que, al
no ser un valor real de `Temas`, no habrían podido sincronizarse la
próxima vez que corra `scripts/sync_airtable_supabase.py` (en Airtable
`tema` es un campo de link, no texto libre).

**Por eso este trabajo usa el catálogo de 21 ejes de `Temas` como espacio
de etiquetas, y el manual como evidencia para decidir a cuál corresponde
cada ítem** (no al revés). Regla de desempate usada cuando un ítem podía
calzar en más de un eje: gana la sección del manual cuyo título físico
(el `<h1>`/`<h2>`) coincide con el nombre del eje y contiene el pasaje que
responde la pregunta del ítem, no la sección que solo la menciona de
paso.

Los 21 ejes, con la sección del manual que les sirve de base (mapeo hecho
a mano contrastando contenido, no solo títulos):

| # | Eje (`Temas.nombre`) | Sección/es del manual |
|---|---|---|
| 1 | Efecto de las obligaciones y sistema de remedios | A.3-A.4 (`s1c`, `s1d`) + C.3 (`s3c`, desarrollo del mismo punto) |
| 2 | El pago (cumplimiento) y sus principios | sin sección dedicada en esta versión del manual (ver hallazgo abajo) |
| 3 | El incumplimiento: noción objetiva | B.1-B.2 (`s2a`, `s2b`) |
| 4 | Obligaciones de medios y de resultado | B.3 (`s2c`) |
| 5 | Requisitos de la indemnización de perjuicios | E.4 intro (`s5d`, enumeración de los 6 requisitos) |
| 6 | La culpa contractual y su graduación | E.4.2 (`s5d`, "La culpa contractual") |
| 7 | El dolo contractual | E.4.1 (`s5d`, "El dolo contractual") |
| 8 | Presunción de culpa y carga de la prueba | B.4 (`s2d`) + E.4.1(a) y su recuadro (`s5d`) |
| 9 | La mora | E.7 (`s5g`) |
| 10 | El caso fortuito o fuerza mayor | F.1 (`s6a`) |
| 11 | La teoría de los riesgos | sin sección dedicada en esta versión del manual (ver hallazgo abajo) |
| 12 | Los perjuicios indemnizables | E.5 (`s5e`, incluida 5.4 daño moral y 5.5 pérdida de chance) |
| 13 | Avaluación de perjuicios y cláusula penal | E.8-E.10 (`s5h`, `s5i`, `s5j`) |
| 14 | El cumplimiento forzado | C.5 (`s3e`) |
| 15 | La resolución y el pacto comisorio | D completa (`s4a`-`s4l`) |
| 16 | La autonomía de la acción indemnizatoria | E.3 (`s5c`) |
| 17 | Las eximentes de responsabilidad | F.2-F.5 (`s6b`-`s6e`) |
| 18 | Imprevisión y frustración del fin del contrato | F.6-F.7 (`s6f`, `s6g`) |
| 19 | Los derechos auxiliares del acreedor | G completa (`s7a`-`s7e`) |
| 20 | Cláusulas modificatorias de responsabilidad | H completa (`s8a`-`s8c`) |
| 21 | Prescripción de las acciones | sin sección dedicada en esta versión del manual (ver hallazgo abajo) |

**Hallazgo: los ejes 2 ("El pago"), 11 ("La teoría de los riesgos") y 21
("Prescripción de las acciones") no tienen ninguna sección del manual
titulada de ese modo.** Se buscó con grep (`pago`, `riesgo`,
`prescrib|prescrip`, sección por sección) y solo aparecen como menciones
de paso dentro de otras secciones (la prescripción del pacto comisorio en
D.11.4, la del pacto pauliano en G.4, la pérdida de la cosa debida por
caso fortuito como parte de F.1, no de una "teoría de los riesgos" con
nombre propio). Ningún ítem de los 42 clasificados terminó en estos tres
ejes: el caso más cercano (`rc-mc-003`, imposibilidad y pérdida de la
cosa debida) se apoya en un pasaje que está físicamente dentro de la
sección F.1 "El caso fortuito o fuerza mayor" (`s6a` 1.3, ver tabla
abajo), así que por la regla de desempate va al eje 10, no al 11. **El
eje 5 sí tiene sección propia** (la enumeración de los 6 requisitos al
comienzo de `s5d`), simplemente ningún ítem de este lote pregunta por el
listado general de requisitos en vez de por uno específico. Los ejes 2,
11, 13 y 21 terminan esta ronda en cero ítems: los tres primeros (2, 11,
21) porque el manual no desarrolla el punto con ese nombre propio, el 13
(avaluación de perjuicios y cláusula penal) porque sí tiene sección
(`s5h`-`s5j`) pero ningún ítem de este lote la toca. Queda para Laura
decidir si el manual necesita desarrollar esos puntos aparte, o si en la
práctica se seguirán viendo dentro de sus vecinos (el pago dentro de la
acción de cumplimiento, el riesgo dentro de caso fortuito, la
prescripción dentro de resolución/pacto comisorio/acción pauliana donde
ya aparece de pasada).

## Aritmética de partida

51 filas totales en `evaluacion_practica` con `materia = 'Responsabilidad
contractual'`. De ellas:
- **1 fila corrupta** (`rc-detect-001`): todos sus campos, incluido
  `tema`, contienen literalmente el texto `"rc-detect-001"`. Ya reportada
  aparte a Laura como bug (ver `docs/camino-a-beta.md`); no se cuenta ni
  se clasifica acá. La corrupción también contaminó la tabla `Temas` de
  Airtable: hay ahí un registro con `nombre = "rc-detect-001"`, sin
  `numero` ni `materia`, vale la pena que Laura lo borre de Airtable
  cuando corrija el bug de origen, para que no aparezca como opción al
  editar a mano.
- **8 filas** ya tenían `tema` real asignado antes de esta fase
  (`hist-rc-mc-001` a `008`, prefijo `hist-`, no tocadas).
- **42 filas** tenían `tema = null` de verdad. De esas, **40 se clasifican
  con confianza** en este documento y **2 quedan sin clasificar** (ver
  sección propia).

8 + 1 + 42 = 51. Cuadra con lo medido en vivo el 2026-07-31 y con
`docs/contenido-airtable-supabase.md`.

## Tabla de clasificación (40 ítems con confianza)

| Código | Tipo | Subtema actual | Eje propuesto | Respaldo en el manual |
|---|---|---|---|---|
| rc-aplic-004 | aplicación | Renuncia anticipada a las acciones del art. 1489 | 1. Efecto de las obligaciones y sistema de remedios | `s1d`: "la ley sí reconoce a las partes el derecho a renunciar anticipadamente a la acción resolutoria... jamás comprenderá el incumplimiento doloso... art. 1465" |
| rc-aplic-005 | aplicación | Obligaciones de medio y de resultado | 4. Obligaciones de medios y de resultado | `s2c`, título y contenido idénticos (transportista, diligencia vs. resultado) |
| rc-aplic-003 | aplicación | Daño moral contractual / previsibilidad | 12. Los perjuicios indemnizables | `s5e` 5.4 "El daño moral en la responsabilidad contractual" (línea 1217) |
| rc-aplic-007 | aplicación | Incumplimiento resolutorio: gravedad exigida | 15. La resolución y el pacto comisorio | `s4d` 4.3 "¿Procede la resolución por incumplimientos intrascendentes?" |
| rc-aplic-009 | aplicación | Pérdida de una chance u oportunidad | 12. Los perjuicios indemnizables | `s5e` 5.5 "La pérdida de una chance u oportunidad" (línea 1280), caso Alpes Chemie/CENABAST |
| rc-detect-010 | detección de error | Condonación del dolo pasado vs. futuro (art. 1465) | 7. El dolo contractual | `s5d` 4.1(c), dentro de "El dolo contractual": "la condonación del dolo futuro no vale... sí puede, en cambio, condonarse el dolo ya acontecido"; `s8b` 2.4/2.5 desarrolla el mismo punto con más detalle pero fuera de una sección de nombre igual al eje, se prefirió `s5d` por coincidir el título de la sección con el nombre del eje |
| rc-aplic-008 | aplicación | Perjuicios previstos e imprevistos (art. 1558) | 12. Los perjuicios indemnizables | `s5e` clasificación (8) "Previsto e imprevisto (art. 1558)" (línea 1193) |
| rc-detect-003 | detección de error | Prueba del incumplimiento y presunción de imputabilidad | 8. Presunción de culpa y carga de la prueba | `s2d`, título casi idéntico, "la culpa del deudor se presume" |
| rc-aplic-012 | aplicación | Cláusula de tope indemnizatorio | 20. Cláusulas modificatorias de responsabilidad | `s8a`, "cláusula de tope indemnizatorio", validada por Boetsch |
| rc-just-006 | justificación | Autonomía de la indemnización compensatoria | 16. La autonomía de la acción indemnizatoria | `s5c`, tesis tradicional/moderna/Boetsch, calca el enunciado del ítem |
| rc-aplic-001 | aplicación | Graduación de la culpa / comodato | 6. La culpa contractual y su graduación | `s5d` 4.2, comodato como ejemplo de culpa levísima |
| rc-just-004 | justificación | Cumplimiento por equivalencia vs. indemnización de perjuicios | 1. Efecto de las obligaciones y sistema de remedios | `s3c`, recuadro "Aestimatio rei ≠ indemnización" cita literalmente arts. 1672, 1486, 1521, 438 CPC (mismos artículos del ítem) |
| rc-aplic-010 | aplicación | Requisitos del caso fortuito | 10. El caso fortuito o fuerza mayor | `s6a` 1.2, "tres requisitos: ajeno, imprevisto, irresistible" |
| rc-just-005 | justificación | Pacto comisorio: simple/calificado, típico/atípico | 15. La resolución y el pacto comisorio | `s4k` 11.2/11.3, misma estructura de la pregunta |
| cont-aplic-001 | aplicación | Presunción de culpa / carga probatoria | 8. Presunción de culpa y carga de la prueba | `s2d` + recuadro de `s5d`, "presunción de culpa contractual" |
| rc-aplic-006 | aplicación | Cumplimiento forzado de obligaciones de hacer (art. 1553) | 14. El cumplimiento forzado | `s3e` 5.2, desarrolla art. 1553 con el mismo esquema de alternativas |
| rc-mc-009 | discriminación MC | La cláusula "no admitirá interpretación" | 20. Cláusulas modificatorias de responsabilidad | `s8b` 2.1-2.3, interpretación restrictiva pese a cláusulas absolutas |
| rc-detect-004 | detección de error | Cumplimiento por equivalencia vs. indemnización de perjuicios | 1. Efecto de las obligaciones y sistema de remedios | mismo pasaje que `rc-just-004` (`s3c`) |
| rc-mc-007 | discriminación MC | Excepciones al efecto liberatorio del caso fortuito | 10. El caso fortuito o fuerza mayor | `s6a` 1.4 "Excepciones: casos en que el caso fortuito no libera", excepción (ii) mora previa, calca el caso |
| rc-detect-006 | detección de error | Presunción de dolo vs. presunción de culpa | 8. Presunción de culpa y carga de la prueba | `s5d` 4.1(a) "el dolo no se presume... diferencia esencial con la culpa, que sí se presume" |
| rc-detect-008 | detección de error | Caso fortuito vs. teoría de la imprevisión | 18. Imprevisión y frustración del fin del contrato | `s6f`, recuadro "No confundir: imprevisión, caso fortuito y fuerza mayor" + art. 2003 regla 1ª (encarecimiento de materiales no da derecho a más) |
| rc-detect-007 | detección de error | Mora: requisitos e interpelación | 9. La mora | `s5g` 7.1/7.2, requisitos e interpelación |
| rc-detect-009 | detección de error | Confusión entre acción oblicua y pauliana | 19. Los derechos auxiliares del acreedor | `s7d`, recuadro "Seis diferencias entre la acción oblicua y la pauliana" (línea 1889) |
| rc-detect-005 | detección de error | Resolución, nulidad y resciliación | 15. La resolución y el pacto comisorio | `s4j`, comparación nulidad/resolución punto por punto |
| rc-detect-002 | detección de error | Sistema de remedios del art. 1489 | 1. Efecto de las obligaciones y sistema de remedios | `s1d`, estructura completa del art. 1489 |
| rc-mc-006 | discriminación MC | Las tres formas de interpelación (art. 1551) | 9. La mora | `s5g` 7.2, las tres formas de interpelación con los mismos ejemplos (vestido de novia, toldo) |
| rc-mc-008 | discriminación MC | El fraude pauliano (CS 2017) | 19. Los derechos auxiliares del acreedor | `s7d`, caja de jurisprudencia CS 18 oct. 2017 Rol 18.184-2017, cita textual |
| rc-mc-002 | discriminación MC | Casos en que el incumplimiento no genera responsabilidad | 3. El incumplimiento: noción objetiva | `s2b`, "(a) Acuerdo con el acreedor" calza con el caso (cliente libera a la empresa) |
| rc-mc-001 | discriminación MC | Renunciabilidad de las acciones del art. 1489 | 1. Efecto de las obligaciones y sistema de remedios | `s1d`, "no se puede renunciar a demandar tanto la ejecución forzada como la resolución" |
| rc-mc-004 | discriminación MC | Enervar la acción resolutoria mediante el pago | 15. La resolución y el pacto comisorio | `s4g`, cita el mismo fallo CS 25 mayo 2011 sobre art. 310 CPC |
| rc-mc-003 | discriminación MC | Imposibilidad y pérdida de la cosa debida | 10. El caso fortuito o fuerza mayor | `s6a` 1.3, "el artículo 1670 dispone que cuando el cuerpo cierto que se debe perece... se extingue la obligación; pero dicha extinción tiene lugar únicamente cuando la cosa debida perece por caso fortuito (1672)". El enunciado del ítem pregunta solo por el efecto sobre la obligación del deudor (extinción), no por quién soporta el riesgo frente a la contraparte, por eso no se usó el eje 11 pese a citar los mismos artículos |
| rc-mc-005 | discriminación MC | Graduación de la culpa según a quién beneficia el contrato | 6. La culpa contractual y su graduación | `s5d` 4.2, criterio de utilidad/beneficio del art. 1547 inc. 1º |
| rc-just-010 | justificación | Interpretación de las cláusulas modificatorias | 20. Cláusulas modificatorias de responsabilidad | `s8b` 2.1/2.3, "no se presume" + "interpretación restrictiva" |
| rc-just-007 | justificación | Daño moral en la responsabilidad contractual | 12. Los perjuicios indemnizables | `s5e` 5.4, evolución clásica a moderna, tesis de Rodríguez Grez |
| rc-aplic-011 | aplicación | Acción pauliana: actos gratuitos y onerosos | 19. Los derechos auxiliares del acreedor | `s7d`, "caben actos... gratuitos u onerosos" (línea 1909) |
| rc-just-008 | justificación | Teoría de la imprevisión | 18. Imprevisión y frustración del fin del contrato | `s6f`, requisitos y estado de la jurisprudencia (CS 2025, CA 2006) |
| cont-just-001 | justificación | Culpa grave / dolo | 6. La culpa contractual y su graduación | `s5d` 4.2, "esta culpa en materias civiles equivale al dolo" (línea 1080) |
| rc-just-002 | justificación | Responsabilidad subjetiva y objetivación | 1. Efecto de las obligaciones y sistema de remedios | `s1e`, título y contenido (BARAONA/PEÑAILILLO) calcan el enunciado |
| rc-just-003 | justificación | Debate sobre obligaciones de medio y de resultado | 4. Obligaciones de medios y de resultado | `s2c`, recuadro "La clasificación es debatida" |
| rc-just-009 | justificación | Acción oblicua vs. acción pauliana | 19. Los derechos auxiliares del acreedor | `s7c`/`s7d`, mismo recuadro de las seis diferencias |

## 2 ítems que resultaron no ser Contractual (resuelto 2026-07-31, ver otros docs)

`rc-aplic-002` y `rc-just-001` (los dos "sin clasificar con confianza"
que este doc dejaba pendientes) no tenían un problema de eje: tenían un
problema de materia. Laura confirmó moverlos a Extracontractual:

- `rc-aplic-002` (repartidor que choca a una peatona ajena al contrato,
  arts. 2320/2317/2325): es responsabilidad por el hecho ajeno, no
  contractual. Va al eje 14 de Extracontractual.
- `rc-just-001` (diferencias entre estatuto contractual y
  extracontractual): el propio manual de Contractual remite su
  desarrollo al de Extracontractual, donde existe una sección dedicada
  (eje 23, "nueve diferencias"). De paso, este ítem reveló un bug real de
  calificación (ver `docs/fix_justificacion_menciona_n_de_m_2026-07-31.md`):
  el enunciado pide 3 de esas 9 diferencias, pero solo tenía 3
  `elementos_clave`, así que una alumna que nombrara 3 diferencias
  válidas pero distintas a esas 3 quedaba mal calificada.

Los `UPDATE` de estos dos ítems (que ya no son parte de la lista de 40 de
abajo) están en `docs/fix_justificacion_menciona_n_de_m_2026-07-31.md` y
en la lista consolidada de `docs/camino-a-beta.md`, no acá, para no
duplicar.

## Statements SQL (40 ítems, listos para el SQL Editor de Supabase)

Generados por script a partir del catálogo de `Temas` (no tipeados a
mano), para evitar errores de tilde o mayúscula que rompan el link la
próxima vez que corra `sync_airtable_supabase.py`. **No ejecutados por
Claude** (los `UPDATE` a esta tabla en producción están bloqueados por el
modo automático, y de todas formas el proceso de este proyecto exige
revisión de Laura antes de aplicar).

```sql
update public.evaluacion_practica set tema = '1. Efecto de las obligaciones y sistema de remedios' where codigo = 'rc-aplic-004';
update public.evaluacion_practica set tema = '4. Obligaciones de medios y de resultado' where codigo = 'rc-aplic-005';
update public.evaluacion_practica set tema = '12. Los perjuicios indemnizables' where codigo = 'rc-aplic-003';
update public.evaluacion_practica set tema = '15. La resolución y el pacto comisorio' where codigo = 'rc-aplic-007';
update public.evaluacion_practica set tema = '12. Los perjuicios indemnizables' where codigo = 'rc-aplic-009';
update public.evaluacion_practica set tema = '7. El dolo contractual' where codigo = 'rc-detect-010';
update public.evaluacion_practica set tema = '12. Los perjuicios indemnizables' where codigo = 'rc-aplic-008';
update public.evaluacion_practica set tema = '8. Presunción de culpa y carga de la prueba' where codigo = 'rc-detect-003';
update public.evaluacion_practica set tema = '20. Cláusulas modificatorias de responsabilidad' where codigo = 'rc-aplic-012';
update public.evaluacion_practica set tema = '16. La autonomía de la acción indemnizatoria' where codigo = 'rc-just-006';
update public.evaluacion_practica set tema = '6. La culpa contractual y su graduación' where codigo = 'rc-aplic-001';
update public.evaluacion_practica set tema = '1. Efecto de las obligaciones y sistema de remedios' where codigo = 'rc-just-004';
update public.evaluacion_practica set tema = '10. El caso fortuito o fuerza mayor' where codigo = 'rc-aplic-010';
update public.evaluacion_practica set tema = '15. La resolución y el pacto comisorio' where codigo = 'rc-just-005';
update public.evaluacion_practica set tema = '8. Presunción de culpa y carga de la prueba' where codigo = 'cont-aplic-001';
update public.evaluacion_practica set tema = '14. El cumplimiento forzado' where codigo = 'rc-aplic-006';
update public.evaluacion_practica set tema = '20. Cláusulas modificatorias de responsabilidad' where codigo = 'rc-mc-009';
update public.evaluacion_practica set tema = '1. Efecto de las obligaciones y sistema de remedios' where codigo = 'rc-detect-004';
update public.evaluacion_practica set tema = '10. El caso fortuito o fuerza mayor' where codigo = 'rc-mc-007';
update public.evaluacion_practica set tema = '8. Presunción de culpa y carga de la prueba' where codigo = 'rc-detect-006';
update public.evaluacion_practica set tema = '18. Imprevisión y frustración del fin del contrato' where codigo = 'rc-detect-008';
update public.evaluacion_practica set tema = '9. La mora' where codigo = 'rc-detect-007';
update public.evaluacion_practica set tema = '19. Los derechos auxiliares del acreedor' where codigo = 'rc-detect-009';
update public.evaluacion_practica set tema = '15. La resolución y el pacto comisorio' where codigo = 'rc-detect-005';
update public.evaluacion_practica set tema = '1. Efecto de las obligaciones y sistema de remedios' where codigo = 'rc-detect-002';
update public.evaluacion_practica set tema = '9. La mora' where codigo = 'rc-mc-006';
update public.evaluacion_practica set tema = '19. Los derechos auxiliares del acreedor' where codigo = 'rc-mc-008';
update public.evaluacion_practica set tema = '3. El incumplimiento: noción objetiva' where codigo = 'rc-mc-002';
update public.evaluacion_practica set tema = '1. Efecto de las obligaciones y sistema de remedios' where codigo = 'rc-mc-001';
update public.evaluacion_practica set tema = '15. La resolución y el pacto comisorio' where codigo = 'rc-mc-004';
update public.evaluacion_practica set tema = '10. El caso fortuito o fuerza mayor' where codigo = 'rc-mc-003';
update public.evaluacion_practica set tema = '6. La culpa contractual y su graduación' where codigo = 'rc-mc-005';
update public.evaluacion_practica set tema = '20. Cláusulas modificatorias de responsabilidad' where codigo = 'rc-just-010';
update public.evaluacion_practica set tema = '12. Los perjuicios indemnizables' where codigo = 'rc-just-007';
update public.evaluacion_practica set tema = '19. Los derechos auxiliares del acreedor' where codigo = 'rc-aplic-011';
update public.evaluacion_practica set tema = '18. Imprevisión y frustración del fin del contrato' where codigo = 'rc-just-008';
update public.evaluacion_practica set tema = '6. La culpa contractual y su graduación' where codigo = 'cont-just-001';
update public.evaluacion_practica set tema = '1. Efecto de las obligaciones y sistema de remedios' where codigo = 'rc-just-002';
update public.evaluacion_practica set tema = '4. Obligaciones de medios y de resultado' where codigo = 'rc-just-003';
update public.evaluacion_practica set tema = '19. Los derechos auxiliares del acreedor' where codigo = 'rc-just-009';
```

Si Laura decide asignar `rc-just-001` al eje 1 pese a la debilidad
señalada arriba, el statement sería:

```sql
-- opcional, solo si Laura aprueba la clasificación débil de rc-just-001:
update public.evaluacion_practica set tema = '1. Efecto de las obligaciones y sistema de remedios' where codigo = 'rc-just-001';
```

## Resumen final

- **40 ítems clasificados** con confianza (de 42 pendientes reales),
  quedan como Contractual.
- **2 ítems resultaron ser de materia equivocada**, no de eje:
  `rc-aplic-002` y `rc-just-001` se mueven a Extracontractual (ver
  sección arriba y `docs/fix_justificacion_menciona_n_de_m_2026-07-31.md`).
- **1 fila corrupta** (`rc-detect-001`) excluida de todo, ya reportada
  aparte.

Total por eje después de aplicar los `UPDATE` (8 ya existentes + 40
nuevos = 48 de 51 filas reales con `tema`):

| Eje | Ya existían | Nuevos (este doc) | Total |
|---|---|---|---|
| 1. Efecto de las obligaciones y sistema de remedios | 0 | 6 | **6** |
| 2. El pago (cumplimiento) y sus principios | 0 | 0 | **0** |
| 3. El incumplimiento: noción objetiva | 0 | 1 | **1** |
| 4. Obligaciones de medios y de resultado | 0 | 2 | **2** |
| 5. Requisitos de la indemnización de perjuicios | 0 | 0 | **0** |
| 6. La culpa contractual y su graduación | 0 | 3 | **3** |
| 7. El dolo contractual | 1 | 1 | **2** |
| 8. Presunción de culpa y carga de la prueba | 0 | 3 | **3** |
| 9. La mora | 0 | 2 | **2** |
| 10. El caso fortuito o fuerza mayor | 0 | 3 | **3** |
| 11. La teoría de los riesgos | 0 | 0 | **0** |
| 12. Los perjuicios indemnizables | 1 | 4 | **5** |
| 13. Avaluación de perjuicios y cláusula penal | 0 | 0 | **0** |
| 14. El cumplimiento forzado | 0 | 1 | **1** |
| 15. La resolución y el pacto comisorio | 1 | 4 | **5** |
| 16. La autonomía de la acción indemnizatoria | 1 | 1 | **2** |
| 17. Las eximentes de responsabilidad | 1 | 0 | **1** |
| 18. Imprevisión y frustración del fin del contrato | 1 | 2 | **3** |
| 19. Los derechos auxiliares del acreedor | 1 | 4 | **5** |
| 20. Cláusulas modificatorias de responsabilidad | 1 | 3 | **4** |
| 21. Prescripción de las acciones | 0 | 0 | **0** |

Los ejes 2, 5, 11, 13 y 21 quedan en cero ítems de Evaluación. De estos,
2, 11 y 21 no tienen sección propia en el manual (ver hallazgo arriba),
así que no es solo un hueco de contenido de Evaluación sino, posiblemente,
de estructura del manual mismo; los ejes 5 y 13 sí tienen sección
desarrollada pero ningún ítem de este lote la usa. Es una observación
para la Fase 1 (tabla de cobertura completa) o para cuando Laura revise
el manual, no algo que esta Fase 0 deba resolver.
