# Data Audit Report

## Project

Brazilian E-Commerce Dataset (Olist)

---

# 1. Dataset Overview

The dataset consists of seven primary tables representing customers, orders, products, sellers, payments, reviews, and order line items.

The objective of this audit is to:

* Understand dataset structure
* Validate candidate keys
* Assess data quality
* Verify relationships between tables
* Identify potential limitations before analysis

---

# 2. Table Sizes

| Table       |    Rows |
| ----------- | ------: |
| Customers   |  99,441 |
| Orders      |  99,441 |
| Order Items | 112,650 |
| Payments    | 103,886 |
| Reviews     |  99,224 |
| Products    |  32,951 |
| Sellers     |   3,095 |

### Observations

* Orders and Customers contain the same number of records.
* Order Items contains more records than Orders, indicating that an order may contain multiple products.
* The seller base is relatively small compared to the product catalog.

---

# 3. Candidate Key Validation

| Table     | Candidate Key | Unique? |
| --------- | ------------- | ------- |
| Customers | customer_id   | Yes     |
| Orders    | order_id      | Yes     |
| Products  | product_id    | Yes     |
| Sellers   | seller_id     | Yes     |
| Reviews   | review_id     | No      |

### Findings

* All major entity tables contain unique identifiers.
* review_id is not unique. Investigation showed that duplicate review IDs exist and some orders contain multiple review records. Therefore, review_id cannot be used as a primary key.

---

# 4. Customer Entity Investigation

## Results

| Metric                      |  Value |
| --------------------------- | -----: |
| Total Customer Records      | 99,441 |
| Distinct customer_unique_id | 96,096 |

### Findings

The number of unique customers is lower than the number of customer records.

This indicates that:

* One real customer may appear multiple times in the dataset.
* customer_id represents a customer record.
* customer_unique_id appears to represent the actual customer entity.

This distinction will be important during customer analysis and repeat purchase analysis.

---

# 5. Missing Value Analysis

## Orders

| Column                        | Missing Values |
| ----------------------------- | -------------: |
| customer_id                   |              0 |
| order_status                  |              0 |
| order_purchase_timestamp      |              0 |
| order_delivered_customer_date |          2,965 |
| order_estimated_delivery_date |              0 |

### Observation

A small number of orders do not have a delivery date, likely because they were cancelled, unavailable, or not delivered.

---

## Products

| Column                | Missing Values |
| --------------------- | -------------: |
| product_category_name |            610 |

### Observation

Some products cannot be assigned to a category, which may affect category-level analysis.

---

## Reviews

| Column       | Missing Values |
| ------------ | -------------: |
| review_score |              0 |

---

## Customers

| Column             | Missing Values |
| ------------------ | -------------: |
| customer_id        |              0 |
| customer_unique_id |              0 |
| customer_state     |              0 |

---

## Order Items

| Column     | Missing Values |
| ---------- | -------------: |
| order_id   |              0 |
| product_id |              0 |
| seller_id  |              0 |
| price      |              0 |

---

## Payments

| Column        | Missing Values |
| ------------- | -------------: |
| payment_type  |              0 |
| payment_value |              0 |

---

## Sellers

| Column       | Missing Values |
| ------------ | -------------: |
| seller_id    |              0 |
| seller_state |              0 |

---

# 6. Business Process Understanding

The dataset follows the following business flow:

→ Customer Places Order
→ Order Contains Products
→ Order Is Paid Using A Payment Method
→ Customer Leaves A Review
→ Products Are Sold By Sellers

Understanding this flow helps identify the relationships required for future customer, revenue, product, and seller analysis.

---

# 7. Relationship Validation

| Validation Check                     | Result |
| ------------------------------------ | ------ |
| Every order belongs to a customer    | Passed |
| Every order item belongs to an order | Passed |
| Every product referenced exists      | Passed |
| Every seller referenced exists       | Passed |

### Findings

No orphan records were identified in the audited relationships.

The dataset demonstrates strong referential consistency and is suitable for analytical use.

---



# 8. Key Takeaways

1. Dataset structure is well-normalized and suitable for relational analysis.
2. Primary business entities have unique identifiers.
3. customer_unique_id should be used when analyzing unique customers.
4. Product category data contains a small number of missing values.
5. Review identifiers require further investigation before being treated as primary keys.
6. Relationship validation confirms high data integrity across core tables.

The dataset is ready for exploratory and business-focused analysis.

---

## Review Table Investigation

### Summary Statistics

| Metric                       |  Value |
| ---------------------------- | -----: |
| Total Review Records         | 99,224 |
| Distinct Review IDs          | 98,410 |
| Distinct Order IDs           | 98,673 |
| Orders With Multiple Reviews |    547 |

### Findings

The review dataset contains duplicate review identifiers and does not exhibit a strict one-to-one relationship with orders.

Key observations:

* `review_id` is not unique and therefore cannot be used as a primary key.
* Some orders are associated with multiple review records.
* Neither `review_id` nor `order_id` uniquely identifies a review row.

### Analytical Impact

When joining Orders and Reviews, duplicate review records may inflate aggregated metrics if not handled carefully.

Future review analyses should explicitly determine whether calculations should be performed at:

* Review level
* Order level

before aggregation.







