# E-Commerce-Sales-Analysis

## Project Overview

This project uses SQL (MySQL) to analyse an e-commerce dataset, focusing on sales performance, customer purchasing behaviour, product category performance, payment preferences, and customer segment performance.

The objective is to extract meaningful business insights from customer and order data and use those insights to support better business decisions.

The project uses two CSV files:

- `customers.csv` – Contains customer information, location, registration date, and customer segment.
- `orders.csv` – Contains order transactions, product details, order value, payment methods, and order status.

The two datasets are connected using the `customer_id` field.

## Business Questions

The analysis focuses on answering the following business questions:

1. How are customers distributed across different cities?
2. Which product categories generate the highest revenue?
3. Who are the customers making purchases, and what products are they buying?
4. Which registered customers have never placed an order?
5. Who are the top 5 revenue-generating customers?
6. How does revenue change monthly, and what is the month-over-month growth?
7. Which payment methods do customers use most frequently?
8. Which customer segment generates the highest revenue?

## Tools Used

- **MySQL** – Data analysis and querying.
- **SQL** – Data manipulation and business analysis.
- **GitHub** – Project documentation and portfolio presentation.

## Data Preparation

The project uses two datasets containing:

- **Customers:** 400 records.
- **Orders:** 3,000 records.

The datasets were inspected for missing values and reviewed to understand their structure and relationships.

The following preparation and validation checks were considered:

- Reviewing column names and data types.
- Checking for missing values.
- Identifying the relationship between customers and orders through `customer_id`.
- Reviewing order dates, order totals, and order statuses.
- Separating completed sales from other order statuses for revenue analysis.

For revenue-related queries, only orders with the status `Delivered` were included. This prevents cancelled, returned, processing, and shipped orders from being treated as completed sales.

## SQL Analysis

The project demonstrates different SQL concepts through beginner, intermediate, and advanced queries.
- COUNT()
- SUM()
- GROUP BY
- ORDER BY
- WHERE
- INNER JOIN
- LEFT JOIN
- IS NULL
- Common Table Expressions (CTEs)
- Window Functions
- LAG()
- Month-over-month revenue analysis

## Findings

The following findings were obtained after running the SQL queries against the two datasets.

### 1. Customer Distribution by City

- Ilorin had the highest number of registered customers, with **53 customers**.
- Abuja, Kano, and Enugu each had **42 customers**.
- Abeokuta had the lowest customer count, with **31 customers**.

**Business Insight:** Ilorin represents the largest customer concentration in the dataset. This could make it a useful location for targeted marketing and customer engagement campaigns.

### 2. Sales Performance by Category

Electronics generated the highest delivered-order revenue, followed by Fashion and Beauty.

| Product Category | Revenue |
|---|---:|
| Electronics | 36,379,259.63 |
| Fashion | 33,919,007.61 |
| Beauty | 24,640,561.92 |
| Home & Kitchen | 23,517,799.71 |
| Sports | 13,692,825.56 |
| Books | 8,051,372.39 |
| Groceries | 7,180,674.83 |
| Phones & Accessories | 4,137,255.90 |
| Office Supplies | 2,171,515.06 |

**Business Insight:** Electronics and Fashion are the strongest revenue-generating categories. The business could prioritise inventory availability and promotional campaigns in these categories while investigating opportunities to improve lower-performing categories.

### 3. Customer Purchase Details

An INNER JOIN was used to connect customer records with their order history.

The query successfully returned customer names, order IDs, products purchased, order totals, and order dates. The five most recent order records included purchases such as Wireless Headphones, Electric Kettles, and Backpacks.

**Business Insight:** Connecting customer and order data makes it possible to understand individual purchasing behaviour and supports customer-level analysis.

### 4. Customers Who Have Never Purchased

The LEFT JOIN query identified **1 registered customer** who had never placed an order.

**Business Insight:** This customer represents a potential conversion opportunity. The business could use targeted onboarding messages, product recommendations, or first-purchase incentives to encourage an initial transaction.

### 5. Monthly Revenue Growth

The monthly revenue analysis showed that revenue fluctuated throughout the period.

- **Highest monthly revenue:** November 2025, with 8,488,034.19.
- **Lowest monthly revenue:** August 2024, with 5,260,095.77.
- **November 2025 growth:** Revenue increased by approximately 23.61% compared with October 2025.
- **September 2025 growth:** Revenue increased by approximately 29.01% compared with August 2025.

**Business Insight:** The business experienced both positive and negative monthly revenue movements. Monitoring these changes can help management identify strong sales periods, investigate declines, and improve sales planning.

### 6. Payment Method Analysis

Card was the most frequently used payment method, with Bank Transfer ranking a very close second.

| Payment Method | Number of Orders |
|---|---:|
| Card | 639 |
| Bank Transfer | 638 |
| USSD | 592 |
| Wallet | 569 |
| Cash on Delivery | 562 |

**Business Insight:** Card and Bank Transfer together account for a substantial share of recorded transactions. The business should maintain reliable payment experiences across these methods while continuing to support customers who prefer USSD, Wallet, and Cash on Delivery.

*Note: This analysis counts all recorded orders, regardless of order status.*

### 7. Customer Segment Performance

The analysis compared delivered-order revenue across the three customer segments.

| Customer Segment | Total Revenue |
|---|---:|
| New | 53,186,802.33 |
| Premium | 51,555,353.89 |
| Regular | 48,948,116.39 |

**Business Insight:** New customers generated the highest delivered-order revenue, followed by Premium customers and Regular customers.

This suggests that newly acquired customers represent an important revenue opportunity. The business should focus on converting first-time buyers into repeat customers while maintaining engagement with Premium and Regular customers.

## Recommendations

Based on the findings, the following business recommendations are proposed:

1. **Strengthen customer retention:** Introduce loyalty programmes and personalised offers for high-value customers.
2. **Improve customer conversion:** Develop targeted campaigns for registered customers who have not made a purchase.
3. **Prioritise high-performing categories:** Maintain sufficient stock and promotional support for Electronics, Fashion, and Beauty.
4. **Monitor monthly revenue:** Track month-over-month performance to identify revenue declines and improve sales planning.
5. **Maintain payment flexibility:** Continue supporting all five payment methods while ensuring reliable transaction experiences.
6. **Focus on customer segmentation:** Develop different marketing strategies for New, Regular, and Premium customers.
7. **Build repeat-purchase behaviour:** Encourage newly acquired customers to become regular buyers through follow-up campaigns and relevant product recommendations.

## Conclusion

This project demonstrates how SQL can be used to transform raw customer and transaction data into meaningful business insights.

By applying SQL concepts such as aggregations, joins, subqueries, CTEs, and window functions, the analysis provides insights into customer distribution, sales performance, purchasing behaviour, payment preferences, and customer segment revenue.

The project also demonstrates the use of SQL to answer practical business questions and support data-driven decision-making.

**SQL Skills Demonstrated:** Data querying, filtering, aggregation, joins, subqueries, CTEs, window functions, ranking, and time-based revenue analysis.

