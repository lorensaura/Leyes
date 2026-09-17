# Prompt: Aplicación

> Aplican además, sin excepción, todas las reglas de
> `docs/prompts-practica/nucleo.md` (anti-alucinación, control de
> redundancia, trabajo por tandas, estilo, auto-auditoría) y de
> `docs/prompts-practica/elementos-clave.md` (cómo redactar `keywords`
> tolerantes a parafraseo). Este documento solo agrega lo específico de
> Aplicación.

## Copiar y pegar

Reemplaza `{MATERIA}` y `{MANUAL}` antes de usar este prompt en una
sesión. `{MATERIA}` es el valor normalizado que usa el resto de la
plataforma para esta materia, y `{MANUAL}` es el archivo HTML del manual
correspondiente en la raíz del repo.

---

Vas a generar ítems de **Aplicación** para el módulo de Práctica de
Digesto, a partir del manual de **{MATERIA}** (`{MANUAL}`). El público
son estudiantes de derecho chilenos preparando el examen de grado. La
precisión importa tanto como en un examen real.

## Qué es Aplicación (y su barra, más estricta que el resto)

Aplicación **siempre lleva un caso** (relato narrativo ficticio, campo
`caso`): la alumna lee una situación concreta e inventada y tiene que
resolverla. Por la regla del núcleo (ver "Filosofía"), este es el único
tipo con barra estricta: el ítem debe depender de verdad de los hechos
del caso. Si se puede responder igual de bien sin haber leído el caso
(porque en el fondo solo pide explicar una distinción en abstracto), no
es un buen ítem de Aplicación: reformúlalo para que la respuesta dependa
de aplicar la regla a esos hechos puntuales, o muévelo a Justificación si
lo que en realidad quieres es la distinción en abstracto.

## Qué extraer del manual

Los recuadros `.ejemplo` que ya existen en el manual son buena
inspiración de situación, pero **no los copies literalmente** (evita
duplicar contenido entre el manual y el banco de preguntas): varía los
hechos manteniendo el mismo punto de derecho. Un buen candidato es
cualquier regla que el manual ilustre con un ejemplo concreto propio,
porque ya viene con el tipo de hechos que Aplicación necesita.

## Esquema exacto y destino

**Dónde vive:** hoy, Evaluación (Aplicación/Detección de error/
Justificación/Discriminación MC) se cura en **Airtable**, una base por
área de Responsabilidad (Digesto Contractual/Extracontractual/
Precontractual), tabla "Aplicación", y se sincroniza a la tabla Supabase
`evaluacion_practica` vía `scripts/sync_airtable_supabase.py` (ver
`scripts/supabase_schema_evaluacion.sql`). **Si {MATERIA} no es una de
esas tres áreas, esa base de Airtable todavía no existe** y hace falta
crearla (y remover el corte que hoy limita Evaluación a Responsabilidad
en `app/alternativas.html`, función `iniciarEvaluacion`) antes de que
este contenido sea visible en la app. Avísale a Laura si este es el
caso, no asumas que alcanza con generar el contenido.

El entregable es una fila por ítem, lista para pegar en la tabla
"Aplicación" de Airtable, con estos campos:

| Campo | Contenido |
|---|---|
| `codigo` | id semántico: materia-aplic-correlativo (ej. `bienes-aplic-003`) |
| `materia` | el área/materia normalizada (ver nota de alcance arriba) |
| `tema` | nombre de la materia tal como se muestra en la UI (ej. "Responsabilidad extracontractual") |
| `subtema` | nombre corto del punto tratado |
| `tipo` | `aplicacion` |
| `caso` | relato del caso ficticio |
| `enunciado` | la o las preguntas sobre el caso |
| `respuesta_modelo` | respuesta completa y correcta |
| `elementos_clave` | arreglo de `{ texto, keywords, pregunta }`, 3-4 elementos (ver `elementos-clave.md`) |
| `articulos_referencia` | artículos citados, separados por coma |
| `objetivo_pedagogico` | qué se evalúa con este ítem |

## Volumen esperado

El volumen de Evaluación es **agregado entre los 4 subtipos** (Aplicación,
Detección de error, Justificación, Discriminación MC), no por subtipo:
apunta a 2-4 ítems de Evaluación en total por eje, repartidos según qué
subtipos rinden mejor para ese eje en particular (no fuerces los 4 en
cada eje). Prioriza calidad y verificabilidad sobre volumen.

## Checklist específica de Aplicación

Además de la auto-auditoría del núcleo y de `elementos-clave.md`,
verifica:

- [ ] El ítem depende de verdad de los hechos del `caso`; no sería igual
      de válido sin ellos (ver "Filosofía" del núcleo).
- [ ] El `caso` varía los hechos respecto de cualquier recuadro
      `.ejemplo` del manual que lo haya inspirado, no lo copia literal.
- [ ] `tema` calza con el nombre de materia que ya usan otras filas
      existentes de esa misma área en Airtable (revisa una fila real
      antes de inventar el nombre).
