# Customer Analysis

## Objective

The purpose of this analysis is to understand customer behavior, purchasing patterns, customer distribution, repeat purchase behavior, customer value, and overall customer engagement within the Olist marketplace.

---

# 1. Customer Overview

## Key Metrics

| Metric | Value |
|----------|----------:|
| Unique Customers | 96,096 |
| Customer Records | 99,441 |
| Additional Customer Records | 3,345 |

### Observations

- The dataset contains 96,096 unique customers.
- There are 99,441 customer records.
- The difference of 3,345 records indicates that some customers have multiple customer records associated with them.

### Insight

Customer-level analysis should use `customer_unique_id` rather than `customer_id` to avoid overcounting customers.

---

# 2. Customer Geography Analysis

## Top 10 States by Customers

| State | Customers |
|----------|----------:|
| SP | 40,302 |
| RJ | 12,384 |
| MG | 11,259 |
| RS | 5,277 |
| PR | 4,882 |
| SC | 3,534 |
| BA | 3,277 |
| DF | 2,075 |
| ES | 1,964 |
| GO | 1,952 |

### Observations

- São Paulo is the dominant customer market.
- Rio de Janeiro and Minas Gerais form the next largest customer bases.
- Customer concentration is heavily skewed toward southeastern Brazil.

### Insight

The top three states account for a significant portion of the marketplace's customer base, indicating strong regional concentration.

---

## Top 10 Customer Cities

| City | Customers |
|----------|----------:|
| Sao Paulo | 14,984 |
| Rio de Janeiro | 6,620 |
| Belo Horizonte | 2,672 |
| Brasilia | 2,069 |
| Curitiba | 1,465 |
| Campinas | 1,398 |
| Porto Alegre | 1,326 |
| Salvador | 1,209 |
| Guarulhos | 1,153 |
| Sao Bernardo do Campo | 908 |

### Observations

- São Paulo city alone contributes nearly 15,000 customers.
- Major metropolitan regions represent the largest customer markets.

---

# 3. Customer Order Behavior

## Orders Per Customer Distribution

| Orders | Customers |
|----------|----------:|
| 1 | 93,099 |
| 2 | 2,745 |
| 3 | 203 |
| 4 | 30 |
| 5 | 8 |
| 6 | 6 |
| 7 | 3 |
| 9 | 1 |
| 17 | 1 |

### Observations

- Most customers place only one order.
- Customer activity drops sharply after the first purchase.
- Very few customers become highly active buyers.

### Insight

The marketplace has a large acquisition base but relatively weak repeat purchasing behavior.

---

## Maximum Orders by a Customer

| Metric | Value |
|----------|----------:|
| Maximum Orders by One Customer | 17 |

### Observation

The most active customer placed 17 separate orders during the dataset period.

---

## Top Customers by Number of Orders

| Customer ID | Orders |
|----------|----------:|
| 8d50f5eadf50201ccdcedfb9e2ac8455 | 17 |
| 3e43e6105506432c953e165fb2acf44c | 9 |
| ca77025e7201e3b30c44b472ff346268 | 7 |
| 1b6c7548a2a1f9037c1fd3ddfed95f33 | 7 |
| 6469f99c1f9dfae7733b25662e7f1782 | 7 |

### Observation

A very small subset of customers demonstrates strong repeat purchasing behavior.

---

# 4. Repeat Customer Analysis

## One-Time vs Repeat Customers

| Customer Type | Customers |
|----------|----------:|
| One-Time Customer | 93,099 |
| Repeat Customer | 2,997 |

### Observations

- The vast majority of customers purchase only once.
- Repeat customers represent a small fraction of the customer base.

---

## Repeat Customer Percentage

| Metric | Value |
|----------|----------:|
| Repeat Customer Rate | 3.12% |

### Insight

Only 3.12% of customers return for an additional purchase, indicating a significant customer retention opportunity.

---

# 5. Customer Segmentation

## Customer Segments

| Segment | Customers |
|----------|----------:|
| One-Time | 93,099 |
| Returning (2-5 Orders) | 2,986 |
| Loyal (>5 Orders) | 11 |

### Observations

- One-time customers dominate the marketplace.
- Returning customers account for a small share of users.
- Loyal customers are extremely rare.

### Insight

The customer base is highly acquisition-driven rather than loyalty-driven.

---

# 6. Customer Value Analysis

## Top 10 Customers by Revenue

| Customer ID | Revenue |
|----------|----------:|
| 0a0a92112bd4c708ca5fde585afaa872 | 13,440.00 |
| da122df9eeddfedc1dc1f5349a1a690c | 7,388.00 |
| 763c8b1c9c68a0229c42c9fc6f662b93 | 7,160.00 |
| dc4802a71eae9be1dd28f5d788ceb526 | 6,735.00 |
| 459bef486812aa25204be022145caa62 | 6,729.00 |

### Observations

- A small number of customers generate significantly higher revenue than average.
- High-value customers contribute disproportionately to sales.

---

## Average Customer Value

| Metric | Value |
|----------|----------:|
| Average Revenue per Customer | 142.44 |

### Insight

The average customer contributes approximately 142.44 in product revenue over the observed period.

---

# 7. Customer Satisfaction

## Review Score Distribution

| Review Score | Reviews |
|----------|----------:|
| 1 | 11,424 |
| 2 | 3,151 |
| 3 | 8,179 |
| 4 | 19,142 |
| 5 | 57,328 |

### Observations

- Five-star reviews account for the majority of customer feedback.
- Positive reviews significantly outweigh negative reviews.
- More than 57% of all reviews are 5-star ratings.

### Insight

Overall customer satisfaction is strong despite the low repeat purchase rate.

---

# Key Customer Findings

1. The marketplace served 96,096 unique customers.
2. Customer demand is heavily concentrated in São Paulo, Rio de Janeiro, and Minas Gerais.
3. Nearly 97% of customers placed only one order.
4. The repeat customer rate is only 3.12%.
5. Only 11 customers can be classified as loyal customers with more than five orders.
6. Average customer value is 142.44.
7. Customer satisfaction remains high, with most reviews receiving 4 or 5 stars.
8. The marketplace appears to be highly dependent on new customer acquisition rather than customer retention.

---

# Conclusion

Customer acquisition has been successful, resulting in a large customer base and strong order volume. However, repeat purchasing behavior is limited, with only 3.12% of customers making multiple purchases. Improving retention and increasing customer lifetime value represent the largest opportunities for long-term marketplace growth.