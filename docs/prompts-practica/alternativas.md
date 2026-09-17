# Prompt: Alternativas (MC puro)

> Aplican además, sin excepción, todas las reglas de
> `docs/prompts-practica/nucleo.md` (anti-alucinación, filosofía
> aplicación-sobre-memoria, control de redundancia, trabajo por tandas,
> estilo, auto-auditoría). Este documento solo agrega lo específico de
> Alternativas: qué extraer, el esquema exacto de entrega, el volumen
> esperado y su parte de la checklist.

## Copiar y pegar

Reemplaza `{MATERIA}` y `{MANUAL}` antes de usar este prompt en una
sesión. `{MATERIA}` es el valor normalizado que usa el resto de la
plataforma para esta materia (ej. `contractual`, `bienes`,
`acto_juridico`), y `{MANUAL}` es el archivo HTML del manual
correspondiente en la raíz del repo.

---

Vas a generar ítems de **Alternativas** (MC puro) para el módulo de
Práctica de Digesto, a partir del manual de **{MATERIA}** (`{MANUAL}`).
El público son estudiantes de derecho chilenos preparando el examen de
grado. La precisión importa tanto como en un examen real.

## Qué es Alternativas (y qué no es)

Alternativas es una pregunta **corta y directa sobre una regla puntual y
bien delimitada**, sin caso narrativo, pensada para repaso rápido, no
para razonar sobre hechos (ej. quién prueba la culpa, cuál es el plazo
de prescripción, qué requisito le falta a una institución para
configurarse). **No es una versión corta de Discriminación MC**: si la
pregunta necesita un relato de hechos para tener sentido, es Discriminación
MC, no Alternativas. No le agregues un caso "para que se entienda mejor".

Dentro de ese límite (sin caso), prioriza preguntas que obliguen a
**distinguir** dos instituciones parecidas o a **aplicar** una regla a un
elemento puntual, por sobre preguntas que solo pidan repetir una
definición: la definición pura rinde mejor como Flashcard (ver "Filosofía"
en el núcleo).

## Qué extraer del manual

Las tablas comparativas de recuadros tipo `.dato-grado` (que ya
contrastan posiciones, requisitos o reglas) rinden muy bien para esto:
cada fila de una comparación suele dar una Alternativa distinta sin
esfuerzo adicional. También sirven los contrastes explícitos del texto
("no confundir A con B") y las enumeraciones cerradas de requisitos.

## Prohibidas las alternativas obvias

Esto es un requisito explícito de Laura, no una preferencia de estilo:
cada distractor (opción incorrecta) tiene que corresponder a un **error
de calificación jurídica real y documentable**, algo que una alumna que
estudió el eje pero confundió dos conceptos parecidos efectivamente
podría marcar. No a un relleno.

**Test antes de aceptar un distractor:** ¿alguien que leyó el manual
completo descartaría esta opción sin necesitar razonar jurídicamente,
solo por sentido común o porque es evidentemente disparatada? Si la
respuesta es sí, el distractor es obvio: reescríbelo o descarta el ítem.

Formas concretas de construir un distractor que NO sea obvio (usa estas,
no inventes otras categorías):
- Confundir dos instituciones parecidas que el manual efectivamente
  contrasta.
- Aplicar la regla correcta al elemento equivocado del caso o supuesto.
- Citar la excepción como si fuera la regla general, o viceversa.
- Usar el elemento correcto (artículo, plazo, requisito) pero con el
  efecto jurídico invertido o incompleto.
- Tomar una posición doctrinal real (de un autor distinto al que
  corresponde según el manual) y presentarla como si fuera la mayoritaria.

Lo que nunca debe pasar: una opción sin relación jurídica con la
pregunta, o un error de redacción evidente. Si al terminar de escribir
las 4 opciones una persona sin formación jurídica podría adivinar la
correcta por eliminación obvia, reescribe los distractores.

## Paridad de extensión entre opciones (obligatorio)

Además de que ningún distractor sea descartable por su contenido,
ninguna opción debe delatarse por su **forma**. El caso más común: la
opción correcta queda sistemáticamente más larga o más matizada que las
otras tres porque trae la justificación incrustada en el propio texto de
la opción, y una alumna puede acertar por ese patrón sin saber la
materia. Esto pasó en la primera prueba real de este prompt
(2026-09-17, feedback de Laura): la opción correcta decía "el solo
transcurso del tiempo nunca basta para la transformación; incluso en los
casos de los arts. 730 y 2510, regla 3ª, la ley exige que concurra un
antecedente adicional al tiempo, no que este opere solo", mientras las
tres incorrectas eran una sola frase corta sin desarrollo.

**Regla mecánica:** las 4 `opciones` deben tener extensión y estructura
gramatical comparable, como si fueran cuatro respuestas cortas al mismo
molde de pregunta. Toda la justificación, el matiz o la referencia a la
cita de respaldo va en `retroalimentacion` (`correcta` y `por_que_no`),
nunca dentro del texto de la opción misma. Si al terminar de redactar
las 4 opciones una se nota más larga o más elaborada que las otras tres,
recórtala a una afirmación del mismo tamaño y mueve lo que sobra a la
retroalimentación.

Esta regla, igual que la de arriba (distractores no obvios), aplica sin
cambios a Discriminación MC cuando se construya ese prompt: es un
problema del formato "varias opciones", no específico de Alternativas.

## Esquema exacto y destino

Va a la tabla Supabase `alternativas` (esquema en
`scripts/supabase_schema_practica.sql`). El entregable es un bloque de
sentencias `INSERT` listas para correr en el SQL Editor de Supabase:

```sql
insert into public.alternativas
  (id, materia, subtema, nivel_exigencia, pregunta, opciones, correcta, retroalimentacion, fuente)
values (
  '{materia}-alt-002', -- id semántico: materia-alt-correlativo
  '{materia}', -- valor normalizado de la materia, o 'transversal' para ítems de relación entre materias
  'Nombre del subtema',
  3, -- nivel_exigencia 1-5, ver escala abajo
  'Enunciado de la pregunta:',
  '["Opción A", "Opción B", "Opción C", "Opción D"]'::jsonb,
  0, -- índice (0-based) de la opción correcta
  '{"correcta": "Por qué la opción correcta lo es.", "por_que_no": ["B: por qué está mal.", "C: por qué está mal.", "D: por qué está mal."]}'::jsonb,
  'Art. NNNN CC' -- o la fuente que corresponda (fallo, código distinto, etc.)
)
on conflict (id) do nothing;
```

`nivel_exigencia` (escala 1-5): 1-2 una regla simple y memorística; 3 una
aplicación directa de una regla a un caso; 4 una distinción o matiz
doctrinal; 5 una discusión con posiciones enfrentadas o una excepción a
una excepción. Dado la filosofía de aplicación-sobre-memoria del núcleo,
evita que el lote quede concentrado en 1-2: si eso pasa, es señal de que
estás generando demasiadas preguntas de pura definición.

## Volumen esperado

Salvo que Laura pida un número distinto, apunta a 3-5 ítems de
Alternativas por eje. Prioriza calidad y verificabilidad sobre volumen.

## Checklist específica de Alternativas

Además de la auto-auditoría del núcleo, verifica:

- [ ] Los cuatro distractores pasan el "test de obviedad" de arriba.
- [ ] Las 4 opciones tienen extensión y estructura comparable; ninguna
      se distingue por ser más larga o más matizada que las demás (la
      justificación completa vive en `retroalimentacion`, nunca dentro
      del texto de la opción).
- [ ] El `id` es único y sigue el correlativo del banco existente para
      esta materia (revisa el máximo correlativo ya cargado antes de
      numerar los nuevos).
- [ ] `materia` usa el valor normalizado correcto, o `'transversal'` si
      corresponde (ver `docs/prompts-practica/nucleo.md` y, cuando
      exista, el prompt de transversales).
- [ ] Ninguna Alternativa nueva reformula, con otro enunciado, una
      Flashcard o un ítem de Evaluación ya existente sobre el mismo
      punto (chequeo entre tipos del núcleo).
