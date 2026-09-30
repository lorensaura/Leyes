# Acto Jurídico, capítulo IV (intro + A. La inexistencia jurídica) — chequeo de paráfrasis cercana

Fecha: 2026-09-30. Rama: `worktree-acto-juridico-cap4`, desde `origin/main`
(incluye todo el tramo 4: IV+V+VI completos).

## Alcance

Introducción del capítulo IV (definición de ineficacia, invalidez vs.
ineficacia en sentido estricto) más la letra A completa (La
inexistencia jurídica, puntos 1 a 4 con sus subpuntos 4.1 a 4.4).
Fuente: Boetsch `principal_9` (páginas 114-123 de 221).

Es el primer tramo que se escribió bajo el método nuevo ("tramo 1,
piloto"), trabajado de cerca con Laura en su momento. A diferencia del
capítulo I, **no** venía sin revisar: ya tenía citas atribuidas y
cuadros comparativos genuinamente reestructurados.

## Qué se encontró

Comparado oración por oración contra Boetsch:

- **La mayoría del tramo ya cumple la regla de voz propia**: la cita
  de BOETSCH sobre la ineficacia (intro) y sobre la inexistencia
  jurídica (A.1) están en bloques `.definicion`, textuales y
  atribuidas. La cita larga de CLARO SOLAR en A.4.1(ii) está completa,
  entre comillas y atribuida. Los dos cuadros comparativos
  (inexistencia vs. nulidad; CLARO SOLAR vs. ALESSANDRI) son
  reestructuración real, no transcripción de la fuente reordenada en
  filas. El ejemplo de Valentina y Matías (el precio que nadie fijó) es
  propio, no viene de Boetsch.
- **Tres pasajes sí eran paráfrasis cercana** (misma construcción de
  Boetsch con sinónimos cambiados, sin autor nombrado que la
  justifique):
  1. A.1, el párrafo "Dicho de otro modo, el acto es jurídicamente
     inexistente cuando le falta..." (antes del ejemplo de Diego y
     Sebastián).
  2. A.2 completo, "Origen de la teoría de la inexistencia jurídica"
     (los tres párrafos sobre ZACHARIAE, el axioma francés y el
     problema del matrimonio entre personas del mismo sexo).
  3. A.4.1(i), el párrafo sobre el art. 1701 ("Cuando la ley exige el
     instrumento público...").

## Qué se hizo

Se reescribieron esos tres pasajes en voz propia: mismo contenido,
mismos artículos, mismo vocabulario técnico, otra construcción de
oración. No se tocó nada más: ni las citas atribuidas, ni los cuadros,
ni los ejemplos, ni el resto de la prosa (que ya pasaba el chequeo).

Verificación mecánica: balance de etiquetas OK (`p`, `div`, `span`,
`em`, `strong`, `table`, `tr`, `th`, `td`), cero guiones largos y
guillemets, ningún párrafo sobre 1.200 caracteres, capturas de Chrome
headless revisadas bloque por bloque. No se tocó el índice.

## Siguiente paso

Sigue el resto del capítulo IV: B. Nulidad (el bloque más largo, con
sus cuatro sub-instituciones B.1 a B.4), C. La lesión, D. La
simulación, E. La inoponibilidad, F. El fraude a la ley, G. Otras
causales. Se revisan en ese orden, por partes, avisando antes de
seguir con la siguiente.
