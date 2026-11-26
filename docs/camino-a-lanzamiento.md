# Camino al lanzamiento de Digesto (vender)

> Plan vivo para pasar de beta cerrada a **Digesto en venta**. Creado el
> 2026-11-26. **Fecha meta: lunes 8 de febrero de 2027** (lanzamiento
> público) **con todo Civil** (cambio del 2026-11-26: Laura pasa a
> dedicación completa, 8+ horas al día; ver "Meta de contenido"). Se actualiza **in place**: lo que se termina se marca `[x]`,
> lo que cambia se corrige ahí mismo. Reemplaza a `docs/camino-a-beta.md`
> como punto de partida de cada sesión (ese doc quedó congelado en
> agosto y sirve solo como detalle histórico de pendientes de contenido).
> Informe visual para Laura: `DERECHO LIBRE/Informes/Informe_plan_lanzamiento.html`.

## La idea central

Lo que impide vender **no es el contenido**, es que hoy nadie puede
pagar y entrar sola. El contenido ya alcanza para vender
(Responsabilidad x3 + Acto Jurídico). Lo que falta es la "caja
registradora": pasarela de pago, acceso automático al pagar, PDFs
protegidos, precios en la landing, términos y privacidad, y alguien
que se entere de que existe.

**Meta de contenido (decidida por Laura el 2026-11-26): todo Civil**
(Acto Jurídico, Bienes, Obligaciones, Contratos, Familia, Sucesorio,
además de Responsabilidad, que ya está) antes de vender. Ver la sección
siguiente.

## Meta de contenido: todo Civil al 8 de febrero

**Por qué es posible:** hasta noviembre Laura no estaba dedicada
completa. Dato medido el 2026-11-26: revisó 47 preguntas de Nulidad en
2 horas (~25 por hora). Su revisión total estimada es de 190 a 300
horas (tramos de manual a 30-45 min c/u, ~2.300 preguntas a ~25/hora,
pruebas y decisiones), y hay ~430 horas disponibles (8 h x 6 días x 10
semanas, menos feriados). **El nuevo cuello de botella es que Claude
tenga siempre listo el siguiente tramo**: se trabaja con dos sesiones en
paralelo (una prepara, otra se revisa).

**Cuota diaria (6 días a la semana):**
- **3 a 4 tramos de manual aprobados** (~3 a 4 horas de Laura).
- **~45 preguntas revisadas** (~2 horas).
- **1 hora de venta/trámites** (semanas 1 a 6 del plan de abajo).
- El resto: pruebas, decisiones, imprevistos.

**Orden y metas semanales** (~18 tramos por semana; si algo se atrasa,
se atrasa lo último, no lo primero):

| Semanas | Manual | Preguntas en paralelo |
|---|---|---|
| 30 nov a 9 dic | Bienes terminado (~21 tramos) | AJ cerrado (Nulidad publicada, resto de temas, Alternativas, Memorice) |
| 10 dic a 29 dic | Obligaciones (~35 tramos, desde cero) | Bienes |
| 30 dic a 19 ene | Contratos (~45 tramos, estimado) | Obligaciones |
| 20 ene a 5 feb | Familia (~35, estimado) | Contratos |
| 6 feb a ~19 feb | Sucesorio (~35, estimado) | Familia y Sucesorio |

**Riesgo honesto:** a 18 tramos por semana, Sucesorio termina hacia
mediados de febrero. Red de seguridad: se lanza igual el 8 de febrero y
Sucesorio (y sus preguntas) se anuncia "disponible en febrero". Las
cifras de Contratos, Familia y Sucesorio son estimadas: sus fuentes no
están en `Apuntes/CIVIL` (carpetas vacías al 2026-11-26). **Bloqueante
de la semana 1: que Laura las ubique.** Por confirmar: si Teoría de la
Ley, Personas y Cauciones entran (sumarían ~20 a 30 tramos).

**Ya existe, no es trabajo nuevo:** cuaderno de errores (falta solo
agruparlo por tipo, medio día). **Gamificación:** versión liviana
(puntos y "¡bien hecho!"; la racha ya existe) en enero, 4 a 6 días de
Claude; la liga, después del lanzamiento. **Interrogador y JustinIAno:**
se amplían a cada materia apenas su manual queda aprobado (1 a 2 días
de Claude por materia).

## Decisiones (con recomendación; Laura confirma o cambia)

| # | Decisión | Recomendación | Estado |
|---|---|---|---|
| D1 | Catálogo del lanzamiento | **Decidido: todo Civil** (ver "Meta de contenido"); lo que no alcance se anuncia con fecha | decidido 2026-11-26 |
| D2 | Pasarela | **Flow** (chilena, acepta Webpay, tarjetas y transferencia, alta simple para persona natural o empresa). Alternativa: Mercado Pago | por confirmar |
| D3 | Tipo de cobro | **Solo pagos únicos** al lanzar: "pase" de 30 días (mensual), semestral y anual. Sin suscripción automática (evita cobros recurrentes, cancelaciones y reclamos). Suscripción automática se evalúa después | por confirmar |
| D4 | Precios | Los definidos el 2026-08-07 (`docs/pricing/planes-y-precios.md`), **revisando el margen del Gradista** (ver "Costos" abajo). Precio fundadora: 40% de descuento para las primeras alumnas (beta + lista de espera) | por confirmar |
| D5 | Recargas | Fuera del lanzamiento. Se agregan en febrero si alguien se queda corta | por confirmar |
| D6 | Fechas | **Decidido: primeras semanas de febrero.** Lanzamiento suave (fundadoras) lunes **1 de febrero**; público lunes **8 de febrero** | decidido 2026-11-26 |
| D7 | Canales de venta | Instagram + TikTok de Digesto, grupos de egresadas/os de derecho, centros de alumnos, boca a boca de las 5 beta | por confirmar |

## Costos (corregido 2026-11-26)

La promo de Sonnet terminó el 31-ago-2026: Interrogación Práctica y
Justiniano cuestan ~50% más que lo anotado en
`docs/pricing/costos-interrogador-justiniano.md`. Recalculado a uso
máximo del plan (US$, aprox.): Práctica ~4,9; Estándar ~11,8; Gradista
~22,8. El Gradista ($34.990 con IVA incluido, ~US$31 sin IVA, menos
~3,5% de pasarela) deja ~US$7 si una alumna usa todo su cupo. Opciones:
subir a $39.990, bajar a 3 interrogaciones examen/mes, o aceptarlo
(casi nadie usa el 100%). **Reconfirmar precios de la API de Anthropic
y de los modelos en uso antes de fijar precios definitivos.**

Dato corregido: **JustinIAno (chat de dudas) sí está construido** desde
el 2026-08-08 (`app/justiniano.html` + `api/justiniano.js`). Lo que no
existe es la "persona unificadora" (idea futura). Los 3 planes se
pueden vender tal como están definidos.

## Plan por semana

Formato: **L** = lo hace Laura; **C** = lo hace Claude (en sesión con
Laura); **D** = decisión.

### Semana 1 (30 nov a 6 dic): trámites largos y diagnóstico
- [ ] L: abrir cuenta en la pasarela elegida (D2). Suele pedir RUT,
  cuenta bancaria y a veces inicio de actividades; la aprobación puede
  tardar días o semanas, por eso va primero.
- [ ] L: SII: confirmar inicio de actividades (persona natural o
  empresa) y cómo emitir **boleta electrónica** por cada venta (Flow y
  otros pueden emitirla automáticamente; confirmar).
- [ ] L: crear `admin@digesto.cl` (Google Workspace) y poner la tarjeta
  en Voyage AI (pendientes desde agosto).
- [ ] L: escribir a las 5 alumnas beta: ¿lo usaron?, ¿qué les sirvió?,
  ¿pagarían?, ¿cuánto? Ofrecerles precio fundadora.
- [ ] C: revisar en Supabase si hubo uso real de la beta (tablas de
  uso). Si en 3 meses nadie lo usó, es un dato importante: hay que
  entender por qué antes de cobrar.
- [ ] D: confirmar D1 a D7.

### Semana 2 (7 a 13 dic): la caja registradora, parte 1
- [ ] C: Capa 2 del paywall: PDFs a bucket privado de Supabase con
  enlaces firmados (hoy son públicos por link directo).
- [ ] C: tabla de planes en Supabase (`plan`, `vence_el`) conectada a la
  lista blanca que ya existe (Capa 1 sigue haciendo el bloqueo).
- [ ] C: cupos por plan en Interrogador y Justiniano (hoy es un tope
  fijo igual para todas).
- [ ] L: con ayuda de Claude, redactar **Términos y condiciones**,
  **Política de privacidad** y política de devolución/retracto (Ley del
  Consumidor). Ojo: confirmar la entrada en vigencia de la nueva ley de
  datos personales (Ley 21.719, prevista para el 1 de diciembre de 2026).

### Semana 3 (14 a 20 dic): la caja registradora, parte 2
- [ ] C: Capa 3: botón de pago, página de retorno, y aviso automático
  de la pasarela (webhook) que activa el plan en Supabase al pagar.
- [ ] C: registro abierto para quien paga (hoy solo entra quien Laura
  agrega a mano).
- [ ] C+L: prueba de punta a punta en modo prueba de la pasarela: pagar,
  recibir correo, entrar, ver el plan, que venza a los 30 días.

### Semana 4 (21 a 27 dic, Navidad): contenido que se vende
- [ ] C+L: corregir la inversión Claro Solar / Abeliuk en Contractual
  (E.4.3 vs F.2, ver `docs/camino-a-beta.md`). Error doctrinal en un
  manual pagado = riesgo de reputación.
- [ ] C: enlazar el manual de Acto Jurídico en `app/manuales.html` y
  habilitarlo en la app.
- [ ] C: fusionar `worktree-aj-ejemplos-error` y publicar la corrección
  flexible (Laura corre el SQL en Supabase).
- [ ] L: revisar las preguntas de AJ pendientes (Nulidad: Detección de
  error y Justificación) para publicarlas.

### Semana 5 (28 dic a 3 ene, Año Nuevo): vitrina
- [ ] C: landing: precios reales, precio fundadora, botón "Comprar",
  enlaces a términos y privacidad, y formulario de lista de espera
  conectado (`api/waitlist.js` existe pero la landing no lo usa).
- [ ] C: revisar la landing y la app en celular (la mayoría va a entrar
  desde el teléfono).
- [ ] L: abrir/activar cuentas de Instagram y TikTok; preparar 6 a 8
  publicaciones (un tip de examen por publicación, sacado de los
  manuales).

### Semana 6 (4 a 10 ene): ensayo general
- [ ] C: regenerar los PDFs una sola vez, ya con todo corregido.
- [ ] C+L: compra real con tarjeta propia (y devolución) en producción.
- [ ] C: revisar costos y límites (Anthropic, Voyage, Supabase, Vercel)
  para que un pico de uso no corte el servicio.
- [ ] L: armar la lista de fundadoras (beta + lista de espera + contactos).

### Semana 7 (11 a 17 ene, ahora se usa para contenido; esto se corre a la semana del 1 de febrero): lanzamiento suave
- [ ] L: abrir venta solo a fundadoras (lunes 1 de febrero). Meta: **10 ventas**.
- [ ] C+L: corregir lo que reporten, rápido.
- [ ] L: pedir 2 o 3 testimonios para la landing.

### Semana 8 (se corre a la semana del 8 de febrero): lanzamiento público
- [ ] C: testimonios en la landing, ajustes finales.
- [ ] L: publicaciones diarias, contacto con centros de alumnos y grupos.
- [ ] **Lunes 8 de febrero: venta abierta a todo público.**

## Después del lanzamiento (no antes)
Lo que no alcance de Civil (con fecha anunciada); Recargas; liga de gamificación; suscripción
automática; casos para resolver; Justiniano como persona unificadora;
interrogación oral.

## Métricas a mirar desde el día 1
Visitas a la landing, registros, ventas por plan, uso semanal por alumna,
costo de IA por alumna vs lo que pagó.
