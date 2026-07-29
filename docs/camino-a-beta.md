# Camino al beta de Digesto

> Este doc existe para no perder de vista, entre sesión y sesión, qué
> está hecho, qué falta hacer y qué falta decidir antes de invitar
> alumnas beta. Se actualiza in place cada sesión (no se acumula una
> entrada por fecha): si algo de acá se resuelve, se mueve o se borra,
> no se deja duplicado. Última actualización: 2026-07-28.

## ⚠️ Urgente: revisar esto primero al retomar

**Sprawl de tablas en Airtable, detectado por Laura el 2026-07-28 (noche),
tras migrar Evaluación.** Cada una de las 3 bases por materia (Digesto
Contractual/Extracontractual/Precontractual) quedó con estructura
repetida para el mismo tipo de contenido:

- **`Opciones_MC`** (0 / 8 / 80 registros en Contractual/Extracontractual/
  Precontractual): tabla vinculada vieja, ligada a `Preguntas_Evaluacion`.
  Dejó de usarse el 2026-07-27 cuando esa info se aplanó a un campo de
  texto (`opciones_texto`) en la misma fila de `Preguntas_Evaluacion`; el
  script de sync ya no la lee. Sigue existiendo y ocupando cupo.
- **`Elementos_Clave`** (118 / 305 / 192 registros, 615 en total): mismo
  caso que `Opciones_MC` pero para `elementos_clave_texto`. Verificado
  que un registro real solo repite lo que ya está aplanado en el campo de
  texto, no aporta nada que no esté ya en `Preguntas_Evaluacion`.
- **Tres representaciones de "MC" por base**: la nueva tabla `Discriminación
  MC` (para Evaluación/Práctica, migrada hoy), la vieja `Opciones_MC` (para
  `Preguntas_Evaluacion`, en desuso), y las propias filas `tipo =
  discriminacion_mc` dentro de `Preguntas_Evaluacion`. Conceptualmente es
  la misma clase de contenido en tres lugares con propósitos distintos
  (Práctica vs. grounding del Interrogador), lo que genera confusión al
  navegar Airtable aunque cada uno cumpla una función real y distinta.

**Qué falta:** decidir con Laura si `Elementos_Clave` y `Opciones_MC` se
borran (ya no las lee nada), y si conviene renombrar las tablas para que
la distinción de propósito (Práctica vs. Interrogador) se entienda sin
tener que leer este doc. No se tocó nada todavía, es diagnóstico, no
ejecución.

## Hecho

- **Los 3 manuales publicados** (Contractual, Extracontractual,
  Precontractual): código + doctrina + jurisprudencia, con el formato
  definido (jerarquía A/1/1.1/a)/(i), recuadros pedagógicos, sin guiones
  largos).
- **Contenido migrado de Airtable a Supabase** para producción
  (Flashcards, Preguntas_Evaluacion). Airtable sigue siendo donde Laura
  edita, Supabase es lo que sirve la app.
- **Módulo Práctica unificado** (`app/alternativas.html`): Evaluación,
  Flashcards, Alternativas y Memorice en una sola pantalla, con
  repetición espaciada en Flashcards.
- **Interrogador IA v1** en producción (texto, `app/interrogador.html` +
  `api/interrogador.js`), alcance Contractual + Extracontractual +
  Precontractual. Grounding de 4 bloques (reglas, manuales completos,
  artículos de código, muestra real de preguntas), se regenera solo en
  cada deploy, no depende de que alguien se acuerde de correrlo a mano.
- **Login con Supabase** funcionando.
- **158 Flashcards de Extracontractual** generadas y publicadas
  (2026-07-28), con el bug de `sync_flashcards()` que no las traía desde
  las bases por materia ya corregido.
- **Cruce completo de `docs/flashcards_pendientes_2026-07.md` para
  Extracontractual** (2026-07-28): qué era redundante y qué no, con las
  46 candidatas nuevas ya redactadas en el esquema real de Airtable en
  `docs/flashcards_pendientes_2026-07_listo-airtable-extracontractual.md`,
  listas para pegar.
- 3 SQL de Práctica/Memorice corridos y confirmados en Supabase
  (`supabase_schema_practica.sql`, `supabase_schema_practica_metodo_b.sql`,
  `memorice_literales_2026-07-28.sql`).
- Caso Lavín con Mena (Eje G de Precontractual) verificado como fallo
  real, no alucinación.
- **`scripts/contenido_practica_2026-07.sql` ya corrido en Supabase**
  (117 Alternativas + 23 Memorice, Contractual + Extracontractual +
  Precontractual). Este doc decía "nunca cargado" hasta 2026-07-28
  (tarde); se verificó hoy comparando los 140 ids del archivo contra
  Supabase y los 140 ya están. Era información desactualizada, no un
  pendiente real.
- **Las 46 flashcards nuevas de Extracontractual, subidas y sincronizadas**
  (2026-07-28): 204 Flashcards en total en Airtable y Supabase.
- **Evaluación migrada de código a Airtable/Supabase** (2026-07-28): los
  195 ítems que vivían hardcodeados en `const banco` de
  `app/alternativas.html` (Aplicación/Detección de error/Justificación/
  Discriminación MC, Contractual + Extracontractual + Precontractual)
  se subieron a Airtable (una base por materia, mismo patrón que
  Flashcards) y de ahí a la tabla nueva `evaluacion_practica` en Supabase
  (196 ítems: se sumaron 2 más de Contractual que estaban sueltos con otro
  prefijo de id). De paso se resolvieron los 16 ítems huérfanos que un
  intento anterior había dejado en 4 tablas de Airtable sin usar: 9 se
  borraron por repetir un punto de derecho ya cubierto, 7 se sumaron al
  banco real por aportar algo nuevo. `const banco` ya no existe en el
  código; `app/alternativas.html` carga Evaluación desde Supabase igual
  que los otros 3 modelos. Verificado en Chrome headless (sin errores de
  consola, filtrado por materia funcionando, las 4 categorías renderizando
  bien) y confirmado en Supabase (196 filas, RLS activo). Quedan sueltos
  en el código solo 4 ítems transversales (`const bancoTransversal`),
  mismo tipo de caso que las preguntas transversales de Alternativas (ver
  "por determinar" abajo).

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

- ~~53 preguntas nuevas de Contractual~~ — hecho (2026-07-29): revisadas y
  aprobadas por Laura, subidas a Airtable (base Digesto Contractual,
  linkeadas a su eje) y sincronizadas a Supabase. Los 21 ejes quedaron en
  su techo real de material verificable contra el manual (detalle en
  `docs/preguntas_pendientes_ejes_debiles_contractual_2026-07.md`).
  Precontractual ya estaba parejo en los 10 ejes, sin necesitar refuerzo.
- **Normalizar el campo `materia` de las 53 preguntas nuevas de
  Contractual** (2026-07-29): quedaron con `materia = "Responsabilidad
  contractual"`, mientras las 344 preguntas viejas de `Preguntas_Evaluacion`
  tienen ahí `"civil"` (genérico). No afecta nada hoy, el Interrogador
  filtra por `tema_texto`, no por `materia`, y ese campo sí quedó bien en
  las 53. Es solo inconsistencia de datos, cosmética, pendiente de que
  Laura decida si vale la pena normalizarla.
- ~~Aviso falso de "225 Flashcards sin sincronizar"~~ — resuelto
  (2026-07-29): la tabla Flashcards de "Digesto Contractual" resultó ser
  literalmente la misma tabla de Airtable que la de la base "Digesto"
  original (mismo id interno de tabla, verificado), no una copia — Laura
  decidió no tocar esos registros por el riesgo de borrar en los dos
  lados a la vez. En cambio se corrigió `scripts/sync_airtable_supabase.py`
  (`sync_flashcards`) para deduplicar por `airtable_id` antes de contar,
  así el aviso ya no se dispara por este caso. Verificado: el sync ahora
  imprime "488 sincronizadas" sin aviso.

- **Correr `scripts/supabase_schema_tema_link.sql` en el SQL Editor de
  Supabase** (2026-07-29): agrega la columna `tema` a
  `preguntas_evaluacion`. Sin esto, la próxima vez que se corra
  `scripts/sync_airtable_supabase.py` va a fallar al sincronizar
  Preguntas_Evaluacion (la columna nueva que manda el script todavía no
  existe en la tabla).
- **Linkear a `Temas` el contenido viejo sin linkear** (medido
  2026-07-29): Preguntas_Evaluacion de Contractual (0/55) y Precontractual
  (0/119), y las 4 tablas de Evaluación en las 3 materias (0/196 en
  total). No urgente, se va completando materia por materia al revisar
  cada eje. Detalle en `docs/contenido-airtable-supabase.md`.
- ~~Cargar el catálogo de `Temas` de Precontractual en Airtable~~ — hecho
  (2026-07-29): 10 Temas (A-J, tomados del manual) creados en `Digesto
  Precontractual`. De paso se movieron ahí las 59 Flashcards de
  Precontractual que vivían sueltas en la base `Digesto` original
  (encontradas al hacer el estudio de cobertura, ver
  `docs/contenido-airtable-supabase.md`). Ya sincronizado a Supabase y
  verificado sin duplicados (225 Contractual + 204 Extracontractual + 59
  Precontractual = 488). Preguntas_Evaluacion/Evaluación de Precontractual
  siguen sin linkear a estos Temas, ver punto de arriba.

- ~~Cruzar los 10 lotes de Precontractual de
  `docs/flashcards_pendientes_2026-07.md` contra lo ya publicado~~ — hecho
  (2026-07-29): las 59 filas del archivo (Ejes A-J) ya están, sin
  excepción, publicadas en Airtable (`Digesto Precontractual`, tabla
  `Flashcards`), coincidencia exacta pregunta por pregunta. No queda
  ninguna candidata nueva que redactar desde esta fuente para
  Precontractual; para profundizar más ese contenido haría falta volver
  al manual directo, no a este archivo.
- **Cruzar los 9 lotes de Contractual** (+ el lote transversal) de
  `docs/flashcards_pendientes_2026-07.md` contra lo ya publicado, mismo
  proceso que se hizo con Extracontractual y Precontractual, todavía sin
  tocar.
- **Generar Flashcards de Contractual**: la tabla ya existe en Airtable
  con el mismo esquema que Extracontractual/Precontractual, está vacía.
  (Precontractual ya no aplica acá: sus 59 Flashcards ya están cargadas,
  ver punto de arriba.)
- **37 Flashcards nuevas de Precontractual generadas desde el manual, a
  su techo real** (2026-07-29, `docs/flashcards_nuevas_2026-07-29_precontractual.md`),
  después de agotar `docs/flashcards_pendientes_2026-07.md` como fuente:
  mapeo de instituciones por eje, tabla de cobertura y auditoría de
  redundancia contra las 59 Flashcards + 47 Alternativas + 40 Evaluación
  ya publicadas. Dos rondas: la primera (24) más conservadora, la
  segunda (13 más) agotando cada eje hasta el límite real, descartando a
  propósito la fragmentación expositiva sin peso jurídico distinto (el
  detalle completo de los postulados de Boffi, los §§ del BGB, fechas y
  montos del caso Lavín con Mena). El Eje I (postcontractual) quedó sin
  candidatas nuevas en ninguna ronda, a su techo real. De paso quedó
  anotado un fraseo ambiguo en dos Flashcards ya publicadas del Eje D
  ("da un ejemplo de deber... distinto de...", que no funciona con el
  orden aleatorio de las tarjetas). **Pendiente de revisión de Laura
  antes de subir a Airtable** (base `Digesto Precontractual`, tabla
  `Flashcards`), y de
  correr el sync después.
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
- ~~Cargar preguntas de Precontractual en `preguntas_evaluacion`
  (Supabase) para que el Interrogador tenga muestra real de esa
  materia~~ — esto ya decía "pendiente" desactualizado: verificado
  2026-07-29, hay 119 filas publicadas con `tema_texto = 'Responsabilidad
  precontractual'` y `MATERIAS_MUESTRA` en `api/interrogador.js` ya la
  incluye. No era un hueco real.
- **Probar una interrogación real que toque Precontractual** antes de
  darlo por completamente validado.
- ~~Sesgo de posición en Discriminación MC (la opción correcta caía casi
  siempre en B)~~ — corregido (2026-07-29): al revisar las 40 preguntas
  de Evaluación de Precontractual se detectó que, en los 49 ítems de
  Discriminación MC de las **tres** materias, la respuesta correcta
  nunca estaba en A ni en D (90% en B, el resto en C). Se reordenaron
  las 4 opciones y sus rationale en Airtable (tabla `Discriminación MC`
  de las 3 bases), se corrió el sync, y se verificó en Supabase:
  distribución final 13/12/12/12 entre A-D, sin perder el contenido
  (verificado que el marcador "CORRECTO" del rationale sigue alineado
  con el campo `correcta` en los 49 ítems). El mismo tipo de sesgo,
  más leve, existe en Alternativas (en Precontractual, la opción D
  nunca es correcta en 47 ítems) — **detectado, no corregido todavía**,
  pendiente de que Laura decida si vale la pena arreglarlo igual.
- **Sigue pendiente terminar de revisar el resto del contenido de
  Evaluación de Precontractual** (más allá del sesgo de posición ya
  corregido): Laura pidió revisar Justificación, Detección de error,
  Aplicación y Discriminación MC; el contenido en sí (citas, atribuciones,
  jurisprudencia) ya se auditó y no se encontraron errores, pero la
  revisión se pausó para priorizar este fix. Retomar cuando ella lo pida.
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
  todavía (2026-07-29): Laura quiere juntar más fixes de PDF antes de
  fusionar y regenerar los 3 PDF una sola vez, para no gastar tokens
  regenerándolos varias veces. No tocar hasta que ella lo pida.

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
- Gamificación (`docs/gamificacion.md`): idea sin priorizar.
- El gotcha de que `scripts/sync_airtable_supabase.py` nunca borra en
  Supabase lo que se borra en Airtable: documentado, no corregido, no
  bloquea nada mientras no se vuelva a borrar contenido ya sincronizado.
