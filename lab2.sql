SELECT first_name, last_name, salary
FROM employees
WHERE salary > 12000;

SELECT last_name, department_id, employee_id
FROM employees
WHERE employee_id = 176;

SELECT first_name, last_name, salary, department_id
FROM employees
WHERE salary NOT BETWEEN 5000 AND 12000;

SELECT last_name, job_id, hire_date
FROM employees
WHERE last_name IN ('Matos', 'Taylor');

SELECT last_name, department_id
FROM employees
WHERE department_id IN (20, 50);

SELECT last_name||' '||first_name AS "Employee", 
       salary AS "Monthly Salary", department_id
FROM employees
WHERE salary BETWEEN 5000 AND 12000;

SELECT last_name, employee_id, hire_date
FROM employees
WHERE EXTRACT('YEAR' FROM hire_date) = 2002;

SELECT last_name, job_id, employee_id, manager_id
FROM employees
WHERE manager_id IS NULL;

SELECT first_name, last_name, salary, (1+commission_pct)*salary
FROM employees
WHERE commission_pct IS NOT NULL
ORDER BY salary DESC, (1+commission_pct)*salary DESC;

SELECT first_name, last_name, salary
FROM employees
WHERE salary > 10000;

SELECT employee_id, first_name, last_name, salary, 
department_id, manager_id
FROM employees
WHERE manager_id IN (103, 201, 124)
ORDER BY last_name;

SELECT employee_id, first_name, last_name
FROM employees
WHERE last_name LIKE '__a%';

SELECT employee_id, first_name, last_name
FROM employees
WHERE last_name LIKE '%a%' OR 
last_name LIKE '%e%' OR
last_name LIKE 'A%' OR 
last_name LIKE 'E%';

SELECT employee_id, first_name, last_name, job_id, salary
FROM employees
WHERE job_id IN ('SA_REP', 'ST_CLERK')
AND salary NOT IN (2500, 3500, 7000);

SELECT employee_id, first_name, last_name, salary, commission_pct
FROM employees
WHERE commission_pct = 0.20;

SELECT last_name, job_id, salary, commission_pct, (1+commission_pct)*salary
FROM employees
WHERE commission_pct IS NOT NULL;

SELECT employee_id, last_name, job_id
FROM employees
WHERE job_id LIKE 'SA_%'