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

## Límite de esta solución (explícito, no un pendiente silencioso)

Como el matching sigue siendo por substring literal, ninguna cantidad de
variantes cubre el 100% de las formas posibles de parafrasear: una
alumna puede reordenar o sinonimizar dentro de una misma frase de un
modo que ninguna keyword prevista contempla. Esta convención reduce el
problema de raíz (curación pobre de keywords) pero no lo elimina del
todo. Si después de aplicarla Laura sigue viendo corrección injustamente
estricta, el siguiente paso sería cambiar el mecanismo de comparación en
`app/alternativas.html` (ej. exigir las palabras con carga semántica de
cada `keyword` en cualquier orden, en vez de la frase completa como
substring), un cambio de código, no de contenido, que no se hizo acá
porque no fue lo pedido y afecta el comportamiento de todo el banco
existente.
