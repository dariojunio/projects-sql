-- Estados com maior receita.
SELECT
    customer_state,
    COUNT(DISTINCT order_id) AS total_pedidos,
    COUNT(DISTINCT customer_unique_id) AS total_clientes,
    ROUND(SUM(total_item), 2) AS receita_total_estimada,
    ROUND(SUM(total_item) / NULLIF(COUNT(DISTINCT order_id), 0), 2) AS ticket_medio
FROM ecommerce
GROUP BY customer_state
ORDER BY receita_total_estimada DESC
LIMIT 10;

-- Cidades com maior receita.
SELECT
    customer_city,
    customer_state,
    COUNT(DISTINCT order_id) AS total_pedidos,
    ROUND(SUM(total_item), 2) AS receita_total_estimada
FROM ecommerce
GROUP BY customer_city, customer_state
ORDER BY receita_total_estimada DESC
LIMIT 10;

-- Estados dos vendedores com maior receita.
SELECT
    seller_state,
    COUNT(DISTINCT seller_id) AS total_vendedores,
    COUNT(DISTINCT order_id) AS total_pedidos,
    ROUND(SUM(total_item), 2) AS receita_total_estimada
FROM ecommerce
GROUP BY seller_state
ORDER BY receita_total_estimada DESC
LIMIT 10;

-- Relacao entre estado do cliente e estado do vendedor.
SELECT
    CASE
        WHEN customer_state = seller_state THEN 'Mesmo estado'
        ELSE 'Estados diferentes'
    END AS relacao_cliente_vendedor,
    COUNT(DISTINCT order_id) AS total_pedidos,
    ROUND(SUM(total_item), 2) AS receita_total_estimada
FROM ecommerce
GROUP BY relacao_cliente_vendedor
ORDER BY total_pedidos DESC;
