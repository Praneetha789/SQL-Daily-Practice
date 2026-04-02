-- Day 20 SQL Practice (Constraints)

-- Create Employees table with constraints
CREATE TABLE Employees (
    emp_id INT PRIMARY KEY,            -- Primary Key
    name VARCHAR(50) NOT NULL,        -- Cannot be NULL
    dept_id INT,
    salary INT CHECK (salary > 0),    -- Salary must be positive
    email VARCHAR(100) UNIQUE         -- Unique email
);

-- Insert valid records
INSERT INTO Employees VALUES
(1, 'Rahul', 101, 50000, 'rahul@gmail.com'),
(2, 'Anita', 102, 45000, 'anita@gmail.com');

-- Try inserting duplicate PRIMARY KEY (will fail)
-- INSERT INTO Employees VALUES (1, 'Vikram', 103, 60000, 'vikram@gmail.com');

-- Try inserting NULL in NOT NULL column (will fail)
-- INSERT INTO Employees VALUES (3, NULL, 103, 60000, 'vikram@gmail.com');

-- Try inserting negative salary (will fail)
-- INSERT INTO Employees VALUES (4, 'Sneha', 101, -5000, 'sneha@gmail.com');

-- Try inserting duplicate email (will fail)
-- INSERT INTO Employees VALUES (5, 'Arjun', 102, 40000, 'rahul@gmail.com');

-- Create Departments table
CREATE TABLE Departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

-- Insert departments
INSERT INTO Departments VALUES
(101, 'IT'),
(102, 'HR'),
(103, 'Finance');

-- Add FOREIGN KEY constraint
ALTER TABLE Employees
ADD CONSTRAINT fk_dept
FOREIGN KEY (dept_id)
REFERENCES Departments(dept_id);

-- View data
SELECT * FROM Employees;
SELECT * FROM Departments;