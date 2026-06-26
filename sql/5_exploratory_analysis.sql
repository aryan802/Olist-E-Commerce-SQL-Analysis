/* ============================================================
   EXPLORATORY ANALYSIS
   ============================================================ */

-- Unique Customers
SELECT COUNT(DISTINCT customer_unique_id) AS unique_customers
FROM customers;

-- Total Orders
SELECT COUNT(*) AS total_orders
FROM orders;

-- Total Products
SELECT COUNT(*) AS total_products
FROM products;

-- Total Sellers
SELECT COUNT(*) AS total_sellers
FROM sellers;

-- Product Categories
SELECT COUNT(DISTINCT COALESCE(product_category_name,'Unknown'))
AS category_count
FROM products;

-- Orders by Status
SELECT
    order_status,
    COUNT(*) AS order_count
FROM orders
GROUP BY order_status
ORDER BY order_count DESC;

-- Dataset Time Span
SELECT
    MIN(order_purchase_timestamp) AS first_order,
    MAX(order_purchase_timestamp) AS last_order
FROM orders;

-- Orders by Year
SELECT
    EXTRACT(YEAR FROM order_purchase_timestamp) AS year,
    COUNT(*) AS orders
FROM orders
GROUP BY year
ORDER BY year;

-- Orders by Month
SELECT
     DATE_TRUNC('month', order_purchase_timestamp) AS month,
    COUNT(*) AS orders
FROM orders
GROUP BY month
ORDER BY month;

-- Customers by State
SELECT
    customer_state,
    COUNT(DISTINCT customer_unique_id) AS customers
FROM customers
GROUP BY customer_state
ORDER BY customers DESC;

-- Top 10 Customer Cities
SELECT
    customer_city,
    COUNT(DISTINCT customer_unique_id) AS customers
FROM customers
GROUP BY customer_city
ORDER BY customers DESC
LIMIT 10;

-- Sellers by State
SELECT
    seller_state,
    COUNT(*) AS sellers
FROM sellers
GROUP BY seller_state
ORDER BY sellers DESC;

-- Top 10 Seller Cities
SELECT
    seller_city,
    COUNT(*) AS sellers
FROM sellers
GROUP BY seller_city
ORDER BY sellers DESC
LIMIT 10;

-- Payment Method Distribution
SELECT
    payment_type,
    COUNT(*) AS transactions
FROM order_payments
GROUP BY payment_type
ORDER BY transactions DESC;

-- Average Installments
SELECT
    ROUND(AVG(payment_installments),2)
FROM order_payments;

-- Average Review Score
SELECT
    ROUND(AVG(review_score),2)
FROM order_reviews;

-- Review Score Distribution
SELECT
    review_score,
    COUNT(*) AS reviews
FROM order_reviews
GROUP BY review_score
ORDER BY review_score;