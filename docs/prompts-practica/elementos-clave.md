# Elementos clave y palabras clave: cómo redactarlos para la corrección flexible

> Referenciado por los prompts de **Aplicación**, **Detección de error** y
> **Justificación** (los tres tipos de Evaluación que piden una respuesta
> libre de la alumna, calificada por `elementos_clave`/`keywords`; no
> aplica a Alternativas ni Discriminación MC, que son multiple choice sin
> respuesta libre, ni a Memorice, que usa su propio mecanismo de
> `palabras_criticas` a propósito estricto). Aplican además, sin
> excepción, las reglas de `docs/prompts-practica/nucleo.md`.
>
> **Regla obligatoria (Laura, 2026-10-09): toda pregunta de Evaluación se
> redacta para la corrección flexible descrita aquí.** Las keywords no se
> escriben como frases que la alumna deba reproducir, sino como el
> **conjunto mínimo de palabras con significado que prueban que entendió
> el elemento**. Una pregunta que solo aprueba quien repite el manual de
> memoria está mal hecha, aunque su contenido jurídico sea correcto.

## Por qué existe este documento

Feedback real de Laura (2026-09-16 y 2026-10-09): la corrección de
Evaluación exigía respuestas demasiado específicas. La medición del
2026-10-09 lo confirmó: con la comparación literal de antes, en 86 de las
276 preguntas publicadas ni siquiera la propia respuesta modelo aprobaba,
y de 8 respuestas correctas escritas con palabras propias aprobaba 1. La
causa eran keywords pensadas como frases del manual ("razonamiento
riguroso", "no procede reserva de perjuicios en materia
extracontractual") que ninguna alumna escribe tal cual.

## Cómo corrige la app (hay que redactar pensando en esto)

`evaluarRespuesta()` y `keywordPresente()` en `app/alternativas.html`:

1. **Un elemento se logra si al menos una de sus keywords está presente**
   en la respuesta.
2. **Una keyword está presente** si aparece literal (sin tildes ni
   mayúsculas), **o** si **todas sus palabras con significado** aparecen
   en la respuesta **a no más de 8 palabras unas de otras, en cualquier
   orden**. No cuentan como palabras con significado: el, la, los, las,
   de, del, y, o, a, en, que, por, para, con, se, su, sus, un, una, lo,
   al, es, son, le, les, ya, este, esta.
3. **Cómo se compara cada palabra:** las de más de 3 letras, por su
   **raíz** (las primeras 5 letras: "ratificar", "ratificación" y
   "ratificó" son la misma; "nulidad" y "nulo" **no**, porque "nulo"
   tiene solo 4 letras y no coincide con "nulid"). Las de 3 letras o menos y los
   números, **exactas** ("no" no se confunde con "norma"; "1683" no se
   confunde con "1682").
4. **Para aprobar hay que lograr el 75% de los elementos:** con 3
   elementos, los 3; con 4, al menos 3.
5. **Repregunta:** si en la primera pasada la alumna logra entre el 35% y
   el 75% (por ejemplo, 2 de 3), la app **no** le muestra qué le faltó:
   le hace la **`pregunta` socrática de cada elemento faltante** y le da
   una segunda pasada para completar. Solo si después sigue faltando,
   muestra el veredicto final.
6. **"Lo dije con otras palabras":** en el veredicto final, la alumna
   puede marcar como logrado un elemento que el sistema no detectó. Queda
   registrado en `evaluacion_correcciones` y la IA lo revisa después
   (`scripts/revisar_correcciones_evaluacion.py`): si tenía razón, su
   forma de decirlo se agrega como keyword; si se aprobó algo incorrecto,
   se ajusta o se saca la keyword. Todo con aprobación de Laura.

## Regla de redacción

**El `texto`** del elemento es la idea completa que debía aparecer (la
alumna la ve en "Presentes" o "Faltantes"). **La `pregunta`** es la
repregunta: tiene que llevar a la alumna hacia ese elemento sin
regalárselo (no debe contener las palabras de sus keywords). Si una
pregunta no tiene buena repregunta para cada elemento, la segunda pasada
no sirve.

**Las `keywords`**, de 4 a 6 por elemento, cada una de **2 a 4 palabras
con significado** que juntas prueban el elemento:

1. **El núcleo técnico, reducido a sus palabras esenciales**, no la frase
   completa del manual. En vez de "la nulidad absoluta no puede sanearse
   por la ratificación de las partes", escribir "absoluta no ratificacion"
   o "no sanea ratificacion": la corrección flexible las encuentra en
   "la nulidad absoluta no se puede ratificar" y en "la ratificación no
   sanea la nulidad".
2. **La forma en que lo diría una alumna**, en lenguaje corriente
   ("no tiene que probar la culpa", "solo la victima puede pedirla").
3. **El número de artículo solo**, cuando el elemento gira en torno a él
   ("1691"). Ojo: un número es exacto; si dos elementos del mismo ítem
   citan el mismo artículo, no sirve para distinguirlos.
4. **Sinónimos de raíz distinta**, porque la raíz no los une: "rescision"
   y "anulacion"; "saneada" y "plazo vencido"; "herederos" y
   "sucesores".
5. **La conclusión del caso con sus datos**, en Aplicación ("marta ya no
   puede", "vencio marzo 2024"): obliga a haber resuelto el caso, no solo
   a nombrar la regla.

**Qué evitar, porque la corrección flexible lo castiga o lo deja pasar:**

- **Keywords de una sola palabra común** ("nulidad", "contrato",
  "herederos", "plazo"): aparecen en casi cualquier respuesta del tema y
  dan el elemento por logrado aunque esté mal. Una sola palabra solo vale
  si es un término técnico que por sí mismo prueba el elemento dentro de
  ese ítem ("cesionario", "impuber", "1685").
- **Keywords que ya están en el caso o en el enunciado**: cualquier
  respuesta que repita la pregunta las obtiene.
- **Keywords que no distinguen el sí del no**: si el elemento es "Ximena
  no puede pedirla", la keyword debe llevar la negación ("ximena no
  puede"), porque "ximena puede" también estaría en una respuesta
  equivocada. Aun así, la corrección no entiende frases enteras: una
  respuesta que diga lo contrario con las mismas palabras puede pasar.
  Por eso la keyword debe ser lo más cercana posible a la conclusión, no
  al tema.
- **Keywords de más de 4 palabras con significado**: exigen que la alumna
  use justo esas palabras; es volver a la frase exacta.
- **Variantes que cambian el sentido jurídico** del elemento (sigue siendo
  una regla anti-alucinación) o que podrían calzar con otro elemento del
  mismo ítem.

## Ejemplo

```js
{
  texto: 'Identifica que la culpa se presume en materia contractual (art. 1547)',
  keywords: [
    'culpa se presume', '1547', 'presuncion de culpa',
    'no tiene que probar la culpa', 'deudor debe probar diligencia'
  ],
  pregunta: 'En un contrato incumplido, ¿a quién le toca acreditar si hubo o no descuido?'
}
```

`'culpa se presume'` se encuentra también en "se presume la culpa" o "la
culpa del deudor se presume". `'no tiene que probar la culpa'` es como lo
dice una alumna. La `pregunta` orienta sin usar "presume" ni "1547".

## Cómo comprobarlo antes de cargar

- **Acto Jurídico:** `scripts/practica_aj/subir_eval.py` rechaza la tanda
  si la respuesta modelo, corregida con la misma regla que la app, no
  obtiene todos sus elementos; si una keyword está en el caso o el
  enunciado; si una keyword está en la repregunta de su propio elemento;
  si un elemento no tiene 4 a 6 keywords; y avisa de las keywords de una
  sola palabra.
- **Cualquier materia:** `python3 scripts/prueba_correccion_flexible.py`
  mide el banco publicado (respuesta modelo, respuestas de prueba y
  "ensalada" de palabras sueltas). Correrlo después de cargar contenido
  nuevo o de cambiar la corrección.
- **Prueba mental obligatoria por ítem:** escribir una respuesta correcta
  con palabras propias (sin mirar el manual) y una equivocada que use el
  vocabulario del tema. La primera debe obtener cada elemento; la
  segunda, no. Si falla, se corrigen las keywords, no la respuesta.

## Checklist específica

Además de la auto-auditoría del núcleo, verifica:

- [ ] Cada `elemento_clave` tiene entre 4 y 6 `keywords`, de 2 a 4
      palabras con significado cada una (salvo números de artículo o
      términos técnicos que por sí solos prueban el elemento).
- [ ] Al menos una `keyword` por elemento es como lo diría una alumna, no
      la frase del manual, y al menos una usa un sinónimo de raíz distinta
      cuando exista.
- [ ] Ninguna `keyword` está en el caso, en el enunciado ni en la
      `pregunta` de su propio elemento.
- [ ] Las keywords de un elemento con conclusión negativa llevan la
      negación.
- [ ] La `pregunta` de cada elemento sirve como repregunta: orienta hacia
      lo que falta sin regalarlo.
- [ ] La respuesta modelo obtiene todos los elementos con la corrección
      de la app.
- [ ] Ninguna `keyword` cambia el sentido jurídico del elemento respecto
      de la cita de respaldo.

## Medición y riesgo conocido (2026-10-09)

`python3 scripts/prueba_correccion_flexible.py`: con la corrección
flexible, la respuesta modelo aprueba en 254 de 293 ítems (antes 207);
respuestas correctas de prueba con palabras propias, 5 de 8 (antes 1);
respuestas equivocadas de prueba, 0 de 8 (igual que antes). Riesgo:
quien escribiera solo las palabras de las keywords revueltas aprobaría
casi siempre (235 de 293; antes 61). Las keywords no se le muestran a la
alumna, pero por eso importan las reglas de "Qué evitar" y la revisión
periódica de las aprobaciones flexibles. Quedan 39 ítems publicados de
Responsabilidad cuya respuesta modelo no aprueba ni con la corrección
flexible (ver `docs/camino-a-beta.md`).
