# Acto Jurídico, capítulo I (Teoría general del acto jurídico) — auditoría contra Boetsch

Fecha: 2026-09-30. Rama: `worktree-acto-juridico-cap1`, desde `origin/main`
(que ya incluye todo el tramo 4: IV+V+VI completos).

## 1. Alcance y fuentes

Capítulo I completo: puntos 1 a 8 (Introducción, La teoría del AJ en el
Código, Los hechos jurídicos, Concepto de acto jurídico, El principio de la
autonomía de la voluntad con sus tres subpuntos, Estructura y elementos
constitutivos con sus tres subpuntos, Requisitos o condiciones con sus dos
subpuntos, y Clasificaciones con sus trece subpuntos).

- Fuente: Boetsch `principal_1`, "TEORÍA GENERAL DEL ACTO JURÍDICO"
  (páginas 12 a 30 de 221), 19 páginas, coincide exactamente con la
  extensión del capítulo I en el manual.
- **Los cuatro anexos se leyeron completos** (no solo por título) para
  confirmar si aportaban algo a este capítulo:
  - `Anexo_secundario_AJ_Ineficacia.pdf` (Bozzo e Ibarra): pese a su
    nombre de archivo, **sus primeras páginas sí tocan la Teoría
    General**: trae textual la cita de **ROUBIER** sobre qué distingue al
    acto jurídico del delito y el ejemplo de **STOLFI** del ladrón y el
    comprador. Es la fuente real de esos dos agregados en el punto I.4 del
    manual (no son un aporte inventado sin respaldo, como se dijo por
    error en una versión anterior de este informe). El resto del anexo
    (82.000 caracteres) es íntegramente sobre Lesión, Objeto, Simulación y
    Nulidad: materia de los capítulos II y IV, no de este capítulo.
  - `INEFICACIA JURÍDICA_Cuadro comparativo.pdf`: causales de ineficacia
    (inexistencia, resolución, retractación, suspensión, etc.), sin nada
    de Teoría General.
  - `Causa_ DOMINGUEZ y BOETSCH.pdf`: específico de la causa (II.D).
  - `Memorice_ART y Definiciones.pdf`: sus dos primeras definiciones
    ("Hecho jurídico" y "Acto Jurídico (Vial)") coinciden palabra por
    palabra con lo que ya está en I.3 e I.4; el resto de la lista es de
    Requisitos, Efectos, Ineficacia y Representación, materia de otros
    capítulos.

## 2. Qué se encontró

**El capítulo I no viene de una reescritura de esta sesión**: ya estaba
escrito en el formato nuevo (h1/h2/h3, `.ejemplo`, `.callout`,
`.dato-grado`, `.enum-i`, `.enum-a-cursiva`), y es la primera vez que se
audita punto por punto contra Boetsch, igual que pasó con V y VI.

- **Inventario completo, sin huecos**: los 8 puntos y sus 16 subpuntos
  están todos presentes y cubren el contenido íntegro de Boetsch
  `principal_1`.
- **Contenido que no viene de Boetsch pero sí de un anexo**: en el punto 4
  (Concepto de acto jurídico), la cita de **ROUBIER** sobre qué distingue
  al acto jurídico del delito, y el ejemplo de **STOLFI** (el ladrón y el
  comprador persiguen el mismo fin práctico, pero solo uno celebra un acto
  jurídico). Ninguno está en el PDF de Boetsch, pero ambos están
  transcritos casi textual en `Anexo_secundario_AJ_Ineficacia.pdf` (Bozzo
  e Ibarra), confirmado al leer el anexo completo (ver sección 1). No se
  tocan: es contenido con fuente verificada, ya incorporado.
- **23 artículos citados** (12, 46, 391, 393, 654, 999, 1386, 1437, 1438,
  1439, 1440, 1443, 1444, 1445, 1461, 1467, 1545, 1631 Nº 2, 1682, 1716,
  1802, 1962 Nº 1, 2413) verificados uno por uno contra el Código Civil:
  **los 23 coinciden exactamente** con el texto vigente. Sin errores, a
  diferencia de varios tramos anteriores (art. 1463, 1573, 1094 corregidos
  en su momento).
- Cero guiones largos, cero guillemets, ningún párrafo sobre 1.200
  caracteres, balance de etiquetas correcto (verificado con script).

## 3. Cambio propuesto (el único de este tramo)

Dos cajas `.dato-grado` (clase retirada según `formato.md` sección 7, el
mismo criterio ya aplicado en los tramos 4.1 y 4.8-4.9): bajarlas a texto
corrido, sin cambiar su contenido salvo lo necesario para que fluya como
párrafo.

1. **Punto I.7** ("¿Existe la inexistencia como sanción distinta de la
   nulidad?"): la pregunta clásica de cédula que sintetiza las dos
   doctrinas del punto. Se integra como párrafo final de la sección 7,
   después de 7.1 y 7.2.
2. **Punto I.8.1** ("Los actos recepticios son irrevocables desde que el
   destinatario los conoce"): la precisión sobre la irrevocabilidad de los
   actos unilaterales recepticios. Se integra como párrafo dentro de la
   explicación del acto unilateral, donde ya se define lo recepticio.

No se propone ningún otro cambio: no hay contenido faltante, no hay
ejemplos de Boetsch sin achilenizar (todos los ejemplos del capítulo son
abstractos o doctrinales, sin nombres propios de personas), y no hay
errores de artículos que corregir.

## 4. Pendientes para Laura

Ninguno nuevo. Los pendientes generales (jurisprudencia, conexiones con
`[FALTA: sección]`, etc.) no aplican a este capítulo introductorio.

## 5. Siguiente paso (superado, ver sección 6)

~~Con tu aprobación, se aplican solo los dos cambios de la sección 3...~~
Este informe original solo revisaba contenido y artículos. Faltaba el
chequeo de **paráfrasis cercana** (`guia-editorial.md` sección 3, paso
c de `actualizar-manuales-existentes.md`), que no se había aplicado en
ningún tramo de este hilo. Laura lo pidió expresamente y se hizo la
pasada completa: ver sección 6.

## 6. Reescritura en voz propia (pasada completa, 2026-09-30)

Al comparar oración por oración contra Boetsch, buena parte de la
prosa del capítulo (sobre todo los párrafos de "Concepto") resultó ser
**paráfrasis cercana**: misma construcción de la fuente con sinónimos
cambiados, sin comillas ni autor cuando correspondía. Confirmado el
mismo patrón en un tramo escrito en esta sesión (IV.C, La lesión) y en
otros dos ya mergeados a `main` y solo auditados (V.1, VI.A.1), lo que
indica que el chequeo faltó en todo el hilo, no solo en este capítulo.

**Criterio aplicado** (`guia-editorial.md`, sección 3, y precisión de
Laura sobre atribución):

- Si el párrafo reproduce la posición de un **autor con nombre**
  (VIAL, ROUBIER, STOLFI, ALESSANDRI), el arreglo es **atribución
  clara**: cita textual entre comillas y en bloque `.definicion`
  cuando el texto es literal (caso de VIAL en el punto 4), o reporte
  claramente atribuido cuando no se tiene el texto exacto del autor,
  solo una traducción o paráfrasis de un tercero (caso de ROUBIER y
  STOLFI, reformulados en voz propia pero con su nombre siempre
  presente).
- Si el párrafo es prosa de conexión o de resumen de Boetsch, **sin
  autor nombrado**, el arreglo es **reestructurar de verdad**: otro
  orden de cláusulas, otra forma de construir la oración, no solo
  cambiar palabras por sinónimos.

**Qué se reescribió:** el capítulo I completo, los 8 puntos y 16
subpuntos, con estos criterios:

- Se conserva íntegro el contenido, el vocabulario técnico y los
  artículos citados (ninguno se agregó, quitó ni cambió; verificado
  con script: mismos 23 números de artículo que en la sección 2).
- La definición de **VIAL** en el punto 4 pasa a bloque `.definicion`,
  citada textual y atribuida (antes estaba mezclada en el texto
  corrido, sin comillas).
- Las citas de **ROUBIER** y **STOLFI** se mantienen atribuidas por
  nombre, pero reformuladas en voz propia: no se tenían sus textos
  originales (solo la traducción/paráfrasis que trae el anexo Bozzo e
  Ibarra), así que ponerlas entre comillas como si fueran su cita
  exacta habría sido más riesgoso que reformularlas.
- A pedido de Laura, se aprovechó la reescritura para **destensar el
  tono** en varios puntos (preguntas retóricas, ejemplos cotidianos
  como el contrato de arriendo en la Introducción) sin alterar el
  contenido jurídico ni inventar nada nuevo.
- Se mantienen los dos ajustes de la sección 3 (las antiguas cajas
  `.dato-grado`), ahora también reescritas en voz propia y no solo
  bajadas a texto.

**Verificación mecánica** (repetida después de la reescritura): balance
de etiquetas OK (`p`, `div`, `span`, `em`, `strong`, `h2`, `h3`), cero
guiones largos y guillemets, ningún párrafo sobre 1.200 caracteres,
mismos 23 artículos citados (verificados por número), capturas de
Chrome headless revisadas bloque por bloque, capítulo completo desde
la Introducción hasta el cierre de 8.13.

No se tocó el índice ni ningún `h2`/`h3`.

## 7. Pendiente por decidir

Lo mismo que se encontró en capítulo I existe en contenido ya
mergeado a `main` (tramos 3 a 4.9: IV, V y VI completos). No se tocó
en esta pasada, a pedido de Laura ("primero cerremos capítulo I").
Queda pendiente decidir si se abre una rama de corrección para esos
capítulos o si se deja para la próxima vez que se trabaje sobre ellos.
