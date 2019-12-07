--When we imported our csvs, the dates which didn't have values imported as 9999-01-01.
--We must change these to be null values.
UPDATE employees SET birth_date = NULL WHERE birth_date = '9999-01-01';
UPDATE employees SET hire_date = NULL WHERE hire_date = '9999-01-01';
UPDATE dept_emp SET from_date = NULL WHERE from_date = '9999-01-01';
UPDATE dept_emp SET to_date = NULL WHERE to_date = '9999-01-01';
UPDATE dept_manager SET from_date = NULL WHERE from_date = '9999-01-01';
UPDATE dept_manager SET to_date = NULL WHERE to_date = '9999-01-01';
UPDATE salaries SET from_date = NULL WHERE from_date = '9999-01-01';
UPDATE salaries SET to_date = NULL WHERE to_date = '9999-01-01';
UPDATE titles SET from_date = NULL WHERE from_date = '9999-01-01';
UPDATE titles SET to_date = NULL WHERE to_date = '9999-01-01';

--1.
SELECT employees.emp_no, employees.first_name, employees.last_name, employees.gender, salaries.salary
FROM employees
INNER JOIN salaries ON salaries.emp_no = employees.emp_no
ORDER BY employees.emp_no;

--2.
SELECT * FROM employees WHERE EXTRACT(YEAR from hire_date) = '1986'

--3.
SELECT departments.dept_no, departments.dept_name, dept_manager.emp_no, employees.first_name, employees.last_name, dept_manager.from_date, dept_manager.to_date
FROM departments
INNER JOIN dept_manager ON dept_manager.dept_no = departments.dept_no
INNER JOIN employees ON employees.emp_no = dept_manager.emp_no;

--4.
SELECT dept_emp.emp_no, employees.first_name, employees.last_name, departments.dept_name
FROM dept_emp
INNER JOIN employees ON employees.emp_no = dept_emp.emp_no
INNER JOIN departments ON departments.dept_no = dept_emp.dept_no
ORDER BY dept_emp.emp_no;

--5.
SELECT * FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

--6.
SELECT dept_emp.emp_no, employees.first_name, employees.last_name, departments.dept_name
FROM dept_emp
INNER JOIN employees ON employees.emp_no = dept_emp.emp_no
INNER JOIN departments ON departments.dept_no = dept_emp.dept_no
WHERE departments.dept_name = 'Sales'
ORDER BY dept_emp.emp_no;

--7.
SELECT dept_emp.emp_no, employees.first_name, employees.last_name, departments.dept_name
FROM dept_emp
INNER JOIN employees ON employees.emp_no = dept_emp.emp_no
INNER JOIN departments ON departments.dept_no = dept_emp.dept_no
WHERE departments.dept_name = 'Sales'
OR departments.dept_name = 'Development'
ORDER BY dept_emp.emp_no;

--8.
SELECT last_name, COUNT(last_name) FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;