-- Objective: Retrieve the unique markets where the customer 'Atliq Exclusive' operates within the APAC region.
--
-- Key Steps:
-- 1. SELECT DISTINCT(market): Selects only the unique market names to avoid duplicates.
-- 2. FROM dim_customer: Specifies the customer dimension table as the data source.
-- 3. WHERE clause: Filters the data based on two conditions:
--    - customer = 'Atliq Exclusive': Isolates records for this specific customer.
--    - region = 'APAC': Restricts the search to the Asia-Pacific region.

select * from dim_customer;
select distinct(market) from dim_customer 
where customer like "%Atliq Exclusive%" and region like "%APAC%"