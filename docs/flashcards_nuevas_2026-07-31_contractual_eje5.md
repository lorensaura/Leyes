# Flashcards nuevas para el eje 5 de Contractual (2026-07-31)

> Borrador de Claude, generado a partir de
> `01_Responsabilidad_Contractual_Manual.html` (líneas 1058-1102, sección
> `s5d` "4. Primer requisito: incumplimiento imputable") siguiendo
> `docs/prompt-generacion-contenido-practica.md`. **Sin revisar por Laura
> todavía. Nada de esto está en Airtable ni en Supabase.**
>
> Eje 5 ("Requisitos de la indemnización de perjuicios") es, según
> `docs/cobertura_subtema_rec_2026-07-31.md`, el único hueco simultáneo en
> las tres columnas (Evaluación, Flashcards, Alternativas) — terreno
> virgen, sin riesgo de redundancia con nada existente. El manual
> enumera explícitamente **seis requisitos copulativos** (línea 1060,
> siguiendo a ORREGO/ALESSANDRI); las 5 tarjetas de abajo cubren esa
> enumeración y su lógica, sin invadir el desarrollo detallado de cada
> requisito por separado (eso ya está cubierto en otros ejes: dolo/culpa
> en eje 6-7, mora en eje 9, perjuicios en eje 12, causalidad no
> desarrollada aparte en este manual, causales de exención en eje 17).

---

1. **(básica)**
   - **pregunta:** Enumere los seis requisitos que deben concurrir copulativamente para que proceda la indemnización de perjuicios, según ORREGO (siguiendo a ALESSANDRI).
   - **respuesta:** 1.º Incumplimiento; 2.º que sea <b>imputable</b> (dolo o culpa); 3.º que el deudor esté en <b>mora</b>; 4.º que existan <b>perjuicios</b>; 5.º <b>relación de causalidad</b>; 6.º que no concurra una <b>causal de exención</b>.

2. **(básica)**
   - **pregunta:** ¿Qué significa que estos seis requisitos sean "copulativos"?
   - **respuesta:** Que deben concurrir <b>todos</b>: basta que falte uno solo para que no proceda la indemnización, aunque los demás sí estén presentes.

3. **(básica)**
   - **pregunta:** ¿Qué dos formas reviste la imputabilidad en materia contractual?
   - **respuesta:** El <b>dolo</b> y la <b>culpa</b> (a las que ORREGO agrega, como tercera modalidad de imputación, el <em>hecho del deudor</em>).

4. **(intermedia)**
   - **pregunta:** Si el incumplimiento de un contrato se debe a un hecho ajeno e irresistible al deudor, ¿qué ocurre con la obligación de indemnizar?
   - **respuesta:** El deudor queda <b>exonerado</b>: falta el requisito de <b>imputabilidad</b>, porque el incumplimiento no proviene de su dolo, culpa o hecho propio, sino de caso fortuito o fuerza mayor.

5. **(intermedia)**
   - **pregunta:** ¿Por qué el manual trata "que no concurra una causal de exención" como un requisito aparte, y no simplemente como la ausencia de imputabilidad?
   - **respuesta:** Porque aunque el incumplimiento sea imputable (haya dolo o culpa) y estén presentes los demás requisitos, la indemnización igual puede rechazarse si el deudor acredita una <b>causal de exención</b> distinta (se desarrollan en la Sección 6 del manual, eje 17).

---

## Auto-auditoría (sección 6 del prompt maestro)

- [x] Cada artículo citado (ninguno en este lote: el listado de los 6
      requisitos, línea 1060, no cita artículos por número) respalda su
      afirmación en el pasaje leído.
- [x] Ninguna jurisprudencia citada (este lote no usa ninguna).
- [x] Atribución a ORREGO/ALESSANDRI verificada contra el texto ("ORREGO,
      siguiendo a ALESSANDRI, los enumera del siguiente modo").
- [x] Cero guiones largos, cero guillemets.
- [x] Ninguna pregunta revela la respuesta directamente.
- [x] Verificado contra el resto de la cobertura del eje (hoy en 0 en
      Evaluación/Flashcards/Alternativas): no hay nada existente con lo
      que redundar.
- [x] No se invade el desarrollo específico de cada requisito individual
      (dolo/culpa, mora, perjuicios, causales de exención), que
      corresponde a otros ejes ya con contenido propio.

**Conteo:** 5 tarjetas nuevas, 0 descartadas. Eje 5 pasa de 0 a 5
Flashcards.

## Para subir

Estas tarjetas siguen el flujo normal de Flashcards: van en la base
Airtable **"Digesto Contractual"**, tabla **`Flashcards`**, con `materia
= "Responsabilidad contractual"` y `tema` linkeado al eje 5
("5. Requisitos de la indemnización de perjuicios"), y después se corre
`scripts/sync_airtable_supabase.py`. No se insertaron directo en
Supabase (ni se intentó: la escritura en producción está bloqueada para
Claude por el modo auto). Pendiente de que Laura las revise y decida
cómo cargarlas.
