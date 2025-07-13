-- Problem Statement:
-- Generate a report of the **top 5 customers** in the **Indian market** who received the **highest average**
-- `pre_invoice_discount_pct` during the **fiscal year 2021**.
--
-- The final output should include the following fields:
--   - customer_code: Unique code assigned to the customer
--   - customer: Customer name
--   - average_discount_percentage: Rounded average of pre-invoice discount percentage
--
-- This query filters data for fiscal year 2021 and Indian market,
-- joins customer details, calculates the average discount,
-- and returns the top 5 customers in descending order of discount percentage.

select c.customer_code,c.customer,round(avg(pi.pre_invoice_discount_pct),2) as avg_discount_pct
   from fact_pre_invoice_deductions pi join dim_customer c 
     on c.customer_code=pi.customer_code where market="India" group by c.customer_code,c.customer order by avg_discount_pct desc 
     limit 5; 
     
