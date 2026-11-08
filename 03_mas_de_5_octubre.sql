
--EJERCICIO 03: CLIENTES CON MAS DE 5 TRANSACCIONES EN OCTUBRE 2026

SELECT c.cliente_id,
       c.nombre,
       COUNT(*) AS cant_trx
FROM transacciones t
JOIN clientes c ON c.cliente_id = t.cliente_id
WHERE t.fecha >= '2026-10-01' AND t.fecha < '2026-11-01'
GROUP BY c.cliente_id , c.nombre
HAVING count(*) > 5;

