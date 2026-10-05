# Chequeo de paráfrasis cercana: IV.F El fraude a la ley (2026-10-05)

## 0. Alcance

Mismo chequeo que en C, D y E, aplicado a IV.F (F.1 a F.5). El
contenido de fondo ya se había inventariado completo en el tramo 4.4
(`docs/actualizacion_acto_juridico_tramo4-4_fraude_2026-09-30.md`):
los 15 artículos citados coincidían (con la corrección ya hecha del
art. 1573→1578 Nº 3), y el anexo Bozzo e Ibarra aportó la cita de VIAL
DEL RÍO/FERRARA y las tres diferencias de VODANOVIC con la
simulación. Este informe no reabre esa parte: solo revisa cercanía de
redacción.

Fuentes: Boetsch `principal_15...pdf` (pp. 177-186 de 221) y
`Anexo_secundario_AJ_Ineficacia.pdf` (apartado de fraude a la ley, p.
25-26 del anexo), ambos extraídos completos con `fitz`.

## 1. Resultado general

De los 24 párrafos de prosa de F.1 a F.5, **13 tenían paráfrasis
cercana** sin autor nombrado y se reescribieron en voz propia, mismo
contenido, mismos artículos.

Varios pasajes citaban casi palabra por palabra la posición de un
autor con nombre (COVIELLO, LARENZ, VIAL, VIAL DEL RÍO/FERRARA,
FERREIRA, DIEZ-PICAZO, BARROS) sin comillas, pese a tenerse el texto
exacto de Boetsch o del anexo: se **agregaron comillas** para marcarlos
como cita textual atribuida, en vez de reescribirlos en otras palabras
(mismo criterio que con ALCALDE/JOSSERAND en D). La cita de ALCALDE ya
estaba correctamente en `.definicion` con comillas, sin cambios.

Los párrafos con la lista de 10 artículos del Código (F.2) y el listado
de requisitos de FERRARA o las tres diferencias de VODANOVIC (F.4.1)
se dejaron sin tocar donde ya eran una enumeración atribuida o un
catálogo de citas legales, difícil de reformular sin alterar el
contenido.

Un párrafo (F.4.1) quedó en 1.254 caracteres tras la reescritura: se
dividió en dos, sin perder contenido.

## 2. Tabla de veredictos (resumida)

| Unidad | Veredicto |
|---|---|
| F.1, concepto | Reescribir |
| F.1, ejemplo (Bauffremont/Fritz Mandel) | OK (ya es caja de ejemplo condensada) |
| F.1, COVIELLO/LARENZ/VIAL | Comillas de cita atribuida |
| F.1, .definicion ALCALDE | OK (ya con comillas) |
| F.2, código argentino + DOMÍNGUEZ (fraus omnia corrumpit) | Reescribir la parte sin autor; DOMÍNGUEZ atribuido, suavizado |
| F.2, Mensaje + lista de 10 artículos | OK (enumeración de citas legales) |
| F.2, Ley de Matrimonio Civil / Código Tributario | OK (ya paráfrasis de ley, no de Boetsch) |
| F.2, ejemplo VODANOVIC (cónyuges) | Reescribir, atribución intacta |
| F.3(i), licitud de los actos + FERRARA | Reescribir el marco; lista de FERRARA intacta |
| F.3(ii), ley defraudada | Reescribir |
| F.3(iii), elemento intencional | Reescribir |
| F.4.1, semejanzas/diferencias con DOMÍNGUEZ/ALCALDE | Reescribir el marco; atribuciones intactas |
| F.4.1, VIAL DEL RÍO/FERRARA | Comillas de cita atribuida |
| F.4.1, tres diferencias de VODANOVIC (i)-(iii) | OK (enumeración atribuida) |
| F.4.2, FERREIRA/DIEZ-PICAZO/BARROS | Comillas de cita atribuida |
| F.4.2, catálogo de conductas de abuso del derecho | Reescribir |
| F.4.2, relación fraude/abuso + BARROS | Reescribir el marco; BARROS con comillas |
| F.5, sanción (DOMÍNGUEZ vs. otros, art. 1344 italiano) | Reescribir el marco; DOMÍNGUEZ atribuido |
| F.5, distinción práctica (art. 10, fraude a acreedores, desasimiento) | Reescribir |
| F.5, Conexiones (acción pauliana) | OK (caja ya reestructurada) |

**13 de 24 unidades reescritas, 6 resueltas con comillas de cita
atribuida.**

## 3. Verificación mecánica

- Balance de etiquetas OK: `p` (25/25), `div` (4/4), `span` (62/62),
  `em` (9/9), `strong` (25/25), `h2` (6/6), `h3` (2/2).
- Cero guiones largos y guillemets.
- Ningún párrafo sobre 1.200 caracteres (se dividió el único que
  quedó en 1.254 tras la reescritura).
- Los 17 artículos y referencias verificados siguen presentes.
- Capturas de Chrome headless revisadas bloque por bloque.
- No se tocó el índice: no se agregó ni cambió ningún `h2`/`h3`.

## 4. Pendiente

Laura pidió seguir sin pausar a esperar aprobación del informe. Queda
pendiente que confirme la vista previa (`AJ_vista_previa.html`, ancla
`#cIV-F`), junto con las de C, D y E (ya revisadas y aprobadas).
