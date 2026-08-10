// Registro de uso real de IA durante la beta (tokens + costo estimado en
// USD), para poder cruzar cuánta plata gastó cada alumna con qué tan en
// serio tomar su feedback. Lo usan api/interrogador.js y api/justiniano.js
// después de cada respuesta. Ver docs/camino-a-beta.md y
// scripts/supabase_schema_uso_ia_beta.sql.
//
// OJO, alcance: esto registra solo la llamada PRINCIPAL de cada turno (la
// que genera la respuesta que ve la alumna) -- no las llamadas chicas
// internas (el router de Haiku 4.5 del Interrogador, el resumen de memoria
// entre sesiones), que por diseño son baratas ("una llamada chica y
// barata", ver docs/interrogador.md) y no cambian el orden de magnitud del
// costo real. El número que queda guardado es una muy buena aproximación
// del gasto real, no el desglose exacto centavo a centavo.

const SUPABASE_URL = 'https://byyukzhxhtopojgvgglp.supabase.co';

// Precio de lanzamiento de Sonnet 5 vigente hasta el 2026-08-31 (2026-09-01
// 00:00 UTC en adelante rige el precio de lista). Si cambia el precio de
// Anthropic antes o después de esa fecha, actualizar acá.
function precioSonnet5() {
  const finIntro = new Date('2026-09-01T00:00:00Z');
  return new Date() < finIntro ? { input: 2, output: 10 } : { input: 3, output: 15 };
}

const PRECIOS_POR_MTOK = {
  'claude-opus-4-8': { input: 5, output: 25 },
  'claude-sonnet-5': precioSonnet5,
};

function precioModelo(modelo) {
  const p = PRECIOS_POR_MTOK[modelo];
  if (!p) return null;
  return typeof p === 'function' ? p() : p;
}

// `ttlCache`: '1h' o '5m' -- el que use ESA llamada puntual en su
// cache_control (no algo que se pueda leer del `usage` que devuelve
// Anthropic). Multiplicador de escritura de caché: 2x para 1h, 1.25x para
// 5m. Lectura de caché: 0.1x siempre.
function calcularCostoUSD(modelo, usage, ttlCache) {
  const precio = precioModelo(modelo);
  if (!precio || !usage) return null;

  const multiplicadorEscritura = ttlCache === '1h' ? 2 : 1.25;
  const inputTokens = usage.input_tokens || 0;
  const outputTokens = usage.output_tokens || 0;
  const cacheEscritura = usage.cache_creation_input_tokens || 0;
  const cacheLectura = usage.cache_read_input_tokens || 0;

  return (
    (inputTokens * precio.input) / 1e6 +
    (outputTokens * precio.output) / 1e6 +
    (cacheEscritura * precio.input * multiplicadorEscritura) / 1e6 +
    (cacheLectura * precio.input * 0.1) / 1e6
  );
}

// Inserta una fila con el uso de esta llamada. Nunca lanza -- un fallo acá
// no debe cortarle la respuesta a la alumna, solo se loggea y se sigue.
// Usa SUPABASE_SECRET_KEY (se salta RLS a propósito, mismo patrón que
// interrogaciones_diarias y justiniano_uso_diario).
async function registrarUsoIA({ userId, feature, modo, modelo, usage, ttlCache }) {
  try {
    const costoUsd = calcularCostoUSD(modelo, usage, ttlCache);
    const resp = await fetch(`${SUPABASE_URL}/rest/v1/uso_ia_beta`, {
      method: 'POST',
      headers: {
        apikey: process.env.SUPABASE_SECRET_KEY,
        Authorization: `Bearer ${process.env.SUPABASE_SECRET_KEY}`,
        'Content-Type': 'application/json',
        Prefer: 'return=minimal',
      },
      body: JSON.stringify({
        user_id: userId,
        feature,
        modo: modo || null,
        modelo,
        input_tokens: (usage && usage.input_tokens) || 0,
        output_tokens: (usage && usage.output_tokens) || 0,
        cache_creation_tokens: (usage && usage.cache_creation_input_tokens) || 0,
        cache_read_tokens: (usage && usage.cache_read_input_tokens) || 0,
        costo_usd: costoUsd,
      }),
    });
    if (!resp.ok) {
      console.error('Error registrando uso de IA:', resp.status, await resp.text());
    }
  } catch (e) {
    console.error('Error registrando uso de IA (no crítico):', e);
  }
}

module.exports = { calcularCostoUSD, registrarUsoIA };
