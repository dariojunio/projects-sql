-- Receita total e ticket medio.
SELECT
    ROUND(SUM(price), 2) AS receita_produtos,
    ROUND(SUM(freight_value), 2) AS frete_total,
    ROUND(SUM(total_item), 2) AS receita_total_estimada,
    COUNT(DISTINCT order_id) AS total_pedidos,
    ROUND(SUM(total_item) / NULLIF(COUNT(DISTINCT order_id), 0), 2) AS ticket_medio_por_pedido
FROM ecommerce;

-- Receita por ano.
SELECT
    year_of_purchase,
    COUNT(DISTINCT order_id) AS total_pedidos,
    ROUND(SUM(price), 2) AS receita_produtos,
    ROUND(SUM(freight_value), 2) AS frete_total,
    ROUND(SUM(total_item), 2) AS receita_total_estimada
FROM ecommerce
GROUP BY year_of_purchase
ORDER BY year_of_purchase;

-- Receita por mes.
SELECT
    purchase_month,
    COUNT(DISTINCT order_id) AS total_pedidos,
    ROUND(SUM(total_item), 2) AS receita_total_estimada
FROM ecommerce
GROUP BY purchase_month
ORDER BY purchase_month;

-- Meses com maior receita.
SELECT
    purchase_month,
    COUNT(DISTINCT order_id) AS total_pedidos,
    ROUND(SUM(total_item), 2) AS receita_total_estimada
FROM ecommerce
GROUP BY purchase_month
ORDER BY receita_total_estimada DESC
LIMIT 10;
