-- Formas de pagamento mais usadas.
SELECT
    payment_type,
    COUNT(DISTINCT order_id) AS total_pedidos,
    COUNT(*) AS total_linhas,
    ROUND(SUM(total_item), 2) AS receita_total_estimada
FROM ecommerce
GROUP BY payment_type
ORDER BY total_pedidos DESC;

-- Parcelamento medio por forma de pagamento.
SELECT
    payment_type,
    COUNT(DISTINCT order_id) AS total_pedidos,
    ROUND(AVG(payment_installments), 2) AS media_parcelas
FROM ecommerce
GROUP BY payment_type
ORDER BY total_pedidos DESC;

-- Entregas no prazo e atrasadas.
SELECT
    delivery_status,
    COUNT(DISTINCT order_id) AS total_pedidos,
    ROUND(AVG(delivery_days), 2) AS prazo_medio_entrega_dias,
    ROUND(AVG(delay_days), 2) AS media_dias_atraso
FROM ecommerce
WHERE order_delivered_customer_date IS NOT NULL
GROUP BY delivery_status
ORDER BY total_pedidos DESC;

-- Estados com maior prazo medio de entrega.
SELECT
    customer_state,
    COUNT(DISTINCT order_id) AS total_pedidos,
    ROUND(AVG(delivery_days), 2) AS prazo_medio_entrega_dias,
    ROUND(AVG(delay_days), 2) AS media_dias_atraso
FROM ecommerce
WHERE order_delivered_customer_date IS NOT NULL
GROUP BY customer_state
HAVING COUNT(DISTINCT order_id) >= 100
ORDER BY prazo_medio_entrega_dias DESC
LIMIT 10;

-- Categorias com maior prazo medio de entrega.
SELECT
    product_category_name,
    COUNT(DISTINCT order_id) AS total_pedidos,
    ROUND(AVG(delivery_days), 2) AS prazo_medio_entrega_dias
FROM ecommerce
WHERE order_delivered_customer_date IS NOT NULL
GROUP BY product_category_name
HAVING COUNT(DISTINCT order_id) >= 100
ORDER BY prazo_medio_entrega_dias DESC
LIMIT 10;
