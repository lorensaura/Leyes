# Reclasificación completa de Flashcards de Contractual (2026-07-31)

> Segunda pasada sobre el Hallazgo 1 de `docs/cobertura_subtema_rec_2026-07-31.md`
> (2026-07-31). Aquel diagnóstico fue un muestreo por palabra clave sobre las 225
> flashcards de `materia = 'Responsabilidad contractual'` y estimó que solo
> unas 30 de las 200 tarjetas del eje 6 estaban mal etiquetadas. Laura pidió un
> análisis real: reclasificar cada una de las 225 tarjetas leyendo su pregunta
> y respuesta contra el contenido del manual (`01_Responsabilidad_Contractual_Manual.html`),
> no contra palabras clave. Esta segunda pasada corrige esa estimación:
> **el número real de tarjetas mal ubicadas es muchísimo mayor que 30.**
>
> Solo lectura: no se escribió nada en Supabase ni en Airtable. Detalle
> completo id → eje real en
> `docs/reclasificacion_flashcards_rec_2026-07-31_detalle.csv` (225 filas).

## Resumen ejecutivo

- Se leyeron las 225 filas de `flashcards` (`pregunta`, `respuesta`, `tema`
  actual) y el manual completo (2058 líneas, las 8 secciones A-H), y se
  clasificó cada tarjeta contra la sección del manual cuyo contenido
  responde efectivamente esa pregunta, no contra el `tema` que tenía.
- Se confirmó por qué las 225 quedaron mal repartidas: el campo
  `Flashcards` de los registros `Temas` de Airtable (`Digesto Contractual`)
  solo tiene contenido en dos registros, el eje 1 (25 ids) y el eje 6 (200
  ids); la unión exacta de esos dos arreglos son los 225 `airtable_id` que
  hoy están en Supabase. No es un problema de Supabase: es que en Airtable
  nunca se linkearon las flashcards a los otros 18 ejes.
- De las 200 tarjetas etiquetadas como eje 6 ("La culpa contractual y su
  graduación"), solo **119 tratan realmente ese tema**. Las **81 restantes**
  (40,5%, no el ~15% que estimó el muestreo) tratan en realidad presunción
  de culpa y carga de la prueba (eje 8: 31), obligaciones de medio/resultado
  (eje 4: 15), cláusulas modificatorias de responsabilidad (eje 20: 15),
  efecto de las obligaciones (eje 1: 6), la mora (eje 9: 6), eximentes (eje
  17: 4), el dolo (eje 7: 3) y caso fortuito (eje 10: 1).
- De las 25 etiquetadas como eje 1, 24 sí son eje 1 y 1 es en realidad eje
  18 (imprevisión).
- **El hallazgo más importante para planificar contenido nuevo no es la
  mala etiquetación en sí, sino esto: después de reclasificar las 225 con
  precisión, 10 de los 20 ejes siguen en cero flashcards.** Ninguna de las
  225 tarjetas existentes, bien miradas, resuelve nada de pago (eje 2),
  incumplimiento objetivo (eje 3), requisitos generales de la indemnización
  (eje 5), perjuicios indemnizables/daño (eje 12), avaluación de perjuicios
  y cláusula penal (eje 13), cumplimiento forzado (eje 14), resolución y
  pacto comisorio (eje 15), autonomía de la acción indemnizatoria (eje 16),
  derechos auxiliares del acreedor (eje 19) ni prescripción (eje 21). Esto
  es lo opuesto a lo que sugería el Hallazgo 1: no hay "tarjetas escondidas"
  que tapen buena parte del hueco de los otros 19 ejes; el hueco real es
  casi tan grande como parecía.
- El eje 6 queda, aun después de la limpieza, con 119 tarjetas: muy por
  encima del rango de referencia de Extracontractual (7-12 tarjetas por eje,
  ver `docs/cobertura_subtema_rex_2026-07-30.md`). Hay además redundancia
  visible dentro de esas 119 (el mismo dato se pregunta de 3-5 formas
  distintas; ver sección "Redundancia dentro del eje 6").
- Recomendación de tarjetas nuevas: **ver tabla en la sección (d)**, total
  aproximado de 105-130 tarjetas nuevas repartidas en los 16 ejes que hoy
  quedan bajos o en cero (no se recomienda agregar a los ejes 1, 4, 6 y 8,
  ya sobre-servidos).

## Metodología

1. Se trajeron las 225 filas de `flashcards` (`id`, `tema`, `pregunta`,
   `respuesta`, `dificultad`, `airtable_id`) vía API REST de Supabase.
2. Se confirmó el catálogo real de 20 ejes contra la tabla `Temas` de
   Airtable (`Digesto Contractual`, `baseId appxeVxAE53yIqRPa`): están
   numerados 1-10 y 12-21 (el 11, "La teoría de los riesgos", ya no existe,
   Laura lo borró el 2026-07-31 por no ser un eje real). Ninguna tarjeta se
   clasificó en el eje 11: donde una tarjeta tocaba de pasada el riesgo de
   la cosa (art. 1550, quién soporta la pérdida fortuita frente a la
   contraparte) y no encajaba en otro eje, se dejó anotada aparte en vez de
   forzarla (ver sección de casos especiales).
3. Se leyó el manual completo, línea por línea, y se construyó un mapeo
   eje → sección/subsección del manual basado en el contenido (no solo en
   el título), coincidente con el que ya había hecho
   `docs/fase0_rec_clasificacion_2026-07-31.md` para los ítems de
   Evaluación (se usó esa tabla como verificación cruzada: los mismos ejes
   quedaron anclados a las mismas secciones).
4. Para cada una de las 225 tarjetas se leyó `pregunta` + `respuesta` y se
   determinó, por contenido, a qué sección del manual corresponde. El
   detalle completo, id por id, está en el CSV adjunto (columnas: `id`,
   `airtable_id`, `tema_actual`, `tema_real`, `seccion_manual`, `nota`).
5. Reglas de desempate declaradas de antemano para los pares de ejes que se
   confunden con más frecuencia en este lote (para que el criterio sea
   auditable, no una decisión caso a caso sin regla):

   | Par de ejes | Regla |
   |---|---|
   | 6 vs 8 | Si la tarjeta pregunta qué grado de culpa corresponde (definiciones de grave/leve/levísima, el reparto del art. 1547 inc. 1 según utilidad del contrato, la equivalencia culpa grave = dolo) → **6**. Si pregunta quién debe probar (art. 1547 inc. 3, art. 1698, art. 1671, la inversión de la carga frente a la extracontractual) → **8**. |
   | 6 vs 4 | Si la tarjeta trata la clasificación medio/resultado y su consecuencia probatoria o de exención (aunque mencione "se presume" o "debe probarse") → **4**, no 8 ni 6. |
   | 7 vs 6 | Reglas propias del dolo (no se presume, agrava a imprevistos, condonación futura ilícita, apreciación in concreto) → **7**, aunque se compare con la culpa grave. |
   | 9 vs 15/17 | Interpelación (art. 1551), requisitos y efectos de la mora del deudor, mora del acreedor en general → **9**. El art. 1552 invocado como requisito de la acción resolutoria → **15**. La mora/hecho del acreedor invocado como eximente de responsabilidad del deudor → **17** (con nota, por la superposición real que tiene el manual entre E.7.5 y F.4). |
   | 10 vs 17 | Concepto, tres requisitos, efectos, cuatro excepciones y prueba del caso fortuito → **10**. Ausencia de culpa, estado de necesidad, hecho o culpa del acreedor, hecho ajeno (cuando el tercero no genera caso fortuito) → **17**. |
   | 12 vs 13 | Qué daños son indemnizables (concepto, clasificaciones de Grez, daño moral, pérdida de chance) → **12**. Cómo se fija el monto (judicial, legal del art. 1559, cláusula penal) → **13**. |
   | 1 vs 14/15 | La opción del art. 1489 en sí misma, compatibilidad de acciones, arbitrio, subjetiva/objetivación → **1**. El régimen propio de cada remedio → **14** o **15**. |
   | 20 vs 6/10 | Si la tarjeta describe una cláusula o pacto concreto que altera el régimen legal (agrava, atenúa, fija tope, exonera) → **20**. Si describe el régimen legal supletorio en abstracto, aunque mencione que "las partes pueden pactar otra cosa" como una de las cuatro fuentes jerárquicas → **6** (o el eje que corresponda). |
   | 21 | Solo tarjetas cuyo objeto sea la prescripción en sí. La del pacto comisorio (art. 1880) → **15**. La de la acción pauliana (1 año) → **19**. |

6. Los casos genuinamente ambiguos (la pregunta calza igual de bien en dos
   ejes por cómo el propio manual repite el contenido en dos secciones) se
   dejaron con nota explicativa en el CSV en vez de forzar una sola
   respuesta; se listan también en la sección (b) de este documento.

## (a) Tabla de reclasificación agrupada por eje de destino

`tema_actual` = eje con el que hoy está en Supabase (solo puede ser 1 o 6,
son los dos únicos que Airtable linkeó). `tema_real` = eje que le
corresponde según el contenido de pregunta + respuesta.

| Eje de destino (`tema_real`) | Total tarjetas | De `tema_actual` = 1 | De `tema_actual` = 6 | Ejemplo representativo |
|---|---|---|---|---|
| 1. Efecto de las obligaciones y sistema de remedios | 30 | 24 | 6 | "¿En qué consiste el efecto relativo de los contratos?" (id 60) |
| 4. Obligaciones de medios y de resultado | 15 | 0 | 15 | "¿Qué efecto tiene sobre la prueba el que la obligación sea de resultado y no de medios?" (id 53) |
| 6. La culpa contractual y su graduación | 119 | 0 | 119 | "¿Qué grado de culpa supone «el cuidado mínimo que aun los negligentes emplean»?" (id 1) |
| 7. El dolo contractual | 3 | 0 | 3 | "Según el art. 44 inc. final, ¿cómo se define el dolo?" (id 150) |
| 8. Presunción de culpa y carga de la prueba | 31 | 0 | 31 | "Complete el art. 1547 inc. 3º: «La prueba de la diligencia o cuidado incumbe ____...»" (id 161) |
| 9. La mora | 6 | 0 | 6 | "En las obligaciones de no hacer, ¿se requiere mora para la indemnización por culpa?" (id 64) |
| 10. El caso fortuito o fuerza mayor | 1 | 0 | 1 | "Caso: el deudor alega caso fortuito para exonerarse. ¿A quién corresponde probarlo?" (id 125) |
| 17. Las eximentes de responsabilidad | 4 | 0 | 4 | "Caso: el dependiente del deudor causa el daño que provoca el incumplimiento. ¿Responde el deudor?" (id 123) |
| 18. Imprevisión y frustración del fin del contrato | 1 | 1 | 0 | "¿Cómo se conecta la fuerza obligatoria (1545) con la imprevisión?" (id 121) |
| 20. Cláusulas modificatorias de responsabilidad | 15 | 0 | 15 | "Caso: en un contrato las partes pactan que el deudor «no responderá de ninguna especie de culpa, ni siquiera de la grave». ¿Es válida?" (id 208) |
| **Total** | **225** | **25** | **200** | |

Nota sobre el eje 1: las ids 18 y 21 ("¿qué artículo regula la promesa de
hecho ajeno?", "¿qué artículo regula la estipulación a favor de otro?")
mencionan los arts. 1450 y 1449, que también aparecen de pasada en la
sección de cláusula penal (E.10.2) como excepción a su carácter
accesorio. Se descartó el eje 13 para esas dos: las ids 47 y 199, del
mismo lote original de 25 (ya bien etiquetadas), muestran que ambos
artículos son en realidad las dos primeras de las "tres excepciones
clásicas al efecto relativo del contrato" que sí tiene sección propia en
A.3; las ids 18, 21, 47, 60 y 199 forman un mismo cluster de eje 1.

Los 10 ejes que no aparecen en esta tabla (2, 3, 5, 12, 13, 14, 15, 16, 19
y 21, más el 11 que ya no existe) **recibieron cero tarjetas** de esta
reclasificación: ninguna de las 225 preguntas, leída con cuidado, resultó
tratar esos temas. El detalle completo, id por id con su nota de
respaldo, está en el CSV adjunto.

## (b) Casos especiales y ambiguos

Ninguna de las 225 quedó "sin ubicar" en el sentido de no encajar en
ningún eje, pero varias tarjetas tocan un punto que el propio manual repite
en dos secciones distintas, o son ejemplos comparados que no tienen una
sección dedicada. Se listan para que quede trazable el criterio, no para
que se relean una por una:

- **Id 13** (comodatario, cosa perece en su poder): mezcla la presunción
  del art. 1671 (caso fortuito, eje 10), la carga de la prueba general
  (eje 8) y la graduación culpa levísima del comodato (eje 6). Se clasificó
  en 8 porque la pregunta central es "¿tiene razón al decir que no debe
  probar nada?", pero es defendible moverla a 10.
- **Ids 144 y 225** (vendedor cuya responsabilidad se atenúa porque el
  comprador se niega a recibir, art. 1827): el manual desarrolla este
  punto dos veces, una vez como "mora del acreedor" (E.7.5, eje 9) y otra
  como "hecho o culpa del acreedor" (F.4, eje 17). Se clasificaron en 9;
  también encajan en 17.
- **Ids 123, 148, 169, 210** (hecho o culpa de un tercero por quien el
  deudor sí o no responde, arts. 1590/1677/1679): el manual trata esta
  regla dentro de E.4.2 (culpa contractual) y otra vez, con mayor
  desarrollo, en F.5 ("El hecho ajeno"). Se clasificaron en 17 por ser la
  sección con nombre y desarrollo propio.
- **Ids 164 y 183** (principio de buena fe del art. 1546, función
  integradora): el art. 1546 aparece en A.3 (marco general) como norma que
  regula "los efectos del contrato" y también en H.2.2 como eje de la
  interpretación de las cláusulas modificatorias. Se clasificaron en 1 por
  ser la pregunta genérica ("¿qué principio consagra el art. 1546?"), sin
  referencia a una cláusula concreta.
- **Ids 75 y 90** (ejemplos de prueba de la culpa en el mandato, art.
  2158): son ejemplos comparados que Orrego usa dentro de la doctrina de
  la presunción de culpa, pero el mandato como contrato no tiene sección
  propia en este manual. Se dejaron en eje 8 (carga de la prueba) por ser
  el punto que efectivamente prueban.
- **Id 105** (solidaridad vs. responsabilidad simplemente conjunta entre
  codeudores contractuales): es un apunte comparado que no calza con
  ninguna sección literal del manual leída completa; se dejó en eje 6 por
  aparecer junto a la doctrina de graduación de la culpa, con nota de
  incertidumbre en el CSV.
- **Ids 137 y 200** (la culpa grave equivale al dolo, por tanto el deudor
  responde también de los perjuicios directos imprevistos, art. 1558): el
  eje 12 ("Los perjuicios indemnizables") queda en cero en este documento,
  pero `docs/fase0_rec_clasificacion_2026-07-31.md` clasificó una pregunta
  de Evaluación sobre ese mismo artículo (perjuicios previstos e
  imprevistos) en el eje 12. Aquí se mantuvieron ambas en eje 6 porque el
  sujeto de la pregunta es la culpa grave y su equiparación al dolo (una
  regla de graduación de la culpa), no la taxonomía del daño; queda
  anotado para que el "eje 12 en cero" no descanse en un límite no
  declarado.
- **Ningún caso de "teoría de los riesgos" (eje 11) fue forzado.** La
  tarjeta más cercana a ese tema (id 13, pérdida de la cosa en poder del
  comodatario) se resolvió por su faceta probatoria (eje 8), no por el
  riesgo de la pérdida frente a la contraparte, que el manual no desarrolla
  como "teoría de los riesgos" con nombre propio (coincide con el hallazgo
  ya documentado en `docs/fase0_rec_clasificacion_2026-07-31.md`).

## Redundancia dentro del eje 6

Aun después de sacar las 81 tarjetas mal ubicadas, el eje 6 queda con 119
tarjetas, muy por encima de cualquier eje de Extracontractual (7-12). Gran
parte de esa cifra es redundancia real, no cobertura: el mismo dato se
pregunta de varias formas casi idénticas. Ejemplos (ids, no exhaustivo):

- La equivalencia "toda especie de culpa" = culpa levísima se pregunta en
  los ids 84, 153 y 213 (esta última además cita el art. 2222, que es la
  misma norma de la 213 sobre el depósito).
- El ejemplo del comodato con culpa levísima (art. 2178) se repite en los
  ids 44, 158, 178, 198 y 223 (esta última es la variante "comodato en
  pro de ambas partes", que sí agrega un matiz).
- La definición de culpa grave del art. 44 se pide completar o citar en los
  ids 1, 11, 57, 97 y 186.

Esto no se corrige en este documento, es una observación para cuando
Laura revise el contenido de Práctica de este eje: probablemente convenga
retirar duplicados antes o en vez de agregar tarjetas nuevas ahí.

## (c) Tabla final: tarjetas reales por eje, después de reclasificar

| Eje | Nombre | Antes (Airtable) | Después (real) |
|---|---|---|---|
| 1 | Efecto de las obligaciones y sistema de remedios | 25 | **30** |
| 2 | El pago (cumplimiento) y sus principios | 0 | **0** |
| 3 | El incumplimiento: noción objetiva | 0 | **0** |
| 4 | Obligaciones de medios y de resultado | 0 | **15** |
| 5 | Requisitos de la indemnización de perjuicios | 0 | **0** |
| 6 | La culpa contractual y su graduación | 200 | **119** |
| 7 | El dolo contractual | 0 | **3** |
| 8 | Presunción de culpa y carga de la prueba | 0 | **31** |
| 9 | La mora | 0 | **6** |
| 10 | El caso fortuito o fuerza mayor | 0 | **1** |
| 12 | Los perjuicios indemnizables | 0 | **0** |
| 13 | Avaluación de perjuicios y cláusula penal | 0 | **0** |
| 14 | El cumplimiento forzado | 0 | **0** |
| 15 | La resolución y el pacto comisorio | 0 | **0** |
| 16 | La autonomía de la acción indemnizatoria | 0 | **0** |
| 17 | Las eximentes de responsabilidad | 0 | **4** |
| 18 | Imprevisión y frustración del fin del contrato | 0 | **1** |
| 19 | Los derechos auxiliares del acreedor | 0 | **0** |
| 20 | Cláusulas modificatorias de responsabilidad | 0 | **15** |
| 21 | Prescripción de las acciones | 0 | **0** |
| | **Total** | **225** | **225** |

## (d) Tarjetas nuevas recomendadas por eje

Se usa como referencia el rango de Extracontractual (7-12 flashcards por
eje en sus 25 ejes, ver `docs/cobertura_subtema_rex_2026-07-30.md`), pero
ajustado hacia arriba o abajo según cuánto desarrolla el manual cada tema
(medido en extensión de la sección, no solo en si existe). No se
recomienda agregar nada a los ejes 1, 4, 6 y 8, que ya están al nivel o por
encima del rango de referencia (y el 6, además, tiene margen para
recortar en vez de crecer, ver "Redundancia" arriba).

| Eje | Hoy | Densidad de la sección en el manual | Nuevas recomendadas | Objetivo |
|---|---|---|---|---|
| 1. Efecto de las obligaciones y sistema de remedios | 30 | Media (sección A completa, ~108 líneas de HTML) | 0 | ya sobre el rango |
| 2. El pago (cumplimiento) y sus principios | 0 | Nula, sin sección propia (2-3 líneas dentro de B.1) | 3-5 | cobertura mínima, condicionada a que Laura decida si desarrolla el punto en el manual |
| 3. El incumplimiento: noción objetiva | 0 | Media (B.1-B.2, ~49 líneas: incumplimiento total/parcial, casos que no generan responsabilidad) | 8-10 | 8-10 |
| 4. Obligaciones de medios y de resultado | 15 | Baja en extensión (B.3, ~12 líneas) pero alta en peso de examen | 0 | ya sobre el rango |
| 5. Requisitos de la indemnización de perjuicios | 0 | Media (E.1+E.2+intro E.4+causalidad E.6, ~102 líneas repartidas, sin sección única) | 8-10 | 8-10 |
| 6. La culpa contractual y su graduación | 119 | Alta pero muy repetida (E.4.2, solo ~28 líneas de fuente para 119 tarjetas) | 0 (revisar duplicados) | recortar, no crecer |
| 7. El dolo contractual | 3 | Media-baja (E.4.1, ~11 líneas, sección corta pero con reglas propias claras) | 7-9 | 10-12 |
| 8. Presunción de culpa y carga de la prueba | 31 | Media (B.4, ~27 líneas, + recuadro de E.4.2) | 0 | ya sobre el rango |
| 9. La mora | 6 | Media (E.7 completa, ~50 líneas: interpelación/efectos/mora acreedor) | 3-5 | 9-11 |
| 10. El caso fortuito o fuerza mayor | 1 | Alta (F.1 completa, ~102 líneas: concepto, 3 requisitos, efectos, 4 excepciones, prueba) | 9-11 | 10-12, prioridad alta |
| 12. Los perjuicios indemnizables | 0 | Muy alta (E.5 completa, ~177 líneas: daño/perjuicio, 10 clasificaciones de Grez, daño moral, pérdida de chance) | 10-12 | 10-12, prioridad alta |
| 13. Avaluación de perjuicios y cláusula penal | 0 | Alta (E.8-E.10, ~114 líneas: judicial, legal/anatocismo, cláusula penal y cláusula penal enorme) | 10-12 | 10-12, prioridad alta |
| 14. El cumplimiento forzado | 0 | Alta (sección C completa, ~118 líneas: objeto, presupuestos, ejecución dar/hacer/no hacer, límites) | 9-11 | 9-11, prioridad alta |
| 15. La resolución y el pacto comisorio | 0 | Muy alta (sección D completa, ~246 líneas, la más extensa del manual) | 10-12 | 10-12, prioridad alta |
| 16. La autonomía de la acción indemnizatoria | 0 | Media (E.3, ~57 líneas, debate con jurisprudencia propia: Zorín, Santo Tomás) | 8-10 | 8-10 |
| 17. Las eximentes de responsabilidad | 4 | Media (F.2-F.5, ~55 líneas) | 5-7 | 9-11 |
| 18. Imprevisión y frustración del fin del contrato | 1 | Alta (F.6-F.7, ~111 líneas, con trilogía jurisprudencial reciente) | 8-10 | 9-11 |
| 19. Los derechos auxiliares del acreedor | 0 | Muy alta (sección G completa, ~189 líneas: prenda general, medidas conservativas, oblicua, pauliana, beneficio de separación) | 10-12 | 10-12, prioridad alta |
| 20. Cláusulas modificatorias de responsabilidad | 15 | Media (sección H, ~90 líneas), pero las 15 actuales solo cubren H.1 (agravar/atenuar el grado de culpa); H.2 (interpretación) y H.3 (cláusulas de estilo: "no admitirá interpretación", "todo incumplimiento", "todo daño", "excluye daños indirectos") no tienen ninguna | 4-6 (enfocadas en H.2-H.3) | cubrir el sub-hueco de interpretación y cláusulas de estilo |
| 21. Prescripción de las acciones | 0 | Nula, sin sección propia | 3-5 | cobertura mínima, condicionada a que Laura decida si desarrolla el punto en el manual |

Las líneas indicadas se cuentan sobre el HTML fuente
(`01_Responsabilidad_Contractual_Manual.html`, 2058 líneas totales, 8
secciones A-H), no sobre el texto plano; son una medida relativa entre
secciones, no un conteo exacto de palabras.

**Total aproximado de tarjetas nuevas recomendadas: entre 105 y 130**,
repartidas en los 16 ejes de la tabla (excluyendo 1, 4, 6 y 8). Los ejes
marcados "prioridad alta" (10, 12, 13, 14, 15, 19) son secciones extensas
del manual con jurisprudencia y doctrina propia que hoy tienen cero o casi
cero flashcards reales.

## Aviso importante: por qué esto no se arregla solo con un `UPDATE` en Supabase

`scripts/sync_airtable_supabase.py` sincroniza la tabla `flashcards` de
Supabase leyendo la tabla `Flashcards` de la base `Digesto Contractual` en
Airtable. El campo `tema` de cada flashcard en Supabase viene de seguir el
link a `Temas` que tiene esa fila en Airtable. Si el `UPDATE` de este
documento se corre solo en Supabase, quedaría bien hasta la próxima vez
que se ejecute el script de sincronización: en ese momento Airtable volvería
a mandar el `tema` viejo (el link de esa fila sigue apuntando al registro
`Temas` del eje 1 o del eje 6) y el arreglo se revertiría solo.

**La corrección definitiva no está en este documento**: implica entrar a
Airtable, tabla `Flashcards` de `Digesto Contractual`, y para cada
`airtable_id` de este CSV volver a linkear el campo `Temas` al eje real
(columna `tema_real`). El `UPDATE` de Supabase de más abajo es un parche
inmediato para que la app muestre el eje correcto hoy mismo, mientras
Laura decide si y cuándo relinkea en Airtable. Los `airtable_id` de cada
fila están en la columna `airtable_id` del CSV para que ese trabajo, si
se hace, sea directo.

## Statements SQL (82 reclasificaciones, no ejecutados)

Solo se listan las 82 filas donde `tema_real` difiere de `tema_actual`
(las 143 restantes ya estaban bien etiquetadas y no necesitan `UPDATE`).
Generados por script a partir de los nombres exactos de `Temas` en
Airtable, para evitar errores de tilde o mayúscula. **No ejecutados por
Claude**, igual que en `docs/fase0_rec_clasificacion_2026-07-31.md`: quedan
para que Laura los revise y decida si correrlos en el SQL Editor de
Supabase.

```sql
update public.flashcards set tema = '8. Presunción de culpa y carga de la prueba' where id = 2;
update public.flashcards set tema = '7. El dolo contractual' where id = 3;
update public.flashcards set tema = '8. Presunción de culpa y carga de la prueba' where id = 4;
update public.flashcards set tema = '8. Presunción de culpa y carga de la prueba' where id = 9;
update public.flashcards set tema = '8. Presunción de culpa y carga de la prueba' where id = 13;
update public.flashcards set tema = '20. Cláusulas modificatorias de responsabilidad' where id = 14;
update public.flashcards set tema = '8. Presunción de culpa y carga de la prueba' where id = 17;
update public.flashcards set tema = '4. Obligaciones de medios y de resultado' where id = 19;
update public.flashcards set tema = '8. Presunción de culpa y carga de la prueba' where id = 24;
update public.flashcards set tema = '4. Obligaciones de medios y de resultado' where id = 28;
update public.flashcards set tema = '8. Presunción de culpa y carga de la prueba' where id = 29;
update public.flashcards set tema = '20. Cláusulas modificatorias de responsabilidad' where id = 31;
update public.flashcards set tema = '4. Obligaciones de medios y de resultado' where id = 36;
update public.flashcards set tema = '4. Obligaciones de medios y de resultado' where id = 39;
update public.flashcards set tema = '20. Cláusulas modificatorias de responsabilidad' where id = 40;
update public.flashcards set tema = '20. Cláusulas modificatorias de responsabilidad' where id = 42;
update public.flashcards set tema = '20. Cláusulas modificatorias de responsabilidad' where id = 48;
update public.flashcards set tema = '8. Presunción de culpa y carga de la prueba' where id = 52;
update public.flashcards set tema = '4. Obligaciones de medios y de resultado' where id = 53;
update public.flashcards set tema = '4. Obligaciones de medios y de resultado' where id = 54;
update public.flashcards set tema = '7. El dolo contractual' where id = 63;
update public.flashcards set tema = '9. La mora' where id = 64;
update public.flashcards set tema = '9. La mora' where id = 66;
update public.flashcards set tema = '4. Obligaciones de medios y de resultado' where id = 67;
update public.flashcards set tema = '4. Obligaciones de medios y de resultado' where id = 68;
update public.flashcards set tema = '20. Cláusulas modificatorias de responsabilidad' where id = 71;
update public.flashcards set tema = '1. Efecto de las obligaciones y sistema de remedios' where id = 73;
update public.flashcards set tema = '8. Presunción de culpa y carga de la prueba' where id = 74;
update public.flashcards set tema = '8. Presunción de culpa y carga de la prueba' where id = 75;
update public.flashcards set tema = '8. Presunción de culpa y carga de la prueba' where id = 76;
update public.flashcards set tema = '8. Presunción de culpa y carga de la prueba' where id = 79;
update public.flashcards set tema = '8. Presunción de culpa y carga de la prueba' where id = 81;
update public.flashcards set tema = '20. Cláusulas modificatorias de responsabilidad' where id = 86;
update public.flashcards set tema = '8. Presunción de culpa y carga de la prueba' where id = 90;
update public.flashcards set tema = '8. Presunción de culpa y carga de la prueba' where id = 94;
update public.flashcards set tema = '8. Presunción de culpa y carga de la prueba' where id = 98;
update public.flashcards set tema = '20. Cláusulas modificatorias de responsabilidad' where id = 99;
update public.flashcards set tema = '1. Efecto de las obligaciones y sistema de remedios' where id = 101;
update public.flashcards set tema = '20. Cláusulas modificatorias de responsabilidad' where id = 108;
update public.flashcards set tema = '9. La mora' where id = 114;
update public.flashcards set tema = '4. Obligaciones de medios y de resultado' where id = 117;
update public.flashcards set tema = '20. Cláusulas modificatorias de responsabilidad' where id = 118;
update public.flashcards set tema = '20. Cláusulas modificatorias de responsabilidad' where id = 119;
update public.flashcards set tema = '18. Imprevisión y frustración del fin del contrato' where id = 121;
update public.flashcards set tema = '17. Las eximentes de responsabilidad' where id = 123;
update public.flashcards set tema = '10. El caso fortuito o fuerza mayor' where id = 125;
update public.flashcards set tema = '8. Presunción de culpa y carga de la prueba' where id = 126;
update public.flashcards set tema = '4. Obligaciones de medios y de resultado' where id = 130;
update public.flashcards set tema = '9. La mora' where id = 133;
update public.flashcards set tema = '4. Obligaciones de medios y de resultado' where id = 136;
update public.flashcards set tema = '1. Efecto de las obligaciones y sistema de remedios' where id = 140;
update public.flashcards set tema = '9. La mora' where id = 144;
update public.flashcards set tema = '8. Presunción de culpa y carga de la prueba' where id = 145;
update public.flashcards set tema = '8. Presunción de culpa y carga de la prueba' where id = 146;
update public.flashcards set tema = '17. Las eximentes de responsabilidad' where id = 148;
update public.flashcards set tema = '7. El dolo contractual' where id = 150;
update public.flashcards set tema = '1. Efecto de las obligaciones y sistema de remedios' where id = 155;
update public.flashcards set tema = '8. Presunción de culpa y carga de la prueba' where id = 159;
update public.flashcards set tema = '8. Presunción de culpa y carga de la prueba' where id = 161;
update public.flashcards set tema = '1. Efecto de las obligaciones y sistema de remedios' where id = 168;
update public.flashcards set tema = '17. Las eximentes de responsabilidad' where id = 169;
update public.flashcards set tema = '4. Obligaciones de medios y de resultado' where id = 173;
update public.flashcards set tema = '8. Presunción de culpa y carga de la prueba' where id = 175;
update public.flashcards set tema = '8. Presunción de culpa y carga de la prueba' where id = 176;
update public.flashcards set tema = '8. Presunción de culpa y carga de la prueba' where id = 188;
update public.flashcards set tema = '8. Presunción de culpa y carga de la prueba' where id = 189;
update public.flashcards set tema = '20. Cláusulas modificatorias de responsabilidad' where id = 192;
update public.flashcards set tema = '8. Presunción de culpa y carga de la prueba' where id = 194;
update public.flashcards set tema = '8. Presunción de culpa y carga de la prueba' where id = 195;
update public.flashcards set tema = '8. Presunción de culpa y carga de la prueba' where id = 202;
update public.flashcards set tema = '4. Obligaciones de medios y de resultado' where id = 204;
update public.flashcards set tema = '20. Cláusulas modificatorias de responsabilidad' where id = 205;
update public.flashcards set tema = '20. Cláusulas modificatorias de responsabilidad' where id = 208;
update public.flashcards set tema = '17. Las eximentes de responsabilidad' where id = 210;
update public.flashcards set tema = '4. Obligaciones de medios y de resultado' where id = 212;
update public.flashcards set tema = '20. Cláusulas modificatorias de responsabilidad' where id = 213;
update public.flashcards set tema = '4. Obligaciones de medios y de resultado' where id = 215;
update public.flashcards set tema = '8. Presunción de culpa y carga de la prueba' where id = 216;
update public.flashcards set tema = '8. Presunción de culpa y carga de la prueba' where id = 218;
update public.flashcards set tema = '8. Presunción de culpa y carga de la prueba' where id = 219;
update public.flashcards set tema = '1. Efecto de las obligaciones y sistema de remedios' where id = 221;
update public.flashcards set tema = '9. La mora' where id = 225;
```

## Resumen final

- **225 tarjetas revisadas una por una** contra el contenido del manual,
  no contra su `tema` actual ni por palabra clave.
- **82 quedan mal etiquetadas hoy** (36,4% de las 225), muy por encima del
  ~13% (30 de 225) que estimó el muestreo original.
- **143 ya estaban bien** (119 del eje 6 + 24 del eje 1).
- **10 de los 20 ejes reales siguen en cero tarjetas** después de la
  reclasificación: 2, 3, 5, 12, 13, 14, 15, 16, 19 y 21 (el 11 ya no es un
  eje válido).
- Recomendación: entre 105 y 130 tarjetas nuevas repartidas en los 16 ejes
  bajos o en cero, con prioridad en 10, 12, 13, 14, 15 y 19 (secciones
  extensas del manual sin ninguna flashcard real hoy, o casi ninguna).
- El parche de Supabase (82 `UPDATE`) no sobrevive el próximo
  `sync_airtable_supabase.py` si no se relinkea también en Airtable
  (`Digesto Contractual` → `Flashcards` → `Temas`).
- Detalle completo id → eje real:
  `docs/reclasificacion_flashcards_rec_2026-07-31_detalle.csv`.
