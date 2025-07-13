
-- Problem Statement:
-- Retrieve the products with the **highest** and **lowest** manufacturing costs.
-- The final output should display the following fields:
--   - product_code: Unique identifier of the product
--   - product: Name of the product
--   - manufacturing_cost: Corresponding manufacturing cost
--
-- This query uses a subquery to get both maximum and minimum manufacturing cost values
-- and filters the main table using `IN` to return the matching products.

select * from dim_product;
select * from fact_manufacturing_cost;

  select p.product,p.product_code,manufacturing_cost from fact_manufacturing_cost m 
  join dim_product p on p.product_code=m.product_code where  # I have utilized Subqury to attain this outcome
  manufacturing_cost in( select max(manufacturing_cost) from fact_manufacturing_cost union
  
  (select min(manufacturing_cost) from fact_manufacturing_cost)); 