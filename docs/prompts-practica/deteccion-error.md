# Prompt: Detección de error

> Aplican además, sin excepción, todas las reglas de
> `docs/prompts-practica/nucleo.md` (anti-alucinación, control de
> redundancia, trabajo por tandas, estilo, auto-auditoría) y de
> `docs/prompts-practica/elementos-clave.md` (cómo redactar `keywords`
> tolerantes a parafraseo). Este documento solo agrega lo específico de
> Detección de error.

## Copiar y pegar

Reemplaza `{MATERIA}` y `{MANUAL}` antes de usar este prompt en una
sesión. `{MATERIA}` es el valor normalizado que usa el resto de la
plataforma para esta materia, y `{MANUAL}` es el archivo HTML del manual
correspondiente en la raíz del repo.

---

Vas a generar ítems de **Detección de error** para el módulo de
Práctica de Digesto, a partir del manual de **{MATERIA}** (`{MANUAL}`).
El público son estudiantes de derecho chilenos preparando el examen de
grado. La precisión importa tanto como en un examen real.

## Qué es Detección de error

Lleva un caso, pero distinto del de Aplicación: aquí el "caso" es un
párrafo ficticio, atribuido a "un alumno", que razona sobre una
situación y comete uno o dos errores jurídicos. La tarea de la alumna es
identificar y corregir ese error, no resolver la situación desde cero.
Por la regla del núcleo, este tipo cumple la barra de "razonar" con
identificar el error y explicar por qué es un error (no hace falta que
además dependa de hechos nuevos no mencionados en el párrafo).

## Qué extraer del manual

Los recuadros `.warn` ("Advertencia", "trampa típica de examen") que ya
existen en los manuales son la mejor fuente: cada advertencia suele
señalar exactamente el error que un alumno comete, en las palabras del
propio manual. Convierte esa advertencia en un párrafo en primera
persona que comete el error, en vez de citar la advertencia directamente
(evita duplicar contenido entre el manual y el banco de preguntas).

## Esquema exacto y destino

**Dónde vive:** igual que Aplicación, en Airtable, tabla "Detección de
error" dentro de la base de esa área/tramo, sincronizado a
`evaluacion_practica`. Ver la tabla de bases existentes y el estado de
conexión con Supabase en `aplicacion.md` ("Dónde vive"): avísale a Laura
si {MATERIA} todavía no tiene ninguna base creada.

El entregable es una fila por ítem, con estos campos:

| Campo | Contenido |
|---|---|
| `codigo` | id semántico: materia-error-correlativo |
| `materia` | el área/materia normalizada |
| `tema` | nombre de la materia tal como se muestra en la UI |
| `subtema` | nombre corto del punto tratado |
| `tipo` | `deteccion_error` |
| `caso` | párrafo ficticio, atribuido a "un alumno", con 1-2 errores jurídicos |
| `enunciado` | pide identificar y corregir el o los errores |
| `respuesta_modelo` | identifica el error, explica por qué lo es, y da la regla correcta |
| `elementos_clave` | arreglo de `{ texto, keywords, pregunta }` (ver `elementos-clave.md`); cada elemento suele corresponder a: identificar el error, explicar por qué es un error, formular la regla correcta |
| `articulos_referencia` | artículos citados, separados por coma |
| `objetivo_pedagogico` | qué se evalúa con este ítem |

## Volumen esperado

El volumen de Evaluación es agregado entre los 4 subtipos (ver
`aplicacion.md`), no por subtipo. No todos los ejes rinden un buen error
plausible: si el manual no trae ningún recuadro `.warn` aprovechable
para ese eje, no fuerces uno inventado desde cero, avísalo en la
auto-auditoría en vez de completarlo igual.

## Checklist específica de Detección de error

Además de la auto-auditoría del núcleo y de `elementos-clave.md`,
verifica:

- [ ] El error del párrafo es un error real y plausible (algo que una
      alumna que estudió el eje pero confundió un punto efectivamente
      podría escribir), no un error absurdo o de sentido común.
- [ ] El párrafo no cita, palabra por palabra, el recuadro `.warn` que lo
      inspiró: está reescrito como si lo dijera un alumno, no el manual.
- [ ] La `respuesta_modelo` corrige el error explícitamente, no solo lo
      señala.
