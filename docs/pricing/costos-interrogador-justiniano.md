# Costo real a Digesto (API de Anthropic) por plan

> Esto es cuánto le cuesta a Laura cada plan en uso de la API de Claude,
> no lo que se le cobra a la alumna (eso está en
> `docs/pricing/planes-y-precios.md`). Calculado 2026-08-07 con precios
> oficiales de Anthropic vigentes esa fecha. **Reconfirmar precios antes
> de reusar este cálculo en el futuro** (cambian con cada modelo nuevo).

## Precios base usados (Anthropic, 2026-08-07)

| Modelo | Input /1M tok | Output /1M tok | Cache write 1h | Cache read |
|---|---|---|---|---|
| Opus 4.8 (Interrogador modo Examen) | $5.00 | $25.00 | $10.00 | $0.50 |
| Sonnet 5 (Interrogador modo Práctica + Justiniano) | $3.00 (**$2.00 promo hasta 31-ago-2026**) | $15.00 ($10.00 promo) | $6.00 ($4.00 promo) | $0.30 ($0.20 promo) |
| Haiku 4.5 (router de Justiniano) | $1.00 | $5.00 | $2.00 | $0.10 |

**Ojo:** el precio de Sonnet 5 es promocional hasta el 31 de agosto de
2026. Después de esa fecha sube ~50% (de $2/$10 a $3/$15 por millón de
tokens). Todo lo que corre en Sonnet (interrogaciones Práctica +
Justiniano) sube ese ~50% ese día — no es un evento hipotético, ya tiene
fecha.

## Costo por unidad de uso

- **Interrogación modo Examen (Opus 4.8):** ~US$1.90 por sesión (cifra
  medida y confirmada en `docs/camino-a-beta.md`, sesión normal sin cola
  post-cierre).
- **Interrogación modo Práctica (Sonnet 5):** ~US$0.95 por sesión (misma
  fuente).
- **Interacción con Justiniano:** **US$0.02 a US$0.03, estimado** (no
  medido — Justiniano no está construido, ver `docs/interrogador.md`).
  Arquitectura asumida: router Haiku 4.5 barato (~$0.002/interacción,
  índice de la materia + últimos mensajes) + respuesta Sonnet 5 con el
  fragmento del manual elegido (~4.000 tokens de entrada + ~600 de
  salida, ~$0.021). Es mucho más liviano que una interrogación completa
  (una sola pregunta/respuesta, no una sesión de 15-40 mensajes).
  **Cuando se construya Justiniano, remedir con
  `cache_read_input_tokens`/`cache_creation_input_tokens` reales en vez
  de esta estimación de arquitectura.**

No incluye costo fijo de plataforma (Vercel, Supabase) — solo el costo
marginal de API por alumna.

## Costo mensual estimado por plan (a Digesto)

| Plan | Cálculo | Costo/mes (USD) |
|---|---|---|
| Práctica | 30 Justiniano/semana × 4.33 = ~130/mes × $0.025 | ~$3.25 |
| Estándar | 2 examen × $1.90 + 4 práctica × $0.95 + 60 Justiniano × $0.025 | ~$9.10 |
| Gradista | 4 examen × $1.90 + 8 práctica × $0.95 + 100 Justiniano × $0.025 | ~$17.70 |

## Costo por unidad de Recarga

- +1 interrogación examen: $1.90 de costo
- +1 interrogación práctica: $0.95 de costo
- +1 interacción Justiniano: $0.025 de costo (~$0.25 para una bolsa de 10)

## Cruce rápido con precio de venta (referencia, no margen exacto)

Tipo de cambio no fijado acá a propósito (varía) — para una lectura
rápida de orden de magnitud, ~950 CLP/USD:

| Plan | Precio mensual (CLP) | ≈USD | Costo API (USD) | Margen bruto aprox. |
|---|---|---|---|---|
| Práctica | $8.990 | ~$9.5 | ~$3.25 | amplio |
| Estándar | $19.990 | ~$21 | ~$9.10 | amplio |
| Gradista | $34.990 | ~$36.8 | ~$17.70 | amplio |

Esto es una referencia gruesa, no un modelo de margen real (falta costo
fijo de plataforma, pasarela de pago, y el tipo de cambio real del mes).
Antes de tomar decisiones de precio con esto, recalcular con cifras
actuales.
