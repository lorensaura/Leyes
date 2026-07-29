# Derecho Libre / Digesto — Contexto del proyecto

> Este archivo lo lee Claude Code automáticamente al abrir el proyecto, en
> cada sesión. **Se mantiene deliberadamente corto**: es el índice, no el
> detalle. El detalle de cada tema vive en su doc de `docs/*.md` — ábrelo
> solo cuando el tema del mensaje lo requiera. No hay una bitácora central
> de "decisiones tomadas" aquí: cada doc de tema mantiene su propio estado
> vigente, actualizado in place (no acumules una entrada nueva por sesión —
> corrige la que ya existe).

## Qué es
- **Derecho Libre** = la plataforma. **Digesto** = los manuales de estudio.
- Plataforma de estudio para el **examen de grado** (Chile). Autora: **Laura Schultz Solano**.
- Público: estudiantes de derecho chilenos. **Todo en español** (código, contenido y respuestas a la usuaria).
- La usuaria (Laura) es **abogada** (ya rindió el examen de grado) y **no técnica en programación**: explicar sin jerga de código, acompañar paso a paso. No llamarla "estudiante".
- En vivo: **digesto.cl** (deploy en Vercel). Autenticación con **Supabase**.
- Los manuales fusionan **código + doctrina + jurisprudencia**.
- **Alcance real de la plataforma (ambición, no lo publicado hoy):** todas las ramas del examen de grado — **Civil** (completo: Acto Jurídico, Bienes, Contratos, Familia, Obligaciones/Responsabilidad, Sucesorio), **Procesal** (incluido Procesal Penal), y a futuro **Penal, Constitucional, Administrativo**. Lo único publicado/visible en la app hoy es Responsabilidad Contractual, Extracontractual y Precontractual — el resto de las materias se va habilitando a medida que existan sus manuales y contenido curado.

## Roadmap actual
1. ~~Airtable~~ — hecho: contenido conectado, migrado a Supabase para producción.
2. ~~Práctica (`app/alternativas.html`)~~ — hecho: módulo unificado con Evaluación/Flashcards/Alternativas/Memorice.
3. **Interrogador con IA** — v1 en producción, alcance Contractual + Extracontractual + Precontractual. Ver `docs/interrogador.md`. La interrogación oral (voz) queda para después.
4. **Paywall** — pendiente, después de validar el Interrogador con alumnas reales. Ver `docs/paywall.md`.
5. **Revisar las demás materias de Civil y Procesal** — en stand by hasta terminar de validar Responsabilidad.

**¿Qué falta exactamente antes de invitar alumnas beta?** Eso ya no vive
acá, ver `docs/camino-a-beta.md`, la lista viva de hecho / pendiente /
por determinar. Ábrelo al empezar una sesión si no está claro por dónde
seguir.

**⚠️ Al retomar la próxima sesión, leer primero la sección "Urgente" de
`docs/camino-a-beta.md`**: hay tablas duplicadas en Airtable
(`Opciones_MC`/`Elementos_Clave` vs. las tablas nuevas de Evaluación)
detectadas el 2026-07-28 que Laura quiere revisar antes de seguir con
cualquier otro pendiente.

## Git / deploy
- Laura **pushea con GitHub Desktop** (ahí tiene sus credenciales). Desde el terminal el push directo puede fallar por credenciales.
- Commits en **español, imperativos** (ej: "Arreglar…", "Agregar…"). **NO commitear** `.claude/settings.local.json`.

## Convenciones de trabajo
- Responder a Laura **en español**, claro y sin tecnicismos.
- Verificación de HTML/JS y PDF: **Chrome headless vía CDP**. Para páginas que usan Supabase, bloquear el CDN e inyectar un stub para evitar el redirect a `auth.html`.
- Antes de dar por hecho un arreglo, **verificarlo** (pruebas dirigidas en headless).
- Cero guiones largos (—) en ningún contenido generado (código, manuales, preguntas). Regla permanente.

## Índice de documentación (`docs/`)
Clasificado por para qué lo abrirías — no leas ninguno de entrada, solo el que aplique:

**Estado del proyecto:**
- `docs/camino-a-beta.md`: hecho / pendiente / por determinar antes de invitar alumnas beta. Se actualiza in place cada sesión, es el punto de partida si no está claro qué sigue.

**Contenido jurídico (manuales, preguntas, Práctica):**
- `docs/creacion-de-contenido.md` — punto de entrada: qué modelo vive dónde, qué revisar antes de generar, pendientes de contenido. Ábrelo siempre antes de tocar manuales o preguntas.
- `docs/practica.md` — cómo funciona el módulo Práctica en la app (los 3 ejes de filtro, el motor de Memorice).
- `docs/prompt-generacion-contenido-practica.md` — prompt maestro con las reglas mecánicas de redacción y anti-alucinación.
- `docs/interrogador.md` — Interrogador IA: grounding, costos, modo transversal, estado y pendientes.

**Infraestructura y arquitectura:**
- `docs/arquitectura.md` — stack, flujo de la app, archivos clave, dónde vive cada pieza técnica.
- `docs/contenido-airtable-supabase.md` — esquema de tablas de Airtable/Supabase y el script de sincronización.
- `docs/pdf.md` — reglas de generación de PDF.

**Producto, pendiente / sin priorizar:**
- `docs/paywall.md` — plan del paywall (3 capas).
- `docs/gamificacion.md` — idea de gamificación, sin priorizar.
