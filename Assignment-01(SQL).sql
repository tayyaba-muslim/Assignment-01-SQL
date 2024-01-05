--Create a new database named "CompanyDB."
create database Company;

use Company;
--Design and create two tables Employees and Departments.

--Employees table should have fields: EmployeeID (int, primary key), FirstName (varchar), LastName (varchar), DepartmentID (int, foreign key to Departments table), and Salary (decimal).
CREATE TABLE Employees (
    EmployeeID INT not null unique identity,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DepartmentID INT,
    Salary DECIMAL(10, 2)
	foreign key (DepartmentID) references Departments(DepartmentID)
	);

INSERT INTO Employees (FirstName, LastName, DepartmentID, Salary)
VALUES
    ('Tayyaba', 'Muslim', 1, 78000.00),
    ('Sawera', 'Ansari', 2, 98000.00),
    ('Ayra', 'khan', 4, 45000.00),
    ('Shahzain', 'Ali', 3, 60000.00),
    ('Muhammad', 'Ahmed', 2, 40000.00),
    ('Ahmed', 'Raza', 5, 65000.00),
    ('Mishal', 'Khan', 3, 85000.00),
    ('Sunny', 'Ansari', 5, 43000.00),
    ('Ruhi', 'Imran', 1, 57000.00),
    ('Shibra', 'Ikram', 4, 77000.00);

	select * from Employees;
--Departments table should have fields: DepartmentID (int, primary key), DepartmentName (varchar).
CREATE TABLE Departments (
    DepartmentID INT not null unique identity,
    DepartmentName VARCHAR(50)
);


INSERT INTO Departments (DepartmentName)
VALUES
    ( 'HR'),
    ( 'Marketing Department'),
	( 'Administration'),    
	( 'Finance'),
    ( 'Sales');

	--Add a new column called "HireDate" (datetime) to the Employees table.
	alter table Employees add HireDate datetime;

	--Update the salary of employees in the IT department (assuming IT has DepartmentID 1) to increase it by 10%.
    update Employees set Salary = Salary * 1.1 where DepartmentID = 2;

	--Delete the records of employees whose salaries are less than 30000.
    delete from Employees where Salary < 30000;

	--Select Data using INNER JOIN: Write a SQL query to retrieve the FirstName, LastName, DepartmentName, and Salary of employees by joining the Employees and Departments tables.
   select Emp.FirstName, Emp.LastName, Dept.DepartmentName, Emp.Salary from Employees Emp INNER JOIN Departments Dept on Emp.DepartmentID = Dept.DepartmentID;

   --Select Data using LEFT JOIN: Write a SQL query to retrieve all departments and the number of employees in each department, even if there are no employees in that department.
  select Dept.DepartmentID, Dept.DepartmentName, COUNT(Emp.EmployeeID) as NumberOfEmployees from Departments Dept LEFT JOIN Employees Emp on Dept.DepartmentID = Emp.DepartmentID GROUP BY Dept.DepartmentID, Dept.DepartmentName;

 --Select Data using WHERE and JOIN: Write a query to select the FirstName, LastName, and HireDate of employees who were hired after '2023-01-01'.
  update Employees set HireDate= '2023-07-05' where EmployeeID =9;

  select Employees.Firstname,Employees.Lastname,Employees.Hiredate from Employees where Hiredate > '2023-01-01';


