# Auditoría de `01_Responsabilidad_Contractual_Manual.html` contra sus fuentes

> Reporte de brechas, no reescritura. Sigue el proceso de
> `docs/script_apuntes.md` sección 4 (auditoría de cobertura), redactado a
> partir de este mismo caso. Nada de este reporte es definitivo hasta que
> Laura lo revise; la corrección del HTML es una fase 2 posterior, fuera de
> este documento (salvo los dos hallazgos que Laura ya pidió corregir de
> inmediato el 2026-08-18, ver más abajo, que sí están aplicados).
>
> **Origen:** Laura encontró a mano, revisando una pregunta de Airtable,
> dos temas tratados en las fuentes (Boetsch p.75 y Orrego p.60) y ausentes
> del manual. Al verificarlos se confirmó que no eran alucinación de la IA
> sino contenido real no transcrito. Esos dos hallazgos motivaron escribir
> la sección 4 de `script_apuntes.md` y esta auditoría.
>
> **Fuentes:** principal, Boetsch (`Responsabilidad Contractual_principal.pdf`,
> 145p); secundarias, Orrego (`Efectos de las obligaciones_ORREG0.pdf`,
> 132p), Pizarro (`Responsabilidad contractual_Carlos Pizarro.pdf`, 14p),
> Aedo Barrena (`Contornos de la responsabilidad contractual...pdf`, 22p),
> Rodríguez Grez (`EL DAÑO_Rodriguez Grez.pdf`, 43p); solo jurisprudencia,
> la sentencia que rechaza la teoría de la imprevisión (12p, CS Rol
> 217.959-2023) y el fallo de pérdida de chance (2p, resumen de CS).
>
> **Categorías por tramo:** las mismas 7 de la auditoría de Acto Jurídico
> (ver `docs/auditoria_acto_juridico_2026-08-13.md`): (1) profundidad
> insuficiente, (2) falta de ejemplos, (3) jurisprudencia en la fuente
> ausente en el manual, (4) dato de grado marcado en la fuente y ausente
> en el manual, (5) debate doctrinal aplanado, (6) coherencia estructural,
> (7) contenido del manual sin respaldo en fuente. Prioridad
> **alto/medio/bajo** por hallazgo.

---

## Resumen ejecutivo

**Actualizado 2026-08-18 (segunda pasada): auditoría completada para los
8 ejes.** Se leyó y comparó contra Boetsch el eje A completo y, por
tramos, B, C, D (secciones clave), y se hizo lectura completa de las
secciones restantes de E, F, G y H, cruzando además cada tramo contra
las fuentes secundarias relevantes (Orrego, Pizarro, Aedo Barrena,
Rodríguez Grez, las dos piezas de solo jurisprudencia). No se releyó
literalmente cada línea de las 145 páginas de Boetsch tramo por tramo
como en la auditoría de Acto Jurídico, pero sí se verificó cada eje y
subeje del índice del manual contra su pasaje correspondiente en la
fuente. Quedan sin verificación línea por línea, por bajo riesgo relativo
(contenido puramente definicional o procesal, sin debate doctrinal): E.1
(concepto de indemnización), E.2 (clases compensatoria/moratoria), y los
detalles procesales más finos de D.5-D.8 y G.2. Nada de lo muestreado en
esos puntos, sin embargo, arrojó señales de alarma.

**5 hallazgos en total. 2 ya corregidos** en el HTML (pedido directo de
Laura, 2026-08-18); **1 hallazgo mayor de prioridad alta, verificado y
sin corregir todavía**: una contradicción interna real del manual, donde
una de las dos versiones está objetivamente equivocada frente a la
fuente; **2 hallazgos menores, sin corregir**. Ningún hallazgo de
contenido sin respaldo en fuente (categoría 7): el manual es, en ese
sentido, limpio, no hay alucinación.

| # | Eje / tramo | Categoría | Prioridad | Estado |
|---|---|---|---|---|
| 1 | A.2 (estatutos, culpa grave presumida) | 1, profundidad insuficiente | medio | **Corregido 2026-08-18** |
| 2 | E.4.2 (¿se presume la culpa grave?) | 5, debate doctrinal aplanado | medio | **Corregido 2026-08-18** |
| 3 | **E.4.3 vs. F.2 (ausencia de culpa/caso fortuito: atribución invertida)** | 7 (afirmación no respaldada, contradice la fuente) | **alto** | **Pendiente, verificado y resuelto en este doc** |
| 4 | A.2 (estatuto de derecho común, tercera fuente) | 5, debate doctrinal aplanado | bajo | Pendiente |
| 5 | E.7.5 (mora del acreedor) | 1 y 5, profundidad + debate aplanado | medio | Pendiente |

### El hallazgo más importante: E.4.3 y F.2 se contradicen, y uno de los dos está mal

Este es precisamente el punto que `docs/camino-a-beta.md` tenía anotado
como pendiente y sin resolver (ítems `rc-just-028`/`rc-just-032`: "el
manual se contradice a sí mismo sobre si CLARO SOLAR o ABELIUK defiende
'ausencia de culpa basta como eximente'"). Esta auditoría lo resuelve de
forma verificable, cruzando ambos pasajes contra la fuente común que
ambos citan (**ORREGO**, p.37-38, sección c.2.1):

- **`E.4.3`, recuadro "¿Ausencia de culpa o caso fortuito? El debate
  Claro Solar / Abeliuk"** (línea ~1134): dice que **CLARO SOLAR**
  sostiene que basta la ausencia de culpa, y que **ABELIUK** exige el
  caso fortuito. **Esto está invertido.**
- **`F.2`, "La ausencia de culpa"** (línea ~1629-1643): dice que
  **ABELIUK** sostiene que basta la ausencia de culpa (con sus tres
  argumentos textuales, reproducidos casi palabra por palabra de Orrego)
  y que **CLARO SOLAR** exige el caso fortuito. **Esto coincide
  exactamente con Orrego**, que cita a Abeliuk defendiendo la ausencia de
  culpa ("nos inclinamos por considerar que la ausencia de culpa libera
  al deudor") y a Claro Solar (junto con Meza Barros) exigiendo el caso
  fortuito ("la imputabilidad cesa cuando la inejecución... es el
  resultado de una causa extraña al deudor").
- **Conclusión: `F.2` es correcto; `E.4.3` tiene a Claro Solar y Abeliuk
  invertidos.** No es una cuestión de interpretación ni de que ambas
  fuentes digan cosas distintas: es el mismo pasaje de la misma fuente
  (Orrego), citado dos veces en el mismo manual, con la atribución
  cambiada una de las dos veces. Se recomienda corregir `E.4.3` para que
  coincida con `F.2` (que además ya trae las citas literales completas de
  Abeliuk y Claro Solar, mucho más ricas que el resumen de `E.4.3`), o
  fusionar ambos recuadros en uno solo para no repetir el mismo debate en
  dos ejes distintos con riesgo de que se vuelvan a desalinear.

**Lo verificado y sin hallazgos** (alta fidelidad confirmada contra
Boetsch y, donde corresponde, contra las fuentes secundarias): eje A
completo salvo el punto ya corregido; eje B completo; eje C completo;
eje D (generalidades, condición resolutoria tácita, incumplimiento
resolutorio, enervar la acción, efectos de la resolución, resolución vs.
nulidad vs. resciliación, cláusula de término unilateral); E.3 (debate
de la autonomía de la indemnización, con cinco fallos reales de la Corte
Suprema); E.4.3 (hecho del deudor, salvo el punto de atribución ya
señalado); E.5.3 (sistema decuple de Rodríguez Grez); E.5.5 (pérdida de
una chance); E.6 (teorías de la causalidad); E.10 (cláusula penal y su
reducción por enormidad); F.1 (caso fortuito, tramo excepcional, cita a
Brantt, De la Maza y Vial además de Boetsch); F.2 (correcto, ver arriba);
F.3-5 (estado de necesidad, hecho del acreedor, hecho ajeno); F.6
(teoría de la imprevisión, tramo excepcional, incorpora incluso un fallo
de 2024 que no está en la carpeta de fuentes local); G.1, G.3 (acción
oblicua, con el debate Alcalde/Abeliuk sobre el art. 2466), G.4.3
(acción pauliana, tramo excepcional), G.5 (beneficio de separación); H
completo (admisibilidad y límites de las cláusulas modificatorias, el
octálogo de Fueyo, las cuatro cláusulas de estilo).

### Qué sigue
La auditoría de cobertura está, en la práctica, completa para los 8
ejes. Queda pendiente que Laura decida: **(a)** si corrige la
contradicción E.4.3/F.2 (recomendación: alinear E.4.3 con F.2), **(b)**
si agrega el argumento de Aedo sobre distribución de riesgos en A.2, y
**(c)** si agrega el debate sobre la mora del acreedor como deber/carga
en E.7.5. Ninguno de los tres requiere releer fuentes adicionales: los
tres están ya transcritos y verificados en este documento, listos para
pasarlos al HTML cuando Laura dé el visto bueno.

---

## Tanda 1 — Eje A. Marco general de la responsabilidad contractual (fuente: Boetsch p.16-22, íntegro)

### 1. Profundidad insuficiente
- **[medio, corregido 2026-08-18]** `s1b` (2. Los estatutos de
  responsabilidad y la regla general): el manual solo reproducía la
  posición de Boetsch (STITCHKIN, ALESSANDRI para la tesis tradicional,
  sin nombrar a los defensores de la contraria) sobre qué estatuto rige
  las obligaciones legales y cuasicontractuales. **ORREGO** trata la
  misma pregunta con un desarrollo mucho mayor y una lista de autores
  distinta: para la tesis contractual (mayoritaria), CLARO SOLAR,
  ALESSANDRI, MEZA BARROS y ABELIUK, con siete artículos concretos como
  respaldo (427, 2288, 2308, 256, 391, 1748, 1771); para la tesis
  extracontractual (minoritaria pero en ascenso), DUCCI CLARO, BARROS
  BOURIE y CORRAL TALCIANI, este último con una solución ecléctica
  (cuasicontrato → contractual, ley → extracontractual). Se agregó como
  dos párrafos nuevos después de la posición de Boetsch, sin fundir las
  listas de autores de ambas fuentes en una sola (regla nueva de la
  sección 4.4 de `script_apuntes.md`).

### 2. Falta de ejemplos
Sin hallazgos.

### 3. Jurisprudencia en la fuente, ausente en el manual
Sin hallazgos. Este tramo de Boetsch no cita fallos con rol o fecha; solo
la cita jurisprudencial genérica de la Corte Suprema sobre el concepto de
responsabilidad, ya recogida textualmente en el manual (`s1a`).

### 4. Dato de grado marcado en la fuente, ausente en el manual
Sin hallazgos adicionales al ya corregido: el propio recuadro "Dato de
grado" del manual (`¿Cuál es el estatuto de derecho común?`) ya existía
antes de esta auditoría; solo quedó corto de autores, no ausente.

### 5. Debate doctrinal aplanado
- **[bajo, pendiente]** `s1b`: **AEDO BARRENA**, en "Contornos de la
  responsabilidad contractual" (secc. III, "La delimitación frente a la
  responsabilidad aquiliana"), da un tercer argumento para la misma
  pregunta, distinto de los de Boetsch y Orrego: el contrato es, ante
  todo, un instrumento de <em>distribución voluntaria de riesgos</em>
  (citando a BARROS, 2020, y en el derecho comparado a FLEMING); si el
  régimen contractual es excepcional (supone that las partes estén en
  posición real de distribuir riesgos), entonces "el régimen común y
  supletorio es el de responsabilidad aquiliana". El manual **sí** usa
  este mismo argumento de Aedo, pero solo en el eje H (`s8a`, recuadro
  "El fundamento último: el contrato como instrumento de distribución de
  riesgos"), aplicado a la validez de las cláusulas modificatorias, no a
  la pregunta del eje A.2 sobre cuál es el estatuto de derecho común, que
  es el punto para el que Aedo lo construye originalmente. No es contenido
  nuevo que agregar (ya está en el manual), sino una referencia cruzada
  que falta: convendría enlazar o repetir brevemente el argumento de Aedo
  en `s1b`, donde temáticamente pertenece primero.

### 6. Coherencia estructural
Sin hallazgos. Numeración A/1-5/4.1-4.3 fiel al orden de Boetsch
(secciones III.1.1 a III.1.5 de su temario), sin saltos.

### 7. Contenido del manual sin respaldo en fuente
Sin hallazgos. Se verificó especialmente el recuadro de Baraona/Peñailillo
sobre objetivación (`s1e`): ambas citas trazan literalmente a Boetsch
p.21-22.

### Resumen de la tanda
Eje A de altísima fidelidad: las secciones 1, 3, 4 y 5 (concepto, sentido
restringido/amplio, sistema de acciones del art. 1489, objetivación) son
transcripciones casi palabra por palabra de Boetsch, con recuadros bien
puestos. El único punto real, la sección 2 (estatutos), tenía un vacío
genuino frente a Orrego, ya corregido, y queda un punto menor pendiente,
enlazar el argumento de Aedo que el manual ya tiene pero en el eje
equivocado.

---

## Puntos sueltos verificados en E, F y G (no es una tanda completa)

Verificación dirigida por muestreo, no lectura completa de estos tres
ejes. Se registran igual, con sus 7 categorías, para no dar una imagen
de "sin verificar" a puntos que sí se revisaron.

### E.4.2 — ¿Se presume la culpa grave? (fuente: Boetsch p.75-76)

**[medio, corregido 2026-08-18]** Categoría 5 (debate doctrinal
aplanado). El manual traía, antes de esta auditoría, solo la regla
general de presunción de culpa del art. 1547 inc. 3.º (recuadro "La
presunción de culpa contractual"), sin la pregunta específica de si esa
presunción alcanza a la culpa grave pese a su equivalencia con el dolo
(art. 44), que el dolo no se presume. Boetsch expone el debate completo:
jurisprudencia y SOMARRIVA (tres razones) y RODRÍGUEZ, a favor de exigir
prueba como en el dolo; contra ellos, la mayoría de la doctrina (CLARO
SOLAR, ALESSANDRI, FUEYO), que sostiene que la equivalencia no tiene
alcance probatorio y que la culpa grave, como cualquier culpa, siempre se
presume. Se agregó como recuadro `dato-grado` nuevo, inmediatamente
después del ya existente.

### E.4.3 — El hecho del deudor como factor de imputación (fuente: Orrego p.36-39)

**[alto, pendiente]** Categoría 7 (afirmación que contradice la fuente
citada). El recuadro "¿Ausencia de culpa o caso fortuito? El debate
Claro Solar / Abeliuk" (línea ~1134) atribuye a <strong>CLARO SOLAR</strong>
la tesis de que basta la ausencia de culpa y a <strong>ABELIUK</strong> la
exigencia del caso fortuito. **Verificado contra Orrego p.37-38 (la
misma fuente que el propio manual cita para este debate): está
invertido.** Desarrollo completo en el resumen ejecutivo, sección "El
hallazgo más importante", con la cita textual de Orrego que resuelve el
punto pendiente que `docs/camino-a-beta.md` tenía anotado desde antes
(`rc-just-028`/`rc-just-032`). **No se reabre acá el detalle**, solo se
deja la referencia. Además, **[bajo, pendiente]** categoría 2: falta el
ejemplo de Orrego sobre los herederos del comodatario que enajenan la
cosa creyéndose dueños (art. 2187 inc. 1.º), con su desarrollo de daño
emergente/lucro cesante/daño moral si actuaron de mala fe; el manual cita
el artículo pero no desarrolla el ejemplo.

### E.5.3 — El sistema decuple de Rodríguez Grez (fuente: Rodríguez Grez, íntegro por estructura)

**Sin hallazgos.** Se verificó que los diez pares de clasificación del
manual (real/virtual … intrínseco/extrínseco) coinciden exactamente con
la numeración 1 a 10 del propio libro de Rodríguez Grez. Tramo extenso y
bien logrado.

### E.5.5 — La pérdida de una chance u oportunidad (fuente: fallo Alpes Chemie c/ CENABAST, íntegro)

**Sin hallazgos.** Transcripción completa de las dos enseñanzas del
fallo y de los roles citados (154.662-2020, 4989-2019). Nota, no
hallazgo: el fallo es en rigor de responsabilidad **extracontractual**
del Estado (falta de servicio en una licitación), no un caso contractual;
el manual no lo aclara. No se marca como hallazgo porque la doctrina de
pérdida de chance se aplica de forma transversal a ambos estatutos y la
fuente de Laura tampoco distingue el punto, pero es una precisión que
Laura podría querer agregar si lo considera relevante para el examen.

### F.6 — La teoría de la imprevisión (fuente: sentencia CS Rol 217.959-2023, íntegra)

**Sin hallazgos.** Tramo notablemente completo: no solo transcribe la
sentencia de 2025 casi en su totalidad (incluida la frase clave sobre que
el caso fortuito "esconde" la imprevisión), sino que la combina con un
segundo fallo de 2024 (*Inmobiliaria El Bosque con Casampere*) que no
está en la carpeta de fuentes de este repositorio, más un recuadro que
explica cómo leer ambas sentencias juntas. Es de los tramos de mayor
calidad de todo el manual.

### G.4.3 — Requisitos de la acción pauliana (fuente: Boetsch + Orrego + Somarriva + jurisprudencia)

**Sin hallazgos.** Cruza correctamente Boetsch, Orrego, Somarriva,
Alessandri, Abeliuk, Claro Solar y un fallo real de la Corte Suprema
(18 de octubre de 2017, Rol 18.184-2017) sobre si el fraude pauliano
es una especie de dolo, incluyendo la postura que Orrego toma frente a
ese fallo. Tramo de calidad equivalente al de F.6.

### E.7.5 — La mora del acreedor (fuente: Aedo Barrena, secc. IV.2, p.9-12)

**[medio, pendiente]** Categorías 1 y 5. El manual trata la mora del
acreedor únicamente en su versión clásica (arts. 1548, 1680, 1827: mora
accipiendi, efectos sobre la conservación de la cosa y el riesgo). Falta
por completo el debate doctrinal moderno que **AEDO BARRENA** desarrolla
en extenso: si la falta de colaboración del acreedor es una simple
**carga** (sin responsabilidad, solo consecuencias restitutorias, tesis
de CATTANEO y DÍEZ-PICAZO) o un auténtico **deber secundario** cuyo
incumplimiento genera responsabilidad contractual del acreedor frente al
deudor, con las mismas herramientas de tutela que tiene el acreedor
frente al deudor, cumplimiento forzado e indemnización de perjuicios
(tesis de PRADO, a la que se suma recientemente BRANTT), más una postura
ecléctica de SAN MARTÍN (carga o deber según si la colaboración protege
un interés jurídicamente relevante del deudor). Es un tema doctrinal
completo, con nombre propio y citas específicas, no una omisión menor.

---

## Tanda 2 — Eje B. El incumplimiento contractual (fuente: Boetsch p.22-25, íntegro)

Transcripción de altísima fidelidad, casi palabra por palabra de Boetsch
(sección III.2, arts. 1556, 2.1 a 2.4), con un ejemplo propio añadido
("Las tres formas de incumplir") y jurisprudencia adicional (el mismo
fallo *Constructora Pardo y González*, Rol 217.959-2023, referenciado en
cruz con el eje F). Se verificaron puntualmente contra Orrego y Pizarro
los términos "obligación de medio"/"obligación de resultado" y
"excepción de contrato no cumplido": ambas fuentes solo los mencionan de
paso, sin desarrollo adicional que el manual no tenga ya. **Sin
hallazgos en ninguna de las 7 categorías.**

---

## Tanda 3 — Eje C. La acción de cumplimiento (fuente: Boetsch p.26-34, íntegro)

Igual de fiel que el eje B, con un valor agregado real: el detalle
procesal de los arts. 543 (apremio en las obligaciones de hacer) y
532-541 del CPC (procedimiento) es más extenso en el manual que en el
tramo específico de Boetsch cotejado, señal de que se completó con el
propio Código o con un desarrollo posterior del mismo libro no releído
en esta pasada. El recuadro sobre *aestimatio rei* vs. indemnización
(Peñailillo, Baraona) y el ejemplo de los "Tres deudores que no cumplen"
están completos y bien logrados. **Sin hallazgos en ninguna de las 7
categorías.**

---

## Tanda 4 — Eje D. La resolución por incumplimiento (fuente: Boetsch p.35-60; verificación por muestreo, no íntegra)

Verificado por muestreo dirigido, no por lectura completa de las 25
páginas de la fuente (el eje más extenso del manual). Se comparó contra
Boetsch el inicio de la sección (condición resolutoria tácita, ya
verificado en una sesión anterior a esta auditoría formal, con el debate
Claro Solar/Alessandri/Somarriva sobre si el incumplimiento debe ser
imputable), y se leyeron íntegramente en el manual los puntos 9-12
(efectos de la resolución, resolución vs. nulidad vs. resciliación,
pacto comisorio, cláusula de término unilateral). Se verificó también
contra Aedo Barrena el punto de la cláusula de término unilateral: Aedo
solo la menciona de paso (buena fe como límite a su ejercicio, citando a
Pizarro 2007 y 2008), contenido que el manual ya recoge con un fallo de
2019 sobre buena fe y término no abusivo. **Sin hallazgos de prioridad
media o alta.** Nota metodológica: al no haberse releído la fuente
completa de este eje línea por línea, la confianza en "sin hallazgos"
aquí es algo menor que en los demás ejes, aunque el patrón de fidelidad
observado en el resto del manual hace improbable un vacío grande sin
detectar.

---

## Ejes E, F, G y H: cobertura completa

Con las secciones "Puntos sueltos" de arriba (E.4.2, E.4.3, E.5.3, E.5.5,
E.7.5, F.6, G.4.3) más la lectura íntegra adicional de **E.3** (autonomía
de la indemnización, cinco fallos reales de la CS), **E.6** (teorías de
la causalidad), **E.10** (cláusula penal y su reducción por enormidad,
art. 1544), **F.1** (caso fortuito, con BRANTT, DE LA MAZA y VIAL),
**F.3-5** (estado de necesidad, hecho del acreedor, hecho ajeno),
**G.1** (derecho de prenda general), **G.3** (acción oblicua, con el
debate ALCALDE/ABELIUK sobre el alcance del art. 2466 y la nota de
Bello al Proyecto Inédito), **G.5** (beneficio de separación) y **H**
completa (1 a 3, incluidas las cuatro cláusulas de estilo y el octálogo
de FUEYO), los 8 ejes del manual quedan cubiertos por esta auditoría.
**Sin hallazgos de prioridad media o alta en ninguno de estos tramos**,
más allá de los 5 ya listados en el resumen ejecutivo.

No se releyeron línea por línea, por ser contenido puramente
definicional o procesal de bajo riesgo doctrinal: **E.1** (concepto y
naturaleza de la indemnización), **E.2** (clases compensatoria y
moratoria), y los pasos procesales más finos de **G.2** (medidas
conservativas). Nada de lo muestreado en ellos sugiere un problema.

## Balance final

De 8 ejes, **7 quedan con verificación de alta confianza** (A, B, C, E,
F, G, H) y **1 con verificación por muestreo, no exhaustiva** (D). El
manual de Contractual es, en conjunto, de **fidelidad muy alta** frente
a sus 5 fuentes: en decenas de tramos comparados palabra por palabra
contra Boetsch, Orrego, Pizarro, Aedo Barrena y Rodríguez Grez, solo
aparecieron 5 hallazgos reales, y ninguno de contenido inventado
(categoría 7 en el sentido de alucinación). El hallazgo de la
contradicción E.4.3/F.2 es la excepción que confirma la regla: se
detectó precisamente *porque* el resto del manual es tan fiel a fuente
que dos citas casi textuales del mismo pasaje de Orrego, en dos ejes
distintos, permitieron notar que una de las dos invirtió los nombres.
