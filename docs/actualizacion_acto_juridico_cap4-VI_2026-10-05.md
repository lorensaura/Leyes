# Chequeo de paráfrasis cercana: VI. Modalidades de los actos jurídicos (2026-10-05)

## 0. Alcance

Mismo chequeo que en C, D, E, F, G y V, aplicado a VI completo (intro,
A. La condición, B. El plazo, C. El modo). El contenido de fondo ya se
había verificado completo en el tramo 4.8-4.9
(`docs/actualizacion_acto_juridico_tramo4-8-9_modalidades_2026-09-30.md`):
los 28 artículos citados coincidían con el Código Civil (salvo los dos
ya corregidos entonces: 1463→1473 en el concepto de condición, y el
párrafo del art. 1094 reescrito con contenido propio porque Boetsch lo
cita mal). Este informe no reabre esa parte: solo revisa cercanía de
redacción.

Fuente: Boetsch `principal_17` ("MODALIDADES DEL AJ", pp. 209-221 de
221), extraído completo con `fitz`. Es un PDF propio, distinto al
`principal_16` de los tramos 4.5-4.7 y del capítulo V. Ningún anexo
aporta contenido a Modalidades (ya confirmado en el tramo original).

## 1. Resultado general

De los 48 párrafos de prosa del capítulo (contando los dos que se
dividieron por extensión durante este chequeo), **40 tenían paráfrasis
cercana** de la prosa de conexión de Boetsch, sin autor nombrado, y se
reescribieron en voz propia, mismo contenido, mismos artículos. El
patrón es el mismo que en V: el capítulo venía con el formato nuevo
desde una sesión anterior, con contenido completo y ejemplos ya
achilenizados, pero nunca se había auditado párrafo por párrafo contra
Boetsch.

**Un caso se resolvió con cita textual, no con reescritura**: el
párrafo de 2.4 (Potestativa, casual o mixta) que reporta una
jurisprudencia sobre la condición suspensiva meramente potestativa del
deudor. Boetsch transcribe el fallo entre comillas pero sin indicar
rol; el manual lo tenía parafraseado en estilo indirecto, sin comillas.
Se agregaron las comillas sobre el texto exacto que ya se tenía (mismo
criterio que ALCALDE/JOSSERAND en D y los seis autores de F), sin
inventar un rol que Boetsch no da.

**6 unidades no se tocaron**, porque ya estaban genuinamente
reestructuradas o no son prosa doctrinal parafraseable:

- "Las modalidades tienen tres características" (mero enunciado,
  sin contenido de Boetsch que parafrasear).
- 3. Estados en que pueden hallarse las condiciones (ya condensado en
  una sola oración distinta a las cuatro de Boetsch).
- B.2 Semejanzas y diferencias del plazo y la condición (ya convertido
  a lista `(i)/(ii)/(iii)` y tabla comparativa en el tramo 4.8-4.9; esa
  conversión es la reestructuración que pide la regla).
- C.3, segundo párrafo (regla del art. 1094 con el ejemplo de Camila):
  contenido propio escrito en el tramo 4.8-4.9 para corregir la cita
  errónea de Boetsch, no parafrasea su prosa.
- Los ejemplos ya achilenizados (Cristóbal, Javiera, Bastián/Fernanda,
  tío Walter, primo Gonzalo/Antonia, don Hernán, sobrina Constanza) se
  mantuvieron sin cambios; solo se reescribió la prosa de conexión a
  su alrededor.
- Los ejemplos abstractos sin nombre propio de Boetsch (estrella con
  la mano, aseguradora/incendio, venta/Europa, arriendo/matrimonio)
  tampoco se tocaron, mismo criterio que el ejemplo romano de V.2.2 en
  tramos anteriores: no hay nombre que achilenizar y el manual ya los
  presenta como ejemplos clásicos o genéricos.

## 2. Verificación mecánica

- Balance de etiquetas OK sobre el bloque completo de VI (`p`, `span`,
  `h2`, `h3`, `em`, `strong`, `table`, `tr`, `th`, `td`).
- Cero guiones largos y guillemets.
- Dos párrafos que superaban 1.200 caracteres tras la reescritura
  (patrimoniales/familia, y los dos de 2.4 sobre potestativa/casual/
  mixta) se dividieron en dos sin perder contenido; ningún párrafo
  queda sobre el límite.
- Los 28 artículos citados siguen presentes (1444, 1554 Nº 3, 1489,
  904, 1227, 1192, 102, 1070, 1473, 1071, 1493, 1474, 1475, 1479, 1477,
  1485, 761, 1078, 1492, 1487, 1494, 1495, 2201, 378, 1089, 1094, 1090,
  1092), igual que las 7 cajas `.ley` (1477, 1485, 1492, 1487, 1089,
  1094, 1090).
- Verificado con Chrome headless (impresión a PDF de todo el manual,
  páginas 122-129 corresponden al capítulo VI): las 7 cajas `.ley`, la
  tabla comparativa de B.2 y la cita de jurisprudencia con comillas
  renderizan correctamente.
- No se tocó el índice: no se agregó ni cambió ningún `h1`/`h2`/`h3`.

## 3. Cierre del chequeo de paráfrasis cercana de Acto Jurídico

Con VI, **termina el chequeo de paráfrasis cercana capítulo por
capítulo** que empezó con el tramo piloto IV.A: I (capítulo completo,
en otra rama), IV (A-G completo), V (La representación) y ahora VI
(Modalidades) ya pasaron por el chequeo y están reescritos donde hacía
falta. Queda pendiente la confirmación de Laura en vista previa para
este último tramo.

## 4. Pendiente

Falta que Laura confirme la vista previa (`AJ_vista_previa.html`,
ancla `#cVI`), igual que con los tramos anteriores de este hilo.
