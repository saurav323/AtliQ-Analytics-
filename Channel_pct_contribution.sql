-- Problem Statement:
-- Identify which **channel** contributed the most to the **gross sales** in the **fiscal year 2021**,
-- along with each channel's **percentage share** of total gross sales.
--
-- The final output should include:
--   - channel: The sales channel (e.g., Online, Offline)
--   - gross_sales_mln: Gross sales in millions, rounded to 2 decimals
--   - percentage: Channel's contribution as a percentage of total gross sales
--
-- This query calculates total gross sales (sold_quantity × gross_price) for each channel
-- in FY 2021, converts it to millions, and then computes each channel’s share
-- of the total using a window function.
select * from dim_customer;
select * from fact_gross_price;
select * from fact_sales_monthly;

select s.product_code,round(sum(g.gross_price*s.sold_quantity)/1000,2) as gross_sales_mln
from fact_gross_price g join fact_sales_monthly s on s.product_code=g.product_code 
group by s.product_code order by gross_sales_mln desc
;

with cte1 as(select c.channel,sum(gross_price*sold_quantity) as total_gross_sales
     from fact_sales_monthly s join dim_customer c
         on c.customer_code=s.customer_code 
             join fact_gross_price g on g.product_code=s.product_code 
					group by c.channel)
                    
select channel, 
				round((total_gross_sales/1000000),2) as gross_sales_mln, 
					 round((total_gross_sales*100)/sum(total_gross_sales)  over (),2) as percentage 
				from cte1 
	 order by total_gross_sales desc; 

