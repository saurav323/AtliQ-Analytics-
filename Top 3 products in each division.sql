-- Problem Statement:
-- Retrieve the **Top 3 products** in terms of **total_sold_quantity** for each **division**
-- during the **fiscal year 2021**.
--
-- The final output should contain the following fields:
--   - division: Business division to which the product belongs
--   - product_code: Unique identifier of the product
--   - product: Name of the product
--   - total_sold_quantity: Total quantity sold in FY 2021
--   - rank_order: Rank of the product within its division based on total_sold_quantity
--
-- This query uses a CTE to aggregate product sales per division, and another CTE to rank them
-- using the `RANK()` window function, filtering for the top 3 ranked products per division.
with 
	cte_product_sales as ( select p.division, p.product_code,p.product,
            sum(s.sold_quantity) as total_sold_quantity from
            fact_sales_monthly s join
            dim_product p on s.product_code = p.product_code where
            s.fiscal_year = 2021 group by
            p.division, p.product_code, p.product ),
					
	cte_ranked_sales as ( select *,
				rank() over (
                partition by division 
                order by total_sold_quantity desc) as rank_order
		from cte_product_sales)
				select division,product_code,product,
						total_sold_quantity,
						rank_order from
				cte_ranked_sales where
		rank_order <= 3;  
        
        
           