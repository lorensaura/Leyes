# Plan del paywall (Capa 1 hecha — Capas 2 y 3 pendientes)

> El resumen de una línea vive en el Roadmap de `CLAUDE.md`.

Estado actual: **Capa 1 lista y probada (2026-08-04)**. Sigue abierto un
hueco: los **PDF son archivos públicos** (`digesto.cl/app/pdf/...` abren
sin login), así que compartir ese link se salta el paywall entero (Capa
2, ver abajo).

- **Orden:** el paywall se hace **después** de tener listo el Interrogador
  con IA (ver `docs/interrogador.md`), justo antes de mandar la app a los
  alumnos tester.
- **Capa 1 (rápida, para fase de feedback) — HECHA (2026-08-04):** lista
  blanca en Supabase (tabla `alumnas_autorizadas`, Laura la administra a
  mano desde Table Editor) + registro cerrado en dos capas:
  `api/auth-registro.js` chequea la lista antes de mandar el OTP, y
  además `hook_verificar_lista_blanca` (`scripts/supabase_schema_hook_lista_blanca.sql`)
  corre dentro de Supabase mismo en "Before User Created", así que un
  bypass directo a la API de Supabase (saltándose `auth-registro.js` con
  la llave pública) también queda bloqueado. Probado en producción: el
  bypass directo devuelve 403, el registro normal con correo autorizado
  sigue funcionando.
- **Capa 2 (antes de cobrar):** PDFs en bucket **privado** de Supabase con
  **URLs firmadas** (corta duración); contenido servido de forma
  autenticada (función serverless o RLS).
- **Capa 3 (monetizar):** pasarela chilena — **Flow / Mercado Pago / Webpay
  (Transbank)** → webhook marca "pagó" en Supabase → da acceso.

**Depende de esto (agregado 2026-07-13):** el cupo diario/mensual de
interrogaciones por plan de suscripción (ver `docs/interrogador.md`)
necesita saber qué plan tiene cada alumna — esa lógica de cupo no se debe
construir antes de que exista la Capa 3.
