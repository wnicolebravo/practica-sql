
--EJERCICIO7: TRNASACCIONES DUPLICADAS(MISMO CLIENTE, FECHA Y MONTO): DETECTARLAS Y QUEDARTE CON UNA.
----------PRIMERA PARTE DETECTARLAS 
SELECT cliente_id,
       fecha, monto,
       COUNT(*) AS veces
FROM transacciones 
GROUP BY cliente_id,fecha, monto
HAVING COUNT(*) > 1;

----------SEGUNDA PARTE: QUEDARTE CON UNA.
with NUMERADAS as (
SELECT t.*,
ROW_NUMBER() OVER (
PARTITION BY t.cliente_id,T.monto, t.fecha
ORDER BY  t.trx_id
) AS rn
FROM transacciones t
)
select * from NUMERADAS where RN>1;