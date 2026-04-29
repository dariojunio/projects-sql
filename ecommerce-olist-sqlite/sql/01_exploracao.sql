-- Estrutura da base importada.
PRAGMA table_info(DF);

-- Amostra da tabela tratada.
SELECT *
FROM ecommerce
LIMIT 10;

-- Volume geral da base.
SELECT
    COUNT(*) AS total_linhas,
    COUNT(DISTINCT order_id) AS total_pedidos,
    COUNT(DISTINCT customer_unique_id) AS total_clientes,
    COUNT(DISTINCT seller_id) AS total_vendedores,
    COUNT(DISTINCT product_category_name) AS total_categorias
FROM ecommerce;

-- Periodo analisado.
SELECT
    MIN(order_purchase_timestamp) AS primeira_compra,
    MAX(order_purchase_timestamp) AS ultima_compra
FROM ecommerce;

-- Status dos pedidos.
SELECT
    order_status,
    COUNT(DISTINCT order_id) AS total_pedidos
FROM ecommerce
GROUP BY order_status
ORDER BY total_pedidos DESC;

-- Campos essenciais sem preenchimento.
SELECT
    SUM(CASE WHEN order_id IS NULL THEN 1 ELSE 0 END) AS nulos_order_id,
    SUM(CASE WHEN customer_state IS NULL THEN 1 ELSE 0 END) AS nulos_estado_cliente,
    SUM(CASE WHEN product_category_name IS NULL THEN 1 ELSE 0 END) AS nulos_categoria,
    SUM(CASE WHEN price IS NULL THEN 1 ELSE 0 END) AS nulos_preco,
    SUM(CASE WHEN freight_value IS NULL THEN 1 ELSE 0 END) AS nulos_frete
FROM ecommerce;
