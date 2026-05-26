--Calculate the toal sales per month
--and the running total of sales over time
SELECT
order_date,
total_sales,
SUM(total_sales) OVER (PARTITION BY order_date ORDER BY order_date) AS running_total_sales
FROM
(
SELECT 
--Change DATETRUNC() to year + GROUP BY to year, then you would get annual culmative
DATETRUNC(month, order_date) AS order_date,
SUM(Sales_amount) AS total_sales
FROM gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY DATETRUNC(month, order_date)
)t

