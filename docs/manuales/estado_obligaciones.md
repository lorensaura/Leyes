# Estado: manual de Obligaciones (materia nueva)

> Se actualiza **in place** cada vez que Laura diga "guarda el estado
> [de Obligaciones]". Al decir "retoma Obligaciones", leer este archivo
> completo primero y resumir en pocas líneas dónde quedó antes de seguir.
> Última actualización: 2026-10-10 (organización aprobada por Laura:
> solapes, Orrego, reparto y nombre del manual decididos; ningún tramo
> redactado todavía).

## Resumen para retomar (léelo primero)

- **Es materia nueva**, no una actualización: el proceso es
  `docs/manuales/proceso.md` (no `actualizar-manuales-existentes.md`),
  con todo lo de `lecciones-acto-juridico.md` aplicado desde el primer
  tramo (checklist único de su sección 6).
- **Bienes va primero.** Obligaciones se organiza en paralelo
  (decisión de Laura, 2026-10-10). No se redacta ningún tramo hasta que
  Laura lo diga.
- **Hecho y aprobado (2026-10-10):** texto extraído, mapa completo de la
  fuente por página real, mapa de Orrego, anexos chicos asignados,
  solapes con otros manuales y reparto de 34 tramos. Informe:
  `DERECHO LIBRE/Informes/Informe_Obligaciones_organizacion.html`.
  Decisiones en "Decisiones tomadas con Laura", más abajo.
- **Nombre del manual: `06_Obligaciones_Manual.html`** (confirmado por
  Laura). **En `main` todavía no existe:** se crea al empezar el tramo 1
  (la web, el build y `scripts/generar_pdf_manual.py` leen los manuales
  de la raíz, así que no se deja un archivo vacío ahí).
- **Ojo, hay un borrador viejo** (ver "Borrador anterior", más abajo):
  no se actualiza, se escribe el tramo 1 de cero y el borrador solo se
  usa como referencia.
- **Siguiente:** tramo 1, cuando Laura dé la partida. Ver "Siguiente
  paso exacto".

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

## Reparto de tramos (aprobado por Laura 2026-10-10)

Cortes en límite de título del mapa de arriba, no por número de página.
Unas 10 páginas por tramo, menos en los temas clásicos de examen
(solidaridad, indivisibilidad, subrogación, novación, compensación,
prescripción, prelación). Los tramos marcados con S dependen de una
decisión de solape.

| # | Páginas | Contenido | Anexos | Solape |
|---|---|---|---|---|
| 1 | 13-19 | I.A La obligación | | S3 |
| 2 | 19-27 | I.B Fuentes | Vial (fuentes) | |
| 3 | 27-36 | II.A Civiles y naturales | Vial, Ramos Pazos, Abeliuk, Bozzo (eficacia) | |
| 4 | 36-44 | II.B.1-B.3 Positivas y negativas; dar, hacer, no hacer; objeto singular y compuestas | | |
| 5 | 44-53 | II.B.4 Especie y género; obligaciones de dinero e intereses | | |
| 6 | 53-64 | II.C intro; C.1 conjuntas; C.2.1 solidaridad, reglas generales; C.2.2 activa | Bozzo (sujetos) | |
| 7 | 64-72 | II.C.2.3 Solidaridad pasiva | Sentencia; Bozzo (sujetos) | |
| 8 | 72-78 | II.C.3.1-5 Indivisibilidad: nociones, fuentes, clases, efectos | Docx; C. Domínguez; Bozzo (sujetos) | |
| 9 | 78-84 | II.C.3.6-7 Excepciones a la divisibilidad (art. 1526); paralelo | Cuadro | |
| 10 | 84-96 | II.D Principales y accesorias; II.E generalidades; E.1.1-4 condición: definición, elementos, clasificación | | S1 |
| 11 | 96-105 | II.E.1.5-6 Reglas comunes; condición suspensiva | | S1 |
| 12 | 105-116 | II.E.1.7 Condición resolutoria y efectos (partes y terceros) | | S1, S4 |
| 13 | 116-125 | II.E.2 Plazo | | S1 |
| 14 | 125-133 | II.E.3 Modo; II.F Otras categorías | | S1, S4 |
| 15 | 133-140 | III Modificación; IV generalidades; IV.A Resciliación | Orrego I-II | S5 |
| 16 | 140-149 | IV.B.1.1-7 Pago: concepto a obligaciones de dar | Orrego III.A | |
| 17 | 149-157 | IV.B.1.8-15 Pago: a quién, época, lugar, imputación, prueba, efectos | Orrego III.A | |
| 18 | 157-166 | IV.B.2 Pago por consignación | Orrego III.B | |
| 19 | 166-176 | IV.B.3.1-4 Subrogación: concepto y clases | Orrego III.C | |
| 20 | 176-183 | IV.B.3.5-6 efectos y paralelo; B.4 cesión de bienes; B.5 beneficio de competencia | Orrego III.C-D | |
| 21 | 183-190 | IV.C Dación en pago | Orrego IV | |
| 22 | 190-201 | IV.D Novación | Orrego V | |
| 23 | 201-210 | IV.E Compensación | Orrego VII | |
| 24 | 210-215 | IV.F Remisión; IV.G Confusión | Orrego VI, VIII | |
| 25 | 215-223 | IV.H Imposibilidad y pérdida de la cosa; teoría de los riesgos | Orrego IX | S4 |
| 26 | 223-229 | IV.I.1-6 Prescripción: generalidades y reglas comunes | Orrego X | S2 |
| 27 | 229-238 | IV.I.7.1-7.2 Acción prescriptible; interrupción y suspensión | Orrego X; clasificación prescripción | |
| 28 | 238-250 | IV.I.7.3 Tiempo; 8 cláusulas; 9 prescripción y caducidad | Orrego X; clasificación prescripción | |
| 29 | 250-260 | V.1-9 Prelación, generalidades; 10.1 primera clase | | |
| 30 | 260-267 | V.10.2-10.3 Segunda y tercera clase | | |
| 31 | 267-276 | V.10.4-10.5 Cuarta y quinta clase | | |
| 32 | 276-288 | VI.1-8.2 Prueba: concepto, leyes, sistemas, pactos, objeto, carga, medios | | |
| 33 | 288-296 | VI Prueba instrumental (públicos y privados) | | S6 |
| 34 | 296-305 | VI Testigos, inspección, peritos, confesión, presunciones | | S6 |

## Siguiente paso exacto (2026-10-10, vigente)

Organización cerrada. Lo que sigue, **cuando Laura dé la partida**
(Bienes va primero; en paralelo solo si ella lo pide):

1. Leer `lecciones-acto-juridico.md` completo (sobre todo la sección
   6), `proceso.md`, `guia-editorial.md` y `formato.md`.
2. En una rama nueva desde `main` (no la del borrador viejo), crear
   `06_Obligaciones_Manual.html` en la raíz del repo con la hoja de
   estilos vigente de AJ/Bienes (`formato.md`), y revisar qué hay
   que tocar para que la web, el build y `scripts/generar_pdf_manual.py`
   lo reconozcan (arreglo `FUENTES`).
3. Tramo 1 (p. 13-19, I.A La obligación): preguntar a Laura si tiene
   material extra, inventario desde
   `Apuntes/CIVIL/Obligaciones/_texto_extraido/Obligaciones1_principal.txt`,
   informe en `DERECHO LIBRE/Informes/Informe_Obligaciones_tramo1.html`
   y aprobación de Laura antes de escribir en el manual. Conexión de
   I.A.1-4 hacia Bienes II.A.4.2-4.3 (S3). El informe incluye la lista
   de lo que trae el borrador viejo y no está en Boetsch (ver "Borrador
   anterior").
