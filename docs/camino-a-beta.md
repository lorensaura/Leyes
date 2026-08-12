# Camino al beta de Digesto

> Este doc existe para no perder de vista, entre sesión y sesión, qué está
> hecho, qué falta hacer y qué falta decidir antes (y durante) del beta.
> Se actualiza in place cada sesión: si algo se resuelve, se borra de acá
> (no se deja tachado, queda igual en git). **Se mantiene deliberadamente
> corto** (reordenado el 2026-08-12: el detalle sesión a sesión que antes
> vivía acá se movió completo, sin resumir nada, a
> `docs/historial-2026-08.md` — ábrelo solo si necesitas el detalle fino de
> cómo se llegó a un estado). Última actualización: 2026-08-12.

## Beta en curso

5 alumnas tienen acceso desde el 2026-08-10 (`alumnas_autorizadas` en
Supabase). Al 2026-08-11 todavía no había actividad real de ninguna en las
tablas de uso (`memorice_intentos`, `flashcard_progreso`,
`tiempo_en_pagina`, `uso_ia_beta`, `interrogaciones_diarias`,
`justiniano_uso_diario`) — normal por lo reciente del acceso, no un bug.

## Hecho (funcionalidades ya en producción)

- Los 3 manuales de Responsabilidad (Contractual, Extracontractual,
  Precontractual): código + doctrina + jurisprudencia.
- Contenido de Práctica migrado de Airtable a Supabase (Flashcards,
  Preguntas_Evaluacion, Evaluación); Airtable sigue siendo donde Laura
  edita, Supabase es lo que sirve la app.
- Módulo Práctica unificado (`app/alternativas.html`): Evaluación,
  Flashcards, Alternativas, Memorice, con repetición espaciada y cuaderno
  de errores (autolimpiable, con botón "Reintentar pregunta").
- Interrogador IA v1 en producción (`app/interrogador.html` +
  `api/interrogador.js`), alcance Contractual + Extracontractual +
  Precontractual, con tope semanal (2 de práctica + 1 de examen). Detalle
  en `docs/interrogador.md`.
- JustinIAno, chat de dudas por materia (`app/justiniano.html` +
  `api/justiniano.js`), búsqueda vectorial (Voyage AI + pgvector).
- Login con Supabase, y Paywall Capa 1 (lista blanca `alumnas_autorizadas`,
  bloqueada también a nivel de Supabase, no solo en el API). Detalle en
  `docs/paywall.md`.
- Landing page (`index.html`) reescrita y fusionada a `main`.
- Registro de uso durante la beta: costo real en USD por respuesta de IA
  (`uso_ia_beta`) y tiempo en página (`tiempo_en_pagina`), ambos con RLS.
- Dashboard de Inicio y panel de Práctica rediseñados (2026-08-05).
- **REC (Contractual) y REP (Precontractual) llevados a su techo real de
  cobertura** (Evaluación/Flashcards/Alternativas, los 18 y 10 ejes reales
  respectivamente), y **REX (Extracontractual) con una segunda pasada de
  volumen completa sobre sus 25 ejes** (2026-08-04 a 2026-08-11). Mucho de
  este contenido nuevo sigue sin publicar, ver "Pendiente" abajo. Detalle
  ítem por ítem en `docs/historial-2026-08.md`.
- `docs/script_apuntes.md`: template de formato y proceso para construir
  el manual de una materia nueva (piloto: Bienes), con el estándar de
  densidad de Contractual/Precontractual, ahora también aplicado a REX
  (ver "Manuales" abajo).

## Pendiente

**Contenido generado, sin publicar todavía (el bloque más grande):**
Gran parte de la pasada de REC/REX/REP de agosto quedó creada en
Airtable/Supabase pero sin marcar `publicado`, a la espera de que Laura la
revise. Detalle completo, ítem por ítem, en `docs/historial-2026-08.md`.
Dos correcciones puntuales que necesitan decisión de Laura antes de
publicar:
- `rc-just-028` (ya publicado) y `rc-just-032` (nuevo): el manual de
  Contractual se contradice a sí mismo sobre si CLARO SOLAR o ABELIUK
  defiende "ausencia de culpa basta como eximente" (dos pasajes opuestos
  del mismo manual). Laura tiene que decidir cuál atribución es la
  correcta y corregir el manual antes de publicar cualquiera de los dos.
- `hist-pre-mc-015` (Precontractual): sin eje asignado, genuinamente
  partido entre el eje B y el J (detalle en
  `docs/fase0_rep_clasificacion_2026-07-31.md`).

**Manuales:**
- ~~Extracontractual (REX) quedó con un formato más denso que
  Contractual/Precontractual~~ **Hecho 2026-08-12**: reformateados los 25
  ejes de REX al mismo estándar de `docs/script_apuntes.md` (párrafos
  cortos, recuadros `.callout`/`.enum-i`/`.enum-a` agregados, jurisprudencia
  repetida agrupada). Verificado sin pérdida de contenido eje por eje
  (script de anclas + diff de texto). Detalle en
  `docs/notas_reformato_rex.md`. **Sigue pendiente de revisión de Laura**,
  como todo el contenido jurídico de los manuales.
- Índice de los 3 manuales publicados: falta que liste también los
  subtemas de nivel 2 (`h3`, "N.M"), no solo los ejes. Pedido de Laura,
  2026-07-31.
- Checkpoints de comprensión lectora del manual de Precontractual
  (preguntas/keywords en `app/manuales.html`): son borrador de Claude, sin
  la revisión de Laura todavía.
- Materias nuevas (Bienes, Contratos, Familia, Sucesorio, Procesal, Penal,
  Constitucional, Administrativo): en stand by, sin contenido ni filtro
  habilitado. Acto Jurídico ya dio su primer paso real, ver el punto de
  abajo.
  **2026-08-12: Acto Jurídico habilitado en el módulo de Práctica.** 40
  artículos de Memorice cargados en Supabase (`scripts/memorice_acto_juridico_2026-08.sql`
  y `scripts/memorice_acto_juridico_2026-08_paso2_updates.sql`, corridos y
  confirmados). Antes de esto, el filtro de Materia a nivel Civil
  (`MATERIAS_CIVIL` en `app/alternativas.html`) estaba `disabled:true` y,
  aunque se hubiera habilitado, no llegaba a filtrar los datos: solo el
  Área dentro de Responsabilidad lo hacía. Se agregó `perteneceAMateriaCivil()`
  y se conectó en los 5 modelos (Evaluación, Alternativas, Memorice,
  Flashcards, Errores), verificado con 22 casos de prueba en Node contra el
  código real (compatibilidad retroactiva de Responsabilidad incluida).
  Evaluación, Alternativas y Flashcards de Acto Jurídico siguen sin
  contenido propio todavía, el filtro ya queda listo para cuando se cargue.
  El resto de las materias nuevas (Bienes, etc.) puede seguir el mismo
  camino sin más cambios de código, solo cargar su contenido y sacarles el
  `disabled` en `MATERIAS_CIVIL`.

**Producto / app:**
- No existe una tabla que guarde **todos** los intentos de
  Evaluación/Alternativas por alumna (solo Memorice y Flashcards la
  tienen). Por eso el dashboard muestra "sin datos" en vez de "preguntas
  respondidas" / "% acierto hoy", y la "racha" sigue mockeada. Laura
  decidió posponerlo, retomar cuando lo pida.
- Reconectar el link "Progreso" del menú con la sección de progreso del
  dashboard (se perdió al unificar el menú global).
- Agrupar el cuaderno de errores por tipo de pregunta (hoy es una lista
  plana por fecha).
- Correo `admin@digesto.cl`: falta que Laura cree la cuenta de Google
  Workspace (necesita su método de pago); después se agregan los DNS en
  Vercel.
- Memoria entre sesiones del Interrogador: construida, verificada solo con
  mocks, **falta correr su SQL en Supabase y mergear la rama a `main`**.
- Fusionar a `main` el arreglo de encabezado de los PDF (worktree
  `pdf-header-fix`, ya pusheado): a propósito no fusionado, Laura quiere
  juntar más arreglos de PDF antes de regenerar los 3 de una vez.

**JustinIAno / Interrogador, pendientes heredados sin fecha reciente:**
falta agregar la tarjeta de pago a la cuenta de Voyage AI (a propósito
pospuesto, el límite gratuito no afecta el uso normal todavía, pero hay
que hacerlo antes de que las alumnas usen JustinIAno en volumen); no está
confirmado si `VOYAGE_API_KEY` ya tomó efecto en producción; y el
"self-answering" del Interrogador (la IA a veces se respondía sola su
propia pregunta, reportado hace varias sesiones) sigue sin confirmación
concluyente de si sigue pasando.

**Contenido, tareas sueltas menores:** normalizar el campo `materia` de
las preguntas nuevas de Contractual (cosmético); terminar de linkear a
`Temas` el contenido viejo de Contractual/Precontractual; verificar contra
leychile.cl directo (no un espejo) 2 artículos de Código de Comercio;
completar la revisión de fondo de Evaluación de Precontractual
(Justificación/Detección de error/Aplicación); borrar las 8 bases de
Airtable sueltas de un diseño descartado; confirmar con otra interrogación
real si la corrección de la IA es dura o inconsistente. Detalle de cada
una en `docs/historial-2026-08.md`.

## Por determinar (decisiones de Laura, no son solo "hacer")

- Si los ítems transversales de Evaluación/Alternativas deberían verse
  también al filtrar una sola área, no solo bajo "Todas".
- Si el hueco de los PDF públicos (ver abajo, "fuera de alcance") es
  aceptable para este beta o si conviene adelantar algo de la Capa 2 del
  paywall.

## Fuera de alcance del beta a propósito (no confundir con pendiente)

- Botones de "Modo lectura" en Manuales, naming poco claro: revisar
  después del beta.
- Panel propio para revisar `evaluacion_reportes`/`respuestas_reportadas`
  (hoy hay que entrar a Supabase directo): definir cuando haya volumen
  real de reportes.
- Paywall Capas 2 (PDF privados con URL firmada) y 3 (pasarela de pago).
  **Ojo:** mientras no esté la Capa 2, los PDF de los manuales son
  públicos por link directo aunque la Capa 1 esté activa. Decisión
  consciente, no un descuido.
- Modo transversal del Interrogador (todas las materias juntas) e
  interrogación oral (voz).
- Justiniano como persona unificadora (interrogación oral + Chat IA +
  ayuda inline + chat de dudas generales en un solo asistente): idea
  definida, nada construido, detalle en `docs/interrogador.md`.
- Cobertura completa (no solo "al techo actual") de Evaluación en todos
  los temas/subtemas, con volumen bastante mayor: meta post-beta, ver
  `.claude/skills/generar-evaluacion/SKILL.md` sección 5.
- Gamificación (`docs/gamificacion.md`): sin priorizar.
- `scripts/sync_airtable_supabase.py` nunca borra en Supabase lo que se
  borra en Airtable: conocido, no bloquea nada mientras no se vuelva a
  borrar contenido ya sincronizado.
