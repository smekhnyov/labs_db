SELECT department_name
FROM departments
EXCEPT
SELECT department_name
FROM departments
WHERE department_id in (SELECT department_id 
						FROM employees 
						WHERE job_id = 'ST_CLERK');
						
SELECT country_id, country_name
FROM countries
EXCEPT
SELECT country_id, country_name
FROM countries
WHERE country_id in (SELECT country_id 
					 FROM locations 
					 WHERE location_id in (SELECT location_id 
										   FROM departments));
										   
SELECT last_name
FROM employees
WHERE department_id = 10
UNION
SELECT last_name
FROM employees
WHERE department_id = 20
UNION
SELECT last_name
FROM employees
WHERE department_id = 50;

SELECT employee_id, job_id
FROM employees
INTERSECT 
SELECT employee_id, job_id
FROM job_history;