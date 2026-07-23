# Prompt maestro: generación de contenido para el módulo de Práctica

> Prompt para pegar en una sesión de Claude (nueva o esta misma) cuando
> Laura quiera generar contenido nuevo de Evaluación, Alternativas,
> Memorice o Flashcards a partir de los manuales. Diseñado para minimizar
> alucinación al máximo posible en un contexto de examen de grado, donde
> un artículo mal citado o una atribución doctrinal inventada es un error
> grave, no un detalle. Ver `docs/practica.md` para el contexto del
> módulo y `docs/contenido-airtable-supabase.md` para dónde vive cada
> tabla.

---

## CÓMO USAR ESTE DOCUMENTO

1. Copia desde el separador `## PROMPT` hasta el final del archivo.
2. Pégalo en una sesión de Claude Code que tenga acceso a este repo
   (para que pueda abrir los manuales y el código directamente).
3. Reemplaza `{MATERIA}` por la materia a trabajar (`Contractual`,
   `Extracontractual` o `Precontractual`) y `{EJES}` por el rango de ejes
   (ej. "todos", o "Ejes 1 a 5", si quieres ir por partes). Las **tres**
   materias tienen el mismo estatus en esta versión: Precontractual ya no
   es un caso aparte ni pendiente, se trabaja junto con Contractual y
   Extracontractual (REX) con exactamente las mismas reglas.
4. Cuando las tres materias ya tengan su primera pasada de contenido,
   corre además la sección 7 (preguntas transversales) una vez por cada
   par o trío de materias que quieras cubrir — es un paso aparte, no
   ocurre automáticamente al procesar cada manual por separado.
5. Revisa el reporte de auto-auditoría que el modelo entrega al final
   antes de pegar cualquier contenido en Airtable, Supabase o el código.

No ejecutes este prompt tú misma "a ciegas": el paso 4 (revisar la
auto-auditoría) es el control de calidad real. El prompt está diseñado
para que la IA se autocorrija, pero la responsabilidad final de verificar
que un artículo o un fallo citado existe de verdad es tuya, como en
cualquier contenido de examen.

---

## PROMPT

Vas a generar contenido de práctica (preguntas, alternativas, ítems de
memorización y flashcards) para la plataforma de estudio Digesto, a
partir del manual de **{MATERIA}** (`0X_Responsabilidad_{MATERIA}_Manual.html`
en la raíz del repo). El público son estudiantes de derecho chilenos
preparando el examen de grado. La precisión importa tanto como en un
examen real: un artículo mal citado, una jurisprudencia inventada o una
atribución doctrinal incorrecta es un error grave, no un matiz de estilo.

Trabajas sobre las **tres** materias de Responsabilidad con el mismo
estatus: Contractual, Extracontractual y Precontractual. Ninguna es
"secundaria" ni queda para después salvo que Laura lo pida explícitamente
para una sesión puntual.

### Antes de empezar — taxonomía: qué tipo de ítem es cada cosa

Antes de generar nada, ten clara esta distinción, porque cambia cómo se
redacta el ítem:

- **Ítems CON caso** (llevan un relato narrativo ficticio, campo `caso`):
  Aplicación, Detección de error y Discriminación MC de Evaluación. El
  alumno lee una situación concreta y razona sobre ella.
- **Ítems SIN caso / de regla directa** (preguntan sobre una regla,
  distinción o fundamento, sin narrativa): Justificación de Evaluación, y
  **todo el modelo Alternativas** (MC puro). Alternativas en particular
  **no es una versión corta de Discriminación MC**: es una pregunta
  directa sobre una regla puntual y bien delimitada, sin caso, pensada
  para repaso rápido, no para razonar sobre hechos.
- **Ítems transversales** (relacionan dos o tres materias entre sí):
  categoría nueva, ver sección 7. Pueden llevar caso o no, según el
  subtipo que uses para redactarlos.

No mezcles estas categorías por comodidad: si vas a escribir un ítem de
Alternativas, no le agregues un caso "para que se entienda mejor" — si
necesita un caso para tener sentido, es Discriminación MC, no
Alternativas.

### 0. Regla de oro: prohibido alucinar, y cómo se aplica en la práctica

No trabajas de memoria. Trabajas **solo** con:
(a) el texto del manual que tienes abierto, y
(b) para Memorice específicamente, el texto oficial y vigente del Código
    citado (Civil, de Comercio, Procesal Civil, según corresponda),
    que debes verificar contra una fuente textual confiable (ej. Biblioteca
    del Congreso Nacional, leychile.cl) y no reconstruir de memoria.

Para **cada ítem** que generes, sigue este proceso de tres pasos, en este
orden, y no te saltes ninguno:

1. **Cita de respaldo.** Antes de redactar el ítem, copia textualmente la
   o las oraciones del manual que lo sustentan (puedes omitir esta cita
   del entregable final, pero debes haberla hecho). Si no encuentras una
   oración concreta que respalde lo que quieres afirmar, **no escribas
   ese ítem** — no lo aproximes, no lo completes con lo que "probablemente
   dice la ley". Descártalo y sigue con el próximo candidato.
2. **Redacción del ítem** a partir exclusivamente de esa cita, siguiendo
   el esquema del modelo correspondiente (sección 3).
3. **Auto-auditoría** del ítem contra la checklist de la sección 6, antes
   de darlo por terminado.

Cuatro puntos calientes donde este proceso es más importante:

- **Jurisprudencia.** Nunca inventes un rol, tribunal o fecha de un
  fallo. Usa únicamente los fallos que el manual ya nombra explícitamente
  (ej. "Lavín con Mena", "Corte Suprema, 24 de marzo de 1981" en el Eje R
  de Extracontractual). Si quieres un ítem sobre un punto que el manual
  solo argumenta en doctrina, sin fallo citado, no le agregues un fallo
  para hacerlo "más completo": redáctalo sin jurisprudencia.
- **Atribución doctrinal.** "ALESSANDRI sostiene que..." solo es válido
  si el manual efectivamente atribuye esa idea a ese autor, en esas
  palabras o su equivalente cercano. Si la idea aparece sin autor
  explícito en el manual, no le pongas un nombre para que suene más
  autorizado.
- **Números de artículo.** Todo `articulo_referencia` debe ser copiable,
  literalmente, del pasaje del manual que citaste como respaldo en el
  paso 1. No completes con artículos "relacionados" que no estén en ese
  pasaje, aunque los conozcas de otro contexto.
- **Memorice.** El campo `texto` debe ser el texto oficial del artículo,
  palabra por palabra, no la paráfrasis que hace el manual. Ojo: los
  manuales casi siempre **parafrasean** los artículos en vez de citarlos
  textual (ej. el Eje V de Extracontractual dice "el artículo 2332
  establece un plazo especial de prescripción de cuatro años, contado
  desde la perpetración del acto...", que es un resumen, no el texto
  legal). Nunca reconstruyas el texto legal a partir de esa paráfrasis:
  búscalo en su fuente oficial y verifica que el número de artículo y la
  materia coincidan con lo que el manual describe. Si no puedes verificar
  el texto exacto, no generes ese ítem de Memorice — repórtalo como
  pendiente en vez de aproximarlo.

Si en cualquier paso dudas entre inventar un dato plausible o dejar el
ítem incompleto: **siempre elige dejarlo incompleto o descartarlo.** Un
ítem de menos es preferible a un ítem con un dato falso que una alumna
memorice como si fuera derecho vigente.

### 0.2 Regla explícita: prohibidas las alternativas obvias

Esto aplica sobre todo a **Alternativas** y a **Discriminación MC**, y es
un requisito explícito de Laura, no una preferencia de estilo: cada
distractor (opción incorrecta) tiene que corresponder a un **error de
calificación jurídica real y documentable** — algo que una alumna que
estudió el eje pero confundió dos conceptos parecidos efectivamente
podría marcar. No a un relleno.

**Test antes de aceptar un distractor:** ¿alguien que leyó el manual
completo descartaría esta opción sin necesitar razonar jurídicamente,
solo por sentido común o porque es evidentemente disparatada? Si la
respuesta es sí, el distractor es obvio y hay que reescribirlo o
descartar el ítem.

Formas concretas de construir un distractor que NO sea obvio (usa estas,
no inventes otras categorías):
- Confundir dos instituciones parecidas que el manual efectivamente
  contrasta (ej. caso fortuito vs. culpa exclusiva de la víctima vs.
  hecho de un tercero, como en el ítem `re-mc-001` ya existente en el
  banco).
- Aplicar la regla correcta al elemento equivocado del caso (ej.
  confundir a quién beneficia el contrato al graduar la culpa).
- Citar la excepción como si fuera la regla general, o viceversa.
- Usar el artículo correcto pero con el efecto jurídico invertido o
  incompleto (ej. "exime" en vez de "reduce", como en el art. 2330).
- Tomar una posición doctrinal real (de un autor distinto al que
  corresponde según el manual) y presentarla como si fuera la mayoritaria
  o la aplicable al caso.

Lo que nunca debe pasar: una opción que no tiene ninguna relación jurídica
con el caso, una opción con un error de redacción evidente, o tres
opciones "de relleno" claramente inferiores a la correcta con una sola
opción que se nota de inmediato como la buena por su extensión o
formulación. Si al terminar de escribir las 4 opciones una persona sin
formación jurídica podría adivinar la correcta por eliminación obvia,
reescribe los distractores.

### 1. Proceso de trabajo

1. Recorre el manual **eje por eje**, en orden, sin saltarte ninguno.
2. Para cada eje, evalúa qué modelos de práctica tienen contenido
   razonable para extraer de él (no todos los ejes rinden para los
   cuatro modelos: ver la guía de la sección 2).
3. Genera los ítems siguiendo el proceso de tres pasos de la sección 0.
4. Al terminar un lote (por eje, o por materia completa, según lo que
   te haya pedido Laura), entrega el reporte de auto-auditoría de la
   sección 6 antes que el contenido mismo.

### 2. Qué extraer de cada eje, por modelo

- **Evaluación — Aplicación:** un caso concreto e inventado (nombres
  ficticios, situación realista) que ilustre el concepto central del eje,
  con 3-4 `elementos_clave` que la respuesta modelo debería tocar. Los
  recuadros `.ejemplo` que ya existen en el manual son buena inspiración
  de situación, pero **no los copies literalmente** (evita duplicar
  contenido entre el manual y el banco de preguntas): varía los hechos
  manteniendo el mismo punto de derecho.
- **Evaluación — Detección de error:** un párrafo (ficticio, atribuido a
  "un alumno") con 1-2 errores jurídicos comunes y plausibles. Los
  recuadros `.warn` ("Advertencia", "trampa típica de examen") que ya
  existen en los manuales son la mejor fuente: cada advertencia suele
  señalar exactamente el error que un alumno comete, en las palabras
  del propio manual.
- **Evaluación — Justificación:** preguntas de fundamento ("¿por qué...",
  "explique el fundamento de..."). Las secciones "Síntesis para
  estructurar la respuesta de examen" y los recuadros `.dato-grado` ya
  están redactados casi como respuesta modelo: úsalos como base directa.
- **Evaluación — Discriminación MC:** un caso con 4 alternativas, donde
  las 3 incorrectas son errores de calificación jurídica comunes y
  reales (no absurdos evidentes), cada una con un `rationale` que
  diagnostica el error ("confunde X con Y"). Los contrastes explícitos
  del manual (ej. "no confundir A con B", tablas comparativas en
  `.dato-grado`) son la fuente ideal para construir distractores
  creíbles.
- **Alternativas (MC puro):** preguntas más cortas y directas que
  Discriminación MC, sin caso narrativo necesariamente, sobre una regla
  puntual y bien delimitada (ej. quién prueba la culpa, cuál es el plazo
  de prescripción). Las tablas comparativas de `.dato-grado` (que ya
  contrastan posiciones o reglas) rinden muy bien para esto.
- **Memorice:** solo para los artículos numerados que el eje trata como
  centrales (ej. 2314, 2330, 2332, 1547, 1554), y solo si puedes verificar
  su texto oficial vigente (ver advertencia de la sección 0). No generes
  Memorice para un eje que no gira en torno a un artículo específico.
- **Flashcards:** una definición, requisito o dato puntual por tarjeta,
  sin caso ni desarrollo — la unidad más pequeña posible de recuperación
  de memoria. Los recuadros `.callout` y las primeras oraciones
  definitorias de cada eje son la fuente más directa.

### 3. Esquema exacto y destino de cada modelo

**Importante:** cada modelo vive en un lugar distinto del sistema. Un
ítem con el esquema equivocado no se puede cargar, así que respeta el
formato exacto de esta sección, no una aproximación.

#### Evaluación
Vive **hardcodeada** en `const banco = [...]` dentro de
`app/alternativas.html` (línea ~799). **No se sirve desde Supabase hoy**,
aunque exista la tabla `preguntas_evaluacion` (ver `docs/practica.md`,
sección "Evaluación"). El entregable es un bloque de objetos JS listos
para pegar dentro de ese arreglo, con este formato exacto (según
`tipo`):

```js
// tipo: 'aplicacion' o 'deteccion_error'
{
  id: 'ext-aplic-002', // prefijo de materia + tipo + correlativo
  materia: 'civil',
  tema: 'Responsabilidad extracontractual', // debe calzar con TEMAS_EN_ALCANCE
  subtema: 'Nombre corto del punto tratado',
  tipo: 'aplicacion',
  caso: 'Relato del caso ficticio...',
  enunciado: '¿Pregunta(s) sobre el caso?',
  respuesta_modelo: 'Respuesta completa y correcta...',
  elementos_clave: [
    { texto: 'Qué debía decir la respuesta (punto 1)', keywords: ['variante1', 'variante2'], pregunta: 'Pregunta socrática que no revela la respuesta' }
    // 3-4 elementos
  ],
  articulos_referencia: ['2314', '2330'],
  objetivo_pedagogico: 'Qué se evalúa con este ítem'
}

// tipo: 'justificacion' (sin caso)
{
  id: 'ext-just-002',
  materia: 'civil',
  tema: 'Responsabilidad extracontractual',
  subtema: '...',
  tipo: 'justificacion',
  caso: null,
  enunciado: '¿Por qué...?',
  respuesta_modelo: '...',
  elementos_clave: [ /* igual formato de arriba */ ],
  articulos_referencia: ['...'],
  objetivo_pedagogico: '...'
}

// tipo: 'discriminacion_mc'
{
  id: 'ext-mc-002',
  materia: 'civil',
  tema: 'Responsabilidad extracontractual',
  subtema: '...',
  tipo: 'discriminacion_mc',
  caso: 'Relato del caso...',
  enunciado: '¿Qué institución/regla aplica?',
  opciones: [
    { letra: 'A', texto: '...', rationale: 'Por qué está mal (o CORRECTO. Por qué)' },
    { letra: 'B', texto: '...', rationale: '...' },
    { letra: 'C', texto: '...', rationale: '...' },
    { letra: 'D', texto: '...', rationale: '...' }
  ],
  correcta: 'C',
  articulos_referencia: ['2330'],
  objetivo_pedagogico: '...'
}
```

Cada `elemento_clave.pregunta` es una pregunta socrática que empuja a
seguir pensando sin nombrar la respuesta (convención de `docs/practica.md`,
punto 4 del addendum 2026-07-15) — no una repetición del `texto` en forma
de pregunta.

`TEMAS_EN_ALCANCE` en `app/alternativas.html` ya incluye "Responsabilidad
precontractual" (agregado 2026-07-23, junto con contractual y
extracontractual) — los tres calzan hoy con el mismo tratamiento, no hace
falta ningún paso adicional para que el contenido de Precontractual se
vea en Evaluación.

#### Alternativas
Va a la tabla Supabase `alternativas` (esquema en
`scripts/supabase_schema_practica.sql`). El entregable es un bloque de
sentencias `INSERT` listas para correr en el SQL Editor de Supabase, con
este formato exacto:

```sql
insert into public.alternativas
  (id, materia, subtema, nivel_exigencia, pregunta, opciones, correcta, retroalimentacion, fuente)
values (
  'ext-alt-002', -- id semántico: materia-alt-correlativo
  'extracontractual', -- valor normalizado: precontractual/contractual/extracontractual, o 'transversal' para ítems de relación entre materias (sección 7)
  'Nombre del subtema',
  3, -- nivel_exigencia 1-5, ver sección 4
  'Enunciado de la pregunta:',
  '["Opción A", "Opción B", "Opción C", "Opción D"]'::jsonb,
  0, -- índice (0-based) de la opción correcta
  '{"correcta": "Por qué la opción correcta lo es.", "por_que_no": ["B: por qué está mal.", "C: por qué está mal.", "D: por qué está mal."]}'::jsonb,
  'Art. NNNN CC'
)
on conflict (id) do nothing;
```

#### Memorice
Va a la tabla Supabase `memorice_articulos` (mismo script de esquema).
Entregable: sentencias `INSERT` con este formato:

```sql
insert into public.memorice_articulos
  (id, materia, subtema, articulo, texto, prioridad_ocultamiento, palabras_criticas, fuente)
values (
  'cc-art-2330', -- id semántico: código-art-número
  'extracontractual',
  'Nombre del subtema',
  '2330', -- solo el número
  'Texto OFICIAL y verbatim del artículo, verificado contra la fuente legal, no la paráfrasis del manual.',
  '[["palabra1", "palabra2"], ["palabra3"], ["*"]]'::jsonb, -- grupos acumulativos de ocultamiento, opcional
  array['palabra_critica1', 'palabra_critica2'],
  'Código Civil, art. 2330'
)
on conflict (id) do nothing;
```

`palabras_criticas` son las palabras que exigen coincidencia exacta sin
tolerancia al practicar (ver regla de corrección en `docs/practica.md`);
elige las que cambian el sentido normativo si se alteran (verbos
rectores, cifras, plazos), no cualquier palabra del artículo.

#### Flashcards
Se editan en Airtable (base `Digesto`, tabla `Flashcards`), **no** en
código ni en Supabase directo — el flujo real es Airtable → 
`scripts/sync_airtable_supabase.py` → Supabase (ver
`docs/contenido-airtable-supabase.md`). El entregable es una tabla que
Laura pueda pegar directo en Airtable:

| pregunta | respuesta | dificultad | materia | tema | subtema |
|---|---|---|---|---|---|
| ¿...? | ... | básica / intermedia / avanzada | civil | Responsabilidad extracontractual | ... |

`respuesta` puede incluir `<b>`, `<i>`, `<em>`, `<strong>`, `<u>` y
`<span class="art">` (el lector de flashcards los soporta, ver
`fcFormatearRespuesta`). No uses ninguna otra etiqueta HTML.

### 4. Reglas de estilo heredadas del proyecto (no negociables)

- Todo en español.
- Cero guiones largos (—) en ningún campo. Cero guillemets («»); si
  necesitas destacar una cita textual, usa cursiva (`<em>` en flashcards,
  o simplemente sin marca en los campos de texto plano de Supabase/JS).
- Nombres de autores citados: negrita + mayúscula completa si el destino
  soporta HTML (flashcards); en campos de texto plano (JSON/SQL) basta
  el nombre en mayúscula sin marcado, ya que esos campos no renderizan
  HTML.
- `nivel_exigencia` (escala 1-5): 1-2 una regla simple y memorística;
  3 una aplicación directa de una regla a un caso; 4 una distinción o
  matiz doctrinal; 5 una discusión con posiciones enfrentadas o una
  excepción a una excepción.
- Casos inventados: nombres ficticios, situación realista y concreta,
  inspirados en los `.ejemplo` del manual pero con hechos distintos (no
  copiar literalmente, para no duplicar contenido entre el manual y el
  banco de preguntas).

### 5. Volumen esperado

Salvo que Laura pida un número distinto, apunta a 2-4 ítems de Evaluación
(repartidos entre sus 4 subtipos, no los 4 en cada eje), 3-5 de
Alternativas, 1-2 de Memorice (si el eje tiene artículo central) y 4-6
de Flashcards, **por eje**, en cada una de las tres materias. Prioriza
calidad y verificabilidad sobre volumen: es preferible entregar 2 ítems
sólidos que 5 con un dato dudoso entre ellos. Esto no incluye las
preguntas transversales (sección 7), que se generan aparte, no por eje.

### 6. Auto-auditoría final obligatoria

Antes de entregar cualquier lote de contenido, recórrelo ítem por ítem y
verifica:

- [ ] Cada número de artículo citado aparece literalmente en el pasaje
      del manual usado como respaldo (o, en Memorice, en la fuente legal
      oficial verificada).
- [ ] Ninguna cita de jurisprudencia (rol, tribunal, fecha) fue inventada;
      todas aparecen, tal cual, en el manual.
- [ ] Cada atribución a un autor ("FULANO sostiene...") coincide con lo
      que el manual efectivamente le atribuye.
- [ ] (Memorice) El `texto` es el texto oficial verbatim del artículo, no
      una paráfrasis ni una reconstrucción de memoria.
- [ ] Cero guiones largos, cero guillemets, en cualquier campo.
- [ ] Ningún `elemento_clave.pregunta` ni `rationale` revela la respuesta
      directamente.
- [ ] Los distractores de Alternativas/Discriminación MC pasan el "test
      de obviedad" de la sección 0.2: nadie los descartaría por sentido
      común, solo por conocimiento jurídico específico del punto tratado.
- [ ] Ningún caso o dato reutiliza literalmente un recuadro `.ejemplo`
      del manual palabra por palabra.
- [ ] (Transversales) Cada mitad de una comparación entre materias tiene
      su propia cita de respaldo textual, y la conclusión comparativa no
      agrega nada que esas citas no digan por sí solas.

Si un ítem falla cualquier casillero, corrígelo o descártalo: nunca lo
entregues marcado como "aproximado" o "revisar después". Entrega el
resultado de esta checklist (cuántos ítems generados, cuántos
descartados y por qué, y qué ejes quedaron sin contenido para algún
modelo) **antes** del contenido mismo, para que Laura sepa qué está
revisando.

### 7. Preguntas transversales: relación entre materias

Cuando una alumna repasa **toda** Responsabilidad (no una materia sola),
tiene sentido que aparezcan preguntas que la obliguen a relacionar
Contractual, Extracontractual y Precontractual entre sí, en vez de solo
mostrarle las tres mezcladas al azar (que es lo que ya hace el filtro
"Todas" hoy, sin que eso implique ninguna pregunta realmente
relacional). Este es un modo de trabajo aparte del recorrido eje por eje
de las secciones 1-2: se hace una vez, después de que las tres materias
ya tengan su primera pasada de contenido individual, no dentro de cada
eje.

**Fuente principal, y la más segura para no alucinar una comparación:**
los propios manuales ya tienen ejes dedicados a comparar estatutos entre
sí. Son la fuente prioritaria, mucho más confiable que construir tú una
comparación combinando dos ejes que no se refieren entre sí:
- Extracontractual, **Eje W** ("Dualidad o unidad de regímenes;
  diferencias entre estatutos"): compara explícitamente Contractual vs.
  Extracontractual, con nueve diferencias ya enumeradas por el propio
  manual (prueba de la culpa, graduación de la culpa, mora, capacidad,
  solidaridad, extensión de la reparación, cláusula penal, efectos del
  dolo, prescripción).
- Extracontractual, **Eje X** ("Cúmulo o concurso de responsabilidades"):
  trata directamente qué pasa cuando un mismo hecho reúne los caracteres
  de ambos estatutos.
- Extracontractual, **Eje Y** ("Responsabilidad precontractual, por
  nulidad y postcontractual"): conecta explícitamente la responsabilidad
  precontractual con el régimen extracontractual general, incluyendo por
  qué la doctrina prefiere esa calificación en vez de la contractual.
- Precontractual, **Eje C** ("etapas del proceso de formación del
  contrato") y su tabla de estatuto aplicable por etapa: recorre, paso a
  paso, cuándo la responsabilidad precontractual se acerca al régimen
  contractual y cuándo al extracontractual.

**Regla de grounding específica para comparaciones:** un ítem
transversal puede combinar una cita del manual de una materia con una
cita del manual de otra (ej. "en Contractual, la culpa se presume [cita
del Eje W]" + "en Extracontractual, la víctima debe probarla [misma
cita, que ya hace el contraste]" → "difieren en la carga de la prueba").
Esto es válido siempre que: (1) cada mitad de la comparación tenga su
propia cita de respaldo textual, y (2) la conclusión comparativa
("difieren en...", "coinciden en...") sea una lectura directa de esas
citas, sin agregar matices, causas o consecuencias que ninguna de las dos
afirme. Prioriza siempre, cuando exista, la opción donde el manual ya
hizo la comparación por ti (la lista de arriba) antes que construirla
combinando dos ejes independientes que nunca se refieren entre sí.

**Dónde vive cada ítem transversal:**
- **Evaluación:** usa `tema: 'Responsabilidad civil'` (el valor
  transversal que `TEMAS_EN_ALCANCE` ya reconoce) en vez del nombre de
  una materia específica. Justificación ("¿en qué se diferencian
  Contractual y Extracontractual respecto de...?") y Discriminación MC
  ("dado este caso, ¿qué estatuto aplica y por qué?") son los subtipos
  más naturales; Aplicación también funciona si el caso mismo obliga a
  decidir entre dos estatutos posibles (el ejemplo del pasajero de bus
  del Eje X de Extracontractual es justo ese patrón, adáptalo sin
  copiarlo literal).
- **Alternativas:** usa `materia: 'transversal'` (no `'general'`, que ya
  se usa como categoría residual). `'transversal'` no coincide con
  ningún substring que reconoce `normalizarMateria`, así que el ítem solo
  aparece cuando el filtro de Área está en "Todas" — que es exactamente
  el comportamiento buscado, no debe aparecer si alguien filtra solo por
  Contractual.
- **Flashcards:** mismo criterio que Evaluación, `tema: 'Responsabilidad
  civil'`.
- **Memorice:** no aplica. La memorización es por artículo individual;
  no existe una versión "transversal" de memorizar un texto legal.

**Volumen:** no es "por eje" como el resto del contenido. Genera un lote
aparte de 6 a 10 ítems transversales en total (repartidos entre
Evaluación, Alternativas y Flashcards), priorizando los puntos de
contraste que los manuales ya desarrollan explícitamente (la lista de
arriba) antes de inventar nuevos cruces que ningún eje trata
directamente.
