-- Consultas para comparar Método A vs Método B en Memorice.
-- No es un panel: son consultas para pegar en el SQL Editor de Supabase y
-- correr cuando quieras mirar los números. Van a decir poco hasta que haya
-- semanas de uso real acumulado — con pocos datos, cualquier diferencia es ruido.

-- 1. Retención a 7 y 30 días por método.
-- % de aciertos en el PRIMER intento de una sesión, sobre artículos que ya
-- se habían visto antes (no la primera vez que se practican).
with primer_intento_del_dia as (
  select distinct on (user_id, articulo_id, metodo, date(creado_en))
    user_id, articulo_id, metodo, date(creado_en) as dia, resultado, creado_en
  from memorice_intentos
  order by user_id, articulo_id, metodo, date(creado_en), creado_en asc
)
select
  metodo,
  count(*) as intentos_ya_vistos,
  round(100.0 * count(*) filter (where resultado = 'correcto') / nullif(count(*), 0), 1) as pct_acierto_primer_intento
from primer_intento_del_dia
group by metodo;

-- 2. Sesiones hasta dominio (cuántos días distintos con acierto tomó llegar
-- a "dominado", por método). Se apoya en sesiones_con_acierto una vez que
-- el artículo llegó a 3.
select
  metodo,
  round(avg(jsonb_array_length(sesiones_con_acierto)), 2) as promedio_sesiones_hasta_dominio,
  count(*) as articulos_dominados
from memorice_progreso
where estado = 'correcto' and jsonb_array_length(sesiones_con_acierto) >= 3
group by metodo;

-- 3. Tasa de abandono por método (ítems mostrados y nunca evaluados).
select
  metodo,
  count(*) as total_intentos_o_abandonos,
  round(100.0 * count(*) filter (where abandono) / nullif(count(*), 0), 1) as pct_abandono
from memorice_intentos
group by metodo;

-- 4. Tiempo promedio por artículo (segundos hasta evaluar), por método y nivel.
select
  metodo,
  nivel,
  round(avg(segundos_hasta_evaluar), 1) as segundos_promedio,
  count(*) as intentos
from memorice_intentos
where abandono = false and segundos_hasta_evaluar is not null
group by metodo, nivel
order by metodo, nivel;

-- 5. Extra: errores en palabras críticas por método (¿cuál produce más
-- errores "graves" en promedio, no solo más errores en general?).
select
  metodo,
  round(avg(errores_en_palabras_criticas), 2) as errores_criticos_promedio,
  round(avg(porcentaje_vacios_acertados) * 100, 1) as pct_acierto_promedio
from memorice_intentos
where abandono = false
group by metodo;
