-- Problem Statement:
-- Generate a report that displays the count of unique products available in each segment.
-- The output should include:
--   - segment: The product segment name
--   - product_count: The number of unique products in each segment
-- 
-- Sort the output in descending order of product_count to highlight segments with the highest variety of products.

select segment,count(*) as product_count from dim_product 
group by segment order by product_count desc; 