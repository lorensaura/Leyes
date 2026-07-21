# Interrogador IA

> Detalle del Interrogador IA (v1 texto). El resumen de una línea vive en el
> Roadmap de `CLAUDE.md`; esto es lo específico de esta feature.

## Qué es y dónde vive
- `app/interrogador.html` (chat, mismo login/sidebar que `manuales.html`) +
  `api/interrogador.js` (función serverless, llama a la API de Claude con
  streaming, sin exponer la llave — mismo patrón que `api/waitlist.js`).
- **Alcance:** Responsabilidad Contractual, Extracontractual y
  Precontractual (lo publicado hoy — Precontractual sumada el 2026-07-20),
  sin el "modo repaso transversal" del prompt original (regla 10) — cubrir
  todas las materias de Civil en una sola interrogación queda pendiente
  (ver "Modo transversal" más abajo).
- **Modelo: Claude Opus 4.8** (Laura eligió priorizar calidad/precisión
  legal por sobre el costo menor de Sonnet 5).

## Grounding (de qué se agarra la IA para no inventar)
El `system` que se manda a Claude en `api/interrogador.js` tiene 4 bloques,
en este orden:
1. **Reglas del examinador** — `api/_interrogador-prompt.js` (adaptado de
   `03_Interrogador_IA_Responsabilidad_PROMPT.md`).
2. **Los dos manuales completos** — `api/_interrogador-contenido.js`,
   generado por `scripts/extraer_contenido_interrogador.js` a partir de los
   HTML fuente (`01_..._Manual.html`, `02_..._Manual.html`). **Se regenera
   solo en cada deploy de Vercel** (`buildCommand` en `vercel.json` corre el
   script antes de publicar) — no depende de que alguien se acuerde de
   correrlo a mano; es imposible desplegar con el contenido desfasado
   respecto de los manuales fuente. Verificado el 2026-07-15 comparando
   byte a byte contra la versión anterior (generada con el script viejo en
   Python, ya retirado) usando el motor V8 de Chrome — mismo hash SHA-256.
   Para regenerar en desarrollo sin esperar un deploy: `node
   scripts/extraer_contenido_interrogador.js`.
3. **Artículos del Código Civil y del Código de Comercio relevantes a
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
4. **Muestra de preguntas reales** — desde 2026-07-13 esto ya **no** es un
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

El único bloque con `cache_control` es el último (la muestra) — cachea todo
el prefijo (reglas + manuales + código + muestra) de una vez.

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
  aislada**, pero mucho menos por alumna en la práctica porque el bloque
  grande de contexto se cachea (~5 min) y se comparte entre cualquier
  alumna que pregunte en esa ventana.
- **Ventana de contexto de Opus 4.8 es de 1.000.000 de tokens** — el system
  prompt completo (reglas + los tres manuales + código + muestra de
  preguntas) usa hoy ~185.000 tokens (~18%) tras sumar Precontractual el
  2026-07-20 (antes: ~165.000, ~16%, con solo dos manuales). Hay margen de
  sobra (miles de preguntas más) antes de que el contexto sea el problema;
  el costo de cache-write es la variable real a vigilar si la muestra
  crece mucho.

## Idea de negocio anotada (no construida aún)
Planes con tope de interrogaciones/tokens por mes + compra de
"interrogaciones extra" sueltas, diseñado para que el plan Pro de Digesto
salga más barato que comprar sueltas — encaja como parte de la Capa 3 del
paywall (ver `docs/paywall.md`). Implica agregar conteo de uso por usuaria
en Supabase (tabla nueva, tipo `interrogaciones_uso`, todavía no existe).

## Modo transversal (todas las materias de Civil, PENDIENTE)
Cuando existan manuales de más materias, cargar TODOS los manuales
completos en cada sesión dejaría de ser barato (cada manual ronda los
~67.000 tokens; 8-10 materias ya son ~600-700K tokens solo en manuales).
Dos caminos, del más simple al más elaborado:
1. La alumna elige el alcance de la sesión (2-4 materias), no "todo Civil"
   por defecto — mismo patrón de hoy, parametrizado.
2. Grounding en dos niveles: un resumen acotado por materia siempre
   presente (~5-10K tokens c/u) + el manual completo de la materia que se
   está preguntando en ESE momento, inyectado recién ahí vía el mensaje de
   sistema "a mitad de conversación" que soporta Opus 4.8 (no rompe el
   caché de lo ya cargado).

## Requisitos de configuración (Vercel)
Variables de entorno necesarias en Production + Preview:
- `ANTHROPIC_API_KEY` — cuenta y facturación separada del Claude Pro
  personal de Laura, con tope de gasto mensual configurado.
- `SUPABASE_SECRET_KEY` — para la consulta en vivo a `preguntas_evaluacion`
  (agregada 2026-07-13).

## Estado actual
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
