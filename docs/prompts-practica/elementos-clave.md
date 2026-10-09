# Elementos clave y palabras clave: cómo redactarlos para tolerar parafraseo

> Referenciado por los prompts de **Aplicación**, **Detección de error** y
> **Justificación** (los tres tipos de Evaluación que piden una respuesta
> libre de la alumna, calificada por `elementos_clave`/`keywords`; no
> aplica a Alternativas ni Discriminación MC, que son multiple choice sin
> respuesta libre, ni a Memorice, que usa su propio mecanismo de
> `palabras_criticas` a propósito estricto). Aplican además, sin
> excepción, las reglas de `docs/prompts-practica/nucleo.md`.

## Por qué existe este documento

Feedback real de Laura (2026-09-16): la pauta de corrección de Evaluación
se sintió muy estricta. La causa es mecánica, no de criterio: `app/alternativas.html`
(`evaluarRespuesta`) da por cubierto un `elemento_clave` si **al menos
una** de sus frases en `keywords` aparece **literal** (normalizada sin
tildes, en minúsculas) dentro de lo que escribió la alumna:

```js
const found = el.keywords.some(kw => texto.includes(quitarTildes(kw.toLowerCase())));
```

No hay sinónimos automáticos, ni tolerancia de orden de palabras, ni
fuzzy match: si ninguna de las frases que redactaste como `keywords`
aparece tal cual en la respuesta, ese elemento se marca como no logrado,
aunque la alumna haya dicho lo mismo con otras palabras. La única
palanca disponible hoy para tolerar parafraseo es **redactar más y
mejores variantes en `keywords`**, previendo cómo una alumna real diría
lo mismo, no solo cómo lo dice el manual.

## Regla de redacción

Por cada `elemento_clave`, después de escribir el `texto` (la idea que
debía aparecer) y la `pregunta` socrática, genera un arreglo `keywords`
de **4 a 6 variantes** que cubran, cuando aplique:

1. **La frase técnica tal como aparece en el manual** (la cita de
   respaldo del paso 1 de `nucleo.md`).
2. **Una paráfrasis en lenguaje corriente**, como la diría una alumna sin
   citar el manual de memoria.
3. **El número de artículo solo**, si el elemento gira en torno a un
   artículo puntual (a veces la alumna solo escribe "1547" en vez de
   nombrar la institución).
4. **El nombre corto de la institución**, sin el resto de la frase, si
   por sí solo ya identifica el elemento sin ambigüedad dentro del ítem.
5. **Una variante con orden de palabras distinto** de la frase técnica,
   cuando el orden natural al escribir difiere del orden del manual (ej.
   "la culpa se presume" además de "se presume la culpa").

No agregues una variante que cambie el sentido jurídico del elemento:
esto sigue siendo una regla anti-alucinación, cada variante debe ser una
forma distinta de decir lo mismo, no una idea distinta. Si una variante
quedaría ambigua o podría hacer match con la respuesta de un elemento
distinto del mismo ítem, no la agregues: es preferible perder algo de
tolerancia que dar crédito a la idea equivocada.

## Ejemplo

```js
{
  texto: 'Identifica que la culpa se presume en materia contractual (art. 1547)',
  keywords: [
    'se presume', '1547', 'presuncion de culpa', 'la culpa se presume',
    'no tiene que probar la culpa', 'se presume la culpa del deudor'
  ],
  pregunta: '¿Quién debe probar la culpa en materia contractual?'
}
```

La keyword `'no tiene que probar la culpa'` no aparece en el manual con
esas palabras, pero es como una alumna real suele expresar la misma idea
(la presunción libera a la víctima de la carga de la prueba) sin citar
el artículo textualmente.

## Checklist específica

Además de la auto-auditoría del núcleo, verifica:

- [ ] Cada `elemento_clave` tiene entre 4 y 6 `keywords`, no 1 ni 2.
- [ ] Al menos una `keyword` por elemento es una paráfrasis en lenguaje
      no técnico, no solo la frase literal del manual.
- [ ] Ninguna `keyword` es tan corta o genérica que podría aparecer en
      la respuesta de un elemento distinto del mismo ítem por
      casualidad (ej. una sola palabra común como "contrato" o
      "responsabilidad" sin ningún calificador).
- [ ] Ninguna `keyword` cambia el sentido jurídico del elemento respecto
      de la cita de respaldo.

## Corrección flexible y registro de reclamos (2026-10-09)

Lo que anticipaba la versión anterior de esta sección ya se hizo, a pedido
de Laura. `keywordPresente()` en `app/alternativas.html` da por presente
una keyword si aparece **literal** o si **todas sus palabras con
significado aparecen cerca** (ventana de 8 palabras), en cualquier orden,
comparando por raíz (primeras 5 letras) las de más de 3 letras y en forma
exacta las cortas y los números (para no confundir "no" con "norma"). El
umbral para aprobar sigue en 75%.

Además, en el veredicto final cada elemento faltante tiene el botón **"Lo
dije con otras palabras"**: la alumna lo marca como logrado, sube su
crédito y, si aprueba, sale del cuaderno de errores. No aparece en la
segunda pasada (ahí los faltantes se ocultan a propósito).

Cada corrección final y cada reclamo quedan en `evaluacion_correcciones`
(con el texto de la respuesta). `python3
scripts/revisar_correcciones_evaluacion.py` los junta por pregunta y
elemento en `DERECHO LIBRE/Documentos de trabajo/`, y la IA los revisa:
reclamos legítimos se vuelven keywords nuevas; aprobaciones flexibles o
por reclamo que no correspondían llevan a ajustar o sacar keywords. Todo
pasa por Laura antes de tocar Airtable.

Medición (`python3 scripts/prueba_correccion_flexible.py`, 2026-10-09):
la respuesta modelo aprueba en 254 de 293 ítems (antes 207); respuestas
correctas de prueba con palabras propias, 5 de 8 (antes 1); respuestas
equivocadas de prueba, 0 de 8 (igual que antes). Riesgo conocido: quien
escribiera solo las palabras de las keywords revueltas aprobaría casi
siempre (235 de 293; antes 61). Las keywords no se le muestran a la
alumna, pero por eso importa revisar las aprobaciones flexibles.

**Consecuencias para redactar keywords:** siguen valiendo las reglas de
arriba, con dos ajustes. (1) Evitar keywords de una o dos palabras muy
generales: con la ventana, son las que más fácil dan un falso positivo.
(2) Una keyword no debe estar ya contenida en el caso o el enunciado
(`subir_eval.py` de AJ lo controla).
