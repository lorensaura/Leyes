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

**Contenido generado, sin publicar todavía (verificado en vivo contra
Airtable/Supabase el 2026-08-13, no solo este doc):** de ~950 registros
entre las 3 materias, **68 (≈7%)** siguen con `publicado=false` o en
estado "Revisar/Verificar" en Airtable (19 Flashcards Contractual, 16
Preguntas_Evaluacion Extracontractual, y el resto repartido entre
Aplicación/Detección de error/Justificación/Discriminación MC de las 3
materias). El resto ya está publicado y sincronizado en Supabase.
Confirmado con Laura (2026-08-13): esos 66 siguen genuinamente
pendientes de que ella los revise, no es que falte solo correr el sync.
Dos ítems puntuales necesitan decisión de Laura antes de publicar:
- `rc-just-028` (excluido de Supabase hoy pese a estar `publicado=true`,
  por su `Revision_status="Revisar"`) y `rc-just-032` (nuevo, sin
  publicar): el manual de Contractual se contradice a sí mismo sobre si
  CLARO SOLAR o ABELIUK defiende "ausencia de culpa basta como eximente"
  (línea ~1117/1134 dice una cosa, línea ~1618-1626/1643 la contraria, en
  `01_Responsabilidad_Contractual_Manual.html`). **2026-08-18: resuelto
  por la auditoría de cobertura** (`docs/auditoria_responsabilidad_contractual_2026-08-18.md`),
  cruzando ambos pasajes contra la fuente que ambos citan (Orrego,
  p.37-38): **la versión correcta es la del eje F** (ABELIUK sostiene que
  basta la ausencia de culpa, CLARO SOLAR exige el caso fortuito); la del
  eje E (línea ~1134) tiene los dos nombres invertidos. Falta que Laura
  confirme y se corrija el HTML (recomendación del audit: alinear el
  recuadro de E.4.3 con el de F.2, o fusionar ambos en uno solo).
- `hist-pre-mc-015` (Precontractual): contenido ya revisado y publicado
  (`Revision_status="Verificado"`), solo le falta el eje/tema asignado,
  genuinamente partido entre el eje B y el J (detalle en
  `docs/fase0_rep_clasificacion_2026-07-31.md`). No bloquea nada.

**Manuales:**
- **2026-08-18: nuevo paso obligatorio en el proceso de manuales**,
  sección 4 de `docs/script_apuntes.md` ("Auditoría de cobertura al
  terminar el manual"). Surgió porque Laura encontró a mano, revisando
  una pregunta de Airtable, dos temas reales de las fuentes (presunción
  de culpa grave en Boetsch p.75, y el debate sobre qué estatuto rige las
  obligaciones legales/cuasicontractuales en Orrego p.60) ausentes del
  manual de Contractual, algo que el chequeo de fidelidad tramo a tramo
  ya existente (sección 1.6) no podía detectar por construcción (mide
  fidelidad a la fuente usada, no si esa era la única fuente relevante).
  Ambos puntos ya están **agregados al manual de Contractual**
  (`01_Responsabilidad_Contractual_Manual.html`), verificados contra las
  fuentes, balance de etiquetas y cero guiones largos. Se abrió además
  `docs/auditoria_responsabilidad_contractual_2026-08-18.md` (mismo
  formato que la de Acto Jurídico), **completada el mismo día para los 8
  ejes** (7 con verificación de alta confianza, el eje D por muestreo
  dirigido, no lectura íntegra). Encontró, en total, **3 hallazgos más
  sin corregir todavía**: **el más importante, resuelve una contradicción
  interna que ya estaba anotada como pendiente más arriba** (Claro
  Solar/Abeliuk invertidos entre los ejes E y F, ver arriba); un
  argumento de Aedo mal ubicado en el eje H en vez del A; un debate
  doctrinal completo sobre la mora del acreedor, ausente del eje E. Fuera
  de esos 3 puntos, el manual resultó de **fidelidad muy alta** frente a
  sus 5 fuentes, sin contenido inventado en ningún tramo. El PDF de
  Contractual (`app/pdf/Responsabilidad_Contractual.pdf`) quedó
  desactualizado frente a los arreglos ya aplicados, no se regeneró a
  propósito (mismo criterio que Acto Jurídico, ver más abajo).
- Los 25 ejes de REX reformateados (2026-08-12) siguen **pendientes de
  revisión de Laura**, como todo el contenido jurídico de los manuales.
  Detalle de qué se agregó en cada eje en `docs/notas_reformato_rex.md`.
- Índice de los 3 manuales publicados: falta que liste también los
  subtemas de nivel 2 (`h3`, "N.M"), no solo los ejes. Pedido de Laura,
  2026-07-31. **2026-08-13: hecho en Extracontractual** (índice anidado
  letra/número/sub-número, ver `docs/pdf.md`); **falta todavía en
  Contractual y Precontractual** (mismo patrón, se puede repetir el mismo
  proceso). De paso se encontró y corrigió en REX un bug de página en
  blanco en el PDF (doble salto de página entre índice y materia) que
  **sigue presente en los otros 2 manuales** (`01_...Contractual...html` y
  `03_...Precontractual...html` tienen la misma regla
  `.toc{page-break-after:always}` que lo causa) — corregir junto con el
  índice anidado cuando se retome.
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
- **2026-08-12: manual de Acto Jurídico (`04_Acto_Juridico_Manual.html`)
  terminado y su PDF generado** (`app/pdf/Acto_Juridico.pdf`, 21 ejes A-U),
  a partir del libro completo de Boetsch más 3 fuentes secundarias (Bozzo
  e Ibarra, Causa Domínguez y Boetsch, cuadro comparativo de ineficacia).
  **Actualizado 2026-08-19: además auditado y reparado por completo**, en
  tres pasadas sucesivas, en la rama `worktree-auditoria-acto-juridico`
  (detalle en `docs/incidente_compresion_manuales.md`, sección "Fase 1").
  PDF regenerado (134 páginas). El conflicto de merge con `main` ya se
  resolvió y se pusheó: la rama fusiona limpio. Verificado (tags,
  densidad, sin guiones largos, sin ids duplicados) y **pendiente de que
  Laura mergee la rama a `main` desde GitHub Desktop y revise el
  contenido**. Todavía **no está enlazado en `app/manuales.html`**: falta
  agregarle su objeto `civil_N` (título, `sourceFile`, `pdfFile`,
  `cpInsertBefore` por eje, y los checkpoints de comprensión lectora con
  keywords, uno por eje, al estilo de los otros 3 manuales) una vez que
  Laura dé el visto bueno al contenido.

**Producto / app:**
- **2026-08-13/14: tabla `practica_intentos` creada y corrida en
  Supabase por Laura**, mismo patrón que `memorice_intentos`: un
  registro por cada intento de Evaluación/Alternativas, log de solo
  inserción. Conectada en `app/alternativas.html`
  (`registrarIntentoPractica`, junto a `registrarError` en los 3 puntos
  donde se resuelve una pregunta).
- **2026-08-14: dashboard conectado a datos reales**
  (`app/dashboard.html`, función `cargarStatsDashboard`). Lee
  `practica_intentos` + `memorice_intentos` + `flashcard_progreso` y
  muestra dos tarjetas nuevas cuando hay actividad histórica: "% de
  acierto hoy" (promedio ponderado de los 4 modelos, huso de Chile) y
  "racha" (días consecutivos con al menos un intento en cualquier
  modelo, definición acordada con Laura). Reemplaza el placeholder "sin
  datos" y la racha mockeada (antes fija en 5) cuando corresponde.
  **Limitación conocida:** `flashcard_progreso` es upsert por tarjeta
  (guarda solo la última revisión, no un historial completo), así que
  puede subestimar días viejos de racha si las mismas tarjetas se
  repasaron varias veces sin tocar tarjetas nuevas. Verificado en
  Chrome headless (Supabase bloqueado e interceptado vía CDP, 3
  escenarios: con actividad hoy y racha de 3 días, sin actividad nunca,
  y con racha viva pero sin intentos hoy): los 3 dan los números y la
  visibilidad de tarjetas esperados, cero excepciones de JS. Falta
  todavía la verificación visual real con una alumna beta (colores,
  layout en mobile).
- **2026-08-14: dropdown "Modelo" de Práctica en iPhone Safari,
  resuelto y confirmado por Laura.** Dos arreglos fallidos
  (`stopPropagation` sobre el menú custom) antes de reemplazar el menú
  propio de Materia/Modelo/Subtipo/Área/Método por un `<select>` nativo
  por filtro (función `ddCell` en `app/alternativas.html`): el picker de
  iOS/Android maneja abrir/cerrar y el toque de cada opción, ese bug de
  raíz deja de ser posible. El control cerrado mantiene el mismo diseño
  (box y flecha) vía `appearance:none`; la lista abierta la dibuja el
  sistema operativo. **Laura confirmó que ya funciona en su iPhone.**
- **2026-08-14: racha de Práctica corregida (bug real, no de UX).** Al
  conectar la racha real del status-row de Práctica (antes mockeada en
  5) se duplicó la lógica de `app/dashboard.html` pero sin el filtro de
  `abandono` en `memorice_intentos` -- una sesión de Memorice cerrada a
  medias contaba como "día con actividad". Laura reportó una racha de 2
  que no se condecía con lo que había hecho; confirmado contra sus
  datos reales en Supabase (fila del 13-08 con `abandono=true`) y
  corregido: con el filtro, sus datos dan racha=1, verificado
  reproduciendo el cálculo con sus filas reales antes de subir el fix.
- Reconectar el link "Progreso" del menú con la sección de progreso del
  dashboard (se perdió al unificar el menú global).
- Agrupar el cuaderno de errores por tipo de pregunta (hoy es una lista
  plana por fecha).
- Correo `admin@digesto.cl`: falta que Laura cree la cuenta de Google
  Workspace (necesita su método de pago); después se agregan los DNS en
  Vercel.
- Memoria entre sesiones del Interrogador: código fusionado a `main`
  (commit `4d80743`) y SQL corrido en producción (verificado en vivo
  2026-08-14: existe `interrogador_memoria`, y `interrogaciones_diarias`
  ya tiene `materia`/`historial`). El doc decía que faltaba esto, estaba
  desactualizado. **Lo que sí sigue pendiente**, según
  `docs/interrogador.md`: probarla con una interrogación real (gasto
  real) en dos sesiones seguidas de la misma materia, para confirmar que
  la comisión varía las preguntas y prioriza los temas débiles -- solo
  verificado con datos simulados hasta ahora.
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
