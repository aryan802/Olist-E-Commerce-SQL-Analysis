# Exploratory Analysis

## Objective

The purpose of this exploratory analysis is to understand the overall structure of the Olist marketplace, identify major customer and seller concentrations, evaluate order behavior, analyze payment preferences, and assess customer satisfaction before conducting deeper revenue and customer analytics.

---

# 1. Business Overview

## Key Metrics

| Metric             |  Value |
| ------------------ | -----: |
| Unique Customers   | 96,096 |
| Total Orders       | 99,441 |
| Total Products     | 32,951 |
| Total Sellers      |  3,095 |
| Product Categories |     74 |

### Observations

* The marketplace served over 96,000 unique customers.
* More than 99,000 orders were placed during the analysis period.
* The product catalog contains nearly 33,000 products across 74 categories.
* The seller base is relatively small compared to the customer base, indicating seller concentration.

---

# 2. Order Analysis

## Order Status Distribution

| Order Status | Orders |
| ------------ | -----: |
| Delivered    | 96,478 |
| Shipped      |  1,107 |
| Canceled     |    625 |
| Unavailable  |    609 |
| Invoiced     |    314 |
| Processing   |    301 |
| Created      |      5 |
| Approved     |      2 |

### Observations

* More than 97% of all orders were successfully delivered.
* Canceled and unavailable orders represent a very small fraction of total orders.
* The marketplace demonstrates a high order fulfillment rate.

---

## Dataset Time Span

| Metric      | Value      |
| ----------- | ---------- |
| First Order | 2016-09-04 |
| Last Order  | 2018-10-17 |

### Observations

* The dataset covers approximately two years of marketplace activity.
* This provides sufficient historical data to analyze growth patterns and customer behavior.

---

## Orders by Year

| Year | Orders |
| ---- | -----: |
| 2016 |    329 |
| 2017 | 45,101 |
| 2018 | 54,011 |

### Observations

* Order volume increased significantly from 2017 to 2018.
* The marketplace experienced strong growth during the observed period.

---

## Orders by Month

### Key Findings

* Order volume increased steadily throughout 2017.
* November 2017 recorded the highest monthly order count (7,544 orders).
* Order activity remained consistently strong throughout most of 2018.
* September and October 2018 contain very few orders because the dataset ends during October 2018 and does not represent complete months.

### Observation

The sharp increase in November 2017 is likely associated with seasonal shopping events and promotional campaigns.

---

# 3. Customer Geography Analysis

## Customers by State

### Top 10 States by Customers

| State | Customers |
| ----- | --------: |
| SP    |    40,302 |
| RJ    |    12,384 |
| MG    |    11,259 |
| RS    |     5,277 |
| PR    |     4,882 |
| SC    |     3,534 |
| BA    |     3,277 |
| DF    |     2,075 |
| ES    |     1,964 |
| GO    |     1,952 |

### Observations

* São Paulo (SP) is the dominant customer market.
* Rio de Janeiro (RJ) and Minas Gerais (MG) are the next largest customer bases.
* Customer demand is heavily concentrated in southeastern Brazil.

---

## Top 10 Customer Cities

| City                  | Customers |
| --------------------- | --------: |
| Sao Paulo             |    14,984 |
| Rio de Janeiro        |     6,620 |
| Belo Horizonte        |     2,672 |
| Brasilia              |     2,069 |
| Curitiba              |     1,465 |
| Campinas              |     1,398 |
| Porto Alegre          |     1,326 |
| Salvador              |     1,209 |
| Guarulhos             |     1,153 |
| Sao Bernardo do Campo |       908 |

### Observations

* São Paulo city alone contributes nearly 15,000 customers.
* Major metropolitan regions account for a significant portion of marketplace demand.

---

# 4. Seller Geography Analysis

## Sellers by State

### Top States by Sellers

| State | Sellers |
| ----- | ------: |
| SP    |   1,849 |
| PR    |     349 |
| MG    |     244 |
| SC    |     190 |
| RJ    |     171 |
| RS    |     129 |

### Observations

* Seller concentration is even more pronounced than customer concentration.
* Nearly 60% of all sellers are located in São Paulo.
* The seller ecosystem is highly centralized.

---

## Top 10 Seller Cities

| City           | Sellers |
| -------------- | ------: |
| Sao Paulo      |     694 |
| Curitiba       |     127 |
| Rio de Janeiro |      96 |
| Belo Horizonte |      68 |
| Ribeirao Preto |      52 |
| Guarulhos      |      50 |
| Ibitinga       |      49 |
| Santo Andre    |      45 |
| Campinas       |      41 |
| Maringa        |      40 |

### Observations

* São Paulo city acts as the primary seller hub.
* Seller activity is concentrated in major urban and commercial centers.

---

# 5. Payment Analysis

## Payment Method Distribution

| Payment Method | Transactions |
| -------------- | -----------: |
| Credit Card    |       76,795 |
| Boleto         |       19,784 |
| Voucher        |        5,775 |
| Debit Card     |        1,529 |
| Not Defined    |            3 |

### Observations

* Credit cards are the dominant payment method.
* Boleto remains a significant payment channel.
* Debit card usage is comparatively low.

---

## Installment Analysis

| Metric               | Value |
| -------------------- | ----: |
| Average Installments |  2.85 |

### Observations

* Customers frequently purchase using installment plans.
* Financing appears to be an important aspect of marketplace transactions.

---

# 6. Customer Satisfaction Analysis

## Average Review Score

| Metric               |    Value |
| -------------------- | -------: |
| Average Review Score | 4.09 / 5 |

### Observations

* Overall customer satisfaction is high.
* The marketplace maintains a positive average rating above 4 stars.

---

## Review Score Distribution

| Score | Reviews |
| ----- | ------: |
| 1     |  11,424 |
| 2     |   3,151 |
| 3     |   8,179 |
| 4     |  19,142 |
| 5     |  57,328 |

### Observations

* Five-star reviews account for the majority of all ratings.
* Positive customer experiences significantly outweigh negative experiences.
* Despite strong overall satisfaction, more than 11,000 one-star reviews suggest opportunities for operational improvement.

---

# Key Exploratory Findings

1. The marketplace served over 96,000 unique customers and processed nearly 100,000 orders.
2. More than 97% of all orders were successfully delivered.
3. Customer demand is heavily concentrated in São Paulo, Rio de Janeiro, and Minas Gerais.
4. The seller ecosystem is highly centralized, with São Paulo accounting for the majority of sellers.
5. Credit cards dominate transaction volume, while installment payments are commonly used.
6. Customer satisfaction is strong, with an average review score of 4.09 out of 5.
7. Order volume grew rapidly between 2017 and 2018, indicating marketplace expansion.
8. November 2017 experienced the highest monthly order volume, suggesting seasonal demand effects.

---

# Next Steps

The next phase of analysis will focus on:

* Revenue Analysis
* Customer Behavior Analysis
* Seller Performance Analysis
* Product Category Analysis
* Business Recommendations



