CREATE TABLE Login (
	Email varchar(30) PRIMARY KEY,
	Password varchar(20) NOT NULL,
	Role int NOT NULL
)
GO

CREATE TABLE Departments(
	DepartmentID int PRIMARY KEY,
	Name nvarchar(255) NOT NULL,
	Location nvarchar(255) NOT NULL
	)
GO
  
CREATE TABLE Employees(
	Number int IDENTITY(1,1) PRIMARY KEY,
	Name nvarchar(255) NOT NULL,
	Salary money NOT NULL ,
	Commission money NOT NULL DEFAULT 0,
	DateOfJoining date NOT NULL,
	DateOfBirth date NOT NULL,
	DepartmentNo int NOT NULL, --FOREIGN KEY(DepartmentNo) REFERENCES Department(ID), -- 1 way of defining FK
	JobTitle nvarchar(255) NOT NULL,
	ReportingTo int NULL,
	 --CONSTRAINT PK__Employee PRIMARY KEY(Number),
	 CONSTRAINT FK_Employee_Dept FOREIGN KEY(DepartmentNo) REFERENCES Departments(DepartmentID),
	 CHECK (Salary>(0))
	 )

--Insert data in Department table
INSERT Departments (DepartmentID, Name, Location) VALUES (10, 'Sales', 'Pune'),
(20, 'Engineering', 'Nagpur'),
(30, 'Accounts', 'Pune'),
(40, 'Customer Care', 'Mumbai')

SET IDENTITY_INSERT Employees ON 

INSERT Employees (Number, Name, Salary, Commission, DateOfJoining, DateOfBirth, DepartmentNo, JobTitle, ReportingTo) 
	VALUES (2, 'Param', 3000, 20, '2017-12-12', '1995-01-01', 10, 'Salesman', NULL),
			(3, 'Pratham', 3000, 10, '2017-12-23', '1995-01-17', 10, 'Analyst', 5),
			(4, 'Akash', 2500, 5, '2017-12-12', '1995-01-03', 10, 'Salesman', 5),
			(5, 'Meena', 2000, 4, '2017-02-12', '1995-01-06', 10, 'Manager', 14),
			(6, 'Shweta', 2700, 3, '2017-12-04', '1995-06-01', 20, 'Tester', NULL),
			(7, 'Tamanna', 3500, 7, '2017-12-06', '1995-03-01', 20, 'Developer', NULL),
			(8, 'Rajesh', 2900, 10, '2017-12-03', '1995-01-07', 20, 'Developer', NULL),
			(9, 'Geeta', 2000, 30, '2017-12-05', '1995-01-02', 30, 'Accountant', NULL),
			(10, 'Sita', 1500, 20, '2017-07-12', '1995-09-01', 30, 'Cashier', NULL),
			(11, 'Ram', 4000, 50, '2017-09-12', '1995-02-01', 30, 'Head', NULL),
			(12, 'Amar', 2000, 30, '2017-12-05', '1995-01-02', 30, 'Accountant', NULL),
			(13, 'Akshay', 1500, 20, '2017-07-12', '1995-09-01', 30, 'Cashier', NULL),
			(14, 'Nandita', 4000, 50, '2017-09-12', '1995-02-01', 30, 'President', NULL),
			(15, 'Sonal', 2000, 5, '2016-04-23', '1996-03-12', 10, 'Salesman', 5)

SET IDENTITY_INSERT Employees OFF
