/* ============================================================
   CUSTOMER ANALYSIS
   ============================================================ */


/* ============================================================
   1. CUSTOMER OVERVIEW
   ============================================================ */

-- Total Unique Customers
SELECT
    COUNT(DISTINCT customer_unique_id) AS unique_customers
FROM customers;

-- Total Customer Records
SELECT
    COUNT(*) AS customer_records
FROM customers;

-- Difference Between Customer Records and Unique Customers
SELECT
    COUNT(*) - COUNT(DISTINCT customer_unique_id)
    AS duplicate_customer_records
FROM customers;


/* ============================================================
   2. CUSTOMER GEOGRAPHY
   ============================================================ */

-- Customers by State
SELECT
    customer_state,
    COUNT(DISTINCT customer_unique_id) AS customers
FROM customers
GROUP BY customer_state
ORDER BY customers DESC;

-- Top 10 States by Customers
SELECT
    customer_state,
    COUNT(DISTINCT customer_unique_id) AS customers
FROM customers
GROUP BY customer_state
ORDER BY customers DESC
LIMIT 10;

-- Top 10 Cities by Customers
SELECT
    customer_city,
    COUNT(DISTINCT customer_unique_id) AS customers
FROM customers
GROUP BY customer_city
ORDER BY customers DESC
LIMIT 10;


/* ============================================================
   3. CUSTOMER ORDER BEHAVIOR
   ============================================================ */

-- Orders per Customer
WITH customer_orders AS (
    SELECT
        c.customer_unique_id,
        COUNT(DISTINCT o.order_id) AS order_count
    FROM customers c
    JOIN orders o
        ON c.customer_id = o.customer_id
    GROUP BY c.customer_unique_id
)
SELECT
    order_count,
    COUNT(*) AS customers
FROM customer_orders
GROUP BY order_count
ORDER BY order_count;

-- Maximum Orders by a Customer
WITH customer_orders AS (
    SELECT
        c.customer_unique_id,
        COUNT(DISTINCT o.order_id) AS order_count
    FROM customers c
    JOIN orders o
        ON c.customer_id = o.customer_id
    GROUP BY c.customer_unique_id
)
SELECT
    MAX(order_count) AS max_orders
FROM customer_orders;

-- Top 10 Customers by Number of Orders
SELECT
    c.customer_unique_id,
    COUNT(DISTINCT o.order_id) AS orders
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_unique_id
ORDER BY orders DESC
LIMIT 10;


/* ============================================================
   4. REPEAT CUSTOMER ANALYSIS
   ============================================================ */

-- One-Time vs Repeat Customers
WITH customer_orders AS (
    SELECT
        c.customer_unique_id,
        COUNT(DISTINCT o.order_id) AS order_count
    FROM customers c
    JOIN orders o
        ON c.customer_id = o.customer_id
    GROUP BY c.customer_unique_id
)
SELECT
    CASE
        WHEN order_count = 1 THEN 'One-Time Customer'
        ELSE 'Repeat Customer'
    END AS customer_type,
    COUNT(*) AS customers
FROM customer_orders
GROUP BY customer_type;

-- Repeat Customer Percentage
WITH customer_orders AS (
    SELECT
        c.customer_unique_id,
        COUNT(DISTINCT o.order_id) AS order_count
    FROM customers c
    JOIN orders o
        ON c.customer_id = o.customer_id
    GROUP BY c.customer_unique_id
)
SELECT
    ROUND(
        100.0 * COUNT(*) FILTER (WHERE order_count > 1)
        / COUNT(*),
        2
    ) AS repeat_customer_percentage
FROM customer_orders;


/* ============================================================
   5. CUSTOMER SEGMENTATION
   ============================================================ */

WITH customer_orders AS (
    SELECT
        c.customer_unique_id,
        COUNT(DISTINCT o.order_id) AS order_count
    FROM customers c
    JOIN orders o
        ON c.customer_id = o.customer_id
    GROUP BY c.customer_unique_id
)
SELECT
    CASE
        WHEN order_count = 1 THEN 'One-Time'
        WHEN order_count BETWEEN 2 AND 5 THEN 'Returning'
        ELSE 'Loyal'
    END AS segment,
    COUNT(*) AS customers
FROM customer_orders
GROUP BY segment
ORDER BY customers DESC;


/* ============================================================
   6. CUSTOMER SPENDING
   ============================================================ */

-- Customer Lifetime Value (Revenue per Customer)
SELECT
    c.customer_unique_id,
    ROUND(SUM(oi.price),2) AS customer_revenue
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN order_items oi
    ON o.order_id = oi.order_id
GROUP BY c.customer_unique_id
ORDER BY customer_revenue DESC;

-- Top 10 Customers by Revenue
SELECT
    c.customer_unique_id,
    ROUND(SUM(oi.price),2) AS customer_revenue
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN order_items oi
    ON o.order_id = oi.order_id
GROUP BY c.customer_unique_id
ORDER BY customer_revenue DESC
LIMIT 10;

-- Average Revenue per Customer
SELECT
    ROUND(
        SUM(oi.price) /
        COUNT(DISTINCT c.customer_unique_id),
        2
    ) AS avg_customer_value
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN order_items oi
    ON o.order_id = oi.order_id;


/* ============================================================
   7. CUSTOMER SATISFACTION
   ============================================================ */

-- Average Review Score per Customer
SELECT
    c.customer_unique_id,
    ROUND(AVG(r.review_score),2) AS avg_review_score
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN order_reviews r
    ON o.order_id = r.order_id
GROUP BY c.customer_unique_id
ORDER BY avg_review_score DESC;

-- Customer Satisfaction Distribution
SELECT
    review_score,
    COUNT(*) AS reviews
FROM order_reviews
GROUP BY review_score
ORDER BY review_score;