# Interrogador IA

> Detalle del Interrogador IA (v1 texto). El resumen de una línea vive en el
> Roadmap de `CLAUDE.md`; esto es lo específico de esta feature.

## Qué es y dónde vive
- `app/interrogador.html` (chat, mismo login/sidebar que `manuales.html`) +
  `api/interrogador.js` (función serverless, llama a la API de Claude con
  streaming, sin exponer la llave — mismo patrón que `api/waitlist.js`).
- **Alcance:** Responsabilidad Contractual, Extracontractual y
  Precontractual (lo publicado hoy — Precontractual sumada el 2026-07-20).
- **Desde el 2026-08-05, la alumna elige la materia al empezar** (ver
  "Selector de materia" más abajo): una sola (más barata, pensada para
  practicar seguido) o "todas" (modo transversal, pensado para 1-2 veces
  por semana, no para cada sesión).
- **Modelo: Claude Opus 4.8** (Laura eligió priorizar calidad/precisión
  legal por sobre el costo menor de Sonnet 5).

## Selector de materia (2026-08-05)
En la pantalla de inicio (`intro-card` de `app/interrogador.html`) la
alumna elige, con chips tipo pill (mismo patrón que el filtro de materia en
`app/alternativas.html`): **Contractual**, **Extracontractual**,
**Precontractual** o **Todas**. La materia se congela apenas arranca la
sesión (los chips se deshabilitan) -- no cambia a mitad de interrogación,
porque rompería el caché de prompt y desincronizaría el prompt ya generado
con el historial.

Motivación de Laura: practicar de a una materia sale más barato en todo el
recorrido de la sesión (índice del router más chico, muestra de preguntas
de Supabase filtrada, y sobre todo el respaldo del cierre acotado a una
sola materia en vez de las 3 -- ver "Grounding" abajo), y "todas" queda
como el modo ocasional para repasar transversalmente.

`materia` viaja en el body del POST a `/api/interrogador`
(`'contractual'|'extracontractual'|'precontractual'|'todas'`), junto a
`modo` y `messages`. Un cliente viejo que no la mande cae por defecto a
`'todas'` (compatibilidad hacia atrás, mismo comportamiento de antes del
2026-08-05).

## Selector de duración (2026-08-06)
Mismo patrón de chips, debajo del selector de modo: **5**, **15** o **30**
minutos (por defecto 30, el comportamiento de siempre). Se congela al
arrancar la sesión, igual que la materia.

No es solo un corte mecánico más temprano -- cambia cuánto apunta a cubrir
el examinador (`DURACION_CONFIG` en `api/_interrogador-prompt.js`):
cuántas preguntas de núcleo (2-3 / 5-7 / 6-10), y si el caso práctico va
completo, breve, o se salta si no alcanza el tiempo. También acorta el
umbral mecánico de cierre forzado (`UMBRAL_CIERRE_POR_DURACION` en
`api/interrogador.js`: 12 / 24 / 40 mensajes) para que una sesión de 5
minutos no siga corriendo hasta los 40 mensajes de una de 30.

`duracionMinutos` viaja en el body del POST junto a `materia` y `modo`. Un
cliente viejo que no lo mande cae a 30 (compatibilidad hacia atrás).

## Grounding (de qué se agarra la IA para no inventar)

### Fraccionamiento por turno (2026-08-05)
Hasta el 2026-08-04, el `system` de la llamada principal mandaba los 3
manuales COMPLETOS en cada turno (~279.000 tokens medidos, no los ~185.000
estimados antes de contar de verdad — ver "Costos"). Eso ya no pasa: ahora,
antes de la llamada principal, corre una llamada chica y barata a
`claude-haiku-4-5-20251001` (el "router", en `elegirContenidoDelTurno` de
`api/interrogador.js`) que decide qué SECCIONES puntuales de los manuales
cargar para el turno que sigue, en vez del manual entero. Motivación:
bajar costo ya (aunque los ~279K tokens no eran un problema de LÍMITE de
contexto, con Opus a 1M de ventana) y, sobre todo, dejar la arquitectura
lista para cuando se sumen más materias del roadmap (Civil completo,
Procesal, etc.), donde cargar todos los manuales enteros dejaría de ser
viable. Reemplaza la idea de "modo transversal" que estaba anotada acá
como pendiente (ver esa sección más abajo, ya cerrada).

Piezas nuevas, generadas por el mismo `scripts/extraer_contenido_interrogador.js`
que ya regenera `_interrogador-contenido.js` en cada deploy:
- `api/_interrogador-chunks.js`: los 3 manuales trozados en **269
  secciones** (por cada título/subtítulo real de los manuales en su HTML
  fuente -- no hay que curar nada a mano, se detecta solo).
- `api/_interrogador-indice.js`: índice liviano (solo materia + títulos +
  id de cada sección, sin el cuerpo) que recibe el router para decidir.

Curado a mano (no generado): `api/_interrogador-checklist-anclas.js`
(conecta el checklist de subtemas (a)-(k) del prompt con palabras clave por
materia) y `api/_interrogador-router-prompt.js` (las instrucciones del
router).

El router recibe el índice + el checklist de anclas + los últimos ~6
mensajes de la conversación real, y devuelve (vía `tool_use` forzado) entre
2 y 8 IDs de sección relevantes para el turno que sigue, más los ítems del
checklist en juego. Si la sesión es de una sola materia, el índice y las
anclas que recibe ya vienen recortados a esa materia (`INDICE_POR_MATERIA`
/ `ANCLAS_POR_MATERIA` en `api/interrogador.js`, precalculados al cargar el
módulo) -- más barato, y estructuralmente no puede elegir una sección de
otra materia por error. En paralelo corre una red de seguridad sin LLM
(`redDeSeguridadPorPalabraClave`, también restringida a esa materia): si la
alumna mencionó un artículo puntual o una palabra clave de algún título del
índice, esa sección se agrega igual, la haya elegido el router o no --
nunca resta, solo puede sumar.

**Respaldo de seguridad (prioridad #1: nunca corregir "a ciegas") -- ajustado
el 2026-08-05 (tarde) tras feedback de Laura: el manual completo NO se
elimina, pero se usa solo cuando de verdad hace falta, no como
comportamiento automático de cada cierre:**
- Si el router falla en un turno normal (red, timeout, JSON inválido): en
  sesión de una sola materia, se carga el manual completo de ESA materia
  (nunca las otras dos); en sesión "todas", se cae a los 3 completos --
  mismo comportamiento de siempre, aceptado porque un fallo de red es raro,
  no el costo rutinario que preocupaba.
- Si el router marca `no_estoy_seguro: true` en un turno normal: se carga
  el manual completo de una sola materia (la de la sesión si es de una
  sola; la `materia_respaldo` que indicó el router si es "todas") -- nunca
  los 3 juntos en este camino.
- **El cierre (evaluación final) es el turno más importante para la
  alumna** -- corrige y cita texto de toda la sesión, no de un subtema
  puntual. `respaldoDeCierre` en `api/interrogador.js` decide qué cargar,
  con dos ramas bien distintas:
  1. **Sesión de una sola materia:** directo el manual completo de ESA
     materia (nunca las otras dos) -- ya acota el costo a un tercio del
     peor caso de antes, sin necesitar ningún mecanismo nuevo.
  2. **Sesión "todas las materias":** primero se intenta una "llamada
     ampliada" al mismo router (índice completo, conversación COMPLETA en
     vez de los últimos 6 mensajes, tope de hasta 24 secciones en vez de
     8, `ROUTER_MAX_CHUNKS_AMPLIO`) -- y solo si esa llamada falla, o el
     router marca que ni con 24 secciones le alcanza para cubrir la
     sesión, se cae a los 3 manuales completos. Ahí sí está justificado:
     se tocaron las 3 materias a propósito (modo pensado para 1-2 veces
     por semana). Al armar la selección ampliada, el tope se reparte
     ~8/8/8 entre las 3 materias (`unirConTopePorMateria`) -- si se llenara
     en el orden de aparición del índice, los matches de la primera
     materia (contractual, que va primero en el archivo) podrían agotar el
     cupo antes de llegar a las otras dos.
  3. El respaldo mecánico por `UMBRAL_MENSAJES_CIERRE_FORZADO` (40
     mensajes, ver abajo) y el `es_cierre: true` marcado por el router
     normal van los dos a `respaldoDeCierre` -- mismas dos ramas de arriba.
- **Respaldo mecánico, sin depender del router:** a partir de
  `UMBRAL_MENSAJES_CIERRE_FORZADO` (40 mensajes) todos los turnos que
  siguen van directo a `respaldoDeCierre` sin llamar primero al router
  normal. El protocolo apunta a ~15-20 preguntas núcleo + caso antes de
  cerrar (típicamente ~30-38 mensajes), así que a los 40 ya casi seguro se
  está cerca del cierre.
- Probado el 2026-08-05 con 7 casos reales armados a mano (arranque de
  sesión, culpa contractual, doctrina precontractual, hecho ajeno con
  artículo puntual, caso práctico ambiguo con varios institutos a la vez,
  y dos variantes de cierre inminente): el router acertó las secciones
  relevantes en los 7 casos y ninguno gatilló `no_estoy_seguro` -- ni
  siquiera el caso ambiguo, donde en cambio devolvió una selección amplia y
  razonable cruzando las 3 materias. De los dos casos de cierre, detectó
  bien `es_cierre` cuando hubo un anuncio explícito de síntesis, pero no en
  el caso sin anuncio -- de ahí el respaldo mecánico por umbral, que no
  depende de que el router acierte. Repetido el mismo día (tarde) con la
  llamada ampliada real: restringida a Contractual, una pregunta de mora
  devolvió solo secciones de Contractual (nunca se sale de la materia); la
  llamada ampliada con una conversación larga que tocó las 3 materias
  devolvió 20 secciones bien repartidas entre las 3 (5 contractual, 8
  precontractual, 7 extracontractual), marcando `es_cierre: true` -- nunca
  hizo falta pisar los 3 manuales completos en ese caso.

El texto que ve la IA principal en el bloque de manual ya no dice "manual
íntegro": el prompt (`api/_interrogador-prompt.js`) fue ajustado para
avisarle que son EXTRACTOS elegidos automáticamente, y para reforzar (regla
9 y "TEXTOS DE REFERENCIA") que si necesita un pasaje que no está en el
extracto de ESE turno, no lo invente -- que lo diga, igual que ya hacía con
el Código Civil.

### Los 4 bloques del `system` de la llamada principal, en orden
1. **Reglas del examinador** — `api/_interrogador-prompt.js` (adaptado de
   `03_Interrogador_IA_Responsabilidad_PROMPT.md`). Desde el 2026-08-05 es
   una función (`construirPromptExaminador(materia)`, ver "Selector de
   materia" arriba): recorta ALCANCE, el checklist de DURACIÓN Y COBERTURA
   y el paso 3 del PROTOCOLO a la materia elegida (o se comporta igual que
   antes si es "todas"). Como este bloque ahora varía por materia, el
   prefijo cacheado (bloques 1-3) pasa a tener 4 variantes posibles en vez
   de una sola -- se sigue compartiendo entre todas las alumnas que elijan
   la misma materia dentro de la ventana de 1h, solo que ya no es una única
   caché compartida por todas.
2. **Artículos del Código Civil y del Código de Comercio relevantes a
   Responsabilidad** — `api/_interrogador-codigo.js` (Título Preliminar,
   obligaciones condicionales, cláusula penal, efecto de las obligaciones
   —incluida la interpretación de los contratos—, delitos y cuasidelitos,
   nulidad, prescripción, y desde el 2026-07-20 también arts. 97 a 106 del
   Código de Comercio sobre formación del consentimiento). Curado a mano el
   2026-07-13 (ampliado el 2026-07-20) desde chile.justia.com y, para los
   artículos nuevos, desde leyes-cl.com (BCN y Justia no fueron accesibles
   por fetch simple en esa fecha) — no hay script que lo regenere, es texto
   fijo. Si el alcance de materias crece, hay que sumar los títulos nuevos
   a mano ahí.
3. **Muestra de preguntas reales** — desde 2026-07-13 esto ya **no** es un
   archivo estático: `api/interrogador.js` consulta **Supabase en vivo**
   (tabla `preguntas_evaluacion`, ver `docs/contenido-airtable-supabase.md`)
   al armar cada respuesta. 40 preguntas por materia (Contractual +
   Extracontractual + Precontractual desde el 2026-07-20, aunque esta
   última todavía no tiene preguntas cargadas en Supabase — el bloque
   queda vacío hasta que Laura cargue contenido de Precontractual vía
   Airtable), con un orden aleatorio pero **fijo por sesión**
   (semilla derivada del `sessionId` que genera `interrogador.html` con
   `crypto.randomUUID()` al empezar). Esto da rotación real entre sesiones
   distintas sin romper el caché de prompt de Claude a mitad de una misma
   interrogación (el bloque de muestra es idéntico en todos los mensajes de
   una sesión, así que el caché de Anthropic sigue funcionando turno a
   turno).
4. **Extractos del manual para este turno** — el resultado de
   `elegirContenidoDelTurno` (ver arriba). Es el único bloque que cambia de
   turno a turno; por eso va SIN `cache_control` -- pero como ahora es
   chico (unos pocos miles de tokens, no ~279K), pagarlo fresco en cada
   turno sale igual o más barato que antes.

El bloque 3 (muestra) sigue siendo el único con `cache_control` -- cachea
todo el prefijo (reglas + código + muestra) de una vez. Ese prefijo ahora
pesa ~8-14K tokens en vez de ~279K, así que además de más barato, el
caché se escribe más rápido cuando expira (cada 1h de inactividad).

El router (`api/interrogador.js`) tiene su propio `system` separado
(prompt del router + checklist de anclas + índice), también con
`cache_control` en el último bloque (el índice, ~12.500 tokens) y el mismo
ttl de 1h -- se comparte entre todas las llamadas al router de cualquier
alumna dentro de esa ventana, igual que hoy pasa con el bloque principal.

## Convención de marcado (para el chat, no para markdown estándar)
`app/interrogador.html` traduce esta convención a HTML real en pantalla:
- `~~tachado~~` → lo que el alumno dijo MAL (rojo).
- `__subrayado__` → lo que dijo BIEN (verde; ojo: subrayado, no negrita —
  no es la convención estándar de markdown).
- `**negrita**` → lo que faltó decir o la precisión correcta (ámbar).
- `##encabezado##` (agregado 2026-07-13) → frase de anuncio al pasar a una
  pregunta o caso nuevo (destacada con borde y color, para ubicarla rápido
  al hacer scroll). Solo envuelve la frase de transición, no la pregunta
  completa.

Los tres primeros marcadores también se usan (agregado 2026-07-13) dentro
de la **tabla de evaluación final**: Claude la entrega en markdown real
(`| Criterio | Ponderación | Valoración |`), que la página convierte a una
tabla HTML de verdad, coloreando cada Valoración con esos mismos tres
colores en vez del texto plano feo de antes.

**Regla explícita en el prompt:** Claude tiene prohibido usar cualquier
etiqueta HTML (`<span>`, `<b>`, etc.) fuera de estos cuatro marcadores — la
página no las interpreta, aparecen como texto literal roto. Se agregó tras
un caso real donde el modelo inventó `<span class='art'>art. 1465</span>`
para destacar un artículo.

## Costos
- Costo real por interrogación completa con Opus 4.8: aprox. **$0.50–$2 USD
  aislada** (cifra de antes del fraccionamiento del 2026-08-05, todavía no
  vuelta a medir de punta a punta con el cambio nuevo -- debería bajar,
  ver abajo). Se comparte entre cualquier alumna que pregunte en la misma
  ventana de caché (1h).
- **Antes del fraccionamiento (hasta 2026-08-04):** el system prompt
  completo (reglas + los tres manuales + código + muestra) medía
  ~279.000 tokens SOLO en manuales (medido de verdad al generar el
  troceo el 2026-08-05 -- la cifra de ~185.000 que estaba anotada acá
  antes era una subestimación de cuando aún no se medía con precisión).
  Con la ventana de 1.000.000 de tokens de Opus 4.8 nunca fue un problema
  de LÍMITE, pero sí de costo de cache-write en cada ventana nueva.
- **Desde el fraccionamiento (2026-08-05):** el prefijo cacheado de la
  llamada principal (reglas + código + muestra) bajó a **~8-14K tokens**;
  el bloque de extractos por turno agrega otros ~2-16K tokens frescos
  (tope duro de 8 secciones). Se suma una llamada chica a Haiku 4.5 por
  turno (el "router"): ~5-14K tokens de entrada (mayormente cacheados,
  el índice pesa ~12.500 tokens) + ~150-300 de salida, un par de segundos
  de latencia. Aún no se volvió a medir el costo total de una
  interrogación completa de punta a punta con el cambio nuevo -- la
  próxima interrogación real de prueba debería incluir esa medición.

## Justiniano: persona unificadora (idea, 2026-08-05, no construida)
Laura quiere que "Justiniano" sea el presentador/tutor de Digesto detrás de
todos los puntos de contacto con IA de la plataforma, no un chatbot
suelto. Cuatro piezas, dos ya existentes y dos nuevas:
1. **Interrogación oral (voz)** — ya anotada como pendiente en el
   roadmap, sigue en pie.
2. **Chat IA actual** (`app/interrogador.html` + `api/interrogador.js`,
   v1 en producción) — el examinador que ya interroga y corrige.
3. **NUEVO: ayuda inline en Evaluación** — un botón "¿no entendiste?" al
   lado de donde la alumna responde una pregunta en
   `app/alternativas.html`, que explica esa pregunta o respuesta puntual
   cuando la corrección automática no le hizo sentido.
4. **NUEVO: chat de dudas generales sobre una materia** — a diferencia
   del Interrogador (que examina) y del punto 3 (que explica una
   pregunta puntual), este responde dudas abiertas de la alumna, pero
   **no debe limitarse a responder**: tiene que dirigirla a la sección
   exacta del manual donde ese tema está desarrollado (grounding
   parecido al del Interrogador — probablemente reusable el mecanismo de
   router + chunks de `_interrogador-chunks.js`/`_interrogador-indice.js`
   de la sección "Grounding" arriba, pero apuntando a un system prompt
   distinto, no de examen).

**Sin construir todavía.** Falta definir antes de empezar: si 3 y 4 usan
el mismo endpoint que `api/interrogador.js` con un modo distinto o uno
nuevo, cómo se referencia la sección del manual desde la respuesta (link
directo a `manuales.html` con anchor, o solo el nombre del título), y el
alcance de materias (¿las mismas 3 de Responsabilidad, o desde el
principio pensado para crecer con el roadmap?). Queda para una sesión
dedicada, no para tocar de paso.

## Idea de negocio anotada (no construida aún)
Planes con tope de interrogaciones/tokens por mes + compra de
"interrogaciones extra" sueltas, diseñado para que el plan Pro de Digesto
salga más barato que comprar sueltas — encaja como parte de la Capa 3 del
paywall (ver `docs/paywall.md`). Implica agregar conteo de uso por usuaria
en Supabase (tabla nueva, tipo `interrogaciones_uso`, todavía no existe).

## Modo transversal (todas las materias de Civil) -- resuelto por el fraccionamiento
Esta sección quedó anotada como pendiente hasta el 2026-08-04: la
preocupación era que cargar TODOS los manuales completos en cada sesión,
cuando existan manuales de más materias, dejaría de ser barato (8-10
materias completas ya son ~600-700K tokens solo en manuales). El
fraccionamiento por turno (ver "Grounding" arriba) resuelve esto de raíz:
como ya no se cargan manuales completos sino solo las secciones relevantes
al turno, el costo por turno no crece linealmente con la cantidad de
materias -- crece con la cantidad de SECCIONES nuevas que se sumen al
índice, que el router de todos modos filtra a 2-8 por turno. Cuando se
sumen manuales de otras materias (Bienes, Familia, Sucesorio, Procesal,
etc.), alcanza con: 1) correr el mismo script de extracción sobre esos
HTML, 2) sumar sus entradas al checklist de anclas si hace falta, sin
tener que rediseñar el mecanismo.

(La idea original de "mensaje de sistema a mitad de conversación", que
estaba anotada acá como camino posible, no se terminó necesitando: la API
de Claude no tiene un servidor con memoria de sesión -- cada request manda
el array `system` completo de nuevo, se pueda o no cachear. El
router+chunks aprovecha justo eso: arma un `system` distinto en cada
turno (bloques estables cacheados + el bloque de extractos, fresco),
sin depender de ninguna función especial de un modelo en particular, así
que funciona igual en modo examen (Opus 4.8) y en modo práctica
(Sonnet 5).)

## Requisitos de configuración (Vercel)
Variables de entorno necesarias en Production + Preview:
- `ANTHROPIC_API_KEY` — cuenta y facturación separada del Claude Pro
  personal de Laura, con tope de gasto mensual configurado.
- `SUPABASE_SECRET_KEY` — para la consulta en vivo a `preguntas_evaluacion`
  (agregada 2026-07-13).

## Estado actual
- **2026-08-06:** agregado el selector de duración (ver "Selector de
  duración" arriba). Además, Laura reportó probando en vivo que la IA se
  respondía sola su propia pregunta (no esperaba la respuesta de la
  alumna) en aproximadamente la mitad de los turnos -- reforzada la regla
  en `api/_interrogador-prompt.js` (nueva regla 0, "REGLA DE ORO", al
  inicio de REGLAS DE INTERROGACIÓN) con lenguaje más contundente y un
  ejemplo explícito de la falla. **No verificado todavía con una
  interrogación real** si esto bajó la tasa de fallo -- pendiente que
  Laura lo note al seguir probando; si sigue pasando seguido, el problema
  puede no ser solo de instrucción y conviene revisar si conviene acotar
  con `stop_sequences` o revisar si es un patrón específico del caso
  práctico (guiar la resolución tiende a que el modelo la resuelva él
  mismo).
- **2026-08-05 (tarde):** agregado el selector de materia (ver "Selector de
  materia" arriba) y revisado el respaldo del cierre tras feedback de
  Laura: el manual completo no se elimina (se necesita para el cierre de
  sesiones "todas" cuando de verdad hace falta), pero deja de ser
  automático -- ahora `respaldoDeCierre` intenta primero una selección
  amplia (llamada ampliada al router, hasta 24 secciones) antes de resignarse
  a los 3 completos, y las sesiones de una sola materia nunca tocan las
  otras dos en ningún camino de respaldo. Verificado: 20 combinaciones
  (5 caminos de respaldo × 4 materias) simuladas sin gastar plata real,
  más 2 llamadas reales baratas (una restringida a Contractual, otra
  ampliada con una conversación larga que tocó las 3 materias) -- ambas se
  comportaron como se esperaba. **Falta todavía:** la interrogación real
  completa (con Laura) en modo materia única y en modo transversal, y
  actualizar el HTML de `app/alternativas.html` si en algún momento se
  quiere compartir el array de materias en vez de duplicarlo.
- **2026-08-05:** implementado el fraccionamiento por turno (ver
  "Grounding" arriba): los 3 manuales completos dejaron de mandarse en
  cada llamada; ahora un router chico (Haiku 4.5) elige 2-8 secciones
  relevantes por turno, con respaldo automático a manual completo (por
  materia o los 3) si el router falla, no está seguro, o el turno es
  (o puede ser) el cierre. Verificado:
  - El troceo de los 3 manuales en 269 secciones corrió de punta a punta
    (269 secciones, sin IDs duplicados ni vacíos, spot-check contra el
    HTML fuente).
  - La lógica de selección/respaldo se probó con los 5 caminos (router ok,
    router falla, router inseguro, cierre marcado por el router, cierre
    forzado mecánicamente por largo de conversación) simulando las
    llamadas a Anthropic, sin gastar plata real.
  - El router se probó con 7 llamadas reales baratas: arranque de sesión,
    culpa contractual, doctrina precontractual, hecho ajeno con artículo
    puntual, caso práctico ambiguo, cierre inminente sin anuncio explícito
    y cierre con anuncio explícito de síntesis. Acertó las secciones
    relevantes en los 7 casos; detectó bien el cierre cuando hubo un
    anuncio explícito, pero NO lo detectó en el caso sin anuncio (turno 34
    de una sesión larga, caso recién resuelto) -- por eso existe la
    segunda capa mecánica (`UMBRAL_MENSAJES_CIERRE_FORZADO`), que no
    depende de que el router acierte.
  - La red de seguridad por palabra clave se revisó y corrigió tras
    detectar que palabras genéricas (que se repiten en decenas de
    títulos, ej. "responsabilidad", "contractual", o el cierre repetido
    "síntesis para estructurar la respuesta de examen") diluían la
    selección con secciones irrelevantes elegidas por orden de aparición
    más que por relevancia real -- ahora exige 2 palabras clave distintas
    y no genéricas, solo contra el título de sección (no el de capítulo),
    y separa en dos tiers (número de artículo, más preciso, primero;
    palabra clave después) para que un match genérico nunca le gane el
    lugar a uno preciso si hay que recortar por el tope. Ojo: el tier por
    número de artículo solo matchea cuando ese número aparece LITERAL en el
    título de la sección (ej. "hecho ajeno (art. 2320)") -- eso es la
    minoría de los 269 títulos, así que no es una red que cubra cualquier
    artículo que la alumna cite; la selección real recae sobre todo en el
    router (que en los 7 casos probados sí acertó incluso citas sin ese
    respaldo, ej. "art. 1551" de la mora). **Falta
    todavía:** correr una interrogación real completa de punta a punta
    (gasto real, con Laura) para confirmar que la calidad de la corrección
    no bajó al recibir extractos en vez del manual entero, y medir el
    costo real de una sesión completa con el cambio nuevo.
- **2026-07-20:** ampliado el alcance a Responsabilidad Precontractual —
  nuevo manual `03_Responsabilidad_Precontractual_Manual.html` sumado a
  `scripts/extraer_contenido_interrogador.js`, artículos 97-106 del Código
  de Comercio y 1465/1478/1560/1563/1566/1687 del Código Civil agregados a
  `api/_interrogador-codigo.js`, y `api/_interrogador-prompt.js` actualizado
  (rol, alcance de la materia, checklist de cobertura, protocolo de
  interrogación). `MATERIAS_MUESTRA` en `api/interrogador.js` ya incluye
  "Responsabilidad precontractual", pero esa materia aún no tiene preguntas
  cargadas en `preguntas_evaluacion` — el bloque de muestra queda vacío
  hasta que Laura cargue contenido ahí. Falta aún: probar una interrogación
  real que toque Precontractual antes de darla por completamente validada
  (ver "Observación abierta" del 2026-07-13 más abajo, que sigue pendiente
  y es independiente de este cambio).
- **2026-07-15:** cerrado el riesgo de que el Interrogador corrigiera sobre
  manuales desactualizados. Antes había que acordarse de correr el script de
  extracción a mano tras editar los HTML fuente; ahora `vercel.json` lo corre
  como `buildCommand` en cada deploy, así que el contenido que usa el
  Interrogador en producción siempre coincide con los manuales del último
  push. Motivado porque los manuales se estaban editando activamente en
  paralelo a la entrada de usuarias beta.
- **2026-07-11:** v1 probada por Laura (15 preguntas + caso de 3). Fix de
  preguntas compuestas que se respondían solas + formato de corrección.
- **2026-07-13 (tarde):** migración completa del muestreo de preguntas de
  archivo estático (Airtable vía script) a consulta en vivo a Supabase, más
  el bloque de Código Civil y el fix de etiquetas HTML.
- **2026-07-13 (noche):** Laura corrió una interrogación real completa con
  todo el grounding nuevo — en general mejor. Feedback de esa prueba:
  - Tabla de evaluación final se veía como markdown crudo (`|---|---|`) →
    arreglado: ahora es una tabla HTML real con colores (ver "Convención de
    marcado" arriba).
  - Costaba ubicar dónde empezaba cada pregunta/caso al hacer scroll →
    arreglado con el marcador `##encabezado##`.
  - Colores de las burbujas cambiados: comisión en rojizo, alumna en blanco
    sobre negro (antes: comisión en negro, alumna en crema).
  - **Observación abierta, sin arreglo todavía:** a Laura le pareció que la
    IA podría estar siendo un poco dura/inconsistente con las notas — dijo
    que necesita usarlo de nuevo para confirmar si es un patrón real antes
    de tocar la rúbrica o las anclas de calibración del prompt. **No tocar
    la calibración de notas hasta que Laura lo confirme con otra prueba.**
