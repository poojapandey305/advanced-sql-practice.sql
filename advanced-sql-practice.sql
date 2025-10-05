CREATE TABLE CUSTOMERS (
ID int primary key not null auto_increment,
firstName varchar(50),
lastName varchar(50)
);
CREATE TABLE ORDERES (
ID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
CUSTOMER_ID INT NULL,
 ORDER_DATE DATE,
TOTAL_AMOUNT DECIMAL(10,2),
FOREIGN KEY (CUSTOMER_ID) REFERENCES CUSTOMERS(ID)
)

INSERT INTO CUSTOMERS (ID,firstName, lastName)
values 
(1,'John', 'Doe'),
(2,'Jane', 'Smith'),
(3,'Alice', 'Smith');

INSERT INTO ORDERS(ID,CUSTOMER_ID, ORDER_DATE, TOTAL_AMOUNT )
VALUES (1, 1,'2023-01-01', 100.00),
(2, 2,'2023-02-01', 150.00),
(3, 2,'2023-01-01', 200.00),
(4, 3,'2023-04-01', 250.00),
(5, 3,'2023-04-01', 300.00),
(6, null,'2023-04-01', 100.00)

/* group by */

SELECT customer_id, SUM(total_amount) AS total_spent
FROM orders
GROUP BY customer_id;


SELECT customer_id, order_date, SUM(total_amount) AS total_spent
FROM orders
GROUP BY customer_id, order_date;

/*subquery*/
SELECT id, order_date, total_amount
FROM orders
WHERE total_amount >= (SELECT AVG(total_amount) FROM orders); 
/*common subquery*/
SELECT id, order_date, total_amount, customer_id
FROM orders
WHERE customer_id IN (SELECT id FROM customers WHERE last_name = 'Smith');





/*Left join*/
SELECT orders.id, customers.first_name, customers.last_name, orders.order_date, orders.total_amount
FROM orders
LEFT JOIN customers ON orders.customer_id = customers.id;





