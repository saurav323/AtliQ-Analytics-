-- Problem Statement:
-- Generate a monthly report of **gross sales amount** for the customer "**Atliq Exclusive**".
-- This analysis helps in identifying low and high-performing months for strategic decision-making.
--
-- The final output should include the following columns:
--   - Month: Name of the month
--   - Year: Fiscal year
--   - Gross sales amount: Total sales amount (sold_quantity * gross_price), rounded to 2 decimals
--
-- This query joins sales, pricing, and customer data to compute the total monthly gross sales 
-- for "Atliq Exclusive" across all fiscal years.

select * from fact_gross_price;
select * from dim_customer;
select * from fact_sales_monthly;
select  
    MONTHNAME(s.date) AS month,
    s.fiscal_year AS year,round(SUM(s.sold_quantity * g.gross_price),2) AS gross_sales_amount
from  fact_sales_monthly s
join  fact_gross_price g ON s.product_code = g.product_code
join  dim_customer c ON s.customer_code = c.customer_code
where  c.customer = 'Atliq Exclusive'
group by 
s.fiscal_year, 
    monthname(s.date)
order by 
    s.fiscal_year; 
   