# Preguntas nuevas para el Eje 1 de Extracontractual (2026-07-30)

> Borrador de Claude, generado a partir de
> `02_Responsabilidad_Extracontractual_Manual.html` (líneas 327-386, Eje 1
> "Concepto, regulación y funciones") siguiendo el proceso de
> `docs/prompt-generacion-contenido-practica.md` y el skill
> `generar-evaluacion`. **Sin revisar por Laura todavía.** Nada de esto
> está en Airtable ni en Supabase.
>
> Paso 2 de "Qué sigue" en `docs/cobertura_subtema_rex_2026-07-30.md`: el
> eje 1 era, junto con 15 y 21, uno de los tres ejes débiles de Evaluación
> (1 solo ítem, de Justificación), pero a diferencia de esos dos no tenía
> ningún borrador previo que reutilizar ni contraparte parcial en
> Alternativas, así que este lote se redactó desde cero.
>
> **Antes de escribir, se revisaron las 11 Flashcards ya publicadas del
> eje** (la cobertura más alta de toda la tabla de cobertura de
> Extracontractual) y los 2 ítems de Alternativas (`ext-alt-002` y
> `ext-alt-033`), para no repetir el mismo ángulo. Cubren: la lista de las
> cuatro funciones, la función primordial, si el Código define la
> responsabilidad, los daños punitivos, la diferencia con la
> responsabilidad penal, la definición de Alessandri, el art. 1437 como
> fuente, el título/artículos de ubicación, delito vs. cuasidelito (art.
> 2284), la ausencia de tipicidad, y si la obligación es de "primer grado"
> o "segundo grado" (recuerdo abstracto de la clasificación de Barros).
>
> **Hallazgo sin resolver, para Laura: `ext-alt-002` y `ext-alt-033` son
> redundantes entre sí.** Ambas son Alternativas sobre el mismo elemento
> jurídico específico (el art. 1437 como fuente de la obligación
> indemnizatoria), lo que la sección 0.3 del prompt maestro define como
> redundante dentro de un mismo tipo. No se tocan en este lote (no era el
> encargo de esta sesión), pero quedan anotadas para que alguien decida
> si conviene fusionarlas o reescribir una hacia un ángulo distinto.
>
> **El único ítem de Evaluación existente (`re-just-002b`) no es tan
> virgen como podría sugerir el conteo de "1 ítem": su `respuesta_modelo`
> ya menciona, de paso, la idea de que "la no responsabilidad es el
> estado por defecto" (el núcleo del ítem 1 de abajo) y la disuasión en
> "plano particular" y "plano general" (el núcleo del ítem 2).** Los tres
> ítems de este lote siguen siendo defendibles bajo la sección 0.3 (tipo
> distinto + ángulo aplicado a un caso, no recuerdo en abstracto; el ítem
> 2 además agrega la distinción con la prevención especial administrativa,
> que `re-just-002b` nunca toca) pero no son terreno completamente
> virgen, y Laura debería revisarlos sabiendo eso, no asumiendo que no
> hay ningún solape.
>
> Correlativos siguientes disponibles en `evaluacion_practica` (materia
> extracontractual, prefijo `re-`) al momento de redactar: aplic-030,
> detect-031, mc-032. Se dejan como sugerencia de `codigo` al subir, no
> están escritos en los ítems porque el correlativo real depende de qué
> más se suba antes. **Al subir, linkear los 3 ítems a `Temas` → eje 1**
> (regla permanente de `docs/creacion-de-contenido.md`; ese link es lo que
> cuenta la tabla de cobertura).
>
> **Techo del eje vs. límite de lote:** este lote se detuvo en el límite
> de tamaño del skill (2-4 ítems), no porque el eje 1 haya agotado su
> material. El manual tiene más contenido no tocado aquí (la distinción
> daño civil/penal y ausencia de tipicidad de la sección 2, ya cubierta
> por 2 Flashcards pero no por ningún ítem de Evaluación con caso, sería
> el candidato más claro para un próximo lote de Aplicación o
> Discriminación MC).

---

## Eje 1: Concepto, regulación y funciones (3 preguntas nuevas)

### 1. Aplicación — la no responsabilidad como estado por defecto (alterum non laedere)
- **subtema:** Función de garantía de la libertad de actuar: la no responsabilidad como estado por defecto
- **caso:** Una noche de invierno, un peatón resbala sobre una placa de hielo que se formó naturalmente en la vereda pública frente a la casa de Marcela y se fractura una muñeca. No hay ninguna filtración de agua, desperfecto en la vereda ni omisión atribuible a Marcela: el hielo se formó por las condiciones climáticas de esa noche. El peatón demanda a Marcela, alegando que sufrió un daño real y que alguien debe hacerse cargo de él.
- **enunciado:** ¿Debe Marcela indemnizar al peatón solo porque este sufrió un daño real? Fundamenta con el principio que rige por defecto en materia de responsabilidad extracontractual.
- **respuesta_modelo:** No debe indemnizar. Rige el principio de que la no responsabilidad es el estado por defecto del ordenamiento (alterum non laedere): el daño, por sí solo, no genera ninguna obligación; permanece donde cayó, sobre quien lo sufrió, salvo que exista una razón jurídica que autorice desplazarlo a un tercero. La responsabilidad es la excepción, y es ella, no su ausencia, la que exige justificación. En este caso el hielo se formó naturalmente y no hay ninguna conducta culposa o dolosa de Marcela que autorice trasladarle el costo del daño: la sola existencia de un daño real no basta. De este principio se sigue, además, que la carga de acreditar los elementos de la responsabilidad (entre ellos, la culpa de Marcela) recae sobre el peatón, que es quien pretende el desplazamiento del daño; si no logra probarlos, el daño queda donde cayó.
- **articulos_referencia:**
- **objetivo_pedagogico:** Evaluar si el alumno aplica el principio de que la no responsabilidad es el estado por defecto (alterum non laedere) y su corolario sobre la carga de la prueba, en vez de asumir que todo daño real genera automáticamente el deber de indemnizar.
- **elementos_clave_texto:**
```
Identifica que la no responsabilidad es el estado por defecto del ordenamiento: el daño permanece donde cae salvo que exista una razón jurídica para desplazarlo :: no responsabilidad, estado por defecto, alterum non laedere
Concluye que la sola existencia de un daño real no basta para generar la obligación de indemnizar, porque la responsabilidad es la excepción que exige justificación :: daño real no basta, la responsabilidad es la excepción
Aplica el corolario de que la carga de acreditar los elementos de la responsabilidad recae sobre la víctima que pretende el desplazamiento del daño :: carga de la prueba, víctima, desplazamiento del daño
```

### 2. Detección de error — función preventiva: los dos planos propios vs. la prevención especial administrativa
- **subtema:** Función preventiva: los dos planos propios de la responsabilidad civil, distintos de la prevención especial administrativa
- **caso:** Un alumno responde: "La función preventiva de la responsabilidad extracontractual se agota en la prevención especial: exigir estudios de impacto ambiental, fijar límites de velocidad y exigir certificación sanitaria de medicamentos son las medidas que cumplen esta función. La prevención general, en cambio, es ajena a la responsabilidad civil: opera únicamente en el plano penal."
- **enunciado:** Evalúa la respuesta del alumno. ¿Es correcta?
- **respuesta_modelo:** No es correcta, y comete dos errores. Primero, confunde el contenido propio de la función preventiva de la responsabilidad civil con un mecanismo distinto que solo la complementa: los estudios de impacto ambiental, los límites de velocidad y la certificación sanitaria de medicamentos son normas de prevención especial de carácter administrativo, con las que suele complementarse el sistema de responsabilidad civil, no el contenido propio de su función preventiva. Segundo, niega que exista prevención general dentro de la responsabilidad civil, cuando es justo lo contrario: la prevención que las propias reglas de responsabilidad realizan es una prevención general, porque esas reglas están dirigidas a la generalidad de los actores y atribuyen ex ante los riesgos y costos de las actividades, con independencia de cualquier norma administrativa. La función preventiva de la responsabilidad civil opera, en realidad, en dos planos propios: el particular, respecto de quien ya sufrió una condena civil (que procurará evitar en el futuro la conducta que le produjo esa pérdida), y el general, respecto del resto de la sociedad, advertida por la existencia misma de la regla.
- **articulos_referencia:**
- **objetivo_pedagogico:** Evaluar si el alumno distingue la función preventiva propia de la responsabilidad civil (planos particular y general, esta última ya una prevención general en sí misma) de la prevención especial de carácter administrativo, que solo la complementa.
- **elementos_clave_texto:**
```
Detecta que el alumno confunde las medidas administrativas (prevención especial, un complemento aparte) con el contenido propio de la función preventiva de la responsabilidad civil :: confunde prevención especial administrativa con la función preventiva civil
Corrige que la disuasión propia de las reglas de responsabilidad ya es, en sí misma, una prevención general, por estar dirigida a la generalidad de los actores :: prevención general, dirigida a la generalidad de los actores
Explica que la función preventiva civil opera en dos planos propios: el particular (quien ya fue condenado) y el general (el resto de la sociedad, advertida por la existencia de la regla) :: plano particular, plano general, existencia de la regla
```

### 3. Discriminación MC — obligación de primer grado vs. segundo grado, aplicada a un caso
- **subtema:** Obligación de "primer grado" (originaria) vs. "segundo grado" (Barros), aplicada a un caso concreto
- **caso:** Un contratista, en ejecución de un contrato de ampliación de vivienda con su cliente Rodrigo, deja caer material de construcción desde un andamio y lesiona a un transeúnte que caminaba por la vereda, completamente ajeno al contrato de obra.
- **enunciado:** Según la contraposición que propone Barros entre obligaciones de primer y segundo grado, ¿qué caracteriza a la obligación de indemnizar que nace a favor del transeúnte?
- **opciones_texto:**
```
A) Es una obligación de segundo grado, porque presupone que el transeúnte había pactado previamente con el contratista una obligación de seguridad || Error: la obligación de segundo grado presupone una obligación primaria de origen convencional previa entre las partes; no existe ningún pacto entre el contratista y el transeúnte.
B) Es la misma obligación de segundo grado que existiría frente a Rodrigo, porque ambas derivan del mismo contrato de construcción || Error: la obligación frente a Rodrigo sí sería de segundo grado, por presuponer el contrato de obra, pero la obligación frente al transeúnte no deriva de ese contrato, del cual él es completamente ajeno.
C) No es propiamente una obligación civil, sino una carga procesal que solo nace si el transeúnte ejerce la acción civil derivada de un eventual proceso penal || Error: el artículo 2314 impone la obligación de indemnizar directamente, sin perjuicio de la pena que corresponda por el delito o cuasidelito; no depende de que exista o se ejerza una acción penal.
D) Es una obligación de primer grado u originaria, porque no existe vínculo obligatorio previo entre el contratista y el transeúnte: nace directamente del hecho de haber causado el daño infringiendo un deber general de cuidado || CORRECTO. En materia extracontractual no existe vínculo obligatorio previo alguno; el vínculo obligatorio tiene carácter originario y nace del hecho de haber ocasionado un daño infringiendo los deberes de cuidado generales y recíprocos que las personas deben observarse.
```
- **articulos_referencia:** 2314
- **objetivo_pedagogico:** Evaluar si el alumno aplica, a un caso concreto, la contraposición de Barros entre obligación de segundo grado (contractual, presupone un vínculo previo) y obligación de primer grado u originaria (extracontractual, nace del solo hecho dañoso), distinguiendo a quién se debe cada una según exista o no vínculo previo.

---

## Auto-auditoría (sección 6 del prompt maestro)

- [x] Cada artículo citado (2314) aparece literalmente en el pasaje del
      manual usado como respaldo (líneas 347-349 del manual).
- [x] Ninguna jurisprudencia inventada (este lote no cita ninguna).
- [x] Atribución a Barros verificada contra el texto ("El instrumento
      analítico... es la contraposición de ambos estatutos en términos de
      grados de obligación, que propone BARROS").
- [x] Cero guiones largos, cero guillemets, cero markup (`*`/`"`
      decorativo) en los campos de texto plano (`respuesta_modelo`,
      `objetivo_pedagogico`): a diferencia de Flashcards, estos campos no
      renderizan HTML/Markdown, así que cualquier asterisco se le
      mostraría literal a la alumna. Revisado y corregido en el ítem 1
      (alterum non laedere sin cursivas) y en el ítem 2 (sin comillas
      decorativas).
- [x] Ningún `elemento_clave.pregunta` ni `rationale` revela la respuesta
      directamente.
- [x] Distractores del ítem 3 pasan el test de obviedad de la sección
      0.2: cada uno corresponde a una confusión jurídica real (grado de
      obligación mal atribuido, mezcla de dos obligaciones distintas,
      confusión con la acción civil derivada de delito penal), no a un
      relleno evidente.
- [x] Ningún caso reutiliza literalmente un `.ejemplo` del manual (el eje
      1 no trae recuadros `.ejemplo`; los tres casos son inventados desde
      cero).
- [x] Verificado contra las 11 Flashcards, las 2 Alternativas y el ítem
      de Justificación existente del eje: hay solape parcial con
      `re-just-002b` en los ítems 1 y 2 (menciona de paso ambos puntos),
      y con la Flashcard de "primer grado/segundo grado" en el ítem 3.
      Los tres siguen siendo defendibles por la sección 0.3 (tipo
      distinto, ángulo aplicado a un caso vs. recuerdo/mención en
      abstracto), pero no es terreno completamente virgen: ver el
      hallazgo explícito en el encabezado, para que Laura lo revise
      sabiéndolo.
- [x] Auditoría de redundancia interna: los tres ítems son de tipos
      distintos (Aplicación, Detección de error, Discriminación MC) y
      evalúan tres elementos jurídicos distintos del eje (función de
      garantía de la libertad, función preventiva, grado de la
      obligación). Ningún par se solapa.

**Conteo:** 3 ítems generados, 0 descartados. El eje 1 queda en
Aplicación 1 (antes 0), Detección de error 1 (antes 0), Justificación 1
(sin cambio), Discriminación MC 1 (antes 0) = 4 ítems de Evaluación
(antes 1). Chequeo de sesgo de posición del ítem de Discriminación MC:
correcta en D, la letra menos representada hoy en el banco de
Extracontractual (A=22, B=22, C=20, D=20 antes de este lote).

**Cierre 2026-07-30:** Laura pidió subir el lote sin más ajustes. Los 3
ítems se cargaron a Airtable (base "Digesto Extracontractual",
`re-aplic-030`, `re-detect-031`, `re-mc-032`), linkeados a `Temas` → eje
1, y ya están sincronizados en `evaluacion_practica`
(`publicado = true`). Extracontractual pasó de 128 a 131 ítems de
Evaluación. **El contenido jurídico en sí sigue sin la revisión de fondo
de Laura** (citas, atribuciones, redacción): subir a Airtable no
reemplaza esa auditoría, solo la etapa previa quedó saltada a pedido de
Laura.

Del hallazgo de `ext-alt-002`/`ext-alt-033` (redundantes entre sí):
Laura pidió eliminar la redundante. Se decidió conservar `ext-alt-033`
(contrapone contrato vs. hecho ilícito, ángulo algo más distinto de la
Flashcard existente sobre el mismo art. 1437 que la pregunta directa de
`ext-alt-002`) y borrar `ext-alt-002`. El `DELETE` directo contra
Supabase fue bloqueado por el modo auto de Claude Code (acción
destructiva sobre una tabla en producción); Alternativas ya se maneja
por SQL directo en el SQL Editor, no por Airtable, así que el borrado
queda pendiente de que Laura corra el DELETE ella misma (ver
`docs/camino-a-beta.md` para el statement exacto).
