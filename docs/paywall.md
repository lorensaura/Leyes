# Plan del paywall (PENDIENTE — 3 capas)

> El resumen de una línea vive en el Roadmap de `CLAUDE.md`.

Estado actual: hay **login, NO paywall**. Dos huecos: el **registro está
abierto** (cualquiera crea cuenta) y los **PDF son archivos públicos**
(`digesto.cl/app/pdf/...` abren sin login). Compartir ese link se salta
todo.

- **Orden:** el paywall se hace **después** de tener listo el Interrogador
  con IA (ver `docs/interrogador.md`), justo antes de mandar la app a los
  alumnos tester.
- **Capa 1 (rápida, para fase de feedback):** lista blanca en Supabase
  (solo correos aprobados entran) + cerrar el registro abierto.
- **Capa 2 (antes de cobrar):** PDFs en bucket **privado** de Supabase con
  **URLs firmadas** (corta duración); contenido servido de forma
  autenticada (función serverless o RLS).
- **Capa 3 (monetizar):** pasarela chilena — **Flow / Mercado Pago / Webpay
  (Transbank)** → webhook marca "pagó" en Supabase → da acceso.

**Depende de esto (agregado 2026-07-13):** el cupo diario/mensual de
interrogaciones por plan de suscripción (ver `docs/interrogador.md`)
necesita saber qué plan tiene cada alumna — esa lógica de cupo no se debe
construir antes de que exista la Capa 3.
