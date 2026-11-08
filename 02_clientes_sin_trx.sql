
--EJECICIO 02 : CLIENTES QUE NO TIENEN NINGUNA TRANSACCION

select c.cliente_id, c.nombre from clientes c left join transacciones t  ON c.cliente_id = t.cliente_id  where t.monto is null ;

--query mas optima
SELECT c.cliente_id, c.nombre
FROM clientes c
LEFT JOIN transacciones t ON c.cliente_id = t.cliente_id
WHERE t.trx_id IS NULL;

