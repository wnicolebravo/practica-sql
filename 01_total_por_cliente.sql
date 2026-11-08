

--EJECICIO 01 : SE BUSCA TOTAL POR CLIENTE 
SELECT c.cliente_id,
       c.nombre,
       SUM(t.monto) AS total_aprobado
FROM transacciones t
JOIN clientes c ON c.cliente_id = t.cliente_id
WHERE t.estado = 'APROBADA'
GROUP BY c.cliente_id, c.nombre
ORDER BY total_aprobado DESC;
