# Prompt: Justificación

> Aplican además, sin excepción, todas las reglas de
> `docs/prompts-practica/nucleo.md` (anti-alucinación, control de
> redundancia, trabajo por tandas, estilo, auto-auditoría) y de
> `docs/prompts-practica/elementos-clave.md` (cómo redactar `keywords`
> tolerantes a parafraseo). Este documento solo agrega lo específico de
> Justificación.

## Copiar y pegar

Reemplaza `{MATERIA}` y `{MANUAL}` antes de usar este prompt en una
sesión. `{MATERIA}` es el valor normalizado que usa el resto de la
plataforma para esta materia, y `{MANUAL}` es el archivo HTML del manual
correspondiente en la raíz del repo.

---

Vas a generar ítems de **Justificación** para el módulo de Práctica de
Digesto, a partir del manual de **{MATERIA}** (`{MANUAL}`). El público
son estudiantes de derecho chilenos preparando el examen de grado. La
precisión importa tanto como en un examen real.

## Qué es Justificación (sin caso, y por qué eso está bien)

Justificación **no lleva caso** (`caso: null`): son preguntas de
fundamento ("¿por qué...?", "explique la diferencia entre...", "¿cuál es
el fundamento de...?"). Por la regla del núcleo, esto no es una barra más
baja: cumple la exigencia de razonar comparando dos instituciones
parecidas, distinguiéndolas, o explicando el fundamento de una regla, sin
que haga falta forzarle hechos que este tipo no lleva por definición.

Ejemplo real (feedback de Laura, 2026-09-16, ver `nucleo.md`): "explique
la diferencia entre la tradición de muebles por brevi manu y por
constituto posesorio" es un ítem de Justificación perfectamente válido:
no hay hechos que resolver, pero tampoco es memoria aislada, exige
distinguir dos instituciones parecidas. Lo que sigue prohibido es la
definición aislada de un solo concepto ("¿qué es la tradición?"), no la
ausencia de caso.

## Qué extraer del manual

Las secciones "Síntesis para estructurar la respuesta de examen" y los
recuadros `.dato-grado` ya están redactados casi como respuesta modelo:
úsalos como base directa. Los contrastes explícitos del manual ("no
confundir A con B") y las tablas comparativas son la fuente más directa
para preguntas de distinción como la del ejemplo de arriba.

## Esquema exacto y destino

**Dónde vive:** igual que Aplicación, en Airtable, tabla "Justificación"
dentro de la base de esa área/tramo, sincronizado a
`evaluacion_practica`. Ver la tabla de bases existentes y el estado de
conexión con Supabase en `aplicacion.md` ("Dónde vive").

El entregable es una fila por ítem, con estos campos:

| Campo | Contenido |
|---|---|
| `codigo` | id semántico: materia-just-correlativo |
| `materia` | el área/materia normalizada |
| `tema` | nombre de la materia tal como se muestra en la UI |
| `subtema` | nombre corto del punto tratado |
| `tipo` | `justificacion` |
| `caso` | vacío/null, este tipo no lleva caso |
| `enunciado` | la pregunta de fundamento o distinción |
| `respuesta_modelo` | respuesta completa y correcta |
| `elementos_clave` | arreglo de `{ texto, keywords, pregunta }` (ver `elementos-clave.md`) |
| `articulos_referencia` | artículos citados, separados por coma |
| `objetivo_pedagogico` | qué se evalúa con este ítem |

## Volumen esperado

El volumen de Evaluación es agregado entre los 4 subtipos (ver
`aplicacion.md`), no por subtipo. Justificación suele rendir bien
justamente en los ejes donde el manual compara o contrasta dos
instituciones parecidas.

## Checklist específica de Justificación

Además de la auto-auditoría del núcleo y de `elementos-clave.md`,
verifica:

- [ ] El ítem no se responde con la definición aislada de un solo
      concepto: compara, distingue o fundamenta algo (ver ejemplo
      arriba).
- [ ] No se le agregó un caso "para que se entienda mejor"; si de verdad
      hace falta un caso, es Aplicación o Discriminación MC, no
      Justificación.
