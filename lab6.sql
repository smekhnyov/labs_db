SELECT last_name, hire_date, department_id
FROM employees
WHERE last_name != 'Zlotkey' 
AND department_id = (SELECT department_id
					 FROM employees
					 WHERE last_name = 'Zlotkey');


SELECT last_name, salary
FROM employees
WHERE salary > (SELECT avg(salary)
			   FROM employees)
ORDER BY salary;


SELECT last_name, department_id, (SELECT department_name 
								  FROM departments
								  WHERE department_id = employees.department_id)
FROM employees;	


SELECT last_name
FROM employees
WHERE manager_id in (select employee_id
				   FROM employees
				   WHERE last_name = 'King');
				   
SELECT last_name
FROM employees
WHERE department_id = (SELECT department_id
					  FROM departments
					  WHERE department_name = 'Executive');
					  
SELECT last_name
FROM employees
WHERE salary > (SELECT avg(salary) FROM employees)
AND department_id in (SELECT department_id
					FROM departments
					WHERE department_name like '%u%');
					
SELECT department_id, min(salary)
FROM employees
WHERE salary > (SELECT avg(salary) FROM employees)
GROUP BY department_id;

SELECT department_name 
FROM departments
WHERE department_id in (SELECT DISTINCT department_id 
						FROM employees 
						WHERE job_id = 'SA_REP');
						
SELECT department_name 
FROM departments
WHERE department_id in (SELECT DISTINCT department_id 
						FROM employees 
						WHERE job_id = 'SA_REP')
AND department_id IS NOT NULL;