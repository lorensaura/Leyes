# Estado: actualización de Acto Jurídico al método nuevo

> Se actualiza **in place** cada vez que Laura diga "guarda el estado
> [de Acto Jurídico / de AJ]" (o "actualiza Acto Jurídico"). No acumular
> una entrada nueva por sesión: corregir esta. Al decir "retoma Acto
> Jurídico" o "retoma AJ", leer este archivo completo primero y resumir
> en pocas líneas dónde quedó antes de seguir. Última actualización:
> 2026-10-08 (ejemplos propios de I y VI aplicados, índice del PDF arreglado y `app/pdf/Acto_Juridico.pdf` regenerado; con esto el manual queda terminado). Antes: 2026-10-07 (capítulos II y III terminados y en `main`; IV.F con VIAL y VI revisados y en `main`; I.8.6 unificado con II.E.2.1 en la rama `worktree-acto-juridico-I-8-6`, falta merge; queda la revisión final de ejemplos de I y VI).
>
> **El chequeo de paráfrasis cercana de todo Acto Jurídico terminó**
> (`guia-editorial.md` 3): capítulo I, capítulo IV completo (intro+A, B,
> C, D, E, F, G), V (La representación) y VI (Modalidades) ya están
> reescritos en voz propia donde hacía falta. Detalle de qué se
> encontró y qué se reescribió en cada bloque: ver las secciones "Qué
> se hizo en..." de este archivo, una por letra/capítulo, y los
> informes `docs/actualizacion_acto_juridico_cap4-<letra>_2026-10-05.md`
> (o `_IV-A`, `_IV-B1-B3`, `_IV-B4` para los tramos de septiembre).
>
> **`worktree-acto-juridico-cap4` ya se mergeó a `main`** (2026-10-05,
> `main` y `origin/main` quedaron en el commit `7675b08`, el mismo de
> esta rama). Al mergear apareció un conflicto que no tenía que ver con
> el contenido: un resto sin resolver del 1 de octubre, con 2 archivos
> marcados "deleted by us" (`AJ_vista_previa.html`,
> `.claude/settings.local.json`) y 3 informes HTML mal commiteados
> (`Informe_AJ_cap1.html`, `Informe_AJ_cap4-B.html`,
> `Informe_AJ_tramo4-8-9.html`) que nunca debieron versionarse. Se
> limpió desde la Terminal del checkout principal (`git rm --cached` +
> `git restore --staged`, sin tocar los archivos en disco) y el merge
> pasó sin problema. **Laura no revisó el contenido de VI línea por
> línea en esta sesión** (ver "Pendiente" más abajo), solo resolvió el
> conflicto de Git; el resto de los tramos (C-G, V) sí los había
> aprobado antes en vista previa.
>
> **Qué sigue (2026-10-06)**: capítulos II (Requisitos del AJ) y III
> (Efectos del AJ), en tandas chicas, en la rama
> **`worktree-acto-juridico-cap2-3`** (worktree `acto-juridico-cap4`).
> **Laura la mergeó a `main` el 2026-10-06** con todo hasta 5.2b
> (commit `08abcb5`); lo que venga después de eso queda de nuevo
> pendiente de merge. Con ese merge también llegó a `main` el cambio
> de Advertencia a No confundir en los manuales de **Responsabilidad**
> (HTML y PDF). Hechos
> y aprobados en vista previa: **5.1a**, **5.1b**, **5.1c**, **5.2a**, **5.2b** y **5.2c**. **5.2 se
> dividió** a pedido de Laura (el error es muy preguntado y quiere más
> detalle): 5.2a (A.4 + 5.1 + 5.2), 5.2b (clases de error de hecho, 5.3
> a 5.6) y 5.2c (dolo, fuerza, remisión). **5.2a reescrito** con VIAL,
> LEÓN HURTADO y un párrafo textual de Laura; Laura lo revisó en vista
> previa, pidió menos cajas (aplicado) y quedó **conforme**
> (2026-10-06).
>
> **5.2b reescrito y aprobado** por Laura en vista previa
> (2026-10-06, sin ajustes; commits `f952530` informe, `7d4abc8`
> reescritura, `1fd4fa8` verificación del art. 8 LMC). Detalle en "Qué
> se hizo en 5.2b" más abajo.
>
> **5.2c reescrito** (dolo, fuerza, remisión; commits `36a76c2`
> informe, `455ff24` reescritura). Laura aprobó el informe completo,
> pidió el cuadro comparativo error/dolo/fuerza y sacar la glosa
> hombre/mujer, entregó los arts. 280 C.P.C. y 22 Ley de Cheques, y
> respondió "ok" a la vista previa (2026-10-06, sin ajustes). Detalle
> en "Qué se hizo en 5.2c". **Con esto II.A (La voluntad) está
> completo.** Pendiente de merge a `main` desde `36a76c2`.
>
> **5.3 (La capacidad) y 5.4 (El objeto) terminados y en `main`.**
> 5.4 se mergeó el 2026-10-07 (commit `d4e0b86`); Laura lo mergeó
> después de la vista previa, sin pedir ajustes. Detalle en "Qué se
> hizo en 5.4".
>
> **Siguiente: 5.5** (D. La causa), manual desde `#cII-D` hasta antes
> de `#cII-E`. Fuentes: Boetsch `principal_6` y el anexo `Causa_
> DOMINGUEZ y BOETSCH.pdf`; revisar también Bozzo e Ibarra y Memorice
> (en 5.4 el anexo de Bozzo e Ibarra aportó bastante). Mismos pasos:
> extraer, inventario unidad por unidad, verificar artículos en
> `Apuntes/CODIGOS/`, chequeo de paráfrasis, informe para aprobación.
> En 5.4 Laura entregó por su cuenta páginas de VIAL y un fallo: al
> partir 5.5, preguntarle si tiene material de VIAL u otros sobre la
> causa.
>
> Fuentes ya entregadas (registro): **VIAL** pp. 77-104 y **FIGUEROA
> YÁÑEZ** pp. 63-75, en `Apuntes/CIVIL/Acto Jurídico/` del checkout
> principal, 42 pantallazos `Screenshot 2026-10-06 at ...` (1.14.15 pm a
> 1.15.23 pm = Vial pp. 77-89; 1.23.57 pm a 1.24.07 pm = Figueroa pp.
> 63-65; 2.31.09 pm a 2.34.29 pm = Vial pp. 89-104 y Figueroa pp. 66-75,
> en desorden). Los nombres de archivo traen un espacio especial antes
> de "pm": para leerlos, copiarlos primero con Python a nombres simples.
>
> Citas para informes: VIAL DEL RÍO, Víctor, *Teoría general del acto
> jurídico*, 2011; FIGUEROA YÁÑEZ, Gonzalo, *Curso de Derecho Civil*,
> t. II, 2012. En el manual van solo los apellidos.
>
> Los **casos para resolver** (estilo Figueroa) no van en los
> manuales: se harán aparte, después del lanzamiento (`camino-a-beta.md`).
> Ver "Pendientes de II". El Código de Comercio está en `Apuntes/CODIGOS/CÓDIGO DE COMERCIO.pdf`
> (checkout principal), para verificar sus artículos.

## Dónde estamos

Se está actualizando `04_Acto_Juridico_Manual.html` al método de
`actualizar-manuales-existentes.md`, **por tramos, con aprobación de
Laura en cada uno**.

| Tramo | Contenido | Informe | Rama / commit final | Estado |
|---|---|---|---|---|
| 1 (piloto) | Introducción cap. IV + IV.A La inexistencia | `docs/actualizacion_acto_juridico_IV-A_2026-09-29.md` | `caecee9` (+ `3ba6f9d`) | En `main` |
| 2 | IV.B.1 Aspectos generales, B.2 Nulidad absoluta, B.3 Nulidad relativa | `docs/actualizacion_acto_juridico_IV-B1-B3_2026-09-29.md` | `44c82b5` | En `main` |
| 3 | IV.B.4 Los efectos de la nulidad | `docs/actualizacion_acto_juridico_IV-B4_2026-09-30.md` | commit `481af70` | **Mergeada a `main`** |

`main` ya incluye el tramo 3 (`481af70`) y los dos commits de
documentación posteriores (`07b7956`, `31247f4`), además de los tramos
4.1 a 4.7 (ver tabla de abajo). El worktree activo para retomar el
tramo 4 es `worktree-acto-juridico-tramo4-5-otras-causales`.

### Qué se hizo en el tramo 3 (para no repetirlo si se retoma a medio camino)

- Inventario completo contra Boetsch (`principal_10` fin + `principal_11`
  entero) y el anexo Bozzo e Ibarra pp. 13-16 (solo la parte de
  conversión), más Memorice.
- Cambios aprobados por Laura ("dale con todo"):
  - Bloque `.ley` con el art. 1687 completo (con la frase clave en
    negrita).
  - Dos ejemplos propios con nombres chilenos, reemplazando los
    genéricos de la fuente (Felipe/la Coty; doña Marta/don Waldo/la
    señora Pilar).
  - `.definicion` de acción reivindicatoria movida a B.4.4 (donde tiene
    su propio subpunto), eliminada la duplicada de B.4.3.
  - Marco teórico "contacto social y deberes de lealtad" + cita textual
    de RODRÍGUEZ sobre la naturaleza de la responsabilidad por nulidad.
  - **La conversión (B.4.5) muy ampliada**: definición de Eduardo Court,
    primer cuadro comparativo del manual (conversión formal / material /
    legal), recuadro "No olvidar" con los dos requisitos de la
    conversión material, más ejemplos legales de conversión del Código
    (donaciones, fideicomisos, censos, etc.), todos verificados artículo
    por artículo contra el Código Civil.
  - Enumeración `(i)/(ii)/(iii)` en "Acciones a que da origen la
    nulidad" (antes eran tres párrafos con negrita suelta, sin
    `enum-i`).
  - Negritas y cursivas puntuales que pidió Laura después de leer el
    tramo (ver "Decisiones de formato" abajo).
- **Bug de tipografía encontrado y corregido**: la regla `table` de la
  hoja de estilos le daba a las celdas `td` la misma fuente sans-serif y
  tamaño menor que el encabezado `th`, en vez de la tipografía del texto
  principal. Corregido en este manual; **el mismo bug existe en
  Responsabilidad Civil (3 tablas) y en Bienes (2 tablas), sin corregir
  a propósito** (Laura decidió dejarlo para más adelante, ver
  "Pendientes sueltos"). Documentado en `proceso.md` 4.1 y
  `actualizar-manuales-existentes.md`.
- Razón de caracteres del tramo: pasó de 37,5% a 52,6%.

## Tramo 4: reparto en 9 sub-tramos (2026-09-30)

Laura pidió separar el tramo 4 en varios y evitar imprecisión. El
reparto se hizo por página real de Boetsch ("Página N de 221" que
imprime cada hoja), no por el conteo de cada PDF fragmentado (que se
solapan una página en cada empalme). Detalle completo del reparto y de
por qué en `docs/actualizacion_acto_juridico_tramo4-1_lesion_2026-09-30.md`,
sección 0.

| Sub-tramo | Institución | Páginas Boetsch (de 221) | Informe | Estado |
|---|---|---|---|---|
| **4.1** | IV.C La lesión | 151-160 | `docs/actualizacion_acto_juridico_tramo4-1_lesion_2026-09-30.md` | **Mergeado a `main`** |
| **4.2** | IV.D La simulación | 160-170 | `docs/actualizacion_acto_juridico_tramo4-2_simulacion_2026-09-30.md` | **Mergeado a `main`** |
| **4.3** | IV.E La inoponibilidad | 170-177 | `docs/actualizacion_acto_juridico_tramo4-3_inoponibilidad_2026-09-30.md` | **Mergeado a `main`** |
| **4.4** | IV.F El fraude a la ley | 177-186 | `docs/actualizacion_acto_juridico_tramo4-4_fraude_2026-09-30.md` | **Mergeado a `main`** |
| **4.5** | IV.G Otras causales (G.1-G.9) | 186-189 | `docs/actualizacion_acto_juridico_tramo4-5_otras-causales_2026-09-30.md` | **Mergeado a `main`**. G.7-G.9 (Terminación, Renuncia, Muerte) no están en Boetsch: vienen del anexo `INEFICACIA JURÍDICA_Cuadro comparativo.pdf` (Bozzo e Ibarra), ya confirmado |
| **4.6** | V.1-V.5 La representación (concepto a influencia de circunstancias personales) | 190-199 | `docs/actualizacion_acto_juridico_tramo4-6_representacion_2026-09-30.md` | **Mergeado a `main`**. Queda `[VERIFICAR: rol]` pendiente en la caja de jurisprudencia de V.4.4 |
| **4.7** | V.6-V.10 La representación (requisitos a otras hipótesis) | 200-208 | `docs/actualizacion_acto_juridico_tramo4-7_representacion2_2026-09-30.md` | **Mergeado a `main`**. Cierra el capítulo V completo |
| **4.8-4.9** | VI completo (Concepto, A. La condición, B. El plazo, C. El modo) | 209-221 | `docs/actualizacion_acto_juridico_tramo4-8-9_modalidades_2026-09-30.md` | **Mergeado a `main`** (commit de merge `ca9adc6`). Con esto, el tramo 4 (IV+V+VI) está completo en `main` |

### Qué se hizo en el tramo 4.8-4.9 (VI. Modalidades, completo)

- Fuente: Boetsch `principal_17`, "MODALIDADES DEL AJ" (pp. 209-221 de
  221, PDF distinto al `principal_16` de los tramos 4.5-4.7). Ningún
  anexo (secundario, cuadro comparativo, Memorice) aporta contenido
  nuevo a Modalidades: todos ya se habían usado por completo en tramos
  anteriores o no llegan a cubrir este capítulo.
- Igual que V.1-V.10, **VI tampoco venía de una reescritura de esta
  sesión**: ya estaba en el formato nuevo, primera vez que se audita
  contra Boetsch. A diferencia de varios tramos previos, **no tenía
  huecos grandes**: todos los ejemplos y reglas de Boetsch ya estaban.
  Razón de caracteres antes de tocarlo: 53,7%, ya en línea con los
  tramos cerrados.
- Los 28 artículos citados se verificaron contra el Código Civil: 26
  coinciden. Dos no, **ambos heredados del propio Boetsch, no
  introducidos por el manual**:
  - **Art. 1463 en el concepto de condición**: no corresponde (es
    sobre pacto de sucesión futura). Se corrigió a **art. 1473**
    ("Es obligación condicional la que depende de una condición..."),
    verificado como la definición correcta. Mismo criterio que la
    corrección del art. 1573→1578 del tramo 4.4.
  - **Art. 1094 en "Cumplimiento del modo"**: tampoco corresponde (es
    sobre el juez fijando plazo o forma del modo, no sobre la acción
    del beneficiado para exigir su cumplimiento). Se revisaron los
    arts. 1089-1098 completos sin encontrar el artículo correcto.
    **Se dejó la cita tal cual, sin reemplazo inventado**: queda
    pendiente (ver "Pendientes sueltos" abajo), igual que la
    inconsistencia de G.4 en el tramo 4.5.
  - Nota adicional: Boetsch transcribe mal el art. 1485 ("verificarse"
    en vez de "efectuarse" del texto vigente). La caja `.ley` agregada
    usa el texto correcto del Código, no el de Boetsch.
- Cambios aprobados por Laura ("Todo ok, apruebo todo", sin
  modificaciones al informe):
  - VI.1 (Concepto): agregada la razón concreta de por qué la
    solidaridad y la representación son modalidades.
  - VI.2 (Características): reformateado de prosa corrida a
    enumeración `a)/b)/c)` (`formato.md` lo exige para explicaciones de
    dos líneas o más; no era una mejora opcional).
  - VI.3 (Actos que admiten modalidades): agregada la razón de la
    regla general patrimonial ("puede hacerse todo lo que la ley no
    prohíbe") y el glosado de "actual" e "indisolublemente" del art.
    102.
  - VI.4 (Lugar en el Código): agregado el detalle de títulos y
    párrafos exactos, en párrafo propio (antes estaba fusionado con
    VI.3 en un solo párrafo).
  - A.2 (Clasificaciones): agregada la frase introductoria con los
    cuatro criterios, que faltaba.
  - A.2.3 (Suspensiva/resolutoria): agregada la reformulación
    doctrinal ("en otras palabras...").
  - A.2.4: agregada caja `.ley` con el art. 1477 completo.
  - A.3.1(i): agregadas cajas `.ley` con los arts. 1485 y 1492
    completos.
  - A.3.2(ii): completada la frase de la retroactividad ("las cosas
    vuelven al estado en que se hallaban...") y agregada caja `.ley`
    con el art. 1487 completo.
  - B.2 (Semejanzas y diferencias): reformateado a lista `(i)/(ii)/(iii)`
    para las semejanzas y **tabla comparativa nueva** (4 criterios)
    para las diferencias plazo/condición, siguiendo la regla de
    `formato.md` 4.1 para paralelos con 3 o más criterios.
  - B.3.2 (determinado/indeterminado): agregada la precisión de
    "dos cosas que se saben de antemano".
  - B.4.2 (efectos del plazo extintivo): agregado el ejemplo del
    arrendamiento que faltaba.
  - C.1 (Concepto del modo): agregado "al menos en general" al
    aforismo, y caja `.ley` con el art. 1089 completo.
  - C.3 (Cumplimiento del modo): agregada caja `.ley` con el art. 1090
    completo.
- **Segunda pasada, a pedido de Laura** (después de revisar el informe
  y la vista previa), sobre los dos puntos que habían quedado abiertos:
  - **Recuadro `.dato-grado` de A.2.4**: bajado a texto corrido (mismo
    criterio que el tramo 4.1), con un ejemplo propio nuevo (Bastián y
    la Fernanda) que contrasta la condición suspensiva puramente
    potestativa del deudor, nula, con la resolutoria puramente
    potestativa, válida.
  - **Art. 1094 en C.3**: Laura dio el texto vigente del artículo
    (coincide con el verificado contra el Código: el juez fija el
    tiempo o la forma del modo cuando el testador no lo determinó
    suficientemente, resguardando al asignatario modal un mínimo de un
    quinto del valor de la cosa). Como ese texto no respalda la frase
    sobre el derecho a exigir judicialmente el cumplimiento (que Boetsch
    le atribuía sin fundamento), se quitó esa cita y se agregó, como
    contenido nuevo, un párrafo sobre la regla real del art. 1094, con
    ejemplo propio (Camila y la casa) y caja `.ley`.
- Verificación mecánica hecha (dos veces, antes y después de la segunda
  pasada): balance de etiquetas OK (incluidas las de
  `table`/`tr`/`th`/`td`, nuevas en este tramo; el recuadro `.dato-grado`
  eliminado llevó el conteo de `div` a 0), cero guiones largos y
  guillemets, ningún párrafo sobre 1.200 caracteres, diff línea por
  línea revisado en ambas pasadas, capturas de Chrome headless
  revisadas bloque por bloque.
- No se tocó el índice: no se agregó ni cambió ningún `h2`/`h3` (la
  tabla y la reformulación de B.2 quedan dentro del mismo punto "2.").
- **Tercera pasada, corrección de criterio de Laura**: dijo que los
  ejemplos sin achilenizar debían corregirse en el mismo tramo, no en
  una pasada aparte ("como lo estábamos haciendo antes con las
  modificaciones que hice a actualización de manuales y redacción de
  manuales"). Se reescribieron los 6 ejemplos de VI que reutilizaban
  nombres y hechos de Boetsch casi textuales: el Cristóbal (casual), la
  Javiera (mixta), el tío Walter (condición resolutoria pendiente), el
  primo Gonzalo y la Antonia (condición resolutoria fallida), don
  Hernán (derecho a exigir cumplimiento del modo) y la sobrina
  Constanza (modo en beneficio exclusivo). No se tocó el ejemplo
  clásico de raíz romana de A.2.2 ("la estrella con la mano"): no tiene
  nombre propio y el manual ya lo presenta como cita histórica. **Con
  esto no queda ninguna decisión abierta**: el tramo 4.8-4.9 está
  completo.

### Qué se hizo en el tramo 4.7 (La representación, V.6-V.10)

- Cierra el capítulo V completo: era el último sub-tramo de "La
  representación". Igual que V.1-V.5, **V.6-V.10 tampoco venía de una
  reescritura de esta sesión**: ya estaba en el formato nuevo, primera
  vez que se audita unidad por unidad contra Boetsch.
- Inventario completo contra Boetsch `principal_16` (pp. 200-208, el
  final del PDF fragmentado y de todo el capítulo V; el capítulo VI
  arranca en otro PDF, `principal_17`, fuente del sub-tramo 4.8). Anexo
  secundario sin contenido de fondo, mismo resultado que en 4.6.
- Este fue el tramo con **menos huecos** de los tres de representación:
  la mayoría de las unidades ya estaban completas. La única falta real
  y completa era el párrafo introductorio de V.10 (principio de la
  relatividad de los contratos), que directamente no existía: el
  manual saltaba del título al primer subpunto.
- Los 10 artículos nuevos citados (1581, 2290, 2160, 2173, 2131, 2122,
  2154, 1449, 1450, 1694) se verificaron íntegros contra el Código
  Civil: los 10 coinciden.
- Cambios aprobados por Laura ("dale con todo"):
  - V.6.1: agregada la explicación de por qué importa la capacidad del
    representado en la convencional (nulidad del mandato si el
    mandante es incapaz).
  - V.6.3: agregada la razón de por qué la agencia oficiosa es un caso
    de representación legal.
  - V.8(ii): dividido en dos párrafos (mandante / terceros, siguiendo
    la propia estructura a)/b) de Boetsch) y completado el de terceros
    con la distinción entre el mandatario que informó sus poderes
    limitados y el que no, más la conexión con la promesa de hecho
    ajeno (art. 1450, que se trata en V.10.2 del mismo tramo).
  - V.9: dividido el primer párrafo en dos y agregados cuatro matices
    (capacidad sobrevenida del representado incapaz, segundo ejemplo
    de ratificación tácita, por qué puede ratificarse en cualquier
    momento, fundamento doctrinal de la irrevocabilidad).
  - V.10: agregado el párrafo introductorio completo que faltaba.
  - V.10.1 y V.10.2: agregadas cajas `.ley` con los arts. 1449 y 1450
    completos (Boetsch los cita textuales), sin quitar la paráfrasis ya
    existente.
- Verificación mecánica hecha: balance de etiquetas OK, cero guiones
  largos, ningún párrafo sobre 1.200 caracteres (dos que estaban cerca
  del límite, en V.8(ii) y V.9, se dividieron al crecer con los
  agregados), diff línea por línea (5 líneas eliminadas, las 5
  correspondientes a los párrafos divididos, nada ajeno), capturas de
  Chrome headless revisadas bloque por bloque.
- No se tocó el índice: no se agregó ni cambió ningún `h2`/`h3`.

### Qué se hizo en el tramo 4.6 (La representación, V.1-V.5)

- A diferencia de todos los tramos anteriores, **V.1-V.5 no venía de
  una reescritura de esta sesión**: ya estaba en el manual con el
  formato nuevo (`h1`/`h2`/`h3`, `span.art`, cajas `.callout` y
  `.jurisprudencia`), pero nunca se había auditado unidad por unidad
  contra Boetsch. Este fue el primer cruce.
- Inventario completo contra Boetsch `principal_16` (el mismo PDF de
  4.5, pp. 190-199 de 221; el punto 5.5 se extendió hasta media p.
  200 para incluirlo completo). El punto "V.6. Requisitos..." empieza
  justo después, en la p. 200: es la fuente del sub-tramo 4.7.
  Confirmado que el anexo secundario no aporta nada (no trata la
  representación como institución, solo tres menciones sueltas de la
  palabra).
- Los 11 artículos del Código Civil citados se verificaron íntegros:
  los 11 coinciden, salvo el art. 43, cuyo texto vigente (reforma Ley
  21.400, 2021) dice "uno o ambos progenitores" en vez de "el padre o
  la madre"; se actualizó la paráfrasis del manual a la fórmula
  vigente. El art. 659 que cita Boetsch es del Código de Procedimiento
  Civil (no del Código Civil, que tiene un art. 659 distinto, sobre
  accesión); el manual ya lo distinguía bien.
- Cambios aprobados por Laura ("dale con todo"):
  - V.1: agregada la segunda definición alternativa de Boetsch.
  - V.2: agregados los sordomudos como ejemplo de incapacidad absoluta
    y el procurador junto al abogado.
  - V.3.2 (i): agregado el párrafo sobre representación de origen
    judicial y la precisión de que los curadores dativos también son
    representantes legales (art. 43).
  - V.3.3: dividido el párrafo que excedía 1.200 caracteres en dos;
    agregada la definición de agencia oficiosa; completada la caja "No
    confundir" con la frase sobre quién es titular de los derechos
    frente a terceros.
  - V.4.4: enriquecida la caja de jurisprudencia (Corte Suprema, 9 de
    enero de 2017) con el pasaje donde la Corte descarta expresamente
    las tres teorías de V.4.1-4.3, dividido en dos párrafos para no
    exceder el máximo. **No se encontró el rol del fallo por búsqueda
    web**: a pedido de Laura, se dejó el marcador `[VERIFICAR: rol]`
    en el título de la caja, en vez de omitirlo en silencio.
  - V.5.1: agregada la razón de por qué el representado debe ser capaz
    en la voluntaria, y la consecuencia de nulidad para las
    obligaciones del mandatario incapaz sin autorización.
  - V.5.3: agregada la oración introductoria que contrasta las
    teorías, y convertidas las tres distinciones de VIAL a lista
    `enum-i lista` con `(i)/(ii)/(iii)` (formato de "lista de
    argumentos" de `decisiones.md`; se había propuesto por error un
    formato de letras `a)/b)/c)` en el informe, corregido antes de
    guardar).
  - V.5.4: agregada la oración introductoria con el ejemplo posesorio.
  - V.5.5: agregada la mención de la discusión doctrinal y
    jurisprudencial, y la extensión final a la causa u objeto ilícito.
- Verificación mecánica hecha: balance de etiquetas OK, cero guiones
  largos, ningún párrafo sobre 1.200 caracteres (se dividió también el
  párrafo de la jurisprudencia de V.4.4 al crecer con el agregado),
  diff línea por línea (11 líneas eliminadas, todas correspondientes a
  los 10 bloques del informe, nada ajeno), capturas de Chrome headless
  revisadas bloque por bloque.
- No se tocó el índice: no se agregó ni cambió ningún `h2`/`h3`.

### Qué se hizo en el tramo 4.5 (Otras causales de ineficacia)

- Esta rama se creó desde `worktree-acto-juridico-tramo4-4-fraude`
  (trae también 4.2 y 4.3, sin mergear). IV.G no fue tocado por
  ninguno de esos tres tramos.
- Inventario completo de IV.G contra Boetsch `principal_16` (pp.
  186-189; el PDF sigue hasta la p. 208 con "V. La representación",
  fuente del sub-tramo 4.6, que no se toca acá) y el anexo
  `INEFICACIA JURÍDICA_Cuadro comparativo.pdf` (Bozzo e Ibarra, 3
  páginas completas).
- A diferencia de todos los tramos anteriores, **este llegó
  mecánicamente impecable**: sin párrafos sobre 1.200 caracteres, sin
  guiones largos, etiquetas balanceadas, ya antes de tocarlo. El
  trabajo fue puramente de contenido.
- Confirmado: **Boetsch solo trata G.1-G.6** (suspensión, resolución,
  resciliación, revocación, desistimiento unilateral, caducidad).
  **G.7, G.8 y G.9 (terminación, renuncia, muerte) no están en
  Boetsch**: su única fuente es el anexo, ya confirmado en una sesión
  anterior.
- Los 9 artículos citados (1716, 1489, 1567, 2163, 1212, 1053, 1143,
  1490, 1491) se verificaron íntegros contra el Código Civil: los 9
  coinciden. El art. 2163 se cita tres veces (G.4, G.8, G.9) porque un
  solo artículo agrupa la revocación, la renuncia y la muerte como
  causales de término del mandato; verificado que es así.
- Cambios aprobados por Laura ("dale con todo"):
  - G.2 (resolución): agregada la falta de acción reivindicatoria
    contra terceros de buena fe (muebles, art. 1490) y la exigencia de
    publicidad de la condición para afectar a terceros (inmuebles,
    art. 1491), contenido del anexo que faltaba.
  - G.7 (terminación) y G.8 (renuncia): agregada en ambas, del anexo
    (única fuente de estas dos unidades), la oración sobre el momento
    en que la causal es oponible a terceros.
  - G.9 (muerte): agregados el matrimonio como ejemplo adicional de
    acto <em>intuito personae</em>, la sanción a la mala fe de quien
    perjudica a los herederos de la parte fallecida, y la distinción
    entre muerte natural y presunta para el efecto frente a terceros;
    los tres, del anexo.
  - **No se tocó G.4** (revocación): el anexo la asocia también al
    "fraude pauliano", pero eso contradice lo ya explicado en el
    tramo 4.4 (la sanción al fraude a los acreedores es inoponibilidad
    o nulidad, no revocación). Queda señalada la inconsistencia entre
    el anexo y Boetsch, sin resolver.
- Verificación mecánica hecha: balance de etiquetas OK, cero guiones
  largos, ningún párrafo sobre 1.200 caracteres, diff línea por línea
  (solo los 4 párrafos tocados, nada más), capturas de Chrome headless
  revisadas bloque por bloque.
- No se tocó el índice: no se agregó ni cambió ningún `h2`/`h3`.

### Qué se hizo en el tramo 4.4 (El fraude a la ley)

- Esta rama se creó desde `worktree-acto-juridico-tramo4-3-inoponibilidad`
  (no desde `origin/main`), para no arrastrar conflictos: trae también
  los cambios de 4.2 y 4.3, todavía sin mergear. IV.F no fue tocado por
  esos dos tramos, así que no hay contenido ajeno mezclado, solo evita
  el conflicto de merge.
- Inventario completo de IV.F contra Boetsch `principal_15` (pp.
  177-186) y el apartado "El fraude a la ley" del anexo Bozzo e Ibarra
  (pp. 25-26 del PDF del anexo).
- A diferencia de los tramos 4.1-4.3, acá **no faltaba contenido de
  fondo** de Boetsch: las seis unidades ya estaban completas y bien
  redactadas. El trabajo fue sobre todo de forma (dos párrafos sobre
  1.200 caracteres) más el contenido puntual que sí aporta el anexo.
- Los 15 artículos del Código Civil citados se verificaron íntegros
  contra el Código Civil: los 15 coinciden. Se encontró (y ya estaba
  corregido en el manual) un error de tipeo de la propia fuente:
  Boetsch cita "art. 1573 Nº 3" en la p. 185 cuando el artículo
  correcto es el 1578 Nº 3 (que él mismo cita bien en la p. 179). Sin
  jurisprudencia con rol en este tramo.
- Cambios aprobados por Laura ("dale con todo"):
  - Dos párrafos divididos por exceder 1.200 caracteres (ordenamiento
    jurídico nacional, y fraude a la ley vs. abuso del derecho), sin
    cambiar una palabra del contenido, y completando de paso la lista
    de artículos de la sección 2 con los arts. 1662 y 1792-24 que
    Boetsch enumera junto a los demás.
  - Enriquecido 4.1 (fraude a la ley y simulación) con una cita de
    VIAL DEL RÍO/FERRARA y tres diferencias de VODANOVIC entre ambas
    figuras, contenido del anexo que no estaba.
  - Caja `.definicion` nueva con la cita de ALCALDE en el Concepto (F.1
    no tenía ninguna).
  - Ejemplo propio nuevo (el Gastón y la Antonia, separación de bienes
    en fraude a los acreedores) para el requisito (ii) de F.3: no
    reemplaza ningún ejemplo de la fuente, Boetsch solo lo menciona en
    abstracto.
  - Caja de Conexiones nueva hacia Obligaciones (la acción pauliana,
    art. 2468), con `[FALTA: sección]` porque ese apunte no existe
    todavía.
- Verificación mecánica hecha: balance de etiquetas OK, cero guiones
  largos, ningún párrafo sobre 1.200 caracteres, capturas de Chrome
  headless revisadas bloque por bloque, diff línea por línea (solo 3
  líneas eliminadas, las tres correspondientes a párrafos que se
  dividieron sin perder contenido).
- No se tocó el índice: no se agregó ni cambió ningún `h2`/`h3`.

### Qué se hizo en el tramo 4.3 (La inoponibilidad)

- Esta rama se creó primero desde `origin/main` y se corrigió con
  `git merge --ff-only worktree-acto-juridico-tramo4-2-simulacion`
  antes de escribir el informe, porque IV.D (justo antes de IV.E) se
  reescribió por completo en el tramo 4.2, que todavía no está en
  `main`. Trabajar sobre la versión vieja de IV.D habría generado
  conflictos. Laura puede mergear 4.2 o 4.3 primero; si mergea 4.2
  primero, 4.3 se aplica limpio encima.
- Inventario completo de IV.E contra Boetsch `principal_14` (pp.
  170-177) y el apartado "g) La inoponibilidad" del anexo Bozzo e
  Ibarra (pp. 17-19 del PDF del anexo): el anexo sí aportó contenido de
  fondo (distinción de DUCCI, atribuciones de VODANOVIC y LÓPEZ SANTA
  MARÍA, un cuarto criterio de diferencia con la nulidad).
- Los 24 artículos del Código Civil citados se verificaron íntegros
  contra el Código Civil: los 24 coinciden. Sin jurisprudencia con rol
  en este tramo (Boetsch no cita ningún fallo en "La inoponibilidad").
- Cambios aprobados por Laura ("dale con todo"):
  - Corrección de un error de contenido en el Concepto: el manual decía
    que el tercero puede oponerse a efectos "favorables o
    desfavorables"; Boetsch dice "efectos que los perjudican". Se
    volvió a la fuente.
  - Concepto enriquecido con DUCCI (distinción entre efectos y realidad
    jurídica del acto), VODANOVIC (terceros interesados) y LÓPEZ SANTA
    MARÍA (excepciones de terceros absolutos).
  - El caso de las contraescrituras (art. 1707), que estaba comprimido
    en un solo párrafo de 1.446 caracteres con un paréntesis mal
    cerrado, se separó en una lista `enum-a` de seis casos (a-f), y se
    restauró una frase de Boetsch que faltaba ("entre las partes la
    contraescritura es perfectamente válida").
  - Dos cajas `.ley` nuevas: art. 1707 (primera vez que se transcribe
    completo en el manual, pese a citarse seis veces en IV.D) y art.
    246.
  - Un ejemplo propio nuevo (Bernarda, Nicolás y Tomás, cesión de
    crédito, arts. 1902 y 1905): no reemplaza ningún ejemplo de la
    fuente, Boetsch no trae ninguno para ese caso.
  - Precisión mercantil agregada al final de "falta de fecha cierta"
    (C. de Comercio, art. 127).
  - Precisión menor en la cita del art. 2058 (la nulidad recae en el
    contrato de sociedad, no perjudica las acciones de terceros contra
    cada socio, cuando la sociedad existió de hecho).
  - La sección "Diferencias entre la nulidad y la inoponibilidad" pasó
    de prosa a un cuadro comparativo de 4 criterios (el anexo agrega la
    declaración de oficio, que Boetsch no trae).
  - Dos cajas de Conexiones nuevas (Obligaciones, por la cesión de
    créditos; Sucesorio, por la acción de reforma de testamento),
    ambas con `[FALTA: sección]` porque esos apuntes no existen
    todavía.
  - Se dejó señalada (sin resolver) una inconsistencia propia de
    Boetsch: su párrafo introductorio de "inoponibilidades de fondo"
    no coincide con sus propias subsecciones. El manual no la
    arrastraba porque no reproduce esa enumeración.
- Verificación mecánica hecha: balance de etiquetas OK, cero guiones
  largos, ningún párrafo sobre 1.200 caracteres (el de 1.446
  caracteres que había se corrigió), capturas de Chrome headless
  revisadas bloque por bloque, diff línea por línea de lo eliminado
  revisado (coincide con lo propuesto en el informe).
- Razón de caracteres del tramo: pasó de 43,7% a 63,4%.

### Qué se hizo en el tramo 4.2 (La simulación)

- Inventario completo de IV.D contra Boetsch `principal_13` (pp.
  160-170): a diferencia de 4.1, acá el anexo Bozzo e Ibarra sí aportó
  contenido de fondo que Boetsch no trae (no solo redacción distinta).
- Los 11 artículos citados (10, 686, 1467, 1490, 1491, 1681, 1707, 1709,
  1768, 1796, 1876) se verificaron íntegros contra el Código Civil.
- Un fallo del anexo (Corte Suprema, 13 de enero de 2014, rol N°
  9.631-2012) se confirmó real por búsqueda web antes de usarlo en una
  caja de jurisprudencia.
- Cambios aprobados por Laura:
  - Definición de LEÓN pasada a caja `.definicion`.
  - Párrafo nuevo sobre por qué el acto con reserva mental es válido y
    el simulado es generalmente nulo (viene del anexo).
  - Dos frases menores: motivo del art. 686 en la simulación lícita, y
    "motivos inocentes o morales" de la lícita.
  - Requisitos de la simulación ilícita convertidos de prosa a lista
    `(i)-(iv)` (`enum-i lista`), con caja de jurisprudencia citando el
    rol verificado.
  - Dos ejemplos que reproducían los de Boetsch reemplazados por
    ejemplos propios (Rodrigo y su primo Cristóbal para la absoluta;
    Cristina, Ignacio y Josefina, con el art. 1796, para la relativa
    por sustitución de sujeto).
  - Cuadro comparativo de efectos (absoluta/relativa × entre las
    partes/frente a terceros de buena fe), del anexo.
  - Cita de Ferrara sobre la dificultad de la prueba directa + párrafo
    nuevo sobre la carga de la prueba y el art. 1709.
  - Punto nuevo 4.5, "La acción de simulación" (íntegro del anexo, no
    estaba ni en Boetsch ni en el manual).
- Verificación mecánica hecha: balance de etiquetas OK, cero guiones
  largos/guillemets, ningún párrafo sobre 1.200 caracteres, todas las
  frases clave presentes, diff línea por línea de lo eliminado revisado
  (coincide exactamente con lo propuesto en el informe).

### Qué se hizo en el tramo 4.1 (La lesión)

- Inventario completo de IV.C contra Boetsch `principal_12` (pp.
  151-160): **no faltaba contenido de fondo**, los cuatro puntos
  (concepto doctrinal, ¿es vicio del consentimiento?, los ocho casos
  regulados, sanción) ya estaban completos.
- Se revisó el anexo secundario Bozzo e Ibarra para Lesión: no aporta
  nada que Boetsch no traiga.
- Se verificaron los 23 artículos citados contra el Código Civil: los
  23 coinciden exactamente.
- Cambios de forma aplicados (aprobados por Laura):
  - La caja `.dato-grado` (clase retirada, ver `formato.md` sección 7)
    con la tesis de DUCCI se bajó a párrafo corrido.
  - El ejemplo de la hipoteca (caso viii) reproducía el mismo ejemplo
    de la fuente con las mismas cifras; se reemplazó por uno propio
    (doña Marta y el Banco Estado, mismo mecanismo del art. 2431).
  - Los tres criterios sobre la naturaleza de la lesión (subjetivo,
    objetivo, mixto), que estaban en prosa con negrita suelta, se
    convirtieron a `enum-i` `(i)/(ii)/(iii)`.
  - Se agregó una caja `.ley` para el art. 1889 (define la lesión
    enorme), con la frase clave en negrita.
- Verificación mecánica hecha: balance de etiquetas OK, cero guiones
  largos/guillemets, ningún párrafo sobre 1.200 caracteres, todas las
  frases clave del inventario presentes, diff línea por línea de lo
  eliminado revisado (coincide exactamente con lo acordado).

## Corrección de proceso: chequeo de paráfrasis cercana (2026-10-01)

Laura pidió revisar, tramo por tramo, que el manual no tenga
**paráfrasis cercana** de Boetsch sin atribución (`guia-editorial.md`
3, `actualizar-manuales-existentes.md` 2c): un chequeo que ya existía
como regla pero que no se había estado aplicando en ningún tramo de
este hilo. Criterio aplicado (precisado por Laura, registrado en
`decisiones.md` 2026-09-30):

- Si el párrafo reproduce la posición de un **autor con nombre** (VIAL,
  ROUBIER, BOETSCH, CLARO SOLAR, etc.), el arreglo es **atribuirlo con
  claridad**: cita textual entre comillas en bloque `.definicion`
  cuando se tiene el texto exacto, o reporte en voz propia pero
  siempre atribuido cuando solo se cuenta con una traducción o
  paráfrasis de tercero.
- Si es prosa de conexión de Boetsch, **sin autor nombrado**, el
  arreglo es **reestructurar de verdad**: otro orden de cláusulas,
  no solo cambiar sinónimos.

Se revisa capítulo por capítulo, en el orden en que se escribieron:

| Capítulo / tramo | Rama | Resultado | Estado |
|---|---|---|---|
| I. Teoría general (completo) | `worktree-acto-juridico-cap1` | Paráfrasis cercana en casi todo el capítulo (no se había auditado nunca). Reescrito completo en voz propia. | Pusheado, pendiente de merge |
| IV, intro + A. La inexistencia | `worktree-acto-juridico-cap4` | Tramo piloto, ya trabajado de cerca con Laura: solo 3 pasajes con paráfrasis cercana (el resto ya tenía citas atribuidas y cuadros genuinamente reestructurados). Corregidos los 3. | Pusheado (`5bacbcc`), pendiente de merge |
| IV.B.1 Aspectos generales | `worktree-acto-juridico-cap4` | Paráfrasis cercana generalizada (se escribió el día antes de nacer la regla). Reescrito. | Aprobado por Laura |
| IV.B.2 La nulidad absoluta | `worktree-acto-juridico-cap4` | Mismo problema. Reescrito; el inventario original (hecho de un tirón sobre B.1-B.4) no había detectado todo, ver nota de método abajo. | **Aprobado por Laura** (2026-10-05, con 4 ajustes de formato) |
| IV.B.3 La nulidad relativa | `worktree-acto-juridico-cap4` | Inventariado de nuevo contra Boetsch pp. 133-138; confirma y completa lo señalado en el informe original. Reescrito. | **Aprobado por Laura** (2026-10-05, con 5 ajustes de formato) |
| IV.B.4 Los efectos de la nulidad | `worktree-acto-juridico-cap4` | Inventariado de nuevo (tabla exhaustiva, checklist completo) contra Boetsch `principal_11` entero y el anexo. Reescrito completo, incluida la conversión (B.4.5), enriquecida con Alessandri, Coviello, Stolfi, Vial y un fallo de la CS aportados por Laura. | **Aprobado por Laura** en vista previa (2026-10-05) |
| IV.C La lesión | `worktree-acto-juridico-cap4` | Inventario exhaustivo (22 párrafos) contra Boetsch `principal_12` (pp. 151-160 de 221): 17 con paráfrasis cercana sin autor nombrado, reescritos; DUCCI y 4 más ya atribuidos/reestructurados, sin tocar. Informe `docs/actualizacion_acto_juridico_cap4-C_2026-10-05.md`, commit `bac36ac`. | **Aprobado por Laura** ("Revisado ok") |
| IV.D La simulación | `worktree-acto-juridico-cap4` | Inventario exhaustivo (33 párrafos) contra Boetsch `principal_13` (pp. 160-170) y el anexo Bozzo e Ibarra (4.4-4.5): 19 con paráfrasis cercana, reescritos; ALCALDE/JOSSERAND y la definición de la CS resueltos con comillas de cita atribuida. Informe `docs/actualizacion_acto_juridico_cap4-D_2026-10-05.md`, commit `4a07265`. | **Aprobado por Laura** ("Revisado ok") |
| IV.E La inoponibilidad | `worktree-acto-juridico-cap4` | Inventario exhaustivo (26 párrafos) contra Boetsch `principal_14` (pp. 170-177) y el anexo Bozzo e Ibarra: 15 con paráfrasis cercana, reescritos; DUCCI/VODANOVIC/LÓPEZ SANTA MARÍA ya atribuidos, sin tocar. Informe `docs/actualizacion_acto_juridico_cap4-E_2026-10-05.md`, commit `675fc50`. | **Aprobado por Laura** ("Revisado ok") |
| IV.F El fraude a la ley | `worktree-acto-juridico-cap4` | Inventario exhaustivo (24 párrafos) contra Boetsch `principal_15` (pp. 177-186) y el anexo Bozzo e Ibarra: 13 con paráfrasis cercana, reescritos; COVIELLO/LARENZ/VIAL/VIAL DEL RÍO/FERREIRA/DIEZ-PICAZO/BARROS resueltos con comillas de cita atribuida. Informe `docs/actualizacion_acto_juridico_cap4-F_2026-10-05.md`, commit `bab10ff`. | **Aprobado por Laura** (tras corregir negritas de autor, commit `024faa3`) |
| IV.G Otras causales | `worktree-acto-juridico-cap4` | Inventario exhaustivo (intro + G.1-G.9) contra Boetsch `principal_16` (pp. 186-189, solo cubre G.1-G.6) y el anexo "Cuadro comparativo" (G.7-G.9): 9 de 10 párrafos con paráfrasis cercana, reescritos. Informe `docs/actualizacion_acto_juridico_cap4-G_2026-10-05.md`, commit `0f40746`. Cierra el chequeo de paráfrasis de todo el capítulo IV. | **Aprobado por Laura** ("Todo ok") |
| V. La representación | `worktree-acto-juridico-cap4` | Inventario exhaustivo (38 párrafos) contra Boetsch `principal_16` (pp. 190-208): 36 con paráfrasis cercana, reescritos; VIAL/ALESSANDRI ya atribuidos; ejemplo de V.10.2 reemplazado por uno propio. Informe `docs/actualizacion_acto_juridico_cap4-V_2026-10-05.md`, commit `83912da`. | **Aprobado por Laura** ("Todo ok") |
| VI. Modalidades | `worktree-acto-juridico-cap4` | Inventario exhaustivo (48 párrafos) contra Boetsch `principal_17` (pp. 209-221): 40 con paráfrasis cercana, reescritos; la jurisprudencia de 2.4 resuelta con comillas de cita atribuida. Informe `docs/actualizacion_acto_juridico_cap4-VI_2026-10-05.md`. Cierra el chequeo de paráfrasis de todo Acto Jurídico. | Reescrito, falta commit/push y vista previa de Laura |

### Qué se hizo en IV.C La lesión (chequeo de paráfrasis cercana)

- Inventario exhaustivo de los 22 párrafos de prosa de C.1 a C.4 contra
  Boetsch `principal_12` (pp. 151-160 de 221), con tabla de veredicto
  unidad por unidad (no solo una muestra). El contenido de fondo ya se
  había verificado completo en el tramo 4.1 (2026-09-30): este chequeo
  es aparte y mide solo cercanía de redacción.
- **17 de 22 párrafos tenían paráfrasis cercana** de la prosa de
  conexión de Boetsch, sin autor nombrado (mismo orden de ideas, mismas
  frases clave, solo sinónimos cambiados): C.1 completo, C.2 casi
  completo, y la mayoría de las explicaciones de C.3 y C.4. Se
  reescribieron en voz propia, mismo contenido, mismos artículos,
  verificados después de la reescritura (ninguno se perdió).
- **5 unidades no se tocaron**: el párrafo que reporta la posición de
  DUCCI (ya atribuido con claridad, "DUCCI sostiene que..."), la
  primera frase de C.3(i) (compraventa), C.3(iv) Partición, C.3(v)
  Mutuo (estos tres ya condensados o parafraseando texto legal, no
  doctrina) y el ejemplo de doña Marta (ya propio).
- Verificación mecánica: balance de etiquetas OK, cero guiones
  largos/guillemets, ningún párrafo sobre 1.200 caracteres (el más
  largo, 921), los 24 artículos citados siguen presentes, capturas de
  Chrome headless revisadas bloque por bloque.
- No se tocó el índice: no se agregó ni cambió ningún `h2`/`h3`.
- Laura aprobó "dale con todo" directo sobre el informe (a diferencia
  de B.2-B.4, donde pidió ajustes después de ver la vista previa).
  Informe completo con la tabla de veredictos y las 17 reescrituras
  propuestas en `docs/actualizacion_acto_juridico_cap4-C_2026-10-05.md`.
  Commit `bac36ac`, pusheado a `origin/worktree-acto-juridico-cap4`.
  **Falta que Laura confirme la vista previa** (`AJ_vista_previa.html`,
  ancla `#cIV-C`) antes de darlo por cerrado igual que B.2 y B.3.

### Qué se hizo en IV.D La simulación (chequeo de paráfrasis cercana)

- Inventario exhaustivo de los 33 párrafos de prosa de D.1 a D.4.5,
  contra **dos** fuentes: Boetsch `principal_13` (pp. 160-170 de 221)
  y el anexo `Anexo_secundario_AJ_Ineficacia.pdf` (apartado de
  simulación, pp. 24-26 del anexo), porque D.4.4 (parte) y D.4.5
  completo vienen del anexo, no de Boetsch (ya lo decía el informe de
  contenido del tramo 4.2). El contenido de fondo ya se había
  verificado completo en ese tramo: este chequeo es aparte.
- **19 de 33 párrafos tenían paráfrasis cercana** sin autor nombrado:
  16 de Boetsch, 3 del anexo (la acción de simulación completa en
  4.5, y el párrafo de "doblemente protegidos" en 4.3). Se
  reescribieron en voz propia, mismo contenido, mismos artículos. Los
  ejemplos propios (Rodrigo/Cristóbal, Cristina/Ignacio/Josefina, ya
  achilenizados desde el tramo 4.2) no se tocaron, salvo la última
  frase de cada uno donde sí había paráfrasis cercana en la parte
  doctrinal que seguía.
- **Tres casos se resolvieron con atribución, no con reescritura**:
  el párrafo de ALCALDE/JOSSERAND (reproducía casi palabra por palabra
  la cita que Boetsch hace de ambos; se agregaron comillas en vez de
  parafrasear su posición), la definición de simulación ilícita de la
  Corte Suprema al inicio de 4.1 (se agregaron comillas a la
  definición literal del fallo), y la cita de Ferrara y el fallo de
  1918 en 4.4 (ya en comillas o quedaron en comillas).
- Verificación mecánica: balance de etiquetas OK (incluidas las de
  `table`/`tr`/`th`/`td`, sin cambios), cero guiones largos/guillemets,
  ningún párrafo sobre 1.200 caracteres (el más largo, 1.141), los 21
  artículos y referencias verificados siguen presentes, capturas de
  Chrome headless revisadas bloque por bloque.
- No se tocó el índice: no se agregó ni cambió ningún `h2`/`h3`.
- A diferencia de C. Lesión, Laura pidió seguir con D **mientras ella
  revisaba C en paralelo**, sin pausar a mostrarle el informe antes de
  aplicar los cambios. Informe completo con la tabla de veredictos en
  `docs/actualizacion_acto_juridico_cap4-D_2026-10-05.md`. Commit
  `4a07265`, pusheado a `origin/worktree-acto-juridico-cap4`. **Falta
  que Laura confirme la vista previa** (`AJ_vista_previa.html`, ancla
  `#cIV-D`), igual que con C.

### Qué se hizo en IV.E La inoponibilidad (chequeo de paráfrasis cercana)

- Inventario exhaustivo de los 26 párrafos de prosa de E.1 a E.5,
  contra Boetsch `principal_14` (pp. 170-177 de 221) y el anexo
  Bozzo e Ibarra (apartado "g) La inoponibilidad", pp. 18-19 del
  anexo), que es la fuente de las atribuciones a DUCCI, VODANOVIC y
  LÓPEZ SANTA MARÍA y del cuarto criterio del cuadro comparativo
  (declaración de oficio), ya incorporadas desde el tramo 4.3.
- **15 de 26 párrafos tenían paráfrasis cercana** sin autor nombrado y
  se reescribieron en voz propia, mismo contenido, mismos artículos.
  Las atribuciones a DUCCI, VODANOVIC y LÓPEZ SANTA MARÍA no se
  tocaron, por estar ya marcadas con el nombre del autor.
- Varios párrafos cortos que son, en esencia, una oración parafraseando
  directamente un artículo (cesión de crédito, prescripción,
  interdicción, patria potestad, cuidado personal) se dejaron sin
  tocar: no es prosa doctrinal de Boetsch, es la ley misma resumida,
  donde cualquier redacción alternativa dice lo mismo con las mismas
  palabras técnicas (mismo criterio aplicado al "Mutuo" de C. Lesión).
- El cuadro comparativo de E.5 ya estaba en tabla desde el tramo 4.3:
  la conversión de prosa a tabla ya es la reestructuración que pide la
  regla, no se tocó.
- Verificación mecánica: balance de etiquetas OK, cero guiones
  largos/guillemets, ningún párrafo sobre 1.200 caracteres (el más
  largo, 1.066), los 27 artículos y referencias verificados siguen
  presentes, capturas de Chrome headless revisadas bloque por bloque.
- No se tocó el índice: no se agregó ni cambió ningún `h2`/`h3`.
- Igual que con D, Laura pidió seguir sin pausar a mostrarle el
  informe antes de aplicar los cambios. Informe completo con la tabla
  de veredictos en `docs/actualizacion_acto_juridico_cap4-E_2026-10-05.md`.
  Commit `675fc50`, pusheado a `origin/worktree-acto-juridico-cap4`.
  **Falta que Laura confirme la vista previa** (`AJ_vista_previa.html`,
  ancla `#cIV-E`), junto con las de C y D.

### Qué se hizo en IV.F El fraude a la ley (chequeo de paráfrasis cercana)

- Inventario exhaustivo de los 24 párrafos de prosa de F.1 a F.5,
  contra Boetsch `principal_15` (pp. 177-186 de 221) y el anexo Bozzo e
  Ibarra (apartado de fraude a la ley, pp. 25-26 del anexo), fuente de
  la cita de VIAL DEL RÍO/FERRARA y de las tres diferencias de
  VODANOVIC con la simulación, ya incorporadas desde el tramo 4.4.
- **13 de 24 párrafos tenían paráfrasis cercana** sin autor nombrado y
  se reescribieron en voz propia, mismo contenido, mismos artículos.
- **6 pasajes citaban casi palabra por palabra la posición de un autor
  con nombre** (COVIELLO, LARENZ, VIAL, VIAL DEL RÍO/FERRARA, FERREIRA,
  DIEZ-PICAZO, BARROS) sin comillas, pese a tenerse el texto exacto de
  Boetsch o del anexo: se **agregaron comillas** en vez de reescribir
  su posición, mismo criterio que con ALCALDE/JOSSERAND en D. La cita
  de ALCALDE en el `.definicion` ya estaba correcta, sin cambios.
- Se dejaron sin tocar la lista de 10 artículos del Código que aluden
  al fraude (F.2) y el listado de los tres métodos de FERRARA o las
  tres diferencias de VODANOVIC (F.4.1): son catálogos o enumeraciones
  atribuidas, no prosa doctrinal parafraseable sin alterar el
  contenido.
- Un párrafo (F.4.1, semejanzas y diferencias con la simulación) quedó
  en 1.254 caracteres tras la reescritura: se dividió en dos sin
  perder contenido.
- Verificación mecánica: balance de etiquetas OK, cero guiones
  largos/guillemets, ningún párrafo sobre 1.200 caracteres, los 17
  artículos y referencias verificados siguen presentes, capturas de
  Chrome headless revisadas bloque por bloque.
- No se tocó el índice: no se agregó ni cambió ningún `h2`/`h3`.
- Igual que con D y E, Laura pidió seguir sin pausar a mostrarle el
  informe antes de aplicar los cambios. Informe completo con la tabla
  de veredictos en `docs/actualizacion_acto_juridico_cap4-F_2026-10-05.md`.
  Commit `bab10ff`, pusheado a `origin/worktree-acto-juridico-cap4`.
  **Falta que Laura confirme la vista previa** (`AJ_vista_previa.html`,
  ancla `#cIV-F`).

### Qué se hizo en IV.G Otras causales (chequeo de paráfrasis cercana)

- Inventario exhaustivo de los 10 párrafos de prosa (intro + G.1 a
  G.9), contra **dos** fuentes: Boetsch `principal_16` (pp. 186-189 de
  221), que **solo cubre G.1-G.6**, y el anexo `INEFICACIA
  JURÍDICA_Cuadro comparativo.pdf` (Bozzo e Ibarra), única fuente de
  G.7 (terminación), G.8 (renuncia) y G.9 (muerte), ya confirmado en
  el tramo 4.5.
- **9 de 10 párrafos tenían paráfrasis cercana** y se reescribieron en
  voz propia, mismo contenido, mismos artículos: para G.1-G.6, cercana
  a Boetsch; para G.7-G.9, a las celdas de la tabla del anexo (que ya
  son prosa compacta, no solo notación de cuadro, y por eso también
  cae bajo la regla).
- En G.2 y G.7 solo una parte del párrafo necesitaba reescritura: la
  mención de los arts. 1490/1491 en G.2 y el grueso de la explicación
  en G.7 ya venían de una elaboración propia del tramo 4.5, distinta
  de la fuente, y no se tocaron.
- Verificación mecánica: balance de etiquetas OK (se verificó contra
  el archivo completo, no el fragmento recortado, para evitar un falso
  mismatch de `h2` por el corte del bloque), cero guiones
  largos/guillemets, ningún párrafo sobre 1.200 caracteres (máximo
  975), los 9 artículos verificados siguen presentes, capturas de
  Chrome headless revisadas bloque por bloque.
- No se tocó el índice: no se agregó ni cambió ningún `h2`/`h3`.
- **Con esto, el capítulo IV completo (A. La inexistencia, B. Nulidad,
  C. La lesión, D. La simulación, E. La inoponibilidad, F. El fraude a
  la ley y G. Otras causales) ya pasó por el chequeo de paráfrasis
  cercana.** Informe completo en
  `docs/actualizacion_acto_juridico_cap4-G_2026-10-05.md`. Commit
  `0f40746`, pusheado a `origin/worktree-acto-juridico-cap4`. **Falta
  que Laura confirme la vista previa** (`AJ_vista_previa.html`, ancla
  `#cIV-G`), junto con la de F.

### Qué se hizo en V. La representación (chequeo de paráfrasis cercana)

- Primer capítulo fuera de IV en pasar por el chequeo de paráfrasis
  cercana. A diferencia de los tramos de IV, V **no venía de una
  reescritura de esta sesión**: ya estaba en el formato nuevo desde los
  tramos 4.6 y 4.7, pero nunca se había auditado oración por oración
  contra Boetsch. El chequeo de capítulo I ya había encontrado, como
  muestra, un párrafo con paráfrasis cercana en V.1; este informe
  confirmó que el problema era generalizado.
- Inventario exhaustivo de los 38 párrafos de prosa de V.1 a V.10.2,
  contra Boetsch `principal_16` (pp. 190-208 de 221, el capítulo V
  completo). El anexo no aporta nada a este capítulo (ya confirmado en
  los tramos 4.6 y 4.7).
- **36 de 38 párrafos tenían paráfrasis cercana** sin autor nombrado,
  la proporción más alta de todos los tramos de este hilo (95%). Se
  reescribieron en voz propia, mismo contenido, mismos artículos.
- **VIAL** (V.5.3) y **ALESSANDRI** (V.4.4) ya estaban atribuidos con
  claridad y no se tocó la parte que reporta directamente su posición,
  solo la prosa de conexión alrededor.
- La caja de **jurisprudencia** de V.4.4 (Corte Suprema, 9 de enero de
  2017) narraba el razonamiento del fallo casi palabra por palabra de
  la transcripción literal de Boetsch: se reescribió completa en voz
  propia, con las tres citas de fallos anteriores (Temuco 1939,
  Santiago 1945, CS 1951) intactas.
- El ejemplo de la **promesa de hecho ajeno** (V.10.2) reproducía casi
  textual el de Boetsch (vendedor de una casa / vecino que derriba
  árboles, sin nombres propios): se reemplazó por un ejemplo propio
  (Marcela, Ignacio, Tomás), igual que exige la regla de ejemplos
  propios. El ejemplo del seguro de vida (V.10.1) se dejó sin nombres
  por ser genuinamente abstracto, igual que en Boetsch.
- El ejemplo de Rodrigo y Kevin (V.5.3(i)) ya era propio desde el
  tramo 4.6 y no se tocó.
- Verificación mecánica: balance de etiquetas OK, cero guiones
  largos/guillemets, ningún párrafo sobre 1.200 caracteres (máximo
  1.013), los 24 artículos y referencias verificados siguen presentes,
  capturas de Chrome headless revisadas bloque por bloque (las 4
  partes del capítulo completo).
- No se tocó el índice: no se agregó ni cambió ningún `h2`/`h3`.
- Informe completo con la tabla de veredictos en
  `docs/actualizacion_acto_juridico_cap4-V_2026-10-05.md`. Commit
  `83912da`, pusheado a `origin/worktree-acto-juridico-cap4`. **Falta
  que Laura confirme la vista previa** (`AJ_vista_previa.html`, ancla
  `#cV`).

### Qué se hizo en VI. Modalidades (chequeo de paráfrasis cercana)

- Último capítulo del hilo. Igual que V, **no venía de una reescritura
  de esta sesión**: ya estaba en el formato nuevo desde el tramo
  4.8-4.9, pero nunca se había auditado párrafo por párrafo contra
  Boetsch. El chequeo de capítulo I ya había encontrado, como muestra,
  un párrafo con paráfrasis cercana en VI.A.1; este informe confirmó
  que el problema era generalizado, igual que en V.
- Inventario exhaustivo de los 48 párrafos de prosa del capítulo
  completo (intro, A. La condición, B. El plazo, C. El modo), contra
  Boetsch `principal_17` (pp. 209-221 de 221, PDF propio, distinto al
  `principal_16` de V). Ningún anexo aporta contenido (ya confirmado en
  el tramo 4.8-4.9).
- **40 de 48 párrafos tenían paráfrasis cercana** sin autor nombrado y
  se reescribieron en voz propia, mismo contenido, mismos artículos
  (los 28 verificados en el tramo 4.8-4.9, incluida la corrección
  1463→1473 y el párrafo propio del art. 1094).
- La jurisprudencia de 2.4 (condición suspensiva meramente potestativa
  del deudor) estaba parafraseada en estilo indirecto, sin comillas,
  pese a que Boetsch la transcribe textual: se agregaron las comillas
  sobre el texto exacto, atribuida a "la jurisprudencia" (Boetsch no da
  rol, no se inventó uno), mismo criterio que ALCALDE/JOSSERAND en D y
  los autores de F.
- No se tocaron: el enunciado "Las modalidades tienen tres
  características" (sin contenido que parafrasear), el punto 3
  (Estados de la condición, ya condensado antes), B.2 (Semejanzas y
  diferencias, ya convertido a lista y tabla en el tramo 4.8-4.9), el
  párrafo propio del art. 1094 en C.3 (no parafrasea a Boetsch, lo
  corrige), los ejemplos ya achilenizados (Cristóbal, Javiera,
  Bastián/Fernanda, tío Walter, Gonzalo/Antonia, don Hernán, Constanza)
  y los ejemplos abstractos sin nombre propio de la fuente (estrella
  con la mano, aseguradora, venta/Europa).
- Dos párrafos superaron 1.200 caracteres tras la reescritura
  (patrimoniales/familia; potestativa/casual/mixta) y se dividieron en
  dos sin perder contenido.
- Verificación mecánica: balance de etiquetas OK, cero guiones
  largos/guillemets, ningún párrafo sobre 1.200 caracteres tras los dos
  splits, los 28 artículos y las 7 cajas `.ley` siguen presentes,
  verificado con impresión a PDF del manual completo en Chrome headless
  (páginas 122-129, capítulo VI) revisada página por página.
- No se tocó el índice: no se agregó ni cambió ningún `h1`/`h2`/`h3`.
- **Con esto, termina el chequeo de paráfrasis cercana capítulo por
  capítulo de todo Acto Jurídico** (I, IV completo, V y VI). Informe
  completo con el detalle en
  `docs/actualizacion_acto_juridico_cap4-VI_2026-10-05.md`. **Falta
  commitear, pushear y que Laura confirme la vista previa**
  (`AJ_vista_previa.html`, ancla `#cVI`).

### Nota de método: el inventario original de B (B.1-B.4) no era confiable

El informe `docs/actualizacion_acto_juridico_cap4-B_2026-10-01.md` hizo
el inventario de paráfrasis cercana del bloque completo B.1-B.4 de una
sola pasada, y su propia sección "Qué se encontró" dice "los más
claros": era una muestra, no una lista exhaustiva. Al reescribir B.2
punto por punto contra el texto de Boetsch extraído directo del PDF
(no contra el resumen del informe) aparecieron dos párrafos enteros que
esa muestra no había visto (B.2.5 completo, primer párrafo de B.2.7).

Corregido en `actualizar-manuales-existentes.md` 3 y `decisiones.md`
2026-10-01: de ahora en más, el chequeo de cada sub-punto que falta
(B.3, B.4, y los capítulos C-G, V, VI que siguen) se hace **tramo por
tramo justo antes de reescribirlo**, con una tabla exhaustiva (una fila
por punto numerado, con veredicto), contra el texto de la fuente
extraído con `fitz`, **no** a partir de una lista hecha de antemano
para varios puntos a la vez. El chequeo también se amplía a las mismas
categorías del informe de cambios de `actualizar-manuales-existentes.md`
2.c (párrafos largos, ejemplos sin achilenizar, recuadros con formato
viejo, cuadros comparativos posibles), no solo paráfrasis, para no
diferir correcciones ya detectadas a una pasada aparte.

Detalle completo de B.1 y B.2 (qué se encontró, qué se reescribió, la
cita del fallo Pedro Aguirre Cerda corregida contra el anexo, la
corrección de fidelidad en la cita del art. 1683) en
`docs/actualizacion_acto_juridico_cap4-B_2026-10-01.md`.

### Qué se hizo en capítulo I (Teoría general del acto jurídico)

- Rama `worktree-acto-juridico-cap1`, desde `origin/main` (ya con todo
  el tramo 4 incluido).
- Fuente: Boetsch `principal_1` (páginas 12-30 de 221, 19 páginas).
  Informe: `docs/actualizacion_acto_juridico_cap1_2026-09-30.md`.
- Antes del chequeo de paráfrasis: inventario completo contra Boetsch
  (sin huecos, los 8 puntos y 16 subpuntos cubren la fuente), los
  cuatro anexos leídos completos (se encontró que
  `Anexo_secundario_AJ_Ineficacia.pdf`, pese a su nombre, trae en sus
  primeras páginas la cita de ROUBIER y el ejemplo de STOLFI del punto
  I.4, que no están en Boetsch: es su fuente real, no un agregado sin
  respaldo), y los 23 artículos citados verificados sin errores.
- **Se reescribió el capítulo I completo en voz propia** (los 8 puntos
  y 16 subpuntos), aplicando el criterio de arriba: la definición de
  VIAL en el punto 4 pasó a bloque `.definicion`, citada textual; el
  resto, prosa de Boetsch sin autor, se reestructuró de verdad. Se
  conservó íntegro el contenido, el vocabulario técnico y los 23
  artículos (verificado con script). A pedido de Laura, se aprovechó
  para destensar el tono en varios puntos (preguntas retóricas,
  ejemplos cotidianos como un contrato de arriendo), sin agregar
  contenido jurídico nuevo.
- Verificación mecánica repetida después de la reescritura: balance de
  etiquetas OK, cero guiones largos/guillemets, ningún párrafo sobre
  1.200 caracteres, mismos 23 artículos, capturas de Chrome headless
  revisadas bloque por bloque.
- No se tocó el índice.
- Commits `fe6efce` (reescritura del tramo original) y `8c8ad34`
  (reescritura en voz propia), pusheados a
  `origin/worktree-acto-juridico-cap1`. Falta que Laura lo revise en
  vista previa y mergee con GitHub Desktop.

### Qué se hizo en IV, intro + A. La inexistencia jurídica

- Rama `worktree-acto-juridico-cap4`, desde `origin/main`.
- Fuente: Boetsch `principal_9` (páginas 114-123 de 221). Informe:
  `docs/actualizacion_acto_juridico_cap4-A_2026-09-30.md`.
- Es el tramo 1, el piloto original del método nuevo, trabajado de
  cerca con Laura. A diferencia del capítulo I, **no** venía sin
  revisar: ya tenía citas atribuidas (BOETSCH, CLARO SOLAR) en bloques
  `.definicion` o entre comillas, y dos cuadros comparativos
  genuinamente reestructurados (inexistencia vs. nulidad; CLARO SOLAR
  vs. ALESSANDRI), no la fuente reordenada en filas.
- Comparado oración por oración contra Boetsch, se encontraron solo
  **tres pasajes con paráfrasis cercana**:
  1. A.1, el párrafo "Dicho de otro modo, el acto es jurídicamente
     inexistente cuando le falta..." (antes del ejemplo de Diego y
     Sebastián).
  2. A.2 completo, "Origen de la teoría de la inexistencia jurídica"
     (los tres párrafos sobre ZACHARIAE, el axioma francés y el
     matrimonio entre personas del mismo sexo).
  3. A.4.1(i), el párrafo sobre el art. 1701.
- Los tres se reescribieron en voz propia: mismo contenido, mismos
  artículos, mismo vocabulario técnico, otra construcción de oración.
  No se tocó nada más.
- Verificación mecánica: balance de etiquetas OK (incluidas
  `table`/`tr`/`th`/`td`), cero guiones largos/guillemets, ningún
  párrafo sobre 1.200 caracteres, capturas de Chrome headless
  revisadas bloque por bloque. No se tocó el índice.
- Commit `5bacbcc`, pusheado a `origin/worktree-acto-juridico-cap4`.
  Falta que Laura lo revise en vista previa y mergee con GitHub
  Desktop.

## Capítulos II y III: tramos 5.x (desde 2026-10-06)

Reparto acordado con Laura, en tandas chicas, cada una con su informe
y aprobación antes de tocar el manual:

| Tramo | Contenido | Informe | Estado |
|---|---|---|---|
| 5.1a | II intro + A.1 Conceptos generales + A.2 Requisitos de la voluntad | `docs/actualizacion_acto_juridico_II-A1-A2_2026-10-06.md` | Reescrito (commit `274d5cf`); vista previa aprobada |
| 5.1b | A.3.1 Unilaterales + A.3.2 Formación del consentimiento | `docs/actualizacion_acto_juridico_II-A3-1-2_2026-10-06.md` | Reescrito (commit `a3b4326`); vista previa aprobada; latinazgo eliminado |
| 5.1c | A.3.3 Casos especiales de formación del consentimiento | `docs/actualizacion_acto_juridico_II-A3-3_2026-10-06.md` | Reescrito (commits `b6dbb08` informe, luego 3 rondas de ajustes con las leyes de Laura); vista previa aprobada (2026-10-06) |
| 5.2a | A.4 Vicios + A.5.1 Concepto de error + A.5.2 Error de derecho y de hecho; fuentes nuevas: Vial pp. 77-89 y Figueroa pp. 63-65 (León Hurtado) | `docs/actualizacion_acto_juridico_II-A4-A5-1-2_2026-10-06.md` | Reescrito (commits `85c73ab`, `04cb186`); vista previa aprobada (2026-10-06), con menos cajas |
| 5.2b | A.5.3-A.5.6 Clases de error de hecho, actos bilaterales/unilaterales, error común; fuentes nuevas: Vial pp. 89-104 y Figueroa pp. 66-75 | `docs/actualizacion_acto_juridico_II-A5-3-6_2026-10-06.md` | Reescrito (commits `f952530`, `7d4abc8`, `1fd4fa8`); vista previa aprobada (2026-10-06) |
| 5.2c | A.6 Dolo, A.7 Fuerza, A.8 Remisión lesión/simulación; solo Boetsch, Código y anexo de Bozzo e Ibarra (decisión de Laura: sin fuentes nuevas) | `docs/actualizacion_acto_juridico_II-A6-A8_2026-10-06.md` | Reescrito (commits `36a76c2`, `455ff24`); vista previa aprobada (2026-10-06) |
| 5.3 | B. Capacidad, `principal_4`; solo Boetsch y el Código (decisión de Laura) | `docs/actualizacion_acto_juridico_II-B_2026-10-06.md` | Reescrito (commits `81a917f` informe, `3330e19`); vista previa aprobada (2026-10-06) |
| 5.4 | C. Objeto, `principal_5` (pp. 76-92) + anexo de Bozzo e Ibarra pp. 3-6 y 22 + VIAL pp. 170-183 + fallo CS rol 3671-1998 | `docs/actualizacion_acto_juridico_II-C_2026-10-06.md` | Reescrito (commits `b5b1373`, `946d031` informe, `d4e0b86` reescritura); vista previa sin ajustes; **en `main`** (2026-10-07) |
| 5.5 | D. Causa, `principal_6` + anexo `Causa_ DOMINGUEZ y BOETSCH.pdf` + VIAL pp. 189-214 (26 pantallazos de Laura, 2026-10-07) | `docs/actualizacion_acto_juridico_II-D_2026-10-07.md` | Reescrito (commits `fd73319`, `123a9ec` informe, `3b0d44f` reescritura); **en `main`** (merge `3a6301d`, 2026-10-07) |
| 5.6 | E. Formalidades (`principal_7`) + III. Efectos (`principal_8`); solo Boetsch y anexos (decisión de Laura) | `docs/actualizacion_acto_juridico_II-E-III_2026-10-07.md` | Reescrito (commits `9439a7b` informe, `3279571` reescritura, `69ef71c` ajuste); vista previa aprobada (2026-10-07); **falta que Laura lo mergee a `main`** |

Para cada tramo se aplica desde el principio el chequeo de paráfrasis
cercana (tabla exhaustiva por punto), no después.

### Qué se hizo en 5.1a (II intro, A.1, A.2)

- Contenido completo respecto de Boetsch (pp. 31-34); solo faltaba la
  introducción del capítulo (agregada, con remisión a I.7). Ningún
  anexo ni Memorice aporta a este tramo.
- 13 de 13 párrafos con paráfrasis cercana (sin autores nombrados):
  reescritos en voz propia.
- El recuadro "No confundir" con las tres excepciones del silencio era
  materia: pasó al texto como a) La ley, b) Las partes, c) El juez.
- **(iii) reordenado** a pedido de Laura: el párrafo sobre el Código
  Civil quedó como cierre de la manifestación tácita, sin número; el
  silencio pasó a ser (iii).
- `.ley` nuevos: art. 2125 completo (faltaba el inc. 2°) y art. 1233
  ("se entenderá que repudia", corrige el "se presume" de Boetsch).
  Art. 1566 ajustado a su letra.
- Recuadros nuevos: Ejemplo (la señora Carmen y el abogado que no
  contestó, art. 2125), Advertencia ("el que calla otorga"), No
  olvidar (expresa = tácita, salvo excepciones), Conexiones.
- Ejemplos propios: el Benja y el Yaris "por una piscola" (seriedad),
  la notaría y la junta de vecinos (expresa), don Lucho en la feria
  (tácita).

### Qué se hizo en 5.1b (A.3.1, A.3.2)

- Contenido completo respecto de Boetsch (pp. 34-45). Casi todo con
  paráfrasis cercana: reescrito completo.
- **Artículos del Código de Comercio verificados** (arts. 97 a 108)
  contra `Apuntes/CÓDIGO DE COMERCIO.pdf`. Hallazgos: al art. 97 le
  faltaba "queda el proponente libre de todo compromiso"; al art. 99,
  "El arrepentimiento no se presume"; Boetsch atribuye el deber de
  indemnizar al art. 99, pero está en el **art. 100**. Laura entregó el
  texto del art. 12 Ley 19.496 y del art. 22 Ley sobre Efecto
  Retroactivo (ambos confirmados y citados textuales).
- **Numeración nueva de 3.2** (antes bajaba cuatro niveles con
  sangrías a mano): (i) La oferta, (ii) La aceptación, (iii) Momento,
  (iv) Lugar, (v) Negociaciones preliminares y responsabilidad
  precontractual, con a) y a.1) debajo. Ningún `h2`/`h3` cambió.
- Los dos Dato de grado ("la aceptación no se presume"; FAGGELLA,
  SALEILLES, ROSENDE) pasaron al texto. El No confundir del art. 105 se
  dividió: la materia al texto, queda un No confundir corto.
- `.ley` de los arts. 97, 98, 99, 100, 101 y 104 C. de Comercio.
- **FAGGELLA y SALEILLES** con la ortografía correcta (Boetsch escribe
  "FAGUELLA" y "SALEIYES"; así están en el manual de Precontractual).
- Definición de negociación preliminar devuelta a cita textual en
  `.definicion` ("la definición que le ha dado la doctrina...").
- **Lex loci:** Boetsch dice *lex loci rei sitae* para el principio de
  que el acto se rige por la ley del país donde se celebra (y la *rei
  sitae* es la del lugar de los bienes, art. 16 CC). **Decisión de
  Laura (2026-10-06): eliminar el latinazgo**; queda solo el principio
  en castellano.
- Recuadros nuevos: cuadro comparativo de las cuatro teorías del
  momento, Advertencia (retractación tempestiva e indemnización), No
  olvidar (plazos arts. 97-98), Conexiones (con secciones reales del
  manual de Precontractual: B.3, B.4, B.5, C).
- Ejemplos propios: la Fran y el taxi, la tía Mónica y Tomás (100
  libros), don Patricio y la Cata (comedor), la Javi y Diego
  (bicicleta, oferta completa/incompleta), la micro, la panadería y
  la máquina del metro (oferta tácita), el casero de la Vega y la
  góndola (oferta indeterminada), la Sofi y la cabaña en Pucón (las
  cuatro teorías).

### Qué se hizo en 5.1c (A.3.3)

- Contenido completo respecto de Boetsch (pp. 45-49). Todo con
  paráfrasis cercana: reescrito completo. Ningún anexo ni Memorice
  aporta.
- (i) licitación, (ii) adhesión, (iii) autocontratación, (iv)
  contratos electrónicos, con a) a d) en la escalera; la confirmación
  escrita pasó de b) a c), donde la pone Boetsch.
- Definiciones sin autor con la fórmula "la definición que le ha dado
  la doctrina es...": licitación, adhesión, autocontrato, contrato
  electrónico.
- **Art. 412 corregido**: Boetsch lo corta y el manual había perdido
  "o de sus hermanos, o de sus consanguíneos o afines hasta el cuarto
  grado inclusive". Ahora completo en `.ley`, con el inc. 2° (la
  prohibición absoluta) en negrita. Arts. 2144 y 2145 en `.ley` con su
  letra exacta. Código alemán citado como "§ 181" (decisión de Laura).
- **Ley 19.496 verificada contra el DFL 3 de 2021** (texto refundido
  vigente, entregado por Laura). Hallazgos donde Boetsch está
  desactualizado o incompleto:
  - La ley no rige "solo" actos mixtos: es la regla general (art. 2
    letra a), con otros casos.
  - La sanción no es "solo multa": el art. 35 permite pedir el
    cumplimiento forzado de la oferta; además art. 24 (multa) y art.
    50 (acciones).
  - La "duración de la oferta" (frase confusa de Boetsch) es el art.
    35.
  - El art. 16 cambió con la Ley 21.398 (2021): letra h) nueva y sin
    los incisos del árbitro.
  - Proveedor = art. 1 Nº 2.
- **DS 81 de 1999 derogado** (Decreto 181 de 2002): se dejó en la lista
  con esa aclaración. Se agregó el art. 3 de la Ley 19.799
  (equivalencia de la firma electrónica, con sus tres excepciones).
  "Regulación escasa" quedó atribuida a la doctrina. No se usaron las
  Leyes 21.180 y 21.464 ni la Res. 66 de 2020 (no tratan la formación
  del consentimiento).
- **Regla nueva (Laura, 2026-10-06)**: las leyes especiales se
  resumen en el texto, sin `.ley` completo (arts. 12 A, 16, 35 y art.
  3 Ley 19.799 quedaron resumidos). En `formato.md` 4 y `decisiones.md`.
- Recuadros nuevos: No confundir (llamado a licitación / oferta a
  persona indeterminada), cuadro comparativo (el autocontrato en el
  Código Civil), Advertencia (residencia del aceptante, no ubicación del
  aparato), Conexiones (V. Representación, Contratos, Familia).
- Ejemplos propios: la Municipalidad de Chillán y las luminarias, la
  Pame y su Suzuki (art. 2144), don Arturo y la parcela de Olmué (art.
  412 inc. 2°), la Trini y las botas compradas desde Lima (art. 104 C.
  de Comercio).
- Las leyes que entregó Laura están en `~/Downloads/` (Ley-19496,
  DFL 3 de 2021, Ley-19799, Ley-20217, DTO-81, Ley-21180, Ley-21464);
  sirven para verificar 5.2 en adelante si se cita la Ley del
  Consumidor.

### Qué se hizo en 5.2a (A.4, A.5.1, A.5.2)

- Boetsch completo (pp. 49-52); todo tenía paráfrasis cercana:
  reescrito completo. Fuentes nuevas de Laura: VIAL pp. 77-89 y
  FIGUEROA pp. 63-65 (extracto de LEÓN HURTADO). Transcripción de lo
  usado en la sección 8 del informe.
- **A.4:** art. 1451 en `.ley` (Boetsch no lo citaba); COVIELLO (los
  vicios se reducen a error y temor).
- **5.1:** `.definicion` de STOLFI; GIORGI y COVIELLO; por qué es vicio
  del conocimiento (PIETROBON). Escalera (i) error e ignorancia (cita
  sin autor de Boetsch + CLARO SOLAR), (ii) error y duda (la frase de
  la duda que Boetsch usa sin autor **es de PIETROBON**; duda objetiva
  de VIAL), (iii) error y previsión (definición de PIETROBON).
  Recuadros: Ejemplo (la Feña y el food truck de Pichilemu) y No
  confundir (error, ignorancia y duda). Ejemplo en texto: don Hernán y
  el cuadro "atribuido a" en la feria de Franklin.
- **5.2 (i) error de derecho:** definición de Boetsch con la fórmula de
  doctrina; supuestos de VIAL; arts. 1452 y 8 en `.ley`; ejemplo del
  Nacho y su parcela de Paine (arts. 1801 inc. 2° y 1545); art. 706
  inc. final; historia (Roma, POTHIER, DOMAT, Código italiano). a) art.
  2297 y b) art. 2299 en `.ley`, explicados; ejemplo de la tía Gladys y
  la junta de vecinos. **c) ¿Son realmente excepciones?: el primer
  párrafo es textual de Laura** (no se toca), seguido de LEÓN HURTADO
  (interpretación restrictiva, rechazo de *damno vitando*) y VIAL
  (excepción a la irrelevancia, no al "no vicia"). Recuadros:
  Jurisprudencia (Gaceta 1928, sent. 191, p. 883, sin rol) y No
  confundir "Repetir no es anular".
- **5.2 (ii) error de hecho:** definición de Boetsch con la fórmula de
  doctrina; error *in re*, *in persona*, *in negotio*; a) error
  obstáculo y error vicio (ejemplo: la Cami y los aros de alpaca), b)
  criterio objetivo y subjetivo, y que el Código exige error
  determinante (VIAL), c) el Código no recoge la distinción (art.
  1453). No olvidar y Conexiones al final de 5.2.
- **Ajustes de Laura en vista previa:** se eliminaron el cuadro
  comparativo de las tres lecturas de los arts. 2297 y 2299 y la
  Pregunta clásica (Laura: "se ve mucha caja"); la Advertencia pasó a
  No confundir. Se mantienen Jurisprudencia, No olvidar y Conexiones.
- **Advertencia retirada como caja** (decisión 2026-10-06): las cuatro
  que había en AJ (II.A.2.2, II.A.3.2, II.A.3.3, IV.A.4.3) pasaron a No
  confundir, y se sacó de `guia-editorial.md`, `formato.md`,
  `proceso.md` y `actualizar-manuales-existentes.md`. Laura pidió
  aplicarlo en **todos** los manuales: también se cambiaron las de
  Responsabilidad (3 "Advertencia" en Precontractual y 2 "Atención",
  misma caja `.warn`, en Contractual) y se regeneraron sus PDF.
- **Casos para resolver:** decidido que van aparte, después del
  lanzamiento. El caso piloto (la Coni y la suegra) quedó en la sección
  6 del informe.
- Ningún `h2`/`h3` cambió (índice igual).

### Qué se hizo en 5.2b (A.5.3 a A.5.6)

- Fuentes: Boetsch pp. 52-59, VIAL pp. 89-104, FIGUEROA pp. 66-75
  (CLARO SOLAR, LEÓN HURTADO, fallos Izquierdo 1859 y Butcher 1943).
- Todo con paráfrasis cercana: reescrito completo. Dato de grado de
  5.3 pasado al texto como (i) c) con c.1) a c.3), con autores
  (ALESSANDRI BESA, LEÓN HURTADO; Torres con Fisco en una línea).
- `.ley` 1453, 1454 (agrega "acto o", que faltaba), 1455, 1057, 1058,
  1013, 2058. Art. 2456 y art. 94 regla 4ª citados en el texto.
- (ii) reordenado en a) a e): sinónimos / distintos (VIAL) / lectura de
  BOETSCH; presunción de la materia, labor del juez y dominio del
  vendedor, todo a nombre de VIAL.
- **5.4 corregido** (el inc. 2° pide conocer el motivo, no compartir
  el error).
- Cajas: 1 No confundir (calidad esencial / accidental elevada), 2
  Jurisprudencia (Izquierdo; Butcher, con la advertencia de la ley
  antigua), 1 tabla comparativa de las cuatro clases al final de 5.3,
  Conexiones al final de 5.6.
- Ejemplos propios en texto: Martín e Isi (guitarra), don Iván (depto
  302), Maite (cadena) y Joaco (camiseta), Cote (sillón de calle
  Italia / Persa), don Ernesto (camioneta), Rorro (vino 2018), señora
  del almacén, Flo y el fotógrafo homónimo, don Lalo en Pichidegua.
- Claro Solar cita arts. 1267, 704 y 1269 para una regla que está en
  el art. 94 regla 4ª: se cita el 94. Sus arts. 361-363 C. de Comercio
  (derogados en parte) no se usaron.

### Qué se hizo en 5.2c (A.6, A.7, A.8)

- Fuentes: Boetsch pp. 59-69 y anexo de Bozzo e Ibarra pp. 6-9 (sin
  fuentes nuevas, decisión de Laura). Todo con paráfrasis cercana:
  reescrito completo.
- 6.1 en escalera: (i) tres ámbitos (a) celebración con la definición
  doctrinal, b) cumplimiento con arts. 1558 y 1546, c) delito civil),
  (ii) VON TUHR, PESCIO, LEÓN HURTADO, (iii) elementos y simple mentira.
- `.ley` 1458, 1459, 1465, 1456, 1457. Arts. 524-525 C. de Comercio
  resumidos con el matiz de la Ley 20.667.
- Presunciones en a) a g), distinguiendo "dolo" y "mala fe"; art. 974
  descartado; **art. 22 Ley de Cheques sacado de la lista** (exige
  ánimo de defraudar, no lo presume; texto entregado por Laura). Art.
  280 C.P.C. verificado con el texto de Laura.
- "Injusta" atribuida a la doctrina; 7.3 (i) a (iii) como lista
  subrayada; sin la glosa hombre/mujer de Boetsch (decisión de Laura).
- Cajas: 1 No confundir (dolo y fuerza de un tercero, 7.4), cuadro
  comparativo error/dolo/fuerza (final de 7.8), Conexiones (final de
  8, con secciones reales de Responsabilidad: Contractual E.4.1 y
  H.2.5, Extracontractual H.2). Sale la caja de la cómoda.
- Ejemplos propios: casero de Temuco, don Raúl, señora Juana y Gaspar,
  Seba, Nico, Pía y Dani, Mati y don Jaime, Marce, don Sergio, Clau y
  Polo, Rodrigo, señora Elba, Kathy y tía Chela, Agustín.

### Qué se hizo en 5.3 (B. La capacidad)

- Fuentes: Boetsch pp. 69-76 y el Código (decisión de Laura, sin
  fuentes nuevas). Todo con paráfrasis cercana: reescrito completo.
- `.definicion` capacidad y capacidad de goce (Memorice); `.ley` 1445 y
  1447 completos.
- 3.1 y 3.2 en la escalera de Boetsch (i) concepto, (ii) quiénes con
  a) b) c), (iii) cómo actúan, (iv) sanción.
- Corregidos al texto vigente: art. 43 (progenitores, Ley 21.400), art.
  1796 (hijo sujeto a patria potestad), art. 412 inc. 2° (extensión),
  cita de incapacidades de goce (963, 965, 1061 en vez de 961 y 1065).
- **Art. 114 derogado** (Ley 21.515, D.O. 28.12.2022, con los arts.
  105-116): se cuenta como "el antiguo art. 114". Ejemplos vigentes
  propuestos por Laura: arts. 1754/1757 (nulidad relativa, en la (ii))
  y arriendo arts. 1749 inc. 4°/1756/1757 (inoponibilidad del exceso,
  en la (iii)). No se afirmó el motivo de la derogación (edad mínima
  18) porque no se pudo verificar con el texto de la ley.
- Fallos de Concepción (1896, 2008, 2008) como cita textual. Mujer
  casada pasó al texto. Cajas: 1 No confundir (interdicción del demente
  y del disipador), cuadro comparativo absoluta/relativa/particular,
  Conexiones (incluye Extracontractual E. La capacidad delictual).
- Ejemplos propios: Vicho, don Washington, Coti, Moni, Macarena, Tere y
  Joaquín, el fundo en Paillaco.

### Qué se hizo en 5.4 (C. El objeto)

- Fuentes: Boetsch pp. 76-92, anexo de Bozzo e Ibarra (pp. 3-6 y 22),
  Memorice y, aportados por Laura, **VIAL pp. 170-183** (14 pantallazos
  `Screenshot 2026-10-06 at 10.54.02 pm` a `10.55.46 pm`) y el **fallo
  CS rol 3671-1998** (sin fecha). Todo con paráfrasis cercana:
  reescrito completo, sin cambiar ningún `h2`/`h3`.
- **Error de contenido corregido:** la caja No confundir de 4.3
  presentaba la tesis de Velasco (venta de cosas embargadas o litigiosas
  válida) como "la doctrina". Ahora es una discusión en el texto:
  mayoritaria (Alessandri, Somarriva, Vial, mayoría de la
  jurisprudencia), Velasco (con la CS 3671-1998) e Iturra; cuadro
  comparativo, caja de Jurisprudencia y Pregunta clásica.
- Agregado de Vial: Claro Solar y Vial sobre cosas incomerciables
  (inexistencia, cerro Santa Lucía); inmueble embargado no inscrito
  (objeto ilícito igual, la inscripción solo mira a terceros); venta
  forzada como discusión (Claro Solar y León Hurtado / otros); art. 12
  como fundamento del consentimiento del acreedor; arts. 296 y 297
  C.P.C. frente al Nº 4.
- Corregidos al texto vigente: art. 1204 (escritura pública,
  legitimario a la fecha), art. 589 ("mar adyacente"), art. 1509
  ("determinadamente"), juego (arts. 2260 y 2263), CPR 19 Nº 4 (incluye
  datos personales; resumido sin transcribir). Art. 703 inc. 4°
  eliminado (decisión de Laura). Sin latín.
- Ejemplos propios: don Tito y la Chepa (Quintay; Olmué), don Kike
  (uva del Elqui), Marcelo (Caleta Portales), la Panchita (el Rucio),
  Coke (empanadas), Rapa Nui, la Trinidad (herencia), la marihuana
  Chile/Holanda (propuesta de Laura, puesta en 3.3 porque es
  imposibilidad moral, no física).
- **Desde 5.4 los códigos están en `Apuntes/CODIGOS/`** (Civil, C.P.C.,
  Constitución, Comercio); Laura agrega otros si hacen falta.

### Qué se hizo en 5.5 (D. La causa)

- Fuentes: Boetsch pp. 93-103, anexo `Causa_ DOMINGUEZ y BOETSCH.pdf`,
  Memorice y, aportado por Laura, **VIAL pp. 189-214** (26 pantallazos
  en el chat del 2026-10-07; de ellos, solo las pp. 211-214, de fraude
  a la ley, se guardaron en `Apuntes/CIVIL/Acto Jurídico/`
  `VIAL_fraude_a_la_ley_p211.png` a `p214.png`). Todo con
  paráfrasis cercana: reescrito completo, sin cambiar ningún `h2`/`h3`.
  Laura aceptó las 5 recomendaciones del informe.
- Agregado de Vial: móvil ilícito en gratuitos (basta el del autor) y
  onerosos (debe conocerlo la otra parte); antecedente francés de la
  tesis dual; labor del juez ante la causa ilícita; arts. 1454 y 1455
  (motivo y causa como sinónimos); argumento del "enajenado" y de León
  Hurtado; la tesis dual como **opinión más aceptada** (anexo); la
  presunción de causa y de licitud **atribuida a Vial**; su tesis de
  que todo contrato simulado es inexistente por falta de causa, como
  opinión suya con remisión a IV.D 4.3 (que no se tocó); cita de Claro
  Solar sobre la inexistencia. Autores nombrados: Claro Solar, Velasco,
  Betti, Cariota Ferrara, León Hurtado.
- Caja **Dato de grado** (tipo retirado) pasada al texto de 3. Nuevo:
  `.ley` art. 1467, cuadro de las cuatro doctrinas, Pregunta clásica
  (¿qué concepto de causa sigue el Código?), No confundir (error-motivo
  / error sobre los motivos), Conexiones. Ejemplos propios: citroneta
  de don Rigo, cordero del Chalo, bodega de Quilicura (pasta base,
  arts. 1467, 1682 y 1468), pagaré de la Pili; Mane y don Memo en el
  texto.
- **Ley 18.092** ya está en `Apuntes/CODIGOS/LEY 18092.pdf`. Su art. 28
  no distingue terceros de buena o mala fe: eso es de Boetsch y quedó
  atribuido a él; el art. 107 extiende la regla al pagaré. Solo los
  arts. 11 y 27 de esa ley hablan de buena/mala fe, y no dicen lo de
  Boetsch. **Decisión de Laura (2026-10-07): dejarlo así**, sin
  agregar una línea aclaratoria en 7.2.
- Fuera del tramo: rol de V.4.4 puesto (CS, 9-1-2017, rol Nº
  14.853-2016, dato de Laura).
- Commits `fd73319`, `123a9ec` (informe) y `3b0d44f` (reescritura).
  **En `main`** (merge `3a6301d`, hecho por Laura el 2026-10-07).

### Qué se hizo en 5.6 (E. Las formalidades y III. Los efectos)

- Fuentes: Boetsch pp. 103-113 y Memorice (10 definiciones). El anexo
  de Bozzo e Ibarra no trae capítulo propio: lo suyo (nulidad refleja,
  conversión formal, art. 1694, S.A. nula de pleno derecho) ya está en
  IV y solo se enlaza. Todo con paráfrasis cercana: reescrito completo,
  sin cambiar ningún `h2`/`h3`. Laura aprobó todas las recomendaciones.
- **Errores de artículos corregidos** (Boetsch usa la numeración previa
  a la Ley 19.585): bienes raíces del hijo es **art. 254** (no 255);
  autorización del hijo y del pupilo, **arts. 260 y 440 inc. 2°** (no
  253, 254 y 439). Art. 1682 dice "formalidad", no "solemnidad". Art.
  447 exige además inscripción en el Conservador.
- Agregados: arts. 1014, 1026, 1401, 1708, 1450, 1902; `.ley` arts.
  1709, 1902 y 1545; seis `.definicion` con "la definición que le ha
  dado la doctrina es..."; cuadro de las formalidades; Pregunta clásica
  (sanción de la falta de solemnidad de existencia); dos No confundir
  (solemnidad / formalidad de prueba; tercero absoluto / relativo);
  dos Conexiones. Caja Dato de grado (retirada) pasada al texto.
  "Quiebra" quedó como "procedimiento concursal de liquidación (la
  antigua quiebra)", sin citar la Ley 20.720.
- Ejemplos propios: testamento de don Lalo (Curicó, Rangers), el
  departamento de la Isi (la Javi), la moto del Pipe y el Cote, el
  crédito de la Kathy (la Fran, don Beto), don Hugo y la Cami, el
  refrigerador del Benja (tía Mirna, Maipú).
- No verificado: art. 4 letra f) Ley de Competencia Desleal (resumido).
- ~~I.8.6 dice "nulo" donde 2.1 dice "inexistente o nulo
  absolutamente"~~: **resuelto** (2026-10-07, rama
  `worktree-acto-juridico-I-8-6`). I.8.6 ahora dice: solemnidad de
  validez, nulidad absoluta; de existencia, inexistente o nulo
  absolutamente según la postura (ver II.E.2.1 y IV.A); y la omisión de
  la solemnidad legal "acarrea la sanción que corresponda según su
  clase".
- Ajuste de Laura en vista previa: en 2.1 (i), la pregunta "¿Qué pasa
  si falta una solemnidad de existencia?" en negrita y las dos posturas
  como `a)` El acto es inexistente / `b)` El acto es nulo absolutamente
  (commit `69ef71c`). Luego aprobó el tramo ("Perfecto").

### Pendientes de II (recordar a Laura al retomar)

- **Archivos HTML antiguos con cajas Advertencia** sin tocar:
  `01_Responsabilidad_Civil_Manual_de_Estudio.html` y
  `01b_Responsabilidad_Contractual_DESARROLLADO_muestra.html` (la app no
  los usa; solo los nombra `03_Interrogador_IA_Responsabilidad_PROMPT.md`).
  **Decisión de Laura (2026-10-06): se ven cuando se trabaje ese
  apunte**, no ahora.
- ~~**Para 5.2c (fuerza):** art. 8 Nº 3 Ley 19.947~~: **resuelto**, ya
  está resumido en 7.4 y en las Conexiones (2026-10-06).
- ~~**Ejemplos genéricos de Boetsch en I y VI**~~: **hecho 2026-10-08.**
  Laura aprobó la propuesta de `DERECHO LIBRE/Informes/Informe_AJ_ejemplos_I_VI.html`
  (STOLFI opción B: se conserva la cita con personajes, la Coni y el
  Kevin; se conserva la estrella del derecho romano como dato histórico).
  10 ejemplos reemplazados (I.3 don Pato y el quincho del Nacho, I.4,
  I.6.1, I.8.1 x2, I.8.8 la tía Chela; VI 2.2, 2.3, 2.4) y PDF
  regenerado. Laura aclaró que **el capítulo I no se reescribe**: solo
  se cambiaron sus ejemplos. Texto original de la regla
  (decisión 2026-10-06). En VI quedaron la estrella con la mano, la
  aseguradora y la venta "si voy a Europa"; I no se ha revisado con
  este criterio. **Decisión de Laura (2026-10-06): se dejan para la
  revisión final del manual**, no ahora.
- **Merge de `worktree-acto-juridico-cap2-3`** a `main`: hecho hasta
  5.2b (2026-10-06, commit `08abcb5`). Lo de 5.2c en adelante se
  mergea cuando Laura quiera. **5.2c ya está mergeado y pusheado**
  (confirmado por Laura, 2026-10-06). **5.3 aprobado y en `main`**
  (confirmado por Laura, 2026-10-06). **5.4 en `main`** (commit
  `d4e0b86`, mergeado por Laura el 2026-10-07).

## Qué sigue (orden decidido por Laura)

1. ~~El chequeo de paráfrasis cercana de todo Acto Jurídico~~ — **hecho**:
   capítulo I, capítulo IV completo (A-G), V y VI (Modalidades) ya
   están reescritos.
2. ~~Merge de `worktree-acto-juridico-cap4` a `main`~~ — **hecho**
   (2026-10-05, `main` y `origin/main` quedaron en `7675b08`, el mismo
   commit que esta rama; detalle del conflicto que hubo que limpiar en
   el encabezado de este archivo). El **capítulo I**
   (`worktree-acto-juridico-cap1`, commit `8c8ad34`) **también ya está
   en `main`** (verificado 2026-10-06). El commit
   `b39a974` (achilenización del ejemplo de V.5.3) estaba en la rama
   `worktree-acto-juridico-tramo4-5-otras-causales`, que ya no tenía
   nada más pendiente y Laura pidió borrarla el 2026-10-01 (**ojo: el
   2026-10-06 seguía existiendo en local, con su worktree
   `.claude/worktrees/acto-juridico-tramo4-5-otras-causales`, y GitHub
   Desktop la ofrecía para mergear con 2 conflictos. Sus 2 commits eran
   `b39a974`, ya en main reescrito, y `f9b2793`, una nota vieja de este
   archivo. **Borrada de verdad el 2026-10-06**, rama y worktree); el
   cambio puntual de V.5.3 se rescató antes de borrarla y ya está en
   `main` (vía el commit `cb30eb3` de este hilo). También se borró
   `worktree-pdf-header-fix` (2026-07-28): su único contenido propio
   eran dos PDF regenerados ya obsoletos, la lógica del encabezado ya
   está en `main`.
3. ~~Revisión de VI en vista previa~~: **hecha**, Laura dijo "todo
   ok con modalidades" (2026-10-07).
4. **Capítulos II y III, en curso**: ver la sección "Capítulos II y
   III: tramos 5.x" arriba (tabla de tramos, qué se hizo, pendientes).
   **Capítulos II y III terminados** (5.6 aprobado en vista previa el
   2026-10-07) **y ya en `main`** (commit `d6800fa`, verificado
   2026-10-07).
   **Pasada de IV.F con VIAL pp. 211-214: aplicada** (2026-10-07, rama
   `worktree-acto-juridico-IV-F-vial`, commits `b3c5c45` informe y
   `463c170` manual; informe
   `docs/actualizacion_acto_juridico_IV-F-VIAL_2026-10-07.md`). Laura
   aprobó todo y pidió dejar en F.3 (iii) solo la cita de COVIELLO.
   Se corrigió la atribución de la definición de F.1 (es de
   LIGEROPOULO vía VERGARA BAEZA, no de VIAL), F.5 presenta la
   "coincidencia" en la nulidad absoluta como opinión de VIAL, y
   "VIAL DEL RÍO" quedó "VIAL" en todo el manual. Ejemplo nuevo: el
   tío Lucho (casino de Viña, parcela en Pirque).
   **IV.F revisado y mergeado por Laura a `main`** (2026-10-07,
   `origin/main` en `d89ac5f`).
   **Siguiente paso exacto:** Laura mergea
   `worktree-acto-juridico-I-8-6` (unificación de I.8.6 con II.E.2.1);
   la revisión final (ejemplos genéricos de I y VI) quedó hecha el
   2026-10-08; sigue Bienes (punto 5).
   **Pendiente explícito nacido de 5.5:** incorporar a IV.F las pp.
   211-214 de VIAL (elementos material y subjetivo, cita de Vergara
   Baeza, ejemplo del que enajena antes de la interdicción por
   disipación, Vial entre los que sostienen la nulidad absoluta); esas
   cuatro páginas ya están guardadas en `Apuntes/CIVIL/Acto Jurídico/`
   como `VIAL_fraude_a_la_ley_p211.png` a `..._p214.png` (copiadas el
   2026-10-07, a pedido de Laura). Pasada chica, después de 5.6.
5. Después, **el manual de Bienes** (`05_Bienes_Manual.html`) con el
   mismo método. **Empezar por `docs/manuales/estado_bienes.md`**
   (creado 2026-10-07), que obliga a leer antes
   `docs/manuales/lecciones-acto-juridico.md`.

## Cómo se trabaja cada tramo (ya probado tres veces)

1. Rama nueva desde `origin/main`, en un worktree (`EnterWorktree`).
2. Extraer con `fitz` el texto del PDF fuente del tramo (rutas abajo) y
   leerlo completo; extraer el tramo actual del manual por línea (buscar
   sus anchors `id="cIV-..."`).
3. **Inventario unidad por unidad** desde la fuente (nunca desde el
   manual) y cruce con el manual: Está / Parcial / Falta. Inventariar
   también los anexos del tramo.
4. Verificar cada artículo citado contra `Apuntes/CODIGOS/` (Código Civil, C.P.C., Constitución, Comercio)
   con regex `Art. N.` sobre el texto extraído con `fitz` (limpiando
   líneas de pie de página "DFL 1, JUSTICIA...").
5. **Chequear paráfrasis cercana** (`guia-editorial.md` 3): comparar
   oración por oración contra la fuente. Si reproduce la posición de
   un autor con nombre, atribuirla con claridad (cita textual en
   `.definicion` si se tiene el texto exacto); si es prosa de conexión
   sin autor, reestructurar de verdad, no solo cambiar sinónimos.
6. Escribir el **informe** `docs/actualizacion_acto_juridico_<tramo>_<fecha>.md`
   (alcance y fuentes, inventario por punto, anexos, pasajes con
   paráfrasis cercana señalados, cambios propuestos con
   recuadros/ejemplos/artículos, pendientes para Laura). Commit, y
   mostrárselo a Laura **como HTML** (no quiere leer `.md` en GitHub):
   convertir con Python `markdown` a
   `DERECHO LIBRE/Informes/Informe_AJ_<tramo>.html` (fuera del repo,
   siempre en la carpeta `Informes/`, nunca suelto en la raíz) y abrir con `open` (usar `subprocess.run` desde
   Python en vez de shell directo: el shell del worktree bloquea
   invocaciones de Chrome/`open` con muchos flags encadenados por la
   regla de aislamiento del worktree). **Detenerse y esperar
   aprobación.**
7. Con la aprobación: reescribir el tramo con `Edit` (old_string/
   new_string exactos); verificar con script Python: balance de
   etiquetas (`p`, `div`, `span`, `em`, `strong`, `table`, `tr`, `th`,
   `td`, `h2`), cero guiones largos y guillemets, ningún párrafo sobre
   1.200 caracteres, frases clave de cada unidad del inventario
   presentes, contenido previo conservado (revisar el `git diff` línea
   por línea de lo eliminado). Capturas en Chrome headless (ver
   comando abajo) recortadas con PIL en bloques de ~1900 px; rehacer el
   índice desde los encabezados si se agregó o cambió algún `h2`/`h3`.
   Agregar al informe las decisiones de Laura y la segunda pasada;
   commit y push.
8. Copiar el manual a `DERECHO LIBRE/Vista_previa/AJ_vista_previa.html`
   (fuera del repo, sobrescribiendo la anterior) y abrirlo en el navegador en el tramo (con ancla `#cIV-...`).
   Laura revisa y pide ajustes finos (negritas, cursivas, ejemplos) antes
   de mergear: aplicarlos con `Edit`, volver a verificar, commit y push
   de nuevo. Cuando esté conforme, Laura mergea con GitHub Desktop.

### Comando de Chrome headless que funciona en este entorno

El shell del worktree bloquea `cd ... && chrome ...` y comandos
encadenados complejos. Usar Python puro:

```python
import subprocess
r = subprocess.run([
    '/Applications/Google Chrome.app/Contents/MacOS/Google Chrome',
    '--headless=new', '--disable-gpu',
    '--screenshot=/ruta/salida.png', '--window-size=900,ALTO',
    'file:///ruta/preview.html'
], capture_output=True, text=True, timeout=60)
```

Para abrir un archivo en el navegador con ancla, tampoco usar `open
archivo.html#ancla` directo (el shell lo trata como parte del path):
usar `subprocess.run(['open', 'file://' + urllib.parse.quote(ruta) + '#ancla'])`.

Para verificar solo un tramo sin cargar todo el manual (más rápido):
extraer el `<style>` completo y el fragmento del tramo (entre sus
anchors) a un HTML aparte y hacer el screenshot de eso.

## Decisiones de formato y redacción que NO deben cambiar

Todas están también en `docs/manuales/decisiones.md`, con fecha. Las que
más afectan el trabajo por tramos:

- **Formato visual = el de Acto Jurídico** (es el modelo de
  `formato.md`); solo el romano del capítulo en rojo, todo lo demás
  negro (también en el índice). Etiquetas: `h1` capítulo, `h2.grupo`
  tema, `h2.inst` institución (`A.1`), `h2` punto, `h3` subpunto.
- `(i)` en negrita si abre una clasificación; subrayado (`.enum-i
  lista`) si es lista de requisitos o argumentos. `a)` subrayado, `a.1)`
  cursiva.
- `.ley` solo para artículos **completos**, con la frase u oración más
  importante en negrita dentro de la cita (decisión de esta sesión,
  2026-09-30, a partir del art. 1687 del tramo 3: destacar en negrita lo
  esencial de cada artículo transcrito, no solo dejarlo en texto
  corrido).
- **Leyes especiales** (no códigos): sin `.ley` completo, solo lo
  importante o un resumen en el texto (decisión de Laura 2026-10-06,
  `formato.md` 4).
- `.definicion` solo para la oración que define el concepto del punto
  (normalmente una por punto); lleva filete a la izquierda igual que
  `.ley`. Se usa también para atribuir con claridad la posición de un
  autor con nombre, citada textual entre comillas (decisión
  2026-09-30 a raíz del chequeo de paráfrasis cercana).
- **Cuadros comparativos** (`<table>`): el **cuerpo** (`td`) usa la
  misma tipografía que el texto principal (Times New Roman, 11pt); el
  **encabezado** (`th`) mantiene su propio estilo de etiqueta: letra
  sans-serif, fondo de color, texto en **mayúscula**
  (`text-transform:uppercase`). No igualar la letra del encabezado a la
  del cuerpo: es al revés de lo que parece un bug a primera vista. Se
  usan para paralelos o discusiones doctrinales con 3 o más criterios.
- **Todos los ejemplos deben ser propios** (nombres chilenos, toque
  gracioso), nunca los de la fuente con las letras cambiadas: la
  consecuencia jurídica respaldada en un artículo citado en el mismo
  punto y verificado contra el Código.
  **Incluye los ejemplos genéricos "de texto" de Boetsch** (decisión de
  Laura 2026-10-06): también se reemplazan. En I y VI se habían dejado
  algunos (VI: la estrella con la mano, la aseguradora, la venta/Europa;
  revisar I); **se dejan para la revisión final del manual**
  (decisión de Laura, 2026-10-06).
- **Jurisprudencia:** recuadro solo si el fallo tiene rol o está
  desarrollado (basta una de las dos condiciones); listas de fallos sin
  contenido: solo los con rol, del más reciente al más antiguo, con
  `[FALTA: extracto del fallo]`; los demás en una línea.
- **Cuadros comparativos, No olvidar, Conexiones, Pausa y Jurisprudencia
  NO cuentan** contra el máximo de dos recuadros pedagógicos grandes por
  punto (Ejemplo, No confundir, Pregunta clásica). La **Advertencia
  está retirada** (2026-10-06): va como No confundir; las cuatro que
  había en AJ ya se cambiaron.
- **Preguntas clásicas:** candidatas desde `preguntas_evaluacion` (Laura
  elige), pero **no hay banco de AJ**; si la fuente marca una pregunta de
  examen, se le propone a Laura.
- **Nunca nombrar a Bozzo e Ibarra en el manual** (sí en los informes
  internos, indicando el anexo de origen).
- Al terminar cada manual, Laura revisa todos los recuadros creados por
  el modelo (cada informe trae la tabla con su ubicación).
- Si Laura pregunta por qué un punto es corto: el largo sigue a Boetsch;
  solo se amplía con fuentes que ella entregue (anexos, Código, otros
  autores), nunca de memoria.
- Cero guiones largos y cero guillemets en cualquier parte del manual.
- **Paráfrasis cercana**: un párrafo parecido a la fuente no es, por sí
  solo, el problema. Si reproduce la posición de un autor con nombre,
  el arreglo es atribuirlo con claridad; si es prosa de conexión sin
  autor, el arreglo es reestructurar de verdad, no solo cambiar
  sinónimos (`decisiones.md`, 2026-09-30; detalle arriba).

## Pendientes sueltos

- **Bug de tipografía de `<table>`** (letra y tamaño de las celdas
  distintos al texto principal): corregido solo en Acto Jurídico. **Sigue
  sin corregir a propósito en Responsabilidad Civil (3 tablas) y Bienes
  (2 tablas)** — Laura dijo "solo los de AJ" cuando se le preguntó; no
  tocar esos manuales sin que ella lo pida.
- **Laura busca jurisprudencia reciente con rol** para IV.A (hay un
  `[FALTA: ...]` en 4.4) y los extractos de los 5 fallos con rol de 4.4.
- ~~`[VERIFICAR: rol]` en V.4.4~~: **resuelto** (2026-10-07). Laura
  encontró el rol: Corte Suprema, 9 de enero de 2017, rol Nº
  14.853-2016 (casación); ya está en la caja.
- **Conexiones con `[FALTA: sección]` y `p. __`** hacia apuntes que no
  existen todavía (Familia, Compraventa, Sociedades, Procesal,
  Sucesorio, Obligaciones, Contratos). Se completan cuando existan y
  esté cerrada la diagramación.
- **Script de anclas de Justiniano** (`scripts/agregar_anclas_manuales.js`
  y `scripts/extraer_contenido_interrogador.js`) no entiende números
  romanos; no afecta a AJ hasta que entre al Interrogador
  (`formato.md` 1.1).
- `guia-editorial.md` 4.9 dice que la Pausa tiene retroalimentación de
  IA, pero la app corrige por palabras clave. Laura no decidió qué
  hacer.
- Rama sin mergear que no es de este hilo: `worktree-manual-obligaciones`
  (ver `docs/manuales/estado_obligaciones.md` si existe, o crearlo al
  retomarlo). `worktree-acto-juridico-cap4` (este hilo) ya se mergeó a
  `main` el 2026-10-05 (commit `7675b08`); `worktree-acto-juridico-cap1`
  (capítulo I) ya está en `main` (verificado 2026-10-06).
  `worktree-virtual-enchanting-kite` ya no existe (se había borrado
  antes).

## Contexto clave

- Fuentes de AJ: `Apuntes/CIVIL/Acto Jurídico/` (gitignoreado: existe en
  el checkout principal, no en los worktrees — usar la ruta absoluta del
  checkout principal, `.../Derecho Libre/Apuntes/CIVIL/Acto Jurídico/`,
  desde cualquier worktree). Boetsch en 17 partes
  `Acto Jurídico_principal_N_*.pdf` (también está el PDF completo de 221
  págs.). Anexos: `Anexo_secundario_AJ_Ineficacia.pdf` (Bozzo e Ibarra
  2022; el `.docx` y `..._elementos principales e ineficacia.pdf` tienen
  el mismo texto: usar una sola copia), `INEFICACIA JURÍDICA_Cuadro
  comparativo.pdf`, `Causa_ DOMINGUEZ y BOETSCH.pdf`, `Memorice_ART y
  Definiciones.pdf`.
- Códigos para verificar artículos (desde 2026-10-06): `Apuntes/CODIGOS/`
  del checkout principal: `Codigo Civil Chileno.pdf` (leychile,
  14-jul-2026), `CPC.pdf`, `CPR.pdf` y `CÓDIGO DE COMERCIO.pdf`. Si hace
  falta otro, pedírselo a Laura (ella lo agrega a la carpeta).
- Reglas: `docs/manuales/` (`proceso.md`, `formato.md`,
  `guia-editorial.md`, `actualizar-manuales-existentes.md`,
  `auditoria.md`, `decisiones.md`).
- La hoja de estilos de AJ ya tiene todas las clases del método nuevo
  (`.ley`, `.definicion`, `.pregunta-clasica`, `.no-olvidar`,
  `.conexiones`, `.enum-i lista`, `-run`, `.toc-lista`, `table`/`th`/`td`
  con la tipografía corregida **y el ancho de columnas corregido**,
  2026-10-05). El lector en línea (`app/manuales.html`) también las
  tiene (AJ todavía no está conectado a la app).
- **No se puede commitear en el `main` compartido** (el sistema lo
  bloquea): trabajar siempre en una rama/worktree y que Laura mergee con
  GitHub Desktop. Nunca commitear `.claude/settings.local.json`.
- Verificación visual: Chrome headless (comando en la sección de
  proceso, arriba) sobre una página armada con el `<style>` del manual y
  el tramo, recorte con PIL en bloques de ~1900 px.
- Scripts de trabajo de cada tramo (inventario, verificación, índice) no
  quedan en el repo: son uso único, se rehacen rápido con Python inline.
