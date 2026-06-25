SELECT * FROM products;
--conditional functions- return results based on specific columns
/*1.case function- categorzing based on conditions/
categorzing based on price ranges */
-- 1.expensive if the price is greater than or equal to 50,000
-- 2.Moderate if the price is between 10,000 and 49,999
-- 3.Affordable if the price is less than 10,000
SELECT product_name,price,
    CASE
	  WHEN price>=50000 THEN 'Expensive'
	  WHEN price>=10000 AND price<=49999 THEN 'Moderate'
	  ELSE 'Affordable'
	END AS price_category
	FROM products;

--CASE with AND & OR operators - Stock Status
-- we will classify products based on quantity available
-- 1. In stock if quantity is 10 or more 
-- 2. Limited stock if quantity is b/w 5 and 9
-- 3. Out of stock if quantity is less than 5
 SELECT product_name,quantity,
      CASE
	    wHEN quantity>=10 THEN 'In stock'
		wHEN quantity >= 5 AND quantity <= 9 THEN 'Limited stock' -- this also use 'quantity BETWEEN 5 AND 9'
		ELSE 'out of stock'
		END AS stock_status
	FROM products;

--CASE with LIKE operator - category classification
/*Check if the category name contains 'Electronics Item' or 'furniture Item' or 'Accessory Item'
using  LIKE */
SELECT product_name,category,
     CASE
	    WHEN category LIKE 'Electronics%' THEN 'Electronics Item'
		WHEN category LIKE 'Furniture%' THEN 'Furniture Item'
		ELSE 'Accessory Item'
		END AS category_status
	FROM products;
    