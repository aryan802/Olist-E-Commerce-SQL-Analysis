/* ============================================================
OLIST E-COMMERCE DATASET
DATA AUDIT & VALIDATION
============================================================ */

/* ============================================================

1. TABLE SIZE ANALYSIS
   Purpose:
   Understand dataset scale and relative table sizes.
   ============================================================ */

SELECT COUNT(*) AS customer_count
FROM customers;

SELECT COUNT(*) AS order_count
FROM orders;

SELECT COUNT(*) AS order_item_count
FROM order_items;

SELECT COUNT(*) AS payment_count
FROM order_payments;

SELECT COUNT(*) AS review_count
FROM order_reviews;

SELECT COUNT(*) AS product_count
FROM products;

SELECT COUNT(*) AS seller_count
FROM sellers;

/* ============================================================
2. CANDIDATE KEY VALIDATION
Purpose:
Verify whether expected primary key columns are unique.
============================================================ */

-- Customers
SELECT
COUNT(*) AS total_rows,
COUNT(DISTINCT customer_id) AS distinct_customer_ids
FROM customers;

-- Orders
SELECT
COUNT(*) AS total_rows,
COUNT(DISTINCT order_id) AS distinct_order_ids
FROM orders;

-- Products
SELECT
COUNT(*) AS total_rows,
COUNT(DISTINCT product_id) AS distinct_product_ids
FROM products;

-- Sellers
SELECT
COUNT(*) AS total_rows,
COUNT(DISTINCT seller_id) AS distinct_seller_ids
FROM sellers;

-- Reviews
SELECT
COUNT(*) AS total_rows,
COUNT(DISTINCT review_id) AS distinct_review_ids
FROM order_reviews;

/* ============================================================
3. CUSTOMER ENTITY INVESTIGATION
Purpose:
Understand the difference between customer_id and
customer_unique_id.
============================================================ */

SELECT COUNT(*) AS total_customer_records
FROM customers;

SELECT COUNT(DISTINCT customer_unique_id) AS unique_customers
FROM customers;

/* ============================================================
4. MISSING VALUE ANALYSIS
Purpose:
Identify missing values in business-critical columns.
============================================================ */

-- Orders
SELECT COUNT(*) AS missing_customer_id
FROM orders
WHERE customer_id IS NULL;

SELECT COUNT(*) AS missing_order_status
FROM orders
WHERE order_status IS NULL;

SELECT COUNT(*) AS missing_purchase_timestamp
FROM orders
WHERE order_purchase_timestamp IS NULL;

SELECT COUNT(*) AS missing_delivered_customer_date
FROM orders
WHERE order_delivered_customer_date IS NULL;

SELECT COUNT(*) AS missing_estimated_delivery_date
FROM orders
WHERE order_estimated_delivery_date IS NULL;

-- Products
SELECT COUNT(*) AS missing_product_category
FROM products
WHERE product_category_name IS NULL;

-- Reviews
SELECT COUNT(*) AS missing_review_score
FROM order_reviews
WHERE review_score IS NULL;

-- Customers
SELECT COUNT(*) AS missing_customer_id
FROM customers
WHERE customer_id IS NULL;

SELECT COUNT(*) AS missing_customer_unique_id
FROM customers
WHERE customer_unique_id IS NULL;

SELECT COUNT(*) AS missing_customer_state
FROM customers
WHERE customer_state IS NULL;

-- Order Items
SELECT COUNT(*) AS missing_order_id
FROM order_items
WHERE order_id IS NULL;

SELECT COUNT(*) AS missing_product_id
FROM order_items
WHERE product_id IS NULL;

SELECT COUNT(*) AS missing_seller_id
FROM order_items
WHERE seller_id IS NULL;

SELECT COUNT(*) AS missing_price
FROM order_items
WHERE price IS NULL;

-- Payments
SELECT COUNT(*) AS missing_payment_type
FROM order_payments
WHERE payment_type IS NULL;

SELECT COUNT(*) AS missing_payment_value
FROM order_payments
WHERE payment_value IS NULL;

-- Sellers
SELECT COUNT(*) AS missing_seller_id
FROM sellers
WHERE seller_id IS NULL;

SELECT COUNT(*) AS missing_seller_state
FROM sellers
WHERE seller_state IS NULL;

/* ============================================================
5. RELATIONSHIP VALIDATION
Purpose:
Verify referential integrity between tables.
============================================================ */

-- Every order belongs to a valid customer
SELECT COUNT(*) AS orphan_orders
FROM orders o
LEFT JOIN customers c
ON o.customer_id = c.customer_id
WHERE c.customer_id IS NULL;

-- Every order item belongs to a valid order
SELECT COUNT(*) AS orphan_order_items
FROM order_items oi
LEFT JOIN orders o
ON oi.order_id = o.order_id
WHERE o.order_id IS NULL;

-- Every order item references a valid product
SELECT COUNT(*) AS orphan_products
FROM order_items oi
LEFT JOIN products p
ON oi.product_id = p.product_id
WHERE p.product_id IS NULL;

-- Every order item references a valid seller
SELECT COUNT(*) AS orphan_sellers
FROM order_items oi
LEFT JOIN sellers s
ON oi.seller_id = s.seller_id
WHERE s.seller_id IS NULL;

/* ============================================================
6. Review Table Investigation
============================================================ */

SELECT order_id, COUNT(*)
FROM order_reviews
GROUP BY order_id
HAVING COUNT(*) > 1
ORDER BY COUNT(*) DESC;

SELECT review_id, COUNT(*)
FROM order_reviews
GROUP BY review_id
HAVING COUNT(*) > 1
ORDER BY COUNT(*) DESC;

SELECT
    review_id,
    order_id,
    review_score
FROM order_reviews
WHERE review_id IN (
    SELECT review_id
    FROM order_reviews
    GROUP BY review_id
    HAVING COUNT(*) > 1
)
LIMIT 20;

SELECT
    order_id,
    review_id,
    review_score
FROM order_reviews
WHERE order_id IN (
    SELECT order_id
    FROM order_reviews
    GROUP BY order_id
    HAVING COUNT(*) > 1
)
LIMIT 20;

SELECT
    COUNT(*) AS total_review_rows,
    COUNT(DISTINCT review_id) AS distinct_review_ids,
    COUNT(DISTINCT order_id) AS distinct_order_ids
FROM order_reviews;

SELECT
    COUNT(*)
FROM (
    SELECT order_id
    FROM order_reviews
    GROUP BY order_id
    HAVING COUNT(*) > 1
) t;


