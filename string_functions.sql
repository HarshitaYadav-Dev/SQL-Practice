--String functions in sql
SELECT* fRom products;

--get all the categories in upper case
SELECT UPPER(category) AS category_capital
FROM products;

--get all the categories in lower case
SELECT LOWER(category) AS lower_category
FROM products;

--join product_name and category text with hypen
SELECT CONCAT(product_name,'-',category)
FROM products;

--uses of concat
--Example 1: Combine First Name and Last Name
SELECT CONCAT(first_name, ' ', last_name) AS full_name
FROM employee4;
--Example 2: Create Email IDs
SELECT CONCAT(first_name,  last_name, '@gmail.com') AS email
FROM employee4;
--Example 3: Combine Text with Column Values
SELECT CONCAT(first_name, ' earns ₹', salary) AS employee_info
FROM employee4;

--Extract the first 5 characters from product_name
SELECT SUBSTRING(product_name,1,5) AS short_name
FROM products;
--general example of substring 
SELECT SUBSTRING('PostgreSQL',1,4);

--Count Length
SELECT product_name,LENGTH(product_name) AS COUNT_OF_CHAR
FROM products;
--Remove leading and trailing spaces from string
SELECT TRIM('  Monitor  ') AS Trimmed_Text;
SELECT LENGTH('  Monitor  ') AS length_Text;
SELECT LENGTH(TRIM('  Monitor  ')) AS Trimmed_Text;

--Replace the word 'phone' with 'device' in product_names
SELECT REPLACE(product_name,'phone','device') AS updated
FROM products;
SELECT REPLACE('SQL Query','Query','command');

--get the first 3 characters from category
SELECT LEFT(category,3) AS category_capital
FROM products;
--get the last 3 characters
SELECT RIGHT(category,3) AS category_capital
FROM products;