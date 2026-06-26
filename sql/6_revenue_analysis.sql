/* ============================================================
   REVENUE ANALYSIS
   ============================================================ */


/* ============================================================
   1. REVENUE OVERVIEW
   ============================================================ */

-- Total Product Revenue
SELECT
    ROUND(SUM(price),2) AS total_product_revenue
FROM order_items;

-- Total Freight Revenue
SELECT
    ROUND(SUM(freight_value),2) AS total_freight_value
FROM order_items;

-- Total Customer Spend
SELECT
    ROUND(SUM(payment_value),2) AS total_customer_spend
FROM order_payments;

-- Average Order Value
SELECT
    ROUND(
        SUM(price) /
        COUNT(DISTINCT order_id),
        2
    ) AS average_order_value
FROM order_items;


/* ============================================================
   2. REVENUE TREND ANALYSIS
   ============================================================ */

-- Revenue by Year
SELECT
    EXTRACT(YEAR FROM o.order_purchase_timestamp) AS year,
    ROUND(SUM(oi.price),2) AS revenue
FROM orders o
JOIN order_items oi
    ON o.order_id = oi.order_id
GROUP BY year
ORDER BY year;

-- Revenue by Month
SELECT
    DATE_TRUNC('month', o.order_purchase_timestamp) AS month,
    ROUND(SUM(oi.price),2) AS revenue
FROM orders o
JOIN order_items oi
    ON o.order_id = oi.order_id
GROUP BY month
ORDER BY month;

-- Top Revenue Months
SELECT
    DATE_TRUNC('month', o.order_purchase_timestamp) AS month,
    ROUND(SUM(oi.price),2) AS revenue
FROM orders o
JOIN order_items oi
    ON o.order_id = oi.order_id
GROUP BY month
ORDER BY revenue DESC
LIMIT 10;


/* ============================================================
   3. GEOGRAPHIC REVENUE ANALYSIS
   ============================================================ */

-- Revenue by State
SELECT
    c.customer_state,
    ROUND(SUM(oi.price),2) AS revenue
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN order_items oi
    ON o.order_id = oi.order_id
GROUP BY c.customer_state
ORDER BY revenue DESC;

-- Top 10 States by Revenue
SELECT
    c.customer_state,
    ROUND(SUM(oi.price),2) AS revenue
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN order_items oi
    ON o.order_id = oi.order_id
GROUP BY c.customer_state
ORDER BY revenue DESC
LIMIT 10;

-- Top 10 Cities by Revenue
SELECT
    c.customer_city,
    ROUND(SUM(oi.price),2) AS revenue
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN order_items oi
    ON o.order_id = oi.order_id
GROUP BY c.customer_city
ORDER BY revenue DESC
LIMIT 10;


/* ============================================================
   4. CATEGORY REVENUE ANALYSIS
   ============================================================ */

-- Revenue by Category
SELECT
    COALESCE(p.product_category_name,'Unknown') AS category,
    ROUND(SUM(oi.price),2) AS revenue
FROM order_items oi
JOIN products p
    ON oi.product_id = p.product_id
GROUP BY category
ORDER BY revenue DESC;

-- Top 10 Categories by Revenue
SELECT
    COALESCE(p.product_category_name,'Unknown') AS category,
    ROUND(SUM(oi.price),2) AS revenue
FROM order_items oi
JOIN products p
    ON oi.product_id = p.product_id
GROUP BY category
ORDER BY revenue DESC
LIMIT 10;

-- Bottom 10 Categories by Revenue
SELECT
    COALESCE(p.product_category_name,'Unknown') AS category,
    ROUND(SUM(oi.price),2) AS revenue
FROM order_items oi
JOIN products p
    ON oi.product_id = p.product_id
GROUP BY category
ORDER BY revenue
LIMIT 10;


/* ============================================================
   5. SELLER REVENUE ANALYSIS
   ============================================================ */

-- Revenue by Seller
SELECT
    seller_id,
    ROUND(SUM(price),2) AS revenue
FROM order_items
GROUP BY seller_id
ORDER BY revenue DESC;

-- Top 10 Sellers by Revenue
SELECT
    seller_id,
    ROUND(SUM(price),2) AS revenue
FROM order_items
GROUP BY seller_id
ORDER BY revenue DESC
LIMIT 10;


/* ============================================================
   6. PAYMENT REVENUE ANALYSIS
   ============================================================ */

-- Revenue by Payment Method
SELECT
    payment_type,
    ROUND(SUM(payment_value),2) AS revenue
FROM order_payments
GROUP BY payment_type
ORDER BY revenue DESC;


/* ============================================================
   7. REVENUE & REVIEW ANALYSIS
   ============================================================ */

-- Average Review Score by Product Category
SELECT
    COALESCE(p.product_category_name,'Unknown') AS category,
    ROUND(AVG(r.review_score),2) AS avg_review_score
FROM order_reviews r
JOIN orders o
    ON r.order_id = o.order_id
JOIN order_items oi
    ON o.order_id = oi.order_id
JOIN products p
    ON oi.product_id = p.product_id
GROUP BY category
ORDER BY avg_review_score DESC;