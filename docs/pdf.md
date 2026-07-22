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
- Encabezado/pie con `displayHeaderFooter`: "DIGESTO" (rojo) + título del
  manual + "Laura Schultz Solano · Examen de grado" + "Página X de Y". El
  padding lateral del header debe igualar `marginLeft/Right` (0.95in) para
  que calce con el texto.
- Portada centrada con `min-height` calculado según el área útil (Letter
  11in − márgenes).
- **Portada, índice y materia van cada uno en su propia página** (decidido
  2026-07-22): `.toc{page-break-after:always}` en el `<style>` de cada
  manual. Antes el índice "fluía" hacia el contenido para no dejar media
  página en blanco; Laura prefirió separar siempre portada / índice /
  inicio de la materia, aunque el índice quede corto en su propia página.
- Un manual = un PDF con portada centrada, índice en página(s) propia(s), y
  encabezado/pie parejos en todas las páginas.
- Fuentes: `01_Responsabilidad_Contractual_Manual.html` y
  `02_Responsabilidad_Extracontractual_Manual.html` → `app/pdf/*.pdf`.
