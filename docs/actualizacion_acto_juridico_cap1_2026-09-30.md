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
- Ningún anexo (Bozzo e Ibarra, Cuadro comparativo, Causa Domínguez y
  Boetsch, Memorice) aporta contenido a este capítulo: todos son propios de
  Ineficacia (IV), Causa (II.D) o listas de artículos/definiciones que no
  agregan nada nuevo aquí.

## 2. Qué se encontró

**El capítulo I no viene de una reescritura de esta sesión**: ya estaba
escrito en el formato nuevo (h1/h2/h3, `.ejemplo`, `.callout`,
`.dato-grado`, `.enum-i`, `.enum-a-cursiva`), y es la primera vez que se
audita punto por punto contra Boetsch, igual que pasó con V y VI.

- **Inventario completo, sin huecos**: los 8 puntos y sus 16 subpuntos
  están todos presentes y cubren el contenido íntegro de Boetsch
  `principal_1`.
- **Contenido propio agregado, no viene de Boetsch**: en el punto 4
  (Concepto de acto jurídico), la cita de **ROUBIER** sobre qué distingue
  al acto jurídico del delito, y el ejemplo de **STOLFI** (el ladrón y el
  comprador persiguen el mismo fin práctico, pero solo uno celebra un acto
  jurídico). Ninguno de los dos está en el PDF de Boetsch. No se tocan: son
  enriquecimiento válido y ya aprobado en una sesión anterior a esta
  auditoría.
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

## 5. Siguiente paso

Con tu aprobación, se aplican solo los dos cambios de la sección 3
(bajar las cajas `.dato-grado` a texto), se verifica de nuevo
(mecánico + capturas) y se hace commit/push para que lo revises en vista
previa antes de mergear.
