# Camino al beta de Digesto

> Este doc existe para no perder de vista, entre sesión y sesión, qué
> está hecho, qué falta hacer y qué falta decidir antes de invitar
> alumnas beta. Se actualiza in place cada sesión (no se acumula una
> entrada por fecha): si algo de acá se resuelve, se mueve o se borra,
> no se deja duplicado. Los ítems ya resueltos se borran del todo (no
> se dejan tachados) apenas se cierran — quedan igual en el historial
> de git si hace falta recuperarlos. Última actualización: 2026-07-31.

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
  48/51 reales (2 se van a Extracontractual). Precontractual sigue en
  0/60, sin empezar. Ver `docs/contenido-airtable-supabase.md` para la
  tabla actualizada (pendiente de refrescar con estos números después de
  correr los `UPDATE`).

## SQL pendientes de correr en Supabase, todos juntos (orden importa)

Acumulado de varios hallazgos de esta sesión (2026-07-31). Todos
bloqueados para Claude por el modo auto de Claude Code (escritura en
producción); Laura los corre en el SQL Editor de Supabase, en este
orden:

**1. Primero, el cambio de esquema** (agrega la columna que necesitan los
statements de más abajo):
```sql
alter table public.evaluacion_practica
  add column if not exists minimo_elementos integer;
```
(= `scripts/supabase_schema_minimo_elementos.sql`)

**2. Los 4 ítems de Extracontractual mal clasificados de eje** (detalle
arriba en el punto de REX):
```sql
update public.evaluacion_practica set tema = '5. La capacidad delictual' where codigo = 're-detect-008';
update public.evaluacion_practica set tema = '8. La culpabilidad: dolo y culpa' where codigo = 're-detect-010';
update public.evaluacion_practica set tema = '10. El daño: concepto y requisitos de resarcibilidad' where codigo = 're-aplic-011';
update public.evaluacion_practica set tema = '10. El daño: concepto y requisitos de resarcibilidad' where codigo = 're-detect-012';
```

**3. Los 40 de la Fase 0 de Contractual**: statements completos en
`docs/fase0_rec_clasificacion_2026-07-31.md` (sección final del doc), no
repetidos acá para no duplicar.

**4. Los 2 ítems que se mueven de Contractual a Extracontractual + el
arreglo del bug de calificación**: statements completos en
`docs/fix_justificacion_menciona_n_de_m_2026-07-31.md` (`rc-aplic-002`,
`rc-just-001`, `rc-just-009`). **Ojo:** mover `materia` en Supabase no es
el arreglo definitivo para los primeros dos — el registro original sigue
en la base `Digesto Contractual` de Airtable, y el próximo
`sync_airtable_supabase.py` lo va a volver a poner en Contractual salvo
que alguien también mueva el registro ahí (borrarlo de la tabla de
Contractual en Airtable y recrearlo en la de Extracontractual, linkeado
al eje correcto). Detalle en ese mismo doc.

**5. Alternativa redundante de Extracontractual**:
```sql
delete from public.alternativas where id = 'ext-alt-002';
```

**6. Solo si Laura decide borrar la fila corrupta en vez de investigarla**:
```sql
delete from public.evaluacion_practica where codigo = 'rc-detect-001';
```

## Pendiente: contenido y tareas sueltas (continuación)

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
- **Artículos de Memorice de las 3 materias de Responsabilidad**: Laura
  ya revisó y tiene anotados los artículos que quiere (2026-07-31), pero
  todavía no mandó el texto legal en sí. Cuando lo mande, cargar siguiendo
  `feedback_memorice_texto_lo_manda_laura` (el texto lo decide y envía
  ella, no se sale a verificar el artículo por cuenta propia).
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
