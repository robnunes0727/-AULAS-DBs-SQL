----- RESETA TUDO -----
DROP DATABASE IF EXISTS business;

----- CRIA DATABASE -----
CREATE SCHEMA IF NOT EXISTS business;
USE business;

----- CRIAR TABELAS -----
CREATE TABLE customers (
	customerNumber INT PRIMARY KEY AUTO_INCREMENT,
    customerName VARCHAR(50),
    contactLastName VARCHAR(50),
    contactFirstName VARCHAR(50),
    phone VARCHAR(50),
    adressLine1 VARCHAR(50),
    adressLine2 VARCHAR(50),
    city VARCHAR(50),
    state VARCHAR(50),
    postalCode VARCHAR(50),
    country VARCHAR(50),
    salesRepEmployeeNumber INT,
    creditLimit float(10,2)
);

CREATE TABLE orders (
	orderNumber INT PRIMARY KEY AUTO_INCREMENT,
    orderDate DATE,
    requiredDate DATE,
    shippedDate DATE,
    orderStatus VARCHAR(50),
    comments VARCHAR(50),
    customerNumber INT,
    FOREIGN KEY orders(customerNumber) REFERENCES customers(customerNumber)
);

----- ALTER FKs -----
-- ALTER TABLE orders ADD CONSTRAINT FK_CustomerOrder
-- FOREIGN KEY orders(customerNumber) REFERENCES customers(customerNumber);
