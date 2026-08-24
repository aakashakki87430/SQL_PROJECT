

show tables ;

select * from books;
select * from customers;
select * from orders;


# Basic Queries

-- Retrieve all books in the "Fiction" genre

SELECT 
    *
FROM
    books
WHERE
    Genre = 'Fiction';

-- Find books published after the year 1950

SELECT 
    *
FROM
    books
WHERE
    Published_Year > 1950;

-- List all customers from the Canada

SELECT 
    *
FROM
    customers
WHERE
    City = 'canada';

-- Show orders placed in November 2023

SELECT 
    *
FROM
    orders
WHERE
    Order_Date BETWEEN '2023-11-01' AND '2023-11-30'; 

-- Retrieve the total stock of books available

SELECT 
    SUM(Stock) AS Total_stock
FROM
    books;

-- Find the details of the most expensive book

SELECT 
    *
FROM
    books
ORDER BY price DESC;

-- Show all customers who ordered more than 3 quantity of a book

SELECT 
    *
FROM
    orders
WHERE
    Quantity > 3;

-- Retrieve all orders where the total amount exceeds $50

SELECT 
    *
FROM
    orders
WHERE
    total_amount > 50;

-- List all genres available in the Books table

SELECT DISTINCT
    genre
FROM
    books;

-- Find the book with the lowest stock

SELECT 
    *
FROM
    books
ORDER BY Stock;

-- Calculate the total revenue generated from all orders

SELECT 
    SUM(Total_Amount) AS Revenue
FROM
    orders;


# Advanced Queries 

-- Retrieve the total number of books sold for each genre

SELECT 
    b.genre, SUM(o.quantity) AS Total_Books_Sold
FROM
    books b
        JOIN
    orders o ON b.book_id = o.book_id
GROUP BY b.genre;

-- Find the average price of books in the "Fantasy" genre

SELECT 
    ROUND(AVG(price)) AS Avg_price
FROM
    books
WHERE
    genre = 'Fantasy';

-- List customers who have placed at least 2 orders

select * from customers;
select * from orders ;

SELECT 
    o.customer_id, c.Name, COUNT(order_id) AS Total_orders
FROM
    orders o
        JOIN
    customers c ON o.customer_id = c.customer_id
GROUP BY customer_id , name
HAVING COUNT(order_id) >= 2;

-- Find the most frequently ordered book

SELECT 
    o.book_id, b.title, COUNT(order_id) AS Order_count
FROM
    orders o
        JOIN
    books b ON o.book_id = b.book_id
GROUP BY o.book_id , b.title
ORDER BY Order_count DESC
LIMIT 1;

-- Show the top 3 most expensive books of 'Fantasy' Genre

SELECT 
    *
FROM
    books
WHERE
    Genre = 'fantasy'
ORDER BY Price DESC
LIMIT 3;

-- Retrieve the total quantity of books sold by each author

SELECT 
    b.author, SUM(o.quantity) AS Total_books_sold
FROM
    orders o
        JOIN
    books b ON o.book_id = b.book_id
GROUP BY b.author;

--  List the cities where customers who spent over $30 are located

SELECT DISTINCT
    c.city, total_amount
FROM
    orders o
        JOIN
    customers c ON o.customer_id = c.customer_id
WHERE
    total_amount > 30; 
    
-- Find the customer who spent the most on orders

select c.customer_id, c.name, round(sum(o.total_amount)) as Total_spent 
from orders o join customers c on c.customer_id = o.customer_id
group by c.customer_id, c.name 
order by Total_spent desc limit 1;
   
-- Calculate the stock remaining after fulfilling all orders

SELECT 
    b.book_id,
    b.title,
    b.stock,
    COALESCE(SUM(o.quantity), 0) AS Order_quantity,
    b.stock - COALESCE(SUM(o.quantity), 0) AS Remaining_quantity
FROM
    books b
        LEFT JOIN
    orders o ON b.book_id = o.book_id
GROUP BY b.book_id , b.title , b.stock;




















