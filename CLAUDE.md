# Derecho Libre / Digesto — Contexto del proyecto

> Este archivo lo lee Claude Code automáticamente al abrir el proyecto.
> Mantiene el contexto entre sesiones. Actualízalo cuando tomes decisiones nuevas.

## Qué es
- **Derecho Libre** = la plataforma. **Digesto** = los manuales de estudio.
- Plataforma de estudio para el **examen de grado** (Chile). Autora: **Laura Schultz Solano**.
- Público: estudiantes de derecho chilenos. **Todo en español** (código, contenido y respuestas a la usuaria).
- La usuaria (Laura) es **no técnica** (estudiante de derecho): explicar sin jerga, acompañar paso a paso.
- En vivo: **digesto.cl** (deploy en Vercel). Autenticación con **Supabase**.
- Los manuales fusionan **código + doctrina + jurisprudencia**.

## Arquitectura
- HTML/CSS/JS plano, sin framework. Deploy estático en Vercel (`vercel.json` en la raíz).
- Flujo de la app:
  `index.html` → `app/auth.html` (login Supabase) → `app/dashboard.html` →
  `app/manuales.html` (lector de manuales con "Controles de lectura") y
  `app/alternativas.html` (Evaluación / banco de preguntas).
- PDFs pre-generados en `app/pdf/` para descarga de un clic.

## Archivos clave
- `app/manuales.html` — lector en línea. Los checkpoints se insertan partiendo el contenido por el marcador `<!-- CP -->` (ver `buildOnlineContent` / `buildCheckpointCard` / `evaluarCheckpoint`).
- `app/alternativas.html` — banco de preguntas (`const banco = [...]`). Tipos: aplicación, detección de error, justificación, discriminación (alternativas MC).
- `01_Responsabilidad_Contractual_Manual.html` y `02_Responsabilidad_Extracontractual_Manual.html` — fuentes de los manuales y de los PDF.
- `app/pdf/*.pdf` — PDFs generados.

## Generación de PDF
- Se generan con **Chrome headless vía CDP** (Python + `websocket-client`), no con el "imprimir" del navegador.
- **Regla de oro:** usar **márgenes reales de `printToPDF`** (marginTop/Bottom/Left/Right), NO `padding` del `<body>`. El padding solo deja margen en la 1ª/última página y genera una "franja negra" (contenido pegado al borde) en las páginas del medio.
- Encabezado/pie con `displayHeaderFooter`: "DIGESTO" (rojo) + título del manual + "Laura Schultz Solano · Examen de grado" + "Página X de Y". El padding lateral del header debe igualar `marginLeft/Right` (0.95in) para que calce con el texto.
- Portada centrada con `min-height` calculado según el área útil (Letter 11in − márgenes).

## Decisiones tomadas
- Un manual = un PDF con portada centrada, índice que fluye, y encabezado/pie parejos en todas las páginas.
- **Evaluación acotada por ahora a contractual y extracontractual** (Procesal y otros temas ocultos hasta que existan sus manuales). Ver `TEMAS_EN_ALCANCE` en `startSession()`.
- Las preguntas de discriminación (MC) no tienen rúbrica de palabras clave: la recuperación libre es práctica y la corrección real es la selección de la alternativa (se puntúa en `evaluarMC`).
- **Hosting:** seguir en **Vercel** por ahora (funciona, es gratis en la escala actual). **A futuro, evaluar migrar a Cloudflare Pages si Vercel empieza a cobrar por tráfico** — Cloudflare no cobra por ancho de banda ni por descarga de archivos (R2), así que a gran escala tiende a ser más barato. Con el volumen actual ambos son gratis; migrar solo cuando el ahorro real supere el costo de rehacer la configuración.

## Roadmap actual (orden de trabajo, definido 2026-07-10)
1. **Airtable** — arrancar la integración (organizador de trabajo de Laura + base de contenido conectada a la app).
2. **Revisar `app/alternativas.html`** — auditar el banco de preguntas de Evaluación.
3. **Flashcards** — empezar a construir la feature (hoy solo aparece como "Pronto" en el sidebar de `manuales.html`/`alternativas.html`).
4. **Interrogador con IA** — preparar y agregar el chat/interrogación oral con IA a la página. Esto es un **requisito antes de poder testear con alumnos reales**.
5. **Paywall** — recién después de que el chat con IA esté listo se implementa el paywall (ver capas abajo) y se envía el acceso a los alumnos testers.

## Plan del paywall (PENDIENTE — 3 capas)
Estado actual: hay **login, NO paywall**. Dos huecos: el **registro está abierto** (cualquiera crea cuenta) y los **PDF son archivos públicos** (`digesto.cl/app/pdf/...` abren sin login). Compartir ese link se salta todo.
- **Orden:** el paywall se hace **después** de tener listo el Interrogador con IA (ver Roadmap arriba), justo antes de mandar la app a los alumnos tester.
- **Capa 1 (rápida, para fase de feedback):** lista blanca en Supabase (solo correos aprobados entran) + cerrar el registro abierto.
- **Capa 2 (antes de cobrar):** PDFs en bucket **privado** de Supabase con **URLs firmadas** (corta duración); contenido servido de forma autenticada (función serverless o RLS).
- **Capa 3 (monetizar):** pasarela chilena — **Flow / Mercado Pago / Webpay (Transbank)** → webhook marca "pagó" en Supabase → da acceso.

## Airtable (PENDIENTE)
- Se usará como **(A)** organizador de trabajo de Laura **y (B)** **base de contenido conectada a la app**.
- (B) se conecta con la **misma plomería serverless de la Capa 2** (una función intermedia que oculta la API key de Airtable; nunca exponer la llave en el navegador).
- Idea: Laura edita preguntas/manuales en Airtable (interfaz linda) y la app los lee.

## Git / deploy
- Laura **pushea con GitHub Desktop** (ahí tiene sus credenciales). Desde el terminal el push directo puede fallar por credenciales.
- Commits en **español, imperativos** (ej: "Arreglar…", "Agregar…"). **NO commitear** `.claude/settings.local.json`.

## Convenciones de trabajo
- Responder a Laura **en español**, claro y sin tecnicismos.
- Verificación de HTML/JS y PDF: **Chrome headless vía CDP** (la máquina tiene red disponible). Para probar páginas que usan Supabase, bloquear el CDN e inyectar un stub para evitar el redirect a `auth.html`.
- Antes de dar por hecho un arreglo, **verificarlo** (pruebas dirigidas en headless).
