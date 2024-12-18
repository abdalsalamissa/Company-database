create database COMPANY
use COMPANY;

create table Departments(
department_id int primary key,
department_name varchar(20)
)
create table Employees(
employee_id int primary key,
first_name varchar(20),
last_name varchar(20),
department_id int,
hire_date date,
foreign key (department_id) references Departments(department_id)
)
create table Salaries(
salary_id int primary key,
employee_id int,
salary int,
start__date date,
end_date date,
foreign key (employee_id) references Employees (employee_id)
)
insert into Departments values (1, 'Human Resources');
insert into Departments values (2, 'IT');
insert into Departments values (3, 'Finance');
insert into Departments values (4, 'Marketing');
insert into Departments values (5, 'Sales');
insert into Departments values (6, 'Operations');
insert into Departments values (7, 'Customer Support');
INSERT INTO Employees VALUES (1, 'John', 'Doe', 1, '2020-01-15');
INSERT INTO Employees VALUES (2, 'Jane', 'Smith', 2, '2019-03-10');
INSERT INTO Employees VALUES (3, 'Emily', 'Johnson', 3, '2021-06-01');
INSERT INTO Employees VALUES (4, 'Michael', 'Brown', 4, '2020-07-20');
INSERT INTO Employees VALUES (5, 'Chris', 'Davis', 5, '2018-11-05');
INSERT INTO Employees VALUES (6, 'Sarah', 'Wilson', 6, '2022-01-12');
INSERT INTO Employees VALUES (7, 'David', 'Clark', 7, '2017-08-08');
INSERT INTO Employees VALUES (8, 'Emma', 'Taylor', 1, '2021-10-25');
INSERT INTO Employees VALUES (9, 'Oliver', 'Anderson', 2, '2020-09-15');
INSERT INTO Employees VALUES (10, 'Sophia', 'Thomas', 3, '2019-12-30');
INSERT INTO Employees VALUES (11, 'Liam', 'Jackson', 4, '2016-05-18');
INSERT INTO Employees VALUES (12, 'Mia', 'White', 5, '2020-02-02');
INSERT INTO Employees VALUES (13, 'Noah', 'Martin', 6, '2022-03-14');
INSERT INTO Employees VALUES (14, 'Ava', 'Garcia', 7, '2021-11-19');
INSERT INTO Employees VALUES (15, 'Ethan', 'Martinez', 1, '2020-08-07');
INSERT INTO Employees VALUES (16, 'Isabella', 'Rodriguez', 2, '2019-09-12');
INSERT INTO Employees VALUES (17, 'Lucas', 'Lee', 3, '2018-07-03');
INSERT INTO Employees VALUES (18, 'Charlotte', 'Walker', 4, '2019-01-28');
INSERT INTO Employees VALUES (19, 'James', 'Hall', 5, '2021-04-06');
INSERT INTO Employees VALUES (20, 'Amelia', 'Allen', 6, '2022-05-15');
INSERT INTO Salaries Values (1, 1, 5000.00, '2023-01-01', '2023-12-31'),
    (2, 2, 7000.00, '2023-01-01', '2023-12-31'),
    (3, 3, 6000.00, '2023-01-01', '2023-12-31'),
    (4, 4, 5500.00, '2023-01-01', '2023-12-31'),
    (5, 5, 6500.00, '2023-01-01', '2023-12-31'),
    (6, 6, 5800.00, '2023-01-01', '2023-12-31'),
    (7, 7, 6200.00, '2023-01-01', '2023-12-31'),
    (8, 8, 4800.00, '2023-01-01', '2023-12-31'),
    (9, 9, 7500.00, '2023-01-01', '2023-12-31'),
    (10, 10, 6800.00, '2023-01-01', '2023-12-31'),
    (11, 11, 7200.00, '2022-01-01', '2022-12-31'),
    (12, 12, 5400.00, '2023-01-01', '2023-12-31'),
    (13, 13, 5900.00, '2023-01-01', '2023-12-31'),
    (14, 14, 6300.00, '2023-01-01', '2023-12-31'),
    (15, 15, 5200.00, '2023-01-01', '2023-12-31'),
    (16, 16, 7100.00, '2023-01-01', '2023-12-31'),
    (17, 17, 6700.00, '2023-01-01', '2023-12-31'),
    (18, 18, 6100.00, '2023-01-01', '2023-12-31'),
    (19, 19, 5600.00, '2023-01-01', '2023-12-31'),
    (20, 20, 6000.00, '2023-01-01', '2023-12-31');


SELECT e.first_name,e.last_name,d.department_name,e.hire_date
FROM Employees e
JOIN Departments d ON e.department_id = d.department_id;

select d.department_name,e.first_name,e.last_name,e.hire_date 
from Departments d 
left join Employees e on d.department_id = e.department_id;

SELECT d.department_name, COUNT(e.employee_id) AS EmployeeCount
FROM Departments d
JOIN Employees e ON d.department_id = e.department_id
GROUP BY d.department_name
HAVING COUNT(e.employee_id) > 1;

SELECT d.department_name, AVG(s.salary) AS AverageSalary
FROM Departments d
JOIN Employees e ON d.department_id = e.department_id
JOIN Salaries s ON e.employee_id = s.employee_id
GROUP BY d.department_name
HAVING AVG(s.salary) > 1000;

SELECT d.department_name, COUNT(e.employee_id) AS HighSalaryCount
FROM Departments d
JOIN Employees e ON d.department_id = e.department_id
JOIN Salaries s ON e.employee_id = s.employee_id
WHERE s.salary > 5000
GROUP BY d.department_name
HAVING COUNT(e.employee_id) > 1;

SELECT MAX(salary) AS HighestSalary
FROM Salaries;


