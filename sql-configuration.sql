-- Create the database
CREATE DATABASE db_isuga_capstone;

-- Use the created database
USE db_isuga_capstone;

-- Create users table
CREATE TABLE tbl_users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    firstname VARCHAR(100) NOT NULL,
    lastname VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
     password VARCHAR(255) NOT NULL,
     role_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Employees (
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    dob DATE NOT NULL,  -- Date of Birth
    gender VARCHAR(10),
    email VARCHAR(100),
    phone_number VARCHAR(20),
    hire_date DATE NOT NULL,  -- Hire Date
    position_id INT,
    department_id INT,
    salary DECIMAL(10, 2),
    status ENUM('active', 'inactive', 'terminated') DEFAULT 'active',
    FOREIGN KEY (position_id) REFERENCES Positions(position_id),
    FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);

CREATE TABLE Departments (
    department_id INT PRIMARY KEY AUTO_INCREMENT,
    department_name VARCHAR(100) NOT NULL,
    manager_id INT,  -- Manager of the department
    FOREIGN KEY (manager_id) REFERENCES Employees(employee_id)
);

CREATE TABLE Positions (
    position_id INT PRIMARY KEY AUTO_INCREMENT,
    position_name VARCHAR(100) NOT NULL,
    description TEXT
);

CREATE TABLE Payroll (
    payroll_id INT PRIMARY KEY AUTO_INCREMENT,
    employee_id INT,
    salary DECIMAL(10, 2) NOT NULL,
    bonus DECIMAL(10, 2) DEFAULT 0,
    deductions DECIMAL(10, 2) DEFAULT 0,
    payment_date DATE,
    FOREIGN KEY (employee_id) REFERENCES Employees(employee_id)
);

CREATE TABLE Payroll (
    payroll_id INT PRIMARY KEY AUTO_INCREMENT,
    employee_id INT,
    salary DECIMAL(10, 2) NOT NULL,
    bonus DECIMAL(10, 2) DEFAULT 0,
    deductions DECIMAL(10, 2) DEFAULT 0,
    payment_date DATE,
    FOREIGN KEY (employee_id) REFERENCES Employees(employee_id)
);

CREATE TABLE Attendance (
    attendance_id INT PRIMARY KEY AUTO_INCREMENT,
    employee_id INT,
    attendance_date DATE,
    status ENUM('present', 'absent', 'leave', 'holiday'),
    FOREIGN KEY (employee_id) REFERENCES Employees(employee_id)
);
CREATE TABLE Leaves (
    leave_id INT PRIMARY KEY AUTO_INCREMENT,
    employee_id INT,
    leave_type VARCHAR(50),  -- e.g., sick leave, vacation leave
    start_date DATE,
    end_date DATE,
    status ENUM('pending', 'approved', 'rejected'),
    FOREIGN KEY (employee_id) REFERENCES Employees(employee_id)
);
CREATE TABLE Trainings (
    training_id INT PRIMARY KEY AUTO_INCREMENT,
    employee_id INT,
    training_name VARCHAR(100),
    training_date DATE,
    completion_status ENUM('completed', 'pending'),
    FOREIGN KEY (employee_id) REFERENCES Employees(employee_id)
);
CREATE TABLE Employee_Documents (
    document_id INT PRIMARY KEY AUTO_INCREMENT,
    employee_id INT,
    document_name VARCHAR(100),
    document_type VARCHAR(50),  -- e.g., contract, certificate
    document_path VARCHAR(255),
    upload_date DATE,
    FOREIGN KEY (employee_id) REFERENCES Employees(employee_id)
);
