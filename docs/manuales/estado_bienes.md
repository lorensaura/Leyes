# Estado: actualización de Bienes al método nuevo

> Se actualiza **in place** cada vez que Laura diga "guarda el estado
> [de Bienes]". Al decir "retoma Bienes" (o "empecemos Bienes"), leer
> este archivo completo primero y resumir en pocas líneas dónde quedó
> antes de seguir. Última actualización: 2026-10-07 (creado al cerrar
> Acto Jurídico; la actualización de Bienes todavía no empieza).

## Paso 0, obligatorio: leer las lecciones de Acto Jurídico

**Antes de tocar Bienes, leer completo
`docs/manuales/lecciones-acto-juridico.md`.** Acto Jurídico tuvo que
pasarse cuatro veces (y dos veces por varios capítulos) porque las
reglas fueron naciendo mientras se trabajaba y una de ellas (paráfrasis
cercana) se dio por cumplida sin chequearla. Laura pidió expresamente
(2026-10-07) que **Bienes se haga en una sola pasada**, con todo lo
aprendido aplicado desde el primer tramo. La sección 6 de ese reporte
trae el checklist único por tramo: usarlo en cada informe.

Después leer, en este orden: `actualizar-manuales-existentes.md`,
`proceso.md`, `guia-editorial.md`, `formato.md` (secciones que apliquen)
y `bienes-reestructuracion.md` (estructura actual del manual). El
archivo `estado_acto-juridico.md` sirve de modelo de cómo se lleva este
estado y trae el comando de Chrome headless que funciona.

## Dónde estamos

- Manual: `05_Bienes_Manual.html`, ya en capítulos romanos I-VII
  (estructura de Boetsch). Detalle en `bienes-reestructuracion.md`.
- **Ojo:** los tramos I a IV, V.1-V.3, V.4.A y V.4.B figuran como
  "revisados", pero **solo se revisaron por fidelidad a la fuente**
  (método de agosto-septiembre, `docs/incidente_compresion_manuales.md`),
  antes de la voz propia, el inventario exhaustivo, los ejemplos propios
  y las cajas nuevas. **No darlos por terminados:** pasan por el método
  completo igual que el resto, conservando lo que Laura ya agregó o
  corrigió (regla central de `actualizar-manuales-existentes.md` 1).
- Todavía no hay ningún tramo hecho con el método nuevo.

## Decisiones a tomar con Laura ANTES del primer tramo

Pendientes; no empezar el tramo 1 sin resolverlas (son las que en AJ
obligaron a volver atrás):

1. **Ejemplos.** Laura está trabajando una idea sobre los ejemplos
   (dicho el 2026-10-07). Preguntarle si ya la tiene: o se aplica desde
   el primer tramo, o se acuerda que los ejemplos van en una pasada
   final común a todos los manuales. No improvisar un criterio propio.
2. **Numeración.** Bienes no sigue la escalera de `formato.md` (ver
   "Diferencias con la escalera" en `bienes-reestructuracion.md`: nivel
   `V.1.` intermedio, `h4`-`h6`, títulos en mayúscula, `(i)` en
   cursiva). Decidir con Laura si se ajusta por tramo, de una vez al
   inicio, o se deja. En AJ el reformato fue una pasada aparte.
3. **Hoja de estilos.** Comparar la de Bienes con la de AJ (modelo):
   falta corregir la tipografía de sus 2 tablas (pendiente desde el
   2026-09-30, Laura dijo entonces "solo los de AJ") y probablemente
   faltan clases nuevas (`.ley`, `.definicion`, `.no-olvidar`,
   `.conexiones`, `.pregunta-clasica`, ancho de columna de cuadros).
   Proponer igualarla al inicio.
4. **Anexos grandes.** Fuentes en `Apuntes/CIVIL/Bienes/` del checkout
   principal (34 archivos): Boetsch en 20 partes
   (`BIENES_principal_N_...` / `Bienes_principal_N_...`), y anexos:
   PEÑAILILLO (libro completo), VIAL (*Relaciones jurídicas con una
   cosa* y *Tradición y prescripción*), ORREGO (acciones protectoras),
   posesión inscrita, adquisición/conservación/pérdida de la posesión,
   derechos reales fuera del art. 577, paralelo de derechos reales y
   personales, temario (INDEX) y Memorice (`.pages`). Para los grandes:
   **mapa primero y Laura elige qué entra** (`proceso.md` 5).
5. **Reparto de tramos** por página real de Boetsch (unas 10 páginas;
   más chico si el tema es muy preguntado). Anotarlo aquí en una tabla
   como la de `estado_acto-juridico.md`.

## Siguiente paso exacto

Leer las lecciones (paso 0), luego presentarle a Laura las cinco
decisiones de arriba en un mensaje corto, con una recomendación para
cada una, y esperar su respuesta antes de armar el primer informe.
