with quarterly_sales as (
select sold_quantity, 
case 
when month(date) in (9,10,11) then "Q1"
-- Problem Statement:
-- Identify the **quarter of fiscal year 2020** that had the **highest total_sold_quantity**.
-- The final output should include:
--   - Quarter: The fiscal quarter (Q1–Q4)
--   - total_sold_quantity: Sum of quantities sold in that quarter
--
-- This query groups sales by quarter using the fiscal month mapping,
-- filters data for fiscal year 2020, calculates total quantity sold per quarter,
-- and sorts the result in descending order of total_sold_quantity.

when month(date) in (12,1,2) then "Q2"
when month(date) in (3,4,5) then "Q3" 
else "Q4"
end as Quarter
	from fact_sales_monthly 
	where fiscal_year=2021
)
select Quarter, sum(sold_quantity) as total_sold_quentity 
from quarterly_sales group by Quarter order by total_sold_quentity desc;

