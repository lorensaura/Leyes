# Estrategia de precios y planes — Digesto

> Precios de venta definidos por Laura (2026-08-07). Esto es lo que se
> cobra a la alumna. Para el costo real a Digesto (API de Anthropic) por
> cada plan, ver `docs/pricing/costos-interrogador-justiniano.md`.
>
> **Estado: definido, sin publicar todavía.** La sección de Precios de
> `index.html` (`app/index.html`? no, es el `index.html` de la raíz,
> sección `#pricing`) sigue mostrando "Por definir" — cargar estos montos
> ahí es un paso pendiente, no asumir que ya están en la landing.

## Plan Práctica

**Público:** alumnas que ya tienen interrogador humano, o que solo buscan
ejercitar y consultar dudas sin interrogaciones IA.

**Incluye:** acceso ilimitado a la plataforma (casos, reglas directas,
flashcards) + chat Justiniano (máx. 30 interacciones/semana). Sin
interrogaciones IA.

| Ciclo | Precio |
|---|---|
| Mensual | $8.990 CLP |
| Semestral (~18% desc., pago único) | $43.990 CLP |
| Anual (~25% desc., pago único) | $79.990 CLP |

## Plan Estándar

**Público:** el plan recomendado para preparación regular y constante.

**Incluye:** todo lo del Plan Práctica + 2 interrogaciones modo examen/mes
+ 4 interrogaciones modo práctica/mes + 60 interacciones con
Justiniano/mes.

| Ciclo | Precio |
|---|---|
| Mensual | $19.990 CLP |
| Semestral (~18% desc., pago único) | $97.990 CLP |
| Anual (~25% desc., pago único) | $179.990 CLP |

## Plan Gradista

**Público:** alumnas en la recta final del examen que necesitan
entrenamiento intensivo.

**Incluye:** todo lo del Plan Práctica + 4 interrogaciones modo examen/mes
+ 8 interrogaciones modo práctica/mes + 100 interacciones con
Justiniano/mes.

| Ciclo | Precio |
|---|---|
| Mensual | $34.990 CLP |
| Semestral (~18% desc., pago único) | $169.990 CLP |
| Anual (~25% desc., pago único) | $309.990 CLP |

## Plan Recarga (unidades / bolsas extra)

Para alumnas de cualquier plan que se quedan cortas antes de que se
renueve el ciclo.

| Bolsa | Precio |
|---|---|
| 10 interacciones Justiniano | $990 CLP |
| 1 interrogación modo práctica | $2.490 CLP |
| 1 interrogación modo examen | $4.490 CLP |
| Combi (1 examen + 2 práctica + 20 Justiniano) | $8.990 CLP |

## Pendiente

- Cargar estos montos en la sección Precios de `index.html` (hoy dice
  "Por definir" en las 3 tarjetas).
- Justiniano (el chat que dan por incluido en los 3 planes y que vende la
  Recarga) **no está construido todavía** — ver
  `docs/interrogador.md` sección "Justiniano: persona unificadora". No
  cobrar por algo que no existe: definir con Laura si el lanzamiento de
  precios espera a que Justiniano esté en producción, o si sale primero
  sin esa pieza y se ajusta el plan después.
- El cupo diario/mensual real de interrogaciones (2 examen, 4 práctica,
  etc.) todavía no tiene mecanismo de conteo por plan de suscripción en
  Supabase — hoy `DIARIO_LIMITE` en `api/interrogador.js` es un tope
  diario fijo para todas las alumnas (ver `docs/paywall.md`, nota del
  2026-07-13: "el cupo diario/mensual de interrogaciones por plan de
  suscripción necesita saber qué plan tiene cada alumna, esa lógica no
  se debe construir antes de que exista la Capa 3 del paywall").
