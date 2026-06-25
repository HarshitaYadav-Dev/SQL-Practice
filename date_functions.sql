SELECT * FROM products;
--1.NOW()-Get current date and time
SELECT NOW() AS current_date_time;

--2.CURRENT_DATE- Get current Date
SELECT CURRENT_DATE AS today_date;
SELECT  added_date,current_date,(CURRENT_DATE - added_date) AS days_difference
FROM products;

--3.CURRENT_DATE- Get current Time
SELECT CURRENT_TIME AS current_time;

--4.EXTRACT()- Extract parts of a date
--Extract the year,month, and day from the added_date column.
SELECT product_name,
      EXTRACT(YEAR FROM added_date) AS Year_added
FROM products;

SELECT product_name,
      EXTRACT(MONTH FROM added_date) AS month_added,
	  EXTRACT(DAY FROM added_date) AS Day_added
FROM products;

--5.Age() - Calculate age differences between dates
--Calculate the time difference between added_date and today's date.
SELECT product_name,
   AGE(current_date, added_date) as age_since_added
 FROM products;


 --6.TO_CHAR() - Format  Dates as Strings
 --Format added_date in a custom format(DD-Mon-YYYY).
 SELECT product_name,
   TO_CHAR( added_date, 'DD-Month-YY') as formated_date
 FROM products;

 --7.DATE_PART() -GeT specific Date Part
 --Extract the day of the week from added_date.
 SELECT product_name,added_date,DATE_PART('dow',added_date) AS day_of_week
 FROM products;

 --8.DATE_TRUNC() - Truncate Date to PRecision
 --Truncate added_date to the start of the month.
 SELECT product_name,added_date,DATE_TRUNC('MONTH',added_date) AS start_month
 FROM products;
 
 SELECT product_name,added_date,
            DATE_TRUNC('week',added_date) AS start_week,
            DATE_PART('isodow',added_date) AS day_of_week
 FROM products;


 --9.INTERVAL- add or subtract time intervals
 --add 6 months to the added_date.
 SELECT product_name,added_date,
        added_date + INTERVAL '6 months' As new_date
 FROM products;

 --10.TO_DATE() - convert string to Date
 --convert a string to a date format
 SELECT TO_DATE('28-11-2024','DD-MM-YYYY') AS converted_date;