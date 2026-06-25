CREATE TABLE employees3 (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    department_id INT,
    salary DECIMAL(10,2)
);

INSERT INTO employees3 (employee_id, employee_name, department_id, salary)
VALUES
(101, 'Amit', 1, 45000),
(102, 'Priya', 2, 60000),
(103, 'Rahul', 2, 55000),
(104, 'Neha', 3, 70000),
(105, 'Vikas', NULL, 50000),
(106, 'Sneha', 5, 65000);
SELECT * FROM employees3;

CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);
INSERT INTO departments (department_id, department_name)
VALUES
(1, 'HR'),
(2, 'IT'),
(3, 'Finance'),
(4, 'Marketing');
SELECT * FROM departments;

--1.INNER JOIN
--Sirf wahi rows return hoti hain jahan dono tables me matching value 
SELECT e.employee_id,
       e.employee_name,
       d.department_name,
       e.salary
FROM employees3 e
INNER JOIN departments d
ON e.department_id = d.department_id;

--2.LEFT JOIN
--Left table (employees3) ki sabhi rows + matching rows from right table (departments)
SELECT e.employee_id,
       e.employee_name,
       d.department_name
FROM employees3 e
LEFT JOIN departments d
ON e.department_id = d.department_id;

--3.RIGHT JOIN

--Right table (departments) ki sabhi rows + matching rows from left table

SELECT e.employee_name,
       d.department_name
FROM employees3 e
RIGHT JOIN departments d
ON e.department_id = d.department_id;

--4.FULL OUTER JOIN

--Dono tables ki sabhi rows. Match ho to combine, warna NULL. in english
SELECT e.employee_name,
       d.department_name
FROM employees3 e
FULL OUTER JOIN departments d
ON e.department_id = d.department_id;


--5.CROSS JOIN
--Every employee with every department
 /*No. of employees × No. of departments
= 6 × 4
= 24 rows */
SELECT e.employee_name,
       d.department_name
FROM employees3 e
CROSS JOIN departments d;

--6.SELF jOIN
CREATE TABLE employees420 (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    manager_id INT
);
INSERT INTO employees420
VALUES
(1, 'Amit', NULL),
(2, 'Priya', 1),
(3, 'Rahul', 1),
(4, 'Neha', 2);
SELECT e.employee_name AS employee,
       m.employee_name AS manager
FROM employees420 e
LEFT JOIN employees420 m
ON e.manager_id = m.employee_id;