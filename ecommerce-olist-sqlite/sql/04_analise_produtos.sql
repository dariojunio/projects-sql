-- Categorias com maior receita.
SELECT
    product_category_name,
    COUNT(DISTINCT order_id) AS total_pedidos,
    COUNT(*) AS total_itens,
    ROUND(SUM(price), 2) AS receita_produtos,
    ROUND(SUM(freight_value), 2) AS frete_total,
    ROUND(SUM(total_item), 2) AS receita_total_estimada
FROM ecommerce
GROUP BY product_category_name
ORDER BY receita_total_estimada DESC
LIMIT 10;

-- Categorias com maior ticket medio.
SELECT
    product_category_name,
    COUNT(DISTINCT order_id) AS total_pedidos,
    ROUND(SUM(total_item) / NULLIF(COUNT(DISTINCT order_id), 0), 2) AS ticket_medio
FROM ecommerce
GROUP BY product_category_name
HAVING COUNT(DISTINCT order_id) >= 100
ORDER BY ticket_medio DESC
LIMIT 10;

-- Categorias com maior peso de frete.
SELECT
    product_category_name,
    COUNT(DISTINCT order_id) AS total_pedidos,
    ROUND(SUM(price), 2) AS receita_produtos,
    ROUND(SUM(freight_value), 2) AS frete_total,
    ROUND(100.0 * SUM(freight_value) / NULLIF(SUM(total_item), 0), 2) AS percentual_frete
FROM ecommerce
GROUP BY product_category_name
HAVING COUNT(DISTINCT order_id) >= 100
ORDER BY percentual_frete DESC
LIMIT 10;

-- Produtos mais vendidos por quantidade de itens.
SELECT
    product_id,
    product_category_name,
    COUNT(*) AS total_itens,
    COUNT(DISTINCT order_id) AS total_pedidos,
    ROUND(SUM(total_item), 2) AS receita_total_estimada
FROM ecommerce
GROUP BY product_id, product_category_name
ORDER BY total_itens DESC
LIMIT 10;
