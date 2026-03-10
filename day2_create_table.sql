CREATE TABLE Employees (
    id INT,
    name VARCHAR(50),
    department VARCHAR(50),
    salary INT
);

INSERT INTO Employees VALUES (1, 'Rahul', 'IT', 50000);
INSERT INTO Employees VALUES (2, 'Anita', 'HR', 45000);
INSERT INTO Employees VALUES (3, 'Vikram', 'Finance', 60000);
INSERT INTO Employees VALUES (4, 'Sneha', 'IT', 55000);

SELECT * FROM Employees;
SELECT name, salary FROM Employees;