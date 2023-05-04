SELECT location_id, street_address, city, state_province, country_id, country_name
FROM locations
NATURAL JOIN countries;

SELECT last_name, department_id, department_name
FROM employees
NATURAL JOIN departments;

SELECT last_name, job_id, department_id, department_name, city
FROM employees
NATURAL JOIN departments
NATURAL JOIN locations
WHERE city = 'Toronto';

SELECT e.employee_id, e.last_name, e.manager_id, d.last_name as "manager_last_name"
FROM employees e
INNER JOIN employees d
ON (e.manager_id = d.employee_id);


SELECT employee_id, last_name
FROM employees
WHERE manager_id IS null;

SELECT d.department_id, d.department_name, e.employee_id, e.last_name
FROM departments d
INNER JOIN employees e
ON (d.manager_id = e.employee_id);

SELECT d.department_id, d.department_name, e.last_name as "manager_last_name", l.employee_id, l.last_name
FROM departments d
INNER JOIN employees e
ON (d.manager_id = e.employee_id)
INNER JOIN employees l
ON (l.manager_id = e.employee_id);

SELECT e.employee_id, e.last_name, e.hire_date, d.hire_date as "Davies"
FROM employees e
INNER JOIN employees d
ON (e.hire_date - d.hire_date > 0) and (d.last_name = 'Davies');

SELECT e.employee_id, e.last_name, e.hire_date, e.manager_id, m.employee_id, m.last_name, m.hire_date
FROM employees e
INNER JOIN employees m
ON (e.hire_date - m.hire_date < 0) and (e.manager_id = m.employee_id);

---

---

SELECT e.employee_id, e.last_name, e.salary, e.manager_id, m.employee_id, m.last_name, m.salary
FROM employees e
INNER JOIN employees m
ON (e.salary > m.salary) and (e.manager_id = m.employee_id);
