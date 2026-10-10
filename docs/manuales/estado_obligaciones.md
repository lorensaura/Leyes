# Estado: manual de Obligaciones (materia nueva)

> Se actualiza **in place** cada vez que Laura diga "guarda el estado
> [de Obligaciones]". Al decir "retoma Obligaciones", leer este archivo
> completo primero y resumir en pocas líneas dónde quedó antes de seguir.
> Última actualización: 2026-10-10 (organización inicial: mapa de la
> fuente, solapes y reparto de tramos propuestos; nada aprobado todavía).

## Resumen para retomar (léelo primero)

- **Es materia nueva**, no una actualización: el proceso es
  `docs/manuales/proceso.md` (no `actualizar-manuales-existentes.md`),
  con todo lo de `lecciones-acto-juridico.md` aplicado desde el primer
  tramo (checklist único de su sección 6).
- **Bienes va primero.** Obligaciones se organiza en paralelo
  (decisión de Laura, 2026-10-10). No se redacta ningún tramo hasta que
  Laura lo diga.
- **Hecho:** texto extraído, mapa completo de la fuente por página real,
  mapa de Orrego, anexos chicos asignados, solapes con otros manuales
  detectados y reparto de 34 tramos propuesto. Todo en el informe
  `DERECHO LIBRE/Informes/Informe_Obligaciones_organizacion.html`.
- **Falta que Laura decida:** los solapes (S1 a S6), el mapa de Orrego
  (incluido el cuestionario) y el nombre y número del manual. Ver
  "Siguiente paso exacto".
- **No existe todavía `NN_Obligaciones_Manual.html`**: no crearlo sin
  que Laura confirme número y nombre (la web, el build y
  `scripts/generar_pdf_manual.py` leen esos archivos de la raíz).

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
la numeración de Boetsch.** Mapa (pendiente de confirmación de Laura):

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
| Cuestionario (178 preguntas) | 76-82 | todo IV | **Dudosa**: no es materia para el texto del manual; puede servir para las preguntas de Práctica |

Orrego no trata la cesión de bienes (Boetsch IV.B.4) como capítulo propio.

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

## Solapes con otros manuales (pendiente de decisión de Laura)

El precedente del repo es la caja **Conexiones** (`guia-editorial.md`
4.8): sección y página del otro manual, sin enlaces. No hay regla
escrita sobre cuánto del contenido repetido se desarrolla en cada
manual. Eso lo decide Laura.

| # | Tema | Boetsch Oblig. | Ya está en |
|---|---|---|---|
| S1 | Modalidades: condición, plazo, modo | II.E, p. 85-129 (unas 44 p., 5 tramos) | AJ, capítulo VI (A condición, B plazo, C modo) |
| S2 | Reglas comunes a toda prescripción | IV.I.6, p. 225-229 | Bienes V.5.B.4 (**ese tramo de Bienes todavía no se hace**: conviene decidir antes de que Bienes llegue ahí) |
| S3 | Derechos reales y personales | I.A.1-4, p. 13-16 | Bienes II.A.4.2-4.3 (aprobado) |
| S4 | Condición resolutoria y resolución; medio y resultado; imposibilidad | II.E.1.7 (105-116), II.F.2 (130), IV.H (215-223) | Contractual D (resolución, condición resolutoria tácita, pacto comisorio), B.3 (medio y resultado), C.6 (imposibilidad) |
| S5 | Cesión de créditos | III.3.2, p. 135 | Bienes V.4.D.4 (tradición de derechos personales, arts. 1901 y siguientes) |
| S6 | Formalidades por vía de prueba, limitación de la prueba de testigos | VI.8, p. 288-299 | AJ (formalidades: arts. 1701, 1708, 1709, 1711) |

## Reparto de tramos (propuesta 2026-10-10, sin aprobar)

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

1. Laura revisa `Informes/Informe_Obligaciones_organizacion.html` y
   decide: S1 a S6, el mapa de Orrego (en especial el cuestionario), el
   reparto de tramos y el número y nombre del manual.
2. Con eso, anotar las decisiones aquí (sección nueva "Decisiones
   tomadas con Laura") y corregir el reparto si cambia.
3. Cuando Laura dé la partida (después de Bienes, o en paralelo si lo
   pide): crear el manual con la hoja de estilos vigente de AJ/Bienes
   (`formato.md`) y empezar por el tramo 1 con el checklist de
   `lecciones-acto-juridico.md` sección 6, incluida la pregunta a Laura
   por material extra del tema.
