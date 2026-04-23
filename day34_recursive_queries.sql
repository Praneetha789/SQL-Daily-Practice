-- Day 33 SQL Practice (Pivot + Data Transformation)

-- Create Sales table
CREATE TABLE Sales (
    sale_id INT,
    product VARCHAR(50),
    month VARCHAR(10),
    amount INT
);

-- Insert data
INSERT INTO Sales VALUES
(1, 'Laptop', 'Jan', 50000),
(2, 'Laptop', 'Feb', 60000),
(3, 'Laptop', 'Mar', 55000),
(4, 'Phone', 'Jan', 30000),
(5, 'Phone', 'Feb', 35000),
(6, 'Phone', 'Mar', 40000);

--------------------------------------------------
-- 1. Basic aggregation
SELECT product, SUM(amount) AS total_sales
FROM Sales
GROUP BY product;

--------------------------------------------------
-- 2. Pivot data (convert rows to columns)
SELECT 
    product,
    SUM(CASE WHEN month = 'Jan' THEN amount ELSE 0 END) AS Jan,
    SUM(CASE WHEN month = 'Feb' THEN amount ELSE 0 END) AS Feb,
    SUM(CASE WHEN month = 'Mar' THEN amount ELSE 0 END) AS Mar
FROM Sales
GROUP BY product;

--------------------------------------------------
-- 3. Monthly growth (using LAG)
SELECT product, month, amount,
amount - LAG(amount) OVER (PARTITION BY product ORDER BY month) AS growth
FROM Sales;

--------------------------------------------------
-- 4. Percentage growth
SELECT product, month, amount,
ROUND(
    100 * (amount - LAG(amount) OVER (PARTITION BY product ORDER BY month)) 
    / LAG(amount) OVER (PARTITION BY product ORDER BY month),
2) AS percent_growth
FROM Sales;

--------------------------------------------------
-- 5. Rank months by sales per product
SELECT product, month, amount,
RANK() OVER (PARTITION BY product ORDER BY amount DESC) AS rank_num
FROM Sales;

--------------------------------------------------
-- 6. Running total per product
SELECT product, month, amount,
SUM(amount) OVER (PARTITION BY product ORDER BY month) AS running_total
FROM Sales;