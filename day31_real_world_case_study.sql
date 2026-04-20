-- Day 31 SQL Practice (Real-World Case Study)

-- Create Orders table
CREATE TABLE Orders (
    order_id INT,
    customer_id INT,
    order_date DATE,
    amount INT
);

-- Insert data
INSERT INTO Orders VALUES
(1, 101, '2024-01-01', 500),
(2, 102, '2024-01-02', 700),
(3, 101, '2024-01-03', 300),
(4, 103, '2024-01-04', 900),
(5, 102, '2024-01-05', 400),
(6, 101, '2024-01-06', 800);

--------------------------------------------------
-- 1. Total spending per customer
SELECT customer_id, SUM(amount) AS total_spent
FROM Orders
GROUP BY customer_id;

--------------------------------------------------
-- 2. Top spending customer
SELECT customer_id, SUM