
---EJERCICIO 8: MONTO ACUMULADO POR CLIENTE A LO LARGO DEL TIEMPO

--RECORDATORIO DE TABLAS
CREATE TABLE clientes (
    cliente_id  INTEGER PRIMARY KEY,
    nombre      VARCHAR(50) NOT NULL,
    segmento    VARCHAR(20),
    fecha_alta  DATE NOT NULL
);
 
CREATE TABLE transacciones (
    trx_id      SERIAL PRIMARY KEY,
    cliente_id  INTEGER NOT NULL REFERENCES clientes(cliente_id),
    fecha       DATE NOT NULL,
    monto       NUMERIC(12,2),
    estado      VARCHAR(20)
);
 

select cliente_id, trx_id,fecha,monto ,
sum(monto) OVER(
partition by cliente_id order by fecha,trx_id) as acumulado
from transacciones where estado='APROBADA'
order by cliente_id,fecha;
