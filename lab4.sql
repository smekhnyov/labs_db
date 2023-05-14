SELECT round(min(salary)) AS Minimum, 
round(max(salary)) AS Maximum, 
round(avg(salary)) AS Average, 
round(sum(salary)) AS Sum
FROM employees;

SELECT job_id,
round(min(salary)) AS Minimum, 
round(max(salary)) AS Maximum, 
round(avg(salary)) AS Average, 
round(sum(salary)) AS Sum
FROM employees
GROUP BY job_id;

SELECT job_id, count(employee_id)
FROM employees
GROUP BY job_id;

SELECT DISTINCT count(manager_id) AS "Number Of Manager"
FROM employees;

SELECT max(salary)-min(salary) AS DIFFERENCE
FROM employees;

SELECT manager_id, min(salary)
FROM employees
GROUP BY manager_id;

SELECT manager_id, min(salary)
FROM employees
GROUP BY manager_id 
HAVING min(salary) >= 6000 AND manager_id IS NOT null
ORDER BY min(salary) DESC;

SELECT manager_id, avg(salary)
FROM employees
GROUP BY manager_id;