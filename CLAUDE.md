# Derecho Libre / Digesto — Contexto del proyecto

> Este archivo lo lee Claude Code automáticamente al abrir el proyecto.
> Mantiene el contexto entre sesiones. Actualízalo cuando tomes decisiones
> nuevas. **Es el índice** — el detalle de cada tema vive en `docs/*.md`
> (ver Índice al final); solo abre esos archivos cuando el tema del
> mensaje lo requiera, no los leas todos de entrada.

## Qué es
- **Derecho Libre** = la plataforma. **Digesto** = los manuales de estudio.
- Plataforma de estudio para el **examen de grado** (Chile). Autora: **Laura Schultz Solano**.
- Público: estudiantes de derecho chilenos. **Todo en español** (código, contenido y respuestas a la usuaria).
- La usuaria (Laura) es **abogada** (ya rindió el examen de grado) y **no técnica en programación**: explicar sin jerga de código, acompañar paso a paso. No llamarla "estudiante".
- En vivo: **digesto.cl** (deploy en Vercel). Autenticación con **Supabase**.
- Los manuales fusionan **código + doctrina + jurisprudencia**.
- **Alcance real de la plataforma (ambición, no lo publicado hoy):** todas las ramas del examen de grado — **Civil** (completo: Acto Jurídico, Bienes, Contratos, Familia, Obligaciones/Responsabilidad, Sucesorio), **Procesal** (incluido Procesal Penal), y a futuro **Penal, Constitucional, Administrativo**. Lo único publicado/visible en la app hoy es Responsabilidad Contractual, Extracontractual y Precontractual — el resto de las materias se va habilitando a medida que existan sus manuales y contenido curado (ver campo `publicado` en Airtable/Supabase).

## Arquitectura
- HTML/CSS/JS plano, sin framework. Deploy estático en Vercel (`vercel.json` en la raíz).
- Flujo de la app:
  `index.html` → `app/auth.html` (login Supabase) → `app/dashboard.html` →
  `app/manuales.html` (lector de manuales), `app/alternativas.html`
  (**Práctica**: módulo unificado con 3 ejes de filtro cruzables —Materia /
  Modelo / Subtipo— que cubre Evaluación, Flashcards, Alternativas y
  Memorice; `app/flashcards.html` es solo un redirect hacia ahí), `app/interrogador.html` (Interrogador IA).
- PDFs pre-generados en `app/pdf/` para descarga de un clic (detalle en `docs/pdf.md`).
- **Supabase ya no es solo login:** Flashcards y el banco de preguntas del
  Interrogador se sirven desde Supabase en producción. Airtable es donde
  Laura edita ese contenido; un script sincroniza de uno a otro. Detalle
  completo en `docs/contenido-airtable-supabase.md`.

## Archivos clave
- `app/manuales.html` — lector en línea. Los checkpoints se insertan partiendo el contenido por el marcador `<!-- CP -->` (ver `buildOnlineContent` / `buildCheckpointCard` / `evaluarCheckpoint`).
- `app/alternativas.html` — módulo de Práctica unificado (refactor 2026-07-14): Evaluación (banco hardcoded `const banco = [...]`, sin cambios), Flashcards (mismo motor de siempre, ahora también filtrable por materia), y dos modelos nuevos servidos desde Supabase — Alternativas (MC puro) y Memorice (memorización textual con ocultamiento progresivo). Detalle completo en `docs/practica.md`.
- `app/flashcards.html` — redirect a `alternativas.html?modelo=flashcard`, sin lógica propia.
- `scripts/supabase_schema_practica.sql` — migración del refactor de Práctica (tablas `alternativas`, `memorice_articulos`, `memorice_progreso` + columnas nuevas). **Correr en Supabase antes de que Laura use Alternativas o Memorice.**
- `app/interrogador.html` + `api/interrogador.js` — Interrogador IA (chat con Claude). Detalle en `docs/interrogador.md`.
- `01_Responsabilidad_Contractual_Manual.html`, `02_Responsabilidad_Extracontractual_Manual.html` y `03_Responsabilidad_Precontractual_Manual.html` — fuentes de los manuales y de los PDF.
- `app/pdf/*.pdf` — PDFs generados.
- `scripts/sync_airtable_supabase.py` — sincroniza Airtable → Supabase (a pedido, cuando Laura agregue contenido). Ver `docs/contenido-airtable-supabase.md`.
- `.claude/skills/handoff/` — skill `/handoff` para cortar y retomar sesiones largas.

## Decisiones tomadas
- **Contenido de Práctica y de Evaluación completado para Extracontractual y Precontractual (2026-07-24/25).** Módulo Práctica (`app/alternativas.html`): terminados los últimos 5 ejes de Extracontractual (25/25) y los 10 ejes de Precontractual completos (10/10, primera vez que esta materia tiene contenido), más un lote de 10 preguntas transversales. **Pendiente crítico: `scripts/contenido_practica_2026-07.sql` (Alternativas + Memorice de esta tanda) nunca se corrió en Supabase** — verificado con consulta directa, la tabla `alternativas` no tiene ninguno de los IDs nuevos. Hay que correrlo en el SQL Editor de Supabase antes de que sirva para algo. Por separado, en Airtable (pipeline del Interrogador IA) se encontró y limpió un problema real: la base "Digesto Precontractual" tenía `Temas`/`Flashcards` sobrantes con `materia = "Responsabilidad contractual"` (copia inservible de cuando se duplicó la base, nunca leída por el sync), y solo 19 `Preguntas_Evaluacion` sin ninguna `Opciones_MC`. Se borró ese sobrante, se creó Precontractual bien (10 `Temas` + 59 `Flashcards` en la base principal `Digesto`), se generaron 100 preguntas nuevas releyendo el manual eje por eje (10 por eje, con `Elementos_Clave` y `Opciones_MC` reales para las 20 de tipo `discriminacion_mc`), y se corrió `sync_airtable_supabase.py` — esto sí quedó confirmado en Supabase (119 preguntas y 59 flashcards de Precontractual, `publicado = true`). **Todo el contenido jurídico nuevo de esta tanda (Práctica y Evaluación) está sin revisar por Laura.** Detalle completo, IDs de bases y convenciones de nomenclatura en `.claude/handoff/handoff-20260725.md` (gitignored, snapshot puntual).
- **El prompt de generación de contenido de Práctica ahora revisa lo ya existente antes de generar (2026-07-27).** Hasta esta fecha `docs/prompt-generacion-contenido-practica.md` no tenía ningún paso que revisara el contenido ya cargado antes de generar un lote nuevo, así que había riesgo real de repetir un punto de derecho ya cubierto (Laura lo detectó al preguntar por los duplicados). Se agregó como paso 1 del proceso de trabajo (sección 1) y como ítem de la auto-auditoría final (sección 6), cubriendo las **cinco** fuentes de contenido existente: el banco hardcoded de Evaluación en `app/alternativas.html`, la tabla Supabase `preguntas_evaluacion` (un banco aparte, no espejo del anterior — ver el punto siguiente), la tabla `alternativas`, `memorice_articulos`, y Flashcards en Airtable.
- **El banco de preguntas de examen real (`preguntas_evaluacion` en Supabase) ya se usa como grounding del Interrogador IA, no es un banco muerto (confirmado 2026-07-27).** Son 328 preguntas (55 Contractual + 154 Extracontractual + 119 Precontractual) que vienen de bancos de preguntas de examen reales que Laura fue enviando — desde el 2026-07-13 `api/interrogador.js` las consulta en vivo (40 por materia) para que el Interrogador pregunte con el estilo y cobertura de un examen real. El mecanismo para sumar materias nuevas (cuando se arme Civil completo, Procesal, etc.) ya existe y es el mismo usado para Precontractual: cargar el banco de esa materia en Airtable, sumarla a `MATERIAS_MUESTRA` en `api/interrogador.js`, y sumar su manual/artículos al grounding (ver `docs/contenido-airtable-supabase.md` y `docs/interrogador.md`).
- **Alternativas: una sola base en Airtable, no una por materia (2026-07-27).** A diferencia de Preguntas_Evaluacion (que sí se separó en 3 bases por cupo del plan Free), Alternativas usa **una sola base** "Alternativas" con las tres materias juntas distinguidas por su propio campo `materia` — mismo patrón que Flashcards. Se verificó que las 3 bases de Preguntas_Evaluacion ya están al 40-53% de su cupo de 1.000 registros, así que Alternativas necesitaba una base propia para no competir por ese cupo, pero el volumen esperado (~30-50 ítems por materia) no justifica tres bases separadas — más simple de mantener para Laura. Falta que ella cree la base (`docs/contenido-airtable-supabase.md` tiene el esquema exacto) y pegue el ID en `ALTERNATIVAS_BASE` (`scripts/sync_airtable_supabase.py`).
- **Manual de Responsabilidad Precontractual construido (2026-07-20)** a partir de un borrador de Laura (10 ejes, en `Apuntes/` — carpeta gitignored y por eso nunca llega a la plataforma sola). Se llevó al mismo formato que Contractual/Extracontractual (`03_Responsabilidad_Precontractual_Manual.html`), se le agregaron ~25 recuadros pedagógicos (callout/dato-grado/jurisprudencia/ejemplo/advertencia) que antes no tenía, se integró en `app/manuales.html` (nuevo tema "Responsabilidad Precontractual", 10 controles de lectura) y en `app/pdf/Responsabilidad_Precontractual.pdf`, y se amplió el grounding del Interrogador IA (ver `docs/interrogador.md`). **Los recuadros nuevos y las preguntas/keywords de los 10 controles de lectura (checkpoints) en `app/manuales.html` son borrador de Claude, no de Laura — quedan pendientes de su revisión antes de darlos por definitivos** (ella pidió expresamente redactarlos así: "dejas el hueco y redactas el dato, yo los reviso"). Nada de esto está desplegado todavía: falta el push (Laura pushea con GitHub Desktop). De paso se corrigió un bug real en `app/manuales.html` que **cambia lo que ven las alumnas en Contractual y Extracontractual, no solo en Precontractual**: el lector online borraba silenciosamente el primer recuadro `.warn` de cualquier manual (código legado de un "Nota para Laura" que ya no existe) — verificado que ahora se ve bien en los tres, pero Laura debería confirmarlo en persona antes de pushear.
- **Evaluación acotada por ahora a contractual, extracontractual y precontractual** (Procesal y otros temas ocultos hasta que existan sus manuales). Ver `TEMAS_EN_ALCANCE` en `startSession()`.
- Las preguntas de discriminación (MC) no tienen rúbrica de palabras clave: la recuperación libre es práctica y la corrección real es la selección de la alternativa (se puntúa en `evaluarMC`).
- **Hosting:** seguir en **Vercel** por ahora (funciona, es gratis en la escala actual). **A futuro, evaluar migrar a Cloudflare Pages si Vercel empieza a cobrar por tráfico** — con el volumen actual ambos son gratis; migrar solo cuando el ahorro real supere el costo de rehacer la configuración.
- **Las Flashcards son un formato aparte, no un subproducto de `Preguntas_Evaluacion`.** Tienen que ser cortas (recuperación de memoria, no desarrollo) — se trabajan en su propio flujo.
- **Airtable para editar, Supabase para servir** (decidido 2026-07-13) — ver `docs/contenido-airtable-supabase.md` para el porqué y el detalle completo.
- **Práctica unificada en una sola pantalla, no cuatro páginas** (decidido 2026-07-14): los 3 ejes de filtro (Materia/Modelo/Subtipo) tienen que poder cruzarse libremente, lo que solo funciona como un solo estado de filtros. Ver `docs/practica.md` para el detalle completo, incluidas las simplificaciones conscientes (progresión por nivel siempre ascendente por ahora, Precontractual sin contenido) y el hallazgo de que `preguntas_evaluacion` existe en Supabase pero Evaluación no la usa.

## Roadmap actual (definido 2026-07-10, actualizado 2026-07-13)
1. ~~Airtable~~ — hecho: base de contenido conectada, luego migrada a Supabase para producción (ver `docs/contenido-airtable-supabase.md`).
2. ~~Revisar `app/alternativas.html`~~ — hecho.
3. ~~Flashcards~~ — hecho: página con calificación y repetición espaciada (ver `docs/contenido-airtable-supabase.md`).
4. **Interrogador con IA** — v1 lista y en producción, alcance ampliado a Contractual + Extracontractual + Precontractual (2026-07-20), ver `docs/interrogador.md` para estado y pendientes. La interrogación oral (voz) queda para después.
5. **Paywall** — sigue pendiente, después de validar el Interrogador con alumnas reales. Ver `docs/paywall.md`.
6. **Revisar las demás materias de Civil y Procesal** — en stand by desde 2026-07-10 hasta terminar de validar Responsabilidad. Detalle del flujo en `docs/contenido-airtable-supabase.md`.

## Git / deploy
- Laura **pushea con GitHub Desktop** (ahí tiene sus credenciales). Desde el terminal el push directo puede fallar por credenciales.
- Commits en **español, imperativos** (ej: "Arreglar…", "Agregar…"). **NO commitear** `.claude/settings.local.json`.

## Convenciones de trabajo
- Responder a Laura **en español**, claro y sin tecnicismos.
- Verificación de HTML/JS y PDF: **Chrome headless vía CDP** (la máquina tiene red disponible). Para probar páginas que usan Supabase, bloquear el CDN e inyectar un stub para evitar el redirect a `auth.html`.
- Antes de dar por hecho un arreglo, **verificarlo** (pruebas dirigidas en headless).

## Índice de documentación (`docs/`)
Abre estos archivos solo cuando el tema del mensaje lo requiera:
- `docs/interrogador.md` — Interrogador IA: grounding, costos, modo transversal, estado y pendientes.
- `docs/contenido-airtable-supabase.md` — estructura de Airtable (bases por materia), tablas de Supabase, script de sincronización, flujo de carga de preguntas históricas.
- `docs/paywall.md` — plan del paywall (3 capas), pendiente.
- `docs/gamificacion.md` — idea de gamificación, pendiente, sin priorizar.
- `docs/pdf.md` — reglas de generación de PDF (Chrome headless/CDP, márgenes).
- `docs/practica.md` — módulo de Práctica (Evaluación/Flashcards/Alternativas/Memorice): los 3 ejes de filtro, el motor de Memorice, simplificaciones pendientes y el paso de migración SQL antes de usar.
- `docs/prompt-generacion-contenido-practica.md` — prompt maestro para generar contenido nuevo (Evaluación, Alternativas, Memorice, Flashcards) a partir de los manuales, con reglas mecánicas anti-alucinación, esquema/destino exacto de cada modelo, prohibición explícita de alternativas obvias, y una categoría transversal para repasar toda Responsabilidad (Contractual + Extracontractual + Precontractual, las tres con el mismo estatus).
