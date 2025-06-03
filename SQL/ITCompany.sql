CREATE DATABASE ITCompany;
GO

USE ITCompany;
GO

CREATE TABLE Departments (
DepartmentID INT PRIMARY KEY IDENTITY,
Name NVARCHAR(100) NOT NULL
);

CREATE TABLE Positions (
PositionID INT PRIMARY KEY IDENTITY,
Name NVARCHAR(100) NOT NULL
);

CREATE TABLE Employees (
EmployeeID INT PRIMARY KEY IDENTITY,
FirstName NVARCHAR(100) NOT NULL,
LastName NVARCHAR(100) NOT NULL,
DepartmentID INT FOREIGN KEY REFERENCES Departments(DepartmentID),
PositionID INT FOREIGN KEY REFERENCES Positions(PositionID),
HireDate DATE,
IsActive BIT DEFAULT 1
);

CREATE TABLE Projects (
ProjectID INT PRIMARY KEY IDENTITY,
Name NVARCHAR(100) NOT NULL,
StartDate DATE,
EndDate DATE
);

CREATE TABLE EmployeeProject (
EmployeeID INT FOREIGN KEY REFERENCES Employees(EmployeeID),
ProjectID INT FOREIGN KEY REFERENCES Projects(ProjectID),
AssignedDate DATE,
PRIMARY KEY (EmployeeID, ProjectID)
);

CREATE TABLE Tasks (
TaskID INT PRIMARY KEY IDENTITY,
ProjectID INT FOREIGN KEY REFERENCES Projects(ProjectID),
Title NVARCHAR(100),
Description NVARCHAR(500),
Deadline DATE
);

CREATE TABLE Salaries (
SalaryID INT PRIMARY KEY IDENTITY,
EmployeeID INT FOREIGN KEY REFERENCES Employees(EmployeeID),
Amount DECIMAL(10,2),
EffectiveDate DATE
);

CREATE TABLE Evaluations (
EvaluationID INT PRIMARY KEY IDENTITY,
EmployeeID INT FOREIGN KEY REFERENCES Employees(EmployeeID),
Score INT CHECK (Score BETWEEN 1 AND 10),
Comment NVARCHAR(500),
EvaluationDate DATE
);

CREATE TABLE Attendance (
AttendanceID INT PRIMARY KEY IDENTITY,
EmployeeID INT FOREIGN KEY REFERENCES Employees(EmployeeID),
Date DATE,
Status NVARCHAR(20) CHECK (Status IN ('Present', 'Absent', 'Late'))
);

CREATE TABLE ReportsLog (
LogID INT PRIMARY KEY IDENTITY,
ReportName NVARCHAR(100),
GeneratedAt DATETIME DEFAULT GETDATE()
);

INSERT INTO Departments (Name) VALUES ('IT'), ('HR'), ('Marketing');
INSERT INTO Positions (Name) VALUES ('Developer'), ('Manager'), ('Designer');

INSERT INTO Employees (FirstName, LastName, DepartmentID, PositionID, HireDate)
VALUES ('Marko', 'Markoviæ', 1, 1, '2022-01-10'),
('Jelena', 'Jovanoviæ', 2, 2, '2021-05-20');

INSERT INTO Projects (Name, StartDate, EndDate)
VALUES ('Intranet Portal', '2023-01-01', '2023-06-30'),
('Website Redesign', '2023-03-01', '2023-08-15');

INSERT INTO EmployeeProject (EmployeeID, ProjectID, AssignedDate)
VALUES (1, 1, '2023-01-15'), (2, 2, '2023-03-10');

INSERT INTO Salaries (EmployeeID, Amount, EffectiveDate)
VALUES (1, 1200.00, '2023-01-01'), (2, 1400.00, '2023-01-01');