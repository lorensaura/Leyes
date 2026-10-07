# Estado: actualización de Bienes al método nuevo

> Se actualiza **in place** cada vez que Laura diga "guarda el estado
> [de Bienes]". Al decir "retoma Bienes" (o "empecemos Bienes"), leer
> este archivo completo primero y resumir en pocas líneas dónde quedó
> antes de seguir. Última actualización: 2026-10-07 (creado al cerrar
> Acto Jurídico; la actualización de Bienes todavía no empieza).

## Paso 0, obligatorio: leer las lecciones de Acto Jurídico

**Antes de tocar Bienes, leer completo
`docs/manuales/lecciones-acto-juridico.md`.** Acto Jurídico tuvo que
pasarse cuatro veces (y dos veces por varios capítulos) porque las
reglas fueron naciendo mientras se trabajaba y una de ellas (paráfrasis
cercana) se dio por cumplida sin chequearla. Laura pidió expresamente
(2026-10-07) que **Bienes se haga en una sola pasada**, con todo lo
aprendido aplicado desde el primer tramo. La sección 6 de ese reporte
trae el checklist único por tramo: usarlo en cada informe.

Después leer, en este orden: `actualizar-manuales-existentes.md`,
`proceso.md`, `guia-editorial.md`, `formato.md` (secciones que apliquen)
y `bienes-reestructuracion.md` (estructura actual del manual). El
archivo `estado_acto-juridico.md` sirve de modelo de cómo se lleva este
estado y trae el comando de Chrome headless que funciona.

## Dónde estamos

- Manual: `05_Bienes_Manual.html`, ya en capítulos romanos I-VII
  (estructura de Boetsch). Detalle en `bienes-reestructuracion.md`.
- **Ojo:** los tramos I a IV, V.1-V.3, V.4.A y V.4.B figuran como
  "revisados", pero **solo se revisaron por fidelidad a la fuente**
  (método de agosto-septiembre, `docs/incidente_compresion_manuales.md`),
  antes de la voz propia, el inventario exhaustivo, los ejemplos propios
  y las cajas nuevas. **No darlos por terminados:** pasan por el método
  completo igual que el resto, conservando lo que Laura ya agregó o
  corrigió (regla central de `actualizar-manuales-existentes.md` 1).
- Todavía no hay ningún tramo hecho con el método nuevo.

## Decisiones tomadas con Laura (2026-10-07)

1. **Ejemplos: pasada final común.** Se dejan los ejemplos genéricos de
   Boetsch por ahora; la redacción de ejemplos propios se hace al final,
   en una pasada aparte para todos los manuales. No se abre una tercera
   vuelta por esto en Bienes.
2. **Numeración: reformatear al inicio**, antes del tramo 1, en vez de
   por tramo o de dejarla como está.
3. **Hoja de estilos: igualar a la de AJ al inicio**, antes del tramo 1
   (tipografía de las 2 tablas de Bienes y clases nuevas que falten).
4. **Anexos grandes: mapa primero.** Se arma un mapa breve de qué trae
   cada anexo grande antes de tocar el tramo 1; Laura elige qué entra y
   dónde (`proceso.md` 5).

## Decisión pendiente (no resuelta todavía)

5. **Reparto de tramos** por página real de Boetsch (unas 10 páginas;
   más chico si el tema es muy preguntado). Todavía no se armó la tabla.
   Anotarla aquí, como la de `estado_acto-juridico.md`, una vez que el
   reformato de numeración esté aprobado y hecho (tiene que repartirse
   sobre la numeración final, no la vieja).

## Relevamiento del reformato de numeración (2026-10-07)

Hecho: conteo completo de encabezados del manual (544 en total: 7 `h1`,
47 `h2`, 107 `h3`, 164 `h4`, 105 `h5`, 73 `h6`, 36 `div.h7`, 5 `div.h8`;
34 sin número) y grep de referencias cruzadas. **Buena noticia: no hay
riesgo de romper nada afuera.** Ningún otro manual enlaza a
`05_Bienes_Manual.html`, no hay referencias internas tipo "ver II.3" o
"V.4." dentro del propio texto, y `app/manuales.html` solo tiene el
nombre "Bienes y Derechos Reales" en una lista, sin anclas a secciones.

Conclusión de magnitud: clasificar cada uno de los ~380 encabezados
profundos (`h4` en adelante) como clasificación nueva o lista de
requisitos (la distinción de `formato.md` para `(i)`) es un trabajo que
requiere leer el contenido de cada punto, no se puede resolver de una
sentada separada del tramo. Recomendación (pendiente de aprobación de
Laura): dividir el reformato en dos fases, igual que pasó de hecho en
AJ.

- **Fase 1, ahora, antes del tramo 1:** solo los niveles 1 a 5 de la
  escalera (capítulo, tema, institución, punto, subpunto): deshacer el
  nivel intermedio `V.1.`/`II.1.` convirtiéndolo en temas con letra,
  mayúsculas a normal, ids con el patrón de `formato.md` 1.2, índice
  reconstruido. Las dos colisiones reales que necesitan decisión de
  Laura antes de tocar nada:
  - **V.4 La tradición:** al subir a tema (letra), sus A-D internas
    (descripción general, requisitos, efectos, formas) pasan a
    instituciones D.1-D.4; dentro de D.4 (formas), las 4 formas actuales
    bajan a puntos 1-4. La forma inmuebles (sistema registral) es la más
    extensa de Boetsch: falta decidir si cabe como un punto más o si
    necesita su propia institución.
  - **V.5 La prescripción:** A. La posesión (con A.1-A.7 internos) y B.
    La prescripción adquisitiva pasarían a instituciones E.1 y E.2 de un
    tema "Prescripción"; los A.1-A.7 de la posesión bajarían a puntos
    1-7 de esa institución. Repregunta si esto respeta la decisión del
    2026-09-16 de no darle a la Posesión su propio romano, dado el peso
    real que tiene (7 sub-instituciones).
- **Fase 2, por tramo:** las enumeraciones profundas (`(i)`, `a)`,
  `a.1)`) se deciden al reescribir cada tramo con el método completo,
  igual que el resto del contenido (voz propia, inventario, etc.), no
  antes.

## Decisión sobre el capítulo V (2026-10-07): no se renumera

Laura aprobó la división en dos fases y el capítulo II como piloto
(informe `Informes/Informe_Bienes_reformato-piloto-II.html`). Al
revisar la colisión de V.4/V.5, aclaró algo más importante: **el
capítulo V mantiene su nivel intermedio V.1-V.6** (Aspectos generales,
Ocupación, Accesión, Tradición, Prescripción, Sucesión por causa de
muerte), en vez de aplastarlo en una sola secuencia de letras por
capítulo como en II. La razón que dio: así, dentro de cada V.n, se
puede partir de nuevo con letra propia (A., B., C.) cuando el tema lo
necesita, por ejemplo "A. Posesión" dentro de V.5 Prescripción.

**Verificado contra el manual real: esto ya es exactamente como está
hoy.** V.4 La tradición ya tiene A, B, C, D (con D.1-D.4 adentro); V.5
La prescripción ya tiene A (con A.1-A.6) y B (con B.1-B.9); V.6 La
sucesión ya tiene A, B, C. **No hay colisión ni renumeración pendiente
en V: se queda tal cual está.** Las "colisiones" que anoté antes (V.4 y
V.5) quedan resueltas por esta decisión, no por una tabla de
conversión.

**Lo único que falta para V (no bloqueante para el piloto de II):**
definir en `formato.md` el estilo visual nuevo de estos niveles dentro
de V.n:
- Letra (A., B., C., institución): centrado, mayúscula, sin negrita (ya
  existe como `h2.inst` en la escalera).
- Sub-letra (A.1, A.2..., cuando una institución tiene sub-instituciones
  propias, como la Posesión con A.1-A.6): centrado, mayúscula, sin
  negrita, **cursiva** (nuevo, no existe hoy en `formato.md`), tamaño
  algo menor que la institución. Confirmado por Laura con el mockup de
  `Informes/Informe_Bienes_reformato-piloto-II.html` sección 6.
- Falta decidir con Laura el estilo del propio nivel V.n ("V.4. La
  tradición"): hoy renderiza como un punto normal (rojo, a la
  izquierda, subrayado), no como un tema. Proponer mockup cuando se
  llegue al tramo de V.

## Siguiente paso exacto

**Implementar el piloto del capítulo II** (aprobado): tabla de la
sección 2 del informe, con dos ajustes que pidió Laura:
- Los puntos (nivel "1. Concepto") ya salen en mayúscula por CSS
  (`h2{text-transform:uppercase}`, verificado en la hoja de estilos
  actual de Bienes); no hay que escribirlos en mayúscula en el HTML.
- B.4.3 Inmuebles por destinación: sus dos hijos pasan a `a)` y `b)`
  subrayados (no `(i)`), y si hace falta un nivel más abajo, `(i)`,
  `(ii)` sin negrita, más indentado. Es una excepción al orden habitual
  de la escalera (que pondría `(i)` antes de `a)`), aprobada por Laura
  para este punto específico.

Implementar en una rama: script a partir de la tabla aprobada, hoja de
estilos copiada del `<style>` real de AJ (no del bloque de
`formato.md`) en un commit aparte, índice del capítulo II reconstruido,
y verificar: mismo número de encabezados antes/después, texto de cuerpo
(sin tags, sin títulos ni índice) idéntico, ids únicos, todo
`href="#..."` resuelve, cero guiones largos, capturas en Chrome headless
y vista previa en `Vista_previa/`. Después de II, seguir con I, III, IV
(solo ids y mayúscula, ya siguen casi toda la escalera), y recién al
final V, VI, VII con sus propias reglas.
