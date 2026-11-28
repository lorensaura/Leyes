# Estado: actualización de Bienes al método nuevo

> Se actualiza **in place** cada vez que Laura diga "guarda el estado
> [de Bienes]". Al decir "retoma Bienes" (o "empecemos Bienes"), leer
> este archivo completo primero y resumir en pocas líneas dónde quedó
> antes de seguir. Última actualización: 2026-11-28 (tramo 15a
> aprobado; sigue el tramo 15b).

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
- **Tramo 1b (II.B, p. 28-36): terminado y aprobado por Laura
  (2026-10-08).** Detalle en "Tramo 1b: hecho y aprobado", más abajo.
- **Tramo 2a (II.C a II.H, p. 36-44): terminado y aprobado por Laura
  (2026-10-08), commit `c97ba01`.** Detalle en "Tramo 2a", más abajo.
- **Tramo 2b (II.I a II.K, p. 45-51): terminado y aprobado por Laura
  (2026-10-09), commit `b311f56`.** Cierra el capítulo II.
- **Tramo 3 dividido en 3a (III.1-5, p. 52-58) y 3b (III.6-9, p.
  58-63), aprobada por Laura 2026-10-09. Tramo 3a: terminado y
  aprobado por Laura (2026-10-09), commit `bcabce8`.** Detalle en "Tramo 3a", más abajo.
- **Tramo 3b (III.6-9, p. 58-63): terminado y aprobado por Laura
  (2026-10-09), commit `c7eb772`.** Cierra el capítulo III.
- **Tramo 4a (IV.1-6, p. 63-70): terminado y aprobado por Laura
  (2026-10-09), commit `43bb930`.**
- **Tramo 4b (IV.7-10, p. 70-80): terminado y aprobado por Laura
  (2026-10-10), commit `ef9f28f`.** Cierra el capítulo IV. Detalle en
  "Tramo 4b", más abajo.
- **Tramo 5a (V.1 completo, p. 81-86): terminado y aprobado por Laura
  (2026-10-10), commit `231b5fd`.** Detalle en "Tramo 5a", más abajo.
- **Tramo 5b (V.2 La ocupación, p. 87-94): terminado y aprobado por
  Laura (2026-10-10), commit `5a5d94f`.** Detalle en "Tramo 5b", más abajo.
- **Tramo 6a (V.3.1 a V.3.5.1, p. 95-102): terminado y aprobado por
  Laura (2026-11-23), commit `de6ca42`.** Detalle en "Tramo 6a", más abajo.
- **Tramo 6b (V.3.5.2 y V.3.5.3, p. 102-110): terminado y aprobado por
  Laura (2026-11-23, "ok, sigue con el tramo 7a"), commit `5643d37`.**
  Cierra V.3 La accesión. Detalle en "Tramo 6b", más abajo.
- **Tramo 7a (V.4.A + V.4.B.1, p. 111-116): terminado y aprobado por
  Laura (2026-11-23), commit `541c37d`.**
- **Tramo 7b (V.4.B.2-B.4, p. 116-123): terminado y aprobado por
  Laura (2026-11-23, "sigue con el tramo 7c"), commit `812353c`.**
  Detalle en "Tramo 7b", más abajo.
- **Tramo 7c (V.4.C Efectos, p. 123-129): terminado y aprobado por
  Laura (2026-11-23), commit `7e3087e`.**
- **Tramo 8 (V.4.D.1 Tradición de muebles, p. 129-141): terminado y
  aprobado por Laura (2026-11-23, "sigue con el tramo 9a"), commit
  `c28471a`.** Detalle en "Tramo 8", más abajo.
- **Tramo 9a (V.4.D.2.1 a D.2.3.2, p. 142-152): terminado y aprobado
  por Laura (2026-11-23, "sigamos con el tramo 9b"), commit `e47fe19`.**
  Detalle en "Tramo 9a", más abajo.
- **Tramo 9b (V.4.D.2.3.3 a 3.10, p. 152-160): terminado y aprobado
  por Laura (2026-11-23, "ok, sigue con el tramo 9c"), commit `70f1d71`.**
- **Tramo 9c (V.4.D.2.3.11 a 3.15, p. 161-166): terminado y aprobado
  por Laura (2026-11-23, "continuemos con el tramo que sigue"), commits
  `e389e95` y `eb39226`.** Detalle en "Tramo 9c", más abajo.
- **Tramo 10a (V.4.D.2.4 a D.2.7, p. 166-175): terminado y aprobado
  por Laura (2026-11-23, "ok"), commits `852c58a` y `5065c22`.** Detalle
  en "Tramo 10a", más abajo.
- **Tramo 10b (V.4.D.3 y D.4, p. 175-183): terminado y aprobado por
  Laura (2026-11-23, "todo ok"), commit `4580ceb`.** Cierra V.4 La
  tradición.
- **Tramo 11a (V.5 intro y V.5.A.1, p. 184-191): terminado y aprobado
  por Laura (2026-11-26, ajustes de negritas y art. 700 completo, luego
  "sigamos con el tramo 11b").** Detalle en "Tramo 11a", más abajo.
- **Tramo 11b (V.5.A.2 intro, posesión regular y justo título, p.
  191-202): terminado y aprobado por Laura (2026-11-26, "sigamos con el
  tramo 12"), commit `0fe8380`; la pasada contra Peñailillo, commit
  `6f04967`, aprobada en el mismo mensaje.** Detalle en "Tramo 11b", más
  abajo.
- **Tramo 12 (V.5.A.2.2.3 a V.5.A.2.4, buena fe a posesiones viciosas,
  p. 202-208): terminado y aprobado por Laura (2026-11-27, "ok, haz el
  commit y sigue con el tramo 13a"), commit `3ff941f`.** Detalle en
  "Tramo 12", más abajo.
- **Tramo 13a (V.5.A.3 y V.5.A.4, p. 208-214): terminado y aprobado
  por Laura (2026-11-27, "ok, haz el commit").** Detalle en "Tramo 13a",
  más abajo.
- **Tramo 13b (V.5.A.5.1 a A.5.3, p. 214-218): terminado y aprobado
  por Laura (2026-11-27, "sigamos con el tramo 13c"), commit `85f2dd4`.**
  Detalle en "Tramo 13b", más abajo.
- **Tramo 13c (V.5.A.5.4.1, p. 218-228): terminado y aprobado por
  Laura (2026-11-27, "ok, haz el commit y sigue con el tramo 14a"),
  commit `9eb73b2`.**
- **Tramo 14a (V.5.A.5.4.2, p. 228-235): terminado y aprobado por
  Laura (2026-11-28, "ok, haz el commit"), marcado Hecho en Airtable.** Detalle en "Tramo
  14a", más abajo.
- **Tramo 14b (V.5.A.5.4.3 inmuebles inscritos y V.5.A.6 prueba, p.
  235-245): terminado y aprobado por Laura (2026-11-28, "ok, haz el
  commit"), marcado Hecho en Airtable junto con el 14c sobrante.** Detalle en "Tramo 14b", más abajo.
- **Tramo 15a (V.5.B.1 a B.4, p. 246-253): terminado y aprobado por
  Laura (2026-11-28, "ok haz el commit").** Detalle en "Siguiente paso
  exacto". Sigue el 15b.

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
| 2a | 36-44 | 2 | II.C-H (consumibles, fungibles, principales y accesorios, divisibles, singulares y universales, presentes y futuros). Corte confirmado 2026-10-08. Hecho y aprobado 2026-10-08 |
| 2b | 45-51 | 2 | II.I-K (comerciables, apropiables, privados y públicos). Corte confirmado 2026-10-08 (cierra el capítulo II). Hecho y aprobado 2026-10-09 |
| 3a | 52-58 | 3 | III.1-5 (preliminares, concepto, bases constitucionales, caracteres, facultades). División aprobada 2026-10-09. Hecho y aprobado 2026-10-09 |
| 3b | 58-63 | 3 | III.6-9 (cláusulas de no enajenar, clasificaciones, aspectos pasivos, extinción) + de Peñailillo: extensión material, vecindad, propiedad familiar; del anexo: restricciones específicas |
| 4a | 63-70 | 4 | IV.1-6 (terminología, naturaleza, el Código, fuentes, clases, cuota). Corte por contenido aprobado 2026-10-09. Hecho y aprobado 2026-10-09 |
| 4b | 70-80 | 4 | IV.7-10 (administración, coposesión, copropiedad inmobiliaria, extinción) |
| 5a | 81-86 | 5 | V.1 Aspectos generales (modos de adquirir). Corte por contenido aprobado 2026-10-10 (antes 81-88) |
| 5b | 87-94 | 5 | V.2 La ocupación completa (corregido 2026-10-10, antes 88-94) |
| 6a | 95-102 | 6 | V.3.1 a V.3.5.1 (concepto, clases, naturaleza, frutos, inmueble a inmueble). Corte por contenido aprobado 2026-10-10 |
| 6b | 102-110 | 6 | V.3.5.2 mueble a mueble y V.3.5.3 mueble a inmueble (corregido 2026-10-10) |
| 7a | 111-116 | 7 | V.4.A Tradición, descripción general + V.4.B.1 tradente y adquirente (corte por contenido aprobado 2026-11-23; antes 111-118: A termina en la p. 114). Hecho 2026-11-23 |
| 7b | 116-123 | 7 | V.4.B.2-B.4 Tradición: consentimiento, título, entrega (aprobado 2026-11-23; antes 118-125) |
| 7c | 123-129 | 7 | V.4.C Tradición, efectos (aprobado 2026-11-23; antes 125-129) |
| 8 | 129-141 | 8 | V.4.D.1 Tradición de muebles |
| 9a | 142-152 | 9 | V.4.D.2.1 a D.2.3.2 Sistema registral: introducción, tipos de registro, el Conservador, principios (corte por contenido propuesto 2026-11-23, antes 142-150: los principios terminan en la p. 152) |
| 9b | 152-160 | 9 | V.4.D.2.3.3 a 3.10 (qué se inscribe, cómo, negativa, plazo, avisos, contenido, subinscripciones). Corte aprobado 2026-11-23 |
| 9c | 161-166 | 9 | V.4.D.2.3.11 a 3.15 (cancelaciones, reinscripciones, sanción, saneamiento y DL 2.695, inscripciones paralelas y de papel). Corregido 2026-11-23 |
| 10a | 166-175 | 10 | V.4.D.2.4 a D.2.7 (tradición de derechos reales sobre inmuebles, cuotas, art. 688, la inscripción en la prescripción). Corregido 2026-11-23 |
| 10b | 175-183 | 10 | V.4.D.3 Tradición del derecho de herencia + V.4.D.4 Tradición de derechos personales. Corregido 2026-11-23 |
| 11a | 184-191 | 11 | V.5.A.1 Posesión, aspectos generales |
| 11b | 191-202 | 11 | V.5.A.2 Clases de posesión (regular: concepto, justo título completo hasta el art. 704). Corregido 2026-11-26 |
| 11c | (unido al 12) | 11 | Laura aprobó el 2026-11-26 unirlo al 12 |
| 12 | 202-208 | 11-12 | V.5.A.2 cont. (buena fe, tradición, ventajas, posesión irregular y viciosa). Corregido 2026-11-27 |
| 13a | 208-214 | 12 | V.5.A.3 Mera tenencia + A.4 Transmisibilidad, agregación, interversión (corregido 2026-11-27) |
| 13b | 214-218 | 13 | V.5.A.5.1 a A.5.3 (observaciones generales, principio básico, muebles). Corregido 2026-11-27 |
| 13c | 218-228 | 13 | V.5.A.5.4.1 Posesión de inmuebles, aspectos generales (Mensaje, doctrinas antagónicas). Corregido 2026-11-27 |
| 14a | 228-235 | 14 | V.5.A.5.4.2 Inmuebles no inscritos (corregido 2026-11-27) |
| 14b | 235-245 | 14 | V.5.A.5.4.3 Inmuebles inscritos + A.6 prueba (corregido 2026-11-27) |
| 15a | 246-253 | 15 | V.5.B.1-B.4 Prescripción adquisitiva: nociones, fundamento, características y reglas comunes (corregido 2026-11-28). Hecho y aprobado 2026-11-28 |
| 15b | 253-258 | 15 | V.5.B.5 intro, 5.1 cosa susceptible de prescripción y 5.2 posesión (corregido 2026-11-28) |
| 15c | 258-264 | 15 | V.5.B.5.3 Transcurso del tiempo (corregido 2026-11-28) |
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

## Tramo 1b: hecho y aprobado (2026-10-08)

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
- **Sin referencias internas (Laura, 2026-10-08, al revisar la vista
  previa):** se eliminan del manual las menciones del tipo "se
  desarrolla más abajo", "como se vio", "según se verá", "como se
  adelantó", "(punto 4.3)", "en el apartado siguiente". Se sacaron 7
  en I, II.A y II.B. **Regla para todos los tramos que siguen:** no
  escribir referencias de este tipo y borrar las que traiga el texto
  (anotada en `guia-editorial.md` 3). Con eso, Laura aprobó II.B
  ("el resto ok").
- Arts. 135 y 138 del COT verificados contra `Apuntes/CODIGOS/COT.pdf`
  (Laura lo agregó el 2026-10-08): correctos.
- Verificación: cero guiones largos, etiquetas balanceadas, ids únicos,
  todos los `href` resuelven, ningún párrafo sobre 1.200 caracteres,
  todos los artículos presentes, capturas en Chrome headless revisadas.
  Vista previa actualizada en `Vista_previa/Bienes_vista_previa.html`.

## Tramo 2a: hecho y aprobado (2026-10-08)

**II.C a II.H, páginas 36 a 44 de Boetsch.** Informe en
`Informes/Informe_Bienes_tramo2a.html`. Decisiones de Laura al informe
(2026-10-08), **no cambiar**:

- **"Bienes simples y compuestos" (Peñailillo) no se agrega.**
- **Latinazgos:** se sacaron *universitas facti* / *universitas juris*.
  Regla general nueva (no todos los latinazgos se sacan: se conservan
  ley del lugar, *brevi manu*, *constituto posesorio*, usucapión...),
  anotada en `guia-editorial.md` 1.1 y `decisiones.md`.
- **Factores de lo principal y lo accesorio en el orden de Boetsch**
  (subsistencia, finalidad, valor, volumen). Igual se transcriben los
  arts. 659-661 y se dice que en la adjunción el Código los aplica en
  cadena (estimación, finalidad, volumen).
- **Art. 1340 reemplazado por el 2304** (el 1340 citado por Boetsch
  trata de las deudas en la partición, no de bienes singulares y
  universales).
- **Pregunta clásica: solo "¿Qué caracteriza a la universalidad
  jurídica?"** (de `PREGUNTAS BIENES.pages`), en G.1.2. Las otras dos
  candidatas (distingo consumibles/fungibles; mecanismos de lo
  accesorio) no entran; el No confundir "¿Consumible o fungible?" quedó
  sin fusionar.
- Laura no tiene material propio sobre este tramo.

Lo que se hizo: prosa reescrita completa en voz propia (paráfrasis:
de 53/135 oraciones sobre el umbral, 17 casi idénticas, a 9/358, y una
sola sobre 70%, que es la lista de patrimonios, términos técnicos);
art. 575 transcrito; arts. 659-661 transcritos; recuperados los 4
matices de Boetsch que faltaban; contenido nuevo de Peñailillo
(cuasiusufructo, arts. 764 y 789, como C.3 "Importancia" nuevo, con su
entrada en el índice; hechos fungibles; tres especies de cosas
accesorias; par de zapatos; futureidad, graduaciones y existencia
esperada/aleatoria; diferencias 2 y 3 entre universalidades); tesis
de la copropiedad atribuida a BOETSCH y a PEÑAILILLO; dos errores del
resumen de Peñailillo descartados (servidumbre/prenda/hipoteca
"divisibles"; "un animal" como divisible). Cajas: Ejemplo propias
(tía Gloria, bodega del tío Sergio, kilo de azúcar y batidora, anillo
de Camila, parcela de los tres hermanos, food truck de Javiera,
cerezas que todavía no existen) más ejemplos breves en el texto; No
confundir en D.2; cuadro comparativo en G.1.3; Conexiones en D, F, G y
H (las de Contratos, Obligaciones y Sucesorio con `[FALTA: sección]`,
esos manuales no existen aún). Verificación: cero guiones largos, ids
únicos, `href` resuelven, etiquetas balanceadas, párrafos bajo 1.200
caracteres, todos los artículos presentes, capturas revisadas. Vista
previa actualizada.

## Tramo 2b: hecho y aprobado (2026-10-09)

**II.I a II.K, páginas 45 a 51 de Boetsch.** Informe en
`Informes/Informe_Bienes_tramo2b.html`. Hallazgos principales:

- Boetsch completo en el manual salvo 4 matices (definición de cosas
  consagradas; "leyes especiales reglamentan cada caso"; frase
  introductoria de los dominios; nombre de la LOC de Municipalidades).
- Paráfrasis actual: 39/68 oraciones sobre el umbral, 18 sobre 70%. Se
  reescribe todo.
- **Errores de cita:** art. 60 Nº 10 CPR es hoy el **63 Nº 10**
  (reforma 2005); el art. 587 no "deja en claro" que las cosas
  consagradas son comerciables, se deduce de lo que dispone (capillas y
  cementerios pasan con el predio); art. 589 omite "y sus playas" y
  "generalmente"; art. 19 Nº 23 inc. 2º omite "cuando así lo exija el
  interés nacional"; art. 596 trae también la plataforma continental.
- Art. 42 Ley 19.496 verificado vigente (sitio SERNAC).
- Peñailillo: 8 unidades nuevas propuestas (comerciabilidad limitada,
  medios de producción/actividades vedadas, derechos de concesionarios
  discutidos, tratados, Ley 16.640 y derecho de aprovechamiento,
  espacio aéreo no es bien ni cosa, presunción del 590 de dominio y no
  de posesión, excepción al 700). Una afirmación dudosa (bienes
  municipales como fiscales) propuesta para no incorporar.
- Propuestas pendientes de decisión: línea sobre Ley 21.435 (aguas,
  2022); cuadro BNUP vs. fiscales; 3 preguntas clásicas candidatas;
  reorden de K.1 (1.1 Características, 1.2 Desafectación, 1.3 Dominios
  con (i)-(iv)); retirar el Dato de grado de K.2.

**Decisiones de Laura al informe (2026-10-09), no cambiar:** entran
las 8 unidades de Peñailillo (incluida la de medios de producción y
actividades vedadas); **no** se agrega la Ley 21.435 (aguas, 2022);
**no** se incorporan los bienes municipales como fiscales; **sin**
cuadro comparativo BNUP/fiscales; **ninguna** pregunta clásica en este
tramo; Laura no tiene material propio.

Lo que se hizo: I, J y K reescritos completos en voz propia
(paráfrasis: de 18 oraciones sobre 70% a solo 3, que son
transcripciones de artículos); recuperados los 4 matices de Boetsch;
corregidos art. 63 Nº 10 CPR (era 60 Nº 10), la cita del art. 587, el
art. 589 y el art. 19 Nº 23 inc. 2º; agregados art. 596 (plataforma
continental), art. 592 y art. 602 completo; transcritos en `.ley` los
arts. 585, 589, 590, 595, 599, 602 y 19 Nº 23 CPR. No confundir de I
ampliado a tres categorías; Dato de grado de K.2 retirado (pasó a
texto con la presunción de dominio, excepción al art. 700 inc. 2º).
K.1 reordenado: 1.1 Características (i)-(iii), 1.2 Desafectación, 1.3
Los dominios públicos (i)-(iv); los ids `cII-K-1-1` a `cII-K-1-3` se
reusaron con contenido nuevo y `cII-K-1-4` desapareció (no estaba en
el índice). Cajas de Ejemplo propias: "La mitad de la plaza" (I), "El
sillón de la vereda y la bicicleta del taller" (J.1), "El kiosco de
Maitencillo" (K.1), "La herencia de don Anselmo y el terreno de Aysén"
(K.2); ejemplos breves en cursiva (abuela Teresa, Farellones, capilla
de los Pérez, Panchito y el cobre, pesquero en Talcahuano, dron).
Conexiones en I (AJ II.C.2.2 y II.C.4.3) y K (Sucesorio, `[FALTA:
sección]`). Verificación: cero guiones largos, ids únicos, `href`
resuelven, etiquetas balanceadas, párrafo más largo 852 caracteres,
todos los artículos presentes, capturas revisadas. Vista previa
actualizada.

## Tramo 3a: hecho y aprobado (2026-10-09)

**III.1 a III.5, páginas 52 a 58 de Boetsch.** Informe en
`Informes/Informe_Bienes_tramo3a.html`. Fuentes: Boetsch p. 52-58;
`anexo_secundario.pdf` p. 2-12 (fuente real de abuso del derecho,
abstracto/elástico y el muro de 10 m); Peñailillo Segunda Parte cap. I
(p. 18-44 del PDF; lo que es de 3b quedó anotado en el informe);
Memorice (arts. 582 y 583 completos). Hallazgos:

- Boetsch completo salvo 2 matices (cierre de las consideraciones
  preliminares; DL 2.186 de expropiaciones).
- Paráfrasis: 27/104 oraciones sobre 70% en III.1-5 (y 25/80 en
  III.6-9, para 3b).
- **Error de cita:** art. 36 Ley de Copropiedad (19.537, derogada por
  Ley 21.442 de 2022; el art. trataba de seguro y plan de emergencia,
  no del mal menor). Propuesto reemplazar por art. 10 Nº 7 CP
  (verificado en fuentes públicas). Arts. 582 y 583 incompletos;
  "corporales o incorporales" (19 Nº 24); orden de las reglas de la
  indemnización (peritos va con la toma de posesión).
- Peñailillo: error "art. 19 Nº 20" por art. 20 (no se incorpora).
- Decisiones pendientes: confirmar la división 3a/3b; mover el abuso
  del derecho dentro de 4.2 Absoluto (hoy es "4.3", como si fuera un
  carácter); 14 unidades breves (sección 3.1); 6 bloques grandes de
  Peñailillo (A historia, B orientaciones, C privación/restricción/
  esencia, D preservación, E urbanismo, F formas de propiedad); 3
  preguntas clásicas candidatas; material propio.

**Decisiones de Laura al informe (2026-10-09), no cambiar:** división
3a/3b sí; abuso del derecho dentro de 4.2 Absoluto (ya no es un
carácter numerado); entran las 14 unidades breves; de los bloques
grandes de Peñailillo **solo B (orientaciones actuales) y C
(restricción, privación y esencia)**; **no** entran A (historia), D
(preservación natural y cultural), E (urbanismo) ni F (formas de
propiedad); art. 36 Ley de Copropiedad reemplazado por art. 10 Nº 7 CP
(Laura agregó `Apuntes/CODIGOS/Código Penal.pdf`, verificado ahí);
pregunta clásica solo la Nº 2 (facultades del dominio, con uso y goce:
comodato / usufructo), puesta en 5; sin material propio.

Lo que se hizo: III.1-5 reescritos en voz propia (de 27 oraciones
sobre 70% a 10, todas transcripciones o frases de la CPR); arts. 582 y
583 completos en `.ley` (Memorice); art. 19 Nº 24 inc. 2º, art. 2517 y
art. 10 Nº 7 CP en `.ley`; "corporales o incorporales"; reglas de la
indemnización en a)-e) con los peritos en la toma de posesión; DL
2.186; bloque C como 3 (v); caracteres renumerados 4.1 Real, 4.2
Absoluto (con abuso del derecho, No confundir abuso/colisión, caja
"Los pinos de la discordia" y Conexiones a Responsabilidad
Extracontractual), 4.3 Exclusivo, 4.4 Perpetuo, 4.5 Abstracto, 4.6
Elástico (ids `cIII-4-3` a `cIII-4-6` reasignados, `cIII-4-7`
eliminado, índice actualizado). Dato de grado de 4.2 retirado; caja
del muro de 10 m reemplazada. Cajas nuevas: "La autopista que pasa por
la parcela de don Julio" (3), "La casa de la abuela Inés" (4.5-4.6),
"El auto de Catalina" (5); No confundir "¿Fruto o producto?" (5.2);
Conexiones a Contratos en 5. Verificación: cero guiones largos, ids
únicos, `href` resuelven, etiquetas balanceadas, párrafo más largo 868
caracteres, artículos presentes, capturas revisadas, vista previa
actualizada.

## Tramo 3b: hecho y aprobado (2026-10-09), commit `c7eb772`

**III.6 a III.9, páginas 58 a 63 de Boetsch.** Informe en
`Informes/Informe_Bienes_tramo3b.html`. Laura pidió (2026-10-09) un
**cuadro comparativo de las tesis sobre las cláusulas de no enajenar**
(validez general / nulidad salvo permiso legal / validez relativa); el
informe trae el cuadro armado (sección 3). Hallazgos:

- Boetsch completo en el manual, sin matices faltantes.
- Paráfrasis: 25/80 oraciones sobre 70% (medido en el 3a). Se reescribe todo.
- **Autores del cuadro:** ninguna fuente (Boetsch, Peñailillo, anexo de
  discusiones doctrinales, VIAL, AJ II.C.4.3) nombra quién sostiene la
  validez ni la nulidad. Solo hay nombre en la relativa: PEÑAILILLO la
  considera "la más aceptable" porque desarma el argumento de la libre
  circulación. Jurisprudencia (anexo de discusiones, sin rol): C.S. acepta
  (no desnaturaliza el dominio; otro fallo, condición resolutoria); C.A.
  Valparaíso en contra. Opciones a Laura: (a) "parte de la doctrina";
  (b) ella da la fuente; (c) buscar en fuentes públicas con cita y su
  aprobación. **No inventar nombres.**
- Precisiones de cita (sin errores graves): art. 1964 no prohíbe sino que
  limita el efecto del pacto; arts. 637 y 642 son de especies náufragas y
  represadas, no perdidas (citar 629, 632, 633); art. 2327 imputa "al que
  lo tenga"; art. 1432 Nº 1 da acción contra terceros; art. 53 Nº 3 del
  Reglamento del Conservador sin verificar (no está en `Apuntes/CODIGOS`).
- Nuevo propuesto: 10 unidades breves (Peñailillo, anexos, VIAL: No
  confundir prohibición legal/judicial/convencional); puntos nuevos
  pendientes de decisión: extensión material (8), vecindad (9.4),
  propiedad familiar breve (10), con la renumeración de 8 y 9; encuadre
  de una línea de las restricciones de utilidad pública/privada.
- No incorporar del anexo: art. 2328 como responsabilidad del dueño
  (inexacto); certificado de gastos comunes (Ley 19.537 derogada).
- 3 preguntas clásicas candidatas (se recomiendan la 1 y la 2).

**Decisiones de Laura al informe (2026-10-09), no cambiar:** cuadro
comparativo sin fila "Quién la sostiene" (así se resolvió el tema de los
autores: no se buscan); los artículos que prohíben y los que permiten
van en una sola fila "Lectura del código", con los artículos entre
paréntesis dentro de cada celda; las celdas sin argumento llevan "-".
**No entran** extensión material, relaciones de vecindad ni propiedad
familiar (numeración 6-9 se mantiene, sin ids nuevos). Sí entra el
encuadre de una línea de utilidad privada/pública al abrir 8. Pregunta
clásica solo la Nº 2 (efecto de la contravención), en 6.4. Sin material
propio.

Lo que se hizo: III.6-9 reescritos en voz propia (de 25 oraciones sobre
70% a 1, la cita del art. 53 Nº 3 del Reglamento); arts. 1126, 1810 y
1555 en `.ley`; los demás descritos en una línea (1964 resta efecto,
793 pierde el usufructo, 1432 Nº 1 acción contra terceros); opinión de
PEÑAILILLO y jurisprudencia en 6.3; cuadro de las tres tesis; No
confundir legal/judicial/convencional (VIAL); Conexiones a AJ II.C.4.3,
Obligaciones (`[FALTA: sección]`) y Extracontractual P. Clasificaciones
y extinción al markup nuevo de `.enum-i`. Ley 21.442 en (ii). Salida por
abandono (art. 858) en 8.1; caja-lista de artículos de 8.1 retirada.
Art. 2327 "al que lo tenga"; arts. 629, 632, 633 para perdidas y 637/642
como náufragas y represadas. Novedades de PEÑAILILLO en abandono,
incomerciabilidad y modos relativos. Cajas de Ejemplo nuevas: "Cinco
años sin vender la parcela de Pirque" (6.3), "Josefina vendió igual"
(6.4), "La pandereta de los Muñoz y los Rojas" (8.1), "La lancha que se
llevó el temporal" (9.1); ejemplos breves en cursiva (Benjamín y la
propiedad fiduciaria, Carolina y las contribuciones). Verificación: cero
guiones largos, ids únicos, `href` resuelven, etiquetas balanceadas,
párrafo más largo 653 caracteres, capturas revisadas (se partió el
`.art` largo de dos celdas del cuadro para que no se desborde). Vista
previa actualizada. Respaldo previo en el tmp del job
(`05_Bienes_antes_3b.html`).

## Tramo 4a: hecho y aprobado (2026-10-09), commit `43bb930`

**IV.1 a IV.6, páginas 63 a 70 de Boetsch.** Informe en
`Informes/Informe_Bienes_tramo4a.html`. Hallazgos:

- Corte propuesto por contenido (4a = IV.1-6, p. 63-70; 4b = IV.7-10,
  p. 70-80), porque la p. 72 cae en mitad del debate del mandato tácito.
- Boetsch completo salvo 4 matices (qué regula el título de la
  comunidad; "si se admite la comunicación, consecuencias inversas"; los
  actos sobre la cuota siguen las reglas del objeto; lesión enorme).
- Paráfrasis: 30/84 oraciones sobre 70%. Se reescribe todo.
- Peñailillo (p. 45-53 del PDF): 10 unidades breves (proindiviso/
  prodiviso; Roma la veía transitoria y los códigos dan poder a la
  mayoría; germánica permanente y por mayoría; adopción de la romana
  discutida; herencia plural como universalidad de hecho; art. 1344
  completo y venta de cosa ajena; comunidades activas/pasivas; art. 1317
  completo; art. 2417; art. 892). Pendiente de decisión: la **tesis que
  admite la comunicación** (art. 580, partición no es la única forma de
  terminar, derecho real de herencia vs. comunidad sobre bienes,
  reivindicatoria del heredero), con cuadro y No confundir; presentarla
  como "otra parte de la doctrina" (el resumen no dice si es de
  Peñailillo).
- Precisiones: arts. 1098 y 2307 no consagran la igualdad de cuotas como
  regla general (aplicaciones); goce gratuito es el art. 655 CPC; art.
  1909 exige "sin especificar los efectos"; art. 524 CPC más preciso.
- Formato: 5.1 a)/b)/c) pasan a (i)/(ii)/(iii) y sus argumentos a a)-c).
  Puntos 4 y 5.2 repetidos: se recomienda borrar 5.2.
- Cajas: reemplazar el ejemplo de Boetsch de 5.1 (ii); retirar el falso
  No confundir "Chile se apartó"; ejemplos propios propuestos.
- 3 preguntas clásicas candidatas (se recomienda "¿Qué título es la
  adjudicación?").

**Decisiones de Laura al informe (2026-10-09), no cambiar:** aprobó
todas las propuestas. Corte 4a = IV.1-6 (p. 63-70), 4b = IV.7-10 (p.
70-80); entran las 10 unidades de Peñailillo; **entra la tesis que admite
la comunicación**, como "otra parte de la doctrina", con el cuadro
comparativo de dos columnas (No hay comunicación / Hay comunicación;
criterios: qué sostiene, lectura del código, efecto declarativo,
comunidad hereditaria, tradición de la cuota, comunero incapaz) y el No
confundir "Derecho real de herencia vs. comunidad sobre los bienes
hereditarios"; **se borra 5.2** (repetía el punto 4): 5.3 Duración pasa
a 5.2 y la clase nueva "Según su funcionamiento" queda como 5.3; arts.
2304, 1317 y 1344 en `.ley`; precisiones de los arts. 1098, 2307, 1909,
524 CPC y 655 CPC; 5.1 a)/b)/c) a (i)/(ii)/(iii) con los argumentos en
a)-c); se reemplaza el ejemplo de Boetsch de 5.1 (ii), se retira el No
confundir "Chile se apartó" (pasa al texto) y entran los ejemplos propios
del informe (hermanos Fuentes y la casa de Curicó; Rodrigo hipotecó antes
de la partición; la cuota de Sofía en la herencia del abuelo; vender tu
tercio sin preguntar; breves: usufructuario y nudo propietario,
medianería, lancha pesquera de tres hermanos como comunidad activa);
pregunta clásica solo "¿Qué título es la adjudicación?", en 5.1 (ii).
Conexiones a Sucesorio, Contratos y Obligaciones con `[FALTA: sección]`.
Laura no tiene material propio.

Lo que se hizo: IV.1-6 reescritos en voz propia (de 30 oraciones sobre
70% a 2: un título y la definición de cuota, que se deja literal);
recuperados los 4 matices de Boetsch; las 10 unidades de Peñailillo; la
tesis de la comunicación con cuadro y No confundir; arts. 2304, 1317 y
1344 en `.ley`; precisiones de los arts. 1098, 2307, 1909, 2417, 524 CPC
y 655 CPC; 5.1 con (i)-(iii) (los ids `cIV-5-1-a/b/c` desaparecieron, no
estaban en el índice); `cIV-5-2` ahora es Duración y `cIV-5-3`
Funcionamiento (índice actualizado). Cajas nuevas: "Los hermanos Fuentes
y la casa de Curicó" (1), "Rodrigo hipotecó antes de la partición" y la
pregunta clásica "¿Qué título es la adjudicación?" (5.1 (ii), menciona
el art. 703 inc. 4º), "La cuota de Sofía en la herencia del abuelo"
(5.1 (iii)), "Vender tu tercio sin preguntar" (6); breves en cursiva
(nudo propietario y usufructuario, pandereta, lancha pesquera y sitio
eriazo). Conexiones a Obligaciones, Sucesorio y Contratos con `[FALTA:
sección]`. Verificación: cero guiones largos, ids únicos, `href`
resuelven, etiquetas balanceadas, párrafo más largo 960 caracteres,
capturas revisadas, vista previa actualizada. Respaldo previo en el tmp
del job (`05_Bienes_antes_4a.html`).

## Tramo 4b: hecho y aprobado (2026-10-10), commit `ef9f28f`

**IV.7 a IV.10, páginas 70 a 80 de Boetsch.** Informe en
`Informes/Informe_Bienes_tramo4b.html`. Laura agregó la **Ley 21.442** a
`Apuntes/CODIGOS/Ley 21442.pdf` (versión BCN, última modificación
23-09-2026, Ley 21.842). Hallazgos:

- Boetsch completo salvo 7 matices (reforma legal; texto y criterio del
  acto de conservación; el partidor sigue conociendo lo promovido ante
  la justicia ordinaria; los tres escenarios del comparendo; la opinión
  de Boetsch sobre letra vs. sentido de la doble mayoría; "el propietario
  más bien tiene la exclusividad del uso").
- 4 opiniones propias de Boetsch están en la voz del manual: van con su
  nombre (demolición inviable, solución del art. 669, doble mayoría,
  cesión previa al comparendo).
- **Art. 699 mal citado: es el 669** (y da dos opciones al dueño del
  terreno). Art. 645 CPC derogado: "646 y siguientes". Art. 653 CPC
  incluye "cuando falte el árbitro". **Arts. 1728 y 1729 no son
  indivisión forzada**: se propone sacarlos (decide Laura).
- **IV.9 desactualizado**: Boetsch y Peñailillo resumen la Ley 19.537,
  derogada por el art. 100 de la Ley 21.442. Tabla de comparación idea
  por idea en el informe (sección 4). La ley no tiene una norma de
  "indivisibilidad perpetua": se reformula con arts. 2 Nº 3 inc. final y
  3, y el término del régimen (arts. 52, 63, 64). Art. 28 (uso y goce
  exclusivo) es más estricto que lo que decía Peñailillo.
- Propuesto ajustar media frase de 5.3 (aprobado en 4a): la comunidad de
  los bienes comunes de un edificio dura "mientras subsista el régimen".
- Peñailillo: 6 unidades breves (por qué el Código no regula la
  administración; origen del veto y "paralizante"; agente oficioso vs.
  mandato; medidas conservativas solo si es la única forma de proteger
  la cuota; jurisprudencia con arts. 2305 y 2081, el "2035" del resumen
  es error; Ley 6.071 vs. sitios). Pendiente de decisión: punto 11 nuevo
  "Situaciones semejantes a la comunidad" (tiempo compartido; cementerios
  opcional). El dato "en Chile no hay estatuto del tiempo compartido" no
  está verificado: si entra, atribuido a Peñailillo.
- Paráfrasis: 11/116 oraciones sobre 70%, 37 sobre 35%. Se reescribe todo.
- Formato: 7.1 a)-c) (h4) pasan a (i)-(iii); 7.2 vuelve a los cuatro
  (i)-(iv) de Boetsch; IV.9 a)-g) pasa a (i)-(x). Los ids `cIV-7-1-a` a
  `cIV-7-2-c` no tienen enlaces (verificado). La remisión de IV.8 a la
  prescripción pasa a enlace a `#cV-5-B-5-1-iv`.
- Cajas: retirar el Dato de grado del mandato tácito; reemplazar el
  ejemplo del giro (es de Boetsch); No confundir "Acto de conservación
  vs. innovación"; cuadro "Comunidad del CC vs. copropiedad inmobiliaria"
  (6 criterios, decide Laura); ejemplos propios con la familia Fuentes
  (Javiera y el arriendo, la gotera, el quincho de Ignacio, 70 contra
  30, la viña de Colchagua) y otros (primos de Pichilemu, departamento
  de Catalina en Ñuñoa, semana en Pucón).
- `.ley` propuestos: art. 2081, art. 654 CPC, art. 718.
- 2 preguntas clásicas candidatas (mandato tácito; ¿la partición es un
  derecho absoluto?), se recomiendan las dos.

**Decisiones de Laura al informe (2026-10-10), no cambiar:** IV.9 se
rehace con la Ley 21.442, resumida en (i)-(x); **no** entra el punto 11
(tiempo compartido ni cementerios); de los arts. 1728 y 1729 queda
**solo el art. 1728 en su segunda hipótesis** (terreno contiguo que forma
con la finca una heredad que no puede desmembrarse sin daño) en la
indivisión forzada, y el 1729 sale; entra el cuadro "Comunidad del CC vs.
copropiedad inmobiliaria"; entran las dos preguntas clásicas; se ajusta
5.3 ("que dura mientras subsista el régimen de copropiedad"). Laura no
tiene material propio.

Lo que se hizo: IV.7-10 reescritos en voz propia (paráfrasis: de 11
oraciones sobre 70% a 1, que es una cita de artículos); los 7 matices de
Boetsch; las 4 opiniones de Boetsch con su nombre; las 6 unidades de
Peñailillo; art. 669 (no 699) con sus dos opciones; arts. 646 y
siguientes CPC; art. 653 completo; arts. 2081, 654 CPC y 718 en `.ley`;
7.1 con (i)-(iii) y 7.2 con (i)-(iv) (los ids `cIV-7-1-a` a `cIV-7-2-c`
desaparecieron, no tenían enlaces); IV.9 con (i)-(x) y la Ley 21.442;
enlaces a `#cV-5-B-5-1-iv`, `#cIII-8-1`, `#cIV-5-1` y `#cIV-3-2`. Se
retiró el Dato de grado y el ejemplo del giro de Boetsch. Cajas nuevas:
Pregunta clásica "¿Hay mandato tácito y recíproco entre comuneros?"
(7.1 (i)) y "¿Es una facultad o un derecho absoluto...?" (10); No
confundir "Acto de conservación vs. innovación"; ejemplos "El quincho de
Tomás", "Paula quiere arrendar la casa de Curicó", "La gotera en pleno
invierno", "Setenta contra treinta" (Rocío y Martín), "El giro de la
viña de Colchagua", "Tres primos y el sitio en Pichilemu" (corregido por Laura el mismo día: compran a Rodrigo, poseedor inscrito no dueño, para evitar el problema de la posesión inscrita; prescripción ordinaria de 5 años), "El
departamento de Catalina en Ñuñoa"; breves en cursiva en 10. Los
hermanos Fuentes son Andrés, Paula y Tomás (en el informe se habían
nombrado mal como Javiera e Ignacio). Conexiones a Contratos,
Obligaciones, Procesal y Familia con `[FALTA: sección]`. Verificación:
cero guiones largos, ids únicos, `href` resuelven, etiquetas
balanceadas, capturas revisadas, vista previa actualizada. Respaldo
previo en el tmp del job (`05_Bienes_antes_4b.html`). Aprobado por Laura
el 2026-10-10.

## Tramo 5a: hecho y aprobado (2026-10-10)

**V.1 completo, páginas 81 a 86 de Boetsch.** Informe en
`Informes/Informe_Bienes_tramo5a.html`.

**Decisiones de Laura al informe (2026-10-10), no cambiar:** corte 5a =
V.1 (p. 81-86), 5b = V.2 (p. 87-94); entran los cuadros (a) tesis de
V.1.6, (b) dualidad vs. consensual y (c) qué se adquiere por cada modo
(no el (d)); el tesoro como ley-modo se precisa: la mitad que el art. 626
da al dueño del terreno por el solo hecho de serlo; preguntas clásicas:
"¿Qué es un modo de adquirir el dominio?", "¿Qué importancia tiene
distinguir entre modo originario y derivativo?" y "¿Cuál es el modo de
adquirir más amplio?" (se les agregaron signos de interrogación y la
tilde de "Qué"; el texto del banco no los traía); entra "la ley en la
expropiación es a título oneroso", con el art. 19 Nº 24 inc. 3º CPR (no
viene de las fuentes de Bienes, lo aprobó Laura); Laura no tiene
material propio.

**PENDIENTE PARA EL TRAMO 11b (decisión de Laura, no olvidar):** el
argumento de VIAL sobre el art. 703 (TRADICIÓN Y PRESCRIPCIÓN, p. 56-57:
"título" en el 703 no es título posesorio, porque la prescripción supone
posesión previa y el contrato translaticio no hace poseedor; en los
modos originarios el título es constitutivo y se confunde con el modo)
va en el **justo título**, no en V.1.6. Por eso el cuadro de V.1.6 no
nombra a VIAL.

**Corrección al mapa de anexos:** la discusión nº 1 del anexo de
discusiones doctrinales es de V.1.6 y la p. 1 del anexo de relaciones
jurídicas es de V.1.3.1; ninguno agrega contenido propio.

Lo que se hizo: V.1 reescrito en voz propia (paráfrasis: de 26 oraciones
sobre 70% a 14, de las cuales 6 son citas textuales del Mensaje y del
art. 675 y 8 son fragmentos cortos de enumeraciones técnicas); los 4
matices de Boetsch; las 3 referencias internas eliminadas; 10 unidades de
Peñailillo; de VIAL, su definición de modo y título, la ley como modo
originario, el antecesor irrelevante en el originario, la prueba del
dominio derivativo y el gravamen en la compraventa; precisiones de los
arts. 882, 810 (con 250 y 252), 2180 Nº 1 y 2186, 682, 588, 626 y 952;
arts. 806 y 819 como respaldo; arts. 588, 675 y 703 (inc. 1º a 3º) en
`.ley`; definición de título y modo en `.definicion` (fórmula "la
doctrina"). Cajas: No confundir "¿Título o modo de adquirir?"; tres
preguntas clásicas; ejemplos "La bici de Martina" (1.2), "La guitarra que
no era de Pía" (3.1), "La pieza de Antonia en Viña" (4), "El auto del tío
Lucho" (5); breves en cursiva (Ignacio en Valparaíso, Javiera en La
Reina, la abuela Tere y el Yaris, Florencia y el crédito, el primo Nico,
Diego en Maitencillo). Cuadros (a), (b), (c); el (c) tiene 6 columnas y
lleva la clase nueva `cols-angostas` (celdas alineadas a la izquierda,
regla agregada a la hoja de estilos, solo afecta a ese cuadro).
Conexiones a Contratos, Familia, Constitucional (manual aún no existe) y
Sucesorio con `[FALTA: sección]`. Verificación: 62 unidades del
inventario presentes, cero guiones largos, ids únicos, `href` resuelven,
etiquetas balanceadas, todos los artículos en rojo, capturas revisadas,
vista previa actualizada. Respaldo previo en el tmp del job
(`05_Bienes_antes_5a.html`). Aprobado por Laura el 2026-10-10.

## Tramo 5b: hecho y aprobado (2026-10-10), commit `5a5d94f`

**V.2 La ocupación, páginas 87 a 94 de Boetsch.** Informe en
`Informes/Informe_Bienes_tramo5b.html`.

**Decisiones de Laura al informe (2026-10-10), no cambiar:** se escribe
el texto vigente en la caza (art. 609, Ley 19.473: solo tierras propias o
ajenas con permiso; ya no hay excepción de tierras sin cercar ni
notificación) y en las especies náufragas (art. 637 remite a los arts.
629 y ss.: reparto con la municipalidad, no con el hospital; art. 638,
gratificación de salvamento hasta la mitad del valor); **no** se agregan
los arts. 631, 634, 635 y 636; invención, tesoro y captura bélica pasan a
(i)-(iii) dentro de 4.2, con a) y a.1); entran las preguntas clásicas
"Si el niño aún no cumple los 18 años, ¿igual adquiere el dominio por
ocupación?" (en 2) y "¿Qué tipos de bienes se pueden adquirir por
ocupación?" (en 3 (i)); Laura no tiene material propio. Laura agregó a
`Apuntes/CODIGOS/` la Ley de Pesca (Decreto 430 de 1991, texto refundido
de la Ley 18.892, última modificación Ley 21.770) y el DL 3.063
(Decreto 2.385 de 1996); ambos confirman lo que dice Boetsch (art. 1 y
art. 43). **El DFL 34 de 1931 no lo encontró:** queda con `[FALTA:
verificar vigencia y texto del DFL 34 de 1931]` en 4.1 (iii) b).

Lo que se hizo: V.2 reescrito en voz propia (paráfrasis: de 12 oraciones
sobre 70% a 1, que es el texto del art. 625); los 3 matices de Boetsch
(ánimo de donar a persona indeterminada, ante la duda especie perdida,
el dueño no puede negarse a la extracción del art. 627); las unidades de
Peñailillo (definición con su nombre, modo más antiguo, no incorporales,
título para poseer, elementos de hecho de la inminencia, restricciones
legales); cita del art. 597 eliminada (no correspondía); art. 623 citado
para los domésticos; art. 640 con los nacionales; art. 607 y art. 26
agregados; arts. 606, 625 y 626 en `.ley`; definición de la doctrina en
`.definicion`; las tres opiniones de Boetsch con su nombre (art. 723,
DFL 34, presunción del art. 624 inc. 4º). Formato: 2 y 3 con (i)-(iii);
4.1 ordenado en (i)-(v); 4.2 con (i)-(iii), a)-d) y a.1)-a.5) (los ids
`cV-2-4-2-a` a `-c` desaparecieron, no tenían enlaces); 4.3 con (i)-(ii).
Cajas: No confundir "¿Especie perdida o res derelicta?" reescrito;
ejemplos "El salmón de Valentina" (4.1), "Lo que Sofía encontró en
Zapallar" (4.2 (i)), "Las monedas bajo el parrón" (4.2 (ii)); breves en
cursiva (Agustín y la concha, Gaspar y los audífonos en el Metro). Sin
Conexiones (la de Penal dependía de los arts. 631 y 635, que no entraron).
Verificación: 71 unidades presentes, cero guiones largos, ids únicos,
`href` resuelven, etiquetas balanceadas, artículos del Código en rojo
(los de leyes especiales sin rojo, como en 4b), capturas revisadas, vista
previa actualizada. Respaldo previo en el tmp del job
(`05_Bienes_antes_5b.html`). Aprobado por Laura el 2026-10-10.

## Tramo 6a: hecho y aprobado (2026-11-23), commit `de6ca42`

**V.3.1 a V.3.5.1, páginas 95 a 102 de Boetsch.** Informe en
`Informes/Informe_Bienes_tramo6a.html`.

**Decisiones de Laura al informe (2026-10-10), no cambiar:** corte 6a =
hasta la nueva isla (p. 95-102), 6b = mueble a mueble y mueble a
inmueble (p. 102-110); la inundación (art. 653) es **interrupción
natural** (art. 2502 Nº 1), no suspensión como dice Boetsch; **no** se
agregan las reglas 4ª y 5ª del art. 656; en el art. 654 queda solo
"autoridad competente" (lo que dice el Código, sin la municipalidad de
Boetsch y sin `[FALTA]`); los frutos en la comunidad (arts. 2310, 1338
Nº 3, art. 655 CPC con las dos lecturas de Peñailillo) van en **IV.6 La
cuota**, no en V.3; formato de 5.1 con (i)-(iv); **ninguna pregunta
clásica**; Laura no tiene material propio. La línea del "aluvión" del
habla común (avalancha de barro) en el No confundir no se agregó: Laura
no la aprobó.

Lo que se hizo: V.3.1 a V.3.5.1 reescritos en voz propia (paráfrasis:
de 26 de 47 oraciones sobre 70% a 3 de 94: el texto del art. 643 y dos
enumeraciones de nombres técnicos); arts. 643, 644, 647 (memorice) y 652
en `.ley`; el matiz de Boetsch (sub-clases en 5); unidades de Peñailillo
(extensión física, utilidad práctica de la distinción, periodicidad de
los naturales, expropiación con frutos pendientes, creación jurídica y
"desde que se pagan", art. 646 incs. 2º y 3º, cesión gratuita de frutos,
art. 1816, relevancia de la accesión continua solo con distintos
dueños, cauce como BNUP, 653 parecido al aluvión). Correcciones:
interrupción natural en el 653; reglas del aluvión (arts. 649-651) en vez
de "art. 651"; puerto habilitado con mercaderías (no "personas") y
atribuido a BOETSCH; regla 3ª "hasta la isla"; regla 6ª explicada antes
de la discusión, con la opinión de BOETSCH; art. 597 con mar
territorial; "subsiguiente año" en el 652 y las obras de movimiento de
tierras atribuidas a BOETSCH. Formato: 2 con (i)-(ii); 3 con (i)-(iii)
(no a)-c), porque el punto no tiene subpuntos, `formato.md` 1); 4.3 con
(i)-(ii) y a)-c); 4.4 con (i)-(ii); 5 con (i)-(iii); 5.1 con (i)-(iv),
a)-d) y a.1)-a.3) (ids `cV-3-4-3-a/-b` y `cV-3-5-1-a` a `-d`
eliminados, nada enlazaba a ellos). Cuadro de las tres teorías en 3.
Cajas: No confundir "¿Aluvión o avulsión?" reescrito y movido al final
de (ii); ejemplos "Las paltas de la tía Leonor" (4.3, art. 781) y "El
trozo de huerto de don Arturo" (5.1 (ii), art. 652); breves en cursiva
(Renata en Ñuñoa, la isla del estero de Curacaví). Conexiones a
Contratos (arts. 1816 y 2435) en 4; en IV.6 se agregó la conexión a
Sucesorio (art. 1338 Nº 3). Verificación: unidades del inventario
presentes, cero guiones largos, ids únicos, `href` resuelven, etiquetas
balanceadas, párrafo más largo 868 caracteres, artículos en rojo,
capturas revisadas, vista previa actualizada. Respaldo previo en el tmp
del job (`05_Bienes_antes_6a.html`).

## Tramo 6b: hecho y aprobado (2026-11-23), commit `5643d37`

**V.3.5.2 y V.3.5.3, páginas 102 a 110 de Boetsch.** Informe en
`Informes/Informe_Bienes_tramo6b.html`.

**Decisiones de Laura al informe (2026-11-23): "ok a todo"**, no
cambiar: adjunción resumida con enlace a II.E.1 (sin repetir los arts.
659 a 661 ni nuevo ejemplo de adjunción); cuadro para los tres grados de
conducta del art. 668; arts. 657, 662 inc. 1º, 668 y 669 en `.ley`;
conexión al art. 1500 (Obligaciones); cuadro de las tres especies de
mueble a mueble; pregunta clásica "¿Qué mecanismos establece el
legislador para determinar lo principal y lo accesorio?"; Laura no tiene
material propio. Aprobó el 6a.

Lo que se hizo: V.3.5.2 y V.3.5.3 reescritos en voz propia (paráfrasis:
de 9 frases de prosa sobre 70% a 0; solo quedan sobre 70% títulos de
Boetsch, textos de artículos y una fila del cuadro). Las 15 unidades de
Boetsch y las 4 de Peñailillo, presentes (verificado por script). Todas
las correcciones del informe aplicadas. Formato: 5.2 con (i)-(iv),
a)-d), b.1)-b.4) y d.1)-d.3); 5.3 con (i)-(iv), a)-c), a.1)/a.2) y
b.1)/b.2) (ids `cV-3-5-2-a` a `-d` y `cV-3-5-3-a`/`-b` eliminados, nada
enlazaba a ellos). Intro de V.3.5 reordenada (ii mueble a mueble, iii
mueble a inmueble). Los 15 rótulos `a.1)` mal puestos de V.2.4.2 y
V.3.5.1 corregidos a `b.1)`/`c.1)`. Dato de grado → No confundir
"¿Accesión o tradición?". Ejemplos: "El pipeño de Gonzalo" y "El quincho
de Óscar" (cajas), trigo de Marisol y Fabián e Iván en Chillán
(cursiva). Enlaces a II.E.1, II.B.4.2 y VII.2.6. Verificación: cero
guiones largos, ids únicos, `href` resuelven, etiquetas balanceadas,
párrafo más largo 911 caracteres, artículos en rojo, capturas revisadas,
vista previa actualizada. Respaldo previo en el tmp del job
(`05_Bienes_antes_6b.html`).

Hallazgos principales: faltan 15 unidades de Boetsch (casi todas de
mueble a inmueble: elección del dueño del suelo, a sabiendas = mala fe,
hurto o apropiación indebida, la ley presume el consentimiento, plantar
vs. sembrar, inmuebles por adherencia, reparto del art. 662 inc. 4º,
fin de producción y cuestión de hecho en la especificación, entre
otras); 4 unidades de Peñailillo (incluida la unidad 14 diferida del
6a: función, valor y volumen; y su objeción a que la especificación sea
accesión, frente a la "mayoría" de Boetsch). Correcciones al Código:
art. 669 inc. 1º (al que sembró, renta **y perjuicios**), art. 669
inc. 2º ("para recobrarlo"), art. 662 inc. 2º ("reclamar", no "se hace
dueño"), art. 662 inc. 1º (la definición legal no es la de Boetsch),
art. 663 ("áridas"), art. 658 (fórmula del requisito), incisos del art.
668 (cuatro incisos; Boetsch cita mal el 2º y nadie cita el 3º),
voluptuarias (arts. 910 y 911). Dato de grado al final de 5.3 → No
confundir "¿Accesión o tradición?". Adjunción ya está en II.E.1
(arts. 659 a 661 en `.ley`, "El anillo de Camila"): propuesta de no
repetir. **Error de rótulos detectado:** 15 `a.1)` que cuelgan de `b)` o
`c)` en V.2.4.2 (tramo 5b) y V.3.5.1 (tramo 6a); deben llevar la letra
del padre (`b.1)`, `c.1)`), como en AJ. Se corrigen en la pasada del 6b.

Decisiones pedidas a Laura (las 8 del recuadro del informe): aprobar el
6a; adjunción resumida con enlace a II.E.1; cuadro para los tres grados
de conducta del art. 668 (la escalera no admite `a.1.1)`); arts. 668 y
669 en `.ley` (657 y 662 inc. 1º van por regla); conexión al art. 1500;
cuadro de las tres especies de mueble a mueble; pregunta clásica
"mecanismos para determinar lo principal y lo accesorio"; material
propio. Ejemplos propuestos: "El pipeño de Gonzalo" (caja, 662 y 665),
trigo de Marisol y Fabián (cursiva, 663), ladrillos de Iván (cursiva,
668), "El quincho de Óscar" (caja, 669 incs. 1º y 2º).

## Tramo 7a: hecho y aprobado (2026-11-23), commit `541c37d`

**V.4.A + V.4.B.1, páginas 111 a 116 de Boetsch** (corte propuesto).
Informe en `Informes/Informe_Bienes_tramo7a.html`. Hallazgos:

- **Corte:** V.4.A termina en la p. 114; B.1 en la 116; B.2-B.4 p.
  116-123; C p. 123-129. Propuesto 7a = A + B.1, 7b = B.2-B.4, 7c = C.
- Boetsch: faltan 3 unidades (arts. 1443 "parcialmente adecuado" y 2197
  "con redundancia" en A.4; la frase que abre B) y 2 matices. Paráfrasis:
  20/73 oraciones sobre 70%, se reescribe todo.
- **Repeticiones con V.1:** A.2.1 (V.1.3.1), A.2.3 (V.1.3.4, Yaris),
  A.2.4 (V.1.3.2 iii), A.3 (V.1.4 iv y cuadro), A.1 (V.1.1). Propuesta:
  versión corta con enlace. Art. 682 en `.ley` solo en B.1.1 (i).
- **A.2.5 "sirve de justo título":** choca con art. 702 inc. 3º; los
  anexos de posesión (Bozzo e Ibarra; Lombardo) dicen que la tradición
  de quien no es dueño es título de la posesión. Propuesta: frase con
  nombre de BOETSCH + art. 683 + una línea "se discute" + enlace a
  `#cV-5-A-2-2-2`. El argumento de VIAL sobre el 703 sigue para 11b.
- **VIAL (resumen, p. 1-10 y 18-19), 14 unidades:** enajenar = tradición
  (una línea + conexión a AJ II.C.4.3); naturaleza jurídica; entre vivos
  (no entra, ya en V.1.3.3, el pacto va al 7c); universal "patrimonio"
  (no entra, contradice a Boetsch); entrega/tradición, inexactitud en
  inmuebles, dar vs. entregar (1548, 1824, 1826) y discusión VIAL vs.
  "otra parte de la doctrina" sobre cuándo se cumple la obligación de
  dar; art. 1443 (contratos reales); existencia/validez; art. 671;
  facultad = dueño (VIAL) vs. poder de disposición (Boetsch); capacidad
  de ejercicio en ambos; incapacidades especiales anulan la venta, no
  la tradición; **art. 679** (no estaba en el manual) con arts. 254 y 393.
- Peñailillo no trata la tradición (lo que trae ya está en V.1.1).
- Citas: art. 670 sin inc. 2º; art. 1575 sin "o con consentimiento del
  dueño" ni inc. 3º (fungible consumida de buena fe); art. 1578 Nº 1 dice
  "administración" (no "libre") y la salvedad es el provecho "con arreglo
  al art. 1688". `.ley` propuestos: 670, 671 (completo, Memorice), 679,
  682.
- Opinión de Boetsch en B.1.2 ("parece claro" que el pago es nulo) va
  con su nombre.
- Formato: B.1.1 h6 a)/b) a (i)/(ii) y las tres posturas del adquirente
  a)-c); No confundir "Entrega vs. tradición" → cuadro de 5 criterios
  (decide Laura); sin latinazgo *nemo plus*; grafía "traslaticio".
- Ejemplos propuestos: "El kayak de Maite" (A.4), "El notebook de la
  hermana" (B.1.2, Emilia, Lucas, Trinidad; obligación **de género** a
  propósito: con especie determinada habría error en la identidad,
  art. 676, y la tradición sería inválida); breves: Domingo (herencia),
  tía Pilar curadora (art. 679), Bastián y Amanda con un sofá (A.4; no
  un auto, que es mueble registrable).
- Criterio VIAL (resumen): lo expuesto va con su nombre (como en 5a);
  "la doctrina clásica" / "un sector" sin nombre; sin citas literales.
- 4 preguntas clásicas candidatas (¿qué es la tradición?; ¿es un
  contrato? recomendada; ¿modo más importante?; ¿qué capacidad?
  recomendada).
- Conexiones: AJ II.C.4.3, II.B.2, II.B.3.3; Obligaciones y Contratos
  con `[FALTA: sección]`.

**Decisiones de Laura al informe (2026-11-23): "ok a todo"**, no
cambiar: corte 7a = A + B.1 (p. 111-116), 7b = B.2-B.4, 7c = C;
repeticiones con V.1 resumidas con enlace; VIAL obligación de dar (dos
posturas con nombre) en B.1.2; clasificación existencia/validez de VIAL
al abrir B; cuadro "Entrega y tradición" en vez del No confundir;
pregunta clásica **solo "¿La tradición es un contrato?"** (en A.2.2).
**A.2.5 ("sirve de justo título"):** Laura pidió ver primero un
esquema, por ser tema sensible; lo aprobó tal cual (2026-11-23): título
de Boetsch se mantiene; regla (arts. 682 y 683); fórmula con nombre de
BOETSCH; precisión del art. 702 inc. 3º (justo título = contrato,
tradición = requisito adicional, art. 703 inc. 3º); "otros sostienen"
que el título de la posesión es la tradición (anexos, sin autor);
resultado práctico común (arts. 2508 y 708); enlace a
`#cV-5-A-2-2-2`; ejemplo de Amanda y Bastián con la bicicleta. No se
toma partido ni se desarrolla el 703 (queda para 11b).

Lo que se hizo: V.4.A y V.4.B.1 reescritos en voz propia (paráfrasis:
de 20 de 73 oraciones sobre 70% a 3, dos de ellas transcripciones de los
arts. 670 y 682); unidades de Boetsch y de VIAL verificadas por script;
arts. 670, 671, 679 y 682 en `.ley`; correcciones de los arts. 1575 y
1578 Nº 1; enlaces a V.1.1, V.1.3.1, V.1.3.2, V.1.3.4, V.1.4 y
V.5.A.2.2.2; cuadro "Entrega y tradición" (reemplaza al No confundir);
B.1.1 con (i)/(ii) y a)-c) (ids `cV-4-B-1-1-a`/`-b` eliminados, nada
enlazaba); pregunta clásica "¿La tradición es un contrato?" en A.2.2;
cajas "El kayak de Maite" y "El notebook de la hermana"; breves en
cursiva (Domingo y Elisa, Amanda y Bastián, Matilde y la lancha, tía
Pilar); Conexiones al final de A y de B.1. Verificación: cero guiones
largos, ids únicos, `href` resuelven, etiquetas balanceadas, párrafo
más largo 848 caracteres, artículos en rojo, capturas revisadas, vista
previa actualizada. Respaldo previo en el tmp del job
(`05_Bienes_antes_7a.html`).

## Tramo 7b: hecho y aprobado (2026-11-23), commit `812353c`

**V.4.B.2 a B.4, páginas 116 a 123 de Boetsch.** Informe en
`Informes/Informe_Bienes_tramo7b.html`. Hallazgos:

- Boetsch: faltan 7 unidades (la mayoría en 3.2: nula por defectos
  propios, "influencia del título", primera solución que borra la
  posesión, ejemplo de la compraventa nula; en 3.1, el título necesita
  la tradición y la discusión causal/abstracta extranjera; en 2.4, el
  art. 894 CPC) y la jurisprudencia RDJ/F. del M. Tres opiniones de
  Boetsch en la voz del manual (inoponibilidad en 672-673; pago de lo
  no debido; posesión con título nulo): van con su nombre. Paráfrasis:
  18/83 sobre 70%.
- **Errores:** art. 1452 citado para "vicios" (es el 1451); art. 1455
  citado para el error en el nombre (es la regla general del error en
  la persona); art. 1576 a su texto. **Caja "Las dos formas de error en
  el título" mal** (Pedro/Juan: dice que comodato vs. donación son
  ambos traslaticios, y el 2º caso no es hipótesis del 677): se
  reemplaza.
- VIAL (p. 7-10, 19-26), 11 unidades: 672 (falta de voluntad = no hay
  tradición; suplantación o falso representante; ratificación;
  tradición de cosa ajena no es nula, como la venta, 1815); 673
  (inoponible al falso adquirente); 674 (doctrina antigua nulidad,
  actual modalidad: no se radica en el representado); error en la
  cosa (distinto del 1453; resumen confuso, leído como nulidad
  relativa; dación en pago); error en la persona (mayoritaria: NR y
  posesión; VIAL: pago de lo no debido, 2295, mero tenedor); error en
  el título (677 innecesario, error esencial, no hay tradición); **675:
  sin título no hay tradición ni posesión (choca con Boetsch); título
  nulo: posesión irregular**; 675 inc. 2º (cónyuges, art. 1138);
  intención presumida y art. 684; otros títulos (sociedad,
  cuasiusufructo, transacción 703).
- Propuestas: arts. 672-678 en `.ley`; cuadro "El error en la
  tradición" (Boetsch vs. VIAL); Dato de grado de 2.4 al texto (CLARO
  SOLAR); h6 a)-d) de 2.2 a (i)-(iv); esquema de 3.2 (sección 6 del
  informe) para aprobar antes, como el 2.5 del 7a.
- Ejemplos: "La bicicleta de Simón" (677, primo Tadeo), "El remate del
  departamento de don Patricio" (671 inc. 3º, 497 CPC), "La moto de
  Colomba" (Colomba de 16 vende a Rafael; NR, 1684, 1687; posesión
  irregular); breves: sofá de Antonella (persona), Isidora/Isadora
  (nombre), corredor (674).
- 4 preguntas clásicas candidatas (remate: ¿quién hace la tradición?;
  error en la tradición; sanción del 672; títulos traslaticios y
  transacción).

**Decisiones de Laura al informe (2026-11-23): "ok a todo"**, no
cambiar: arts. 672-678 en `.ley`; tres lecturas de la falta de
voluntad con nombre; cuadro "El error en la tradición"; esquema de 3.2
aprobado tal cual; art. 675 inc. 2º con art. 1138; jurisprudencia:
**solo** RDJ t. 6, p. 266 (acoge a CLARO SOLAR); pregunta clásica
**solo una, nueva, pedida por Laura:** "¿En qué se diferencia el error
como vicio del consentimiento del error en la tradición?" (en 2.2,
tras el cuadro). Laura no tiene material propio (se anota, no se
agrega nada). **Cambio posterior (2026-11-23, pedido de Laura al
aprobar el 7c, commit `62012c6`):** esa pregunta clásica se reemplazó
por un **cuadro comparativo** "error como vicio del consentimiento /
error en la tradición" (9 criterios), después del cuadro "El error en
la tradición" en 2.2. No volver a la caja de pregunta.

Lo que se hizo: B.2-B.4 reescritos en voz propia (paráfrasis: de 18/83
sobre 70% a 6, todas transcripciones de los arts. 672, 673, 675, 676 y
677); las 7 unidades de Boetsch y las 11 de VIAL presentes (verificado
por script); opiniones de BOETSCH con nombre (inoponibilidad, pago de
lo no debido, posesión con título nulo); arts. 1451 (no 1452), 1455 y
1576 corregidos; art. 894 CPC; Dato de grado de 2.4 al texto; 2.2 con
(i)-(iv) y a)/b) (ids `cV-4-B-2-2-a` a `-d` eliminados, nada enlazaba);
cuadro con clase `cols-angostas`; caja errónea Pedro/Juan reemplazada
por "La bicicleta de Simón"; cajas "El remate del departamento de don
Patricio" y "La moto de Colomba"; breves (Antonella, Isidora/Isadora,
Fermín); enlaces a A.4, B.1 y V.5.A.2.2.2; una caja Conexiones al final
de B. Verificación: cero guiones largos, ids únicos, `href` resuelven,
etiquetas balanceadas, párrafo más largo 973, artículos en rojo,
capturas revisadas, vista previa actualizada. Respaldo previo en el tmp
del job (`05_Bienes_antes_7b.html`).

## Tramo 7c: hecho y aprobado (2026-11-23), commit `7e3087e`

**V.4.C Efectos, páginas 123 a 129 de Boetsch** (cierra la parte 7).
Informe en `Informes/Informe_Bienes_tramo7c.html`. Hallazgos:

- Boetsch: faltan la intro de C, el caso de la cosa ajena mostrada y
  nunca tenida (C.1), la cita de la C.S. sobre "transmisibles" (RDJ t.
  24, p. 200), la discusión sobre retroactividad del título (4.1),
  "tradición anticipada" y el momento del traspaso (4.3 i), y casi toda
  la discusión 680/1874: objeción de Boetsch a la especialidad, los dos
  rebatimientos de CAPRILE, condición sobre la tradición y no sobre el
  contrato, accesoriedad (cesión y extinción del crédito), liquidación
  concursal, par condicio, crédito interempresas. Hoy está en un Dato
  de grado (se retira). Crítica del 682 y C.3 en la voz del manual: van
  con nombre de BOETSCH (C.3 hoy contradice el esquema aprobado de
  A.2.5). Paráfrasis: 4/66 sobre 70%, bajo porque el texto está
  comprimido; se reescribe igual.
- VIAL (p. 8-9 y 26-29), 9 unidades: 682 solo si la intención era
  transferir ese derecho (opuesto a Boetsch); derechos intransferibles;
  682 inc. 2º "la ley finge"; 683 muebles (sin tenencia no hay
  posesión) e inmuebles (inscripción da posesión pero para prescribir
  hacen falta actos posesorios: queda para el tramo 14); 681 plazo
  tácito y decreto judicial; condición suspensiva y resolutoria en sus
  tres estados (cumplida suspensiva: retroactivo a la tradición, frente
  a Boetsch "en el instante"; cumplida resolutoria: la posesión
  subsiste); reserva de dominio con y sin el 1874; "unánime" + art. 13.
  VIAL p. 26 cita el 681 por el 680: no se arrastra.
- Discusiones nº 14: ALESSANDRI por el 1874, **no verificado en el
  original** (apunte de alumnas).
- Citas: art. 730 (el mero tenedor que enajena a su propio nombre;
  inc. 2º poseedor inscrito); art. 681 solo habla de plazo (la
  condición viene del 1485); art. 1874 segunda parte omitida;
  "quiebra" → liquidación concursal (Ley 20.720, sin artículos).
  `.ley` propuestos: 680, 681, 1873, 1874; 682 y 683 solo enlace.
- **Tensión con AJ:** AJ VI.A.3.1 (ii) afirma la retroactividad de la
  condición cumplida sin matices; Boetsch la discute. Propuesto: dos
  lecturas con nombre en Bienes, no tocar AJ en este tramo.
- **Para el tramo 8:** V.4.D.1.4 dice que en toda tradición ficta el
  adquirente queda en posesión; Boetsch (C.1) y VIAL dicen que sin
  tenencia no hay posesión. Revisar al llegar ahí.
- Esquema de la reserva de dominio (sección 6 del informe) y cuadro
  "Art. 680 o art. 1874" para aprobar antes.
- Ejemplos: "El caballo del potrero vecino" (Octavio y Leticia, 684 Nº
  2), "El piano de la tía Dominga" (Facundo y Ximena, 682 inc. 2º y
  1819), "El comedor de Ignacia" (reserva de dominio, Florencio);
  breves: violín de la abuela Amparo y Emiliano (condición suspensiva y
  resolutoria).
- Pregunta clásica propuesta: solo "¿Qué ocurre si el tradente no es
  dueño de la cosa?" (al final de C.3).

**Decisiones de Laura al informe (2026-11-23): "ok a todo"**, no
cambiar: esquema de la reserva de dominio tal cual; cuadro "Art. 680 o
art. 1874"; dos lecturas de la condición cumplida (BOETSCH/VIAL) sin
tocar AJ; las dos lecturas del 682 con nombre; arts. 680, 681, 1873 y
1874 en `.ley`; "liquidación concursal (la antigua quiebra)"; pregunta
clásica solo "¿Qué ocurre si el tradente no es dueño de la cosa?".
Laura pidió además una **Conexión** a AJ por la retroactividad de la
condición, para que se revise esa parte (hecho, en la caja Conexiones
al final de C). Laura no indicó material propio.

Lo que se hizo: V.4.C reescrito en voz propia (paráfrasis: 1 oración
sobre 70%, la transcripción del art. 681); unidades de Boetsch y de
VIAL verificadas por script; Dato de grado retirado; C.2 y 4.2 con
(i)/(ii)/(iii); 4.3 (i) con a)/b) y a.1)/a.2), b.1)/b.2); cajas "El
caballo del potrero vecino", "El piano de la tía Dominga" y "El comedor
de Ignacia"; breves (Remigio y Pascual, 682; violín de Amparo y
Emiliano); cuadro con `cols-angostas`; enlaces a A.2.5, B.1.1,
D.1.3.2, V.5.A.2.2.2, V.5.A.5.4, VI.1 y VI.2. Verificación: cero guiones
largos, ids únicos, `href` resuelven, etiquetas balanceadas, párrafo
más largo 985, capturas revisadas, vista previa actualizada. Respaldo
en el tmp del job (`05_Bienes_antes_7c.html`).

**Pendiente para AJ (no para Bienes):** VI.A.3.1 (ii) afirma la
retroactividad de la condición cumplida sin matices. Al revisar AJ,
contrastar con Boetsch (Bienes V.4.C.4.3) y con los arts. 1486 y 1488
(el acreedor recibe la cosa en el estado en que esté; no se deben los
frutos del tiempo intermedio), que muestran que la retroactividad no es
absoluta. Buscar fuente doctrinal antes de escribir.

## Tramo 8: hecho y aprobado (2026-11-23), commit `c28471a`

**V.4.D (entrada) y D.1, páginas 129 a 141 de Boetsch.** Informe en
`Informes/Informe_Bienes_tramo8.html`. Hallazgos:

- **VIAL cambió de postura y el manual se contradice.** Boetsch (sección
  3) sigue a VIAL en sus ediciones anteriores: sin recepción no hay
  tradición (Nº 1), mostrar no basta (Nº 2), el encargo del Nº 4 debe
  cumplirse. El resumen de VIAL dice "ha cambiado su postura": la
  tradición (dominio) ocurre con la conducta del tradente (permitir,
  mostrar, encargarse); la posesión exige que el adquirente reciba;
  dar vs. entregar; mora de recibir y consignación. En el Nº 4 VIAL hoy
  adhiere a la lectura literal (con PEÑAILILLO y la doctrina nacional).
  A.4 (7a) ya recoge la postura nueva; D.1 3.1, 3.2 y 3.4 tienen la
  antigua atribuida a VIAL. Propuesto: esquema con lectura tradicional
  (BOETSCH, VIAL ediciones anteriores, CLARO SOLAR en Nº 4) y lectura
  actual de VIAL, y cuadro por número del 684. El resumen cita "art.
  681 Nº 1" por el 684 Nº 1: no se arrastra.
- Principio de las fictas (D.1.4): con nombre de BOETSCH; para VIAL
  vale en Nºs 3 y 5, no en 2 y 4 sin entrega (resuelve la tensión
  anotada en el 7c).
- Boetsch: faltan la entrada de D (cuatro distinciones), forma más
  corriente (Nº 1), primera tesis de la negativa, aprehensión simbólica
  y la alternativa "solo contrato o ficta" (Nº 2), disponer entregando
  las llaves (Nº 3), tradición por el solo contrato y la cita de CLARO
  SOLAR (Nº 4), finalidad de brevi manu y constituto, acciones del
  título (685 inc. 2º), RDJ t. 36 p. 435 (taxatividad), detalles de
  valor comparativo y de vehículos. Paráfrasis: 14 sobre 70%, 43 sobre
  35%.
- Citas: art. 1817 tiene tres reglas (el manual da una); art. 149 C.
  de Com. (tránsito por mar o tierra; uso constante del comercio); art.
  148 inc. 2º (consignatario). Ley 18.290 y D.S. 1.111/1985 no
  verificables en la carpeta de códigos.
- Ejemplos: "La bicicleta eléctrica de Rosario" (Mateo, brevi manu),
  "La enfardadora de don Hugo" (Celeste y Germán, constituto + 1817);
  breves: Lautaro (Nº 1), Damián (llaves), Julieta (Nº 4), doña Irma
  (pinos, 685), cláusula de prueba.
- Pregunta clásica propuesta: "¿Es taxativa la enumeración del art.
  684?". La de "¿684 o 686 regla general?" queda para el tramo 9a.

**Decisiones de Laura al informe (2026-11-23): "ok a todo"**, no
cambiar: esquema de las dos lecturas del art. 684 (tradicional:
BOETSCH y VIAL en ediciones anteriores; actual de VIAL) y cuadro;
**Laura no encontró el libro de VIAL en vLex** (solo el de Acto
Jurídico): se dice "en la edición más reciente de su obra", sin número
de edición. Dato: Alcalde (2018) cita VIAL, *La tradición y la
prescripción adquisitiva como modo de adquirir el dominio*, 3ª ed.,
Ediciones UC, 2009; no consta que sea la edición del resumen. `.ley`:
684, 685, 1817, 148 y 149 C. de Com.; vehículos sin números de
artículo; RDJ t. 36, p. 435 entra; pregunta clásica "¿Es taxativa la
enumeración del art. 684?".

**Material propio de Laura (2026-11-23):** Jaime Alcalde Silva, "De
los bienes y de su dominio, posesión, uso y goce", comentario de
jurisprudencia, *Revista Chilena de Derecho Privado* Nº 30 (2018), pp.
221-239 (C.S., rol 12.210-2017, art. 915). Copia en `Downloads/`
(`de-los-bienes-y-de-su-dominio-posesin-uso-y-goce-revista-chi.pdf`).
**No aplica al tramo 8.** Usar en: tramo 9a (historia del art. 686:
el Proyecto de 1853, art. 826, preveía una tradición simbólica
opcional de inmuebles; las reglas de la posesión inscrita entraron en
el Proyecto Inédito), tramo 13a (mera tenencia, el poseedor a nombre
ajeno del art. 915), tramo 14 (posesión inscrita) y tramos 20a-20b
(acción contra el injusto detentador, legitimación pasiva de la
reivindicatoria, propuesta de reconstrucción de las acciones reales).

Lo que se hizo: V.4.D (entrada con enlaces a D.1-D.4) y D.1 reescritos
en voz propia (paráfrasis: de 14 sobre 70% a 11, todas transcripciones
de artículos o títulos); entrada de 3. con las dos lecturas en
(i)/(ii); 3.1, 3.2, 3.4, 7 y 8 con (i)/(ii); No confundir de 3.2
mantenido y atribuido al razonamiento de VIAL; cuadro "Las cinco
formas del art. 684, según las dos lecturas" al final de 3.7; D.1.4
con nombre de BOETSCH y precisión de VIAL (resuelve la tensión del
7c); art. 1817 completo; cajas "La bicicleta eléctrica de Rosario" y
"La enfardadora de don Hugo" (reemplazan las genéricas); breves
(Lautaro, Damián, Julieta, doña Irma, cláusula de prueba); latinazgos
*tradens*/*accipiens* fuera. Verificación: cero guiones largos, ids
únicos, `href` resuelven, etiquetas balanceadas, párrafo más largo
1.071, capturas revisadas, vista previa actualizada. Respaldo en el
tmp del job (`05_Bienes_antes_8.html`).

## Tramo 9a: hecho y aprobado (2026-11-23), commit `e47fe19`

**V.4.D.2.1 a D.2.3.2, páginas 142 a 152 de Boetsch** (corte por
contenido propuesto: 3.2 Principios termina en la p. 152). Informe en
`Informes/Informe_Bienes_tramo9a.html`. Hallazgos:

- **Ley 21.772 (D.O. 01.10.2025, vigente en esto desde 02.04.2026):**
  el Reglamento del Registro Conservatorio pasó a llamarse **Ley del
  Registro Conservatorio de Bienes Raíces** y se reescribieron varios
  artículos. Texto vigente bajado de la BCN y guardado en
  `Apuntes/CODIGOS/Ley del Registro Conservatorio de Bienes Raíces (ex
  Reglamento 1857).pdf` (antes no estaba: ya se pueden verificar sus
  artículos). "Reglamento" aparece 52 veces en Bienes (solo en Bienes),
  incluso en tramos aprobados: decisión de Laura pendiente, renombrar
  todo de una vez (recomendado) o tramo por tramo.
- Desactualizado en Boetsch: responsabilidad del Conservador (art. 96
  hoy es disciplinario con exoneración; art. 97 derogado; art. 98
  remite al 443 COT; art. 8 garantía); "en la mayoría de las comunas el
  notario es Conservador" (hoy arts. 447 inc. 2º, 448 y 450 COT, más
  norma transitoria); publicidad por sitio web y repositorio digital
  (arts. 5, 5 bis, 49). Art. 78 Nºs 6 y 7 refuerza el tracto sucesivo.
- Error: art. 2409 citado para la inscripción de la hipoteca (es el
  2410). "COT 530 y ss." para la responsabilidad funcionaria: se cita
  el 539 inc. 2º (nombra a los conservadores).
- Boetsch: falta buena parte del Mensaje (simple tradición que deja a
  salvo al verdadero dueño; todo inscrito con los años; modelo alemán;
  adjudicaciones y transmisiones), detalles de Torrens y del sistema
  alemán, enunciaciones del Repertorio (art. 24), arts. 42, 44, 46,
  certificado de inscripción (85, 86), rogación inferida de los arts.
  12, 15 y 21, gradualidad de la fe pública. El Mensaje está en un Dato
  de grado (se retira, pasa al texto como cita; V.5.A.5.4.1 (i) remite
  aquí). Paráfrasis: 16/125 sobre 70% (5 son el Mensaje).
- VIAL (p. 14-17): lista del 686 por tipo de derecho; **uso y
  habitación: VIAL dice que no hay error en el 686 (constitución por
  tradición), frente a BOETSCH (3.3, p. 152, art. 819)**: dos lecturas
  con nombre aquí, enlace en el 9b; 724 y posesión del derecho vs. del
  inmueble; dar y entregar (hipoteca sin entrega). No se arrastra "dueño
  en 5 años" (simplifica 2508/2511). Ley 6.977 y servidumbres de agua:
  no verificadas (tramo 9c).
- ALCALDE (RChDP 30, p. 226 y nota 4, p. 227): art. 826 del Proyecto
  de 1853 (tradición simbólica opcional), reglas de la posesión inscrita
  en el Proyecto Inédito, crítica "grueso error" con su nombre.
- Propuestas: arts. 686 y 692 en `.ley`; esquema de funciones (i)-(v);
  cuadro "Tres opciones para construir un registro"; cajas "La casa de
  doña Herminia" (Baltazar, Agustina; 686, 724, 1817) y "El
  departamento de Teodoro" (Olga, Eusebio; 1689, 2508); breves
  (Wilfredo, Celinda); pregunta clásica recomendada "¿Es prueba de
  dominio la inscripción conservatoria?" (alternativa: "¿684 o 686?").
- **Para el 9b:** arts. 13, 58 y 78 de la ley cambiaron; art. 451 COT
  (Ley 21.718) plazo máximo de 20 días para inscribir; lo de VIAL sobre
  negativa, Repertorio y dos meses.

**Decisiones de Laura al informe (2026-11-23): "todo ok"**, no
cambiar: corte 142-152; **"Reglamento" renombrado en todo el manual
de una vez** a "Ley del Registro Conservatorio" (se dejaron a propósito
las menciones históricas: III.6 d) con nota sobre la Ley 21.772, la
casación del 3.5 "el antiguo Reglamento constituía un DFL", la
explicación de 3.1 y el Reglamento del Registro de Vehículos);
actualizaciones de las Leyes 21.772 y 21.718 resumidas; dos lecturas
de uso y habitación (BOETSCH/VIAL); párrafo de ALCALDE; Mensaje al
texto como cita (Dato de grado retirado); arts. 686 y 692 en `.ley`;
cuadro "Tres opciones para construir un registro"; fallo C.S. 29-12-2009
con fecha, sin rol; pregunta clásica **solo "¿Es prueba de dominio la
inscripción conservatoria?"** (la de "¿684 o 686?" se descarta). Laura
no indicó material propio.

Lo que se hizo: D.2.1 a D.2.3.2 reescritos en voz propia (paráfrasis:
de 16 oraciones sobre 70% a 0 de prosa; las que quedan son el Mensaje,
el art. 686, el fallo y la lista de los tres libros); unidades de
Boetsch, VIAL y ALCALDE verificadas por script; art. 2410 (no 2409);
responsabilidad del Conservador (arts. 96, 98, 8 de la ley; 539 inc. 2º
COT); notario conservador (arts. 447-450 COT); publicidad digital
(arts. 5, 5 bis, 49); art. 78 Nºs 6 y 7 en tracto sucesivo; funciones
en (i)-(v); 2.2, 3.1 y 3.2 con (i)-(vi) y a)-c) (ids de los antiguos
a)-f) eliminados, nada enlazaba); en el punto 3, "artículos sin otra
indicación = Ley del Registro Conservatorio" (dicho en 3.1); cajas "La
casa de doña Herminia" y "El departamento de Teodoro"; breves
(Wilfredo, Celinda, Agustina, Baltazar); Conexiones (AJ IV.B.4.3;
Contratos 1817). Verificación: cero guiones largos, ids únicos, `href`
resuelven, etiquetas balanceadas, párrafo más largo 1.002, capturas
revisadas, vista previa actualizada. Respaldo en el tmp del job
(`05_Bienes_antes_9a.html`).

## Tramo 9b: hecho y aprobado (2026-11-23), commit `70f1d71`

**V.4.D.2.3.3 a 3.10, páginas 152 a 160 de Boetsch** (3.11 empieza en
la p. 161). Informe en `Informes/Informe_Bienes_tramo9b.html`. Hallazgos:

- **Reparto mal rotulado desde el 9c** (propuesta en el informe, sin
  aplicar a la tabla hasta que Laura decida): 9c = 3.11-3.15 (p.
  161-166: cancelaciones, reinscripciones, sanción, saneamiento y DL
  2.695, inscripciones paralelas y de papel); 10a = D.2.4-D.2.7 (p.
  166-175: tradición de derechos reales sobre inmuebles, cuotas, art.
  688, la inscripción en la prescripción); 10b = D.3 y D.4 (p. 175-183).
- **Ley 21.772:** art. 78 reescrito (Nº 2 identificación del inmueble:
  nombre, dirección, región, provincia, comuna, rol de avalúo,
  superficie, planos; Nº 4 es la firma; "linderos" ya no aparece, solo
  en la hipoteca, art. 81 Nº 3); art. 13 (comuna en vez de
  departamento; sin "papel competente"; "o éstas no son correctas";
  fundamentos por escrito en hoja aparte; costos del notario
  negligente); art. 58 (aviso en el sitio web); art. 57 (certificación
  de sentencia ejecutoriada). Art. 451 COT (Ley 21.718): 20 días para
  inscribir, 10 tras reparos (va en 3.5, con el art. 96 Nº 3).
- Citas: art. 659 CPC no trata la comuna (partidor y adjudicaciones);
  arts. 56 y 59 (solo el 56 es de comuna; el 59 exige resolución
  judicial previa); art. 69 (copia de la anotación, no "certificado de
  repertorio" general); art. 92 (la nota de referencia es obligatoria,
  no "práctica").
- Boetsch: faltan ALESSANDRI (instrumentos públicos), "impedimento de
  registro" y el argumento del art. 13 "por ley, no por acuerdo", los
  ejemplos de embargo amplio, arts. 56 y 59, volver a pedir la
  inscripción subsanado el defecto, la opinión de BOETSCH sobre inscribir
  antes de que caduque la primera anotación, la caducidad de las
  posteriores (art. 17), art. 19, el argumento del "título" en sentido
  instrumental, la regla del art. 14 ("hasta que se le haga constar..."),
  linderos como determinación del objeto. Paráfrasis: 29 de 55
  oraciones de prosa sobre 70%.
- VIAL (p. 15-16, 30): confirma, nada nuevo; prohibición de enajenar ya
  en el No confundir de III.6.4 (enlace).
- Título de 3.8 quedó anacrónico con el renombre del 9a ("anteriores a
  la vigencia de la Ley del Registro Conservatorio"): propuesto
  "anteriores a la entrada en funciones del Registro"; fecha 1859 no
  verificable en la carpeta (decide Laura).
- Propuestas: listas de los arts. 52 y 53 por sus Nºs (corrige "l." y
  "m."); 3.3, 3.4 y 3.5 con (i)...; cuadro "Anotación en el Repertorio
  e inscripción"; cajas "El galpón de Gumercindo" (Nelly, Yolanda;
  arts. 15, 17, 78 Nº 2, 82) y "La parcela de doña Clotilde" (Abelardo,
  Chonchi; arts. 693 y 58); breves (Osvaldo, minuta "Los Aromos 1280",
  Baltazar y art. 14, Josefina de III.6.4, Graciela); pregunta clásica
  recomendada "¿Cómo se individualiza el bien inmueble en el
  Conservador?" (de PREGUNTAS BIENES), alternativa "¿Puede el
  Conservador negarse a inscribir un título?". Conexiones: AJ IV.B.1.6
  (art. 1683); Procesal y Contratos con `[FALTA: sección]`.

**Decisiones de Laura al informe (2026-11-23): "ok"**, no cambiar:
reparto nuevo (9c = 3.11-3.15; 10a = D.2.4-D.2.7; 10b = D.3 y D.4,
tabla corregida); art. 78 actual con el razonamiento de BOETSCH sobre
los linderos; leyes nuevas resumidas; título de 3.8 "anteriores a la
entrada en funciones del Registro", **sin fecha**; listas de los arts.
52 y 53 por sus Nºs; cuadro; **las dos preguntas clásicas** (negativa
al final de 3.5, individualización al final de 3.9). Laura **no tiene
material propio**. El `AJ_vista_previa.html` suelto en la raíz de
`DERECHO LIBRE/` (copia del 7 de octubre del manual de AJ) **se deja
donde está**, por decisión de Laura.

Lo que se hizo: D.2.3.3 a D.2.3.10 reescritos en voz propia
(paráfrasis: de 29 oraciones de prosa sobre 70% a ninguna de prosa
propia; las que quedan son ítems de la ley, el art. 14 o la frase
atribuida a BOETSCH); 3.3 con (i)/(ii) y a)-d) / a)-c) por Nºs de los
arts. 52 y 53; 3.4 (i)-(iv); 3.5 (i)-(ii) (ids `-3-3-a/b`,
`-3-4-a..d`, `-3-5-a/b` eliminados, nada enlazaba); arts. 13, 57, 58
y 78 vigentes; art. 451 COT y 96 Nº 3; arts. 56, 59, 69, 89 y 92;
ALESSANDRI; opiniones de BOETSCH con nombre; lo de los tribunales
atribuido; cuadro "Anotación e inscripción"; cajas "El galpón de
Gumercindo" y "La parcela de doña Clotilde"; breves (Osvaldo, minuta,
Baltazar y art. 14, Josefina, Graciela); dos preguntas clásicas;
Conexiones (AJ IV.B.1.6; Procesal y Contratos con `[FALTA: sección]`).
Verificación: cero guiones largos, ids únicos, `href` resuelven,
etiquetas balanceadas, párrafo más largo 840, unidades del inventario
verificadas por script, capturas revisadas, vista previa actualizada.
Respaldo en el tmp del job (`05_Bienes_antes_9b.html`).

## Tramo 9c: hecho y aprobado (2026-11-23), commits `e389e95` y `eb39226`

**V.4.D.2.3.11 a 3.15, páginas 161 a 166 de Boetsch** (cierra el punto 3
de D.2). Informe en `Informes/Informe_Bienes_tramo9c.html`. Hallazgos:

- **DL 2.695 desactualizado en Boetsch:** "al cabo de un año" dueño; desde
  la Ley 21.108 (2018) son dos años (el manual ya lo dice en V.5.B.8).
  Avalúo: menos de 800 UTM rural / 380 UTM urbano. Verificado con ORREGO
  (2020), no con la BCN (el DL no está en `Apuntes/CODIGOS/`).
- Citas: art. 728 dice "decreto judicial" (el manual, "sentencia");
  PEÑAILILLO habla de requisitos "en consideración a la naturaleza del
  acto" (fórmula del art. 1682), no "requisitos de forma"; en la causa
  c) de las paralelas (art. 14) la doble inscripción nace después de la
  notificación judicial, no "en el intertanto".
- "La doctrina y jurisprudencia en general" (inscripciones de papel)
  choca con V.5.A.5.4 (TRUCCO, LIRA, ALESSANDRI); el anexo de
  discusiones dice que es la jurisprudencia reciente. Propuesto: dos
  posturas sin tomar partido.
- VIAL (p. 72-75): resciliación/transacción como "voluntad de las
  partes" del 728 (nuevo, con nombre); lo demás del 728 y 730 ya está en
  V.5.A.5.4.3 (enlace). Discusiones doctrinales nº 3: crítica a la
  reinscripción (minoritaria, sin autor).
- Paráfrasis: 8 de 25 oraciones sobre 70%.
- Propuestas: 3.13 con (i) PEÑAILILLO / (ii) ROZAS; 3.15 a)/b) a
  (i)/(ii); art. 728 inc. 1º en `.ley`; cuadro "Tres criterios para
  resolver las inscripciones paralelas"; caja "El sitio de Leontina"
  (Renato, Rosalía, Los Vilos); breves (Hortensia y Teófilo, heredero y
  reinscripción, Eduvigis en Coyhaique, Filomena en Melipilla); pregunta
  clásica recomendada "¿Qué son las inscripciones paralelas y cómo se
  resuelven?"; la de "¿cómo se cancela la posesión inscrita?" (de
  PREGUNTAS BIENES) propuesta para el tramo 14. Conexiones: AJ IV.B.2.2
  (art. 1682); Contratos 1817 con `[FALTA: sección]`.

**Decisiones de Laura al informe (2026-11-23): "ok a todo el resto"**,
y agregó el texto vigente del DL a `Apuntes/CODIGOS/DL-2695_21-JUL-1979.pdf`
(BCN, última modificación Ley 21.737, 21-04-2025). **El texto vigente
corrige también a ORREGO:** el avalúo hoy es igual o inferior a **1.000
UTM**, rural o urbano (Ley 21.737, 2025; ya no 800/380), y hay un
requisito nuevo: declaración jurada de no tener juicio pendiente ni
condena por usurpación (art. 2 Nº 3, Ley 21.633, 2023). La resolución
vale como justo título (art. 15).

Lo que se hizo: D.2.3.11 a 3.15 reescritos en voz propia (paráfrasis:
de 8 de 25 oraciones sobre 70% a ninguna de prosa propia; las que
quedan son la cita de URRUTIA y el art. 728); art. 728 inc. 1º en
`.ley` ("decreto judicial"); resciliación con VIAL; reinscripción con
la crítica minoritaria y enlace a D.2.6.2; 3.13 con (i) PEÑAILILLO /
(ii) ROZAS; DL 2.695 resumido con el texto vigente (arts. 1, 2, 15 y
16) y enlaces a V.5.B.6 y V.5.B.8; 3.15 con (i)/(ii) (ids
`cV-4-D-2-3-15-a/b` eliminados, nada enlazaba); causa c) corregida;
cuadro "Tres criterios" con la cita de TRUCCO; caja "El sitio de
Leontina"; pregunta clásica "¿Qué son las inscripciones paralelas y
cómo se resuelven?"; inscripciones de papel con las dos posturas;
breves (Hortensia y Teófilo, Eduvigis, Filomena); Conexiones (AJ
IV.B.2.2; Obligaciones 1567 y Contratos 1817 con `[FALTA: sección]`).
Ajuste pedido por Laura (2026-11-23): VIAL con nombre en 3.15 (i):
causa a), su lectura del art. 730 inc. 2º (la inscripción por avisos
hecha por el mero tenedor sería "competente inscripción" y pondría fin
a la posesión anterior, enlace a V.5.A.5.4.3); y la paralela por título
que no proviene del poseedor inscrito (una eficaz, otra ineficaz).
Verificación: cero guiones largos, ids únicos, `href` resuelven,
etiquetas balanceadas, párrafo más largo 759, capturas revisadas,
vista previa actualizada. Respaldo en el tmp del job
(`05_Bienes_antes_9c.html`).

**Pendientes que deja el 9c:** pregunta clásica "¿Cómo se cancela la
posesión inscrita?" (PREGUNTAS BIENES) para el tramo 14 (V.5.A.5.4.3);
en el tramo 16b, revisar V.5.B.6 y V.5.B.8 contra el texto vigente del
DL 2.695 (falta el requisito del art. 2 Nº 3 y el avalúo de 1.000 UTM,
si se menciona).

## Tramo 10a: hecho y aprobado (2026-11-23), commits `852c58a` y `5065c22`

**V.4.D.2.4 a D.2.7, páginas 166 a 175 de Boetsch** (cierra D.2).
Informe en `Informes/Informe_Bienes_tramo10a.html`. Hallazgos:

- Art. 687: "territorio", no "departamento" (Ley 18.776); los arts. 54
  y 55 de la Ley del Registro Conservatorio siguen con el texto de 1857
  (manda el art. 688 vigente).
- Art. 1876 inc. 2º (precio declarado pagado: contra terceros solo
  nulidad o falsificación), ausente en Boetsch: es la base legal de la
  instrucción al notario.
- **Laura agregó a `Apuntes/CODIGOS/`** la Ley 19.903
  (`LEY-19903_10-OCT-2003.pdf`) y el DFL 1 de 2000
  (`DFL-1_30-MAY-2000.pdf`), que trae al final el texto refundido de la
  **Ley 16.271** (desde el "ARTICULO 8º" del DFL). Verificados: art. 25
  (no se dispone de bienes de la herencia sin inscribir la posesión
  efectiva) y art. 30 (inmuebles de la sociedad conyugal a nombre del
  cónyuge y los herederos). **Corrección a Boetsch:** la Ley 19.903 (art.
  8) no dice que la resolución administrativa se inscriba en el Registro
  de Propiedad del Conservador del último domicilio: el certificado del
  Registro Nacional sirve para pedir las inscripciones especiales. Que el
  decreto judicial "también se inscribe" en el Registro Nacional no está
  en la ley: se dejó lo que dice el art. 882 CPC (el tribunal oficia al
  Registro Civil).
- Paráfrasis: 30 de 61 oraciones sobre 70%. Dato de grado en 5.1. Citas
  RDJ y Gaceta perdidas.
- VIAL (p. 31-38) y discusiones nº 3: ver el informe.

**Decisiones de Laura al informe (2026-11-23):** corregir "departamento";
agregar el art. 1876 inc. 2º; cuadro de la sanción del art. 688; **no
incluir la salida de la querella de amparo** (anexo de discusiones, sin
autor ni explicación); **las dos preguntas clásicas**; sin material
propio; "ok el resto".

Lo que se hizo: D.2.4 a D.2.7 reescritos en voz propia (paráfrasis: de
30 de 61 a 6 de 190, todas títulos u oraciones fácticas breves); citas
RDJ y Gaceta repuestas; arts. 1824 y 1876 inc. 2º (este en `.ley`);
art. 688 completo en `.ley`; Dato de grado de 5.1 retirado (al texto);
5.2 con enlaces a IV.5.1 y IV.6; 6.1 con Ley 19.903 (art. 1 y 8) y Ley
16.271 (arts. 25 y 30) verificadas, art. 687 "territorio", arts. 882 y
883 CPC, VIAL con nombre (rol de las inscripciones, especiales siempre
en el Conservador, bastan las dos primeras), enlaces a V.6.C y
V.5.A.2.2.2; (i)-(iii) y a)-e) al marcado `enum-i-run`/`enum-a-run`
(sin ids propios, nada enlazaba); 6.2 con el caso del remate, el
argumento contra la nulidad absoluta, VIAL (arts. 679 y 696, nota de
"posesión efectiva"), críticas minoritarias, mero tenedor, nulidad
relativa por la calidad de heredero (1682 inc. 3º) con anotación
marginal; cuadro "Respuesta / Qué pasa con la venta / Quién / Objeción";
No confundir (art. 688 frente a cesión del derecho de herencia, enlace
a D.3); 7 con VIAL (servidumbres, art. 698; el "título" del 689);
cajas "La casa de Segismundo" (Fresia, Wenceslao) y "La parcela de don
Belarmino" (Rodolfo, Zunilda, Aníbal, Bernardita; Conservador de Buin);
breves (Rebeca, Herminio); dos preguntas clásicas; Conexiones (AJ IV.D.3,
IV.B.2.5 y IV.B.3.6; Obligaciones, Contratos y Sucesorio con `[FALTA:
sección]`). Verificación: cero guiones largos, ids únicos, `href`
resuelven, etiquetas balanceadas, párrafo más largo 1.170, capturas
revisadas, vista previa actualizada. Respaldo en el tmp del job
(`05_Bienes_antes_10a.html`).

Ajustes de la revisión final (mismo día): nulidad relativa con el
art. 1682 incs. 1º y 3º (la "calidad o estado de las personas" está en
el inc. 1º, como contraste; el informe decía inc. 3º); art. 1815 citado
con su texto ("vale, sin perjuicio de los derechos del dueño"); enlaces
de la comunicación de la cuota a IV.5.1 (no IV.6); caja de don Belarmino
recorre todas las tesis del cuadro; Herminio sin tomar partido en el art.
2505; sin "Conservador de Buin" (art. 687); breve de Domitila con
servidumbre de **acueducto** (continua y aparente, arts. 822 y 882; la de
tránsito no se adquiere por prescripción); No confundir matizado con D.3.4
(la jurisprudencia no exige inscripciones para ceder la herencia; la tesis
de GUTIÉRREZ sí, si hay inmuebles).

**Pendiente para el 10b:** la nota "el art. 688 no se aplica a la cesión
del derecho de herencia" ya quedó en el No confundir de 6.2; en D.3
enlazar de vuelta.

## Tramo 10b: hecho y aprobado (2026-11-23), commit `4580ceb`

**V.4.D.3 y D.4, páginas 175 a 183 de Boetsch** (cierra V.4). Informe en
`Informes/Informe_Bienes_tramo10b.html`. Hallazgos: art. 54 Ley 16.271
reformado (Ley 21.420, 2022: también notarios y enajenaciones en común);
art. 1911 inc. 2º (litigioso desde la notificación de la demanda) y art.
1913 (retracto) ausentes; oración rota en el legado de especie; D.3.4.2
con `h7`, `h5` y `enum-a` mezclados; paráfrasis 30 de 54 sobre 70%; VIAL
(p. 17-18: derecho de herencia distinto del patrimonio, se cede la
calidad de heredero, adhiere a URRUTIA; arts. 1903-1907); discusiones nº 4
(hechos que la jurisprudencia aceptó como tradición de la herencia).

**Decisiones de Laura (2026-11-23):** 6.2 del 10a (sanción del art. 688)
de a)-e) a **(i)-(v)**, y las dos críticas minoritarias como **(i)
Primero / (ii) Segundo**; derechos litigiosos con una **conexión al art.
1464 Nº 4** (AJ II.C.4.3 ya tiene el No confundir "Especie litigiosa y
derecho litigioso"); el cuadro se deja (no es imprescindible), con
**conexión a Sucesorio**; **solo la primera pregunta clásica** (tradición
del derecho de herencia; la de derechos personales, no). No respondió
sobre la cesión de créditos ni el retracto: se aplicó lo recomendado
(párrafo breve con arts. 1903, 1904, 1906 y 1907 y remisión a Contratos;
art. 1911 inc. 2º y una línea del art. 1913). Avisado en el mensaje final
para que pueda pedir quitarlo.

Lo que se hizo: D.3 y D.4 reescritos en voz propia (paráfrasis: de 30 de
54 a 2 de 144, un título y la cita literal del art. 1911); introducción
con VIAL; D.3.1 con art. 1811 y 1204; D.3.2 (i) GUTIÉRREZ / (ii) URRUTIA
con VIAL, jurisprudencia con citas y hechos aceptados; caja "La herencia
de la tía Clorinda" (Eleuterio, Gertrudis, Casimiro); pregunta clásica;
D.3.3 (i)/(ii) con art. 1910 inc. final; cuadro "Quien cede / Qué
adquirió / Cómo se tradita / ¿Art. 688?"; D.3.4.1 con STITCHKIN; D.3.4.2
(i) género / (ii) especie → a)/b) → a.1)-b.2) (`enum-c-run`; ids
`cV-4-D-3-4-2-a/b` y los `h5` eliminados, nada enlazaba); art. 54
vigente; caja "Los legados de don Florindo" (Pascuala, Nicanor); D.4.1
con art. 699 en `.ley`, dos sentidos de "título", arts. 1902-1907, breve
de Ismael, Etelvina y Abigail, SILVA BASCUÑÁN; D.4.2 con arts. 1911 inc.
2º, 1913, 1464 Nº 4, (i) RIOSECO / (ii) SILVA BASCUÑÁN, breve de Ofelia e
Hipólito; Conexiones (AJ II.C.4.2 y II.C.4.3; Contratos y Sucesorio con
`[FALTA: sección]`). Verificación: cero guiones largos, ids únicos, `href`
resuelven, etiquetas balanceadas, párrafo más largo 1.080, capturas
revisadas, vista previa actualizada. Respaldo en el tmp del job
(`05_Bienes_antes_10b.html`).

## Tramo 11a: hecho y aprobado (2026-11-26)

**V.5 (introducción) y V.5.A.1, páginas 184 a 191 de Boetsch.** Informe en
`Informes/Informe_Bienes_tramo11a.html`. Hallazgos: bajo "V.5 La
prescripción" no había texto (falta el art. 2492); Mensaje recortado en un
Dato de grado; art. 894 (publiciana solo del poseedor regular);
paráfrasis 52 de 73 sobre 70%; VIAL (Relaciones jurídicas con una cosa,
p. 1-5), Bozzo e Ibarra (corpus y animus), discusiones nº 5 (POTHIER,
MOLITOR).

**Material nuevo de Laura (2026-11-23):** el *Tratado de la posesión* de
SAVIGNY en seis anexos (`Apuntes/CIVIL/Bienes/Anexo_*_Savigny.pdf`:
Nociones sobre la posesión, Adquisición, Pérdida, De los interdictos, De
la juris quasi possessio, Modificaciones del derecho romano). Es derecho
romano, largo (unas 750 mil letras): usarlo por citas puntuales. En el
11a se usaron el batelero (corpus, § 1), el animus domini (§ 9), "al
mismo tiempo hecho y derecho" (§ 5) y el fundamento de los interdictos
(§ 2). Para los tramos 13b-13c (adquisición y pérdida) y 20c
(interdictos/acciones posesorias) revisar sus secciones respectivas.

**Decisiones de Laura (2026-11-23):** cuadro de los derechos personales;
**no decir cuál postura es mayoritaria, pero sí que "se ha entendido que
pueden poseerse los créditos que permiten un ejercicio continuado"**;
No confundir de la posesión notoria (arts. 200 y 310); fundamento de la
protección posesoria en ventajas (explicación frecuente + SAVIGNY); **las
dos preguntas clásicas**; y una **pregunta clásica nueva en V.5.A.5.1.1
(capacidad para adquirir la posesión): "¿Por qué los requisitos de
capacidad para poseer son menores que para celebrar un acto jurídico?"**
(respuesta: es un hecho, no un derecho; art. 723). Ya agregada, aunque
V.5.A.5 es del tramo 13c: al trabajar ese tramo, conservarla.

Lo que se hizo: introducción de V.5 (art. 2492); A.1 reescrito en voz
propia (paráfrasis de prosa: quedan solo citas del Mensaje y artículos y
dos o tres oraciones breves); Mensaje completo en `.ley` (Dato de grado
retirado); arts. 700 incs. 1º y 2º, 714 y 715 en `.ley`; SALAS; SAVIGNY,
BOZZO e IBARRA, VIAL (título posesorio, objeción a IHERING, derecho a la
posesión, presunción simplemente legal, art. 701, tres relaciones),
POTHIER, MOLITOR; 3 en (i)-(iii); ventajas (i)-(iv) con art. 894 y art.
907 inc. 3º precisados; caja "La lancha de Anacleto" (Primitivo,
Hermelinda, Lisandro); No confundir posesión notoria; breves (Úrsula y
Edelmira, Eusebia); art. 585 (alta mar), arts. 948-949 con la recompensa;
8 en (i)/(ii); 9 en (i)/(ii) con cuadro; dos preguntas clásicas;
Conexiones (Obligaciones, Contratos, Familia con `[FALTA: sección]`).
Verificación: cero guiones largos, ids únicos, `href` resuelven,
etiquetas balanceadas, párrafos bajo 1.200 salvo la cita del Mensaje,
capturas revisadas, vista previa actualizada. Respaldo en el tmp del job
(`05_Bienes_antes_11a.html`).

**Ajustes pedidos por Laura en vista previa (2026-11-26), regla para
todos los tramos que siguen:** cada artículo transcrito en `.ley` lleva en
negrita sus elementos clave (aplicado a los arts. 2492, 700, 714 y 715), y
las definiciones legales se transcriben con sus incisos centrales: el art.
700 va completo en V.5.A.1.2, con la presunción de dominio del inc. 2º
(que además sigue en 4). Commits `c1b1cc9`, `b6e4309`, `93f46c9`,
`2ba9963`.

## Tramo 11b: hecho y aprobado (2026-11-26), commits `0fe8380` y `6f04967`

**V.5.A.2 introducción, posesión regular y justo título completo,
páginas 191 a 202 de Boetsch** (corte por contenido propuesto: el
reparto decía 191-198, pero cortaba la sucesión por causa de muerte; el
justo título termina con el art. 704 en la p. 202). Informe en
`Informes/Informe_Bienes_tramo11b.html`. Hallazgos: falta la tesis
contraria a STITCHKIN en la adjudicación (declarativa, el 703 hablaría
de adjudicaciones a extraños); faltan el comentario a) de Boetsch al
concepto, la justificación del inc. 5º (juicios coludidos), POTHIER y el
causante mero tenedor, y casi todo el art. 704 (VERDUGO, nulidad
relativa y art. 1684, art. 1815 ecléctico, título putativo y desde
cuándo corre); art. 702 sin incs. 1º y 4º; "art. 704 Nº 4" debe ser inc.
final (art. 1269); el comentario del legatario putativo es del texto
anterior a la Ley 19.903; marcado roto en a) y b) de los títulos
injustos; tres ejemplos de Boetsch a rehacer; paráfrasis 53 de 82 sobre
70%. Fuentes: VIAL p. 56-62 y 42-43, Bozzo e Ibarra p. 2-4 (ROZAS),
Lombardo p. 6-7; discusiones nº 1 ya en V.1.6.

**Decisiones pedidas a Laura (8):** unir 11c (p. 202-204) con el 12;
esquema de la discusión "¿Cuál es el título de la posesión?" (BOETSCH /
VIAL / ROZAS, sin tomar partido); nombrar a ROZAS (viene de resumen);
cuadro de 3 posturas x 4 preguntas; art. 702 completo en 2.1; ajustar la
frase "otros sostienen" de V.4.A.2.5 con nombres; preguntas clásicas
(recomendadas: posesión regular y requisitos, justo título y
clasificación, heredero putativo); material propio.

**Decisiones de Laura (2026-11-26): "todo ok"** a las 8 (11c se une al
12, que queda p. 202-213; esquema, ROZAS con nombre, cuadro, art. 702
completo en 2.1, frase de V.4.A.2.5 con VIAL y ROZAS, tres preguntas
clásicas recomendadas). Laura no tenía material propio, pero trajo dos
fuentes nuevas:

- **`Apuntes/CIVIL/Bienes/Apuntes/Anexo_Modos de adquirir el
  dominio_Peñaililo,2010.pdf`** (106 p., nº 73 a 189+: modos, tradición,
  posesión). **Hallazgo importante: Boetsch sigue casi literal a
  PEÑAILILLO en este tramo** (la "expresión de un autor", la crítica a
  la ocupación, la nulidad relativa "algo artificiosa", la crítica al
  Nº 4, los ejemplos de 1980, 1990 y el camión son suyos). Por eso las
  opiniones se atribuyeron a PEÑAILILLO. Aporta además: el título
  traslaticio no necesita emanar del dueño; fines de la posesión
  efectiva; arts. 717 y 1268; **heredero de un mero tenedor: parece
  predominar que no basta ser heredero** (se puso junto a la postura de
  BOETSCH); envergadura de la falsificación; actos simulados y
  resueltos como putativos; legatario de especie y no de género; crítica
  a la taxatividad del 704. **Para los tramos siguientes (12 en
  adelante: buena fe, tradición, irregular, viciosa, mera tenencia,
  agregación, ACP posesión), cotejar siempre con este anexo**: es la
  fuente de Boetsch. Los tramos ya aprobados no se revisaron contra él
  (decidir con Laura si vale la pena).
- **`Apuntes/CIVIL/Bienes/Sentencias/sentencia-n-17962025...pdf`**:
  Corte Suprema, 24-02-2026, rol 1796-2025: compraventa de inmueble por
  instrumento privado protocolizado es nula absolutamente (art. 1801
  inc. 2º), título injusto (704 Nº 3), sin posesión regular ni
  publiciana. Entró en (v) c). Sirve también para VII.2 (publiciana,
  art. 894) y para la tradición de inmuebles.

Lo que se hizo: A.2 intro y 2.1-2.2 completos reescritos en voz propia
(paráfrasis sin `.ley`: 9 de 241 sobre 70%, fragmentos y citas; contra
Peñailillo, 9 de 261); arts. 702, 703 y 704 completos en `.ley` con
negritas; 2.2 en escalera (i)-(v), clasificación a)-c) con c.1)-c.3),
sucesión a)-b) con b.1)-b.2); id nuevo `cV-5-A-2-2-2-v` (títulos
injustos); discusión (iii) BOETSCH / VIAL / ROZAS con cuadro; tesis
declarativa de la adjudicación agregada; art. 704 inc. final y art.
1269 corregidos; legatario putativo con la advertencia de la Ley
19.903; cajas "El tractor de Chimbarongo" y "El sitio de Pichidangui";
breves (Fortunato, aluvión, Eduviges y Saturnino, Gumercinda y Nemesio,
Evaristo y Ponciano, Rosendo, Aurelia y Teodosio); No confundir de la
posesión de la herencia conservado; tres preguntas clásicas (posesión
regular, justo título, heredero putativo) más la de la adjudicación;
Conexiones (AJ IV.B.3.4 y IV.B.3.6; Contratos y Sucesorio con
`[FALTA: sección]`); V.4.A.2.5 nombra a VIAL y ROZAS. Verificación:
cero guiones largos, ids únicos, `href` resuelven, etiquetas
balanceadas, párrafos bajo 1.100, capturas revisadas, vista previa
actualizada. Respaldo en el tmp del job (`05_Bienes_antes_11b.html`).

**Pregunta clásica de la adjudicación:** Laura decidió dejarla
(2026-11-26), así que el 11b tiene cuatro.

**Revisión de V.1 a V.5.A.2 contra PEÑAILILLO 2010 (pedido de Laura,
2026-11-26):** informe en
`Informes/Informe_Bienes_revision_Penailillo.html`. **Laura dijo "ok
a todo" (2026-11-26) y la pasada corta ya está hecha** (respaldo en el
tmp del job, `05_Bienes_antes_penailillo.html`): 26 cambios de nombre
BOETSCH → PEÑAILILLO (incluidos la pregunta clásica de V.4.C.3, el
ejemplo de Colomba y "coincide/se separa de" en V.4.B.3.2), una cuarta
razón en V.4.B.3.2 ("la posesión es un hecho"), la propuesta de
PEÑAILILLO de una tradición causada atenuada (con el art. 1689), su
razón práctica para el art. 1874, su cautela en las inscripciones
paralelas, su apoyo a la cesión de créditos sin documento (V.4.D.4.1),
una línea sobre universalidades de hecho (V.5.A.1.7) y otra sobre
"predomina ampliamente que es un hecho" con los arts. 919 y 2500
(V.5.A.1.3). La crítica a la especificación ya nombraba a PEÑAILILLO
(error del informe). Los 4 opcionales no se agregaron. Quedan 43
menciones a BOETSCH en V.1-V.5.A.2, revisadas: son suyas. Resultado: Boetsch copia
604 de 1.248 oraciones de Peñailillo (nº 73 a 167). Hay 15 lugares
donde el manual dice "BOETSCH" y la opinión es de PEÑAILILLO (V.2.2,
V.3.5.3, V.4.A.4, V.4.B.1.1, V.4.B.1.2, V.4.B.3.2, V.4.C.2, V.4.C.3,
V.4.C.4.3, V.4.D.1.4, V.4.D.2.1, V.4.D.2.3.3, V.4.D.2.3.4, V.4.D.2.3.9 y
la columna "BOETSCH" del cuadro de V.5.A.2.2.2 (iii)). También hay 7
vacíos recomendados: tradición causada o abstracta y la propuesta de
PEÑAILILLO (V.4.B.3); su razón para preferir el 1874 (V.4.C.4.3);
nombrarlo en la crítica a la especificación (V.3.5.2); la cautela con
la posesión material en las inscripciones paralelas (V.4.D.2.3.15);
créditos sin título entregable (V.4.D.4); universalidades de hecho
poseíbles (V.5.A.1.7); "predomina ampliamente" que es un hecho, más los
arts. 919 y 2500 (V.5.A.1.3). Y 4 opcionales: interés que es reajuste
(V.3), cancelación judicial con emplazamiento (V.4.D.2.3.11), naturaleza
de la función registral, catastro y Ley 16.665 (V.4.D.2), y la
precedencia entre posesión y propiedad (V.5.A.1.4). Propuesta: una
pasada corta antes del tramo 12.

**Sentencia de la Corte Suprema para Contratos:** anotada en
`docs/manuales/material_para_contratos.md` (pedido de Laura: usarla en
las solemnidades legales de la compraventa).

**Pendientes que salen de aquí:** VIAL sobre la tradición "equívoca" del
art. 702 (2.4, próximo tramo, y tramo 14); plazos de la herencia (16a);
apoderamiento del art. 729 (13b y 14).

## Tramo 12: hecho y aprobado (2026-11-27), commit `3ff941f`

**V.5.A.2.2.3 a V.5.A.2.4 (buena fe, tradición, ventajas, posesión
irregular y posesiones viciosas), páginas 202 a 208 de Boetsch** (el
reparto decía 202-213, pero ese contenido termina en la p. 208, antes de
"A.3 La mera tenencia"). Informe en `Informes/Informe_Bienes_tramo12.html`.

Hallazgos: Boetsch copia a PEÑAILILLO (nº 168 a 171) en buena fe,
tradición, ventajas y concepto de irregular (45 de 108 oraciones); en las
viciosas sigue a VIAL. **Paralelo e) está mal en el fondo**: los frutos
dependen de la buena o mala fe al percibirlos (arts. 907 inc. 3º y 913),
no de que la posesión sea regular. Citas: art. 907 inc. 3º (no 2º); art.
702 inc. 3º para la tradición (no 2º); arts. 94 y 2510 por reglas.
Marcado roto en a), b), c) y e) del paralelo. Faltan arts. 706 y 707 en
`.ley`, DE RUGGIERO y PLANIOL/RIPERT, cuestión de hecho, POTHIER, la
presunción de mala fe exclusiva de la posesión, la analogía con la fuerza
como vicio del consentimiento, y VIAL sobre la tradición "equívoca" (art.
708). Paráfrasis: 16 de 30 sobre 70%. **Dos contradicciones entre
fuentes**: cuál es la opinión mayoritaria sobre la utilidad de la
posesión viciosa (BOETSCH y VIAL: útil; PEÑAILILLO y discusiones nº 15:
la tradicional es inútil) y si la violencia es vicio permanente
(PEÑAILILLO: discutido). Fuentes nuevas usadas: discusiones nº 15
(BELMAR), SAVIGNY (vicio relativo, *ab adversario*), CLARO SOLAR vía VIAL
(art. 711).

**Decisiones pedidas a Laura (10):** corte 202-208 y reparto corregido
de 13 y 14; corregir paralelo e) con No confundir "Poseedor regular no es
lo mismo que poseedor de buena fe"; VIAL en 3.1 con enlace desde 2.4; no
decir cuál postura es mayoritaria en la utilidad; rehacer el No confundir
de la violencia con PEÑAILILLO y SAVIGNY; cuadro de 4 posturas x 4
preguntas; nombrar a BELMAR y CLARO SOLAR "según recoge" la fuente; no
incluir la frase ambigua de VIAL sobre el error de Derecho; tres
preguntas clásicas (buena fe, irregular, utilidad de la viciosa);
material propio.

**Reparto corregido propuesto (páginas reales):** 13a 208-214 (A.3 y
A.4); 13b 214-218 (A.5.1 a A.5.3, muebles); 13c 218-228 (A.5.4.1,
inmuebles: aspectos generales); 14a 228-235 (no inscritos); 14b 235-245
(inscritos y A.6 prueba). Pendiente de aprobación: hasta entonces vale la
tabla de "Reparto de tramos".

**Decisiones de Laura (2026-11-27): "todas ok"**, las tres preguntas
clásicas recomendadas, sin material propio. Pidió que se le explicara la
crítica de VIAL: se explicó en el chat y quedó en 3.1 con enlace desde
2.4 (si al verla prefiere otra ubicación, se mueve).

Lo que se hizo: 2.3 en escalera (i)-(iii) con arts. 706 y 707 en `.ley`,
PEÑAILILLO (concepto único, método, creencia/comportamiento, prueba),
VIAL (desglose del 706), DE RUGGIERO, PLANIOL y RIPERT, cuestión de hecho,
BELLO, POTHIER, presunción de mala fe exclusiva de la posesión; arts. 907
inc. 3º, 702 inc. 3º y reglas de los arts. 94 y 2510 corregidos; caja
"Dos bicicletas en Puerto Varas"; No confundir "Poseedor regular no es lo
mismo que poseedor de buena fe" (cerezos de Clodomiro); 2.4 con la mesa
de pool y enlace a 3.1; 2.5 con PEÑAILILLO; 3.1 con art. 708 en `.ley` y
la crítica de VIAL; 3.2 a)-e) con marcado arreglado y e) corregido; 4.1
con arts. 709 a 713 en `.ley`, analogía con la fuerza, POTHIER,
SAVIGNY, CLARO SOLAR vs VIAL (art. 711), breves de Emeterio y Florinda y
de Rosalba; No confundir de la violencia rehecho (permanente para
BOETSCH y VIAL, discutido según PEÑAILILLO, art. 920 inc. 3º, SAVIGNY);
4.2 (i)-(ii) con caja "El kayak de Licán Ray", posturas a)-d)
(tradicional con el Mensaje, BELMAR, RODRÍGUEZ GREZ, VIAL con art. 2502
Nº 1) y cuadro; tres preguntas clásicas; Conexiones (AJ II.A.5.2 y
II.A.7; Contratos con `[FALTA: sección]`). Verificación: cero guiones
largos, ids únicos, `href` resuelven, etiquetas balanceadas, párrafos
bajo 1.100, paráfrasis 6 de 164 sobre 70% contra Boetsch (citas y
artículos) y 2 de 164 contra Peñailillo, capturas revisadas, vista
previa actualizada. Respaldo en el tmp del job (`05_Bienes_antes_12.html`).

**Pendientes que salen de aquí:** tres lecturas del art. 894 (20a);
viciosas y acciones posesorias, arts. 918 y 920 inc. 3º (20c); VIAL y el
art. 724 (14); cruce de V.5.A.1.5 "Mera tenencia" con A.3 (13a).

## Tramo 13a: hecho y aprobado (2026-11-27)

**V.5.A.3 La mera tenencia y V.5.A.4 Transmisibilidad, agregación e
interversión, p. 208-214.** Informe en `Informes/Informe_Bienes_tramo13a.html`.
Hallazgos: Boetsch copia a PEÑAILILLO (nº 174 a 183) en agregación e
interversión (52 de 106 oraciones); se salta el nº 180 entero (disolución
del título y otros casos discutidos de agregación) y el fundamento de
"disociar" y la exclusión del ladrón (nº 179). A.3 repite la definición de
V.5.A.1.5 (11a). Citas: plazo mínimo de las acciones posesorias es el art.
918 (no 920 inc. 4º); art. 2494 es renuncia de prescripción cumplida.
Paráfrasis: 51 de 62 sobre 70%. Fuentes: discusiones nº 6 (ALESSANDRI,
SOMARRIVA), VIAL (el reconocimiento de dominio ajeno está en el título),
SAVIGNY (en Roma no pasaba al heredero la posesión; constituto en Paulo).

**Decisiones de Laura (2026-11-27):** 1 ok (A.3.1 no repite el art.
714, remite a V.5.A.1.5); 2 sí (nuevo 2.3); 3 las tres más "¿Muda la
mera tenencia en posesión por el solo transcurso del tiempo?" (la primera
quedó como "¿Qué es la mera tenencia y cuáles son sus características?"
para no pisarse); 4 sin material propio.

**Preocupación de Laura (2026-11-27): que no se resuma la materia.** Se
midió: 11b pasó de 2.298 a 6.203 palabras y el 12 de 1.125 a 4.147
(Boetsch, unas 2.400). **Regla desde el 13a:** cada concepto que pueda
prestarse a duda lleva su ejemplo breve en cursiva, además de las cajas
para casos de varios pasos. Laura: "los ejemplos son una muy buena forma
de volver a explicar sin explicar directamente".

Lo que se hizo: A.3 reescrito (remite al 714; VIAL: el reconocimiento
está en el título; PEÑAILILLO: casos dudosos, contactos que no son
tenencia, efectos dispersos arts. 896, 928, 1930, 2315); A.3.3 en
escalera 3.1/3.2 (ids nuevos `cV-5-A-3-3-1` y `cV-5-A-3-3-2`) con art.
716 en `.ley`; dos preguntas clásicas de mera tenencia; A.4.1 con art.
717 en `.ley`, VIAL, SAVIGNY, PEÑAILILLO (derecho a poseer, códigos del
siglo XX), las tres lecturas del 919 en (i)-(iii), SOMARRIVA y
ALESSANDRI según la recopilación, art. 683 y 725; No confundir
"Transmitir la posesión no es lo mismo que agregarla"; pregunta clásica
de transmisión; A.4.2 con arts. 918 y 920 inc. 4º precisados, disociar
con su fundamento, el ladrón no agrega, caja "La carreta de Chonchi";
nuevo 2.3 "Casos discutidos de agregación" (id `cV-5-A-4-2-3`):
disolución del título, reivindicante, petición de herencia, repudiación,
art. 718; pregunta clásica de agregación; A.4.3 con 3.2 en a)/b),
PESCIO y BOETSCH, SAVIGNY (Paulo) en el constituto, art. 2494
precisado; Conexiones (Sucesorio, Contratos con `[FALTA: sección]`; AJ
IV.B.4). Ejemplos breves: Leoncio (arrendatario), garzón e invitado,
Melania (usufructuaria), Sinforoso y Ruperta (heredera), el bote de
cuatro poseedores, Fidelina y Zenobia (lancha), Telésforo, Eulogia y
Marcelino (nulidad), Eleodoro y Brígida (art. 730), Arsenio
(constituto). Verificación: cero guiones largos, ids únicos, `href`
resuelven, etiquetas balanceadas, paráfrasis 10 de 164 sobre 70% contra
Boetsch (títulos, citas y frases cortas) y 6 contra Peñailillo, 4.027
palabras (antes unas 1.400), capturas revisadas, vista previa
actualizada. Respaldo en el tmp del job (`05_Bienes_antes_13a.html`).

## Tramo 13b: hecho y aprobado (2026-11-27), commit `85f2dd4`

**V.5.A.5.1 a A.5.3 (observaciones generales, principio básico y
muebles), p. 214-218.** Informe en `Informes/Informe_Bienes_tramo13b.html`.
Hallazgos: título de A.5 decía "de bienes muebles" (corregido también en
el índice); art. 1446 por 1448; art. 721 "en lugar o a nombre"; art. 723
"derechos" de poseedores; art. 608 inc. 2º es de domesticados; marcado
roto en 3.3 b) y c); Boetsch copia a PEÑAILILLO (nº 184 a 188) en 40 de
63 oraciones y se salta el nº 187 (cosas incorporales) y el cotejo de los
arts. 726 y 730. Paráfrasis del texto anterior: 44 de 51 sobre 70%.

**Decisiones de Laura (2026-11-27): "todo ok", sin material propio.**
Lo que se hizo: arts. 720, 721, 723, 725, 726, 727 y 731 en `.ley` con
negritas; 1.1 con la lectura literal del 723 (impúber mayor de siete y
sordo del art. 1447 no excluidos; sin atribuir a autor), SAVIGNY (el que
duerme, "cosa de hecho"); pregunta clásica del 11a conservada y ampliada;
1.2 en escalera (i)-(iii) con SAVIGNY y pregunta clásica nueva; 2 en
(i)/(ii) con las cosas incorporales de PEÑAILILLO en a)-d); 3.1 con
BOETSCH (703 y 684); 3.2 con PEÑAILILLO, POTHIER, SAVIGNY, BOETSCH (730,
1815) y VIAL (731), enlace a V.5.A.4.3.2; caja "La guitarra de
Curacautín"; 3.3 a)-c) con la contradicción BOETSCH/PEÑAILILLO vs VIAL
(art. 2502 Nº 1) expuesta sin tomar partido; No confundir "Apoderarse de
la cosa no es lo mismo que usurparla"; pregunta clásica de conservación y
pérdida; Conexiones (AJ II.B.2.2, V.6.3 y V.8; Contratos con
`[FALTA: sección]`). Breves: Benigno, la guagua, la junta de vecinos,
Crisóstomo, Clemira, usufructo de auto y de casa, el canal del vecino,
Teobaldo, Eufrasia, el sillón, Clarisa, Sofanor, Rosaura. Verificación:
cero guiones largos, ids únicos, `href` resuelven, etiquetas balanceadas,
párrafos bajo 1.100, paráfrasis 8 de 204 sobre 70% contra Boetsch y 5
contra Peñailillo (títulos y frases cortas atribuidas), 4.037 palabras
(antes unas 1.400), capturas revisadas, vista previa actualizada.
Respaldo en el tmp del job (`05_Bienes_antes_13b.html`).

## Tramo 13c: hecho y aprobado (2026-11-27)

**V.5.A.5.4.1 Aspectos generales de la posesión de inmuebles (Mensaje,
diferencias con los muebles, problemas, doctrinas, jurisprudencia y plan
de estudio), p. 218-228.** Informe en `Informes/Informe_Bienes_tramo13c.html`.
Hallazgos: errata de Boetsch en la doctrina de ÁLVAREZ ("posesión regular
que habilita para la prescripción extraordinaria": es ordinaria) y "2310"
por 2510 (ya corregida en el manual); art. 686 inc. 2º no alude a "todos
los derechos reales" sino que los enumera; falta la parte final del art.
696; falta la lectura del art. 2505 de la doctrina intermedia; las cinco
citas del Mensaje ya están en V.4.D.2.1. Boetsch copia a PEÑAILILLO (nº
189 y 195) en 16 de 144 oraciones. Paráfrasis del texto actual: 24 de 63
sobre 70%. **Atribuciones dudosas:** ALESSANDRI, URRUTIA, CLARO SOLAR y
las etiquetas ficción/garantía vienen del anexo de 3 páginas; las
discusiones nº 10 ponen a CLARO SOLAR del lado contrario a ÁLVAREZ en el
art. 2505; PEÑAILILLO define "inscripción-garantía" de otro modo. Lombardo
agrega una cuarta postura (relación aparente entre las inscripciones).

**Decisiones pedidas a Laura (8):** autores de cada doctrina; cuatro
posturas; cuadro en vez del Dato de grado y si se aplica ya el estilo
nuevo de rótulos a la hoja de Bienes; Mensaje con enlace a V.4.D.2.1;
VIAL y el art. 724 en una línea; el art. 2505 en breve aquí y completo en
prescripción; tres preguntas clásicas; material propio.

**Decisiones de Laura (2026-11-27): "el resto todo ok"**, y agregó dos
fuentes nuevas: `Apuntes/CIVIL/Bienes/Sentencias/de-los-bienes-y-de-su-dominio-posesin-uso-y-goce-revista-chi-2.pdf`
(BARCIA, comentario de jurisprudencia, RChDP Nº 23, 2014) y
`Apuntes/CIVIL/Bienes/Apuntes/teora-de-los-bienes-derecho-civil-en-3600-preguntas-y-respue_es.pdf`
(libro de preguntas y respuestas de examen, nº 585 en adelante; útil para
preguntas clásicas, pero con errores: cita el art. 2502 por el 2505 en la
nº 831, "resciliación = anulación" en la nº 832, y dice que el Conservador
"estudia la legalidad" de los títulos en la nº 757). **BARCIA resolvió la
atribución:** según ALESSANDRI, SOMARRIVA y VODANOVIC (2009, Nº 848)
aplican el art. 2505 a las dos prescripciones FABRES, AGUIRRE, CLARO
SOLAR y BARROS ERRÁZURIZ; ALESSANDRI y SOMARRIVA (1941): "la inscripción
es la posesión". Con eso, CLARO SOLAR queda del lado contrario a ÁLVAREZ;
el resumen anónimo que lo pone en la inscripción-garantía se menciona
como tal. URRUTIA sigue sin verificar en el original.

Lo que se hizo: intro con la definición de posesión inscrita de VIAL;
(i) resumen del plan de BELLO con enlace a V.4.D.2.1 y solo las dos
frases clave del Mensaje; art. 696 en `.ley` con su parte final; los tres
incentivos en a)-c) con arts. 728, 729, 924 y 2505 en `.ley`; (ii) y (iii)
atribuidos a PEÑAILILLO (concepto "difuminado"); (iv) con los preceptos de
PEÑAILILLO nº 192, inmuebles por destinación, las dos concepciones de
fondo (ficción y garantía) y **cuatro posturas en a)-d)**, ordenadas de
más a menos peso de la inscripción: clásica (a.1-a.3 con art. 724 en
`.ley`, 702 inc. final, 40-50 años, PEÑAILILLO nº 195 bis), relación
aparente (VIAL frente a PEÑAILILLO), requisito adicional (c.1-c.3, con el
2505 que "choque violentamente"), solo para la regular (ÁLVAREZ, debate del
2505 con autores, DE LA MAZA, críticas d.1-d.4 con VIAL); cuadro de 4
posturas x 6 criterios; caja "La parcela de Pichidangui"; No confundir
art. 729 vs 728 inc. 2º; (v) PEÑAILILLO, recopilación nº 9 y BARCIA sin
decir cuál es mayoritaria, cinco fallos RDJ contados, caja Jurisprudencia
con CS roles 7.769-2014 y 9.300-2012 (comentados por BARCIA); (vi) con
ejemplo; tres preguntas clásicas; Conexiones (Contratos, `[FALTA:
sección]`). **Hoja de estilos de Bienes:** aplicado el rótulo nuevo de
cuadros (20%, mayúscula, fondo y filete); el cuadro de V.5.A.1.9 (créditos)
lleva la clase `sin-rotulo` porque su primera columna es contenido.
Verificación: cero guiones largos, ids únicos, `href` resuelven, etiquetas
balanceadas, párrafos bajo 1.100, paráfrasis 17 de 287 sobre 70% contra
Boetsch y 15 contra Peñailillo (citas del Mensaje, títulos y frases
atribuidas), 5.878 palabras (antes 1.906; Boetsch unas 4.400), capturas
revisadas, vista previa actualizada. Respaldo en el tmp del job
(`05_Bienes_antes_13c.html`).

**Pendientes que salen de aquí:** BARCIA sobre la reivindicatoria contra
el mero tenedor y el cambio de ALESSANDRI y SOMARRIVA entre ediciones
(1941 frente a 2009, con VODANOVIC) van al 20a (VII.2); la pregunta nº 831
del libro ("¿se requiere inscripción para la posesión irregular de un
inmueble inscrito con título traslaticio?") y las nº 803-804 (título
injusto) como preguntas clásicas candidatas del 14b; el debate completo
del art. 2505 a la prescripción (15-16).

## Tramo 14a: hecho y aprobado (2026-11-28)

**V.5.A.5.4.2 Inmuebles no inscritos, p. 228-235.** Informe en
`Informes/Informe_Bienes_tramo14a.html`. Hallazgos: la postura propia de
BOETSCH en la tradición ("a cuya postura adherimos") es la de VIAL, con sus
mismos argumentos; el manual dice "el propio apunte". Boetsch copia a
PEÑAILILLO nº 190-191 (35 de 108 oraciones). Errata: "inmueble inscrito"
por "no inscrito" al final de a.2). a.4) afirma que la posesión viciosa es
"inútil", contra lo decidido en el 12. Faltan: fallo RDJ t. 26 (art. 590,
dominio sin posesión), argumento del Mensaje en a.3), la opinión que exige
inscripción, los argumentos de los arts. 729 y 730 en e.1), el argumento
(5) de e.2), heredero putativo (VIAL, BOZZO e IBARRA), pérdida e) completa
(título de tercero inscrito, papel) y el cotejo 729/730. DE LA MAZA según
BARCIA. Marcado roto en a) a d). Paráfrasis 13 de 28. 848 palabras.

**Decisiones pedidas a Laura (6):** atribuir a VIAL; posesión viciosa
"inútil" solo para quienes lo sostienen; DE LA MAZA; cuadro de las tres
posturas sobre la tradición; dos preguntas clásicas (una del libro, nº
829); material propio.

**Decisiones de Laura (2026-11-28): "todo sí", sin material propio.**
Ese mismo día notó que 13b y 13c no estaban marcados en Airtable: se
marcaron Hecho y se renombraron 13a, 13b, 13c, 14a y 14b con el reparto
real (el 14c de Airtable, "Posesión inscrita 3/3 + A.6", quedó sobrante:
su contenido es parte del 14b; marcarlo Hecho junto con el 14b, como se
hizo con el 11c).

Lo que se hizo: intro; (i) a) con PEÑAILILLO (ocupación = apoderamiento),
a.1) art. 590 en `.ley` y fallo RDJ t. 26; a.2) con VIAL (728 a contrario)
y la tesis aislada de PEÑAILILLO; a.3) con el argumento del Mensaje, la
opinión que exige inscripción y la mala fe por los arts. 590 y 8; a.4) con
VIAL y la utilidad de la viciosa como discutida (enlace a V.5.A.2.4.2);
b) accesión con PEÑAILILLO y VIAL (arts. 649, 652, 655, 656); c) con la
opinión del efecto retroactivo; d) art. 722 en `.ley`, art. 688 por
enlace, heredero putativo (VIAL; arts. 1264, 1269, 2512); e) e.1 FABRES y
DE LA MAZA (BARCIA) con los argumentos de los arts. 729 y 730 y BOZZO e
IBARRA; e.2 VIAL con BOETSCH, cinco argumentos y el art. 730; art. 693
(V.4.D.2.3.7); cuadro de tres posturas; caja "El sitio de Curanilahue";
(ii) a)-e) con arts. 920 y 731, 2510 regla 3ª (V.5.A.3.3), e) inscripción
de un tercero (papel, RDJ t. 67); cotejo 729/730 con enlace a 3.3; dos
preguntas clásicas; Conexiones (Sucesorio). Verificación: cero guiones
largos, ids únicos, `href` resuelven, etiquetas balanceadas, párrafos
bajo 1.100, paráfrasis 9 de 190 sobre 70% contra Boetsch y 6 contra
Peñailillo (citas y oraciones cortas; se reescribieron tres), 3.594
palabras (antes 848), capturas revisadas, vista previa actualizada.
Respaldo en el tmp del job (`05_Bienes_antes_14a.html`).

## Tramo 14b: hecho y aprobado (2026-11-28)

**V.5.A.5.4.3 Inmuebles inscritos y V.5.A.6 Prueba de la posesión, p.
235-245.** Informe en `Informes/Informe_Bienes_tramo14b.html`. Hallazgos:
art. 730 inc. 2º mal citado ("a nombre de otro"; el Código dice "de un
poseedor inscrito") y sin transcribir en todo el manual; art. 1567 inc.
1º no define la resciliación (dice "darla por nula"); art. 14 RCBR no es
rechazo definitivo; erratas de Boetsch p. 236 ("prescripción" por
posesión, "mueble" por inmueble); caso (i) de VIAL del art. 925 se
precisa con el art. 696 parte final. Boetsch copia a PEÑAILILLO (nº
192-194 y 196) en 34 de 159 oraciones y a VIAL (p. 69-78) en 29; sus
opiniones sin autor son de VIAL. Paráfrasis del texto anterior: 50 de 84
sobre 70%. Libro de 3600 preguntas con errores (nº 830 prescripción como
título sin inscripción; nº 831 2502 por 2505; nº 832 resciliación =
anulación). PEÑAILILLO nº 278 (prueba de inmuebles) no está en el
material. **Laura (2026-11-28): de Peñailillo, no usar solo la prueba de
la posesión de inmuebles (nº 278)**; lo demás de Peñailillo sí se usa.

**Decisiones de Laura (2026-11-28): "todo sí, sin material propio".**
Atribuir a VIAL; TRUCCO y BAHAMONDES y MONTERO "según recoge la
recopilación" (nº 8); orden de Boetsch en (ii) (b.1/b.2/b.3 y decreto
judicial como c)); "Tradición" como e) con e.1/e.2; e.2) sin repetir el
14a (enlace) y con lo propio de los inscritos; las tres contradicciones
sobre la jurisprudencia expuestas sin tomar partido; Dato de grado
retirado; debate de los arts. 924 y 925 completo en A.6.2; dos cuadros;
tres preguntas clásicas.

Lo que se hizo: (i) intro con PEÑAILILLO; a) ocupación con el argumento
de la "dilatada redacción" del 724, la concepción realista, VIAL y
BOETSCH (art. 728 inc. 2º por enlace), breve de Bartolo (Licantén); b)
accesión con VIAL, breve de Ercilia (Teno); c) con la opinión contraria
por enlace al 14a; d) con enlace al heredero putativo, breve de Anatolia
y Toribio (Quellón); e.1) y e.2) con FABRES solo, DE LA MAZA (BARCIA),
"la mayoría" (BARCIA) y "buena parte" (BOETSCH), artículos de cada lado
y argumento de sentido de PEÑAILILLO, breve de Jacinta y Godofredo
(Collipulli). (ii) intro con enlace a V.4.D.2.3.11; a) resciliación con
el texto real del 1567 y enlace al ejemplo del 9c, transacción (art.
2446) con breve de Dorila y Melquíades (Yumbel); b.1) cancelación
virtual (art. 692 por enlace), art. 92 RCBR, breve de Clarita y
Natividad (Ancud); b.2) art. 14 corregido, lectura literal, razones de
PEÑAILILLO (728, 2505, 730) y del libro (2510 regla 1ª), criterio de la
apariencia con breve de Tegualda, estado de la jurisprudencia según
cada fuente, posesión de papel con las dos corrientes de VIAL, su
criterio (art. 2502 Nº 1) y el art. 683 en inmuebles (enlace a V.4.C.3);
No confundir "Tener la posesión inscrita no es lo mismo que estar en
camino de prescribir" (Rosalindo, Lonquimay); b.3) art. 730 en `.ley`
con negritas, primera controversia (VIAL), tres doctrinas (i)-(iii) con
arts. 1818/1819 y 2505/2513/683 de PEÑAILILLO, críticas de VIAL, caso
general imposible y responsabilidad del Conservador, situaciones a) y
b), "permanece en discusión"; cuadro de las tres doctrinas; caja "El
fundo de Pelarco" (Maclovia, Nicasio, Gumersinda, Clotario); c) decreto
judicial con RDJ t. 47, emplazamiento y paralelas, breve de Ramona y
Feliciano (Molina); preguntas clásicas "¿Cómo se cancela la posesión
inscrita?" y "¿Qué es la competente inscripción del art. 730 inc. 2º?";
Conexiones (Obligaciones 1567 y 2446, Contratos 1815/1818/1819, con
`[FALTA: sección]`). A.6: intro con art. 700 inc. 2º; 1.1 a 1.3 nuevos
(ids `cV-5-A-6-1-1` a `-1-3`): medios (1698, 341 CPC), corpus y animus
con VIAL (acción publiciana) y vehículos (enlace a V.4.D.1.9), art. 719
en `.ley`, art. 731 por enlace; 2. art. 925 en `.ley`, (i) TRUCCO, (ii)
BAHAMONDES y MONTERO (art. 916), (iii) VIAL con a)-c) (art. 696 y 698) y
su lectura del 925; cuadro de las tres lecturas; pregunta clásica "¿Cómo
se prueba la posesión de un inmueble?"; Conexiones (Procesal). Nombres
de ejemplos revisados contra el manual. Verificación: cero guiones
largos, ids únicos, `href` resuelven, etiquetas balanceadas, párrafo más
largo 1.074, paráfrasis 13 de 364 sobre 70% contra Boetsch, 7 contra
Peñailillo y 6 contra VIAL (títulos, artículos y frases atribuidas),
unas 6.900 palabras (antes 2.540; Boetsch 4.300), capturas revisadas,
vista previa actualizada. Respaldo en el tmp del job
(`05_Bienes_antes_14b.html`).

**Pendiente que sale de aquí:** en el tramo 20c, ordenar VII.3.A.5
"Prueba de la posesión" con A.6.2 para no repetir el debate de los arts.
924 y 925, **sin borrar** lo que A.6.2 no tiene: los arts. 700, 715 y
916 tras BAHAMONDES y MONTERO, la excepción "cuando ninguna de las
partes tiene inscrito el predio", los arts. 686, 724, 728 y 729 como
apoyo y "la jurisprudencia se ha inclinado mayoritariamente" (moverlo a
A.6.2 o mantenerlo allí, según Boetsch p. 374-382).

**Ajustes tras la revisión final (2026-11-28):** A.6.2 (iii) y el cuadro
atribuyen la lectura solo a VIAL (Boetsch la expone, no la hace suya);
las excepciones de la lectura de TRUCCO van como "según quienes la
aceptan con modificaciones"; e.2) remite también a ÁLVAREZ (4.1 (iv) d)),
que admite poseer sin inscripción; motosierra de Policarpo (Peumo).

## Siguiente paso exacto (2026-11-28, vigente)

1. Tramo 13b aprobado (2026-11-27, "sigamos con el tramo 13c").
2. Tramo 14a aprobado (2026-11-28) y marcado Hecho en Airtable.
   Tramo 14b aprobado (2026-11-28) y marcado Hecho en Airtable (también
   el 14c sobrante). **Tramo 15a (B.1 a B.4, p. 246-253): informe
   aprobado ("todo sí, sin material propio") y tramo redactado
   (2026-11-28), aprobado por Laura ("ok haz el commit").** Marcado
   Hecho en Airtable; renombrados 15b (B.5 intro, 5.1 y 5.2, p. 253-258) y 15c (5.3, p. 258-264).
   Lo hecho: art. 2492 en `.ley`; B.1 con PEÑAILILLO (actividad del
   poseedor, otros códigos, tratamiento unificado); B.2 sin "Dato de
   grado" (LAURENT en el texto), críticas morales, VIAL, fundamentos
   subjetivos (i) y objetivos (ii) con breve de Albina y Ubaldo
   (Paredones), conflicto constitucional (art. 19 Nº 24 y 26, enlace a
   III.3 y V.4.D.2.3.14); B.3 con derivativo, derechos reales de quien no
   es dueño (Exequiel y Jesusa, Pelluhue), derechos personales y VIAL
   (enlace a A.1.9), universalidades de hecho (Cupertino y Margarita);
   B.4.1 en (i)-(iv) con arts. 441 y 442 CPC (texto Ley 21.394),
   caducidad, fallos, cuatro posturas a)-d) con autores y cuadro, caja
   B.4.2 en
   (i)-(v) con art. 2494 en `.ley`, dos caminos de nulidad, crítica y
   caso de PEÑAILILLO (Casimira y Malaquías), No confundir "no alegar no
   es renunciar", curadora (Ismenia y Delfina, art. 393); B.4.3 con art.
   2497 en `.ley`, acción rescisoria (Heriberto, Ránquil); dos preguntas
   clásicas; caja "El bote de Cobquecura" (Rigoberta y Celestino);
   Conexiones. Verificación: cero guiones largos, ids únicos, `href`
   resuelven, etiquetas balanceadas, párrafo más largo 955, paráfrasis
   15 de 249 sobre 70% contra Boetsch y 12 contra Peñailillo (títulos,
   citas y referencias; se reescribieron tres), unas 5.000 palabras
   (antes 1.500; Boetsch 3.000). Respaldo `05_Bienes_antes_15a.html`.
   **Pendiente para el 16b (B.6, art. 2505):** sentencia CS rol
   28.754-2021 (12-07-2022, "Sánchez con Vega"), fuente nueva de Laura en
   `Apuntes/CIVIL/Bienes/Sentencias/`: la promitente compradora que ocupa
   un inmueble inscrito sin inscripción a su favor es mera tenedora y no
   prescribe contra el título inscrito (arts. 686, 696, 724, 728, 730
   inc. 2º, 924 y 2505); se alegó por demanda reconvencional. Laura
   decidió (2026-11-28) no usarla en el 15a.
   (V.5.B.1-B.3 prescripción adquisitiva: nociones, fundamento,
   características, p. 246-253). Fuentes a revisar: Boetsch parte 15
   (`Bienes_principal_15_prescripción_elementos_boetsch (dragged).pdf`),
   PEÑAILILLO 2010 nº 197 en adelante (en el tmp del job,
   `pena2010.txt`), VIAL "La tradición y la prescripción" p. 79 en
   adelante (`vial.txt`), recopilación de discusiones nº 10 (art. 2505) y
   el libro de 3600 preguntas. De PEÑAILILLO no usar solo la prueba de la
   posesión de inmuebles (nº 278). Pendiente arrastrado para el 15-16: el
   debate completo del art. 2505 (ver "Tramo 13c").
3. ~~Pendiente de VIAL sobre el art. 703 y la tradición de quien no es
   dueño~~: resuelto en el 11b, V.5.A.2.2.2 (iii).
4. ~~Pendiente para el tramo 14: VIAL y el art. 683 en inmuebles; la
   pregunta clásica "¿Cómo se cancela la posesión inscrita?"~~: resueltos
   en el 14b.
5. Pendiente para el tramo 19: VI.4.6.2 Servidumbres legales sigue con
   el marcado antiguo (b.1 a b.7 en `h5`). Laura corrigió en vista previa
   (2026-11-23) que a) y b) iban en negrita y subrayado (`h4`): ya pasaron
   a negrita sin subrayado (`enum-i`), conservando a)/b). Al trabajar el
   tramo 19, ordenar todo el 6.2 según la escalera. Igual en VII (tramos
   20a-20c): quedan `h4` sin número ("Cosas susceptibles de
   reivindicarse", "Ser poseedor", etc.).
6. Pendiente para el tramo 16b: V.5.B.6 y V.5.B.8 contra el texto
   vigente del DL 2.695 (ver "Tramo 9c").
