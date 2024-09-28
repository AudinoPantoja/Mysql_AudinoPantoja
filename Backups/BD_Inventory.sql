DROP SCHEMA IF EXISTS Inventory;
CREATE DATABASE IF NOT EXISTS Inventory;
USE Inventory;

CREATE TABLE identificationType (
    idType INT PRIMARY KEY AUTO_INCREMENT,
    nameType VARCHAR(4) NOT NULL
);

CREATE TABLE Addresses (
    idAddresses INT PRIMARY KEY AUTO_INCREMENT,
    street VARCHAR(100) NOT NULL,
    city VARCHAR(45) NOT NULL,
    state VARCHAR(45),
    zip_code VARCHAR(10)
);

CREATE TABLE OrderStatus (
    idOrderStatus INT PRIMARY KEY AUTO_INCREMENT,
    status_name VARCHAR(20) NOT NULL
);

CREATE TABLE Suppliers (
    idSuppliers INT PRIMARY KEY AUTO_INCREMENT,
    idType INT NOT NULL,
    identification_number VARCHAR(12) NOT NULL,    
    first_name VARCHAR(45) NOT NULL,
    second_name VARCHAR(45),
    last_name_1 VARCHAR(45) NOT NULL,
    last_name_2 VARCHAR(45),
    phone VARCHAR(12),
    email VARCHAR(45),
    idAddresses INT,
    FOREIGN KEY (idType) REFERENCES IdentificationType(idType),
    FOREIGN KEY (idAddresses) REFERENCES Addresses(idAddresses)
);

CREATE TABLE Products (
    idProducts INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(45) NOT NULL,
    descriptionProducts TEXT
);

CREATE TABLE ProductPrices (
    idProductPrices INT PRIMARY KEY AUTO_INCREMENT,
    idProducts INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    effective_date DATE NOT NULL,
    FOREIGN KEY (idProducts) REFERENCES Products(idProducts)
);

CREATE TABLE PurchaseOrders (
    idPurchaseOrders INT PRIMARY KEY AUTO_INCREMENT,
    idSuppliers INT NOT NULL,
    `date`  DATE NOT NULL,
    idOrderStatus INT NOT NULL,
    FOREIGN KEY (idSuppliers) REFERENCES Suppliers(idSuppliers),
    FOREIGN KEY (idOrderStatus) REFERENCES OrderStatus(idOrderStatus)
);

CREATE TABLE OrderDetails (
    idOrderDetails INT PRIMARY KEY AUTO_INCREMENT,
    idPurchaseOrders INT NOT NULL,
    idProducts INT NOT NULL,
    quantity INT NOT NULL,
    unit_price DECIMAL(10, 2) NOT NULL,
    total_price DECIMAL(10, 2) GENERATED ALWAYS AS (quantity * unit_price) STORED,
    FOREIGN KEY (idPurchaseOrders) REFERENCES PurchaseOrders(idPurchaseOrders),
    FOREIGN KEY (idProducts) REFERENCES Products(idProducts)
);
