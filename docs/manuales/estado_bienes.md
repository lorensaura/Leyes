# Estado: actualización de Bienes al método nuevo

> Se actualiza **in place** cada vez que Laura diga "guarda el estado
> [de Bienes]". Al decir "retoma Bienes" (o "empecemos Bienes"), leer
> este archivo completo primero y resumir en pocas líneas dónde quedó
> antes de seguir. Última actualización: 2026-10-08 (tramo 1b reescrito con
> los ajustes de Laura al informe; siguiente: tramo 2a).

## Resumen para retomar (léelo primero)

- **Reformato de numeración: terminado y mergeado a `main`**
  (commit `c03dac9`, rama `bienes-reformato-cap2` ya borrada). Los 7
  capítulos tienen el aspecto correcto de la escalera. Detalle completo
  más abajo ("Piloto del capítulo II" y "Primera revisión de Laura").
- **Reparto de tramos: corregido el tramo 1** (ver sección "Reparto de
  tramos" y "Corrección del tramo 1"); el resto sigue como estimado,
  ~43 tramos por página real de Boetsch.
- **Mapa de anexos grandes: hecho** (sección "Mapa de los anexos
  grandes"). Laura decidió: **todos entran, según toque el tramo**. Dos
  correcciones puntuales al mapa tras trabajar el tramo 1a: ver
  "Corrección del tramo 1".
- **Excurso de VI** (derecho real de conservación ambiental): confirmado
  que no va en el apunte, hay que borrarlo del manual cuando se trabaje
  el tramo 19. Distinto de la mención puntual de una línea al derecho
  real de conservación (Ley 20.930) en II.A.4.1(iv), que Laura confirmó
  mantener (no es el mismo caso).
- **Pendiente de Fase 2** (no bloquea el inicio del contenido, se
  resuelve tramo por tramo): encabezados sin número, el gris de las
  `a)/b)/c)` del sistema registral (tiene que volver a negro), el
  estilo del propio "V.4." como tema (ya quedó resuelto y aplicado, ver
  "Primera revisión de Laura").
- **Tramo 1a (Capítulo I + II.A, p. 18-28 de Boetsch): terminado y
  aprobado por Laura (2026-10-07).** Es el primer tramo de Bienes hecho
  con el método completo. Detalle en "Tramo 1a: hecho y aprobado", más
  abajo.
- **Tramo 1b (II.B, p. 28-36): reescrito (2026-10-08)** con los
  ajustes de Laura al informe `Informes/Informe_Bienes_tramo1b.html`.
  Detalle en "Tramo 1b: hecho", más abajo. Siguiente: tramo 2a, ver
  "Siguiente paso exacto" al final de este archivo.

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
- **El Capítulo I y II.A (tramo 1a) ya están hechos con el método
  nuevo** (voz propia, inventario, anexos cotejados). El resto de los
  tramos "revisados" (II.B en adelante hasta V.4.B) sigue en la
  situación de arriba: pendientes del método completo.

## Decisiones tomadas con Laura (2026-10-07)

1. **Ejemplos (precisado por Laura el 2026-10-08, no cambiar):** lo
   que se deja para la pasada final común de todos los manuales son
   solo los **ejemplos genéricos que van en el texto** (los de Boetsch
   tipo "las losas de un pavimento"). Las **cajas de Ejemplo se
   reescriben como propias en el mismo tramo**, y además **siempre se
   crean ejemplos nuevos** donde ayuden (la respuesta de Laura a "¿agrego
   ejemplos?" es siempre sí): quiere el manual lleno de ejemplos
   propios. Reglas en `guia-editorial.md` 5.
2. **Numeración: reformatear al inicio**, antes del tramo 1, en vez de
   por tramo o de dejarla como está.
3. **Hoja de estilos: igualar a la de AJ al inicio**, antes del tramo 1
   (tipografía de las 2 tablas de Bienes y clases nuevas que falten).
4. **Anexos grandes: mapa primero.** Se arma un mapa breve de qué trae
   cada anexo grande antes de tocar el tramo 1; Laura elige qué entra y
   dónde (`proceso.md` 5).

## Reparto de tramos (decisión 5, propuesta 2026-10-07)

Páginas reales de Boetsch (header "Página N de 382" de cada PDF, no
paginación de PDF fragmentado). Las 20 partes van de la p. 18 a la 382
(364 páginas reales). ~10 páginas por tramo, más chico en los temas
clásicos de examen (tradición registral, posesión, prescripción), igual
que en AJ.

| # | Páginas reales | Parte(s) Boetsch | Tema aprox. del manual |
|---|---|---|---|
| 1a | 18-28 | 1 | I. Aspectos generales + II.A Bienes corporales e incorporales (corregido 2026-10-07, hecho y aprobado: ver "Tramo 1a: hecho y aprobado") |
| 1b | 28-36 | 1 | II.B Bienes muebles e inmuebles (corregido 2026-10-07; antes decía 27-36 y II.A). Hecho 2026-10-08 |
| 2a | 36-44 | 2 | II.C-D aprox. (consumibles, fungibles); el límite real con 1b queda en p. 36, no en p. 44 como asumía el reparto original. Revisar el corte exacto al llegar a este tramo |
| 2b | 44-51 | 2 | II.C-K (consumibles, fungibles, principales, divisibles, singulares, presentes, comerciables, apropiables, públicos) |
| 3 | 52-63 | 3 | III. El dominio |
| 4a | 63-72 | 4 | IV. La copropiedad (1ª mitad) |
| 4b | 72-80 | 4 | IV. La copropiedad (2ª mitad) |
| 5a | 81-88 | 5 | V.1 Aspectos generales (modos de adquirir) |
| 5b | 88-94 | 5 | V.2 La ocupación |
| 6a | 95-103 | 6 | V.3 La accesión (1ª mitad) |
| 6b | 103-110 | 6 | V.3 La accesión (2ª mitad) |
| 7a | 111-118 | 7 | V.4.A Tradición, descripción general |
| 7b | 118-125 | 7 | V.4.B Tradición, requisitos |
| 7c | 125-129 | 7 | V.4.C Tradición, efectos |
| 8 | 129-141 | 8 | V.4.D.1 Tradición de muebles |
| 9a | 142-150 | 9 | V.4.D.2 Sistema registral: introducción y fundamentos |
| 9b | 150-160 | 9 | V.4.D.2 Sistema registral chileno (el grueso: Repertorio, Registro, inscripciones) |
| 9c | 160-166 | 9 | V.4.D.2 cont. (cuotas, inscripciones por sucesión, prescripción) |
| 10a | 166-175 | 10 | V.4.D.3 Tradición del derecho de herencia |
| 10b | 175-183 | 10 | V.4.D.4 Tradición de derechos personales |
| 11a | 184-191 | 11 | V.5.A.1 Posesión, aspectos generales |
| 11b | 191-198 | 11 | V.5.A.2 Clases de posesión (regular: concepto, justo título) |
| 11c | 198-204 | 11 | V.5.A.2 cont. (buena fe, tradición, ventajas) |
| 12 | 204-213 | 12 | V.5.A.2 cont. (posesión irregular y viciosa) |
| 13a | 213-220 | 13 | V.5.A.3 Mera tenencia |
| 13b | 220-228 | 13 | V.5.A.4 Transmisibilidad, agregación, interversión |
| 13c | 228-235 | 13 | V.5.A.5 ACP posesión de muebles |
| 14 | 235-245 | 14 | V.5.A.5 ACP posesión de inmuebles (posesión inscrita) + A.6 prueba — **candidato a dividir en 2-3 cuando se llegue**, es de los temas más preguntados |
| 15a | 246-253 | 15 | V.5.B.1-B.3 Prescripción adquisitiva: nociones, fundamento, características |
| 15b | 253-259 | 15 | V.5.B.4 Reglas comunes |
| 15c | 259-264 | 15 | V.5.B.5 Elementos (cosa, posesión, inicio del tiempo) |
| 16a | 264-273 | 16 | V.5.B.5 cont. (tiempo, interrupción, suspensión) |
| 16b | 273-283 | 16 | V.5.B.6-9 + V.6.A Sucesión, ideas generales |
| 17a | 283-290 | 17 | V.6.B Apertura de la sucesión |
| 17b | 290-297 | 17 | V.6.C El derecho de herencia |
| 17c | 297-303 | 17 | VI inicio: propiedad fiduciaria |
| 18a | 304-313 | 18 | VI.2 Usufructo (1ª mitad) |
| 18b | 313-323 | 18 | VI.2 Usufructo (2ª mitad) / VI.3 Uso y habitación |
| 19 | 324-336 | 19 | VI.4 Servidumbres |
| 20a | 357-365 | 20 | VII.1-2 Formas de protección, acción reivindicatoria (1ª parte) |
| 20b | 365-374 | 20 | VII.2 cont. Acción reivindicatoria |
| 20c | 374-382 | 20 | VII.3 Acciones posesorias |

Los cortes dentro de cada parte (1a/1b, 2a/2b...) son un estimado por
página, no verificado contra el contenido exacto de cada sub-punto; se
ajustan al llegar a ese tramo, igual que en AJ cuando un tema resultó
más preguntado de lo previsto (el error se dividió en 3). Total: ~43
tramos, antes de decidir si el 14 se divide.

**El hueco de páginas 337-356 no es un hueco real:** Laura confirmó
(2026-10-07) que ahí va el "Excurso: el derecho real de conservación",
que es sobre **conservación ambiental**, no viene de Boetsch y **no va
en el apunte**. El manual hoy lo tiene (`id="cVI-Excurso"`, al final del
capítulo VI): hay que borrarlo cuando se trabaje el tramo 19
(Servidumbres, el último de VI).

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

## Piloto del capítulo II: hecho (2026-10-07)

Rama `bienes-reformato-cap2`, tres commits:
1. Hoja de estilos de Bienes igualada a la de AJ (colores h1/h2
   corregidos, `h2.grupo`/`h2.inst` agregados, tipografía de las 2
   tablas corregida, clases nuevas `.ley`/`.definicion`/
   `.pregunta-clasica`/`.no-olvidar`/`.conexiones` y las variantes
   `.enum-i`/`.enum-a` con `.lista` y `-run`. Se mantuvieron sin tocar
   `h5` (Bienes la usa distinto a AJ para niveles profundos aún sin
   convertir) y `h6`/`div.h7`/`div.h8` (siguen en uso fuera de II).
2. Capítulo II reformateado: II.1-II.11 a temas A-K (`h2.grupo`),
   puntos `h3`→`h2`, subpuntos `h4`→`h3`, ids `cII-<letra>...`,
   mayúscula fija del HTML pasada a texto normal. B.4.3 Inmuebles por
   destinación con la excepción pedida por Laura: `a)`/`b)` subrayados
   y sus `(i)(ii)(iii)` sin negrita, indentados.
3. Índice del capítulo II actualizado con los mismos ids (37 hrefs).

**Verificado:** 542 encabezados en todo el documento (−2 esperado por
los dos `h5` de B.4.3 convertidos a `a)`/`b)`), ids únicos, todo
`href="#..."` resuelve, cero guiones largos, y los 124 párrafos de
contenido del capítulo quedaron carácter por carácter idénticos
(ninguna prosa se tocó). Capturas en Chrome headless confirmaron el
aspecto: capítulo en rojo, temas centrados en negro, puntos en
mayúscula automática por CSS, subpuntos subrayados, `a)`/`b)` sin
negrita. Vista previa en `Vista_previa/Bienes_vista_previa.html`,
abierta en el ancla `#cII`.

**Pendiente:** la aprobación final de Laura sobre la vista previa antes
de mergear la rama a `main` y borrar la rama.

## Primera revisión de Laura y correcciones (2026-10-07, mismo día)

Laura revisó y encontró 3 problemas, todos corregidos en la misma rama:

1. **Regresión real, causada por mí:** al poner `.enum-i` en negrita para
   los `(i)/(ii)` nuevos, afectó también a los 65 que ya existían en el
   resto del manual (sin `span.tit`, solo texto corrido), dejándolos en
   negrita completa en vez de con solo la frase esencial resaltada.
   Arreglado con `.enum-i:not(:has(.tit)){font-weight:400}`: no toca el
   markup, solo restringe la negrita a cuando hay `.tit` (markup nuevo).
2. **Índice en negro:** `.toc a` había quedado en negro siguiendo la
   convención de AJ, que da ese color solo porque su índice distingue
   capítulos con `.toc > .toc-lista > li > a`. El de Bienes todavía usa
   `<ul>/<li>` planas sin esa estructura. Revertido a rojo para todos
   los enlaces hasta que el índice se reestructure (no ahora).
3. **V.1-V.6 no tenían el aspecto correcto:** "V.1. Aspectos generales"
   se veía como un punto (negro, a la izquierda, subrayado) en vez de
   como una especie de tema (centrado, negrita, mayúscula, más grande).
   Se reformateó **todo el capítulo V** (no solo II), además de VI y
   VII:
   - V.1-V.3, VI.1-VI.4, VII.1-VII.3 (sin letras internas): mismo
     tratamiento uniforme que II (tema a `h2.grupo`, punto `h3`→`h2`,
     subpunto `h4`→`h3`).
   - **V.4, V.5, V.6 (con letras A./B./C./D. internas, algunas con su
     propio desarrollo A.1-A.6, B.1-B.9, D.1-D.4): mapeo por la
     profundidad real del id**, no por etiqueta a ciegas (ver commit
     `0fb6042`). Letra → `h2.inst` (ya existía en `formato.md`).
     Letra.número con desarrollo propio → **`h2.subinst`, clase nueva**:
     centrado, mayúscula, sin negrita, cursiva, más chica que la
     institución (el estilo que Laura confirmó con el mockup de
     Posesión). Lo que cuelga de ahí sin más desarrollo → punto; lo que
     cuelga de un punto → subpunto. Verificado con capturas en V, V.4,
     V.4.D (los tres niveles) y V.5.A: coincide exactamente con lo
     pedido.
4. **Nota de Laura sobre negrita** ("solo lo esencial, no todo el
   requisito"): ya es la regla de `formato.md` sección 3; no aplica
   contenido nuevo ahora (el ejemplo que pegó, sobre materiales/plantas
   incorporados al suelo, es de V.3 La accesión, todavía no reescrito
   con el método completo). Queda anotado para ese tramo.

**Encabezados sin número o más profundos que la escalera, detectados
durante el mapeo de V.4-V.6 (sin tocar, para decidir con Laura cuando
se llegue a esos tramos):** el Excurso de VI ("Excurso: el derecho real
de conservación", sin número), varios `h4` sueltos en VI y VII (ej.
"Usufructo y cuasiusufructo", "Reglas comunes"), y dentro de V.5.A.2 y
V.5.A.5 un grupo de encabezados sin número ("Títulos constitutivos de
dominio", "El Repertorio", "Teoría de la posesión inscrita", etc.).

**Pendiente para el tramo de V.4.D.2 (el sistema registral):** Laura
notó (2026-10-07) que las `a)/b)/c)` ahí (nivel `div.h7`) se ven en gris
(`#555`), no en negro. Es el diseño original de Bienes, que aclara el
gris por nivel de profundidad (`h3`/`h4` `#222`, `h5` `#333`, `h6`
`#444`, `div.h7`/`div.h8` `#555`): no lo toqué ahora porque ese nivel es
Fase 2. **Decisión de Laura: dejarlo así por ahora, pero ese gris tiene
que volver a negro cuando se trabaje ese tramo.**

## Mapa de los anexos grandes (decisión 4, 2026-10-07)

Revisé la carpeta `Apuntes/CIVIL/Bienes/` completa: hay más anexos de
los que estaban anotados originalmente. Mapa de qué trae cada uno (sin
leerlos a fondo todavía, Laura elige qué entra y en qué tramo,
`proceso.md` 5):

**Descubrimiento aparte:** `BOETSCH Apuntes Bienes 2021.pdf` (382
páginas) es el **Boetsch completo sin fragmentar**. Sirve como
respaldo/verificación cuando haga falta confirmar un límite entre
partes del reparto, no es un anexo de otro autor.

| Archivo | Páginas | Qué trae | Dónde pegaría |
|---|---|---|---|
| `BIENES, PROPIEDAD...PEÑAILILLO.pdf` | 68 | Resumen (no el libro completo pese al nombre): Primera Parte (conceptos fundamentales, clasificaciones) y Segunda Parte (propiedad, posesión, copropiedad, modos de adquirir) **hasta accesión** (edificación/siembra/plantación). No llega a tradición, posesión profunda, prescripción, sucesión, derechos reales limitados ni acciones protectoras. | Tramos 1 a 6 (I-IV, V.1-V.3). **Usado en el tramo 1a (2026-10-07) con el mismo método que en Acto Jurídico**: tabla unidad por unidad contra el manual, ver "Tramo 1a: hecho y aprobado" |
| `Relaciones jurídicas con una cosa_VIAL.pdf` | 13 | Clasificación de relaciones sobre una cosa (dominio, posesión, mera tenencia, etc.), con interrogaciones de Bozzo e Ibarra incluidas | **Corregido (2026-10-07):** no aplica a I ni a II.A, revisado completo al trabajar el tramo 1a. Es íntegramente sobre títulos posesorios, mera tenencia y prescripción: tramo 11 en adelante |
| `TRADICIÓN Y PRESCRIPCIÓN_VIAL.pdf` | 83 | 3 capítulos: I. La tradición; II. Modos de adquirir en que la ley exige posesión previa; III. La prescripción adquisitiva. Es el mismo VIAL que ya corrigió errores reales en AJ (lecciones, sección 4) | Tramos 7-10 (tradición) y 11-16 (posesión/prescripción). Candidato fuerte a revisar a fondo por lo que pasó en AJ |
| `Acciones protectoras_ORREGO.pdf` | 26 | Mismo autor y tema que el capítulo VII del manual (diversas formas de protección, acción reivindicatoria, acciones posesorias) | Tramos 20a-20c |
| `anexo_prescripción...ORREGO(DL 2695).pdf` | 22 | El DL 2695 ("Decreto Ladrón"): regularización de la posesión de la pequeña propiedad raíz | Tramo 14 o 15 (posesión inscrita / prescripción), como complemento legal específico |
| `Teoría de la posesión inscrita_anexo.pdf` | 3 | Resumen corto de las doctrinas sobre posesión inscrita (el tema que en el manual hoy aparece como encabezados sin número, ver sección anterior) | Tramo 14, directamente relacionado con la excepción ya detectada ahí |
| `Paralelo Derechos Reales y Derechos Personales.pdf` | 1 | Cuadro comparativo (interrogaciones Bozzo e Ibarra) | **Confirmado (2026-10-07):** es la fuente real de las filas "Fuentes", "Duración" y "Posesión y prescripción" del cuadro de II.A.4.3 (tramo 1a, ya hecho) |
| `Derechos Reales fuera 577 CC_específico.pdf` | 2 | Derechos reales no enumerados en el art. 577 | **Confirmado (2026-10-07):** es la fuente real de censo/aguas/minas/conservación/copropiedad en II.A.4.1(iv) (tramo 1a, ya hecho) |
| `Anexo_Adquisición, conservación y pérdida de la posesión_secundario.pdf` | 12 | Apunte de alumna (Francesca Lombardo) sobre ACP de la posesión | Tramos 13c-14 |
| `anex_discusiones doctrinales_secundario.pdf` | 15 | Recopilación de discusiones doctrinales de Bienes (Bórquez/Polit) | **Corregido (2026-10-07):** revisado completo al trabajar el tramo 1a, no aplica ni a I ni a II.A. Sus 15 discusiones son todas sobre título/modo, posesión, prescripción y tradición del derecho de herencia: tramo 7 en adelante |
| `anexo_secundario.pdf` | 12 | Interrogación obligatoria 1 de Bozzo e Ibarra ("Los Bienes 1") | **Precisado (2026-10-07):** solo su página 1 (distinción cosa/bien) aplica a I.2, ya incorporada en el tramo 1a. El resto (p. 2-12) es íntegramente sobre limitaciones y características del dominio: tramo 3 |
| `anexo_secundario_posersión y prescripción.pdf` | 15 | Interrogación obligatoria 2 de Bozzo e Ibarra ("Bienes 2": posesión, prescripción, corpus y animus) | Tramos 11-16 |
| `Temario Bienes (INDEX).pdf` | 15 | Es el temario/índice de Boetsch, no contenido nuevo | Referencia para verificar el reparto, no se usa como fuente |
| `MEMORICE BIENES.pages` | — | Definiciones de memorice (como en AJ): hay que mantenerlas reconocibles en el manual | Verificar por tramo, igual que en AJ |

**Decisión de Laura (2026-10-07): todos entran, según toque el tramo.**
No se descarta ninguno de entrada; en el inventario de cada tramo se
revisa cuál de estos anexos aplica a ese tema puntual (tabla "Dónde
pegaría" arriba) y se usa ahí.

## Tramo 1a: hecho y aprobado (2026-10-07)

**Capítulo I (Aspectos generales) + II.A (Bienes corporales e
incorporales), páginas 18 a 28 de Boetsch.** Primer tramo de Bienes
hecho con el método completo (voz propia, inventario, anexos cotejados
unidad por unidad). Informe en
`Informes/Informe_Bienes_tramo1a.html`. Resumen de lo que se hizo:

- **Corrección de alcance detectada al abrir el tramo:** el reparto
  original decía que 1a era el capítulo I completo (p. 18-27); en
  realidad el capítulo I solo ocupa p. 18-19, y II.B (muebles e
  inmuebles) empieza en la p. 28, no en la 27 ni en la 36. Laura aprobó
  partir el tramo 1 más chico de lo previsto: 1a = I + II.A (p. 18-28),
  1b = II.B (p. 28-36). Reflejado en la tabla de "Reparto de tramos".
- **Anexos revisados completos**, con el mismo método que en Acto
  Jurídico (tabla unidad por unidad: ya está / tesis distinta / contenido
  nuevo): Peñailillo (capítulos I y II hasta antes de muebles/inmuebles)
  y `anexo_secundario.pdf` (solo su página 1). Dos anexos que el mapa
  marcaba para este tramo **no aplicaban** (`Relaciones jurídicas con
  una cosa_VIAL.pdf` y `anex_discusiones doctrinales_secundario.pdf`,
  ambos sobre posesión/prescripción/tradición de la herencia, tramos 7
  en adelante); corregido en el mapa de anexos.
- **Un error de cita corregido:** el art. 565 transcrito decía
  "percibidas **con** los sentidos"; el texto vigente dice "**por**".
- **Dos cajas reclasificadas** (Dato de grado de II.A.3 y No confundir
  de I.2) a texto corrido, con el contenido de Peñailillo que las
  sustenta (incluidas sus cuatro preguntas abiertas sobre el art. 583).
- **Contenido incorporado desde los anexos** (no estaba en Boetsch):
  ejemplo de la compraventa en I.1; patrimonialidad e individualidad de
  la cosa, y la corriente restringida de "cosa" como contraste, en I.2;
  cita del art. 584 junto a "obras del ingenio" en II.A.4; clasificación
  dominio/cosa ajena y el debate número abierto/cerrado nombrado en
  II.A.4.1; precisión de que el objeto del derecho personal es una
  conducta, no una cosa, en II.A.4.2.
- **Formato:** los marcadores `(i)/(ii)/(iii)/(iv)` de 4.1 y 4.2 se
  reescribieron con la estructura de `formato.md` 1.3 (`.enum-i` con
  `span.num`/`span.tit`), con estilo de clasificación nueva (negrita,
  sin subrayado). Laura confirmó que es el criterio correcto para este
  caso (4., 4.1., (i), a)). También se corrigió la enumeración de las
  características de "cosa" en I.2 (estaba como párrafo corrido con
  (a)(b)(c)(d), ahora es lista según la escalera).
- **Verificación:** cero guiones largos, etiquetas balanceadas, ningún
  párrafo sobre 1.200 caracteres, razón de caracteres fuente/manual
  0,89. Vista previa actualizada en `Vista_previa/Bienes_vista_previa.html`.
- **Commiteado:** directo en `main`, commit `eb624e0` ("Reescribir
  Bienes I y II.A con el método completo (tramo 1a)").

## Tramo 1b: hecho (2026-10-08)

**II.B Bienes muebles e inmuebles, páginas 28 a 36 de Boetsch.**
Informe en `Informes/Informe_Bienes_tramo1b.html`. Ajustes de Laura al
informe (2026-10-08), **no cambiar**:

- **De Peñailillo entra solo una unidad:** la distinción cuestión de
  hecho (si el bien está destinado al uso, cultivo o beneficio del
  inmueble) / cuestión de derecho (si, establecido ese destino, es
  inmueble por destinación), al cierre de los requisitos de 4.3 a).
  Las otras dos que proponía el informe (sociedades de capital y
  "movilización de los inmuebles"; desarrollo urbano que valoriza los
  inmuebles) **no aportan y quedaron fuera**.
- **"Bienes medios de producción y bienes de consumo" (Peñailillo) no
  se agrega** al manual, ni como letra nueva de II ni en otro tramo.

Lo que se hizo:

- Prosa de conexión reescrita en voz propia en todo II.B (el chequeo de
  6-gramas solo deja coincidencias en nombres de leyes y listas de
  términos técnicos).
- Artículos transcritos completos en `.ley`: 567 (con su inciso 2º,
  que faltaba), 568, 569, 570 (con todos sus ejemplos, lo que cubre el
  hueco del informe), 571, 573, 574, 580 y 1121 inc. 1º (estaba
  cortado). **Error de cita adicional corregido:** el art. 567 empieza
  "Muebles son las que pueden...", no "las cosas que pueden" (error que
  venía de Boetsch). En las transcripciones se respeta el "sólo" con
  tilde del texto vigente.
- Recuperado de Boetsch lo que faltaba: definición RAE de "ajuar"; el
  sentido de "casa" como inmueble urbano o vivienda en predio rústico;
  los muebles por anticipación como inmuebles (por naturaleza,
  adherencia o destinación) tratados por adelantado como muebles; qué
  dice el art. 1801 inc. 3º.
- Predios rústicos/urbanos: las 5 consecuencias quedaron como lista
  `(i)` a `(v)`.
- Formato: 3.1 pasó a `.enum-i` con `span.num`/`span.tit`. La excepción
  de 4.3 (a)/b) subrayados, (i)(ii)(iii) indentados) se mantuvo.
- Recuadro **No confundir** nuevo al cierre de 4.3: "¿Inmueble por
  adherencia o por destinación?" (inmovilización material versus
  inmovilización ficticia).
- **Ejemplos (segunda pasada, 2026-10-08, tras la corrección de
  Laura):** la caja de Boetsch "Un mueble por anticipación" se
  reemplazó por una propia (la uva de don Hernán, arts. 571 y 1801
  inc. 3º) y se agregaron cajas nuevas: "Ocho millones por WhatsApp"
  (punto 2, art. 1801), "La casa de la tía Marta" (3.2, arts. 574 y
  1121), "El limonero y el bonsái" (4.2), "El tractor sí, el caballo de
  carreras no" (4.3, art. 570) y "Un mural en el living" (5, arts. 580
  y 581); más dos ejemplos breves en cursiva en el texto (semoviente /
  cosa inanimada en 3.1; el tractor en el taller en 4.3 b), art. 573).
  También se agregaron 4 cajas al tramo 1a, que no tenía ninguna: "Una
  parcela, cuatro bienes" (I.2), "Lo corporal y lo incorporal en una
  misma mochila" (II.A.1), "El derecho real de quincho" (II.A.4.1) y
  "La bicicleta vendida dos veces" (II.A.4.3).
- Arts. 135 y 138 del COT verificados contra `Apuntes/CODIGOS/COT.pdf`
  (Laura lo agregó el 2026-10-08): correctos.
- Verificación: cero guiones largos, etiquetas balanceadas, ids únicos,
  todos los `href` resuelven, ningún párrafo sobre 1.200 caracteres,
  todos los artículos presentes, capturas en Chrome headless revisadas.
  Vista previa actualizada en `Vista_previa/Bienes_vista_previa.html`.

## Siguiente paso exacto (2026-10-08, vigente)

1. **Que Laura revise la vista previa de II.B** (ajustes, si los hay,
   en el mismo tramo).
2. **Tramo 2a: II.C en adelante (consumibles, fungibles...), desde la
   p. 36.** Primero confirmar el corte real contra Boetsch (la tabla de
   reparto es solo un estimado), luego el mismo checklist de 1a/1b:
   inventario de Boetsch y de Peñailillo (lo que sigue a "II. Bienes
   muebles e inmuebles" en su resumen, salvo "medios de producción y
   de consumo", que Laura descartó), artículos contra `Apuntes/CODIGOS`,
   paráfrasis medida con 6-gramas, informe en `Informes/` antes de
   tocar el manual.
3. Repetir tramo por tramo según la tabla de "Reparto de tramos",
   ajustando los cortes sobre la marcha.
