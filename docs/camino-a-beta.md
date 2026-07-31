# Camino al beta de Digesto

> Este doc existe para no perder de vista, entre sesión y sesión, qué
> está hecho, qué falta hacer y qué falta decidir antes de invitar
> alumnas beta. Se actualiza in place cada sesión (no se acumula una
> entrada por fecha): si algo de acá se resuelve, se mueve o se borra,
> no se deja duplicado. Los ítems ya resueltos se borran del todo (no
> se dejan tachados) apenas se cierran — quedan igual en el historial
> de git si hace falta recuperarlos. Última actualización: 2026-07-30.

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

## Pendiente antes de invitar alumnas beta (ya está claro qué hacer)

Esto es lo que ya quedó definido como condición previa a mandar la app a
las alumnas tester (`docs/paywall.md`, memoria `digesto_landing_page_before_beta`):

- **Landing page (`index.html`)**: cambiarla antes de invitar alumnas.
  Pendiente desde 2026-07-15.
- **Paywall, Capa 1** (la rápida, la que hace falta para beta): lista
  blanca en Supabase (solo correos aprobados entran) + cerrar el registro
  abierto. Hoy cualquiera puede crear cuenta.
- **Ojo con esto: la Capa 1 sola no cierra el contenido.** Hoy los PDF
  de los manuales (`digesto.cl/app/pdf/...`) son archivos públicos que
  abren sin login; compartir ese link se salta el paywall entero, lista
  blanca incluida. Cerrar esto es la Capa 2 (bucket privado + URLs
  firmadas, ver más abajo en "fuera de alcance"), que según `docs/paywall.md`
  está pensada para antes de cobrar, no necesariamente para el beta
  inicial con alumnas de confianza. Que quede claro: si se activa solo la
  Capa 1, los manuales siguen siendo copiables por link directo, es una
  decisión consciente, no un descuido si aparece.

## Pendiente: contenido y tareas sueltas (ya identificado, falta ejecutar)

- **Normalizar el campo `materia` de las 53 preguntas nuevas de
  Contractual**: quedaron con `materia = "Responsabilidad contractual"`,
  mientras las preguntas viejas de `Preguntas_Evaluacion` tienen ahí
  `"civil"` (genérico). No afecta nada hoy (el Interrogador filtra por
  `tema_texto`, no por `materia`), es cosmético, pendiente de que Laura
  decida si vale la pena.
- **Correr `scripts/supabase_schema_tema_link.sql` en el SQL Editor de
  Supabase**: agrega la columna `tema` a `preguntas_evaluacion`. Sin
  esto, la próxima corrida de `scripts/sync_airtable_supabase.py` va a
  fallar al sincronizar Preguntas_Evaluacion.
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
  leyera antes de subir. Sigue Contractual y Precontractual, todavía sin
  Fase 0.
- **Borrar `ext-alt-002` de la tabla `alternativas` en Supabase**
  (redundante con `ext-alt-033`, mismo elemento jurídico: el art. 1437
  como fuente de la obligación; Laura pidió eliminar la redundante y se
  decidió conservar `ext-alt-033`, ver
  `docs/preguntas_pendientes_eje1_2026-07-30.md`). El `DELETE` directo
  fue bloqueado por el modo auto de Claude Code al ser una acción
  destructiva sobre producción; además Alternativas ya se maneja por SQL
  directo, no por Airtable, así que corre a Laura, no a Claude. Statement
  exacto para el SQL Editor de Supabase:
  ```sql
  delete from public.alternativas where id = 'ext-alt-002';
  ```
- **Cruzar los 9 lotes de Contractual** (+ el lote transversal) de
  `docs/flashcards_pendientes_2026-07.md` contra lo ya publicado, mismo
  proceso que se hizo con Extracontractual y Precontractual, todavía sin
  tocar.
- **Generar Flashcards de Contractual**: la tabla ya existe en Airtable
  con el mismo esquema que Extracontractual/Precontractual, está vacía.
- **37 Flashcards nuevas de Precontractual generadas desde el manual, a
  su techo real** (`docs/flashcards_nuevas_2026-07-29_precontractual.md`),
  después de agotar `docs/flashcards_pendientes_2026-07.md` como fuente.
  De paso quedó anotado un fraseo ambiguo en dos Flashcards ya
  publicadas del Eje D ("da un ejemplo de deber... distinto de...", no
  funciona con el orden aleatorio de las tarjetas). **Pendiente de
  revisión de Laura antes de subir a Airtable** (base `Digesto
  Precontractual`, tabla `Flashcards`), y de correr el sync después.
- **Jurisprudencia del manual de Extracontractual** (verificar fallos
  citados): Laura lo está preparando, todavía no lo mandó.
- **Artículos de Memorice de Extracontractual**: Laura decide cuáles y
  manda el texto legal, todavía no llegó.
- **Manual de Precontractual**: los recuadros pedagógicos y las
  preguntas/keywords de los checkpoints de `app/manuales.html` son
  borrador de Claude, todavía sin la revisión de Laura (ella pidió ese
  orden a propósito).
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
- **Cuándo activar la Capa 1 del paywall** (lista blanca + cierre de
  registro): depende de cuándo Laura quiera empezar a invitar alumnas.
- **Si el hueco de los PDF públicos (ver arriba) es aceptable para el
  beta inicial** o si hace falta adelantar algo de la Capa 2 antes de
  invitar alumnas, aunque el plan original la ponga después.

## Fuera de alcance del beta a propósito (no es urgente, no confundir con pendiente)

- Paywall Capas 2 (PDFs privados con URL firmada) y 3 (pasarela de pago):
  van después de la Capa 1, no bloquean el beta inicial según el plan
  original, aunque ver la nota de arriba sobre el hueco de los PDF.
- Modo transversal del Interrogador (todas las materias de Civil en una
  sola sesión) y la interrogación oral (voz): quedan para después.
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
