# Práctica SQL – Ingeniería de datos

Ejercicios de SQL sobre PostgreSQL 16 (Docker).

## Cómo ejecutarlo
1. `docker run -d --name pg-practica -e POSTGRES_PASSWORD=practica -p 5432:5432 postgres:16`
2. Ejecutar `00_setup.sql` para crear las tablas y los datos.
3. Ejecutar cada archivo `0X_*.sql`.

## Supuestos generales
- Los montos se calculan sobre transacciones APROBADA, salvo que se indique otra cosa.
- Los empates se resuelven por `trx_id`.
- Los datos tienen nulos, duplicados y montos negativos a propósito.

## Observaciones
- EJERCITACION BASICA DE SQL PARA PREPARACION

