-- Problem Statement:
-- Calculate the percentage increase in the number of unique products sold in 2021 compared to 2020.
-- The final output should include:
--   - unique_products_2020: Number of distinct products sold in 2020
--   - unique_products_2021: Number of distinct products sold in 2021
--   - percentage_chg: Percentage change in product count from 2020 to 2021
-- 
-- This intermediate query calculates the unique product count per segment for 2020 and 2021,
-- and also shows the difference between the two years.
with segment_product_counts AS (
  select  p.segment,
     count(DISTINCT CASE WHEN s.fiscal_year = 2020 THEN s.product_code END) AS product_count_2020,
     count(DISTINCT CASE WHEN s.fiscal_year = 2021 THEN s.product_code END) AS product_count_2021 from 
     fact_sales_monthly s
	join 
    dim_product p ON s.product_code = p.product_code where 
    s.fiscal_year IN (2020, 2021) group by 
	 p.segment)   
select 
  segment,
  product_count_2020,
  product_count_2021,
  (product_count_2021 - product_count_2020) as difference
from 
  segment_product_counts
order by 
  difference desc;        
            
 