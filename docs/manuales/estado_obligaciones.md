# Estado: manual de Obligaciones (materia nueva)

> Se actualiza **in place** cada vez que Laura diga "guarda el estado
> [de Obligaciones]". Al decir "retoma Obligaciones", leer este archivo
> completo primero y resumir en pocas líneas dónde quedó antes de seguir.
> Última actualización: 2026-11-28 (tramos 1, 2, 3a y 3b aprobados y
> mergeados; 3c aprobado el 2026-11-28, falta mergearlo; siguiente:
> informe del 4a).

## Resumen para retomar (léelo primero)

- **Es materia nueva**, no una actualización: el proceso es
  `docs/manuales/proceso.md` (no `actualizar-manuales-existentes.md`),
  con todo lo de `lecciones-acto-juridico.md` aplicado desde el primer
  tramo (checklist único de su sección 6).
- **Laura dio la partida el 2026-11-27** ("Empecemos a redactar el
  manual de obligaciones"). Bienes sigue en paralelo (va en su tramo
  13a). Orden de materias y cuota diaria: memoria
  `lanzamiento-digesto-2027-01-26`.
- **Hecho y aprobado (2026-10-10):** texto extraído, mapa completo de la
  fuente por página real, mapa de Orrego, anexos chicos asignados,
  solapes con otros manuales y reparto de 34 tramos. Informe:
  `DERECHO LIBRE/Informes/Informe_Obligaciones_organizacion.html`.
  Decisiones en "Decisiones tomadas con Laura", más abajo.
- **Nombre del manual: `06_Obligaciones_Manual.html`** (confirmado por
  Laura). **Creado el 2026-11-27 en la rama `obligaciones-tramo1`**
  (worktree `.claude/worktrees/obligaciones-tramo1`), solo con portada,
  índice vacío y la hoja de estilos de Bienes sin las clases antiguas
  (h2.subinst, h6, div.h7, div.h8). En `main` no existe hasta que se
  mergee con el tramo 1 escrito. No hay que conectarlo a nada todavía:
  ni la app, ni Vercel, ni los arreglos `FUENTES` nombran a AJ o Bienes.
- **Ojo, hay un borrador viejo** (ver "Borrador anterior", más abajo):
  no se actualiza, se escribe el tramo 1 de cero y el borrador solo se
  usa como referencia.
- **Tramo 1 (p. 13-19): aprobado y mergeado** por Laura (2026-11-27,
  merge `b283629`). Al revisarlo pidió el **formato nuevo de los rótulos
  de los cuadros** (corto, mayúscula, negrita, fondo propio): aplicado y
  anotado en `formato.md` 4.1, `guia-editorial.md` 4.12, `proceso.md`
  4.1 y `decisiones.md` (rama `formato-cuadro-rotulos`, incluida en
  `obligaciones-tramo2`).
- **Tramo 2 (p. 19-26 + anexo de Vial completo): aprobado y mergeado**
  (2026-11-27, merge `49f2683`; Laura: "Lo que decidiste está
  perfecto"). Cierra el capítulo I. Detalle en "Tramo 2", más abajo.
- **Reparto rehecho en 69 tramos chicos por subtema, con las fuentes
  integradas** (2026-11-27), ver "Reparto de tramos". Ya está en
  Airtable.
- **Orden de trabajo (Laura, 2026-11-27):** como en Bienes, **primero el
  informe y Laura decide; después se redacta**. Los tramos 1, 2 y 3a se
  redactaron antes del visto bueno (se tomó "continúa" como permiso):
  no se repite (memoria `informe-antes-de-redactar`).
- **Tramo 3a (p. 27-31 + Vial nº 67-69): aprobado y mergeado**
  (2026-11-27, `main` en `00e9f4c`; Laura: "Ya mergeé el 3a"). Sus
  decisiones quedan firmes (ver "Tramo 3a"). Marcado Hecho en Airtable.
- **Ojo, corrección de los tramos 1 y 2 (en la misma rama 3a):** el
  script de paráfrasis tenía un error (el filtro de citas entre comillas
  se comía párrafos enteros cuando las comillas quedaban desparejas), y
  en 1 y 2 midió muchas menos oraciones de las reales. Ya corregido
  (filtra cita por párrafo). Al medir de nuevo salieron 13 oraciones del
  tramo 1 y 22 del tramo 2 (13 frente a Boetsch, 9 frente a Vial) sobre
  70%; se reescribieron todas, sin perder unidades. Mergeado con el 3a.
- **Tramo 3b: aprobado y mergeado** (2026-11-28, merge `ce732cc`;
  Laura: "aprobado el tramo 3b"). Marcado Hecho en Airtable.
- **Tramo 3c: aprobado** (2026-11-28; Laura: "ok perfecto. Aprobado").
  Cierra el tema II.A. Marcado Hecho en Airtable. **Falta mergear** la
  rama `obligaciones-tramo3c` a `main` (Laura, con GitHub Desktop).
- **Siguiente:** informe del 4a (solo el informe). Ver "Siguiente paso
  exacto".

## Decisiones tomadas con Laura (2026-10-10)

1. **Solapes S1 a S6: todos se desarrollan completos** en este manual,
   siguiendo a Boetsch Obligaciones, con una caja **Conexiones** al
   cierre del punto hacia el otro manual (sección y `p. __`). No se
   resume ni se remite en lugar de desarrollar.
2. **S2 es chico:** Bienes trata la prescripción **adquisitiva** y este
   manual la **extintiva**; solo comparten las **reglas comunes a toda
   prescripción** (Boetsch IV.I.6, p. 225-229, unas 4 páginas). Se
   desarrollan completas aquí también (decisión 1), con Conexión a
   Bienes V.5.B.4.
3. **Orrego entra completo** (sus 10 capítulos), cada capítulo en el
   tramo de su letra de Boetsch IV.
4. **El cuestionario de Orrego (p. 76-82 del PDF, 178 preguntas) va
   para las preguntas de Práctica, no para el manual.** Ojo (Laura): no
   podemos atribuírnoslo ni copiarlo. Se usa solo como referencia de
   qué se pregunta; cada pregunta se reescribe con caso, ejemplo y
   redacción propios. Cuando se trabajen las preguntas de Obligaciones,
   anotarlo en un `docs/preguntas-obligaciones.md`.
5. **Reparto de 34 tramos: aprobado** tal como está abajo. Los cortes
   se pueden ajustar al llegar a cada tramo, igual que en Bienes.
6. **Número y nombre:** `06_Obligaciones_Manual.html`.

## Borrador anterior (2026-09-28): no se actualiza, se parte de cero

- Existe una rama **`worktree-manual-obligaciones`** (worktree en
  `.claude/worktrees/manual-obligaciones`, commits `ddfa673` y
  `31654c5`, 2026-09-28, **nunca mergeada a `main`**) con un
  `06_Obligaciones_Manual.html` que tiene portada, índice y **solo el
  tramo I.A La obligación** (Boetsch p. 13-19). Nada más.
- Es anterior a las reglas vigentes: usa la caja **Dato de grado**
  (retirada), títulos en mayúsculas copiados de Boetsch, sin inventario,
  sin voz propia ni paráfrasis controlada (reglas del 2026-09-30 en
  adelante), y la hoja de estilos de esa fecha, no la actual de AJ/Bienes.
- **Decisión (Laura, 2026-10-10):** no se pasa por `actualizar-manuales-existentes.md`
  (ese proceso es para manuales grandes ya armados, como AJ). Se crea
  el manual nuevo desde `main` con la hoja de estilos vigente y el
  tramo 1 se escribe de cero con el método completo.
- **Cómo se usa el borrador:** solo como referencia en el tramo 1. Al
  hacer el inventario, comparar su texto con Boetsch p. 13-19 y listar
  en el informe del tramo todo lo que el borrador tenga y la fuente no
  (puede ser algo que Laura agregó, o algo inventado): Laura decide qué
  se rescata. **Copia archivada (idéntica al último commit de la rama):
  `archivo/06_Obligaciones_Manual_borrador_2026-09-28.html`.** Usar
  esa, no la rama.
- **Laura confirmó partir de cero (2026-10-10).** La rama
  `worktree-manual-obligaciones` y su worktree **se borraron**
  (local y en GitHub, con autorización de Laura, 2026-10-10). Lo único
  que queda del borrador es la copia en `archivo/`.

## Material fuente

Todo en `Apuntes/CIVIL/Obligaciones/` (carpeta fuera de git, está en
`.gitignore`).

- **Principal: Boetsch, "Obligaciones. Concepto, clasificaciones, modos
  de extinguir, prelación de créditos y prueba"** (Laura confirmó que
  ambos PDFs son de Boetsch, 2026-10-10). Es **un solo apunte numerado
  de corrido, "Página N de 305"**, partido en dos PDFs:
  - `Obligaciones 1/Obligaciones1_principal.pdf`: p. 1 a 135.
  - `Obligaciones 2/Obligaciones2_Principal.pdf`: p. 136 a 305.
  - Temario en p. 3 a 12; el cuerpo empieza en p. 13.
- **Alcance confirmado por Laura (2026-10-10):** Obligaciones 2 cubre
  modos de extinguir, prelación de créditos y prueba. Boetsch **no trae
  un capítulo de efectos de las obligaciones** (cumplimiento forzado,
  indemnización): eso vive en `01_Responsabilidad_Contractual_Manual.html`.
- **Texto extraído** (una sola vez, para no reabrir los PDF):
  `Apuntes/CIVIL/Obligaciones/_texto_extraido/`, un `.txt` por PDF, con
  marcas `===== PDF p. N =====`; el principal además trae el encabezado
  "Página N de 305" de Boetsch. Está en el checkout principal, no en
  ramas ni worktrees (Apuntes no se versiona).
- **Para volver a extraer** (`fitz` no está instalado en el sistema):
  `python3 -m venv /tmp/venv && /tmp/venv/bin/pip install pymupdf`, y
  extraer con `fitz.open(ruta)` página por página. El `.docx` se pasa a
  texto con `textutil -convert txt`.

## Mapa de la fuente (página real de Boetsch)

Verificado contra el temario (p. 3 a 12) y ubicado en el cuerpo.

| Sección | Páginas |
|---|---|
| I. Nociones generales. A. La obligación (1-7) | 13-19 |
| I.B Fuentes de las obligaciones (1 concepto, 2 clasificación, 3 fuentes clásicas p. 21, 4 otras fuentes p. 23) | 19-27 |
| II.A Civiles y naturales (1-3; 4 art. 1470 p. 31; 5 sentencia p. 34; 6 efectos p. 35) | 27-36 |
| II.B.1 Positivas y negativas | 36-37 |
| II.B.2 Dar, hacer, no hacer | 37-39 |
| II.B.3 Objeto singular y compuestas (alternativas, facultativas) | 39-44 |
| II.B.4 Especie y género; obligaciones de dinero e intereses (p. 45) | 44-53 |
| II.C intro + C.1 Simplemente conjuntas | 53-56 |
| II.C.2 Solidarias: 1 reglas generales (56), 2 activa (59), 3 pasiva (64) | 56-72 |
| II.C.3 Divisibles e indivisibles: 1-5 (72-78), 6 excepciones art. 1526 (78), 7 paralelo con solidaridad (83) | 72-84 |
| II.D Principales y accesorias | 84-85 |
| II.E Modalidades: generalidades | 85-87 |
| II.E.1 Condicionales: 1-3 (87), 4 clasificación (90), 5 reglas comunes (96), 6 suspensiva (102), 7 resolutoria (105; 7.4 efectos entre partes 108, terceros 109) | 87-116 |
| II.E.2 Plazo (3 clasificación 116, 4 efectos 120, 5 extinción 122) | 116-125 |
| II.E.3 Modales | 125-129 |
| II.F Otras categorías (instantáneas/sucesivas 129, medio/resultado 130, propter rem 131, causales/abstractas 131) | 129-133 |
| III. Modificación (objetiva, subjetiva: transmisión p. 134, cesión entre vivos p. 135) | 133-135 |
| IV. Modos de extinguir: 1-3 generalidades | 136-137 |
| IV.A Resciliación | 137-140 |
| IV.B.1 Pago efectivo (6 por quién 143, 7 obligaciones de dar 147, 8 a quién 149, 9-15 época a efectos 153-157) | 140-157 |
| IV.B.2 Pago por consignación (3 fases 158-164) | 157-166 |
| IV.B.3 Pago con subrogación (4 clases 167, 5 efectos 176, 6 paralelo 178) | 166-179 |
| IV.B.4 Cesión de bienes (y pago por acción ejecutiva) | 179-182 |
| IV.B.5 Beneficio de competencia | 182-183 |
| IV.C Dación en pago | 183-190 |
| IV.D Novación (4 clases 194, 5 efectos 198) | 190-201 |
| IV.E Compensación (4 requisitos 203, 5 prohibida 207, 6 efectos 208) | 201-210 |
| IV.F Remisión | 210-212 |
| IV.G Confusión | 212-215 |
| IV.H Imposibilidad y pérdida de la cosa debida (4 clases 216, 5 teoría de los riesgos 219) | 215-223 |
| IV.I Prescripción extintiva: 1-5 (223), 6 reglas comunes (225), 7.1 acción prescriptible y 7.2 inactividad (229), 7.3 tiempo (238), 8 cláusulas (247), 9 caducidad (248) | 223-250 |
| V. Prelación de créditos: 1-9 (250), 10.1 primera clase (254), 10.2 segunda (260), 10.3 tercera (263), 10.4 cuarta (267), 10.5 quinta (273) | 250-276 |
| VI. Prueba: 1-5 (276), 6 objeto (279), 7 carga (284), 8 medios (286): instrumental (288; públicos 288, privados 292), testigos (296), inspección personal (299), peritos (299), confesión (300), presunciones (304) | 276-305 |

## Anexos

**Grande (regla de `proceso.md` sección 5):** `Obligaciones 2/Extinción
de las obligaciones_ORREGO.pdf`, 82 páginas. **Usa páginas del PDF, no
la numeración de Boetsch.** Mapa (confirmado por Laura 2026-10-10: entra completo):

| Orrego | Páginas PDF | Corresponde a Boetsch | Clasificación propuesta |
|---|---|---|---|
| I. Generalidades | 2-4 | IV.1-3 | Relacionada |
| II. Mutuo disenso o resciliación | 4-6 | IV.A | Relacionada |
| III. El pago (A pago efectivo 6, B consignación 15, C subrogación 18, D beneficio de competencia 24) | 6-25 | IV.B | Relacionada |
| IV. Dación en pago | 25-28 | IV.C | Relacionada |
| V. Novación | 28-36 | IV.D | Relacionada |
| VI. Remisión | 36-40 | IV.F | Relacionada |
| VII. Compensación | 40-45 | IV.E | Relacionada |
| VIII. Confusión | 45-47 | IV.G | Relacionada |
| IX. Pérdida de la cosa que se debe | 47-49 | IV.H | Relacionada |
| X. Prescripción extintiva | 49-76 | IV.I | Relacionada |
| Cuestionario (178 preguntas) | 76-82 | todo IV | **Para Práctica**, no para el manual (decisión 4): solo como referencia, nunca copiado ni atribuido |

Orrego no trata la cesión de bienes (Boetsch IV.B.4) como capítulo
propio: solo la menciona de pasada en el pago y en el beneficio de
competencia (verificado con búsqueda en el texto, 2026-10-10).

**Chicos** (cada uno se inventaría completo cuando toca su tramo):

| Anexo | Tramo | Nota |
|---|---|---|
| `Fuentes de las obligaciones_Vial del Rio.pdf` (8 p.) | 2 | Cátedra |
| `Obligaciones Civiles vs Naturales_Vial del Rio.pdf` (5 p.) | 3 | Cátedra |
| `Obligaciones naturales_Ramos Pazos.pdf` (2 p.) | 3 | Cátedra |
| `Conversión obligación natural a civil_Abeliuk.pdf` (1 p.) | 3 | Cátedra |
| `Clasificación de las obligaciones atendiendo a su eficacia.pdf` (6 p.) | 3 | Apunte de interrogación (Bozzo e Ibarra, Isidora Barrios): cruzar con fuente de cátedra |
| `Clasificación de las obligaciones según los sujetos.pdf` (9 p.) | 6 a 9 | Apunte de interrogación (Bozzo e Ibarra): cruzar con fuente de cátedra |
| `Sentencia_codeudasolidaria_vs_fiadorsolidario.pdf` (2 p.) | 7 | Jurisprudencia (Santiago, 11 de julio de 2007) |
| `OBLIGACIONES INDIVISIBLES.docx` | 8 | Autor no indicado: cruzar con fuente de cátedra |
| `Obligaciones Indivisibles_Carmen Dominguez.pdf` (3 p.) | 8 | Cátedra |
| `Cuadro_Indivisibilidad_vs_Solidaridad.pdf` (1 p.) | 9 | Cuadro, para el paralelo de C.3.7 |
| `Obligaciones 2/Clasificación de la prescripción extintiva.pdf` (3 p.) | 27 y 28 | Autor no indicado: cruzar con fuente de cátedra |

## Solapes con otros manuales (decidido: todos completos, ver decisiones 1 y 2)

El precedente del repo es la caja **Conexiones** (`guia-editorial.md`
4.8): sección y página del otro manual, sin enlaces. Laura decidió
(2026-10-10) que en este manual cada solape se desarrolla **completo**,
con la Conexión al cierre del punto (decisión 1).

| # | Tema | Boetsch Oblig. | Ya está en |
|---|---|---|---|
| S1 | Modalidades: condición, plazo, modo | II.E, p. 85-129 (unas 44 p., 5 tramos) | AJ, capítulo VI (A condición, B plazo, C modo); su fuente, Boetsch AJ parte 17, tiene solo 13 p. (209-221 de 221) |
| S2 | Reglas comunes a toda prescripción | IV.I.6, p. 225-229 | Bienes V.5.B.4. Solo las reglas comunes (unas 4 p.): Bienes es adquisitiva, este manual extintiva |
| S3 | Derechos reales y personales | I.A.1-4, p. 13-16 | Bienes II.A.4.2-4.3 (aprobado) |
| S4 | Condición resolutoria y resolución; medio y resultado; imposibilidad | II.E.1.7 (105-116), II.F.2 (130), IV.H (215-223) | Contractual D (resolución, condición resolutoria tácita, pacto comisorio), B.3 (medio y resultado), C.6 (imposibilidad) |
| S5 | Cesión de créditos | III.3.2, p. 135 | Bienes V.4.D.4 (tradición de derechos personales, arts. 1901 y siguientes) |
| S6 | Formalidades por vía de prueba, limitación de la prueba de testigos | VI.8, p. 288-299 | AJ (formalidades: arts. 1701, 1708, 1709, 1711) |
| S7 | Requisitos del objeto (art. 1461), imposibilidad, prenda general (hallado en el tramo 1, 2026-11-27) | I.A.5 y I.A.6.2, p. 16-19 | AJ II.C.2 y II.C.3 (objeto sobre cosa y sobre hecho); Contractual C.6 (imposibilidad) y G.1 (derecho de prenda general). Se desarrolla completo aquí, con Conexión (misma regla de la decisión 1) |

## Reparto de tramos (rehecho 2026-11-27: tandas chicas, fuentes integradas)

Dos indicaciones de Laura del 2026-11-27 (memoria `tandas-pequenas`):

- "Varias tandas pequeñas son mejores que pocas grandes", como en
  Bienes: unas **4 a 6 páginas de Boetsch** por tramo, con sufijo a/b/c.
- "Estamos haciendo un mix de los manuales, por lo tanto no es que
  quiera tramos de distintos autores, sino uno que diga: Orrego dice X,
  pero Boetsch/Peñailillo dicen Y". Cada tramo es un **subtema con todas
  sus fuentes integradas**. Un primer reparto de este mismo día ponía
  cada capítulo de Orrego en su propio tramo; **eso estaba mal** y se
  corrigió: las páginas de Orrego se repartieron por subtema dentro de
  los tramos de Boetsch, según sus títulos (mapeados el 2026-11-27). Lo
  mismo vale para todos los anexos.

Las páginas de corte son aproximadas: **al llegar a cada tramo se ajusta
el corte a un límite de título**, y si sale grande se parte por
subtema (nunca por autor) y se le avisa a Laura. El mismo reparto (69
tramos) está en el **mapa de metas de Airtable**; si se parte o se junta
un tramo, actualizar también ahí.

| # | Boetsch p. | Contenido | Anexo integrado | Hecho |
|---|---|---|---|---|
| 1 | 13-19 | I.A La obligación |  | ✅ |
| 2 | 19-26 | I.B Fuentes de las obligaciones | Vial (fuentes) | ✅ |
| 3a | 27-31 | II intro; II.A.1-3 Civiles y naturales: concepto | Vial (civiles vs. naturales), nº 67-69 | ✅ |
| 3b | 31-34 | II.A.4 Obligaciones naturales del art. 1470, número por número | Vial nº 70 (primer párrafo); apunte de eficacia (sin unidades nuevas) | ✅ |
| 3c | 34-36 | II.A.5-7 Desde cuándo es natural la obligación; efectos; conversión en civil | Vial (final del nº 69); Ramos Pazos; Abeliuk; apunte de eficacia p. 5-6 | ✅ |
| 4a | 36-39 | II.B.1-2 Positivas y negativas; dar, hacer y no hacer | Vial (última página: dar y entregar) |  |
| 4b | 39-44 | II.B.3 Objeto singular y compuestas (alternativas, facultativas) |  |  |
| 5a | 44-48 | II.B.4 Especie o cuerpo cierto y género |  |  |
| 5b | 48-53 | II.B.4 Obligaciones de dinero e intereses |  |  |
| 6a | 53-59 | II.C intro; C.1 Simplemente conjuntas; C.2.1 Solidaridad, reglas generales | Apunte según los sujetos (parte) |  |
| 6b | 59-64 | II.C.2.2 Solidaridad activa |  |  |
| 7a | 64-68 | II.C.2.3 Solidaridad pasiva (1) | Sentencia codeudor vs. fiador solidario |  |
| 7b | 68-72 | II.C.2.3 Solidaridad pasiva (2) | Apunte según los sujetos (parte) |  |
| 8a | 72-75 | II.C.3.1-3 Indivisibilidad: nociones, fuentes, clases | Obligaciones indivisibles (docx) |  |
| 8b | 75-78 | II.C.3.4-5 Indivisibilidad: efectos | C. Domínguez |  |
| 9 | 78-84 | II.C.3.6-7 Excepciones a la divisibilidad (art. 1526); paralelo | Cuadro indivisibilidad vs. solidaridad |  |
| 10a | 84-90 | II.D Principales y accesorias; II.E generalidades; E.1.1-3 Condición |  |  |
| 10b | 90-96 | II.E.1.4 Clasificación de las condiciones |  |  |
| 11a | 96-102 | II.E.1.5 Reglas comunes a las condiciones |  |  |
| 11b | 102-105 | II.E.1.6 Condición suspensiva |  |  |
| 12a | 105-110 | II.E.1.7 Condición resolutoria |  |  |
| 12b | 110-116 | II.E.1.7 Efectos entre partes y respecto de terceros |  |  |
| 13a | 116-120 | II.E.2.1-3 Plazo: concepto y clasificación |  |  |
| 13b | 120-125 | II.E.2.4-5 Plazo: efectos y extinción |  |  |
| 14a | 125-129 | II.E.3 Modo |  |  |
| 14b | 129-133 | II.F Otras categorías (sucesivas, medio y resultado, propter rem, abstractas) |  |  |
| 15a | 133-137 | III Modificación; IV.1-3 Modos de extinguir, generalidades | Orrego I (p. 2-4) |  |
| 15b | 137-140 | IV.A Resciliación | Orrego II (p. 4-6) |  |
| 16a | 140-145 | IV.B.1 Pago: concepto y quién puede pagar | Orrego III.A.1-2 (p. 6-8) |  |
| 16b | 145-149 | IV.B.1 Pago en las obligaciones de dar (requisitos de validez) | Orrego III.A.3 (p. 8-9) |  |
| 17a | 149-153 | IV.B.1 A quién debe hacerse el pago | Orrego III.A.4 (p. 9-11) |  |
| 17b | 153-155 | IV.B.1 Época, lugar y forma del pago | Orrego III.A.5-8 (p. 11-14) |  |
| 17c | 155-157 | IV.B.1 Imputación, prueba y efectos del pago | Orrego III.A.9-10 (p. 14-15) |  |
| 18a | 157-161 | IV.B.2 Pago por consignación: concepto y oferta | Orrego III.B.1-2.1 (p. 15-17) |  |
| 18b | 161-166 | IV.B.2 Pago por consignación: consignación y efectos | Orrego III.B.2.2 (p. 17-18) |  |
| 19a | 166-171 | IV.B.3 Pago con subrogación: concepto y clases (1) | Orrego III.C.1-3.1 (p. 18-20) |  |
| 19b | 171-176 | IV.B.3 Pago con subrogación: legal y convencional (2) | Orrego III.C.3.1-3.2 (p. 20-22) |  |
| 20a | 176-179 | IV.B.3.5-6 Subrogación: efectos y paralelos | Orrego III.C.4-8 (p. 22-24) |  |
| 20b | 179-183 | IV.B.4 Cesión de bienes; IV.B.5 Beneficio de competencia | Orrego III.D (p. 24-25) |  |
| 21a | 183-187 | IV.C Dación en pago: concepto y requisitos | Orrego IV.1-2 (p. 25-26) |  |
| 21b | 187-190 | IV.C Dación en pago: naturaleza jurídica | Orrego IV.3 (p. 26-28) |  |
| 22a | 190-194 | IV.D Novación: concepto y requisitos | Orrego V.1-2 (p. 28-30) |  |
| 22b | 194-198 | IV.D.4 Novación: clases | Orrego V.3 (p. 30-34) |  |
| 22c | 198-201 | IV.D.5 Novación: efectos; delegación | Orrego V.4-5 (p. 34-36) |  |
| 23a | 201-205 | IV.E Compensación: concepto, clases y requisitos | Orrego VII.1-3 (p. 40-44) |  |
| 23b | 205-210 | IV.E Compensación prohibida, voluntaria, judicial y efectos | Orrego VII.3-4 (p. 44-45) |  |
| 24a | 210-212 | IV.F Remisión | Orrego VI (p. 36-40) |  |
| 24b | 212-215 | IV.G Confusión | Orrego VIII (p. 45-47) |  |
| 25a | 215-219 | IV.H Imposibilidad y pérdida de la cosa debida | Orrego IX (p. 47-49) |  |
| 25b | 219-223 | IV.H.5 Teoría de los riesgos |  |  |
| 26a | 223-225 | IV.I.1-5 Prescripción extintiva: generalidades | Orrego X.1-3 (p. 50-51) |  |
| 26b | 225-227 | IV.I.6 Reglas comunes (1): alegación | Orrego X.3 b (p. 52-56) |  |
| 26c | 227-229 | IV.I.6 Reglas comunes (2): quién alega, oportunidad, renuncia | Orrego X.3 b.3-b.5 (p. 56-58) |  |
| 27a | 229-231 | IV.I.7.1 Acción prescriptible | Orrego X.3 a (p. 51-52) |  |
| 27b | 231-234 | IV.I.7.2 Inactividad: interrupción natural y civil | Orrego X.3 c.1-c.2 (p. 59-63) |  |
| 27c | 234-238 | IV.I.7.2 Efectos de la interrupción; suspensión | Orrego X.3 c.3-d (p. 63-68) |  |
| 28a | 238-242 | IV.I.7.3 Tiempo de prescripción (1) | Orrego X.3 e.1-e.3 (p. 68-71) |  |
| 28b | 242-247 | IV.I.7.3 Tiempo de prescripción (2): prescripciones especiales | Orrego X.3 e.4 (p. 71-74) |  |
| 28c | 247-250 | IV.I.8-9 Cláusulas; prescripción y caducidad | Orrego X.4 (p. 74-76); Clasificación de la prescripción extintiva |  |
| 29a | 250-254 | V.1-9 Prelación de créditos: generalidades |  |  |
| 29b | 254-260 | V.10.1 Primera clase |  |  |
| 30 | 260-267 | V.10.2-10.3 Segunda y tercera clase |  |  |
| 31a | 267-273 | V.10.4 Cuarta clase |  |  |
| 31b | 273-276 | V.10.5 Quinta clase |  |  |
| 32a | 276-282 | VI.1-6 Prueba: concepto, sistemas, pactos, objeto |  |  |
| 32b | 282-288 | VI.7-8 Carga de la prueba y medios |  |  |
| 33a | 288-292 | VI Instrumentos públicos |  |  |
| 33b | 292-296 | VI Instrumentos privados |  |  |
| 34a | 296-300 | VI Testigos e inspección personal |  |  |
| 34b | 300-305 | VI Peritos, confesión y presunciones |  |  |

## Tramo 1 (p. 13-19, I.A La obligación): aprobado y mergeado

- **Informe:** `DERECHO LIBRE/Informes/Informe_Obligaciones_tramo1.html`
  (2026-11-27). Inventario de 44 unidades; ninguna se descarta.
- **Escrito el 2026-11-27** (Laura: "continúa", sin responder las
  decisiones). Se aplicó la opción recomendada en las 6: sin material
  propio; línea con el art. 1461 inc. 3º transcrito; Ley 21.442 art. 6º
  resumido **con** el derecho a repetir contra el antecesor; cuadro con
  los rótulos "En cuanto a..."; Preguntas clásicas en los puntos 2, 3 y
  5; Conexiones al cierre de los puntos 4, 5 y 6. Si Laura cambia
  alguna, se corrige sobre lo escrito. Chequeos: cobertura 96% 🟢
  (STITCHKIN, falso aviso: es de I.B en la p. 19); 44/44 unidades;
  paráfrasis 0 de 25 oraciones sobre 70%; 0 guiones largos; párrafo
  máximo 609 caracteres. A las Preguntas clásicas se les agregaron los
  signos "¿?" y la tilde; el resto es literal. Pendiente de mirar con
  Laura: la columna "Criterio" del cuadro deja los rótulos en tres
  líneas.
- **Las 6 decisiones del informe** (numeradas como en él):
  1. ¿Material propio sobre I.A?
  2. "Física y jurídicamente posible" (Boetsch) frente a "física y
     moralmente posible" (art. 1461 inc. 3º): propuesta, mantener las
     tres características de Boetsch y agregar una línea con el texto
     del Código.
  3. Gastos comunes: decir "copropiedad inmobiliaria" y citar resumido
     el art. 6º inc. 2º de la Ley 21.442 (verificado); y si se agrega el
     derecho a repetir contra el antecesor, que Boetsch no trae.
  4. Paralelo a) a g) en cuadro comparativo, con los rótulos "En cuanto
     a..." del borrador viejo (lo único que se rescata de él).
  5. Preguntas clásicas: recomendadas las diferencias entre derechos
     reales y personales (punto 3), prenda general (punto 5) y por qué
     se oponen derecho personal y obligación (punto 2).
  6. Conexiones: una sola caja al cierre del punto 4 (Bienes II.A.4.1 a
     4.3), una en el 5 (Contractual G.1) y una en el 6 (AJ II.C.2 y
     II.C.3; Contractual C.6).
- **Ya resuelto en el informe (no volver a discutir):** art. 565 se
  transcribe con el texto vigente ("corporales o incorporales"; Boetsch
  dice "e"); art. 1698 solo inc. 1º; art. 1618 solo mencionado; Código
  italiano art. 1174 como cita textual de Boetsch, sin bloque de ley; a
  VIAL se le atribuye solo el término "relación de obligación"; la
  definición tradicional va con la fórmula fija sin autor; la de FUEYO,
  textual en `.definicion`; se sacan "Como se sabe" (6.2) y "como se
  analizará en detalle al estudiar la prueba" (7); sin `A.1`; la Pausa
  del capítulo I va en el tramo 2. No se importan a este manual las
  tres filas extra del paralelo de Bienes (fuentes, duración,
  posesión y prescripción). Se mantiene *jure in re* / *jure ad rem*
  de la fuente (Bienes dice *ius in re*).
- **Ejemplos propuestos (propios):** caja "El depa con deuda incluida"
  (propter rem, gastos comunes, 6.1); en el texto, la mochila de
  Sebastián y la recompensa (art. 632, 6.1), correr a Valparaíso en
  diez minutos frente al retrato al óleo (imposibilidad absoluta y
  relativa), los sacos de cemento de Pancho (determinable, art. 1461
  inc. 2º); caja "El mural de la abuela" (reemplaza el del pintor,
  6.2 iii). No confundir "¿Derecho de prenda general o derecho real de
  prenda?" (punto 5).
- **Banco de preguntas:** no hay archivo de Obligaciones. El texto de
  los .pages y .numbers de `Apuntes/CIVIL/PREGUNTAS /` no estaba
  extraído; se sacó con un script de una sola vez (lee los `.iwa`
  descomprimiendo Snappy). Si hace falta de nuevo, rehacerlo así o
  pedirle a Laura que exporte a PDF.

## Tramo 2 (p. 19-26, I.B Fuentes): aprobado y mergeado

- **Escrito el 2026-11-27** (Laura: "Sigamos") en la rama
  `obligaciones-tramo2`, con el mismo modo del tramo 1: informe y texto
  a la vez, con las decisiones aplicadas por defecto y marcadas en el
  informe para que Laura las cambie si quiere.
- **Anexo de Vial completo**, salvo su primer párrafo (art. 1698 y la
  extinción: se agregó a I.A.7) y su última página (inicio de su
  capítulo de clasificación: dar, entregar, hacer, no hacer), que
  **queda para el tramo 4**.
- **Decisiones aplicadas, confirmadas por Laura (2026-11-27, "Lo que
  decidiste está perfecto"):**
  clasificaciones de los contratos (arts. 1439 a 1443, de Vial) dentro
  de I.B.3.1, con No confundir "¿Acto jurídico unilateral o contrato
  unilateral?" (se solapa con el futuro manual de Contratos); cuadro
  "responsabilidad penal y civil" en I.B.3.3; párrafo de Vial agregado a
  I.A.7; 4 Preguntas clásicas (fuentes; delito y cuasidelito; declaración
  unilateral; enriquecimiento sin causa); "En nuestra opinión" de
  Boetsch atribuido a **BOETSCH**; los dos fallos sin rol sobre la
  declaración unilateral, en el texto con `[FALTA: rol, tribunal y fecha
  de ambos fallos]`.
- **Verificado:** art. 1437 vigente (Boetsch trae el texto anterior a la
  Ley 19.585); art. 2284 con sus 5 incisos; art. 2238 con el texto del
  Código ("un adulto que no tiene la libre administración...", no "un
  incapaz"); art. 99 del Código de Comercio; la cita de VIAL corregida
  contra su original. **Sin verificar:** art. 173 del Código de Minería
  y los códigos extranjeros; la regla de los actos del marido sobre los
  bienes de la mujer: **resuelto**, es el art. 1750 inc. 2º, vigente en
  el Código de `Apuntes/CODIGOS/` (versión 14-jul-2026); se citó en
  I.B.4.2 con su texto (Boetsch agregaba "hasta concurrencia del
  beneficio", que el artículo no dice) en la rama
  `obligaciones-tramo3a`, commit `5f5be86`.
- **Controles:** cobertura 98% 🟢 (art. 1698, falso aviso: es de I.A.7);
  98/98 unidades (63 de Boetsch, 35 de Vial); 9 oraciones reescritas
  por paráfrasis; párrafo máximo 911 caracteres; 0 guiones largos.
- **Mapa de metas en Airtable:** resuelto el 2026-11-27, con el OK de
  Laura: las 36 tareas estimadas se reutilizaron (renombradas) y se
  crearon 38 más, una por tramo real; tramos 1 y 2 marcados Hecho.

## Tramo 3a (p. 27-31, II intro y II.A.1-3): aprobado y mergeado

- **Escrito el 2026-11-27** en `obligaciones-tramo3a`. Abre el capítulo
  II (`cII`), con la lista de clasificaciones de Boetsch como
  enumeración, y el tema A (`cII-A`) con los puntos 1 a 3.
- **Anexo de Vial (nº 67-69 hasta su definición):** completo en este
  tramo. El final del nº 69 ("desde cuándo" es natural la obligación) y
  el nº 70 van al 3b, junto con **todo el anexo de Ramos Pazos**, que
  trata solo de eso.
- **Decisiones aplicadas, aprobadas con el merge (2026-11-27):** cuadro de
  taxatividad (tesis taxativa: CLARO SOLAR y VIAL; no taxativa: FUEYO,
  STITCHKIN, VODANOVIC), con la "mayoría" atribuida a BOETSCH y la
  contradicción de VIAL dicha en una línea; "deber moral del acreedor"
  (posible error de Boetsch) escrito solo como "un deber moral";
  Pregunta clásica "¿Qué son las obligaciones naturales?" (Grado ACA).
- **Verificado:** arts. 98, 99, 578, 1247, 1466, 1468, 1470 (con inciso
  final), 1472, 1625, 1630, 2208, 2259, 2260, 2263, 2296. **Sin
  verificar:** Ley 18.010, arts. 12 y 15 (no está en la carpeta).
- **Controles:** cobertura 100% 🟢 (p. 27-30); 55/55 unidades;
  paráfrasis 0/96 contra Vial y 12/96 contra Boetsch (listas técnicas,
  citas, autores y títulos), tras reescribir 13.
- **Script nuevo para insertar tramos:**
  `$CLAUDE_JOB_DIR/tmp/insertar_tramo.py <cuerpo.html> <id nuevo>`
  agrega al final del manual y regenera el índice. Vive en la carpeta
  temporal de la sesión: si se pierde, rehacerlo (está descrito aquí).

## Tramo 3b (p. 31-34, II.A.4): aprobado y mergeado

- **Propuesta de partir el 3b del reparto** (salió con unas 100
  unidades): **3b** = punto 4 de Boetsch, p. 31-34 (los cuatro números
  del art. 1470, hasta el fallo del corredor), 39 unidades (38 de
  Boetsch, 1 de Vial nº 70); **3c** = puntos 5 y 6, p. 34-36 (desde
  cuándo es natural, efectos, conversión), con todo Ramos Pazos, el
  final del nº 69 de Vial (desde "Debemos hacer presente que el
  enfoque...") y Abeliuk. Si Laura acepta: agregar el 3c a la tabla del
  reparto y a Airtable (70 tramos).
- **Decisiones planteadas** (numeradas como en el informe): 1 partir;
  2 tres cuadros comparativos (A disipadores, con la tesis histórica de
  BOETSCH debajo; B solemnidades según la inexistencia, sin autores;
  C "actos" unilaterales o bilaterales, con VIAL debajo); 3 corregir sin
  comentar la errata "inexistencia" (p. 33, es "existencia") y
  "compraventa" (p. 32: de un inmueble, art. 1801 inc. 2º); 4 fallo del
  corredor sin rol, `[FALTA]`; 5 **Vial nº 70 viene cortado** (el anexo
  termina en su p. 209 a mitad de frase): preguntar si hay más; 6
  **"Ramos Pazos" sería un resumen de alumna** (el apunte de eficacia lo
  titula "Tomado del manual de Ramos Pazos, Resumen Beatriz Narváez"):
  en el 3c, cruzar con cátedra y lo no corroborado (atribución de
  autores en Nº 1 y Nº 2) solo con confirmación de Laura; 7 Preguntas
  clásicas (agrupar; otros incapaces; actos o contratos), el punto 4
  pasaría de dos recuadros; 8 material propio.
- **Respuestas de Laura (2026-11-27):** 1 partir: sí (reparto
  actualizado aquí y en Airtable, 70 tramos, registro nuevo
  `rec8V2eesm9xIsM9t` para el 3c). 2 el "deber moral del acreedor" del
  3a no lo encontró porque se escribió solo "un deber moral" (se le
  explicó). 3 Vial nº 70: no hace falta buscar más. **Ramos Pazos es
  resumen de una alumna sobre un texto:** en el 3c, una opinión
  (quién sostiene qué) entra solo si también está en Boetsch; la
  información extra o una buena explicación sí se puede usar. 4 el fallo
  del corredor no lo tiene: se le dieron instrucciones para buscarlo
  en vLex; queda `[FALTA: rol y fecha del fallo]`. Resto: aprobado.
- **Redactado (2026-11-27):** punto 4 (`cII-A-4`, `cII-A-4-1`,
  `cII-A-4-2`), con los tres cuadros, caja "La donación que la tía
  Gloria no insinuó", 3 Preguntas clásicas y 2 Conexiones (AJ II.B.3.2,
  IV.A.4, IV.B.4.2; Bienes V.5.B.1). Enlace a `#cII-A-5` (punto 5) que
  queda roto hasta escribir el 3c. Controles: cobertura 85% 🟡 por un
  solo falso aviso (el subtítulo "Rol de la sentencia judicial" está en
  la p. 34 pero es del 3c; artículos 6/6, autores 9/9, densidad 148%);
  39/39 unidades; paráfrasis 1/72 sobre 70% (la lista de los tres
  incapaces relativos), tras reescribir 4; 0 guiones largos; párrafo
  máximo bajo 650 tras partir la caja de ejemplo.
- **Correcciones de Laura al revisar (2026-11-27):** (1) los `(i)` de
  los números del art. 1470 iban subrayados igual que las `a)`: pasan a
  `.enum-i` en negrita (clasificación), y las `a)` siguen subrayadas
  (Laura eligió eso, no cambiar las `a)` a cursiva). (2) se agregó en el
  punto 4 un párrafo que adelanta "desde cuándo" es natural (y por qué
  importa: si se paga antes de la sentencia se paga una obligación civil)
  y que el deudor no se defiende alegando obligación natural, sino
  nulidad, prescripción o cosa juzgada; el desarrollo completo sigue
  siendo del 3c. (3) "La prescripción no extingue el derecho" se
  desarrolló en un recuadro fusionado No confundir | Pregunta clásica en
  4.2 (i) (arts. 1567 Nº 10, 2492, 2493, 2494, 1470 Nº 2, 2296,
  verificados; pregunta de Grado ACA "¿se extingue la obligación? No,
  subsiste como natural"); la Conexión a Bienes se mantiene. Se agregó a
  la hoja de estilos `.fusion .t-pc` y `.fusion .sep` (de `formato.md`).
  El punto 4 queda con 5 recuadros grandes (Laura lo sabe).
- **Apunte de eficacia:** 0 unidades nuevas en 3a y 3b (copia a
  Boetsch). No entra su afirmación de que "de manera general" el Nº 1
  excluye al disipador por falta de juicio (no corroborada).
- **Verificado:** arts. 445, 1401, 1447, 1470, 1567, 1687, 1801. Para el
  3c ya verificados: 1471, 1472, 1630, 1656, 1683, 1684, 1688, 2208,
  2296, 2297 (Boetsch lo cita mal: "con por error", falta
  "puramente"), 2375. **Ojo:** el "art. 2034" de la nota de Abeliuk es
  del Código italiano, no del chileno (el chileno es de censos): sin
  verificar. No importar las remisiones internas de Abeliuk (N° 315,
  336, 1.107).
- **Para el 3c, contradicción a exponer:** Boetsch (p. 36) dice que el
  menor adulto debe pagar llegado a la mayoría de edad; Vial (final del
  nº 69) dice que ese pago, antes de cualquier sentencia, es
  ratificación tácita y no pago de obligación natural.
- **Preguntas clásicas anotadas para el 3c:** afianzar; efectos y
  caución; características; "si lo demandan y no hace nada"; "¿se
  extingue? subsiste como natural"; prescrita "¿pago bien o mal?"; la
  del art. 1575 del archivo de repaso (solo la pregunta).

## Tramo 3c (p. 34-36, II.A.5-7): aprobado

- **Respuestas de Laura (2026-11-28):** 1 punto 7 sí; 2 **opción (b),
  mostrar ambas opiniones** (preguntó si era indiscutido que el pago
  antes de la sentencia es ratificación: no lo es, porque AJ IV.B.3.6.2
  recoge la discusión sobre si la ejecución voluntaria exige conocer el
  vicio); 6 el fallo de 1881 entra en el texto con fecha y Gaceta;
  9 sin material propio; resto aprobado. Por la (b) no hay No confundir:
  la ratificación va atribuida a VIAL (5 (i)) y la regla del menor
  adulto a BOETSCH, seguida de la lectura de VIAL (6 (i)).
- **Redactado:** puntos 5 (`cII-A-5`), 6 (`cII-A-6`) y 7 (`cII-A-7`).
  Recuadros: punto 5, Pregunta clásica (demandado que no hace nada) y
  Conexión AJ IV.B.2.5, IV.B.3.6 y IV.B.4.2; punto 6, dos Preguntas
  clásicas (efectos y fianza; pago bien o mal) y Conexión AJ II.A.5.2;
  punto 7 sin recuadros. Controles: cobertura 82% 🟡 por falsos avisos
  (subtítulos B y B.1, del tramo 4a; artículos 8/8, autores 4/4,
  densidad 230%); 42/42 unidades; paráfrasis 0/96 contra las cuatro
  fuentes tras reescribir 4; 0 guiones largos; párrafo máximo 671;
  sin enlaces rotos. Vista previa actualizada.

### Informe (2026-11-28)


- **Informe:** `DERECHO LIBRE/Informes/Informe_Obligaciones_tramo3c.html`
  (2026-11-28). El manual no se ha tocado. Cierra el tema II.A.
- **Unidades: 42 nuevas** (Boetsch 16, Vial 10, Ramos Pazos 4 solo
  argumentos, Abeliuk 12; apunte de eficacia 0) y **6 ya escritas**
  que no se repiten: la adhesión de BOETSCH a VIAL, la defensa del
  deudor y la retención después de la sentencia (punto 2); el pago de
  la prescrita antes y después de la sentencia (4.2 (i)); los efectos
  solo después de la sentencia (punto 2); el ejemplo de Pedro de Vial,
  que se reemplaza por Sebastián del punto 2.
- **Estructura propuesta:** punto 5 (`id="cII-A-5"`, repara el enlace
  del 3b) con cuadro A (desde cuándo es natural: argumentos sin autores;
  ABELIUK solo en la fila del Nº 2) y la postura de VIAL debajo; punto 6
  con los cinco efectos como enumeración (i) a (v) y cuadro B
  ("voluntariamente": CLARO SOLAR, BARROS ERRÁZURIZ, ABELIUK frente a
  una postura sin autores con el art. 2297); **punto 7 nuevo**
  "¿Puede la obligación natural convertirse en civil?" (Abeliuk).
- **Las 9 decisiones planteadas** (numeradas como en el informe):
  1 punto 7 nuevo (recomendado) o dentro del 6; 2 contradicción
  Boetsch/Vial sobre el pago del menor adulto: (a) armonizar en un No
  confundir "¿ratificación o pago de obligación natural?" (recomendado:
  Boetsch adhiere a VIAL en el punto 5) o (b) exponer sin conciliar;
  3 los dos cuadros; 4 confirmación de que los autores de Ramos Pazos no
  entran (solo sus argumentos); 5 art. 1688 según Vial (no calza exacto
  con el texto): atribuirlo a VIAL con el texto del artículo al lado, u
  omitir; 6 fallo de Santiago de 6-may-1881 (G.T. 1881 Nº 528 p. 333,
  doctrina del deber moral) en el texto con fecha y Gaceta, o fuera;
  7 Pregunta clásica "si lo demandan y no hace nada", respondida con
  los arts. 1683, 1684 y 2493 (Código, no fuente); 8 tres preguntas
  y tres recuadros por punto en 5 y 6 (si sobra, sacar "pago bien o
  mal"); 9 material propio.
- **Ya resuelto en el informe:** art. 2297 con texto vigente; nota de
  MAZEAUD y art. 2034 italiano omitidos; remisiones internas de Abeliuk
  fuera; "¿se extingue?" descartada (usada en el 3b); la ruta del art.
  1575 del archivo de repaso **queda para el tramo 16b** (su respuesta
  trata como natural una prescrita no declarada).
- **Ejemplos propuestos:** Sebastián paga a los 18 antes del juicio
  (ratificación tácita, punto 5); Catalina paga una prescrita declarada
  creyendo que solo tenía más plazo (cuadro B); fianza del tío de
  Sebastián vale y no puede oponer la incapacidad (arts. 1472 y 2354);
  **ojo: no usar un ejemplo de fianza del Nº 4**, porque el fiador
  puede oponer la cosa juzgada (art. 2354, excepción real); Andrea y
  Felipe sin compensación legal (punto 6); promesa de Felipe = renuncia
  a la cosa juzgada y, como variante, promesa de la tía Gloria no
  obliga, art. 1683 (punto 7).
- **Conexiones propuestas:** punto 5, AJ IV.B.3.6, IV.B.2.5 y IV.B.4.2;
  punto 6, AJ II.A.5.2 (error de derecho). Para después: llenar el
  `[FALTA: sección]` de la Conexión de AJ a las obligaciones naturales.

## Siguiente paso exacto (2026-11-28, vigente)

1. Ramas `obligaciones-tramo1`, `formato-cuadro-rotulos`,
   `obligaciones-tramo2`, `obligaciones-tramo3a` y `obligaciones-tramo3b`:
   mergeadas.
2. El 4a se trabaja en una rama nueva `obligaciones-tramo4a`, creada
   desde `main` **después** de mergear el 3c.
3. Tramo **3c**: aprobado y marcado Hecho en Airtable. Falta el merge
   de `obligaciones-tramo3c` a `main` y borrar la rama. Después, informe del
   tramo **4a** (p. 36-39, II.B.1-2, con la última página de Vial: dar y
   entregar). Pendiente menor: llenar el `[FALTA: sección]` de la
   Conexión de AJ a las obligaciones naturales (ahora es Obligaciones
   II.A.1 a II.A.7).
4. Al aprobar Laura cada tramo: merge, borrar la rama, marcar Hecho en
   Airtable (lo hace Claude; Laura no tiene que tocarlo).
5. `scripts/cobertura_tramo.py` sigue solo en la rama
   `worktree-plan-lanzamiento` (commit `314038f`); se usa una copia con
   `git show 314038f:scripts/cobertura_tramo.py`.
