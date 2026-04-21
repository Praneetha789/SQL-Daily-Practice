-- Day 32 SQL Practice (Customer Analytics Case Study)

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
(6, 101, '2024-01-06', 800),
(7, 104, '2024-01-07', 200),
(8, 104, '2024-01-10', 300);

--------------------------------------------------
-- 1. Customer total spending
SELECT customer_id, SUM(amount) AS total_spent
FROM Orders
GROUP BY customer_id;

--------------------------------------------------
-- 2. Rank customers by total spending
SELECT customer_id, total_spent,
RANK() OVER (ORDER BY total_spent DESC) AS rank_num
FROM (
    SELECT customer_id, SUM(amount) AS total_spent
    FROM Orders
    GROUP BY customer_id
) t;

--------------------------------------------------
-- 3. First order date per customer
SELECT customer_id, MIN(order_date) AS first_order
FROM Orders
GROUP BY customer_id;

--------------------------------------------------
-- 4. Last order date per customer
SELECT customer_id, MAX(order_date) AS last_order
FROM Orders
GROUP BY customer_id;

--------------------------------------------------
-- 5. Find repeat customers (more than 1 order)
SELECT customer_id, COUNT(*) AS order_count
FROM Orders
GROUP BY customer_id
HAVING COUNT(*) > 1;

--------------------------------------------------
-- 6. Days between orders (using LAG)
SELECT customer_id, order_date,
DATEDIFF(order_date,
    LAG(order_date) OVER (PARTITION BY customer_id ORDER BY order_date)
) AS days_between_orders
FROM Orders;

--------------------------------------------------
-- 7. Running total spending per customer
SELECT customer_id, order_date, amount,
SUM(amount) OVER (
    PARTITION BY customer_id
    ORDER BY order_date
) AS running_total
FROM Orders;

--------------------------------------------------
-- 8. Top 2 customers by spending
SELECT *
FROM (
    SELECT customer_id, SUM(amount) AS total_spent,
    DENSE_RANK() OVER (ORDER BY SUM(amount) DESC) AS rnk
    FROM Orders
    GROUP BY customer_id
) t
WHERE rnk <= 2;