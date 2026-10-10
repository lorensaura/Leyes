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
5. **Revisar las demás materias de Civil y Procesal** — en stand by hasta terminar de validar Responsabilidad. Excepción en curso: actualización de manuales de Civil con el método nuevo. Acto Jurídico terminado (2026-10-07); **el siguiente es Bienes: empezar siempre por `docs/manuales/estado_bienes.md`**, que exige leer antes `docs/manuales/lecciones-acto-juridico.md` para hacerlo en una sola pasada.

**¿Qué falta exactamente antes de invitar alumnas beta?** Eso ya no vive
acá, ver `docs/camino-a-beta.md`, la lista viva de hecho / pendiente /
por determinar. Ábrelo al empezar una sesión si no está claro por dónde
seguir.

## Git / deploy
- Laura **pushea con GitHub Desktop** (ahí tiene sus credenciales). Desde el terminal el push directo puede fallar por credenciales.
- Commits en **español, imperativos** (ej: "Arreglar…", "Agregar…"). **NO commitear** `.claude/settings.local.json`.

## Convenciones de trabajo
- Responder a Laura **en español**, claro y sin tecnicismos.
- Verificación de HTML/JS y PDF: **Chrome headless vía CDP**. Para páginas que usan Supabase, bloquear el CDN e inyectar un stub para evitar el redirect a `auth.html`.
- Antes de dar por hecho un arreglo, **verificarlo** (pruebas dirigidas en headless).
- **Archivos fuera del repo, siempre en su carpeta** (regla permanente, ver
  `../CLAUDE.md`): informes HTML para Laura en `DERECHO LIBRE/Informes/`,
  vista previa del manual en `DERECHO LIBRE/Vista_previa/`, lo que ya no
  se usa en `DERECHO LIBRE/Archivo (ya no se usa)/`. Nunca dejar informes
  ni vistas previas sueltos en la raíz de `DERECHO LIBRE/` ni del repo.
- **Raíz del repo:** solo `index.html`, los manuales activos
  (`NN_<Materia>_Manual.html`: la web y el build los leen ahí, no moverlos),
  `CLAUDE.md`, `package*.json` y `vercel.json`. Todo lo demás va en su
  carpeta; lo versionado que ya no se usa va a `archivo/` (con `git mv`).
- Cero guiones largos (—) en ningún contenido generado (código, manuales, preguntas). Regla permanente.
- **Cortar y retomar sesión por manual, sin recapitular:** aplica a
  **cualquier manual o apunte** que se esté trabajando (Acto Jurídico,
  Bienes, Obligaciones, Responsabilidad, Sucesorio, Familia, Procesal,
  Contratos, ...), no solo a una lista fija. Cada uno en trabajo activo
  tiene su propio `docs/manuales/estado_<manual>.md` (ej.
  `estado_acto-juridico.md`), con todo lo necesario para seguir desde
  cero: qué está terminado, qué
  falta, decisiones de redacción o estructura que no deben cambiar, y el
  siguiente paso exacto. Se actualiza **in place**, nunca se crea uno
  nuevo por sesión. Si Laura dice **"guarda el estado [de X]"**,
  actualizar ese archivo antes de cerrar. **Las preguntas de Práctica de
  una materia son otro trabajo, con su propio archivo:**
  `docs/preguntas-<materia>.md` (hoy existe `docs/preguntas-acto-juridico.md`).
  Si Laura dice **"retoma preguntas [X]"** (o "las preguntas de [X]"),
  se lee ese archivo, no el `estado_` del manual. Si dice **"retoma [X]"**, leerlo
  primero y resumir en pocas líneas dónde quedó antes de seguir.

## Índice de documentación (`docs/`)
Clasificado por para qué lo abrirías — no leas ninguno de entrada, solo el que aplique:

**Estado del proyecto:**
- `docs/camino-a-beta.md`: hecho / pendiente / por determinar antes de invitar alumnas beta. Se actualiza in place cada sesión, es el punto de partida si no está claro qué sigue. Corto a propósito; el detalle sesión a sesión vive aparte en `docs/historial-2026-08.md` (archivo, no se actualiza in place, abrir solo si hace falta el detalle fino).

**Contenido jurídico (manuales, preguntas, Práctica):**
- `docs/creacion-de-contenido.md` — punto de entrada: qué modelo vive dónde, qué revisar antes de generar, pendientes de contenido. Ábrelo siempre antes de tocar manuales o preguntas.
- `docs/manuales/`: cómo se construyen y cómo se ven los manuales (materia nueva o reparación de uno existente). `proceso.md` (reglas de oro, inventario de la fuente, verificación por tramo), `formato.md` (escalera de numeración, enumeraciones, recuadros, hoja de estilos), `guia-editorial.md` (criterio de redacción, recuadros, ejemplos), `auditoria.md` (auditoría de cobertura, sin reescribir), `actualizar-manuales-existentes.md` (poner al día un manual antiguo por tramos), `decisiones.md` (el porqué de cada regla, con fecha), `bienes-reestructuracion.md` (plan de capítulos de Bienes) y `lecciones-acto-juridico.md` (qué se aprendió actualizando AJ: leerlo antes de actualizar Bienes u otro manual). `docs/script_apuntes.md` quedó solo como tabla de equivalencias de secciones antiguas. Además, `docs/manuales/estado_<manual>.md` por cada manual en trabajo activo (ver "Convenciones de trabajo"): léelo primero al retomar ese manual.
- `docs/preguntas-acto-juridico.md`: estado vivo de las preguntas de Práctica de Acto Jurídico (por capítulo, qué está cargado, qué falta, siguiente paso). Leerlo primero si Laura dice "retoma las preguntas de Acto Jurídico".
- `docs/practica.md` — cómo funciona el módulo Práctica en la app (los 3 ejes de filtro, el motor de Memorice).
- `docs/prompts-practica/`: el prompt de creación de preguntas: `nucleo.md` (reglas comunes, anti-alucinación, corrección flexible), un prompt por tipo, `elementos-clave.md` (keywords) y `transversales.md`. El prompt maestro antiguo está archivado.
- `docs/interrogador.md` — Interrogador IA: grounding, costos, modo transversal, estado y pendientes.

**Infraestructura y arquitectura:**
- `docs/arquitectura.md` — stack, flujo de la app, archivos clave, dónde vive cada pieza técnica.
- `docs/contenido-airtable-supabase.md` — esquema de tablas de Airtable/Supabase y el script de sincronización.
- `docs/pdf.md` — reglas de generación de PDF.

**Producto, pendiente / sin priorizar:**
- `docs/paywall.md` — plan del paywall (3 capas).
- `docs/gamificacion.md` — idea de gamificación, sin priorizar.

**Precios (`docs/pricing/`):**
- `docs/pricing/planes-y-precios.md` — precios de venta de los 3 planes
  (Práctica/Estándar/Gradista) + Recarga, definidos por Laura
  (2026-08-07). Ábrelo antes de tocar la sección Precios de `index.html`.
- `docs/pricing/costos-interrogador-justiniano.md` — costo real a Digesto
  (API de Anthropic) por plan, para comparar contra el precio de venta.
