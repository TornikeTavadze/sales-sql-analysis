CREATE TABLE sales (
  sale_id INT PRIMARY KEY,
  customer_name VARCHAR(50),
  product VARCHAR(50),
  quantity INT,
  price_per_unit DECIMAL(5,2),
  sale_date DATE
);

INSERT INTO sales (sale_id, customer_name, product, quantity, price_per_unit, sale_date) VALUES
(1, 'Alice', 'Apples', 10, 1.50, '2024-05-01'),
(2, 'Bob', 'Oranges', 5, 2.00, '2024-05-02'),
(3, 'Alice', 'Bananas', 7, 1.00, '2024-05-03'),
(4, 'Carol', 'Apples', 3, 1.50, '2024-05-04'),
(5, 'Bob', 'Apples', 8, 1.50, '2024-05-05'),
(6, 'Carol', 'Oranges', 10, 2.00, '2024-05-06'),
(7, 'Alice', 'Oranges', 2, 2.00, '2024-05-06'),
(8, 'Dave', 'Bananas', 12, 1.00, '2024-05-07');

SELECT * FROM sales;
#What is the total revenue for each product
SELECT
product,
SUM(quantity * price_per_unit) AS total_revenue
FROM sales
GROUP BY product;

#How many orders did each customer make?
SELECT
customer_name,
COUNT(*) AS orders_per_customer
FROM sales
GROUP BY customer_name;

#Which customer spent the most money in total?
SELECT
customer_name,
SUM(quantity * price_per_unit) AS total_spent
FROM sales
GROUP BY customer_name
ORDER BY total_spent DESC
LIMIT 1;

# What is the average order value across all sales?
SELECT
SUM(quantity * price_per_unit) / COUNT(*) AS average_order_value
FROM sales;

#On which date was the highest revenue generated?
SELECT
sale_date,
SUM(quantity * price_per_unit) AS revenue
FROM sales
GROUP BY sale_date
ORDER BY revenue DESC
LIMIT 1;

#What's the most sold product by total quantity?
SELECT
product,
SUM(quantity)
FROM sales
GROUP BY product
ORDER BY SUM(quantity) DESC
LIMIT 1;