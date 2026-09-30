# Acto Jurídico — Tramo 4, sub-tramo 4.1: La lesión (IV.C)

> Informe de cambios propuestos. Sigue el método de
> `docs/manuales/actualizar-manuales-existentes.md`. No se ha tocado el
> manual todavía: este documento se detiene a la espera de la
> aprobación de Laura.

## 0. Alcance del tramo 4 completo y por qué se divide en 9 sub-tramos

El "tramo 4" original (`docs/manuales/estado_acto-juridico.md`) agrupaba
bajo una sola etiqueta "IV.C a IV.G" siete instituciones que en
realidad son **75 páginas** de fuente Boetsch (pp. 151-221 de 221) más
un capítulo entero de Representación (Parte V) y otro de Modalidades
(Parte VI) que no son "IV.C-G" sino capítulos aparte. Laura pidió
separarlo en varios y evitar imprecisión, así que el reparto se hizo
por páginas reales del PDF (el número "Página N de 221" que imprime
cada hoja de Boetsch, no el conteo de páginas de cada PDF fragmentado,
que se solapan una página en cada empalme).

| Sub-tramo | Institución | Páginas Boetsch (de 221) | Archivo(s) fuente |
|---|---|---|---|
| **4.1** | IV.C La lesión | 151-160 | `principal_12` (p. 160 se repite al inicio de `principal_13`; no duplicar) |
| 4.2 | IV.D La simulación | 160-170 | `principal_13` (p. 170 se repite al inicio de `principal_14`) |
| 4.3 | IV.E La inoponibilidad | 170-177 | `principal_14` (p. 177 se repite al inicio de `principal_15`) |
| 4.4 | IV.F El fraude a la ley | 177-186 | `principal_15` (el título "Otras causales de ineficacia" y su párrafo introductorio ya aparecen en la última página de este PDF, p. 186, no en `principal_16`) |
| 4.5 | IV.G Otras causales de ineficacia (G.1-G.9) | 186-189 | intro en `principal_15` p. 186; G.1-G.6 (Suspensión, Resolución, Resciliación, Revocación, Desistimiento, Caducidad) en `principal_16` pp. 187-189. **G.7-G.9 (Terminación, Renuncia, Muerte) no están en Boetsch: vienen del anexo `INEFICACIA JURÍDICA_Cuadro comparativo.pdf` (Bozzo e Ibarra)** — ver nota abajo |
| 4.6 | V.1-V.5 La representación (concepto, utilidad, poder de representación, naturaleza jurídica, influencia de circunstancias personales) | 190-199 | `principal_16` |
| 4.7 | V.6-V.10 La representación (requisitos, efectos, sanción de actos sin poder, ratificación, otras hipótesis) | 200-208 | `principal_16` |
| 4.8 | VI + VI.A La condición | 209-215 | `principal_17` |
| 4.9 | VI.B El plazo + VI.C El modo | 216-221 | `principal_17` |

Nota sobre 4.5: el manual actual ya tiene contenido para G.7 (La
terminación), G.8 (La renuncia) y G.9 (La muerte), y en un primer
chequeo contra Boetsch no aparecían en ninguna parte de la fuente
principal ni en el índice de materiales (`acto_juridico_INDEX.md`), lo
que iba a quedar señalado como "sin fuente verificada". Antes de
reportarlo así se revisaron los tres anexos (`Anexo_secundario_AJ_
Ineficacia.pdf`, `INEFICACIA JURÍDICA_Cuadro comparativo.pdf`,
`Memorice_ART y Definiciones.pdf`) y se encontró que el **Cuadro
comparativo de Bozzo e Ibarra** sí trae una fila para TERMINACIÓN,
RENUNCIA y MUERTE, con concepto y efectos respecto de partes y
terceros. Es la fuente real de esos tres puntos; se confirmará el
contenido exacto cuando se trabaje el sub-tramo 4.5 (no se tocan en
este informe, que es solo de 4.1).

Este informe cubre **solo el sub-tramo 4.1 (La lesión)**. Los demás
quedan para después, uno a la vez, con su propio informe y aprobación.

## 1. Qué se hizo para este informe

- Extracción completa del texto de `principal_12` (Boetsch, La lesión,
  pp. 151-160) con `fitz`.
- Lectura completa del `IV.C` actual del manual (líneas 2675-2735 de
  `04_Acto_Juridico_Manual.html`).
- Cruce unidad por unidad contra la fuente.
- Revisión del anexo secundario `Anexo_secundario_AJ_Ineficacia.pdf`
  (Bozzo e Ibarra) para ver si aporta algo que Boetsch no traiga.
- Verificación artículo por artículo contra `Apuntes/Codigo Civil
  Chileno.pdf` con regex sobre el texto extraído (arts. 1234, 1348,
  1350, 1440, 1441, 1442, 1451, 1454, 1460, 1535, 1544, 1888, 1889,
  1890, 1897, 1900, 2206, 2431, 2435, 2436, 2443, 2458, 46).

## 2. Inventario unidad por unidad

| Unidad | Fuente (Boetsch) | Manual actual | Estado |
|---|---|---|---|
| C.1 Concepto doctrinal | pp. 151-152 | Presente, completo | **Está** |
| C.2 ¿Constituye vicio del consentimiento? (criterios subjetivo/objetivo/mixto, tesis DUCCI) | pp. 152-155 | Presente, completo | **Está** (formato a ajustar, ver 3.1 y 3.3) |
| C.3 Casos regulados (i)-(viii) | pp. 155-160 | Presente, los 8 casos | **Está** (un ejemplo a corregir, ver 3.2) |
| C.4 Sanción de la lesión | p. 160 | Presente, completo | **Está** |

**Conclusión del inventario: no falta contenido.** Los cuatro puntos
de IV.C ya están en el manual y cubren fielmente lo que dice Boetsch,
incluidos los ocho casos taxativos y la tesis minoritaria de DUCCI. Lo
que sigue son ajustes de forma, no de fondo.

## 3. Cambios propuestos

### 3.1 Caja `.dato-grado` (retirada) en C.2

La tesis de DUCCI está hoy en una caja `.dato-grado`, clase que
`docs/manuales/formato.md` marca como **retirada**: "no se usa en
contenido nuevo. Queda en la hoja de estilos solo para los manuales
que todavía la tienen, hasta su revisión." AJ es justamente uno de los
manuales que todavía la tiene (en esta única aparición del capítulo
IV).

Propuesta: convertirla en `.no-olvidar` en lugar de `.callout` ("No
confundir"), porque no contrasta dos conceptos que se confundan entre
sí, sino que señala una postura minoritaria puntual que conviene no
pasar por alto en un examen. Alternativa más simple: bajarla a párrafo
corrido, sin caja. Laura decide cuál de las dos.

### 3.2 Ejemplo de la hipoteca (C.3, caso viii) no es propio

La regla de `docs/manuales/decisiones.md` es que **todos los ejemplos
deben ser propios** (nombres chilenos), nunca los de la fuente con los
números cambiados. El ejemplo actual:

> "Un deudor tiene con un banco una deuda de $30.000 recibidos en
> mutuo, más $20.000 por sobregiros en cuenta corriente... puede pedir
> que se limite a $100.000, el duplo..."

es el mismo ejemplo de Boetsch (p. 159-160), con las mismas cifras
($30.000, $20.000, $100.000) sin cambiar nada. Propuesta: reemplazarlo
por un ejemplo propio con nombres chilenos, mismo mecanismo legal
(hipoteca de garantía general limitada al duplo del art. 2431), cifras
distintas. Ejemplo de reemplazo a proponer en la reescritura:

> Doña Marta hipoteca su casa a favor del Banco Estado con una
> cláusula de garantía general que respalda toda obligación presente o
> futura. Contrae con el banco un crédito de consumo de $8.000.000 y
> luego gira en rojo $2.000.000 en su cuenta corriente. Aunque la
> cláusula no fije tope, doña Marta puede exigir que la hipoteca se
> limite a $20.000.000, el duplo del importe conocido de la obligación
> principal ($10.000.000).

### 3.3 Criterios subjetivo/objetivo/mixto (C.2) sin `enum-i`

Boetsch los presenta como (a)/(b)/(c). El manual los tiene en prosa,
con el nombre del criterio en negrita dentro del párrafo, sin
enumeración. El resto del manual (ya reformateado) usa `(i)/(ii)/(iii)`
en negrita cuando abre una clasificación (regla de
`docs/manuales/decisiones.md`). Propuesta: convertir los tres párrafos
a `enum-i` con `(i) Criterio subjetivo.`, `(ii) Criterio objetivo.`,
`(iii) Criterio mixto.`, manteniendo el texto igual.

### 3.4 Candidato a caja `.ley`

El art. 1889 (define exactamente qué es la lesión enorme del
vendedor y del comprador, el punto más citado en examen de este punto)
es candidato a una caja `.ley` con la frase clave en negrita, siguiendo
la decisión del tramo 3 (art. 1687). Se muestra hoy solo parafraseado.
Propuesta de caja:

> **Art. 1889.** El vendedor sufre lesión enorme, cuando el precio que
> recibe es inferior a la mitad del justo precio de la cosa que vende;
> y el comprador a su vez sufre lesión enorme, cuando el justo precio
> de la cosa que compra es inferior a la mitad del precio que paga por
> ella. El justo precio se refiere al tiempo del contrato.

(negrita en "es inferior a la mitad del justo precio... paga por
ella", que es lo que se pregunta en examen).

## 4. Anexo secundario (Bozzo e Ibarra): no aporta contenido nuevo

Se revisó la sección de Lesión del anexo (pp. 2-4 del PDF del anexo).
Trae la misma discusión (vicio subjetivo vs. objetivo, tres razones
para la tesis objetiva) con otras palabras, sin casos ni artículos
adicionales a los que ya trae Boetsch. No hay nada que incorporar de
ahí a este punto.

## 5. Verificación de artículos contra el Código Civil

Los 23 artículos citados en IV.C (1234, 1348, 1350, 1440, 1441, 1442,
1451, 1454, 1460, 1535, 1544, 1888, 1889, 1890, 1897, 1900, 2206, 2431,
2435, 2436, 2443, 2458, 46) se verificaron íntegros contra `Apuntes/
Codigo Civil Chileno.pdf`. **Los 23 coinciden exactamente** con el
texto vigente citado en el manual; no hay ninguna cita errónea ni
desactualizada. (El art. 77 del Código de Minería y el art. 8 de la
Ley Nº 18.010, citados también en este punto, no están en el Código
Civil por definición; se toman por buenos tal como los cita Boetsch,
que los transcribe literalmente.)

## 6. Pendiente para Laura

1. Aprobar o ajustar la propuesta 3.1 (qué caja reemplaza a
   `.dato-grado`, o bajarla a párrafo).
2. Aprobar el ejemplo de reemplazo de 3.2 (u otro que Laura prefiera).
3. Aprobar 3.3 (conversión a `enum-i`) y 3.4 (agregar caja `.ley` para
   el art. 1889).
4. Confirmar el reparto del tramo 4 completo en 9 sub-tramos (tabla de
   la sección 0) antes de seguir con 4.2.

Con la aprobación se reescribe IV.C con `Edit`, se verifica (balance
de etiquetas, cero guiones largos, frases clave del inventario
presentes, diff línea por línea de lo eliminado), se muestran capturas
de Chrome headless, y se sigue con el sub-tramo 4.2 (La simulación).
