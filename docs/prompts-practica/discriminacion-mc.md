# Prompt: Discriminación MC

> Aplican además, sin excepción, todas las reglas de
> `docs/prompts-practica/nucleo.md` (anti-alucinación, control de
> redundancia, trabajo por tandas, estilo, auto-auditoría). Este tipo no
> usa `elementos_clave` (es multiple choice, no respuesta libre), así que
> no aplica `elementos-clave.md`. En cambio, comparte con Alternativas
> las reglas de distractores: **antes de generar, lee en
> `docs/prompts-practica/alternativas.md` las secciones "Prohibidas las
> alternativas obvias" y "Paridad de extensión entre opciones"; aplican
> acá sin cambios**, no se repiten en este documento para no
> desincronizarse si se corrigen a futuro.

## Copiar y pegar

Reemplaza `{MATERIA}` y `{MANUAL}` antes de usar este prompt en una
sesión. `{MATERIA}` es el valor normalizado que usa el resto de la
plataforma para esta materia, y `{MANUAL}` es el archivo HTML del manual
correspondiente en la raíz del repo.

---

Vas a generar ítems de **Discriminación MC** para el módulo de Práctica
de Digesto, a partir del manual de **{MATERIA}** (`{MANUAL}`). El
público son estudiantes de derecho chilenos preparando el examen de
grado. La precisión importa tanto como en un examen real.

## Qué es Discriminación MC (y en qué se diferencia de Alternativas)

Lleva un caso (relato narrativo ficticio) y 4 alternativas, donde la
tarea es identificar qué institución o regla aplica al caso. **No es lo
mismo que Alternativas**: Alternativas es una pregunta corta y directa
sobre una regla puntual sin caso; Discriminación MC necesita el caso
para tener sentido, porque lo que se evalúa es reconocer qué regla
corresponde a esos hechos, no solo conocer la regla en abstracto.

## Qué extraer del manual

Los contrastes explícitos del manual (ej. "no confundir A con B",
tablas comparativas en `.dato-grado`) son la fuente ideal para construir
distractores creíbles: cada institución que el manual contrasta con otra
parecida es candidata a un caso donde hay que discriminar entre ambas.

## Esquema exacto y destino

**Dónde vive:** igual que Aplicación, en Airtable (base por área de
Responsabilidad, tabla "Discriminación MC"), sincronizado a
`evaluacion_practica`. Ver la misma nota de alcance de `aplicacion.md`
sobre materias que todavía no tienen base propia.

El entregable es una fila por ítem, con estos campos:

| Campo | Contenido |
|---|---|
| `codigo` | id semántico: materia-mc-correlativo |
| `materia` | el área/materia normalizada |
| `tema` | nombre de la materia tal como se muestra en la UI |
| `subtema` | nombre corto del punto tratado |
| `tipo` | `discriminacion_mc` |
| `caso` | relato del caso ficticio |
| `enunciado` | pregunta sobre qué institución/regla aplica |
| `opciones` | arreglo de `{ letra, texto, rationale }`, 4 opciones (`texto` de extensión pareja entre las 4, ver `alternativas.md`; `rationale` explica por qué está mal, o "CORRECTO. Por qué", y puede ser más largo que `texto` sin problema, igual que `retroalimentacion` en Alternativas) |
| `correcta` | la letra de la opción correcta |
| `articulos_referencia` | artículos citados, separados por coma |
| `objetivo_pedagogico` | qué se evalúa con este ítem |

## Volumen esperado

El volumen de Evaluación es agregado entre los 4 subtipos (ver
`aplicacion.md`), no por subtipo.

## Checklist específica de Discriminación MC

Además de la auto-auditoría del núcleo y de las secciones de
`alternativas.md` referenciadas arriba, verifica:

- [ ] El `caso` es necesario para responder: la pregunta no se podría
      contestar igual de bien sin él (si no, es una Alternativa, no una
      Discriminación MC).
- [ ] Las 4 opciones (`texto`) pasan el test de obviedad y la paridad de
      extensión de `alternativas.md`; la explicación larga va en
      `rationale`, no en `texto`.
