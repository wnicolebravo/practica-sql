
--EJERCICIO 6: VARIACION DE MONTO TOTAL MES A MES
---La idea es mostrar, para cada mes, el monto total, el del mes anterior y la diferencia entre los dos. 
--Para mantener el mismo criterio que en los ejercicios anteriores, usá solo las transacciones APROBADA.


with MENSUAL as (
select DATE_TRUNC('month', fecha)::date as mes,
sum(monto) as total
from transacciones
where estado='APROBADA'
group by mes
) SELECT mes, total ,
lag (total) over (order by mes) as total_mes_anterior , 
total - lag(total) over (order by mes) as variacion 
FROM mensual ORDER BY mes;

---VARIACION PARA TRAER PORCENTAJE

with MENSUAL as (
select DATE_TRUNC('month', fecha)::date as mes,
sum(monto) as total
from transacciones
where estado='APROBADA'
group by mes
) ,
con_anterior as (
select MES, TOTAL,
lag(TOTAL) over (order by MES) as total_mes_anterior
from mensual)
select mes, total, total_mes_anterior,
total-total_mes_anterior as variacion,
ROUND(
    (total - total_mes_anterior) * 100.0 / NULLIF(total_mes_anterior, 0),
    2
) AS variacion_pct
from con_anterior order by mes;
