-- =====================================================
-- Setup de tablas para practicar SQL (PostgreSQL)
-- Correlo entero en DBeaver con Alt+X (Execute script)
-- Los datos tienen trampas a propósito: nulos,
-- duplicados, empates y estados raros.
-- =====================================================
 

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
 
 
-- Chequeo rápido: deberías ver 8 clientes y 28 transacciones
SELECT 'clientes' AS tabla, COUNT(*) FROM clientes
UNION ALL
SELECT 'transacciones', COUNT(*) FROM transacciones;


--EJECICIO 01 : SE BUSCA TOTAL POR CLIENTE 
SELECT c.cliente_id,
       c.nombre,
       SUM(t.monto) AS total_aprobado
FROM transacciones t
JOIN clientes c ON c.cliente_id = t.cliente_id
WHERE t.estado = 'APROBADA'
GROUP BY c.cliente_id, c.nombre
ORDER BY total_aprobado DESC;
