# Núcleo: reglas comunes para generar contenido de Práctica (Digesto)

> Reglas que aplican a **todos** los tipos de ítem del módulo de Práctica
> (Aplicación, Detección de error, Justificación, Discriminación MC,
> Alternativas, Memorice, Flashcards), sin importar la materia. Cada tipo
> tiene su propio prompt corto en esta misma carpeta
> (`docs/prompts-practica/{tipo}.md`) que asume estas reglas y agrega solo
> lo específico de ese tipo: qué extraer del manual, el esquema exacto de
> entrega, su volumen esperado y su parte de la auto-auditoría.
>
> **Piloto en validación (2026-09-16):** este documento y
> `alternativas.md` son la primera pasada de una reestructuración del
> antiguo `docs/prompt-generacion-contenido-practica.md` (un solo prompt
> larguísimo, atado a las tres materias de Responsabilidad). Ese doc
> anterior sigue vigente y en uso por los skills `generar-evaluacion` y
> `generar-practica` hasta que Laura valide esta estructura nueva y se
> migren los 6 tipos restantes. No lo borres ni lo des por reemplazado
> todavía.

## Cómo se usa

1. Copia el prompt del tipo que vas a generar (`docs/prompts-practica/{tipo}.md`),
   que ya incluye "aplican además las reglas de este núcleo" al principio.
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

## Filosofía: aplicación y relación entre instituciones por sobre memoria

Digesto separa deliberadamente memorización de razonamiento: **memorizar
texto legal y definiciones puntuales ya lo cubren Flashcards y Memorice**.
El resto de los tipos (Aplicación, Detección de error, Justificación,
Discriminación MC y Alternativas) no deben limitarse a que la alumna
recuerde una definición: tienen que exigir que **aplique** una regla a
una situación, **distinga** entre dos instituciones parecidas, o
**relacione** una institución con otra.

Antes de dar por bueno un ítem de cualquiera de esos cinco tipos,
pregúntate: ¿esto se responde solo con memoria (recitar una definición o
un artículo), o exige razonar? Si la respuesta es "solo con memoria",
reformúlalo para que dependa de aplicar la regla a un hecho concreto, de
distinguirla de otra parecida, o de conectarla con una institución
distinta, en vez de descartarlo directo (a menos que el punto de derecho
en sí sea puramente memorístico, ej. un plazo, en cuyo caso probablemente
rinde mejor como Memorice o Flashcard que como Alternativa o
Justificación).

## 0. Regla de oro: prohibido alucinar, y cómo se aplica en la práctica

No trabajas de memoria. Trabajas **solo** con el texto del manual de
{MATERIA} que tienes abierto (y, para Memorice específicamente, además
con el texto oficial y vigente del código citado, ver `memorice.md`).

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
   fuente de inspiración para parafrasear.
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
- [ ] Ningún ítem prioriza memoria pura por sobre aplicación/relación
      cuando el punto de derecho lo permite (ver "Filosofía" arriba).
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
