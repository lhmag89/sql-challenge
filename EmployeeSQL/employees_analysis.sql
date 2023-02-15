-- 1. List of employee number, last name, first name, sex and salary

SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees
JOIN salaries ON employees.emp_no=salaries.emp_no
;

-- 2. List of first name, last name and hire date for employees hired in 1986

SELECT employees.first_name, employees.last_name, employees.hire_date 
	FROM employees 
	WHERE employees.hire_date >= '1986-01-01' 
		and employees.hire_date < '1987-01-01'
;

-- 3. List of managers with their dept number, dept name, employee number, last name and first name

SELECT departments.dept_no, departments.dept_name, employees.emp_no, employees.last_name, employees.first_name
FROM employees
INNER JOIN dept_manager
  ON employees.emp_no = dept_manager.emp_no
INNER JOIN departments
  ON dept_manager.dept_no = departments.dept_no
;

-- 4. List of employees with dept number, employee number, last name, first name and department name

SELECT departments.dept_no, employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
JOIN dept_emp
  ON employees.emp_no = dept_emp.emp_no
JOIN departments
  ON dept_emp.dept_no = departments.dept_no
;
  

-- 5. List of employees with first name Hercules and last name starts with B. 
--    Include first name, last name and sex

SELECT employees.first_name, employees.last_name, employees.sex
FROM employees
WHERE employees.first_name = 'Hercules' and employees.last_name LIKE 'B%'
;

-- 6. List of employees in Sales department with employee number, last name and first name

SELECT employees.emp_no, employees.last_name, employees.first_name
FROM employees
	JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
	JOIN departments ON dept_emp.dept_no = departments.dept_no
	WHERE departments.dept_name = 'Sales'
;

-- 7. List of employees in Sales and Development departments
--    with employee number, last name, first name and department name.

SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
	JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
	JOIN departments ON dept_emp.dept_no = departments.dept_no
	WHERE departments.dept_name = 'Sales' OR departments.dept_name = 'Development'
;

-- 8. List the frequency counts, in descending order, of all the employee last names

SELECT employees.last_name, COUNT(employees.last_name)AS frequency
FROM employees
GROUP BY employees.last_name
ORDER BY frequency DESC
;