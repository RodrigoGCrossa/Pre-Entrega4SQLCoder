# Pre-entrega 4 - SQL CoderHouse

Proyecto correspondiente a la cuarta pre-entrega del curso de SQL de CoderHouse.

El objetivo de esta actividad es resolver distintos problemas de negocio mediante consultas SQL que combinan múltiples tablas utilizando `JOIN`, `LEFT JOIN`, funciones de agregación, `GROUP BY`, `HAVING`, subconsultas y `COALESCE`.

## Archivo principal

El repositorio contiene el archivo:

`pre-entrega-modulo4.sql`

Este script incluye las tres consultas solicitadas en la consigna.

## Consultas realizadas

### 1. Rentabilidad por categoría

Relaciona las tablas `ventas`, `productos` y `categorias`.

La consulta muestra:

- Nombre de la categoría.
- Unidades vendidas.
- Ingreso total.

Se utiliza `GROUP BY` para agrupar los resultados y `HAVING` para mostrar únicamente las categorías que superan un umbral definido de 5 unidades vendidas.

### 2. Clientes sin compras

Relaciona las tablas `clientes` y `ventas` mediante `LEFT JOIN`.

Permite identificar clientes registrados que todavía no realizaron compras.

Se utiliza `COALESCE` para mostrar `0` en lugar de valores nulos en la cantidad de unidades compradas.

### 3. Top de compras por cliente

Relaciona las tablas `clientes`, `ventas` y `productos`.

La consulta permite obtener:

- Nombre del cliente.
- Producto que compró más veces.
- Fecha de su última transacción.

Para identificar el producto más comprado se utiliza una subconsulta agrupada por producto.

## Conceptos utilizados

- `JOIN`
- `LEFT JOIN`
- Alias de tablas
- `SUM`
- `COUNT`
- `MAX`
- `GROUP BY`
- `HAVING`
- `COALESCE`
- Subconsultas
- `ORDER BY`

## Tecnologías

- PostgreSQL
- SQL
- Git
- GitHub
