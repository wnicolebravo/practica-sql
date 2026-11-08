
--Ejercicio 5: top 3 clientes por monto dentro de cada segmento. Este ejercicio tiene dos pasos encadenados:
--1.Sumar el monto por cliente. Es tu ejercicio 1, con el segmento agregado.
--2.Rankear a los clientes dentro de cada segmento y quedarte con los 3 primeros


with TOTALES as(
SELECT c.cliente_id,
       c.nombre,
       c.segmento,
       SUM(t.monto) AS total
FROM transacciones t
JOIN clientes c ON c.cliente_id = t.cliente_id
WHERE t.estado = 'APROBADA'
GROUP BY c.cliente_id, c.nombre, c.segmento
) ,
RANKEADOS as (
select *, rank() over (partition by segmento order by total DESC) as puesto
from TOTALES
) select * from RANKEADOS where
puesto<= 3 
order by segmento,puesto;
