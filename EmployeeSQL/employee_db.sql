-- Data Engineering

create table Employees(
			 emp_no int not null,
			 emp_title_id varchar not null,
			 birth_date date not null,
			 first_name varchar not null,
			 last_name varchar not null,
			  sex varchar not null,
			  hire_date date not null,
				primary key (emp_no));
select * from Employees;

create table Departments(dept_no varchar not null,
						 dept_name varchar not null, 
						primary key (dept_no));
select * from Departments;

create table Department_Employees(emp_no int not null,
								 dept_no varchar not null,
								 foreign key (emp_no) references Employees(emp_no),
								foreign key (dept_no)references Departments(dept_no));
select * from Department_Employees;

create table Department_Manager (dept_no varchar not null,
								 emp_no int not null,
								foreign key (emp_no) references Employees(emp_no), 
								foreign key (dept_no) references Departments(dept_no));
select * from Department_Manager;

create table Salaries (emp_no int not null,
					  salary int not null,
					  foreign key (emp_no) references Employees(emp_no));
select * from Salaries;

create table Titles(title_id varchar not null,
				   title varchar not null);
select * from Titles;

-- Data Analysis
-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.
select Employees.emp_no, 
		Employees.first_name, 
		Employees.last_name, 
		Employees.sex, 
		Salaries.salary from Employees
inner join Salaries on Employees.emp_no = Salaries.emp_no

-- 2. List first name, last name, and hire date for employees who were hired in 1986.
select Employees.first_name,
	Employees.last_name,
	Employees.hire_date from Employees
	where hire_date >= '1985-12-31'
	and hire_date < '1987-01-01';
	
-- 3. List the manager of each department with the following information: department number, department name, 
-- the manager's employee number, last name, first name.
select Department_Manager.dept_no,
	Departments.dept_name,
	Department_Manager.emp_no,
	Employees.first_name,
	Employees.last_name from Department_Manager
inner join Departments on Department_Manager.dept_no = Departments.dept_no
inner join Employees on Department_Manager.emp_no = Employees.emp_no

-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.
select Employees.emp_no,
	Employees.first_name,
	Employees.last_name,
	Departments.dept_name from Employees
inner join Department_Manager on Employees.emp_no = Department_Manager.emp_no
inner join Departments on Department_Manager.dept_no = Departments.dept_no;

-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
select Employees.first_name,
	Employees.last_name,
	Employees.sex from Employees
	where first_name = 'Hercules' and last_name like 'B%';

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
select Employees.emp_no,
	Employees.first_name,
	Employees.last_name,
	Departments.dept_name from Employees
inner join Department_Employees on Employees.emp_no = Department_Employees.emp_no
inner join Departments on Department_Employees.dept_no = Departments.dept_no
where dept_name = 'Sales';

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
select Employees.emp_no,
	Employees.first_name,
	Employees.last_name,
	Departments.dept_name from Employees
inner join Department_Employees on Employees.emp_no = Department_Employees.emp_no
inner join Departments on Department_Employees.dept_no = Departments.dept_no
where dept_name = 'Sales' or dept_name = 'Development';
	
-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
select last_name, count(last_name) from Employees
group by last_name
order by count(last_name) desc













































