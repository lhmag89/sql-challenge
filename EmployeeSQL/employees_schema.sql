CREATE TABLE departments (
	dept_no CHAR(4) NOT NULL,
	dept_name VARCHAR(50)NOT NULL,
	PRIMARY KEY (dept_no)
);

CREATE TABLE titles (
	title_id CHAR(5) NOT NULL,
	title VARCHAR(50)NOT NULL,
	PRIMARY KEY (title_id)
);
CREATE TABLE employees (
    emp_no int NOT NULL,
	emp_title_id CHAR(5)NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	sex CHAR(1) NOT NULL,
	hire_date DATE NOT NULL,
    PRIMARY KEY (emp_no),
    FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);
CREATE TABLE salaries (
    emp_no int NOT NULL,
    salary int NOT NULL,
    PRIMARY KEY (emp_no),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);
CREATE TABLE dept_emp (
    emp_no int NOT NULL,
    dept_no CHAR(4) NOT NULL,
    PRIMARY KEY (emp_no, dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);
CREATE TABLE dept_manager (
    dept_no CHAR(4) NOT NULL,
	emp_no int NOT NULL,
	PRIMARY KEY(emp_no,dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);
