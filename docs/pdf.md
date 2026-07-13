# Generación de PDF

> El resumen de una línea vive en el Índice de `CLAUDE.md`. Leer esto solo
> cuando se esté tocando la generación de los PDF de los manuales.

- Se generan con **Chrome headless vía CDP** (Python + `websocket-client`),
  no con el "imprimir" del navegador.
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
- Un manual = un PDF con portada centrada, índice que fluye, y
  encabezado/pie parejos en todas las páginas.
- Fuentes: `01_Responsabilidad_Contractual_Manual.html` y
  `02_Responsabilidad_Extracontractual_Manual.html` → `app/pdf/*.pdf`.
