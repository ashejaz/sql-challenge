-- Creating titles table
CREATE TABLE titles (
  title_id VARCHAR(5) PRIMARY KEY NOT NULL,
  title VARCHAR(20) NOT NULL
);

-- Creating departments table
CREATE TABLE departments (
  dept_no VARCHAR(4) PRIMARY KEY NOT NULL,
  dept_name VARCHAR(30) NOT NULL
);

-- Creating employees table
CREATE TABLE employees (
	emp_no INTEGER PRIMARY KEY NOT NULL,
    emp_title_id VARCHAR(5) NOT NULL,
    birth_date DATE NOT NULL,
    first_name VARCHAR(20) NOT NULL,
    last_name VARCHAR(20) NOT NULL,
    sex VARCHAR(1) NOT NULL,
    hire_date DATE NOT NULL,
    FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);

-- Creating salaries table
CREATE TABLE salaries (
	emp_no INTEGER PRIMARY KEY NOT NULL,
    salary INTEGER NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

-- Creating dept_manager table
CREATE TABLE dept_manager (
	dept_no VARCHAR(4) NOT NULL,
    emp_no INTEGER PRIMARY KEY NOT NULL,
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

-- Creating dept_emp table
CREATE TABLE dept_emp (
	emp_no INTEGER NOT NULL,
	dept_no VARCHAR(4) NOT NULL,
	PRIMARY KEY (emp_no, dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

-- Checking table creation & import
SELECT * FROM titles;
SELECT * FROM departments;
SELECT * FROM employees LIMIT 10;
SELECT * FROM salaries LIMIT 10;
SELECT * FROM dept_manager LIMIT 10;
SELECT * FROM dept_emp LIMIT 10;
