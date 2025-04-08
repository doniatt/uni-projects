CREATE DATABASE CompanyDB;
USE CompanyDB;

-- Table for Company
CREATE TABLE Company (
    company_name VARCHAR(255) PRIMARY KEY
);

-- Table for Department
CREATE TABLE Department (
    department_name VARCHAR(255) PRIMARY KEY,
    company_name VARCHAR(255),
    FOREIGN KEY (company_name) REFERENCES Company(company_name)
);

-- Table for Supervisor
CREATE TABLE Supervisor (
    supervisor_number INT PRIMARY KEY,
    supervisor_name VARCHAR(255)
);

-- Table for Employee
CREATE TABLE Employee (
    employee_number INT PRIMARY KEY,
    employee_name VARCHAR(255),
    department_name VARCHAR(255),
    FOREIGN KEY (department_name) REFERENCES Department(department_name)
);

-- Table for Projects
CREATE TABLE Projects (
    project_number INT PRIMARY KEY,
    project_name VARCHAR(255)
);

-- Table to represent the "run by" relationship (Department - Employee)
CREATE TABLE Runs (
    department_name VARCHAR(255),
    employee_number INT,
    PRIMARY KEY (department_name, employee_number),
    FOREIGN KEY (department_name) REFERENCES Department(department_name),
    FOREIGN KEY (employee_number) REFERENCES Employee(employee_number)
);

-- Table to represent the "has" relationship (Department - Supervisor)
CREATE TABLE Has (
    department_name VARCHAR(255),
    supervisor_number INT,
    PRIMARY KEY (department_name, supervisor_number),
    FOREIGN KEY (department_name) REFERENCES Department(department_name),
    FOREIGN KEY (supervisor_number) REFERENCES Supervisor(supervisor_number)
);

-- Table to represent the "works on" relationship (Employee - Projects)
CREATE TABLE Works_On (
    employee_number INT,
    project_number INT,
    PRIMARY KEY (employee_number, project_number),
    FOREIGN KEY (employee_number) REFERENCES Employee(employee_number),
    FOREIGN KEY (project_number) REFERENCES Projects(project_number)
);