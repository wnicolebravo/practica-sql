
---EJERCICIO 4: ULTIMA TRANSACCION DE CADA CLIENTE 
-----4.1 ULITMA TRANSACCION APROBADA DE CADA CLIENTE

WITH ranked AS (
SELECT t.*,
ROW_NUMBER() OVER (
PARTITION BY t.cliente_id
ORDER BY t.fecha DESC, t.trx_id DESC
) AS rn
FROM transacciones t where t.estado='APROBADA'
)
SELECT cliente_id, trx_id, fecha, monto, estado
FROM ranked
WHERE rn = 1
ORDER BY cliente_id;

