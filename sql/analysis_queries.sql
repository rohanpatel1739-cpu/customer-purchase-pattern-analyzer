/*
=========================================================
Customer Purchase Pattern Analyzer
SQL Analysis Queries
Author: Rohan Patel
Database: PostgreSQL
=========================================================

Project Objective:
Analyze customer purchasing behavior, product performance,
customer segments, and revenue trends to generate
business insights for a retail company.
=========================================================
*/


-- =====================================================
-- Query 1: View Sample Records
-- Purpose: Verify data import and inspect dataset
-- =====================================================

SELECT *
FROM customer_purchase
LIMIT 10;


-- =====================================================
-- Query 2: Count Total Records
-- Purpose: Find total number of transactions
-- =====================================================

SELECT COUNT(*) AS total_records
FROM customer_purchase;


-- =====================================================
-- Query 3: Calculate Total Revenue
-- Purpose: Determine overall revenue generated
-- =====================================================

SELECT
SUM(total_purchase_value) AS total_revenue
FROM customer_purchase;


-- =====================================================
-- Query 4: Count Unique Customers
-- Purpose: Identify total distinct customers
-- =====================================================

SELECT
COUNT(DISTINCT customer_id) AS total_customers
FROM customer_purchase;


-- =====================================================
-- Query 5: Calculate Average Order Value (AOV)
-- Purpose: Measure average spending per order
-- =====================================================

SELECT
ROUND(AVG(total_purchase_value), 2) AS average_order_value
FROM customer_purchase;


-- =====================================================
-- Query 6: Revenue by Region
-- Purpose: Compare regional sales performance
-- =====================================================

SELECT
region,
SUM(total_purchase_value) AS revenue
FROM customer_purchase
GROUP BY region
ORDER BY revenue DESC;


-- =====================================================
-- Query 7: Revenue by Product Category
-- Purpose: Identify top-performing product categories
-- =====================================================

SELECT
product_category,
SUM(total_purchase_value) AS revenue
FROM customer_purchase
GROUP BY product_category
ORDER BY revenue DESC;


-- =====================================================
-- Query 8: Top 10 Customers by Revenue
-- Purpose: Identify highest-value customers
-- =====================================================

SELECT
customer_name,
SUM(total_purchase_value) AS revenue
FROM customer_purchase
GROUP BY customer_name
ORDER BY revenue DESC
LIMIT 10;


-- =====================================================
-- Query 9: Payment Method Analysis
-- Purpose: Understand customer payment preferences
-- =====================================================

SELECT
payment_method,
COUNT(*) AS transactions
FROM customer_purchase
GROUP BY payment_method
ORDER BY transactions DESC;


-- =====================================================
-- Query 10: Revenue by Customer Segment
-- Purpose: Compare contribution of Premium,
-- Regular, and Budget customers
-- =====================================================

SELECT
customer_segment,
SUM(total_purchase_value) AS revenue
FROM customer_purchase
GROUP BY customer_segment
ORDER BY revenue DESC;


-- =====================================================
-- Query 11: Customer Distribution by Age Group
-- Purpose: Analyze customer demographics
-- =====================================================

SELECT
CASE
    WHEN age <= 25 THEN '18-25'
    WHEN age <= 35 THEN '26-35'
    WHEN age <= 45 THEN '36-45'
    ELSE '46+'
END AS age_group,
COUNT(*) AS customers
FROM customer_purchase
GROUP BY age_group
ORDER BY age_group;


-- =====================================================
-- Query 12: Top Cities by Revenue
-- Purpose: Identify cities generating maximum revenue
-- =====================================================

SELECT
city,
SUM(total_purchase_value) AS revenue
FROM customer_purchase
GROUP BY city
ORDER BY revenue DESC
LIMIT 10;


-- =====================================================
-- Query 13: Revenue by Loyalty Status
-- Purpose: Measure effectiveness of loyalty programs
-- =====================================================

SELECT
loyalty_status,
SUM(total_purchase_value) AS revenue
FROM customer_purchase
GROUP BY loyalty_status
ORDER BY revenue DESC;


-- =====================================================
-- Query 14: Revenue by Purchase Channel
-- Purpose: Compare Online vs Offline sales
-- =====================================================

SELECT
purchase_channel,
SUM(total_purchase_value) AS revenue
FROM customer_purchase
GROUP BY purchase_channel
ORDER BY revenue DESC;


-- =====================================================
-- Query 15: Revenue by Gender
-- Purpose: Analyze purchasing contribution by gender
-- =====================================================

SELECT
gender,
SUM(total_purchase_value) AS revenue
FROM customer_purchase
GROUP BY gender
ORDER BY revenue DESC;


-- =====================================================
-- Query 16: Average Revenue by Customer Segment
-- Purpose: Compare average spending behavior
-- across customer segments
-- =====================================================

SELECT
customer_segment,
ROUND(AVG(total_purchase_value), 2) AS avg_revenue
FROM customer_purchase
GROUP BY customer_segment
ORDER BY avg_revenue DESC;


-- =====================================================
-- Query 17: Quantity Sold by Product Category
-- Purpose: Identify categories with highest sales volume
-- =====================================================

SELECT
product_category,
SUM(quantity_purchased) AS total_quantity
FROM customer_purchase
GROUP BY product_category
ORDER BY total_quantity DESC;


-- =====================================================
-- Query 18: Monthly Revenue Trend
-- Purpose: Analyze revenue performance across months
-- =====================================================

SELECT
EXTRACT(MONTH FROM purchase_date) AS month,
SUM(total_purchase_value) AS revenue
FROM customer_purchase
GROUP BY month
ORDER BY month;


/*
=========================================================
Analysis Summary

Total Revenue        : ₹1.13M+
Total Customers      : 200
Average Order Value  : ₹5.65K
Total Orders         : 200

Key Findings:
1. Fashion category generated highest revenue.
2. Premium customers contributed highest revenue.
3. Top customers generated approximately ₹25K revenue.
4. Revenue fluctuated across months indicating seasonal demand.
5. Customer revenue contribution was balanced across segments.

=========================================================
*/