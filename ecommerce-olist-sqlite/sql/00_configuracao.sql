-- Tabela tratada para padronizar nomes de colunas importadas pelo SQLite Online.

DROP TABLE IF EXISTS ecommerce;

CREATE TABLE ecommerce AS
SELECT
    order_id,
    order_item_id,
    customer_id,
    customer_unique_ AS customer_unique_id,
    customer_zip_cod AS customer_zip_code_prefix,
    customer_city,
    customer_state,
    product_id,
    product_category AS product_category_name,
    product_name_len AS product_name_lenght,
    product_descript AS product_description_lenght,
    product_photos_q AS product_photos_qty,
    product_weight_g,
    product_length_c AS product_length_cm,
    product_height_c AS product_height_cm,
    product_width_cm,
    seller_id,
    seller_city,
    seller_state,
    seller_zip_code_ AS seller_zip_code_prefix,
    payment_type,
    payment_sequenti AS payment_sequential,
    payment_installm AS payment_installments,
    CAST(price AS REAL) AS price,
    CAST(freight_value AS REAL) AS freight_value,
    CAST(payment_value AS REAL) AS payment_value,
    shipping_limit_d AS shipping_limit_date,
    order_purchase_t AS order_purchase_timestamp,
    order_approved_a AS order_approved_at,
    order_delivered_ AS order_delivered_carrier_date,
    order_delivered__31 AS order_delivered_customer_date,
    order_estimated_ AS order_estimated_delivery_date,
    day_of_purchase,
    month_of_purchas AS month_of_purchase,
    CAST(year_of_purchase AS INTEGER) AS year_of_purchase,
    month_year_of_pu AS month_year_of_purchase,
    order_status,
    order_unique_id,
    CAST(price AS REAL) + CAST(freight_value AS REAL) AS total_item,
    strftime('%Y-%m', order_purchase_t) AS purchase_month,
    julianday(order_delivered__31) - julianday(order_purchase_t) AS delivery_days,
    julianday(order_delivered__31) - julianday(order_estimated_) AS delay_days,
    CASE
        WHEN order_delivered__31 IS NULL THEN 'Sem data de entrega'
        WHEN julianday(order_delivered__31) > julianday(order_estimated_) THEN 'Atrasado'
        ELSE 'No prazo'
    END AS delivery_status
FROM DF;
