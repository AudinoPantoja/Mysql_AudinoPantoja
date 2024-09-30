DROP SCHEMA IF EXISTS Inventory;
CREATE DATABASE IF NOT EXISTS Inventory;
USE Inventory;

CREATE TABLE identificationType (
    idType INT PRIMARY KEY AUTO_INCREMENT,
    nameType VARCHAR(4) NOT NULL
);

CREATE TABLE addresses (
    idAddresses INT PRIMARY KEY AUTO_INCREMENT,
    street VARCHAR(100) NOT NULL,
    city VARCHAR(45) NOT NULL,
    state VARCHAR(45),
    zip_code VARCHAR(10)
);

CREATE TABLE orderStatus (
    idOrderStatus INT PRIMARY KEY AUTO_INCREMENT,
    statusName VARCHAR(20) NOT NULL
);

CREATE TABLE suppliers (
    idSuppliers INT PRIMARY KEY AUTO_INCREMENT,
    idType INT NOT NULL,
    identificationNumber VARCHAR(12) NOT NULL,    
    firstName VARCHAR(45) NOT NULL,
    secondName VARCHAR(45),
    lastName1 VARCHAR(45) NOT NULL,
    lastName2 VARCHAR(45),
    phone VARCHAR(12),
    email VARCHAR(45),
    idAddresses INT,
    FOREIGN KEY (idType) REFERENCES IdentificationType(idType),
    FOREIGN KEY (idAddresses) REFERENCES addresses(idAddresses)
);

CREATE TABLE products (
    idProducts INT PRIMARY KEY AUTO_INCREMENT,
    productName VARCHAR(45) NOT NULL,
    descriptionProducts TEXT
);

CREATE TABLE productPrices (
    idProductPrices INT PRIMARY KEY AUTO_INCREMENT,
    idProducts INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    effectiveDate DATE NOT NULL,
    FOREIGN KEY (idProducts) REFERENCES products(idProducts)
);

CREATE TABLE purchaseOrders (
    idPurchaseOrders INT PRIMARY KEY AUTO_INCREMENT,
    idSuppliers INT NOT NULL,
    `date`  DATE NOT NULL,
    idOrderStatus INT NOT NULL,
    FOREIGN KEY (idSuppliers) REFERENCES suppliers(idSuppliers),
    FOREIGN KEY (idOrderStatus) REFERENCES orderStatus(idOrderStatus)
);

CREATE TABLE orderDetails (
    idOrderDetails INT PRIMARY KEY AUTO_INCREMENT,
    idPurchaseOrders INT NOT NULL,
    idProducts INT NOT NULL,
    quantity INT NOT NULL,
    unitPrice DECIMAL(10, 2) NOT NULL,
    totalPrice DECIMAL(10, 2) GENERATED ALWAYS AS (quantity * unitPrice) STORED,
    FOREIGN KEY (idPurchaseOrders) REFERENCES purchaseOrders(idPurchaseOrders),
    FOREIGN KEY (idProducts) REFERENCES products(idProducts)
);
