# Camino al beta de Digesto

> Este doc existe para no perder de vista, entre sesión y sesión, qué
> está hecho, qué falta hacer y qué falta decidir antes de invitar
> alumnas beta. Se actualiza in place cada sesión (no se acumula una
> entrada por fecha): si algo de acá se resuelve, se mueve o se borra,
> no se deja duplicado. Los ítems ya resueltos se borran del todo (no
> se dejan tachados) apenas se cierran — quedan igual en el historial
> de git si hace falta recuperarlos. Última actualización: 2026-08-06.

## Hecho

- **Los 3 manuales publicados** (Contractual, Extracontractual,
  Precontractual): código + doctrina + jurisprudencia, con el formato
  definido (jerarquía A/1/1.1/a)/(i), recuadros pedagógicos, sin guiones
  largos).
- **Contenido migrado de Airtable a Supabase** para producción
  (Flashcards, Preguntas_Evaluacion, Evaluación). Airtable sigue siendo
  donde Laura edita, Supabase es lo que sirve la app.
- **Módulo Práctica unificado** (`app/alternativas.html`): Evaluación,
  Flashcards, Alternativas y Memorice en una sola pantalla, con
  repetición espaciada en Flashcards.
- **Interrogador IA v1** en producción (texto, `app/interrogador.html` +
  `api/interrogador.js`), alcance Contractual + Extracontractual +
  Precontractual. Grounding de 4 bloques (reglas, manuales completos,
  artículos de código, muestra real de preguntas), se regenera solo en
  cada deploy.
- **Login con Supabase** funcionando.
- **Evaluación migrada de código a Airtable/Supabase**: las 4 tablas por
  materia (Aplicación/Detección de error/Justificación/Discriminación
  MC) sincronizan a `evaluacion_practica`. `app/alternativas.html` ya no
  usa el `const banco` hardcoded.
- **Estructura de Airtable por materia entendida y saneada** (ver skill
  `.claude/skills/generar-evaluacion/SKILL.md` sección 0 y memoria
  `project_arquitectura_airtable_por_materia`): `Preguntas_Evaluacion`
  (banco de examen real, grounding del Interrogador) es distinto de las
  4 tablas de Evaluación (contenido real de Práctica). Las tablas viejas
  `Opciones_MC`/`Elementos_Clave` (diseño anterior, ya no las lee nada)
  se borraron en las 3 bases (verificado 2026-07-29 vía Airtable API:
  Precontractual, la última que faltaba, ya no las tiene).
- **Flashcards y Evaluación con volumen y proceso mejorado** (skill
  `generar-evaluacion`): tabla de cobertura tema×modelo, chequeo
  obligatorio de sesgo de posición en Discriminación MC/Alternativas, y
  reuso de `Preguntas_Evaluacion` como fuente cuando ya tiene contenido
  completo (34 ítems de Discriminación MC migrados así, con `codigo`
  prefijo `hist-`).
- **Paywall, Capa 1** (2026-08-04): lista blanca en Supabase
  (`alumnas_autorizadas`, Laura la administra a mano desde Table Editor)
  + registro cerrado en dos capas: `api/auth-registro.js` chequea la
  lista antes de mandar el OTP, y `hook_verificar_lista_blanca`
  (`scripts/supabase_schema_hook_lista_blanca.sql`) corre dentro de
  Supabase mismo en "Before User Created" para que un bypass directo a
  la API de Supabase (saltándose `auth-registro.js`) también quede
  bloqueado. Probado en producción: bypass directo → 403, registro
  normal con correo autorizado → sigue funcionando. Detalle en
  `docs/paywall.md`.
- **Dashboard de Inicio y panel de Práctica rediseñados** (2026-08-05,
  commits `a2a10f4`, `ab30be6`): banner de inicio, progreso, tarjeta de
  Justiniano (bloqueada, "próximamente") y Chat IA sumados a "Continuar
  estudiando"; nuevo grid de filtros y menú móvil en Práctica. De paso
  se corrigió que las tarjetas "preguntas respondidas" / "% acierto hoy"
  / "posición en liga" mostraban 0 o guion como si fueran datos reales:
  ahora dicen honestamente "Sin datos" (no se construyó la tabla de
  persistencia que falta, ver más abajo, solo se dejó de simular un dato
  que no existe).
- **Interrogador actualizado (2026-08-06, commit `1323d86`)**: cambios en
  el prompt, el router y el checklist de anclas, más ajustes en
  `app/interrogador.html`. `docs/interrogador.md` ya quedó al día en el
  mismo commit, no hace falta resumirlo acá.
- **Paleta de Práctica alineada con el dashboard de Inicio (2026-08-06,
  commit `2ecfa07`, pusheado)**: el sidebar de `app/alternativas.html`
  había quedado como tarjeta flotante con esquinas redondeadas y una
  paleta propia (tonos del handoff de Claude Design del rediseño de
  Práctica), distinta del sidebar negro a todo el borde que usa
  `app/dashboard.html`. Se igualaron los tokens de color y la forma del
  sidebar (sin padding exterior, sin bordes redondeados, mismo ancho) a
  los reales del dashboard. Verificado visualmente con Chrome headless
  (stub de Supabase para saltar el login). Cierra la inconsistencia
  visual entre Inicio y Práctica que quedaba pendiente desde el rediseño
  de Práctica del día anterior.
- **Cuaderno de errores (2026-08-06), completo y confirmado en producción.**
  Laura pidió adelantarlo del backlog para tenerlo antes del beta. Alcance:
  Alternativas y Evaluación (recuperación libre + Discriminación MC); la
  detección de imprecisión conceptual vía IA en el Interrogador sigue
  post-beta. Tabla nueva `practica_errores` en Supabase (RLS, cada alumna
  ve solo lo suyo) creada por Laura vía `scripts/supabase_schema_practica_errores.sql`
  y confirmada viva (200 OK contra la API real, 2026-08-06). En
  `app/alternativas.html`: "Errores" es un Modelo más (Eje 2), reutiliza
  el filtro de Materia existente; el nav-item "Repaso de errores" de la
  barra lateral (antes `href="#"` muerto con contador mock, que Laura
  ya había notado) ahora abre esa vista con el contador real.
  Autolimpiable: falla una pregunta → se guarda; la responde bien después
  → se borra sola; también hay botón "Ya lo repasé" para sacarla a mano.
  Verificado en Chrome headless (stub de Supabase, los 3 puntos de
  calificación escriben/borran con los campos correctos, cero excepciones
  de JS) antes de correr el SQL, y contra la API real después.

## Pendiente antes de invitar alumnas beta (ya está claro qué hacer)

Esto es lo que ya quedó definido como condición previa a mandar la app a
las alumnas tester (`docs/paywall.md`, memoria `digesto_landing_page_before_beta`):

- **Landing page (`index.html`)**: reescrita en 3 pasadas el 2026-08-05
  (commits `17c44e4`, `f0dfbe7`, `03ff37f`), en un worktree aparte
  (`worktree-landing-page-mejora`) que corrió en paralelo a la sesión de
  REX de ese mismo día. **Ya está fusionada y pusheada a GitHub**
  (verificado 2026-08-06: `main` local está al día con `origin/main`).
  Verificada visualmente en Chrome headless (desktop y mobile) y
  confirmada por Laura ("ok perfecto") en el chat. Contenido tomado del
  análisis de mejoras que Laura mandó (hecho con Claude Design), pero
  con la paleta y tipografía reales de Digesto, no las de ese mockup.
  Quedan 2 cosas puntuales sin resolver, verificadas en vivo contra el
  archivo el 2026-08-06:
  1. **Sección "Sobre el examen" sigue comentada** (nunca se publicó):
     falta que Laura mande el contenido real de Formato / Duración / Qué
     se evalúa.
  2. **Precios siguen en "Por definir"** en las 3 tarjetas de la sección
     Precios.
  **Formulario de contacto: arreglado (2026-08-06).** El endpoint
  (`api/contacto.js`) y el formulario ya estaban bien armados; solo le
  faltaban las columnas "Nombre" y "Mensaje" en la tabla `WAITLIST` de
  Airtable (`appjP6jK8Jbm5uaeG` / `tblXj3d2lcufAD0KX`, la misma que usa
  el waitlist). Se crearon vía API de Airtable, no hizo falta tocar
  código. Falta solo que alguien lo pruebe end-to-end desde la landing
  en producción para confirmar visualmente.
- **Ojo con esto: la Capa 1 sola no cierra el contenido.** Hoy los PDF
  de los manuales (`digesto.cl/app/pdf/...`) son archivos públicos que
  abren sin login; compartir ese link se salta el paywall entero, lista
  blanca incluida. Cerrar esto es la Capa 2 (bucket privado + URLs
  firmadas, ver más abajo en "fuera de alcance"), que según `docs/paywall.md`
  está pensada para antes de cobrar, no necesariamente para el beta
  inicial con alumnas de confianza. Que quede claro: si se activa solo la
  Capa 1, los manuales siguen siendo copiables por link directo, es una
  decisión consciente, no un descuido si aparece.

## Funcionalidades nuevas decididas (2026-08-06), listas para construir de a poco

Laura pidió tratar esto como backlog: no se construye todo junto, se retoma
un ítem por sesión cuando ella lo pida.

- **Correo `admin@digesto.cl`**: hoy el dominio no tiene ningún correo
  configurado (sin registros MX). Recomendado: Google Workspace (~US$7/mes),
  porque Laura necesita poder **responder** desde esa dirección, no solo
  recibir (una redirección gratis tipo ImprovMX no alcanza para eso). Falta
  que Laura cree la cuenta de Workspace (necesita su método de pago); una
  vez creada, agregar los registros DNS que entrega Google en el panel de
  Vercel (Laura lo puede hacer sola siguiendo la guía, o darme acceso a
  Vercel para que lo haga yo).
- **Cuaderno de errores: adelantado y construido (2026-08-06), ver
  "Pendiente antes de invitar alumnas beta" más arriba.** Laura pidió
  tenerlo listo antes del beta, dejó de ser backlog. La detección de
  imprecisión conceptual vía IA en el Interrogador (parte 4 de la idea
  original) sigue pospuesta para después del beta.
- **JUSTINIANO, chat de dudas de materia (idea nueva, 2026-08-06, ojo con la
  ortografía: JUSTINIANO, no Justinián)**: un chat lateral (no el Chat IA de
  dudas generales) para resolver una duda puntual sobre una pregunta sin
  salir del flujo de Práctica. Diseño de Laura: **una sola materia a la vez**
  (así el contexto queda acotado) — Haiku 4.5 barato busca los fragmentos del
  manual relevantes a la duda puntual (mismo patrón de "router" que ya usa el
  Interrogador), y Sonnet 5 arma la respuesta con esos fragmentos. Nada
  construido todavía.

## Pendiente: contenido y tareas sueltas (ya identificado, falta ejecutar)

- **Hallazgo (2026-08-05): no existe tabla que guarde las respuestas de
  Alternativas/Evaluación por alumna.** Solo Memorice
  (`memorice_intentos`/`memorice_progreso`) y Flashcards
  (`flashcard_progreso`) tienen persistencia de intentos por usuaria;
  `evaluacion_practica` y `alternativas` solo se leen, nunca se escribe
  un registro de "esto respondió esta alumna y le fue bien/mal". Por eso
  las tarjetas "preguntas respondidas" y "% acierto hoy" del dashboard
  (`app/dashboard.html`) quedan en "sin datos" en vez de mostrar un
  número real. Laura decidió (2026-08-05) dejarlo pendiente por ahora en
  vez de construir la tabla ya mismo — retomar como tarea aparte cuando
  lo pida. **Ojo, esto sigue sin resolver pese al cuaderno de errores
  del 2026-08-06**: `practica_errores` solo guarda las preguntas que
  falló (para el repaso), no cada intento con su resultado -- no sirve
  como fuente para "preguntas respondidas" ni "% acierto hoy", que
  necesitan el universo completo de intentos, no solo los fallidos.

- **Pedido de Laura, 2026-08-06, revisando el cuaderno de errores en vivo:**
  1. **HECHO.** Sacar el código interno del ítem (ej. `rc-aplic-014`) de
     la tarjeta de pregunta de Evaluación — no le sirve de nada a la
     alumna, era ruido. Se sacó el `<span class="item-num">` y su CSS en
     `app/alternativas.html` (`renderItemEvaluacion`). El código sigue
     existiendo internamente (`item.codigo`), solo dejó de mostrarse.
  2. **Pendiente: conectar la "racha" real** (`status-streak` en la fila
     de estado de Práctica, hoy `MOCK_STATS.streak` fijo en 5) al número
     real de preguntas respondidas bien. Es el mismo hueco que el punto
     de arriba: hace falta la tabla de intentos completos (no solo
     fallidos) para saber cuántas respondió y con qué resultado — no se
     puede resolver solo con `practica_errores`. Cuando se retome, definir
     con Laura qué cuenta como "racha" (¿aciertos seguidos sin fallar?
     ¿días seguidos con actividad?) antes de diseñar la tabla.

- **"Reportar calificación mal hecha" en Evaluación — HECHO (2026-08-04)
  y en producción.** La corrección de Evaluación es por keywords en JS
  (`evaluarRespuesta()`, `app/alternativas.html`), sin LLM, así que no
  entiende sinónimos ni paráfrasis. Botón en el panel de feedback que
  inserta en `evaluacion_reportes` (tabla ya corrida en Supabase) el
  contexto de la corrección. Verificado en Chrome headless.
- **`evaluacion_practica.minimo_elementos` (columna + los 63 `UPDATE` de
  clasificación de eje pendientes desde julio) — corridos el 2026-08-04.**
  Verificado en vivo: los 4 ítems mal clasificados de REX, los 59 de
  Fase 0 de Precontractual (queda solo `hist-pre-mc-015` sin eje, a
  propósito — Laura no decidió aún entre eje B o J) y `rc-just-001`
  (movido a Extracontractual, 9 diferencias + `minimo_elementos: 3`, y
  ya reflejado también en Airtable, no solo en Supabase) quedaron bien.
  **`ext-alt-002` sí se borró. `rc-detect-001` (la fila corrupta de
  Contractual) también borrada, recién (2026-08-04): confirmado que el
  registro original en Airtable ya no existía (Laura lo había borrado el
  2026-07-31 junto con el eje fantasma), así que el borrado en Supabase
  cierra el hallazgo del todo, no queda nada suelto en Airtable.**
- **4 candidatos de "N de M posibles" revisados y descartados
  (2026-08-04)**: `cont-just-001`, `pre-aplic-001`, `rc-aplic-010`,
  `re-just-012`. Los cuatro resultaron ser como `rc-just-011`: el
  enunciado pide un número puntual de elementos, pero ese número es un
  conjunto cerrado y taxativo según el manual (verificado línea por
  línea contra `01_...Contractual...html` y
  `02_...Extracontractual...html`), no una selección entre varias
  opciones válidas intercambiables. Detalle por ítem:
  - `cont-just-001` (culpa grave = dolo): pide "el fundamento y dos
    consecuencias"; el manual solo reconoce esas dos consecuencias
    (arts. 1558 y 1465), no hay una tercera.
  - `pre-aplic-001` (elementos copulativos de resp. precontractual): los
    4 ítems de la pauta son hechos puntuales del caso concreto, no
    alternativas intercambiables.
  - `re-just-012` (reparación integral): pide "dos consecuencias y su
    límite"; el manual da exactamente esas dos consecuencias y ese
    límite como contenido canónico, conjunto cerrado.
  - `rc-aplic-010` (caso fortuito): pide "los tres requisitos", la pauta
    tiene 4 (los 3 + carga de la prueba), pero el manual mismo instruye
    agregar la carga de la prueba como cuarto elemento obligatorio
    (recuadro pedagógico, "estructura de cuatro trazos"). Además,
    `evaluarRespuesta()` ya da crédito proporcional sin
    `minimo_elementos`, así que cubrir 3 de 4 ya alcanza el 75% del
    umbral de "avanzar".
  **Ninguno de los 4 recibió `minimo_elementos`.** Laura confirmó dejarlo
  así. No queda ningún candidato de esta tanda sin resolver.
  **Nota (2026-08-04):** las 43 preguntas nuevas de Evaluación de
  Contractual generadas en la tanda de Fases A-D (ver más abajo) ya están
  aprobadas, `publicado` en Airtable, y sincronizadas en Supabase (SQL
  corrido por Laura).
- **Normalizar el campo `materia` de las 53 preguntas nuevas de
  Contractual**: quedaron con `materia = "Responsabilidad contractual"`,
  mientras las preguntas viejas de `Preguntas_Evaluacion` tienen ahí
  `"civil"` (genérico). No afecta nada hoy (el Interrogador filtra por
  `tema_texto`, no por `materia`), es cosmético, pendiente de que Laura
  decida si vale la pena.
- **Linkear a `Temas` el contenido viejo sin linkear**: Preguntas_Evaluacion
  de Contractual y Precontractual, y las 4 tablas de Evaluación en
  Contractual y Precontractual (Extracontractual ya se hizo el
  2026-07-30, ver debajo). No urgente, se va completando materia por
  materia. Detalle en `docs/contenido-airtable-supabase.md`.
- **Plan "llevar Evaluación a su techo por tema/subtema" (REX → REC →
  REP). Extracontractual: Fase 0, Fase 1 y el refuerzo de ejes 15/21
  cerrados (2026-07-30).** Fase 0: los 119 ítems de `evaluacion_practica`
  quedaron clasificados y linkeados a los 25 ejes reales de `Temas`
  (matching automático + revisión manual, aprobado por Laura). Fase 1:
  tabla de cobertura completa (Evaluación + Flashcards + Alternativas) en
  `docs/cobertura_subtema_rex_2026-07-30.md`, que detectó que el borrador
  de 2026-07-27 (`docs/preguntas_pendientes_ejes_debiles_2026-07.md`)
  seguía teniendo 10 ítems sin subir para los ejes 15 y 21 (los otros 3
  ejes del mismo borrador, 11/18/25, ya estaban cubiertos por contenido
  subido por separado). Laura revisó y aprobó 9 de esos 10 (los 5 de eje
  15 y 4 de los 5 de eje 21) el 2026-07-30; se subieron a Airtable
  (`re-just-028` a `re-just-032`, `re-aplic-028`/`029`, `re-detect-030`,
  `re-mc-031`) y se corrió el sync — Evaluación de Extracontractual pasó
  de 119 a 128 ítems. Extracontractual ya no tiene ejes de Evaluación con
  1 solo ítem. La novena, "Discriminación MC — legitimación pasiva del
  autor" de eje 21 (ambigüedad real entre las opciones C y D, ambas
  defendibles como "no comprendida en la solidaridad del art. 2317"),
  **Laura la descartó (2026-07-30)**: eje 21 quedó con 4 ítems nuevos, no
  5. Para el **eje 1**, Laura pidió subir directo (2026-07-30) los 3
  ítems del borrador (`docs/preguntas_pendientes_eje1_2026-07-30.md`):
  ya están en Airtable y sincronizados (`re-aplic-030`, `re-detect-031`,
  `re-mc-032`, linkeados a `Temas` → eje 1). Extracontractual pasó de 128
  a 131 ítems de Evaluación. **Ojo: la revisión de fondo del contenido
  jurídico (citas, atribuciones, redacción) sigue pendiente** — subir a
  Airtable no la reemplazó, solo se saltó el paso previo de que Laura lo
  leyera antes de subir.
  **REX queda así con Fase 0 y Fase 1 cerradas (2026-07-31): no existe una
  "Fase 2" definida en ningún doc — el plan solo tenía esas dos fases.
  "Llevar Evaluación a su techo" en los 25 ejes (no solo cerrar los 3 que
  tenían 1 solo ítem) es la meta post-beta de la sección 5 del skill
  `generar-evaluacion`, no algo para ejecutar ahora salvo que Laura lo
  pida explícitamente con volumen.** Quedan 3 cosas sueltas de REX antes
  de pasar a Contractual/Precontractual:
  1. **4 ítems mal clasificados de eje, detectados el 2026-07-30 y
     confirmados el 2026-07-31 contra el manual**: `re-detect-008`
     (sonambulismo/demencia, art. 2319) está en eje 18 y debería estar en
     eje 5 (capacidad delictual); `re-detect-010` (crítica de Barros al
     término "subjetiva") está en eje 25 y debería estar en eje 8
     (culpabilidad); `re-aplic-011` y `re-detect-012` (pérdida de chance)
     están en eje 11 y deberían estar en eje 10 (el manual desarrolla la
     chance como parte del requisito de que el daño sea "cierto", líneas
     1195-1257). Statements en la lista consolidada de SQL más abajo
     (punto 2), no repetidos acá.
  2. `ext-alt-029` ("reserva de perjuicios"): no aparece esa frase en el
     manual (es jurisprudencia sobre tramitación, no doctrina del
     apunte), pero temáticamente encaja en el eje 22 (Tribunal,
     procedimiento y extinción de la acción). Alternativas no tiene
     columna `tema` en Supabase, así que esto es solo una corrección de
     clasificación en `docs/cobertura_subtema_rex_2026-07-30.md`, no un
     `UPDATE`.
  3. **Revisión de fondo pendiente de los 12 ítems subidos el
     2026-07-30** (los 9 de ejes 15/21 + los 3 de eje 1): nadie los leyó
     todavía contra el manual (citas, atribuciones, redacción), a
     diferencia de los `hist-` que sí se auditaron. Distinto de la
     revisión de jurisprudencia y de artículos que Laura ya hizo esta
     semana (esas fueron sobre el manual, no sobre estos 12 ítems
     nuevos). Falta que Laura decida si los lee ella o si pide una
     auditoría de Claude contra el manual, como se hizo con los `hist-`.
- **Hallazgo 2026-07-31: fila corrupta y publicada en producción,
  `rc-detect-001`** (Contractual, tipo Detección de error). Todos sus
  campos (`caso`, `enunciado`, `respuesta_modelo`, `subtema`,
  `articulos_referencia`, `objetivo_pedagogico`, y el propio `tema`)
  contienen literalmente el texto `"rc-detect-001"` en vez de contenido
  real, y `publicado = true` — una alumna que practique Detección de
  error en Contractual puede toparse con esto hoy mismo. **El eje
  fantasma que este mismo bug había creado en la tabla `Temas` de
  Airtable ya lo borró Laura (2026-07-31).** Falta todavía borrar la fila
  en sí de `evaluacion_practica` en Supabase (statement en la lista
  consolidada más abajo) o investigar si el contenido real se perdió en
  algún punto de la sincronización y hay que regenerarlo.
- **Fase 0 de Contractual (REC) hecha (2026-07-31)**, vía agente en
  background: `docs/fase0_rec_clasificacion_2026-07-31.md`. De 42 ítems
  sin eje, 40 quedaron clasificados con confianza (statements en ese
  doc). Los otros 2 resultaron no ser de materia Contractual: `rc-aplic-002`
  y `rc-just-001` se mueven a Extracontractual (ver la lista consolidada
  más abajo y `docs/fix_justificacion_menciona_n_de_m_2026-07-31.md`).
  Hallazgo aparte: el manual de Contractual no está organizado en ejes
  planos como el de Extracontractual (son 8 secciones A-H con
  sub-numeración que reinicia en cada una); el catálogo real de 21 ejes
  vive en la tabla `Temas` de Airtable, no en los títulos del manual. 3 de
  esos 21 ejes (2 "El pago", 11 "La teoría de los riesgos", 21
  "Prescripción de las acciones") no tienen ninguna sección propia en el
  manual actual, así que no es solo un hueco de contenido de Evaluación
  por escribir (no hay ni sección del manual que las respalde). Queda para
  cuando Laura revise el manual de Contractual: decidir si esos 3 temas
  necesitan su propia sección nueva, o si estará bien que sigan viviendo
  mencionados de paso dentro de sus vecinos (ej. el pago dentro de la
  acción de cumplimiento).
- **Bug de calificación real, encontrado por Laura practicando
  (2026-07-31): preguntas "menciona N de M posibles" (M > N) calificaban
  mal.** Si una pregunta de Justificación pide, por ejemplo, "menciona 3
  diferencias" pero el manual ofrece 9 válidas, y el ítem solo tenía
  `elementos_clave` para las 3 que se le ocurrieron a quien lo redactó,
  una alumna que nombrara 3 diferencias distintas y correctas quedaba
  calificada mal. **Arreglado:** `app/alternativas.html` ahora soporta un
  campo `minimo_elementos` (retrocompatible, no afecta ítems que no lo
  tengan). Regla nueva agregada a
  `docs/prompt-generacion-contenido-practica.md` sección 0.25 para
  content nuevo. Detalle completo, y los 2 ítems ya corregidos con este
  mecanismo (`rc-just-001`, que además se recategoriza a Extracontractual,
  y `rc-just-009`, que se queda en Contractual) en
  `docs/fix_justificacion_menciona_n_de_m_2026-07-31.md`. Statements en
  la lista consolidada de abajo.
- **Contractual: 9/51 ítems de Evaluación ya estaban linkeados a `Temas`
  antes de la Fase 0 de arriba** (incluida la fila corrupta, que contaba
  como "linkeada" sin ser contenido real). Con la Fase 0 ya hecha, quedan
  48/51 reales (2 se van a Extracontractual). Ver
  `docs/contenido-airtable-supabase.md` para la tabla actualizada
  (pendiente de refrescar con estos números después de correr los
  `UPDATE`).
- **Fase 1 de Contractual (REC) hecha (2026-07-31)**, vía agente en
  background: `docs/cobertura_subtema_rec_2026-07-31.md` (tabla de los 21
  ejes × Aplic/DetE/Just/DiscMC/Flashcards/Alternativas). **Hallazgo
  grave: las 225 Flashcards de Contractual están concentradas en solo 2
  de los 21 ejes** (200 en eje 6 "La culpa contractual y su graduación",
  25 en eje 1), los otros 19 ejes en cero — verificado que es así de
  verdad en Airtable (no un bug de sync). Dentro del bucket del eje 6,
  una revisión por palabra clave encontró que **~30 de esas 200 tarjetas
  (15%) parecen ser en realidad de eje 4 (obligaciones de medio/resultado)
  u 8 (presunción de culpa)**, con los IDs exactos listados en el doc —
  hipótesis con evidencia, no reclasificado todavía. Laura decide si
  amerita una pasada de reetiquetado y si conviene generar Flashcards
  nuevas para los 19 ejes en cero. Confirma además que los ejes 5 y 13
  del hallazgo de la Fase 0 son huecos reales de contenido (no
  estructurales como 2/11/21).
- **Fase 0 de Precontractual (REP) hecha (2026-07-31)**, vía agente en
  background: `docs/fase0_rep_clasificacion_2026-07-31.md`. De 60 ítems
  de Evaluación (todos partían sin eje), 59 quedaron clasificados con
  confianza (statements en ese doc, en la lista consolidada de abajo).
  Solo `hist-pre-mc-015` ("recepción de Ihering en el BGB alemán") queda
  sin resolver, genuinamente partido entre el eje B y el eje J, con la
  evidencia de ambos lados expuesta en el doc para que Laura decida. A
  diferencia de Contractual, acá **el manual sí calza 1:1 con el catálogo
  de 10 ejes (A-J) de Airtable** — pero ojo, el índice del manual usa
  títulos acortados para 3 ejes (C, F, J) que no coinciden con el título
  real ni con Airtable; los `UPDATE` se generaron por script contra la
  API de Airtable, no copiados del índice, para no romper el próximo
  sync. Precontractual queda con cobertura de Evaluación en los 10 ejes
  (ninguno en cero) una vez corridos esos 59 `UPDATE`.
- **Fase 1 de Precontractual (REP) hecha (2026-07-31)**, vía agente en
  background: `docs/cobertura_subtema_rep_2026-07-31.md`. **Buena
  noticia, a diferencia de Contractual: Precontractual llega parejísima,
  sin ejes en cero ni concentración anómala** — 9 de los 10 ejes en 6
  ítems de Evaluación (solo B en 5, por `hist-pre-mc-015` sin resolver),
  las 59 Flashcards repartidas 5-6 por eje, las 47 Alternativas en 4-5
  por eje. **No hay ejes débiles que ameriten generar contenido nuevo acá
  por ahora.** Con esto, REX, REC y REP quedan con Fase 0 y Fase 1
  completas.

## SQL urgente pendiente de correr en Supabase

Toda la tanda de julio (columna `minimo_elementos`, los 4 de REX, los 40
de Fase 0 Contractual, `rc-aplic-002`/`rc-just-001`/`rc-just-009`, los 59
de Fase 0 Precontractual, `ext-alt-002`, y la fila corrupta
`rc-detect-001`) **ya se corrió y se verificó en vivo, la última pieza
(`rc-detect-001`) recién el 2026-08-04.** No queda ningún SQL pendiente
de esta tanda.

## Pendiente: contenido y tareas sueltas (continuación)

- **Corregido 2026-07-31: Contractual ya tiene 225 Flashcards publicadas
  y 100% linkeadas a `Temas`** (verificado en vivo contra Supabase; este
  doc decía "está vacía" y `docs/contenido-airtable-supabase.md` decía
  "0/0" para Precontractual, ambos desactualizados — Precontractual
  también tiene ya 59 publicadas y linkeadas). Sigue pendiente **cruzar
  los 9 lotes de Contractual** (+ el lote transversal) de
  `docs/flashcards_pendientes_2026-07.md` contra esas 225 ya publicadas,
  para ver qué de ese borrador es redundante y qué sigue siendo un hueco
  real, mismo proceso que se hizo con Extracontractual y Precontractual.
- **5 Flashcards nuevas de Contractual para el eje 5** (hueco cero en las
  tres columnas, sin riesgo de redundancia): ya subidas y sincronizadas
  (`docs/flashcards_nuevas_2026-07-31_contractual_eje5.md` queda como
  borrador de referencia, el contenido real ya está en Airtable/Supabase).
- **Fases A-D del mismo proceso, ahora aplicadas a Evaluación (2026-08-04),
  a pedido explícito de Laura**: llevar los 18 ejes reales de Contractual
  (todos salvo 2 y 21) a techo real en las 4 tablas de Evaluación
  (Aplicación, Detección de error, Justificación, Discriminación MC), no
  solo el mínimo de 1 ítem por tipo ya cerrado el 2026-08-01. Se generaron
  y subieron directo a Airtable Contractual (vía API) **43 ítems nuevos**,
  cubriendo 17 de los 18 ejes (eje 10, caso fortuito, se dejó sin tocar
  por ya tener cobertura sólida: 5 ítems, incluidos los 3 requisitos, las
  excepciones y la carga de la prueba). Evaluación de Contractual pasa de
  87 a 130 preguntas en Airtable. Verificado sin redundancia contra lo
  existente (por artículo citado e institución jurídica, no solo por
  eje); un caso real de solape potencial (el debate Claro Solar/Abeliuk
  sobre "ausencia de culpa vs. caso fortuito" encaja tanto en eje 8 como
  en eje 17 según cómo se lea el manual) se resolvió asignándolo solo a
  eje 8 y evitando repetirlo en eje 17. **Chequeo de sesgo de posición en
  Discriminación MC corrido y corregido**: los primeros 4 ítems nuevos
  quedaron por error todos con la correcta en B (se detectó y se
  redistribuyeron antes de seguir); el resto de la tanda se repartió
  deliberadamente en A/C/D, sin agregar ninguna más a B (que ya venía
  sobrecargada de antes: bajó de 52% a 38% del total). Todo quedó con
  `publicado` sin marcar en Airtable, pendiente de la revisión de Laura
  antes de subir a Supabase (mismo flujo que Flashcards: ella revisa,
  aprueba, y se corre el sync).
- **Mismo proceso (Fases A-D) aplicado a Extracontractual (REX), 2026-08-04,
  a pedido explícito de Laura, inmediatamente después de Contractual.**
  Flashcards: **no hizo falta Parte D**, los 25 ejes de REX ya estaban
  parejos (7-12 tarjetas cada uno, sin ceros), a diferencia de Contractual.
  Evaluación: se auditó en vivo contra Supabase y se encontraron **15
  celdas en cero** (un tipo completo sin representar) repartidas en 11
  ejes: eje 2 (detE), eje 3 (aplic), eje 6 (detE+discMC), eje 10 (just),
  eje 11 (just), eje 13 (aplic+discMC), eje 16 (discMC), eje 17
  (just+discMC), eje 18 (discMC), eje 21 (detE+discMC), eje 22
  (just+discMC). Se generaron y subieron **16 ítems nuevos** directo a
  Airtable Extracontractual (vía API), cerrando las 15 celdas (una celda,
  eje 6 discMC, quedó con 1 ítem que además ayudó a balancear el sesgo de
  posición). Evaluación de Extracontractual pasa de 133 a 147 preguntas
  en Airtable. Sesgo de posición en Discriminación MC verificado antes y
  después: quedó muy parejo (A 12, B 10, C 12, D 11 sobre 45 totales).
  **Laura aprobó, marcó `publicado` en Airtable las 43 de Contractual y
  las 16 de REX, y corrió el SQL de sync a Supabase (2026-08-04) —
  ambas materias quedaron con la Evaluación nueva viva en la app**
  (Contractual 130, Extracontractual 149 en `evaluacion_practica`).
  **No se hizo la segunda pasada de volumen extra que sí se hizo en
  Contractual** (llevar cada eje bien más allá del mínimo) — **pendiente
  explícito**: Laura quiere retomarlo para REX cuando lo pida.
- **Segunda pasada de volumen extra en REX, iniciada (2026-08-05), lote 1
  de 2 ítems, pendiente de revisión de Laura.** Antes de generar nada se
  recontó Evaluación de REX en vivo contra Supabase (149 ítems, no 131
  como decía `docs/cobertura_subtema_rex_2026-07-30.md`, que quedó
  desactualizado por la tanda Fases A-D del 2026-08-04 y no se volvió a
  tocar): esa recontada encontró **dos huecos reales que ninguna tanda
  anterior había cerrado**, distintos de los que cerraron las Fases A-D.
  Eje 5 (capacidad delictual) tenía 0 ítems de Justificación (aplic 1,
  detE 2, discMC 1); eje 24 (cúmulo o concurso de responsabilidades)
  tenía 0 de Discriminación MC (aplic 1, detE 2, just 1). Se verificó
  además, contra los datos en vivo, que los 4 ítems mal clasificados de
  eje que `docs/cobertura_subtema_rex_2026-07-30.md` daba como
  "pendientes de que Laura corra el SQL" **ya estaban corregidos**
  (`re-detect-008` en eje 5, `re-detect-010` en eje 8, `re-aplic-011` y
  `re-detect-012` en eje 10) — ese SQL sí se corrió, el doc de cobertura
  simplemente nunca se actualizó para reflejarlo.
  - **`re-just-037`** (eje 5): por qué la responsabilidad del guardián
    del incapaz (art. 2319 inc. 1°) es por hecho propio y no por hecho
    ajeno del art. 2320, con las dos diferencias de régimen que se
    siguen (quiénes son capaces, y quién prueba la negligencia).
  - **`re-mc-040`** (eje 24): caso de un cirujano cuya negligencia es a
    la vez incumplimiento contractual y cuasidelito penal (lesiones
    graves), aplicando la segunda excepción de ALESSANDRI al rechazo
    general del cúmulo (distractor D confunde esta excepción con la
    del pacto expreso, ya cubierta por `re-aplic-025`). Correcta en B;
    la distribución de Discriminación MC en REX queda A12/B11/C12/D11
    una vez sincronizado, sin sesgo de posición.
  Ambos creados directo en Airtable (base `Digesto Extracontractual`,
  `appz8ePbArPV9cbE3`) con `publicado` sin marcar, verificados contra el
  manual (líneas 639-736 y 2302-2362 de
  `02_Responsabilidad_Extracontractual_Manual.html`) y sin redundancia
  con el contenido vivo del mismo eje. **Falta que Laura los revise,
  marque `publicado` en Airtable y corra el sync.**
  **Lote 2 (mismo día), ejes 1 y 6, también sin publicar:**
  - Eje 1: **`re-aplic-033`** (rechazo de la función punitiva, caso de
    un choque intencional donde se pide indemnización superior al daño
    para "sancionar" la conducta) y **`re-detect-035`** (error de
    alumno que confunde el principio de tipicidad penal con el sistema
    civil de cláusulas generales). Eje 1 pasa de 4 a 6 ítems (aplic 2,
    detE 2, just 1, discMC 1).
  - Eje 6: **`re-aplic-034`** (exterioridad del caso fortuito, caso de
    un ciclista que colisiona por esquivar a un peatón imprudente) y
    **`re-just-038`** (por qué expandir la noción de órgano agrava, y
    no beneficia, la responsabilidad de la persona jurídica, arts.
    2320/545). Eje 6 pasa de 4 a 6 ítems (aplic 2, detE 1, just 2,
    discMC 1).
  Ninguno de los 4 es Discriminación MC, así que no alteran la
  distribución de sesgo de posición reportada arriba. Verificados
  contra el manual (líneas 327-389 y 736-815) y sin redundancia con el
  contenido vivo de cada eje. **Igual que el lote 1, pendientes de
  revisión de Laura antes de publicar.**
  **Lote 3 (mismo día), ejes 7 y 11, también sin publicar:**
  - Eje 7 (antijuridicidad y causales de justificación, el eje más largo
    del manual): **`re-mc-041`** (abuso del derecho, caso de un
    arrendador que litiga vejatoriamente, distractores construidos
    sobre las posiciones de RODRÍGUEZ GREZ, ALESSANDRI/DUCCI y BARROS;
    correcta en C) y **`re-aplic-035`** (aceptación de riesgo deportivo
    en un vuelo de parapente, distingue el riesgo aceptado de la propia
    negligencia del prestador por falta de mantención). El eje tenía
    abuso del derecho completamente sin cubrir pese a ser uno de los
    puntos más ricos del manual; eje 7 pasa de 4 a 6 ítems (aplic 2,
    detE 1, just 1, discMC 2).
  - Eje 11 (daño patrimonial): **`re-detect-036`** (excepción del art.
    1559: el daño por mora en el pago de dinero se mide solo por
    intereses corrientes, caso de un abogado que pretende cobrar una
    utilidad específica mayor) y **`re-aplic-036`** (prueba del daño
    emergente futuro y la renta periódica como modalidad de pago, caso
    de una víctima parapléjica). Eje 11 pasa de 4 a 6 ítems (aplic 2,
    detE 2, just 1, discMC 1).
  Distribución de Discriminación MC de REX tras los 2 ítems nuevos de
  este tipo (`re-mc-040`, `re-mc-041`), todavía sin publicar: A12/B11/
  C13/D11, sigue sin sesgo relevante. Verificados contra el manual
  (líneas 821-923 y 1270-1347) y sin redundancia con el contenido vivo
  de cada eje. **Mismo estado que los lotes 1 y 2: pendientes de
  revisión de Laura antes de publicar.**
  **Lote 4 (mismo día), ejes 13 y 16, también sin publicar:**
  - Eje 13 (la causalidad): **`re-aplic-037`** (pluralidad de agentes
    por hechos distintos, dos fábricas que vierten residuos tóxicos de
    forma independiente al mismo río, cada vertido individualmente
    suficiente para el daño, división proporcional en vez de
    solidaridad literal del art. 2317) y **`re-just-039`** (por qué se
    extiende por analogía la presunción del art. 2329 a la prueba de la
    causalidad, no solo de la culpa). Eje 13 pasa de 4 a 6 ítems (aplic
    2, detE 1, just 2, discMC 1).
  - Eje 16 (hecho de las cosas: animales, ruina, objetos que caen):
    **`re-aplic-038`** (art. 934, querella de obra ruinosa notificada,
    caso de un muro que cae por un sismo, distingue caída por mal
    estado de caída por caso fortuito) y **`re-detect-037`** (art. 2324
    en relación al art. 2003 regla 3ª, error de alumno que ignora la
    responsabilidad especial del constructor por vicios de
    construcción). Ruina de edificio estaba completamente sin cubrir
    hasta ahora (los 4 ítems previos del eje eran todos sobre animales
    o sobre el art. 2328). Eje 16 pasa de 4 a 6 ítems (aplic 2, detE 2,
    just 1, discMC 1).
  Ningún ítem de este lote es Discriminación MC, no altera la
  distribución de sesgo de posición. Verificados contra el manual
  (líneas 1460-1564 y 1744-1821) y sin redundancia con el contenido
  vivo de cada eje. **Mismo estado que los lotes anteriores: pendientes
  de revisión de Laura antes de publicar.**
  **Lote 5 (mismo día), ejes 17, 18 y 22, también sin publicar. Con este
  lote se cierran los 9 ejes que quedaban en el mínimo: la segunda
  pasada de volumen extra de REX queda completa.**
  - Eje 17 (regímenes de responsabilidad objetiva): **`re-aplic-039`**
    (Ley N° 16.744, accidente in itinere, la negligencia inexcusable
    del trabajador no excluye la cobertura del seguro) y
    **`re-mc-042`** (régimen especial de plaguicidas, responsabilidad
    estricta incluso por daños accidentales; correcta en B). El
    catálogo completo de regímenes especiales (trabajo, tránsito,
    aeronáutica, plaguicidas, hidrocarburos, energía nuclear, minería)
    solo tenía cubierto tránsito hasta ahora. Eje 17 pasa de 4 a 6
    (aplic 2, detE 1, just 1, discMC 2).
  - Eje 18 (responsabilidad del Estado): **`re-detect-038`**
    (responsabilidad vicaria del Estado por sus órganos, un alumno
    confunde el régimen con la excusa del art. 2320 inciso final, que
    no le aplica) y **`re-aplic-040`** (error judicial, exige algo
    asimilable a culpa grave, no basta que prueba posterior revele el
    error). Eje 18 pasa de 4 a 6 (aplic 2, detE 2, just 1, discMC 1).
  - Eje 22 (tribunal, procedimiento, extinción de la acción):
    **`re-detect-039`** (art. 2332 es prescripción de corto tiempo
    especial, no se suspende en favor de incapaces, a diferencia de las
    de largo tiempo) y **`re-aplic-041`** (improcedencia de reservar la
    especie y monto de los perjuicios para la ejecución del fallo o un
    juicio posterior). Eje 22 pasa de 4 a 6 (aplic 2, detE 2, just 1,
    discMC 1).
  Distribución final de Discriminación MC de REX tras toda la pasada
  (3 ítems nuevos de este tipo: `re-mc-040`, `re-mc-041`, `re-mc-042`,
  todos sin publicar): A12/B12/C13/D11, sin sesgo relevante. Verificados
  contra el manual (líneas 1827-1892, 1898-1959 y 2178-2239) y sin
  redundancia con el contenido vivo de cada eje.
  **Resumen de toda la pasada de REX (2026-08-05):** los 2 huecos reales
  del lote 1 (eje 5 sin Justificación, eje 24 sin Discriminación MC) más
  los 9 ejes que estaban en el mínimo parejo (1, 6, 7, 11, 13, 16, 17,
  18, 22), cada uno llevado de 4 a 6 ítems. Total: **20 ítems nuevos**.
  **Laura revisó y aprobó el lote completo, se marcó `publicado` en las
  4 tablas de Airtable y se corrió el sync: Evaluación de REX queda en
  167 en Supabase (verificado en vivo, los 20 códigos nuevos confirmados
  uno por uno).** Los 25 ejes de REX quedan con al menos 4 ítems de
  Evaluación, y ninguno queda ya en el mínimo absoluto de 1-1-1-1: los
  ejes que ya tenían más profundidad de antes (2, 9, 12, 14, 15, 19, 20,
  21, 23, 25) no se tocaron en esta pasada, quedan como candidatos para
  seguir profundizando si Laura lo pide.
  **De paso (2026-08-05): corregido un bug de copy en `app/alternativas.html`
  línea 1354** — la instrucción de Aplicación decía "antes de ver
  cualquier opción", frase que solo tiene sentido para Discriminación MC
  (la única que muestra alternativas después); ahora dice "Escribe tu
  análisis completo, con los artículos relevantes."
- **Lote 6 de la segunda pasada de REX (2026-08-05), ejes 12 y 19,
  sin publicar (pendiente de revisión de Laura):** primer lote de la
  continuación pedida por Laura después de aprobar y sincronizar el
  lote anterior. Se eligieron los ejes 12, 19 y 25 como siguientes
  candidatos por ser los más débiles entre los que ya tenían más que el
  mínimo (5 ítems cada uno); este lote cubre 12 y 19, queda 25
  pendiente.
  - Eje 12 (daño moral): **`re-mc-043`** (wrongful birth, acogido por la
    jurisprudencia chilena, vs. wrongful life, rechazado siguiendo a
    CORRAL por razones de dignidad de la persona; correcta en B) y
    **`re-aplic-042`** (naturaleza objetiva del daño moral, caso de un
    paciente en estado vegetativo, ilustrado con el caso real de las
    hijas recién nacidas indemnizadas por la muerte de su padre pese a
    no tener conciencia de la pérdida). Eje 12 pasa de 5 a 7 ítems.
  - Eje 19 (acción por daño contingente, art. 2333): **`re-aplic-043`**
    (causalidad hipotética, caso de un balcón a punto de desprenderse)
    y **`re-detect-040`** (legitimación pasiva no se limita al dueño de
    la cosa, sino a quien tiene el deber de suprimir la amenaza,
    incluidas las personas a cuyo cargo esté conforme al art. 2319).
    Eje 19 pasa de 5 a 7 ítems.
  Distribución de Discriminación MC de REX tras los 4 ítems nuevos de
  este tipo agregados en toda la sesión (`re-mc-040` a `re-mc-043`):
  A12/B13/C13/D11 sobre 49 totales. Sigue sin sesgo grave, pero B y C ya
  quedan levemente por delante de A y D — si se agregan más ítems de
  Discriminación MC en la próxima sesión, conviene priorizar la
  correcta en A o D para no acumular la tendencia. Verificados contra el
  manual (líneas 1357-1454 y 1965-2022) y sin redundancia con el
  contenido vivo de cada eje.
- **Lote 7 de la segunda pasada de REX (2026-08-05), eje 25, sin
  publicar (pendiente de revisión de Laura). Con este lote se cierran
  los tres ejes débiles (12, 19, 25) que quedaban entre los que ya
  tenían más que el mínimo.**
  - **`re-mc-044`** (responsabilidad postcontractual, la excepción que
    CORRAL reconoce cuando la ley sanciona el término abusivo del
    contrato disponiendo su conservación forzada, caso de un despido
    injustificado con reincorporación obligatoria; correcta puesta en A
    a propósito, para compensar el leve adelanto de B/C) y
    **`re-detect-041`** (naturaleza de la responsabilidad
    precontractual, un alumno invierte la posición mayoritaria
    chilena, extracontractual, atribuyéndole a la doctrina la tesis
    minoritaria de Ihering). Eje 25 pasa de 5 a 7 ítems.
  Distribución final de Discriminación MC de REX tras los 5 ítems
  nuevos de este tipo agregados en toda la sesión (`re-mc-040` a
  `re-mc-044`): **A13/B13/C13/D11 sobre 50 totales**, pareja, D queda
  apenas un poco más baja pero sin sesgo relevante. Verificado contra el
  manual (líneas 2363-2422) y sin redundancia con el contenido vivo del
  eje.
  **Con este lote, los tres ejes que quedaban por debajo del resto
  entre los ya profundizados (12, 19, 25) quedan igualados en 7 ítems
  cada uno.** Quedan sin tocar en esta ronda los ejes que ya tenían aún
  más profundidad de antes (2, 9, 14, 15, 20, 21, 23), candidatos si
  Laura quiere seguir llevando REX más allá.
  **Lotes 6 y 7 (eje 12, 19, 25, 6 ítems en total, no 8 como se dijo al
  cerrar la sesión anterior, error de suma) revisados y publicados
  (2026-08-05), a pedido de Laura ("revísalas y públicalas cuando
  puedas"): esta vez la revisión la hizo Claude, no Laura** (auditoría
  de citas de artículos, atribuciones doctrinales, jurisprudencia y
  cero guiones largos/guillemets contra el manual, sin hallazgos).
  `publicado` marcado en las 4 tablas de Airtable y sync corrido:
  Evaluación de REX queda en **173** en Supabase (verificado en el
  output del sync). Con esto, los 26 ítems nuevos de toda la pasada
  (20 del lote 1-5 + 6 del lote 6-7) quedan publicados y en producción.
  **Pausado acá a pedido de Laura (2026-08-05), no cerrado: todavía
  queda trabajo real por hacer y REX se puede seguir ampliando.**
  Concretamente, cuando se retome:
  - Los 7 ejes que ya tenían más profundidad de antes de esta pasada
    (2, 9, 14, 15, 20, 21, 23) nunca se tocaron; podrían llevarse al
    mismo nivel que el resto (7-8 ítems) o más.
  - Los 22 ejes que sí se tocaron (todos salvo esos 7) quedaron en 6-7
    ítems cada uno, un techo modesto, no el techo real del apunte:
    "llevar Evaluación a su techo" (sección 5 del skill
    `generar-evaluacion`) sigue siendo la meta post-beta, con volumen
    bastante mayor al actual.
  - Mismo proceso que ya está probado (tabla de cobertura viva contra
    Supabase, lotes chicos de 1-2 ejes, chequeo de sesgo de posición,
    auto-auditoría antes de publicar) — no hace falta rediseñarlo,
    solo retomarlo cuando Laura lo pida.
- **Plan "llevar Evaluación a su techo" en Contractual, a pedido
  explícito de Laura (2026-07-31), en curso**: quiere los 20 ejes con
  todos sus subtemas cubiertos en los 4 tipos de Evaluación. **3 ejes
  cerrados hasta ahora, ya subidos a Airtable y sincronizados a
  Supabase** (vía `scripts/aplicar_correcciones_pendientes.py`, acciones
  `subir-eje5`/`subir-eje3`/`subir-eje7`). **Revisión de fondo de estos 3
  ejes: hecha, Laura confirmó que están bien (2026-07-31).**
  - Eje 5 (0→4): "el hecho del deudor" como tercera modalidad de
    imputación (arts. 2187/1678).
  - Eje 3 (1→5): "cumplimiento imperfecto y retardo simultáneos" (arts.
    1556/1591) e "incumplimiento como concepto objetivo, distinto de la
    imputabilidad".
  - Eje 7 (1→4): "el dolo no se presume" (art. 1459), "límite del art.
    1558 a los perjuicios indirectos", "el dolo se aprecia en concreto,
    sin grados".
  **2 ejes más subidos y sincronizados, todavía sin la revisión de fondo
  de Laura**:
  - Eje 4 (2→5): obligación de medio (ejemplo médico, ausencia de culpa
    exonera), regímenes de exención distintos medio/resultado, aplicación
    del régimen de resultado a un caso de fuerza mayor.
  - Eje 9 (2→4): "la mora purga la mora" (art. 1552), efecto de la mora
    sobre el riesgo del caso fortuito (arts. 1547/1672).
  - Eje 6 (3→4): las cuatro fuentes jerárquicas para determinar el grado
    de culpa (el art. 1547 es supletorio, no la primera fuente).
  - Eje 8 (2→4): la presunción de culpa contractual como ventaja frente a
    la vía extracontractual; carga de la prueba del caso fortuito con
    apoyo en jurisprudencia real ya citada en el manual (CS 2025,
    *Constructora Pardo y González*, Rol 217.959-2023).
  - Eje 10 (3→5): imprevisibilidad y fenómenos recurrentes (jurisprudencia
    de la sequía); ajenidad como riesgo asumido por el propio deudor al
    contratar (ejemplo de Abeliuk, el comerciante que vende lo que no tiene).
  - Eje 12 (5→7): daño directo vs. indirecto en una cadena causal (art.
    1558, ejemplo clásico de las vacas de Pothier); requisito de que el
    daño no esté ya reparado (*compensatio lucri cum damno*, subrogación
    del asegurador).
  - Eje 13 (0→4): estaba completamente vacío. Avaluación legal en
    obligaciones de dinero (art. 1559, perjuicios presumidos); la cláusula
    penal no requiere prueba de perjuicios (art. 1542); por qué no se
    acumulan pena e indemnización ordinaria (art. 1543); derecho
    alternativo del acreedor tras la mora, principal o pena (art. 1537).
  - Eje 14 (1→3): cumplimiento forzado de obligaciones de no hacer, las
    tres hipótesis del art. 1555 según sea posible o necesaria la
    destrucción de lo hecho.
  - Eje 17 (1→4): estado de necesidad como eximente discutida (ejemplo
    del capitán del barco de Fueyo); los tres efectos del hecho o culpa
    del acreedor (mora accipiendi, arts. 1548/1680/1827); el hecho del
    auxiliar o dependiente del deudor no es caso fortuito (art. 1679).
  - Eje 16 (2→4): autonomía de la indemnización en contratos de tracto
    sucesivo (tercera excepción de Boetsch); cumplimiento imperfecto no
    resolutorio, recibir la cosa no implica renunciar a la indemnización
    (art. 1590 inc. 2°, segunda excepción de Boetsch).
  - Eje 18 (3→4): el "par" del art. 2003 (regla 1ª rechaza el
    encarecimiento de insumos como riesgo ordinario, regla 2ª acepta la
    revisión por vicio oculto del suelo).
  - Eje 20 (4→5): el límite infranqueable de las cláusulas exonerativas,
    nunca dolo ni culpa grave (arts. 1465/44/1478).
  - Eje 12 (+1) y eje 14 (+2): últimos huecos de tipo cerrados (daño
    futuro cierto vs. eventual; por qué el cumplimiento no exige daño ni
    culpa/dolo; imposibilidad vs. mera onerosidad sobreviniente).
  **Verificado en vivo (2026-08-01): los 18 ejes reales de Contractual
  (todos salvo 2 y 21, sin sección propia en el manual) tienen
  representados los 4 tipos de Evaluación, sin ningún hueco — el
  objetivo mínimo que pidió Laura está cumplido.** Sigue pendiente
  decidir sobre 2 y 21, y llevar cada eje a un volumen mayor (varios
  subtemas por tipo) si Laura lo
  pide explícitamente, siguiendo el mismo proceso de lotes chicos.
  18, 19, 20 con distinto grado de cobertura ya existente (ver
  `docs/cobertura_subtema_rec_2026-07-31.md` para el detalle por eje
  antes de este plan).
- **Eje 11 ("La teoría de los riesgos") borrado (2026-07-31)**: Laura
  decidió que no es un eje real (el manual no le dedica sección propia).
  Se borró el registro de la tabla `Temas` de Airtable (`Digesto
  Contractual`, confirmado que no había nada linkeado a él antes de
  borrar). El catálogo de Contractual queda en **20 ejes**, no 21.
- **Reclasificación de las 225 Flashcards de Contractual: hecha, aplicada
  y limpiada (2026-07-31)**. Diagnóstico en
  `docs/reclasificacion_flashcards_rec_2026-07-31.md` + detalle id→eje en
  `docs/reclasificacion_flashcards_rec_2026-07-31_detalle.csv`. El
  muestreo de la Fase 1 se había quedado corto (estimaba ~30 mal
  etiquetadas); la reclasificación real encontró **82 de 225 (36%)**,
  redistribuidas sobre todo a eje 8 (31), eje 4 (15) y eje 20 (15).
  **Se resolvió el bloqueo de escritura**: corriendo las escrituras como
  script de Python (`scripts/aplicar_correcciones_pendientes.py`, corre
  contra la API de Airtable) en vez de `curl` suelto, no se bloqueó
  ninguna — el bloqueo de sesiones anteriores parece ser específico de
  invocar `curl` directo desde Bash, no de la escritura en sí. Los 82
  relinks ya están aplicados en Airtable (sobreviven el próximo sync).
  **Redundancia dentro del eje 6 auditada, corregida y ejecutada**: la
  primera pasada proponía borrar 63 tarjetas, pero al reauditar contra el
  texto exacto de la sección 0.3 de `docs/prompt-generacion-contenido-practica.md`
  (regla de redundancia) se encontró que 13 de esas 63 no calificaban en
  realidad — la mayoría por borrar la única versión de "regla abstracta"
  de un hecho dejando solo su versión de "caso concreto" (la 0.3 dice
  explícitamente que eso no es redundancia), y una (`134`) por ser la
  única tarjeta que menciona al albacea (art. 1299), un hecho jurídico
  distinto, no un duplicado. Laura aprobó la lista corregida de 50 ids,
  ya borradas en Airtable y Supabase. **Eje 6 quedó en 69 tarjetas reales
  (no 56 como se estimó al principio).** Contractual queda en 180
  Flashcards totales (225 originales + 5 nuevas del eje 5 − 50 borradas).
  Hallazgo pendiente sin tocar: **10 de los 20 ejes reales siguen en cero
  tarjetas** (2, 3, 5, 12, 13, 14, 15, 16, 19, 21) — ver plan de
  generación de contenido nuevo más abajo.
  **Parte D del plan, cerrada (2026-08-04): 46 Flashcards nuevas
  generadas y subidas directo a Airtable Contractual
  (`appxeVxAE53yIqRPa`) para los 7 ejes que quedaban en cero y sí tienen
  sección propia en el manual (3, 12, 13, 14, 15, 16, 19; 6 o 7 tarjetas
  cada uno).** Verificado sin redundancia contra las 180 ya existentes
  (chequeo por artículo citado y por institución jurídica, no solo por
  eje). Laura las revisó y aprobó; quedaron marcadas `publicado` en
  Airtable y el SQL de sync a Supabase ya se corrió (2026-08-04): Contractual
  queda en **226 Flashcards** en ambos lados, Airtable y Supabase. **Eje
  2 y 21: decisión de Laura (2026-08-04)
  de no tocarlos** (no tienen sección propia en el manual y no se les va
  a crear una) — cerrado, no es un pendiente.
  **Incidente y arreglo (2026-08-01): las 50 borradas habían "revivido"
  como 50 fantasmas en Supabase con id nuevo.** Causa: `borrar_redundantes_eje6`
  borra primero la fila vieja en Supabase y después el registro en
  Airtable; si un `sync_airtable_supabase.py` corría en esa ventana (pasó,
  por los syncs de las subidas de eje 3/7/4/9/etc. que siguieron), el
  registro todavía existía en Airtable en ese instante y el sync lo volvía
  a insertar en Supabase con id nuevo — Airtable quedaba limpio pero
  Supabase se autorregeneraba con esas 50 filas huérfanas (eje 6 mostraba
  119, no 69). Se detectó comparando el universo completo de
  `airtable_id` de Airtable contra Supabase (180 vs. 230, la diferencia
  exacta eran las 50 fantasma) y se borraron directo en Supabase. Confirmado:
  Contractual queda en **180 Flashcards** en ambos lados, eje 6 en 69.
  **Gotcha para la próxima vez que se borre algo así**: borrar primero en
  Airtable, esperar, recién después borrar en Supabase — o no correr
  syncs mientras una tanda de borrados está en curso.
- **Hallazgo (2026-07-31): existe un borrador de 2026-07-29 completamente
  olvidado, nunca subido ni revisado**, `docs/preguntas_pendientes_ejes_debiles_contractual_2026-07.md`
  (1240 líneas), con preguntas ya redactadas para los ejes débiles de
  Contractual — pero para `Preguntas_Evaluacion` (el banco del
  Interrogador), no para Evaluación de Práctica ni para Flashcards. Viene
  acompañado de `docs/estudio_cobertura_rec_rep_2026-07.md`, que además
  ya había detectado hace 2 días la misma anomalía de `rc-aplic-002` que
  la Fase 0 de hoy volvió a encontrar por separado, y anota 5 ítems con
  el mismo `id` repetido entre `Preguntas_Evaluacion` y Evaluación
  (posible duplicado, sin revisar). Nada de esto se tocó hoy — queda
  pendiente que Laura decida si retomar ese borrador del Interrogador.
- **37 Flashcards nuevas de Precontractual generadas desde el manual, a
  su techo real** (`docs/flashcards_nuevas_2026-07-29_precontractual.md`),
  después de agotar `docs/flashcards_pendientes_2026-07.md` como fuente.
  De paso quedó anotado un fraseo ambiguo en dos Flashcards ya
  publicadas del Eje D ("da un ejemplo de deber... distinto de...", no
  funciona con el orden aleatorio de las tarjetas). **Pendiente de
  revisión de Laura antes de subir a Airtable** (base `Digesto
  Precontractual`, tabla `Flashcards`), y de correr el sync después.
- **Artículos de Memorice de las 3 materias de Responsabilidad**: Laura
  ya revisó y tiene anotados los artículos que quiere (2026-07-31), pero
  todavía no mandó el texto legal en sí. Cuando lo mande, cargar siguiendo
  `feedback_memorice_texto_lo_manda_laura` (el texto lo decide y envía
  ella, no se sale a verificar el artículo por cuenta propia).
- **Manual de Precontractual**: los recuadros pedagógicos y las
  preguntas/keywords de los checkpoints de `app/manuales.html` son
  borrador de Claude, todavía sin la revisión de Laura (ella pidió ese
  orden a propósito).
- **Pedido de Laura (2026-07-31) para cuando se retomen los 3 manuales:**
  agregar los subtemas (nivel 2, "N.M") al índice de cada uno, hoy solo
  lista los ejes. Detalle en memoria `feedback_formato_manuales_digesto`.
- **Verificar contra leychile.cl directo** (hoy solo verificados contra
  un espejo, leyes-cl.com) los 2 artículos de Código de Comercio en
  `scripts/memorice_literales_2026-07-28.sql`.
- **Probar una interrogación real que toque Precontractual** antes de
  darlo por completamente validado.
- **Terminar de revisar el contenido de Evaluación de Precontractual**
  (Justificación, Detección de error, Aplicación, Discriminación MC):
  las 40 preguntas originales ya se auditaron (citas, atribuciones,
  jurisprudencia) sin errores encontrados. Las 34 preguntas `hist-` de
  Discriminación MC (2026-07-29) también se auditaron contra los 3
  manuales (Rol de fallos, artículos citados, atribuciones doctrinales)
  sin errores encontrados. Retomar la revisión completa del resto
  (Justificación/Detección de error/Aplicación) cuando Laura lo pida.
- **Sugerencia sin ejecutar, para después del beta:** renombrar la
  tabla `Preguntas_Evaluacion` (en las 4 bases de Airtable) a algo como
  `Banco_Interrogador`, porque el nombre choca con el modelo
  "Evaluación" de Práctica. Si Laura lo hace desde Airtable directo,
  avisar en la sesión para actualizar en el mismo momento la referencia
  literal `"Preguntas_Evaluacion"` en `scripts/sync_airtable_supabase.py`
  — si no, el próximo sync falla.
- **Confirmar con otra interrogación real** si la IA está siendo dura o
  inconsistente calificando (observación abierta de Laura, sin
  confirmar todavía). No tocar la rúbrica hasta que ella lo confirme.
- **Borrar a mano las 8 bases de Airtable sueltas sin usar** (`REX -
  Alternativas`, `REX - Justificación`, etc.), de un diseño anterior
  descartado.
- **Fusionar a `main` el arreglo de encabezado de los PDF** (worktree
  `.claude/worktrees/pdf-header-fix`, commit `863e8bc`, ya pusheado a
  `origin/worktree-pdf-header-fix`): nombre de Laura afuera del
  encabezado, "DIGESTO" a la izquierda, título + "Examen de grado" a la
  derecha, sin encabezado en la portada. A propósito no fusionado
  todavía: Laura quiere juntar más fixes de PDF antes de fusionar y
  regenerar los 3 PDF una sola vez. No tocar hasta que ella lo pida.

## Por determinar: decisiones de Laura, no son solo "hacer"

- **¿Deberían verse los 4 ítems transversales de Evaluación (`const
  bancoTransversal` en el código) y las preguntas `materia = 'transversal'`
  de Alternativas también al filtrar una sola área?** Hoy ambos casos
  solo aparecen bajo "Todas". Para Alternativas es un cambio de una línea
  por ítem si la respuesta es sí; para Evaluación haría falta además subir
  esos 4 ítems a Airtable en alguna de las 3 bases o decidir otra forma de
  guardarlos.
- **Si el hueco de los PDF públicos (ver arriba) es aceptable para el
  beta inicial** o si hace falta adelantar algo de la Capa 2 antes de
  invitar alumnas, aunque el plan original la ponga después.

## Fuera de alcance del beta a propósito (no es urgente, no confundir con pendiente)

- Paywall Capas 2 (PDFs privados con URL firmada) y 3 (pasarela de pago):
  van después de la Capa 1, no bloquean el beta inicial según el plan
  original, aunque ver la nota de arriba sobre el hueco de los PDF.
- Modo transversal del Interrogador (todas las materias de Civil en una
  sola sesión) y la interrogación oral (voz): quedan para después.
- **Justiniano como persona unificadora** (interrogación oral + Chat IA +
  ayuda inline "¿no entendiste?" en Evaluación + chat nuevo de dudas
  generales que dirige al manual): idea definida por Laura el 2026-08-05,
  detalle completo en `docs/interrogador.md` sección "Justiniano: persona
  unificadora". Nada de esto construido aún, queda para sesión dedicada.
- Materias más allá de Contractual/Extracontractual/Precontractual
  (Acto Jurídico, Bienes, Familia, Sucesorio, Procesal, Penal,
  Constitucional, Administrativo): en stand by hasta terminar de validar
  Responsabilidad.
- **Cobertura completa de los 4 tipos de Evaluación + Flashcards +
  Alternativas en todos los temas/subtemas, con volumen bastante mayor
  al de julio 2026**: meta explícita de Laura, para después del
  lanzamiento beta. Ver `.claude/skills/generar-evaluacion/SKILL.md`
  sección 5.
- Gamificación (`docs/gamificacion.md`): idea sin priorizar.
- El gotcha de que `scripts/sync_airtable_supabase.py` nunca borra en
  Supabase lo que se borra en Airtable: documentado, no corregido, no
  bloquea nada mientras no se vuelva a borrar contenido ya sincronizado.
