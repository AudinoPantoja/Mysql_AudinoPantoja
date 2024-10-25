-- Crear la base de datos
DROP SCHEMA IF EXISTS Inventory;
CREATE DATABASE IF NOT EXISTS Inventory;
USE Inventory;

-- Crear la tabla de tipos de identificación
CREATE TABLE identificationType (
    id INT(20) PRIMARY KEY AUTO_INCREMENT,
    typeName VARCHAR(4) NOT NULL,
    createdAt DATETIME,
    updatedAt DATETIME
);

-- Crear la tabla de direcciones
CREATE TABLE addresses (
    id INT(20) PRIMARY KEY AUTO_INCREMENT,
    street VARCHAR(45) NOT NULL,
    city VARCHAR(45) NOT NULL,
    state VARCHAR(45),
    zipCode VARCHAR(10),
    createdAt DATETIME,
    updatedAt DATETIME
);

-- Crear la tabla de estado de órdenes
CREATE TABLE orderStatus (
    id INT(20) PRIMARY KEY AUTO_INCREMENT,
    statusName VARCHAR(20) NOT NULL,
    createdAt DATETIME,
    updatedAt DATETIME
);

-- Crear la tabla de roles de usuarios
CREATE TABLE roles (
    id INT(20) PRIMARY KEY AUTO_INCREMENT,
    roleName VARCHAR(45) NOT NULL,
    createdAt DATETIME,
    updatedAt DATETIME
);

-- Crear la tabla de personas
CREATE TABLE people (
    id INT(20) PRIMARY KEY AUTO_INCREMENT,
    idType INT(20) NOT NULL,
    identificationNumber VARCHAR(12) NOT NULL,
    firstName VARCHAR(45) NOT NULL,
    secondName VARCHAR(45),
    lastName1 VARCHAR(45) NOT NULL,
    lastName2 VARCHAR(45),
    phone VARCHAR(12),
    email VARCHAR(45),
    idAddress INT(20),
    createdAt DATETIME,
    updatedAt DATETIME,
    FOREIGN KEY (idType) REFERENCES identificationType(id),
    FOREIGN KEY (idAddress) REFERENCES addresses(id)
);

-- Crear la tabla de usuarios
CREATE TABLE users (
    id INT(20) PRIMARY KEY AUTO_INCREMENT,
    idPerson INT(20) NOT NULL,
    idRole INT(20) NOT NULL,
    userName VARCHAR(45) NOT NULL UNIQUE,
    `password` VARCHAR(12) NOT NULL,
    createdAt DATETIME,
    updatedAt DATETIME,
    FOREIGN KEY (idPerson) REFERENCES people(id),
    FOREIGN KEY (idRole) REFERENCES roles(id)
);

-- Crear la tabla de proveedores
CREATE TABLE suppliers (
    id INT(20) PRIMARY KEY AUTO_INCREMENT,
    idPerson INT(20) NOT NULL,
    createdAt DATETIME,
    updatedAt DATETIME,
    FOREIGN KEY (idPerson) REFERENCES people(id)
);

-- Crear la tabla de categorías de productos
CREATE TABLE productCategories (
    id INT(20) PRIMARY KEY AUTO_INCREMENT,
    categoryName VARCHAR(45) NOT NULL,
    `description` TEXT,
    createdAt DATETIME,
    updatedAt DATETIME
);

-- Crear la tabla de productos
CREATE TABLE products (
    id INT(20) PRIMARY KEY AUTO_INCREMENT,
    productName VARCHAR(45) NOT NULL,
    descriptionProduct TEXT,
    idCategory INT(20) NOT NULL,
    createdAt DATETIME,
    updatedAt DATETIME,
    FOREIGN KEY (idCategory) REFERENCES productCategories(id)
);

-- Crear la tabla del historial de precios de los productos
CREATE TABLE historyProductPrices (
    id INT(20) PRIMARY KEY AUTO_INCREMENT,
    idProduct INT(20) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    effectiveDate DATE NOT NULL,
    createdAt DATETIME,
    updatedAt DATETIME,
    FOREIGN KEY (idProduct) REFERENCES products(id)
);

-- Crear la tabla de órdenes de compra
CREATE TABLE purchaseOrders (
    id INT(20) PRIMARY KEY AUTO_INCREMENT,
    idSupplier INT(20) NOT NULL,
    orderDate DATE NOT NULL,
    idOrderStatus INT(20) NOT NULL,
    createdAt DATETIME,
    updatedAt DATETIME,
    FOREIGN KEY (idSupplier) REFERENCES suppliers(id),
    FOREIGN KEY (idOrderStatus) REFERENCES orderStatus(id)
);

-- Crear la tabla de detalles de órdenes
CREATE TABLE orderDetails (
    id INT(20) PRIMARY KEY AUTO_INCREMENT,
    idPurchaseOrder INT(20) NOT NULL,
    idProduct INT(20) NOT NULL,
    quantity INT(20) NOT NULL,
    unitPrice DECIMAL(10, 2) NOT NULL,
    totalPrice DECIMAL(10, 2) GENERATED ALWAYS AS (quantity * unitPrice) STORED,
    createdAt DATETIME,
    updatedAt DATETIME,
    FOREIGN KEY (idPurchaseOrder) REFERENCES purchaseOrders(id),
    FOREIGN KEY (idProduct) REFERENCES products(id)
);