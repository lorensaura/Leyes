# Generación de PDF

> El resumen de una línea vive en el Índice de `CLAUDE.md`. Leer esto solo
> cuando se esté tocando la generación de los PDF de los manuales.

- Se generan con **Chrome headless vía CDP** (Python + `websocket-client`),
  no con el "imprimir" del navegador. El script reutilizable está en
  `scripts/generar_pdf_manual.py` (uso: `python3 scripts/generar_pdf_manual.py
  <html> <pdf_salida> "<Título>"`). Correrlo de nuevo cada vez que cambie el
  contenido de un manual, para que el PDF descargable no quede desactualizado.
- **Regla de oro:** usar **márgenes reales de `printToPDF`**
  (marginTop/Bottom/Left/Right), NO `padding` del `<body>`. El padding solo
  deja margen en la 1ª/última página y genera una "franja negra" (contenido
  pegado al borde) en las páginas del medio.
- **Encabezado (decidido 2026-07-28, corrección de Laura vía nota anotada en
  el PDF):** "DIGESTO" (rojo) en la esquina izquierda; título del manual +
  "Examen de grado" juntos en la esquina derecha; línea separadora debajo.
  Ya no lleva el nombre de la autora. El padding lateral del header debe
  igualar `marginLeft/Right` (0.95in) para que calce con el texto. Pie con
  "Página X de Y" sin cambios.
- **El encabezado no aparece en la portada, solo desde la página 2** (mismo
  cambio 2026-07-28). Chrome sanitiza cualquier `<script>` dentro de
  `headerTemplate`/`footerTemplate`, así que no hay forma de esconderlo
  condicionalmente por página dentro de un solo `printToPDF`. La solución en
  `scripts/generar_pdf_manual.py` es imprimir el documento completo dos veces
  (una con `headerTemplate` vacío, otra con el real — mismos márgenes en
  ambas, así que la paginación no cambia) y unir con PyMuPDF (`fitz`):
  página 1 de la primera pasada + resto de páginas de la segunda.
- Portada centrada con `min-height` calculado según el área útil (Letter
  11in − márgenes).
- **Portada, índice y materia van cada uno en su propia página** (decidido
  2026-07-22). La portada fuerza su propio salto (`.cover{page-break-after:
  always}`); el inicio de la materia también fuerza el suyo (`h1{page-break
  -before:always}`), y ese segundo salto ya deja al índice en su propia
  página sin necesidad de que el índice fuerce uno adicional. **No agregar
  `page-break-after:always` a `.toc`**: sumado al salto del primer `h1`,
  duplica el salto y deja una página en blanco entre índice y materia
  (bug detectado y corregido 2026-08-13 en el manual de Extracontractual).
- **Índice anidado** (agregado 2026-08-13, primero en Extracontractual):
  el índice no solo lista los ejes con letra (`h1`, `.toc-l1`), sino
  también sus secciones numeradas (`h2`, `.toc-l2`) y subsecciones
  (`h3`, `.toc-l3`). Los `h1`/`h2` ya traían su ancla (`<span id="..."
  class="justiniano-ancla">` antes del título); los `h3` no traían id
  propio, así que se les agregó `id="{slug}-{LETRA}-{n1}-{n2}"`
  directamente en el tag (ej. `id="extracontractual-A-4-1"` para el
  "4.1." dentro del eje A) — un esquema nuevo, no toca las anclas
  `justiniano-ancla` que usa `scripts/agregar_anclas_manuales.js` para el
  Interrogador. Si se agrega un manual nuevo o se reordenan subsecciones,
  regenerar el índice con el mismo criterio (letra del `h1` más cercano +
  numeración propia del `h2`/`h3`).
- Un manual = un PDF con portada centrada (sin encabezado), índice en
  página(s) propia(s), y encabezado/pie parejos desde la página 2 en
  adelante.
- Fuentes: `01_Responsabilidad_Contractual_Manual.html`,
  `02_Responsabilidad_Extracontractual_Manual.html` y
  `03_Responsabilidad_Precontractual_Manual.html` → `app/pdf/*.pdf`.
- Requiere el paquete `PyMuPDF` (`import fitz`) además de
  `websocket-client`.
