# Chequeo de paráfrasis cercana: IV.D La simulación (2026-10-05)

## 0. Alcance

Mismo chequeo que en C. Lesión, aplicado a IV.D (D.1 a D.4.5). El
contenido de fondo ya se había inventariado completo en el tramo 4.2
(`docs/actualizacion_acto_juridico_tramo4-2_simulacion_2026-09-30.md`):
los 11 artículos citados coincidían, y el anexo Bozzo e Ibarra aportaba
contenido real (no solo redacción distinta). Este informe no reabre
esa parte: solo revisa cercanía de redacción, contra **ambas**
fuentes, porque D.4.4-4.5 vienen en parte del anexo, no de Boetsch.

Fuentes: Boetsch `principal_13...pdf` (pp. 160-170 de 221) y
`Anexo_secundario_AJ_Ineficacia.pdf` (apartado de simulación, pp. 24-26
del anexo), ambos extraídos completos con `fitz`.

## 1. Resultado general

De los 33 párrafos de prosa de D.1 a D.4.5, **19 tenían paráfrasis
cercana** sin autor nombrado (16 de Boetsch, 3 del anexo: la acción de
simulación completa y el párrafo de "doblemente protegidos"). Se
reescribieron en voz propia, mismo contenido, mismos artículos,
mismos ejemplos propios (Rodrigo/Cristóbal, Cristina/Ignacio/Josefina,
ya achilenizados desde el tramo 4.2, no se tocaron).

Tres casos especiales, resueltos con atribución en vez de
reestructuración, según el criterio de `decisiones.md` 2026-09-30:

- **LEÓN** (definición de simulación): ya estaba atribuido con
  claridad, sin cambios.
- **ALCALDE y JOSSERAND**: el texto reproducía casi palabra por palabra
  la cita que Boetsch hace de ALCALDE (quien a su vez cita a
  JOSSERAND), pero sin comillas. Se agregaron comillas para marcarlo
  como cita textual atribuida, en vez de reescribir el contenido de
  ALCALDE en otras palabras.
- **La definición de simulación ilícita de la Corte Suprema** (inicio
  de 4.1): se agregaron comillas a la definición literal del fallo de
  30 de marzo de 2015, en vez de reescribirla (es la propia Corte
  quien la acuñó, no prosa de conexión de Boetsch).
- La cita de **Ferrara** y el fallo de la Corte Suprema de **1918**
  (en 4.4) ya estaban o quedaron correctamente entre comillas.

Ningún párrafo supera 1.200 caracteres (el más largo, 1.141, el de los
tres efectos de la simulación lícita). No hay ejemplos sin
achilenizar (los de Rodrigo/Cristóbal y Cristina/Ignacio/Josefina ya
eran propios desde el tramo 4.2). El cuadro comparativo de efectos (4.3)
ya estaba en tabla, sin paráfrasis porque es una reestructuración
genuina.

## 2. Tabla de veredictos (resumida)

| Unidad | Veredicto |
|---|---|
| D.1 Concepto, párr. 1 (simulación absoluta/relativa) | Reescribir |
| D.1, definición de LEÓN | OK (ya atribuida) |
| D.1, reserva mental (1ª parte) | Reescribir |
| D.1, acto unitario | OK (adición propia, sin match en la fuente) |
| D.2, códigos extranjeros + art. 1707 | Reescribir (conectores; la lista de códigos se mantiene) |
| D.2, simulación penal/tributaria | OK (ya condensado y reordenado) |
| D.3, "no es en sí misma..." | Reescribir |
| D.3, ALCALDE/JOSSERAND | Convertido a cita textual atribuida |
| D.3, jurisprudencia CS 2015 (causa simulandi) | OK (caja de jurisprudencia) |
| D.3, "muy habitual..." (contraescritura) | Reescribir |
| D.3, "doble finalidad" | Reescribir |
| D.3, jurisprudencia 1936/1991 | OK (cajas de jurisprudencia) |
| D.3, efectos (partes/terceros buena fe/mala fe) | Reescribir |
| D.4.1, intro (definición CS) | Comillas agregadas |
| D.4.1, requisitos (i)-(iv) | OK (son la propia enumeración de la Corte, ya atribuida en la intro) |
| D.4.1, jurisprudencia rol 9.631-2012 | OK (caja de jurisprudencia) |
| D.4.2, simulación absoluta | Reescribir (primera y última frase; ejemplo propio intacto) |
| D.4.2, simulación relativa | Reescribir |
| D.4.2, ejemplo Cristina/Ignacio/Josefina | Reescribir solo la última frase; ejemplo intacto |
| D.4.3, legitimación y nulidad absoluta | Reescribir |
| D.4.3, art. 10 y art. 1768 | Reescribir |
| D.4.3, cuadro comparativo | OK (ya en tabla) |
| D.4.3, "doblemente protegidos" (del anexo) | Reescribir |
| D.4.4, prueba de presunciones (Ferrara, CS 1918) | Reescribir conector; comillas en ambas citas |
| D.4.4, prueba testigos / delito civil (del anexo) | Reescribir |
| D.4.4, jurisprudencia Concepción/CS 2015-2017 | OK (cajas de jurisprudencia) |
| D.4.5, acción de simulación (del anexo) | Reescribir, muy cercano |
| D.4.5, acciones civil/penal (del anexo) | Reescribir |

**19 de 33 unidades reescritas**, 3 resueltas con atribución/comillas,
11 ya estaban bien (cajas de jurisprudencia, adiciones propias, o ya
reestructuradas).

## 3. Verificación mecánica

- Balance de etiquetas OK: `p` (33/33), `div` (4/4), `span` (67/67),
  `em` (12/12), `strong` (29/29), `table`/`tr`/`th`/`td` (1/3/3/6, sin
  cambios), `h2` (5/5), `h3` (5/5).
- Cero guiones largos y guillemets.
- Ningún párrafo sobre 1.200 caracteres (máximo 1.141).
- Los 21 artículos y referencias verificados siguen presentes (117,
  1414, 1991, 1994, 2019, 240, 543, 190, 305, 1707, 471, 466, 4 quáter,
  1796, 1467, 1681, 10, 1768, 1709, 686, 1491, 1876).
- Capturas de Chrome headless revisadas bloque por bloque.
- No se tocó el índice: no se agregó ni cambió ningún `h2`/`h3`.

## 4. Pendiente

Laura pidió seguir con D mientras revisaba C (Lesión) en paralelo, sin
pausar a mostrar este informe antes de aplicar los cambios. Queda
igual, como con C, pendiente que confirme la vista previa
(`AJ_vista_previa.html`, ancla `#cIV-D`) antes de darlo por cerrado.
