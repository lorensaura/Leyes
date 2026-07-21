# Módulo de Práctica (refactor 2026-07-14)

> Detalle del refactor que unificó Evaluación, Flashcards, Alternativas y
> Memorice en una sola pantalla. El resumen de una línea vive en el índice de
> `CLAUDE.md`; esto es lo específico de esta feature.

## Qué es y dónde vive
- Todo vive ahora en `app/alternativas.html` (una sola página). `app/flashcards.html`
  quedó como un simple redirect a `alternativas.html?modelo=flashcard` para no
  romper enlaces guardados — no tiene lógica propia.
- **Por qué una sola página y no cuatro separadas:** el spec pedía que los tres
  ejes de filtro (Materia / Modelo / Subtipo) se pudieran cruzar libremente
  (ej. "Alternativas + Contractual + Daño"). Eso no tiene sentido como
  navegación entre páginas distintas — necesita ser un solo estado de filtros
  sobre un solo contenedor que cambia de motor de render según el Modelo
  elegido.

## Los tres ejes de filtro
- **Eje 1 — Materia:** Todas · Precontractual · Contractual · Extracontractual.
- **Eje 2 — Modelo:** Evaluación · Flashcards · Alternativas · Memorice.
- **Eje 3 — Subtipo:** depende del modelo. En Evaluación son los 4 tipos de
  siempre (Aplicación / Detección de error / Justificación / Discriminación
  MC). En Alternativas y Memorice es la lista de `subtema` que aparezca en los
  ítems ya cargados para la materia elegida (dinámico, no hardcodeado). En
  Flashcards no hay Eje 3 (se mantiene su filtro de dificultad de siempre).

## Los cuatro modelos

### Evaluación — sin cambios de datos ni de comportamiento
Sigue leyendo del `const banco = [...]` hardcodeado dentro de
`alternativas.html`, con la misma lógica de recuperación libre + rúbrica de
`elementos_clave`/`keywords` + segunda pasada + alternativa MC final. El
refactor solo movió su selector de subtipo al Eje 3 — el spec lo pedía
explícito ("se mantiene como está hoy").

**Importante — algo que noté de paso y NO toqué:** la tabla `preguntas_evaluacion`
existe en Supabase y se sincroniza desde Airtable (ver
`docs/contenido-airtable-supabase.md`), pero **Evaluación no la usa** — sigue
leyendo el `banco` hardcodeado. Además, `preguntas_evaluacion.elementos_clave`
en Supabase es `text[]` (solo el texto de cada elemento), mientras que la
rúbrica de corrección necesita también los `keywords` de cada elemento para
poder puntuar — ese campo no se sincroniza desde Airtable hoy. Migrar
Evaluación a leer de Supabase requeriría primero agregar esa columna en
Airtable y extender `scripts/sync_airtable_supabase.py`. Lo dejo señalado como
pendiente aparte, no lo hice porque el spec pedía explícitamente no tocar el
comportamiento de Evaluación.

### Flashcards — mismo motor de repetición espaciada de siempre
Sin cambios de lógica; ahora también filtrable por Materia. Sigue usando
`flashcards` + `flashcard_progreso` en Supabase tal cual.

### Alternativas — modelo nuevo
Multiple choice puro (4 opciones), sin paso de recuperación libre previo.
Distinto del subtipo "Discriminación MC" de Evaluación (ese sigue con su flujo
de siempre). Al elegir una opción se marca de inmediato correcta/incorrecta;
**la retroalimentación textual solo aparece si el alumno falla** (si acierta,
solo el verde y el botón de avanzar). Datos en la tabla nueva `alternativas`.

### Memorice — modelo nuevo
Memorización textual de artículos, con andamiaje que se retira en 4 niveles
(N1 ~25% oculto → N4 recitado completo). El artículo se guarda **una sola
vez**; el nivel de ocultamiento se calcula en el cliente según el
`nivel_actual` guardado para ese alumno y ese artículo.

**Ocultamiento:** si el ítem trae `prioridad_ocultamiento` (curado a mano, en
grupos acumulativos 0→3), manda sobre el automático. Si no lo trae, se calcula
solo: se ocultan primero las palabras con carga semántica (se excluyen
artículos/preposiciones/conjunciones de una lista fija), ordenadas por
longitud descendente, repartidas en 4 cuartiles.

**Corrección — la regla central del spec:** cada palabra del artículo se
normaliza (trim, minúsculas, sin tildes, sin puntuación) antes de comparar.
Las palabras en `palabras_criticas` exigen coincidencia exacta sin tolerancia,
siempre. Las demás toleran variación de preposición/conector (`por`/`en`,
`de`/`del`, `a`/`al`) y omisión de artículos determinados no críticos. Nunca
hay sinónimos, nunca distancia de edición, nunca fuzzy match — la única
"inteligencia" adicional es un alineamiento de secuencia (LCS) usado solo para
el diff palabra por palabra de N4, no para decidir si una palabra individual
es correcta.

**Repetición espaciada** (reutiliza el patrón de `flashcard_progreso`, no un
sistema paralelo — tabla nueva `memorice_progreso`, mismo `unique(user_id,
articulo_id)` y mismas políticas RLS):

| Resultado | Nivel | Próxima aparición |
|---|---|---|
| Todos los vacíos correctos | sube 1 (máx. N4) | 7 días |
| Todos correctos ya en N4 | se mantiene en N4 ("dominado") | 30 días |
| Parcial (≥1 acierto, no todos) | se mantiene | 3 días |
| Todos los vacíos mal | baja 1 (mín. N1) | se reencola al final de la cola de esta sesión |

El contador de progreso (`n / total`) refleja la cola real: cuando un ítem se
reencola, `total` crece, tal como pide el spec.

## Simplificaciones conscientes (para revisar más adelante)
- **Progresión por `nivel_exigencia` dentro de un subtema:** el spec describe
  un modo "ascendente al empezar, mezclado una vez que hay aciertos en niveles
  bajos". Hoy está implementado solo el modo ascendente — no existe todavía un
  historial persistido de aciertos por nivel/subtema que permita activar el
  modo mezclado (sería una extensión natural del mismo patrón de
  `*_progreso`, pero no se construyó en este refactor).
- **Precontractual** no tiene contenido cargado en ninguno de los 4 modelos
  de Práctica todavía — el filtro existe y funciona, pero mostrará vacío
  hasta que se cargue contenido real de esa materia. Esto es independiente
  del **manual** de Precontractual, que sí existe desde el 2026-07-20
  (`03_Responsabilidad_Precontractual_Manual.html`, ver `CLAUDE.md` →
  Decisiones tomadas): tener el manual no llena por sí solo Evaluación,
  Alternativas ni Memorice — esos siguen necesitando preguntas/ítems
  curados aparte, vía Airtable.
- Los datos de `alternativas` y `memorice_articulos` **no se sincronizan desde
  Airtable todavía** (a diferencia de `flashcards`/`preguntas_evaluacion`). El
  `id` de cada ítem es su propio id semántico (ej. `ext-alt-001`, `cc-art-1`),
  pensado para que sea fácil agregarles un origen Airtable después, igual que
  se hizo con las otras dos tablas.

## Addendum: feedback de Laura tras usar Memorice y Evaluación — 2026-07-15

Laura probó el módulo y reportó 5 cosas. Las 5 quedaron resueltas:

1. **Jerarquía de Materia rediseñada.** El Eje 1 (antes plano: Todas/Precontractual/
   Contractual/Extracontractual) ahora es de tres niveles: **Rama** (Civil / Procesal
   — Procesal deshabilitado, "Próximamente"), **Materia dentro de Civil** (Todas /
   Responsabilidad / Acto Jurídico / Bienes / Obligaciones / Contratos / Familia /
   Sucesorio — solo Todas y Responsabilidad habilitadas hoy, el resto se muestra
   deshabilitado con "Próximamente" en vez de ocultarse, a pedido explícito de
   Laura) y **Área** (Precontractual/Contractual/Extracontractual, el filtro viejo,
   ahora anidado y visible solo al elegir Materia = Responsabilidad). Variables:
   `ramaActiva`, `materiaActiva` (nivel Civil), `areaActiva` (nivel Responsabilidad,
   reemplaza al `materiaActiva` viejo en toda la lógica de filtrado de datos).
   El intercalado (interleaving) por defecto que Laura pidió **ya existía**: los
   tres modelos dinámicos (Evaluación, Alternativas, Memorice) mezclan aleatoriamente
   los ítems cuando el filtro está en "Todas" — no fue necesario construir un motor
   nuevo, solo la jerarquía de navegación.
2. **Bug de highlight Método A/B corregido.** `setMetodoMemorice` nunca llamaba a
   `renderFiltros()`, así que el botón activo no se movía. Fix de una línea.
3. **Render de tags HTML en Flashcards generalizado.** `fcFormatearRespuesta` solo
   permitía `<b>` y `<span class='art'>`; ahora permite `<b>/<i>/<em>/<strong>/<u>`
   con una sola regex, para no seguir parchando tag por tag.
4. **Feedback de segunda pasada en Evaluación rediseñado.** Se eliminó la columna
   "✗ Faltaron" (revelaba la respuesta) — ahora `elementos-grid` solo muestra
   "✓ Presentes". Cada uno de los 42 `elementos_clave` del `banco` (repartidos en
   los 12 ítems que usan este campo) trae ahora su propia `pregunta` socrática,
   anclada en los hechos del caso, que empuja a seguir pensando sin nombrar la
   respuesta (mismo estilo del ejemplo de Laura sobre LogiRed). **La pregunta de
   la segunda pasada se arma dinámicamente**: `evaluarRespuesta` junta las
   `pregunta` de únicamente los elementos que esa persona no acertó esa vez
   (`faltantes.map(el => el.pregunta).join(' ')`) — si a alguien le faltaron 2 de
   4 elementos, ve solo esas 2 preguntas, no las 4. Se descartó a propósito la
   alternativa más simple (una sola pregunta fija por caso, la primera versión
   que se probó) porque no se adaptaba a qué le faltó a cada persona en cada
   intento. **Convención para contenido futuro:** cualquier `elemento_clave`
   nuevo debe traer su propio campo `pregunta` (no a nivel de ítem); es una
   transformación con receta clara (tomar ese elemento puntual y convertirlo en
   pregunta sin revelar la respuesta), así que una sesión futura de IA puede
   redactarla siguiendo el mismo patrón sin que Laura tenga que especificarlo
   de nuevo cada vez.
5. **Contexto entre subtipos de Evaluación.** Se revisó si saltar directo a un
   subtipo posterior (ej. Discriminación MC) deja al alumno sin los hechos del
   caso. Conclusión: el `caso` de cada ítem ya se muestra siempre en pantalla
   (`caso-box`), y de los 3 ítems de tipo `discriminacion_mc`, solo uno
   (`re-mc-001`, constructora y la zanja) tenía una redacción tipo "En el caso
   de..." que asumía que ya habías visto la pregunta de Aplicación. Se reescribió
   para que sea autónomo. Los subtipos siguen siendo filtrables de forma
   independiente (Eje 3 sin cambios de arquitectura) — se optó por la solución
   acotada (reescribir el `caso`) en vez de agrupar preguntas por caso en
   secuencia, que habría rediseñado cómo funciona el filtro de Subtipo.

## Addendum: Memorice con dos métodos en paralelo (A/B) — 2026-07-14

Tras probar el Método A, Laura reportó frustración con equivocaciones menores
que se marcaban muy severamente (un dígito en vez de la palabra ("5" vs
"cinco"), o una paráfrasis en vez del texto literal). Se corrigió lo primero
(ver abajo) y, además, se agregó un **segundo método** en paralelo para que
el propio uso —no el diseño— decida cuál retiene mejor sin generar abandono.

- **Fix de números:** `normalizarPalabra` ahora trata "cinco" y "5" como la
  misma respuesta (mapa `NUMEROS_A_DIGITO`, excluye a propósito "un/una/uno"
  por ser casi siempre el artículo, no el número). Una paráfrasis real
  ("dos más" en vez de "otros dos") sigue marcándose mal — es un cambio de
  palabras, no de formato, y el spec prohíbe tolerancia ahí a propósito.
- **Porcentajes de Método A ajustados de nuevo:** N1=30%, N2=60%, N3=90%,
  N4=100% (recitado libre). Se sacó el "completado automático al 100% en N3"
  que se había agregado antes — con N3 en 90%, ya no correspondía forzar el
  100%; la curación de `prioridad_ocultamiento` vuelve a ser responsabilidad
  de quien la escribe, como en el spec original.
- **Método B (cláusulas + clave de primera letra):** el artículo se divide en
  `clausulas` (curadas a mano, o derivadas automáticamente por `;` o por
  incisos numerados si no vienen). Cada palabra se muestra como
  primera-letra-más-guiones (`generarClave`), obligando a producir el texto
  completo en vez de reconocerlo. Flujo: Estudio (copiar una vez) → B1
  (cláusula a) → B2 (a+b) → B3 (todas) → B4 (recitado libre, igual a N4). Si
  el artículo tiene una sola cláusula, salta directo de B1 a B4. La
  corrección reutiliza exactamente `compararBlank`/`diffCompleto` — un mismo
  ítem sirve a los dos métodos, no se duplican datos.
- **Dominio ahora exige 3 sesiones distintas** (días distintos, no 3
  intentos seguidos) con acierto en el nivel máximo, para ambos métodos,
  antes de pasar al intervalo de 30 días. Se persiste por método
  (`metodo`, `aciertos_nivel_max`, `sesiones_con_acierto`) — el progreso de
  un artículo en A y en B es independiente; cambiar de método no traspasa el
  nivel.
- **Instrumentación:** cada intento se registra en `memorice_intentos`
  (método, nivel, resultado, % acertado, errores en palabras críticas,
  segundos hasta evaluar, abandono). El abandono se detecta al cambiar de
  filtro/modelo o al salir de la pestaña con un ítem mostrado sin evaluar.
  Las 4 métricas para comparar A vs B (retención 7/30 días, sesiones hasta
  dominio, tasa de abandono, tiempo por artículo) están como consultas SQL
  listas en `scripts/consultas_analitica_memorice_ab.sql` — no hay panel
  visual; no vale la pena hasta que haya semanas de uso real acumulado.
- **Migración pendiente:** correr `scripts/supabase_schema_practica_metodo_b.sql`
  en Supabase (agrega `clausulas` a `memorice_articulos`, `metodo` +
  `aciertos_nivel_max` + `sesiones_con_acierto` a `memorice_progreso` con
  nueva clave única, y crea `memorice_intentos`).

## Antes de que Laura empiece a usarlo
**Correr `scripts/supabase_schema_practica.sql` en el SQL Editor de Supabase**
(agrega columnas a `flashcards`/`preguntas_evaluacion` y crea `alternativas`,
`memorice_articulos`, `memorice_progreso`, con un par de ítems de ejemplo
reales para poder probar cada modelo). Si se despliega el código sin correr
antes esta migración, las pestañas de Alternativas y Memorice se ven vacías y
el progreso de Memorice no se puede guardar — el código las degrada a un
estado vacío en vez de romperse, pero no van a funcionar hasta correr la
migración.

## Verificación hecha
Motor de Memorice probado con 15 casos unitarios (Chrome headless vía CDP,
sin dependencias de Node) antes de integrarlo a la UI. La página completa se
probó igual, con Chrome headless + Supabase bloqueado e inyectado un stub (el
método que ya usa este proyecto para páginas con Supabase): los 4 modelos, el
cruce de filtros, las transiciones de nivel de Memorice (correcto/parcial/
incorrecto/dominado en N4) y un artículo con números y palabras repetidas
(para confirmar que el marcador de ocultamiento no colisiona con dígitos
reales del texto).
