SELECT now() AS Date;

SELECT employee_id,
last_name,
salary, 
round(salary*1.155) AS "New Salary"
FROM employees;

SELECT first_name, last_name
FROM employees
WHERE substring(last_name from 2 for 1) = 'a';

SELECT employee_id,
last_name,
salary, 
round(salary*1.155) AS "New Salary",
round(salary*1.155-salary) AS "Increase"
FROM employees;

SELECT last_name,
initcap(last_name),
length(last_name)
FROM employees
WHERE substring(last_name for 1) = 'M'
OR substring(last_name for 1) = 'J'
OR substring(last_name for 1) = 'A'
ORDER BY length(last_name) ASC;

SELECT first_name,
last_name,
hire_date,
extract(month from age(now(), hire_date)) + 
12 * extract(year from age(now(), hire_date))
FROM employees;

SELECT format('%s earns %s monthly, but wants %s', last_name, salary, 3*salary) 
AS "Dream Salary" 
FROM employees;

SELECT first_name,
last_name,
lpad(salary::text, 15, '$')
FROM employees;

SELECT format('%s earns %s monthly, but wants %s', upper(last_name), salary, 3*salary) 
AS "Dream Salary" 
FROM employees;

SELECT first_name,
last_name,
rpad((extract(month from age(now(), hire_date)) + 12 * extract(year from age(now(), hire_date)))::text, 10, '0')
FROM employees;

SELECT *
FROM employees
WHERE substring(last_name from 4) != '';

SELECT *
FROM employees
WHERE length(last_name) > 3;

SELECT employee_id,
first_name,
trim('K' from last_name),
email,
phone_number,
hire_date,
job_id,
salary,
commission_pct,
manager_id,
department_id
FROM employees;

SELECT *
FROM employees
WHERE position('in' in last_name) != 0;

SELECT employee_id,
first_name,
replace(last_name, 'in', 'pm'),
email,
phone_number,
hire_date,
job_id,
salary,
commission_pct,
manager_id,
department_id
FROM employees;

SELECT *
FROM employees
WHERE position('i' in last_name) = 2;

SELECT concat_ws(', ', employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id) AS "THE OUTPUT"
FROM employees;
