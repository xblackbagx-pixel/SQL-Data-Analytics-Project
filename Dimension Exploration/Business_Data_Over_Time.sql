--Aggregating Years of Business Revenue

SELECT 
--WIthout YEAR() it would be by the day
Year(order_date) AS order_year,
SUM(sales_amount) AS total_Sales, 
--trend of total customers over period of time determinded by GROUP BY
COUNT(DISTINCT customer_key) AS total_customers,
SUM(quantity) AS total_quantity
FROM gold.fact_sales
WHERE order_date is NOT NULL 
--Can do over months if make this MONTH()
GROUP BY YEAR(order_date)
ORDER BY YEAR(order_date)
