# Núcleo: reglas comunes para generar contenido de Práctica (Digesto)

> Reglas que aplican a **todos** los tipos de ítem del módulo de Práctica
> (Aplicación, Detección de error, Justificación, Discriminación MC,
> Alternativas, Memorice, Flashcards), sin importar la materia. Cada tipo
> tiene su propio prompt corto en esta misma carpeta
> (`docs/prompts-practica/{tipo}.md`) que asume estas reglas y agrega solo
> lo específico de ese tipo: qué extraer del manual, el esquema exacto de
> entrega, su volumen esperado y su parte de la auto-auditoría.
>
> **Estado (2026-10-10):** este núcleo y los prompts por tipo
> (`aplicacion.md`, `deteccion-error.md`, `justificacion.md`,
> `discriminacion-mc.md`, `alternativas.md`, `memorice.md`,
> `flashcards.md`), más `elementos-clave.md` y `transversales.md`, son
> **el único prompt vigente** de creación de preguntas. El antiguo
> `docs/prompt-generacion-contenido-practica.md` (un solo prompt atado a
> Responsabilidad) se revisó punto por punto, se rescató lo que faltaba y
> se archivó en `archivo/` el 2026-10-10. Los skills `generar-evaluacion`
> y `generar-practica` apuntan aquí.

## Cómo se usa

1. Copia el prompt del tipo que vas a generar (`docs/prompts-practica/{tipo}.md`),
   que ya incluye "aplican además las reglas de este núcleo" al principio.
   Algunos tipos comparten además un documento intermedio (ni universal a
   los 7, ni exclusivo de uno) porque varios tipos necesitan exactamente
   la misma convención: hoy existe `docs/prompts-practica/elementos-clave.md`,
   para Aplicación, Detección de error y Justificación (los tres tipos
   con respuesta libre calificada por `elementos_clave`/`keywords`).
2. Reemplaza `{MATERIA}` por la materia a trabajar y `{MANUAL}` por el
   archivo HTML del manual correspondiente (ej. `05_Bienes_Manual.html`,
   `02_Responsabilidad_Contractual_Manual.html`). Este núcleo y los
   prompts por tipo están escritos para cualquier materia de la
   plataforma, no solo Responsabilidad.
3. Sigue el proceso de esta sección núcleo (anti-alucinación, control de
   redundancia, trabajo por tandas) combinado con las instrucciones
   específicas del tipo.
4. Revisa el reporte de auto-auditoría antes de pegar cualquier contenido
   en Airtable, Supabase o el código, igual que con el prompt anterior.

## Regla obligatoria: preguntas pensadas para la corrección flexible

**Decisión de Laura (2026-10-09), aplica a todas las materias.** En
Aplicación, Detección de error y Justificación, la app corrige la
respuesta libre de la alumna con **corrección flexible**: una keyword
cuenta si sus palabras con significado aparecen cerca unas de otras, en
cualquier orden y comparadas por raíz, no solo si está la frase exacta.
Con 2 de 3 elementos la alumna recibe una **repregunta** (la `pregunta`
socrática del elemento que falta) antes del veredicto, y en el veredicto
final puede marcar "Lo dije con otras palabras".

Por eso cada ítem se redacta así, sin excepción:
- **Keywords de 2 a 4 palabras con significado** que prueban el elemento,
  no frases del manual que haya que reproducir; con variantes como las
  diría una alumna y sinónimos de raíz distinta.
- **Nada de keywords de una palabra común**, ni keywords que ya estén en
  el caso, el enunciado o la repregunta; la negación va dentro de la
  keyword cuando la conclusión es negativa.
- **Cada elemento con una `pregunta` que sirva de repregunta**: lleva
  hacia lo que falta sin regalarlo.
- **Prueba antes de entregar:** una respuesta correcta escrita con
  palabras propias debe obtener cada elemento, y una equivocada que use
  el vocabulario del tema, no.

El detalle, con ejemplos y la checklist, está en
`docs/prompts-practica/elementos-clave.md`. Un ítem que solo aprueba
quien repite el manual de memoria está mal hecho aunque su contenido
jurídico sea correcto.

## Antes de generar: qué tipo de ítem es cada cosa

- **Ítems CON caso** (llevan un relato narrativo ficticio, campo `caso`):
  Aplicación, Detección de error y Discriminación MC. La alumna lee una
  situación concreta y razona sobre ella.
- **Ítems SIN caso / de regla directa** (preguntan sobre una regla,
  distinción o fundamento, sin narrativa): Justificación, y todo el
  modelo Alternativas (MC puro).

No mezcles estas categorías por comodidad: si estás generando un ítem de
Alternativas o Justificación, no le agregues un caso "para que se
entienda mejor"; si de verdad necesita un caso para tener sentido, es
Aplicación, Detección de error o Discriminación MC, no Alternativas ni
Justificación.

## Cantidad de preguntas (regla para todas las materias, Laura 2026-10-10)

En Evaluación (Aplicación, Detección de error, Justificación y
Discriminación MC) se trabaja **por tema y subtema, un tipo a la vez**, y
la cantidad depende de cuánto se pregunta cada subtema en exámenes de
grado reales:

- **4 preguntas por tipo** en los subtemas importantes (los que aparecen
  en **10 o más exámenes** del conteo de la materia);
- **2 preguntas por tipo** en el resto.

La idea es que alcance para quien estudia **solo esa materia**. Para
aplicarla a una materia nueva, primero se cuentan sus temas y subtemas en
los exámenes reales, como se hizo con Acto Jurídico (sección "Relevancia
de los temas" de `docs/preguntas-acto-juridico.md` y
`scripts/aj_temas_subtemas.json`).

El número es un techo, no una cuota: si un subtema no da para 4 (o 2)
preguntas que evalúen elementos distintos sin repetirse (ver "Control de
redundancia"), se hacen las que den y se dice en el informe, en vez de
completar el número. Si un subtema no da para el tipo (ej. pura
terminología en Aplicación), también se dice. Y nunca un volumen grande
de una sola pasada: tandas de un tipo de un tema.

Los volúmenes "por eje" que traen los prompts por tipo quedan solo para
Alternativas, Flashcards y Memorice, y para materias que todavía no
tengan su conteo de exámenes.

## Preguntas que relacionan materias

Se hacen aparte, con `docs/prompts-practica/transversales.md`, cuando
las materias involucradas ya tienen su primera pasada.

## Filosofía: aplicación y relación entre instituciones por sobre memoria

Digesto separa deliberadamente memorización de razonamiento: **memorizar
texto legal y definiciones puntuales ya lo cubren Flashcards y Memorice**.
Lo que se prohíbe en los otros 5 tipos es la **memoria aislada**: una
pregunta que se responde recitando la definición de un solo concepto,
sin compararlo con otro, sin distinguirlo, sin fundamentar nada (ej.
"¿qué es la tradición?"). Eso **no** es lo mismo que exigir siempre un
caso concreto: **comparar dos instituciones parecidas o explicar el
fundamento de una regla ya es razonar, aunque no haya hechos de por
medio.**

Ejemplo real (feedback de Laura, 2026-09-16): "explique la diferencia
entre la tradición de muebles por brevi manu y por constituto posesorio"
no es una pregunta de aplicación (no hay hechos que resolver), pero
tampoco es memoria aislada (no pide recitar una sola definición): exige
distinguir dos instituciones parecidas, que es exactamente el tipo de
razonamiento que Digesto quiere premiar. Es un ítem legítimo de
Justificación o Alternativas tal cual, sin que haga falta forzarle un
caso que no le corresponde por tipo.

**La barra es distinta según el tipo, no uniforme:**
- **Aplicación** es estricto: por definición siempre lleva un caso, y el
  ítem debe depender de resolver esos hechos, no de explicar la
  distinción en abstracto. Si un ítem de Aplicación se puede responder
  igual de bien sin haber leído el caso, no es un buen ítem de
  Aplicación: falta que dependa de los hechos concretos.
- **Detección de error, Justificación, Discriminación MC y Alternativas**
  cumplen la barra con cualquiera de estas, sin que haga falta forzar
  hechos donde el tipo no los lleva (ver taxonomía arriba): comparar o
  distinguir dos instituciones parecidas, explicar el fundamento o la
  razón de ser de una regla, o aplicar la regla dentro del caso cuando el
  tipo sí lo trae.

Antes de dar por bueno un ítem, pregúntate: ¿esto se responde solo
recitando la definición aislada de un concepto? Si sí, reformúlalo para
que compare, distinga, fundamente o aplique (según lo que el tipo
permita), en vez de descartarlo directo, a menos que el punto de derecho
en sí sea puramente memorístico (ej. un plazo puntual), caso en el que
probablemente rinde mejor como Memorice o Flashcard.

## 0. Regla de oro: prohibido alucinar, y cómo se aplica en la práctica

No trabajas de memoria. Trabajas **solo** con el texto del manual de
{MATERIA} que tienes abierto (y, para Memorice de artículos, con el texto
legal que manda Laura, ver `memorice.md`).

Para **cada ítem** que generes, sigue este proceso de tres pasos, en este
orden, y no te saltes ninguno:

1. **Cita de respaldo.** Antes de redactar el ítem, copia textualmente la
   o las oraciones del manual que lo sustentan (puedes omitir esta cita
   del entregable final, pero debes haberla hecho). Si no encuentras una
   oración concreta que respalde lo que quieres afirmar, **no escribas
   ese ítem**: no lo aproximes, no lo completes con lo que "probablemente
   dice la ley". Descártalo y sigue con el próximo candidato.
2. **Redacción del ítem** a partir exclusivamente de esa cita, siguiendo
   el esquema exacto del prompt del tipo correspondiente.
3. **Auto-auditoría** del ítem contra la checklist de la sección "Auto-auditoría
   final" de este núcleo más la checklist específica del tipo, antes de
   darlo por terminado.

Puntos calientes donde este proceso es más importante:

- **Jurisprudencia.** Nunca inventes un rol, tribunal o fecha de un
  fallo. Usa únicamente los fallos que el manual ya nombra explícitamente.
  Si quieres un ítem sobre un punto que el manual solo argumenta en
  doctrina, sin fallo citado, no le agregues un fallo para hacerlo "más
  completo": redáctalo sin jurisprudencia.
- **Atribución doctrinal.** "FULANO sostiene que..." solo es válido si
  el manual efectivamente atribuye esa idea a ese autor, en esas palabras
  o su equivalente cercano. Si la idea aparece sin autor explícito en el
  manual, no le pongas un nombre para que suene más autorizado.
- **Números de artículo.** Todo `articulo_referencia` debe ser copiable,
  literalmente, del pasaje del manual que citaste como respaldo en el
  paso 1. No completes con artículos "relacionados" que no estén en ese
  pasaje, aunque los conozcas de otro contexto.

Si en cualquier paso dudas entre inventar un dato plausible o dejar el
ítem incompleto: **siempre elige dejarlo incompleto o descartarlo.** Un
ítem de menos es preferible a un ítem con un dato falso que una alumna
memorice como si fuera derecho vigente.

## 0.3 Control de redundancia (obligatorio)

**Regla de redundancia.** Dos preguntas son redundantes si evalúan **el
mismo elemento jurídico específico** (el mismo requisito, la misma
distinción doctrinal, el mismo efecto), aunque cambien el enunciado o el
punto de vista. **No** son redundantes si testean: (a) un elemento
distinto de la misma institución; (b) la misma institución pero desde
una controversia doctrinal distinta; (c) la conexión de esa institución
con otra que el eje también activa; (d) la aplicación al caso concreto
vs. la regla general en abstracto.

**La regla se aplica dentro de cada tipo de pregunta, no entre tipos.**
Dos preguntas del mismo tipo (dos Alternativas, dos Justificación, etc.)
que evalúan el mismo elemento jurídico específico son redundantes,
elimina una. El mismo elemento jurídico repetido **en tipos distintos**
(ej. una Flashcard y una Alternativa que parten del mismo punto) no es
redundante por defecto: cada tipo mide una habilidad distinta. Solo
cuenta como redundante entre tipos distintos si además comparten
prácticamente el mismo enunciado o el mismo ángulo de evaluación.

**Proceso, en este orden exacto, antes de redactar el set final:**

1. **Mapeo de instituciones/puntos de derecho activados** por el eje o
   tramo del manual que estás trabajando, no las que "podrían" tocarse en
   abstracto. Para cada una, indica brevemente por qué el eje la activa.
2. **Tabla de cobertura** (obligatoria, previa a las preguntas finales):

   | # | Institución/subtema | Elemento jurídico específico evaluado | Ángulo (regla general / excepción / distinción doctrinal / aplicación al caso / conexión interdisciplinar) |
   |---|---|---|---|

   Es tu herramienta de auditoría, no el output final, pero se genera
   siempre como paso intermedio.
3. **Cuota por subtema.** Para cada institución, evalúa cuántos elementos
   jurídicos genuinamente distintos admite. No generes más ítems de este
   tipo que elementos distintos identificados. **Si al llegar a este paso
   no encuentras material suficiente en el manual para un ítem más sin
   ser redundante: no lo generes, y avísale a Laura explícitamente que
   ese eje/institución llegó a su techo con el material disponible** (no
   lo completes igual "para cumplir el número").
4. **Redacción final**, siguiendo el esquema del prompt del tipo.
5. **Auditoría de redundancia** (con la lista completa a la vista,
   después de redactar, no durante): revisa cada par de ítems que
   pertenezca a la misma institución. Si dos testean lo mismo con
   distinto enunciado, elimina una y reemplázala por una que cubra una
   arista distinta, nunca por otra variación de la misma.

**Entrega siempre, en este orden:** (1) instituciones/puntos activados y
por qué, (2) tabla de cobertura, (3) ítems finales en el formato del
tipo, (4) nota breve de auditoría de redundancia.

## 1. Proceso de trabajo por tandas

**Por tandas, nunca el manual completo de una sola pasada.** Trabaja en
lotes de 1-2 ejes. Termina de generar, auditar y entregar un lote
completo antes de abrir el siguiente tramo del manual.

1. **Antes de abrir el manual, revisa qué ya existe para ese tramo** en
   el destino de este tipo (ver "Dónde vive" en el prompt del tipo) y,
   cuando aplique, en la tabla de cobertura liviana compartida entre
   tipos (ver más abajo). Es una lista negra para no repetir, no una
   fuente de inspiración para parafrasear. Cuenta contra los datos
   reales (Airtable y Supabase vía API), no contra un documento. Ojo:
   `Preguntas_Evaluacion` (banco del Interrogador) es otro banco, no un
   espejo de las tablas de Evaluación de Práctica; ver el skill
   `generar-evaluacion`, sección 0.
2. Abre solo el tramo del manual que corresponde a este lote.
3. Recorre ese tramo **eje por eje**, en orden, sin saltarte ninguno.
4. Genera los ítems siguiendo el proceso de tres pasos de la sección 0,
   citando solo con lo que está a la vista en este tramo.
5. Al terminar el lote, entrega el reporte de auto-auditoría antes que
   el contenido mismo.
6. Recién ahí abre el siguiente tramo. No acumules varios tramos en
   memoria "para ir más rápido".

**Nota sobre redundancia entre tipos distintos.** Como cada prompt de
tipo se corre por separado, no tienes en tu contexto el contenido ya
generado de los otros tipos para esta materia. Para no reconstruir el
banco completo de los otros 6 tipos cada vez, usa la tabla de cobertura
liviana por materia y subtema (`docs/prompts-practica/cobertura-{materia}.md`,
si existe: solo id, tipo y elemento jurídico evaluado, no el ítem
completo) como referencia rápida antes de redactar. Si esa tabla no
existe todavía para la materia que estás trabajando, avísale a Laura en
vez de asumir que no hay nada cargado.

## 2. Reglas de estilo (no negociables)

- Todo en español.
- Cero guiones largos (—) en ningún campo. Cero guillemets («»); si
  necesitas destacar una cita textual, usa cursiva donde el destino
  soporte HTML, o simplemente sin marca en campos de texto plano.
- Nombres de autores citados: negrita + mayúscula completa si el destino
  soporta HTML; en campos de texto plano basta el nombre en mayúscula
  sin marcado.
- Casos inventados (cuando el tipo los usa): nombres ficticios, situación
  realista y concreta, inspirados en los recuadros `.ejemplo` del manual
  pero con hechos distintos, nunca copiados literalmente.

## Auto-auditoría final (parte común a todos los tipos)

Antes de entregar cualquier lote, verifica, además de la checklist
específica del tipo:

- [ ] Cada número de artículo citado aparece literalmente en el pasaje
      del manual usado como respaldo.
- [ ] Ninguna cita de jurisprudencia (rol, tribunal, fecha) fue inventada;
      todas aparecen, tal cual, en el manual.
- [ ] Cada atribución a un autor coincide con lo que el manual
      efectivamente le atribuye.
- [ ] Cero guiones largos, cero guillemets, en cualquier campo.
- [ ] Ningún ítem se responde solo recitando la definición aislada de un
      concepto, sin comparar, distinguir ni fundamentar nada (ver
      "Filosofía" arriba). En Aplicación, además: el ítem depende de
      verdad de los hechos del caso, no sería igual de válido sin ellos.
- [ ] Ningún caso o dato reutiliza literalmente un recuadro `.ejemplo`
      del manual palabra por palabra.
- [ ] Ningún ítem nuevo repite, con otro caso o redacción, un punto de
      derecho ya cubierto en el banco existente de este tipo para ese eje,
      ni reformula un ítem ya existente de otro tipo sin agregar un
      ángulo distinto.

Si un ítem falla cualquier casillero, corrígelo o descártalo: nunca lo
entregues marcado como "aproximado" o "revisar después". Entrega el
resultado de esta checklist (cuántos ítems generados, cuántos
descartados y por qué, y qué ejes quedaron sin contenido) **antes** del
contenido mismo.
