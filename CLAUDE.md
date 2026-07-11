# Derecho Libre / Digesto — Contexto del proyecto

> Este archivo lo lee Claude Code automáticamente al abrir el proyecto.
> Mantiene el contexto entre sesiones. Actualízalo cuando tomes decisiones nuevas.

## Qué es
- **Derecho Libre** = la plataforma. **Digesto** = los manuales de estudio.
- Plataforma de estudio para el **examen de grado** (Chile). Autora: **Laura Schultz Solano**.
- Público: estudiantes de derecho chilenos. **Todo en español** (código, contenido y respuestas a la usuaria).
- La usuaria (Laura) es **abogada** (ya rindió el examen de grado) y **no técnica en programación**: explicar sin jerga de código, acompañar paso a paso. No llamarla "estudiante".
- En vivo: **digesto.cl** (deploy en Vercel). Autenticación con **Supabase**.
- Los manuales fusionan **código + doctrina + jurisprudencia**.
- **Alcance real de la plataforma (ambición, no lo publicado hoy):** todas las ramas del examen de grado — **Civil** (completo: Acto Jurídico, Bienes, Contratos, Familia, Obligaciones/Responsabilidad, Sucesorio), **Procesal** (incluido Procesal Penal), y a futuro **Penal, Constitucional, Administrativo**. Lo único publicado/visible en la app hoy es Responsabilidad Contractual y Extracontractual — el resto de las materias se va habilitando a medida que existan sus manuales y contenido curado (ver campo `publicado` en Airtable).

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
- **`Preguntas_Evaluacion` tiene doble uso:** (1) banco de la página Evaluación (`alternativas.html`), y (2) **base de grounding para el futuro Interrogador con IA** — la IA no debe inventar contenido legal, sino apoyarse en `respuesta_modelo` + `articulos_referencia` + `Elementos_Clave` de estas preguntas para generar variaciones, seguimientos y preguntas nuevas de la misma materia. Por eso vale la pena seguir cargando preguntas históricas ahí aunque hoy no exista todavía el Interrogador.
- **Las Flashcards son un formato aparte, no un subproducto de `Preguntas_Evaluacion`.** Tienen que ser cortas (recuperación de memoria, no desarrollo), así que no se generan automáticamente acortando preguntas de evaluación — se trabajan directamente en su propio flujo.

## Roadmap actual (orden de trabajo, definido 2026-07-10)
1. **Airtable** — arrancar la integración (organizador de trabajo de Laura + base de contenido conectada a la app).
2. **Revisar `app/alternativas.html`** — auditar el banco de preguntas de Evaluación.
3. **Flashcards** — empezar a construir la feature (hoy solo aparece como "Pronto" en el sidebar de `manuales.html`/`alternativas.html`).
4. **Interrogador con IA** — **v1 de texto lista (2026-07-11)**, ver sección propia más abajo. Falta: que Laura configure la API key de Anthropic en Vercel y pruebe el flujo real antes de testear con alumnas. La interrogación oral (voz) queda para después. Esto es un **requisito antes de poder testear con alumnos reales**.
5. **Paywall** — recién después de que el chat con IA esté listo se implementa el paywall (ver capas abajo) y se envía el acceso a los alumnos testers.
6. **Revisar las demás materias de Civil y Procesal** (Acto Jurídico, Bienes, Contratos, Familia, Sucesorio, Teoría de la Ley, Personas; y en Procesal: Orgánico, Disposiciones comunes, Juicio ordinario, Prueba, Juicios especiales, Incidentes y cautelares, Recursos, Procesal Penal) — mismo flujo que se usó para Responsabilidad: separar preguntas ya respondidas (a un Word, no a Airtable, para no gastar el cupo gratis) de las sin respuesta (a otro Word, para pasar por IA). Quedó en **stand by el 2026-07-10** hasta terminar de validar Responsabilidad Contractual/Extracontractual/Precontractual. Acto Jurídico ya quedó procesado (ver `Preguntas CIVIL/Preguntas Acto Jurídico/`); el resto no se ha tocado.

## Interrogador IA (v1 texto, agregado 2026-07-11)
- `app/interrogador.html` (chat, mismo login/sidebar que `manuales.html`) + `api/interrogador.js` (función serverless, llama a la API de Claude con streaming, sin exponer la llave — mismo patrón que `api/waitlist.js`).
- **Alcance:** solo Responsabilidad Contractual/Extracontractual (lo publicado hoy), sin el "modo repaso transversal" del prompt original (regla 10) — eso requiere cargar los códigos legales completos, queda pendiente.
- **Modelo: Claude Opus 4.8** (Laura eligió priorizar calidad/precisión legal por sobre el costo menor de Sonnet 5).
- **Grounding:** el system prompt (`api/_interrogador-prompt.js`, adaptado de `03_Interrogador_IA_Responsabilidad_PROMPT.md`) va acompañado del texto completo de los dos manuales (`api/_interrogador-contenido.js`), generado por `scripts/extraer_contenido_interrogador.py`. **Si los manuales fuente cambian, hay que volver a correr ese script** para regenerar `api/_interrogador-contenido.js` (no se genera solo).
- **No se guarda** la nota/feedback de cada sesión (solo se muestra en pantalla) — se agregará cuando exista progreso/gamificación.
- Requiere que Laura cree cuenta en **console.anthropic.com**, genere una API key, le ponga un **tope de gasto mensual**, y la agregue como variable de entorno `ANTHROPIC_API_KEY` en Vercel (Production + Preview). Es una cuenta y facturación **separada** de su Claude Pro personal.
- Costo real por interrogación completa con Opus 4.8: aprox. **$0.50–$2 USD aislada**, pero mucho menos por alumna en la práctica porque el bloque grande de contexto (reglas + manuales) se cachea (~5 min) y se comparte entre cualquier alumna que pregunte en esa ventana, no se paga completo por cada una.
- **Idea de negocio anotada para después (no construida aún):** planes con tope de interrogaciones/tokens por mes + compra de "interrogaciones extra" sueltas, diseñado a propósito para que el plan Pro de Digesto salga más barato que comprar sueltas — encaja como parte de la Capa 3 del paywall (ver abajo). Implica agregar conteo de uso por usuaria en Supabase cuando se construya.

## Gamificación (idea, PENDIENTE — sin priorizar aún en el roadmap)
Laura quiere que Digesto tenga una capa de gamificación, en la línea de Duolingo:
- **Liga de competidores**: ranking entre usuarias/os que compiten por avance/puntaje.
- **Puntos o "energía"** que se ganan al estudiar (leer manual, responder Evaluación, flashcards, etc.).
- **Refuerzo positivo tipo "¡Bien hecho!"** al completar acciones de estudio.
- Aún no tiene fecha ni lugar fijo en el Roadmap — evaluar en qué fase encaja mejor (probablemente después del Interrogador con IA, ya que necesita usuarias activas y contenido de evaluación maduro para que el ranking tenga sentido).

## Plan del paywall (PENDIENTE — 3 capas)
Estado actual: hay **login, NO paywall**. Dos huecos: el **registro está abierto** (cualquiera crea cuenta) y los **PDF son archivos públicos** (`digesto.cl/app/pdf/...` abren sin login). Compartir ese link se salta todo.
- **Orden:** el paywall se hace **después** de tener listo el Interrogador con IA (ver Roadmap arriba), justo antes de mandar la app a los alumnos tester.
- **Capa 1 (rápida, para fase de feedback):** lista blanca en Supabase (solo correos aprobados entran) + cerrar el registro abierto.
- **Capa 2 (antes de cobrar):** PDFs en bucket **privado** de Supabase con **URLs firmadas** (corta duración); contenido servido de forma autenticada (función serverless o RLS).
- **Capa 3 (monetizar):** pasarela chilena — **Flow / Mercado Pago / Webpay (Transbank)** → webhook marca "pagó" en Supabase → da acceso.

## Airtable (en progreso, iniciado 2026-07-10)
- Se usará como **(A)** organizador de trabajo de Laura **y (B)** **base de contenido conectada a la app**. Por ahora se construyó (B).
- (B) se conecta con la **misma plomería serverless de la Capa 2** (una función intermedia que oculta la API key de Airtable; nunca exponer la llave en el navegador). El primer caso real de este patrón ya existe: `api/waitlist.js` (formulario de lista de espera de `index.html`).
- Idea: Laura edita preguntas/manuales en Airtable (interfaz linda) y la app los lee.
- **Tablas creadas** (base `appjP6jK8Jbm5uaeG`): `Temas` (capítulos de Contractual), `Flashcards` (225 de muestra, Contractual), `Preguntas_Evaluacion` + `Elementos_Clave` + `Opciones_MC` (migradas las 15 de `alternativas.html`), `Banco_Preguntas_Crudo` (staging para preguntas históricas de exámenes de grado sin clasificar — campo `promovido` marca cuándo ya pasaron al esquema rico).
- **Campo `publicado`** (checkbox) en las tablas de contenido: controla qué se sirve a la app sin tocar código — reemplaza el patrón `TEMAS_EN_ALCANCE` hardcodeado. Hoy solo Contractual/Extracontractual están en `sí`.
- **Límite del plan Free de Airtable: 1.000 registros por base.** Laura tiene archivos con miles de preguntas históricas (Civil completo + Procesal, incluido Penal, de varios profesores UC) — **decisión (2026-07-10): ingresar por ahora solo Contractual y Extracontractual**, para no tener que pagar un plan superior de Airtable antes de validar el producto con alumnos tester. El resto de las materias (Acto Jurídico, Bienes, Familia, Sucesorio, Procesal, etc.) espera a que se suba de plan.
- **Flujo de carga de preguntas históricas:** Laura tiene bancos de preguntas reales de examen (de profesores UC) en `.pages`/`.docx`/`.doc`/`.numbers`/`.pdf`, casi siempre **sin respuesta escrita** (solo la pregunta oral). El trabajo de Claude es: leer esos archivos + los manuales/apuntes de la materia correspondiente, **redactar la respuesta modelo** grounded en esos apuntes (no inventar contenido legal), clasificar `tipo` (aplicación/detección_error/justificación/discriminación_mc → `Preguntas_Evaluacion`, o pregunta-respuesta corta → `Flashcards`), y recién ahí subir a Airtable.
- **Conversión de formatos** (sin Node/vercel CLI en esta máquina): `.docx`/`.doc` → `textutil -convert txt`; `.pages` → AppleScript vía Pages.app (`export doc to POSIX file outPath as Microsoft Word`, no funciona `as Word`) → luego `textutil`; `.numbers` → AppleScript vía Numbers.app (`export doc to POSIX file outPath as CSV`, genera una carpeta con un CSV por hoja); `.pdf` → Read tool directo.

## Git / deploy
- Laura **pushea con GitHub Desktop** (ahí tiene sus credenciales). Desde el terminal el push directo puede fallar por credenciales.
- Commits en **español, imperativos** (ej: "Arreglar…", "Agregar…"). **NO commitear** `.claude/settings.local.json`.

## Convenciones de trabajo
- Responder a Laura **en español**, claro y sin tecnicismos.
- Verificación de HTML/JS y PDF: **Chrome headless vía CDP** (la máquina tiene red disponible). Para probar páginas que usan Supabase, bloquear el CDN e inyectar un stub para evitar el redirect a `auth.html`.
- Antes de dar por hecho un arreglo, **verificarlo** (pruebas dirigidas en headless).
