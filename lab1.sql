SELECT last_name, job_id, hire_date AS STARTDATE, employee_id 
FROM employees;

SELECT DISTINCT job_id 
FROM employees;

SELECT last_name AS "Employee", job_id AS "Job", 
	   hire_date AS "Hire Date", employee_id AS "Emp #"
FROM employees;

SELECT last_name ||', '|| job_id AS "Employee and Title" 
FROM employees;

SELECT last_name AS "Employee", salary, salary*1.15 AS "Next Year Salary" 
FROM employees;

SELECT salary*12 AS "Year Salary" 
FROM employees;

SELECT last_name ||' for the year received '|| salary*12 AS "Total salary",
       salary*12*(1+coalesce(commission_pct, 0)) AS "Premium salary"
FROM employees;

SELECT first_name||E'\'s salary is '||salary
FROM employees;

SELECT first_name||' '||last_name ||' has phone number '|| phone_number
FROM employees;

SELECT DISTINCT department_id
FROM employees;