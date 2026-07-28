# Arquitectura

> Cómo está armada la plataforma por dentro: stack, flujo de la app,
> archivos clave y dónde vive cada pieza técnica. Ábrelo cuando el trabajo
> sea sobre infraestructura, deploy, o para ubicar un archivo — no para
> temas de contenido jurídico (ver `docs/creacion-de-contenido.md`) ni para
> el Interrogador (`docs/interrogador.md`) o Práctica (`docs/practica.md`).

## Stack
- HTML/CSS/JS plano, sin framework. Deploy estático en Vercel
  (`vercel.json` en la raíz).
- Autenticación con Supabase.
- **Hosting: Vercel por ahora** (funciona, gratis en la escala actual).
  Evaluar Cloudflare Pages solo si Vercel empieza a cobrar por tráfico —
  migrar únicamente cuando el ahorro real supere el costo de rehacer la
  configuración.

## Flujo de la app
`index.html` → `app/auth.html` (login Supabase) → `app/dashboard.html` →
`app/manuales.html` (lector de manuales), `app/alternativas.html`
(**Práctica**: módulo unificado con 3 ejes de filtro cruzables — Materia /
Modelo / Subtipo — que cubre Evaluación, Flashcards, Alternativas y
Memorice; `app/flashcards.html` es solo un redirect hacia ahí),
`app/interrogador.html` (Interrogador IA).

**Por qué Práctica es una sola pantalla y no cuatro páginas** (decidido
2026-07-14): los 3 ejes de filtro tienen que poder cruzarse libremente, lo
que solo funciona como un solo estado de filtros sobre un solo contenedor
que cambia de motor de render según el Modelo elegido. Detalle completo en
`docs/practica.md`.

## Archivos clave
- `app/manuales.html` — lector en línea. Los checkpoints se insertan
  partiendo el contenido por el marcador `<!-- CP -->` (ver
  `buildOnlineContent` / `buildCheckpointCard` / `evaluarCheckpoint`).
- `app/alternativas.html` — módulo de Práctica unificado. Los 4 modelos
  (Evaluación, Flashcards, Alternativas, Memorice) se sirven desde
  Supabase. Evaluación migró desde un banco hardcodeado (`const banco`) a
  Airtable/Supabase el 2026-07-28; solo quedan sueltos en el código 4
  ítems transversales (`const bancoTransversal`) que no encajan en el
  modelo de una base de Airtable por materia. Detalle en `docs/practica.md`
  y `docs/creacion-de-contenido.md`.
- `app/flashcards.html` — redirect a `alternativas.html?modelo=flashcard`,
  sin lógica propia.
- `scripts/supabase_schema_practica.sql` — migración del refactor de
  Práctica (tablas `alternativas`, `memorice_articulos`,
  `memorice_progreso` + columnas nuevas). Ya corrida en Supabase.
- `app/interrogador.html` + `api/interrogador.js` — Interrogador IA (chat
  con Claude). Detalle en `docs/interrogador.md`.
- `01_Responsabilidad_Contractual_Manual.html`,
  `02_Responsabilidad_Extracontractual_Manual.html`,
  `03_Responsabilidad_Precontractual_Manual.html` — fuentes de los
  manuales y de los PDF. Ver `docs/creacion-de-contenido.md` para el
  formato y las convenciones de edición.
- `app/pdf/*.pdf` — PDFs generados (reglas de generación en `docs/pdf.md`).
- `scripts/sync_airtable_supabase.py` — sincroniza Airtable → Supabase
  (Flashcards, Preguntas_Evaluacion, Evaluación). Detalle completo, esquema
  de tablas y credenciales en `docs/contenido-airtable-supabase.md`.
- `.claude/skills/handoff/` — skill `/handoff` para cortar y retomar
  sesiones largas. Escribe siempre a `.claude/handoff/ESTADO_ACTUAL.md`
  (un solo archivo vivo, se sobrescribe cada vez — no se acumulan
  versiones).
- `.claude/skills/generar-practica/` — skill para generar contenido nuevo
  de Práctica materia por materia. Ver `docs/creacion-de-contenido.md`.

## Supabase / Airtable
Airtable es donde Laura edita (Flashcards, Preguntas_Evaluacion, Evaluación
desde 2026-07-28); Supabase
es lo que la app consulta en producción. Esquema completo de tablas,
bases de Airtable y el mecanismo de sincronización: **ver
`docs/contenido-airtable-supabase.md`** (no se duplica aquí porque es
detalle operativo, no de arquitectura).

## Git / deploy
- Laura **pushea con GitHub Desktop** (ahí tiene sus credenciales). Desde
  el terminal el push directo puede fallar por credenciales.
- Commits en **español, imperativos** (ej: "Arreglar…", "Agregar…").
  **NO commitear** `.claude/settings.local.json`.
