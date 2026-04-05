select * from `workspace`.`default`.`BrightLearnCoffeeShopSales` limit 100;


---------------------------------------------------------------------
---1.EXPLORING THE DATA ;THIS IS JUST TO CHECK THAT ALL IS IN ORDER,TABLE LOADED CORRECTLY,I AM ABLE TO READ IT PROPERLY
---------------------------------------------------------------------
SELECT *
FROM workspace.default.brightlearncoffeeshopsales
LIMIT 10;




---------------------------------------------
---2.CHECKING DATE RANGE
--------------------------------------------
----THEY STARTED COLLECTING DATA 2023-01-01
SELECT MIN(transaction_date) AS START_DATE
FROM workspace.default.bright_coffee_shop_sales;






-----THEY LAST DID THEY COLLECT DATA 2023-06-30
SELECT MAX(transaction_date) AS LATEST_DATE
FROM workspace.default.bright_coffee_shop_sales;






--DATE RANGE IS SIX MONTHS
----------------------------------------
---3.CHECKING STORE LOCATIONS
------------------------------------------
---WE HAVE THREE STORES ;Lower Manhattan,Astoria,Hells kitchen--
---------------------------------------
SELECT DISTINCT store_location
FROM workspace.default.bright_coffee_shop_sales;






----------------------------------------------
---4.CHECKING PRODUCTS SOLD IN THE STORES ACROSS 80 DIFFERENT PRODUCT CATEGORY
----------------------------------------------
SELECT DISTINCT product_category
FROM workspace.default.bright_coffee_shop_sales;






SELECT DISTINCT product_detail
FROM workspace.default.bright_coffee_shop_sales;






SELECT DISTINCT product_category AS category,
                product_detail AS product_name
FROM workspace.default.bright_coffee_shop_sales;







----------------------------------------------
---4.CHECKING PRODUCTS TYPES SOLD IN THE STORES ACROSS
----------------------------------------------
SELECT DISTINCT product_type
FROM workspace.default.bright_coffee_shop_sales;






----------------------------------------------
---5.CHECKING PRODUCTS SOLD IN THE STORES ACROSS
----------------------------------------------
SELECT DISTINCT product_detail
FROM workspace.default.bright_coffee_shop_sales;






SELECT DISTINCT product_category AS product_category,
                product_detail AS product_detail
FROM workspace.default.bright_coffee_shop_sales;






----------------------------------------------
---6.CHECKING NULL IN THE STORES ACROSS
----------------------------------------------
SELECT *
FROM workspace.default.bright_coffee_shop_sales
WHERE unit_price IS NULL
   OR transaction_qty IS NULL
   OR transaction_date IS NULL;




----------------------------------------------
---6.CHECKING LOWEST AND HIGHEST UNIT PRICE
----------------------------------------------
SELECT
       MIN(unit_price) AS lowest_unit_price,
       MAX(unit_price) AS highest_unit_price
FROM workspace.default.bright_coffee_shop_sales;






----------------------------------------------
---8.Extracting the date,day and the month names
----------------------------------------------
SELECT transaction_date,
      monthname(transaction_date) AS Month_name,
      dayname(transaction_date) AS dayname
FROM workspace.default.bright_coffee_shop_sales;






----------------------------------------------
---9.Calculate revenue
----------------------------------------------
SELECT unit_price,
       transaction_qty,
       unit_price * transaction_qty AS revenue
FROM workspace.default.bright_coffee_shop_sales;






SELECT dayname(transaction_date) AS dayname,
       COUNT(transaction_id) AS number_of_sales
FROM workspace.default.bright_coffee_shop_sales
GROUP BY dayname;






SELECT transaction_date,
       transaction_time,
       dayname(transaction_date) AS dayname,
       monthname(transaction_date) AS monthname
FROM workspace.default.bright_coffee_shop_sales;






SELECT
COUNT(*) AS number_of_rows,
COUNT(DISTINCT transaction_id) AS number_of_sales,
COUNT(DISTINCT product_id) AS number_of_products,
COUNT(DISTINCT store_id) AS number_of_stores
FROM workspace.default.bright_coffee_shop_sales;






SELECT
transaction_id,
transaction_date,
Dayname(transaction_date) AS Day_name,
Monthname(transaction_date) AS Month_name,
transaction_qty*unit_price AS revenue_per_tnx
FROM workspace.default.bright_coffee_shop_sales;





SELECT COUNT(*) FROM workspace.default.bright_coffee_shop_sales;




SELECT
transaction_date AS purchase_date,
Dayname(transaction_date) AS Day_name,
Monthname(transaction_date) AS Month_name,
Dayofmonth(transaction_date) AS day_of_month,
FROM workspace.default.bright_coffee_shop_sales;




CASE
WHEN Dayname(transaction_date) IN ('Sun','Sat') THEN 'Weekend'
ELSE 'Weekday'
END AS day_classifiction,

CASE
WHEN date_format(transaction_time, 'HH:mm:ss') BETWEEN '00:00:00' AND '11:59:59' THEN '01. Morning'
WHEN date_format(transaction_time, 'HH:mm:ss') BETWEEN '12:00:00' AND '16:59:59' THEN '02. Afternoon'
WHEN date_format(transaction_time, 'HH:mm:ss') >= '17:00:00' THEN '03. Evening'
END AS time_buckets,

COUNT(DISTINCT transaction_id) AS Number_of_sales,
COUNT(DISTINCT product_id) AS number_of_products,
COUNT(DISTINCT store_id) AS number_of_stores,
SUM(transaction_qty*unit_price) AS revenue_per_day

FROM workspace.default.bright_coffee_shop_sales
GROUP BY transaction_date,
Dayname(transaction_date),
Monthname(transaction_date),
Dayofmonth(transaction_date),

CASE
WHEN Dayname(transaction_date) IN ('Sun','Sat') THEN 'Weekend'
ELSE 'Weekday'
END,

CASE
WHEN date_format(transaction_time, 'HH:mm:ss') BETWEEN '00:00:00' AND '11:59:59' THEN '01. Morning'
WHEN date_format(transaction_time, 'HH:mm:ss') BETWEEN '12:00:00' AND '16:59:59' THEN '02. Afternoon'
WHEN date_format(transaction_time, 'HH:mm:ss') >= '17:00:00' THEN '03. Evening'
END;





-------------------------------------------------
-- 2. Checking the names of the different stores
------------------------------------------------
-- we have 3 stores and their names are Lower Manhattan, Hell's Kitchen, Astoria
SELECT DISTINCT store_location
FROM workspace.default.coffee_shop;





SELECT COUNT(DISTINCT store_id) AS number_of_stores
FROM workspace.default.coffee_shop;




-------------------------------------------------
-- 3. Checking products sold at our stores
------------------------------------------------
SELECT DISTINCT product_category
FROM workspace.default.coffee_shop;




SELECT DISTINCT product_detail
FROM workspace.default.coffee_shop;





SELECT DISTINCT product_type
FROM workspace.default.coffee_shop;





SELECT DISTINCT product_category AS category,
product_detail AS product_name
FROM workspace.default.coffee_shop;





-------------------------------------------------
-- 1. Checking product prices
------------------------------------------------
SELECT MIN(unit_price) As cheapest_price
FROM workspace.default.bright_coffee_shop_sales;



SELECT MAX(unit_price) As expensive_price
FROM workspace.default.bright_coffee_shop_sales;



------------------------------------------------
SELECT
COUNT(*) AS number_of_rows,
COUNT(DISTINCT transaction_id) AS number_of_sales,
COUNT(DISTINCT product_id) AS number_of_products,
COUNT(DISTINCT store_id) AS number_of_stores
FROM workspace.default.coffee_shop;



------------------------------------------------
SELECT *
FROM workspace.default.coffee_shop
LIMIT 10;



SELECT
transaction_id,
transaction_date,
Dayname(transaction_date) AS Day_name,
Monthname(transaction_date) AS Month_name,
transaction_qty*unit_price AS revenue_per_tnx




-----------------------------------------------------
SELECT COUNT(*)
FROM workspace.default.bright_coffee_shop_sales;




SELECT
-- Dates
transaction_date AS purchase_date,
Dayname(transaction_date) AS Day_name,
Monthname(transaction_date) AS Month_name,
Dayofmonth(transaction_date) AS day_of_month,

CASE
WHEN Dayname(transaction_date) IN ('Sun','Sat') THEN 'Weekend'
ELSE 'Weekday'
END AS day_classifiction,

--date_format(transaction_time, 'HH:mm:ss') AS purchase_time,
CASE
WHEN date_format(transaction_time, 'HH:mm:ss') BETWEEN '00:00:00' AND '11:59:59' THEN '01. Morning'
WHEN date_format(transaction_time, 'HH:mm:ss') BETWEEN '12:00:00' AND '16:59:59' THEN '02. Afternoon'
WHEN date_format(transaction_time, 'HH:mm:ss') >= '17:00:00' THEN '03. Evening'
END AS time_buckets,

-- Counts of IDS
COUNT(DISTINCT transaction_id) AS Number_of_sales,
COUNT(DISTINCT product_id) AS number_of_products,
COUNT(DISTINCT store_id) AS number_of_stores,
-- Revenue
SUM(transaction_qty*unit_price) AS revenue_per_day,

CASE
WHEN SUM(transaction_qty*unit_price) <=50 THEN '01. Low Spend'
WHEN SUM(transaction_qty*unit_price) BETWEEN 51 AND 100 THEN '02. Med Spend'
ELSE '03. High Spend'
END AS spend_bucket,

-- Categorical columns
store_location,
product_category,
product_detail

FROM workspace.default.bright_coffee_shop_sales
GROUP BY transaction_date,
Dayname(transaction_date),
Monthname(transaction_date),
Dayofmonth(transaction_date),

CASE
WHEN Dayname(transaction_date) IN ('Sun','Sat') THEN 'Weekend'
ELSE 'Weekday'
END,

CASE
WHEN date_format(transaction_time, 'HH:mm:ss') BETWEEN '00:00:00' AND '11:59:59' THEN '01. Morning'
WHEN date_format(transaction_time, 'HH:mm:ss') BETWEEN '12:00:00' AND '16:59:59' THEN '02. Afternoon'
WHEN date_format(transaction_time, 'HH:mm:ss') >= '17:00:00' THEN '03. Evening'
END,

store_location,
product_category,
product_detail;
