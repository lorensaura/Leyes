# Prompt: preguntas transversales (relación entre materias)

> Aplican además, sin excepción, todas las reglas de
> `docs/prompts-practica/nucleo.md` y las del prompt del tipo con que se
> redacte cada ítem (`justificacion.md`, `discriminacion-mc.md`,
> `aplicacion.md`, `alternativas.md`, `flashcards.md`; y
> `elementos-clave.md` en los tipos con respuesta libre). Este documento
> solo agrega lo específico de los ítems que relacionan dos o más
> materias. Rescatado del prompt antiguo (sección 7) el 2026-10-10.

## Qué es y cuándo se hace

Cuando una alumna repasa varias materias juntas (por ejemplo, toda
Responsabilidad, o Acto Jurídico con Obligaciones), tiene sentido que
aparezcan preguntas que la obliguen a **relacionarlas** entre sí, en vez
de solo mostrarle las materias mezcladas al azar (que es lo que ya hace
el filtro "Todas", sin que eso implique ninguna pregunta relacional).

Es un modo de trabajo aparte del recorrido tema por tema: se hace **una
vez que las materias involucradas ya tienen su primera pasada** de
contenido individual, no dentro de cada tema.

## Fuente: primero lo que el manual ya compara

La fuente más segura para no alucinar una comparación son los pasajes en
que **el propio manual compara** instituciones de distintas materias:
recuadros "No confundir", tablas comparativas, secciones de diferencias
entre estatutos y recuadros "Conexiones". Ejemplos ya usados en
Responsabilidad: en Extracontractual, el Eje W (nueve diferencias entre
responsabilidad contractual y extracontractual), el Eje X (cúmulo de
responsabilidades) y el Eje Y (responsabilidad precontractual, por
nulidad y postcontractual); en Precontractual, el Eje C y su tabla de
estatuto aplicable por etapa.

Prioriza siempre la comparación que el manual ya hizo por ti antes que
construirla combinando dos pasajes que nunca se refieren entre sí.

## Regla de respaldo específica para comparaciones

Un ítem transversal puede combinar una cita del manual de una materia con
una cita del manual de otra ("en Contractual la culpa se presume" + "en
Extracontractual la víctima debe probarla" → "difieren en la carga de la
prueba"). Es válido solo si:
1. **cada mitad de la comparación tiene su propia cita de respaldo
   textual**, y
2. **la conclusión comparativa** ("difieren en...", "coinciden en...") es
   una lectura directa de esas citas, sin agregar matices, causas o
   consecuencias que ninguna de las dos afirme.

## Dónde vive cada ítem transversal

- **Evaluación:** con el `tema` transversal que la app reconoce (en
  Responsabilidad, `'Responsabilidad civil'`) en vez del nombre de una
  materia. Los tipos más naturales son Justificación ("¿en qué se
  diferencian X e Y respecto de...?") y Discriminación MC ("dado este
  caso, ¿qué régimen aplica y por qué?"); Aplicación también sirve si el
  caso obliga a decidir entre dos regímenes posibles. Hoy los 4 ítems
  transversales de Responsabilidad viven en `bancoTransversal`, dentro
  de `app/alternativas.html`.
- **Alternativas:** `materia: 'transversal'` (no `'general'`, que es la
  categoría residual). Así el ítem solo aparece con el filtro de área en
  "Todas", que es lo buscado.
- **Flashcards:** mismo criterio que Evaluación.
- **Memorice:** no aplica; se memoriza un artículo o una definición, no
  una comparación.

Antes de crear transversales para una materia de Civil fuera de
Responsabilidad (Acto Jurídico, Bienes...), confirmar con Laura qué
valor de `tema`/`materia` debe usarse y si la app ya lo muestra: el
valor transversal de hoy está pensado para Responsabilidad.

## Volumen

No es por tema: un lote aparte de **6 a 10 ítems transversales** en total
por grupo de materias, repartidos entre Evaluación, Alternativas y
Flashcards, priorizando los contrastes que los manuales ya desarrollan.

## Checklist específica

Además de la del núcleo y la del tipo:

- [ ] Cada mitad de la comparación tiene su propia cita de respaldo
      textual, y la conclusión no agrega nada que esas citas no digan.
- [ ] El ítem usa el valor transversal de `tema` o `materia`, no el de
      una sola materia.
