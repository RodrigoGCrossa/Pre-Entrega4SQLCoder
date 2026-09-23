-- 1. Rentabilidad por categoría
-- Esta consulta permite identificar qué categorías generan mayor volumen de ventas e ingresos.
-- El umbral se define en 5 unidades vendidas para concentrar el análisis en categorías con un nivel de ventas relevante.
SELECT
    c.nombre AS categoria,
    SUM(v.cantidad) AS unidades_vendidas,
    SUM(v.cantidad * p.precio) AS ingreso_total
FROM ventas AS v
JOIN productos AS p
    ON v.producto_id = p.producto_id
JOIN categorias AS c
    ON p.categoria_id = c.categoria_id
GROUP BY c.categoria_id, c.nombre
HAVING SUM(v.cantidad) > 5
ORDER BY ingreso_total DESC;

-- 2. Clientes sin compras
-- Esta consulta permite detectar clientes registrados que todavía no realizaron ninguna compra,
-- información útil para campañas de activación o seguimiento comercial.
SELECT
    c.cliente_id,
    c.nombre AS cliente,
    COALESCE(SUM(v.cantidad), 0) AS unidades_compradas
FROM clientes AS c
LEFT JOIN ventas AS v
    ON c.cliente_id = v.cliente_id
GROUP BY c.cliente_id, c.nombre
HAVING COUNT(v.venta_id) = 0
ORDER BY c.nombre;

-- 3. Top de compras por cliente
-- Esta consulta permite conocer el producto que cada cliente compró en mayor cantidad
-- y la fecha de su última transacción, facilitando el análisis de preferencias y comportamiento de compra.
SELECT
    c.nombre AS cliente,
    (
        SELECT p2.nombre
        FROM ventas AS v2
        JOIN productos AS p2
            ON v2.producto_id = p2.producto_id
        WHERE v2.cliente_id = c.cliente_id
        GROUP BY p2.producto_id, p2.nombre
        ORDER BY SUM(v2.cantidad) DESC, p2.nombre
        LIMIT 1
    ) AS producto_mas_comprado,
    MAX(v.fecha_venta) AS ultima_transaccion
FROM clientes AS c
JOIN ventas AS v
    ON c.cliente_id = v.cliente_id
JOIN productos AS p
    ON v.producto_id = p.producto_id
GROUP BY c.cliente_id, c.nombre
ORDER BY c.nombre;
