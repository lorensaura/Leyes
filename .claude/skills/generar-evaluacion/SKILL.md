---
name: generar-evaluacion
description: Genera o revisa preguntas de Evaluación (Aplicación/Detección de error/Justificación/Discriminación MC), Flashcards o Alternativas para una materia, con la tabla de cobertura por tema/subtema como herramienta central y los chequeos de calidad que se aprendieron a la fuerza el 2026-07-29 (sesgo de posición, distinción con Preguntas_Evaluacion). Úsalo cuando Laura pida generar contenido nuevo de Evaluación, pida "revisar las preguntas de [materia]", o pida cerrar huecos de cobertura por tema.
---

# Generar y revisar Evaluación

Este skill nació el 2026-07-29 después de una sesión de revisión de
Precontractual que destapó tres problemas reales (sesgo de posición en
Discriminación MC y Alternativas, confusión entre `Preguntas_Evaluacion`
y las tablas de Evaluación, y volumen demasiado bajo por materia). El
objetivo es que la próxima sesión no tenga que redescubrir nada de esto.

**No repite** las reglas de redacción y anti-alucinación, que siguen
viviendo en `docs/prompt-generacion-contenido-practica.md` (sección 0
y 0.3) — este skill orquesta y agrega los chequeos que faltaban ahí.

## 0. La distinción que causó la confusión de hoy

- **`Preguntas_Evaluacion`** (tabla de Airtable por materia, banco de
  examen real que Laura fue mandando): sirve **solo** como grounding
  invisible del Interrogador IA (`api/interrogador.js`). La IA nunca le
  muestra a la alumna el enunciado literal de ahí — solo lo usa para
  calibrar estilo y cobertura de las preguntas que ella misma genera en
  vivo. No es contenido de Práctica.
- **Las 4 tablas `Aplicación`/`Detección de error`/`Justificación`/
  `Discriminación MC`** (Airtable, por materia) → tabla `evaluacion_practica`
  en Supabase: esto es lo que la alumna ve en el módulo de Práctica bajo
  "Evaluación". Es lo único que este skill genera o edita como contenido
  nuevo.
- Si en algún momento volvés a dudar cuál es cuál, no asumas: contá los
  registros de cada tabla vía API y mirá qué consulta `app/alternativas.html`
  (`cargarEvaluacion()` lee `evaluacion_practica`, nunca `preguntas_evaluacion`).

## 1. La tabla de cobertura (antes de generar nada)

Herramienta central de este skill, pedida explícitamente por Laura:
antes de escribir una sola pregunta nueva, armá (o actualizá) una tabla
con:

- **Filas:** cada tema/subtema del manual de esa materia (los ejes y,
  dentro de cada uno, los subtemas concretos que ya se usan en
  `subtema` de Alternativas/Flashcards/Evaluación).
- **Columnas:** Aplicación, Detección de error, Justificación,
  Discriminación MC, Flashcards, Alternativas. (Memorice queda afuera:
  no es un modelo de cobertura completa por tema, solo cubre artículos
  centrales puntuales, ver `docs/prompt-generacion-contenido-practica.md`.)
- Marcá qué casillas ya tienen contenido y cuáles están vacías, contando
  contra las fuentes reales (Supabase/Airtable vía API), nunca contra
  este mismo doc ni contra la memoria de una sesión anterior.

Generá contenido nuevo priorizando las casillas vacías, hasta llegar al
techo real del apunte por subtema (sección 0.3 del prompt maestro:
mapeo de instituciones, tabla de cobertura de elementos jurídicos,
cuota por subtema, avisar si un subtema ya llegó a su techo). La tabla
de esta sección (tema × modelo) y la tabla de cobertura de la sección
0.3 (elemento jurídico × ángulo) son dos herramientas distintas, para
dos preguntas distintas: esta responde "¿qué casillas del tablero
completo faltan?", la otra responde "¿ya agoté este subtema puntual?".

## 2. Límite de lote: nunca generar un volumen grande de una sola pasada

Chequeo explícito, agregado a pedido de Laura como red de seguridad
adicional (2026-07-29), aunque ya se desprende de
`docs/prompt-generacion-contenido-practica.md` sección 1 y 5: **no
generes 100 preguntas (ni 50, ni 30) en una sola tanda**, aunque la
tabla de cobertura muestre muchas casillas vacías y aunque técnicamente
puedas hacerlo en una sola respuesta. Volumen alto de una sola pasada es
exactamente lo que baja la calidad (más riesgo de redundancia entre
ítems, de distractores flojos, de perder de vista qué ya se citó).

Antes de escribir el primer ítem de una sesión, decidí y anunciá el
tamaño del lote (por defecto: 1-2 ejes, 2-4 ítems de Evaluación por eje,
según la sección 5 del prompt maestro) y **detenete ahí** para auditar y
entregar ese lote, aunque la tabla de cobertura de la sección 1 diga que
falta mucho más. Si Laura quiere explícitamente un volumen mayor en una
sesión puntual, que lo pida ella con un número — no asumas que "más
rápido" es mejor solo porque la cobertura lo permite.

## 3. Chequeo obligatorio de sesgo de posición

Antes de dar cualquier lote de **Discriminación MC** o **Alternativas**
por terminado, verificá la distribución de la opción/índice correcto.
El 2026-07-29 se encontró que, en el contenido generado hasta esa
fecha, la respuesta correcta caía casi siempre en la letra B (49 ítems
de Discriminación MC en las 3 materias, nunca en A ni D) y de forma más
leve en Alternativas (119 ítems, casi nunca en el índice 3). Ambos se
corrigieron reordenando opciones y `rationale`/`por_que_no` manteniendo
el contenido intacto.

**Mejor prevenir que corregir:** al redactar un lote nuevo, asigná la
posición de la opción correcta al azar desde el principio (no la
pongas siempre en la misma letra "porque se ve mejor ahí"). Si estás
revisando contenido ya existente, contá la distribución antes de
darlo por bueno:

```bash
# Discriminación MC (evaluacion_practica) y Alternativas: contar por 'correcta'
curl -s "https://byyukzhxhtopojgvgglp.supabase.co/rest/v1/evaluacion_practica?select=materia,correcta&tipo=eq.discriminacion_mc" \
  -H "apikey: $SUPABASE_SECRET_KEY" -H "Authorization: Bearer $SUPABASE_SECRET_KEY" | python3 -c "
import json,sys; from collections import Counter
d=json.load(sys.stdin); print(Counter(x['correcta'] for x in d))"
```

Si un tipo/materia sale muy concentrado en una sola letra o índice, es
un hallazgo a reportar antes de seguir, no un detalle a ignorar.

## 4. Reusar `Preguntas_Evaluacion` como fuente (con cuidado)

Hallazgo del 2026-07-29: buena parte de las 397 preguntas de examen
real ya tiene `respuesta_modelo` redactado, lo que la vuelve una fuente
rápida para sumar volumen a Evaluación **sin generar nada nuevo de
cero**. Pero no es copia directa para todos los tipos:

- **Discriminación MC**: si la fila ya tiene `opciones_mc` completo
  (letra/texto/rationale, con el marcador `CORRECTO.` en la que
  corresponde), se puede copiar prácticamente 1:1 a `evaluacion_practica`
  (con un `codigo` nuevo que no colisione, ej. prefijo `hist-`, y
  reusando el `airtable_id` original ya que la columna es `unique not
  null`). Así se migraron 34 ítems el 2026-07-29.
- **Aplicación / Justificación / Detección de error**: el
  `respuesta_modelo` sirve, pero el campo `elementos_clave` de
  `Preguntas_Evaluacion` es **texto plano sin `keywords`**. La app
  califica la respuesta libre de la alumna comparando contra
  `elemento.keywords` (`app/alternativas.html`, función de calificación
  de Evaluación) — sin keywords, todo elemento sale "no acertado" pase
  lo que pase, un bug activo, peor que no tener el ítem. Antes de
  copiar estos tipos hay que **agregar `keywords` y una pregunta
  socrática por elemento** (no reescribir el contenido legal, que ya
  está bien, solo etiquetarlo). Es trabajo real, más liviano que
  escribir un caso nuevo, pero no es gratis: no lo prometas como "cero
  esfuerzo".

## 5. Meta de cobertura y volumen (post-beta)

Laura quiere, después del lanzamiento beta, que los 4 tipos de
Evaluación (más Flashcards y Alternativas) toquen todos los temas de
cada materia, con un volumen bastante mayor al de julio 2026 (9-30
ítems por tipo y materia hoy). No generar este volumen de golpe sin que
ella lo pida — es la meta a la que apunta la tabla de cobertura de la
sección 1, no una tarea para ejecutar de una sola sesión.

## Al terminar un lote

1. Reportá el conteo antes/después por modelo y materia, y qué casillas
   de la tabla de cobertura quedaron llenas.
2. Corré el chequeo de sesgo de posición (sección 2) antes de entregar.
3. Actualizá `docs/camino-a-beta.md` si queda algo pendiente que no sea
   obvio retomando el proyecto en frío.
4. No marques nada como "revisado" — todo contenido jurídico nuevo
   queda pendiente de la revisión de Laura hasta que ella lo confirme.
