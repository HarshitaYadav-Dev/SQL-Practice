--aise functions hote hain jo multiple rows par calculation karte hain
--Assign a unique row number to each product within the same category

SELECT product_name,category,price,
       ROW_NUMBER() OVER(PARTITION BY category ORDER BY price DESC) AS row_num
FROM products;



--1. ROW_NUMBER() (assign a unique number to each row)
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    salary DECIMAL(10,2)
);
INSERT INTO employees (emp_id, name, salary) VALUES
(1, 'Aman', 80000),
(2, 'Priya', 60000),
(3, 'Rahul', 90000),
(4, 'Neha', 60000),
(5, 'Vikas', 75000),
(6, 'Harshu', 30000);
SELECT * FROM employees;

SELECT name, salary,
   ROW_NUMBER() OVER(ORDER BY salary DESC) AS row_num
FROM employees;

-- 2.RANK()-Give the same rank to ties but skip the next rank
SELECT name, salary,
   RANK() OVER(ORDER BY salary DESC) AS rank_no
FROM employees;
--3.DENSE_RANK()-lIKE RANK(),but doesn't skip ranks.
SELECT name, salary,
   DENSE_RANK() OVER(ORDER BY salary DESC) AS rank_no
FROM employees;
--4.Running Total (Cumulative Sum)--keeps adding values from previous rows(order by necessary)
SELECT emp_id,
       salary,
       SUM(salary) OVER (ORDER BY emp_id) AS running_total
FROM employees;
--Grand total(order by use not necessary)
SELECT emp_id,
       salary,
       SUM(salary) OVER () AS total_salary
FROM employees;
-- 5.aggregate window function - Aggregate functions (SUM, AVG, COUNT, MIN, MAX) used with the OVER() clause.
-- Aggregate window function: returns total salary on every row
SELECT name,
       salary,
       SUM(salary) OVER() AS total_salary
FROM employees;

-- Aggregate window function: returns average salary on every row
SELECT name,
       salary,
       AVG(salary) OVER() AS avg_salary
FROM employees;
--Counts all rows and shows the count on every row.
SELECT name,
       salary,
       COUNT(*) OVER() AS total_employees
FROM employees;
--Finds the minimum salary and shows it on every row.
SELECT name,
       salary,
       MIN(salary) OVER() AS min_salary
FROM employees;
--Finds the maximum salary and shows it on every row.
SELECT name,
       salary,
       MAX(salary) OVER() AS max_salary
FROM employees;
-- 6.LAG() - Previous row ki value deta hai.
SELECT emp_id,
       salary,
       LAG(salary) OVER(ORDER BY emp_id) AS previous_salary
FROM employees;
-- 7.LEAD() -Next row ki value deta hai.
SELECT emp_id,
       salary,
       LEAD(salary) OVER(ORDER BY emp_id DESC) AS next_salary
FROM employees;
-- 8.FIRST_VALUE() -Window ki first value deta hai.
SELECT emp_id,
       salary,
       FIRST_VALUE(salary) OVER(ORDER BY salary) AS first_salary
FROM employees;
-- 9.LAST_VAlUE() -Window ki last value deta hai.
/*UNBOUNDED PRECEDING = First row
CURRENT ROW = Current row
UNBOUNDED FOLLOWING = Last row

ROWS BETWEEN UNBOUNDED PRECEDING
AND UNBOUNDED FOLLOWING

=> Considers all rows in the window.
=> Commonly used with LAST_VALUE(). 
LAST_VALUE() ke saath frame (ROWS BETWEEN ...) aksar dena padta hai, warna result confusing ho sakta hai.*/
SELECT emp_id,
       salary,
       LAST_VALUE(salary)
       OVER(
           ORDER BY salary
           ROWS BETWEEN UNBOUNDED PRECEDING
           AND UNBOUNDED FOLLOWING
       ) AS last_salary
FROM employees;
-- 10.NTILE()- Rows ko equal groups (buckets) me divide karta hai.
-- NTILE(2) = 2 groups
-- NTILE(4) = 4 groups
SELECT emp_id,
       salary,
       NTILE(4) OVER(ORDER BY salary) AS group_no
FROM employees;
