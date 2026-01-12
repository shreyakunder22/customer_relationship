CREATE DATABASE CustomerRelationship;

-- Create table 

CREATE TABLE invoices (
    invoiceID VARCHAR(10),
    invoice_date DATE,
    customerID INT,
    country VARCHAR(50),
    quantity INT,
    amount DECIMAL(10, 2)
);

-- Data cleaning
-- 1. Find NULL Values
SELECT *
FROM invoices
WHERE invoiceID IS NULL
   OR invoice_date IS NULL
   OR customerID IS NULL
   OR country IS NULL
   OR quantity IS NULL
   OR amount IS NULL;

-- 2. Delete All Rows with Any NULL or Empty Value
DELETE FROM invoices
WHERE invoiceID IS NULL OR invoiceID = ''
   OR invoice_date IS NULL
   OR customerID IS NULL
   OR country IS NULL OR country = ''
   OR quantity IS NULL
   OR amount IS NULL;

-- Data exploring 

SELECT * FROM invoices;

SELECT COUNT(*) AS total_invoices FROM invoices;

-- Data analysis
-- Q.1 Write a SQL query to find the total revenue

SELECT SUM(amount) AS total_revenue
FROM invoices
WHERE amount > 0;

-- Q.2 Write a SQL query to find top 5 countries by revenue

SELECT country, SUM(amount) AS revenue
FROM invoices
WHERE amount > 0
GROUP BY country
ORDER BY revenue DESC
LIMIT 5;

-- Q.3 Write a SQL query to find top 5 customers by total purchase amount 

SELECT customerID, SUM(amount) AS total_spent
FROM invoices
WHERE amount > 0 AND customerID IS NOT NULL
GROUP BY customerID
ORDER BY total_spent DESC
LIMIT 5;

-- Q.4 Write a SQL query to find returned Items (Negative Quantities or Amounts)

SELECT *
FROM invoices
WHERE quantity < 0 OR amount < 0;

-- Q.5 Write a SQL query to find Monthly Sales Summary

SELECT 
    TO_CHAR(invoice_date, '2021-06') AS month,
    SUM(quantity) AS total_quantity,
    SUM(amount) AS total_sales
FROM invoices
WHERE amount > 0
GROUP BY TO_CHAR(invoice_date, '2021-06')
ORDER BY month;

-- Q.6 Write a SQL query to find Invoices with Missing Customer ID

SELECT *
FROM invoices
WHERE customerID IS NULL;

-- Q.7 Write a SQL query to find average Order Value by Country
SELECT country, AVG(amount) AS avg_order_value
FROM invoices
WHERE amount > 0
GROUP BY country;

-- Q.8 Write a SQL query to find Number of Invoices per Country
SELECT country, COUNT(*) AS invoice_count
FROM invoices
GROUP BY country
ORDER BY invoice_count DESC;

-- end of project 