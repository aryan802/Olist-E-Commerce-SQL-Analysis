# Olist E-Commerce SQL Analysis

## Project Overview

This project analyzes the Brazilian E-Commerce Public Dataset by Olist using PostgreSQL.

The objective was to simulate a real-world data analyst workflow by:

- Designing and creating a relational database
- Importing and validating raw CSV data
- Performing data quality audits
- Conducting exploratory analysis
- Analyzing revenue performance
- Studying customer behavior
- Generating business insights and recommendations

The project focuses on understanding marketplace growth, customer behavior, revenue drivers, seller performance, payment preferences, and customer satisfaction.

---

## Dataset Source

Dataset: Brazilian E-Commerce Public Dataset by Olist

Kaggle:
https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce

The dataset contains information on nearly 100,000 orders placed between 2016 and 2018 across multiple marketplaces in Brazil.

## Dataset

**Source:** Olist Brazilian E-Commerce Public Dataset

**Period Covered:**

- First Order: September 2016
- Last Order: October 2018

## Dataset Schema

The analysis is based on the Olist Brazilian E-Commerce Dataset, which contains transactional, customer, product, seller, payment, and review data.

### Entity Relationship Diagram (ERD)

![Olist Dataset Schema](Images/olist_schema.png)

### Relationship Overview

- Customers place Orders.
- Orders contain one or more Order Items.
- Order Items are linked to Products.
- Order Items are fulfilled by Sellers.
- Orders have associated Payments.
- Orders can receive Reviews.
- Customer and Seller locations can be linked through Geolocation data.

### Main Relationships

| Parent Table | Child Table | Key |
|-------------|-------------|-----|
| customers | orders | customer_id |
| orders | order_items | order_id |
| orders | order_payments | order_id |
| orders | order_reviews | order_id |
| products | order_items | product_id |
| sellers | order_items | seller_id |


### Tables Used

| Table | Description |
|---------|-------------|
| customers | Customer information |
| orders | Order details and lifecycle |
| order_items | Products within each order |
| order_payments | Payment information |
| order_reviews | Customer reviews |
| products | Product catalog |
| sellers | Seller information |

---

## Database Statistics

| Metric | Value |
|---------|---------:|
| Unique Customers | 96,096 |
| Orders | 99,441 |
| Order Items | 112,650 |
| Products | 32,951 |
| Sellers | 3,095 |
| Categories | 74 |

---

## Project Structure

```text
olist-sql-analysis/

├── Data/
├── Images/
│   └── olist_schema.png
│
├── Notes/
│   ├── data_audit.md
│   ├── exploratory_analysis.md
│   ├── revenue_analysis.md
│   └── customer_analysis.md
│
├── Sql/
│   ├── 1_create_database.sql
│   ├── 2_create_tables.sql
│   ├── 3_modify_table.sql
│   ├── 4_data_audit.sql
│   ├── 5_exploratory_analysis.sql
│   ├── 6_revenue_analysis.sql
│   └── 7_customer_analysis.sql
│
└── README.md
```

---

# Data Audit Highlights

Before analysis, the dataset was validated for quality and integrity.

### Key Findings

#### Customer Entity Modeling

- Customer Records: 99,441
- Unique Customers: 96,096

A customer may appear under multiple customer records.

For customer-level analysis:

```sql
customer_unique_id
```

was used instead of:

```sql
customer_id
```

---

#### Review Table Investigation

Review data was found to have non-unique review identifiers.

Findings:

- Total Review Records: 99,224
- Distinct Review IDs: 98,410
- Distinct Order IDs: 98,673
- Orders with Multiple Reviews: 547

This required additional care during review-based analysis.

---

#### Missing Values

| Column | Missing Values |
|----------|----------:|
| order_delivered_customer_date | 2,965 |
| product_category_name | 610 |

Product categories with missing values were treated as **Unknown** during category-level analysis.

---

#### Relationship Validation

The following checks were performed:

- Orders → Customers
- Order Items → Orders
- Order Items → Products
- Order Items → Sellers

No orphan records were detected.

---

# Exploratory Analysis Highlights

### Marketplace Overview

| Metric | Value |
|----------|----------:|
| Unique Customers | 96,096 |
| Orders | 99,441 |
| Products | 32,951 |
| Sellers | 3,095 |

---

### Order Fulfillment

| Status | Orders |
|----------|----------:|
| Delivered | 96,478 |
| Shipped | 1,107 |
| Canceled | 625 |
| Unavailable | 609 |

More than **97% of all orders were successfully delivered**.

---

### Customer Geography

Top Customer States:

1. São Paulo (SP)
2. Rio de Janeiro (RJ)
3. Minas Gerais (MG)

São Paulo alone contains over **40,000 customers**.

---

### Seller Geography

Top Seller States:

1. São Paulo (SP)
2. Paraná (PR)
3. Minas Gerais (MG)

Seller activity is heavily concentrated in São Paulo.

---

### Payments

| Payment Method | Transactions |
|----------|----------:|
| Credit Card | 76,795 |
| Boleto | 19,784 |
| Voucher | 5,775 |
| Debit Card | 1,529 |

Average Installments:

```text
2.85
```

Credit cards dominate marketplace transactions.

---

### Customer Satisfaction

Average Review Score:

```text
4.09 / 5
```

Most customer reviews are positive, with 5-star ratings accounting for the majority of reviews.

---

# Revenue Analysis Highlights

### Revenue Overview

| Metric | Value |
|----------|----------:|
| Product Revenue | 13.59M |
| Freight Value | 2.25M |
| Customer Spend | 16.01M |
| Average Order Value | 137.75 |

---

### Revenue Growth

| Year | Revenue |
|----------|----------:|
| 2016 | 49.8K |
| 2017 | 6.16M |
| 2018 | 7.39M |

The marketplace experienced strong growth between 2017 and 2018.

---

### Top Revenue Categories

| Category | Revenue |
|----------|----------:|
| Beauty & Health | 1.26M |
| Watches & Gifts | 1.21M |
| Bed, Bath & Table | 1.04M |
| Sports & Leisure | 988K |
| Computer Accessories | 912K |

---

### Geographic Revenue

Top Revenue States:

1. São Paulo
2. Rio de Janeiro
3. Minas Gerais

São Paulo alone contributes approximately **38% of total revenue**.

---

### Payment Revenue

| Payment Type | Revenue |
|----------|----------:|
| Credit Card | 12.54M |
| Boleto | 2.87M |
| Voucher | 379K |
| Debit Card | 218K |

Credit cards generate the overwhelming majority of transaction value.

---

# Customer Analysis Highlights

### Customer Retention

| Customer Type | Count |
|----------|----------:|
| One-Time Customers | 93,099 |
| Repeat Customers | 2,997 |

Repeat Customer Rate:

```text
3.12%
```

---

### Customer Segmentation

| Segment | Customers |
|----------|----------:|
| One-Time | 93,099 |
| Returning | 2,986 |
| Loyal | 11 |

The marketplace is highly acquisition-driven with limited customer retention.

---

### Customer Value

Average Revenue per Customer:

```text
142.44
```

Top customer lifetime revenue exceeded:

```text
13,000
```

---

# Business Insights

### 1. Strong Marketplace Growth

Revenue increased significantly between 2017 and 2018, indicating successful marketplace expansion.

### 2. Geographic Concentration

São Paulo dominates customers, sellers, and revenue generation.

### 3. High Fulfillment Success

More than 97% of orders were successfully delivered.

### 4. Low Customer Retention

Only 3.12% of customers placed multiple orders.

### 5. Credit Cards Dominate Transactions

Most revenue is generated through credit card payments.

### 6. Category Concentration

A small number of categories generate a large share of total revenue.

### 7. Customer Satisfaction Is High

Average review score exceeds 4 stars despite low repeat purchase behavior.

### 8. Improvement Opportunities Exist

Several high-revenue categories exhibit below-average review scores and may benefit from operational improvements.

---

# SQL Concepts Used

This project demonstrates practical use of:

- SELECT
- WHERE
- GROUP BY
- ORDER BY
- Aggregate Functions
- INNER JOIN
- LEFT JOIN
- CASE Expressions
- Subqueries
- Common Table Expressions (CTEs)
- Date Functions
- Data Auditing
- Relationship Validation
- Business KPI Analysis

---

# Future Improvements

Potential extensions:

- Seller Performance Analysis
- Product Performance Analysis
- RFM Analysis
- Cohort Analysis
- Power BI Dashboard
- Customer Lifetime Value Modeling
- Retention Analysis
- Window Functions

---

# Tools Used

- PostgreSQL
- pgAdmin
- SQL
- Git
- GitHub

---

# Author

Aryan Jain
