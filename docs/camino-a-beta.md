# Camino al beta de Digesto

> Este doc existe para no perder de vista, entre sesión y sesión, qué
> está hecho, qué falta hacer y qué falta decidir antes de invitar
> alumnas beta. Se actualiza in place cada sesión (no se acumula una
> entrada por fecha): si algo de acá se resuelve, se mueve o se borra,
> no se deja duplicado. Última actualización: 2026-07-28.

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

- **Cruzar los 9 lotes de Contractual y los 10 de Precontractual (+ el
  lote transversal)** de `docs/flashcards_pendientes_2026-07.md` contra
  lo ya publicado, mismo proceso que se hizo hoy con Extracontractual,
  todavía sin tocar.
- **Generar Flashcards de Contractual y Precontractual**: las tablas ya
  existen en Airtable con el mismo esquema que Extracontractual, están
  vacías.
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
- **Cargar preguntas de Precontractual en `preguntas_evaluacion`
  (Supabase)** para que el Interrogador tenga muestra real de esa
  materia. Hoy el bloque de muestra queda vacío para Precontractual.
- **Probar una interrogación real que toque Precontractual** antes de
  darlo por completamente validado.
- **Confirmar con otra interrogación real** si la IA está siendo dura o
  inconsistente calificando (observación abierta de Laura, sin
  confirmar todavía). No tocar la rúbrica hasta que ella lo confirme.
- **Borrar a mano las 8 bases de Airtable sueltas sin usar** (`REX -
  Alternativas`, `REX - Justificación`, etc.), de un diseño anterior
  descartado.
- **Commitear y pushear la migración de Evaluación** (2026-07-28):
  `app/alternativas.html`, `scripts/sync_airtable_supabase.py` y
  `scripts/supabase_schema_evaluacion.sql` quedaron modificados/nuevos sin
  commitear. Laura los pushea con GitHub Desktop.
- **Limpiar `.claude/worktrees/sharded-soaring-cook/`**: worktree
  suelto de una sesión anterior, nunca se cerró.

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
