# Estado: manual de Obligaciones (materia nueva)

> Se actualiza **in place** cada vez que Laura diga "guarda el estado
> [de Obligaciones]". Al decir "retoma Obligaciones", leer este archivo
> completo primero y resumir en pocas líneas dónde quedó antes de seguir.
> Última actualización: 2026-11-27 (tramos 1 y 2 aprobados; reparto
> en 74 tramos chicos; tramo 3a escrito en `obligaciones-tramo3a`,
> esperando revisión, junto con la corrección de paráfrasis de 1 y 2).

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
- **Reparto rehecho en 74 tramos chicos** (2026-11-27), ver "Reparto de
  tramos". Ya está en Airtable.
- **Tramo 3a (p. 27-31 + Vial nº 67-69): escrito, esperando revisión.**
  Informe: `DERECHO LIBRE/Informes/Informe_Obligaciones_tramo3a.html`.
  Detalle en "Tramo 3a", más abajo.
- **Ojo, corrección de los tramos 1 y 2 (en la misma rama 3a):** el
  script de paráfrasis tenía un error (el filtro de citas entre comillas
  se comía párrafos enteros cuando las comillas quedaban desparejas), y
  en 1 y 2 midió muchas menos oraciones de las reales. Ya corregido
  (filtra cita por párrafo). Al medir de nuevo salieron 13 oraciones del
  tramo 1 y 22 del tramo 2 (13 frente a Boetsch, 9 frente a Vial) sobre
  70%; se reescribieron todas, sin perder unidades.
- **Siguiente:** revisión de Laura del 3a; luego 3b. Ver "Siguiente paso
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

## Reparto de tramos (rehecho 2026-11-27: tandas chicas)

Laura (2026-11-27): "Lo importante es que sigas trabajando en tandas como
lo estamos haciendo con bienes. Varias tandas pequeñas son mejores que
pocas grandes." (memoria `tandas-pequenas`). El reparto de 34 tramos del
2026-10-10 se partió en **74 tramos**:

- Unas **4 a 6 páginas de Boetsch** por tramo, con sufijo a/b/c como en
  Bienes. Las páginas de corte son aproximadas: **al llegar a cada tramo
  se ajusta el corte a un límite de título** y, si sale grande, se parte
  de nuevo y se le avisa a Laura.
- Los anexos chicos van con el tramo de su tema. **Cada capítulo de
  Orrego es su propio tramo**, después de los de Boetsch de esa
  institución (Orrego X, prescripción, 27 p., en tres: 28c, 28d, 28e).
- Mismas fuentes y mismas decisiones de solape (S1 a S7) que antes; la
  columna de solapes del reparto anterior sigue valiendo por tema.
- El mismo reparto está en el **mapa de metas de Airtable** (74 tareas
  "Obligaciones · tramo X", tramos 1 y 2 marcados Hecho). Si se parte o
  se junta un tramo, actualizar también ahí.

| # | Boetsch p. | Contenido | Anexo | Hecho |
|---|---|---|---|---|
| 1 | 13-19 | I.A La obligación |  | ✅ |
| 2 | 19-26 | I.B Fuentes de las obligaciones | Vial (fuentes) | ✅ |
| 3a | 27-31 | II intro; II.A.1-3 Civiles y naturales: concepto | Vial (civiles vs. naturales), nº 67-69 |  |
| 3b | 31-36 | II.A.4-6 Art. 1470, sentencia y efectos de la obligación natural | Vial (final del nº 69 y nº 70); Ramos Pazos; Abeliuk; apunte de eficacia |  |
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
| 15a | 133-137 | III Modificación; IV.1-3 Modos de extinguir, generalidades | Orrego I |  |
| 15b | 137-140 | IV.A Resciliación | Orrego II |  |
| 16a | 140-145 | IV.B.1 Pago efectivo: concepto a quién paga |  |  |
| 16b | 145-149 | IV.B.1 Pago en las obligaciones de dar |  |  |
| 17a | 149-153 | IV.B.1 A quién se paga, época |  |  |
| 17b | 153-157 | IV.B.1 Lugar, imputación, prueba y efectos del pago |  |  |
| 17c | Orrego | Orrego III.A Pago efectivo (1ª parte, PDF p. 6-10) | Orrego III.A |  |
| 17d | Orrego | Orrego III.A Pago efectivo (2ª parte, PDF p. 10-15) | Orrego III.A |  |
| 18a | 157-161 | IV.B.2 Pago por consignación (1) |  |  |
| 18b | 161-166 | IV.B.2 Pago por consignación (2) |  |  |
| 18c | Orrego | Orrego III.B Pago por consignación (PDF p. 15-18) | Orrego III.B |  |
| 19a | 166-171 | IV.B.3 Pago con subrogación: concepto y clases (1) |  |  |
| 19b | 171-176 | IV.B.3 Pago con subrogación: clases (2) |  |  |
| 20a | 176-179 | IV.B.3.5-6 Subrogación: efectos y paralelo |  |  |
| 20b | 179-183 | IV.B.4 Cesión de bienes; IV.B.5 Beneficio de competencia |  |  |
| 20c | Orrego | Orrego III.C-D Subrogación y beneficio de competencia (PDF p. 18-25) | Orrego III.C-D |  |
| 21a | 183-190 | IV.C Dación en pago |  |  |
| 21b | Orrego | Orrego IV Dación en pago (PDF p. 25-28) | Orrego IV |  |
| 22a | 190-194 | IV.D Novación (1) |  |  |
| 22b | 194-198 | IV.D.4 Novación: clases |  |  |
| 22c | 198-201 | IV.D.5 Novación: efectos |  |  |
| 22d | Orrego | Orrego V Novación (1ª parte, PDF p. 28-32) | Orrego V |  |
| 22e | Orrego | Orrego V Novación (2ª parte, PDF p. 32-36) | Orrego V |  |
| 23a | 201-205 | IV.E Compensación (1) |  |  |
| 23b | 205-210 | IV.E Compensación: prohibida y efectos |  |  |
| 23c | Orrego | Orrego VII Compensación (PDF p. 40-45) | Orrego VII |  |
| 24a | 210-215 | IV.F Remisión; IV.G Confusión |  |  |
| 24b | Orrego | Orrego VI Remisión y VIII Confusión (PDF p. 36-40 y 45-47) | Orrego VI y VIII |  |
| 25a | 215-219 | IV.H Imposibilidad y pérdida de la cosa debida |  |  |
| 25b | 219-223 | IV.H.5 Teoría de los riesgos | Orrego IX |  |
| 26 | 223-229 | IV.I.1-6 Prescripción: generalidades y reglas comunes |  |  |
| 27a | 229-234 | IV.I.7.1-7.2 Acción prescriptible; interrupción (1) |  |  |
| 27b | 234-238 | IV.I.7.2 Interrupción y suspensión (2) |  |  |
| 28a | 238-244 | IV.I.7.3 Tiempo de prescripción |  |  |
| 28b | 244-250 | IV.I.8-9 Cláusulas; prescripción y caducidad | Clasificación de la prescripción extintiva |  |
| 28c | Orrego | Orrego X Prescripción extintiva (1ª parte, PDF p. 49-58) | Orrego X |  |
| 28d | Orrego | Orrego X Prescripción extintiva (2ª parte, PDF p. 58-67) | Orrego X |  |
| 28e | Orrego | Orrego X Prescripción extintiva (3ª parte, PDF p. 67-76) | Orrego X |  |
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

## Tramo 3a (p. 27-31, II intro y II.A.1-3): escrito, esperando revisión

- **Escrito el 2026-11-27** en `obligaciones-tramo3a`. Abre el capítulo
  II (`cII`), con la lista de clasificaciones de Boetsch como
  enumeración, y el tema A (`cII-A`) con los puntos 1 a 3.
- **Anexo de Vial (nº 67-69 hasta su definición):** completo en este
  tramo. El final del nº 69 ("desde cuándo" es natural la obligación) y
  el nº 70 van al 3b, junto con **todo el anexo de Ramos Pazos**, que
  trata solo de eso.
- **Decisiones aplicadas, para que Laura confirme:** cuadro de
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

## Siguiente paso exacto (2026-11-27, vigente)

1. Revisión de Laura del tramo 3a (y de la corrección de 1 y 2); con su
   visto bueno, merge de `obligaciones-tramo3a`, borrar la rama y marcar
   3a como Hecho en Airtable.
2. Tramo **3b**: Boetsch p. 31 (punto 4) a 36 (II.A.4-6: análisis de
   cada número del art. 1470, sentencia y efectos), con Vial (final del
   nº 69 y nº 70), Ramos Pazos, Abeliuk y el apunte de eficacia (Bozzo e
   Ibarra: cruzar con cátedra y no nombrarlo). Si sale grande, partirlo
   en 3b y 3c y avisar. Conexión con AJ IV.B (nulidad).
3. `scripts/cobertura_tramo.py` sigue solo en la rama
   `worktree-plan-lanzamiento` (commit `314038f`); se usa una copia con
   `git show 314038f:scripts/cobertura_tramo.py`.
