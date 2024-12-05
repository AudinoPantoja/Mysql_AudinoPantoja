DROP SCHEMA IF EXISTS Inventory3;
CREATE DATABASE IF NOT EXISTS Inventory3;
USE Inventory3;
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

-- Tabla identificationType
CREATE TABLE identificationType (
    id INT(20) PRIMARY KEY AUTO_INCREMENT,
    `type` VARCHAR(10),
    createdAt DATETIME,
    updatedAt DATETIME
);

-- Tabla roles
CREATE TABLE roles (
    id INT(20) PRIMARY KEY AUTO_INCREMENT,
    roleName VARCHAR(45) NOT NULL,
    createdAt DATETIME,
    updatedAt DATETIME
);

-- Tabla users
CREATE TABLE users (
    id INT(20) PRIMARY KEY AUTO_INCREMENT,
    userName VARCHAR(45) NOT NULL,
    `password` VARCHAR(60) NOT NULL,
    createdAt DATETIME,
    updatedAt DATETIME
);

-- Tabla userRoles (relación entre users y roles)
CREATE TABLE userRoles (
    id INT(20) PRIMARY KEY AUTO_INCREMENT,
    idUser INT(20) NOT NULL,
    idRole INT(20) NOT NULL,
    createdAt DATETIME,
    updatedAt DATETIME,
    FOREIGN KEY (idUser) REFERENCES users(id),
    FOREIGN KEY (idRole) REFERENCES roles(id)
);

-- Tabla people
CREATE TABLE people (
    id INT(20) PRIMARY KEY AUTO_INCREMENT,
    idUser INT(20) NOT NULL,
    idType INT(20) NOT NULL,
    identificationNumber VARCHAR(12) NOT NULL,
    firstName VARCHAR(45),
    middleName VARCHAR(45),
    lastName VARCHAR(45),
    email VARCHAR(45),
    phone VARCHAR(12),
    idAddress INT(20) NOT NULL,
    createdAt DATETIME,
    updatedAt DATETIME,
    FOREIGN KEY (idUser) REFERENCES users(id),
    FOREIGN KEY (idType) REFERENCES identificationType(id),
    FOREIGN KEY (idAddress) REFERENCES addresses(id)
);

-- Tabla orderStatus
CREATE TABLE orderStatus (
    id INT(20) PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(20),
    createdAt DATETIME,
    updatedAt DATETIME
);

-- Tabla productCategories
CREATE TABLE productCategories (
    id INT(20) PRIMARY KEY AUTO_INCREMENT,
    categoryName VARCHAR(45),
    `description` TEXT,
    createdAt DATETIME,
    updatedAt DATETIME
);

-- Tabla products
CREATE TABLE products (
    id INT(20) PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(45) NOT NULL,
    `description` TEXT,
    price DECIMAL(10,2),
    idCategory INT(20) NOT NULL,
    createdAt DATETIME,
    updatedAt DATETIME,
    FOREIGN KEY (idCategory) REFERENCES productCategories(id)
);

-- Tabla purchaseOrders
CREATE TABLE purchaseOrders (
    id INT(20) PRIMARY KEY AUTO_INCREMENT,
    idSupplier INT(20) NOT NULL,
    idStatus INT(20) NOT NULL,
    createdAt DATETIME,
    updatedAt DATETIME,
    FOREIGN KEY (idSupplier) REFERENCES users(id),
    FOREIGN KEY (idStatus) REFERENCES orderStatus(id) 
);

-- Tabla orderDetails
CREATE TABLE orderDetails (
    id INT(20) PRIMARY KEY AUTO_INCREMENT,
    idPurchaseOrder INT(20) NOT NULL,
    idProduct INT(20) NOT NULL,
    quantity INT(20) NOT NULL,
    price DECIMAL(10,2),
    createdAt DATETIME,
    updatedAt DATETIME,
    FOREIGN KEY (idPurchaseOrder) REFERENCES purchaseOrders(id),
    FOREIGN KEY (idProduct) REFERENCES products(id)
);

-- Tabla historyProductPrices
CREATE TABLE historyProductPrices (
    id INT(20) PRIMARY KEY AUTO_INCREMENT,
    idProduct INT(20) NOT NULL,
    price DECIMAL(10,2),
    createdAt DATETIME,
    updatedAt DATETIME,
    FOREIGN KEY (idProduct) REFERENCES products(id)
);

-- Tabla invoices
CREATE TABLE invoices (
    id INT(20) PRIMARY KEY AUTO_INCREMENT,
    idUser INT(20) NOT NULL,
    total DECIMAL(10,2),
    createdAt DATETIME,
    updatedAt DATETIME,
    FOREIGN KEY (idUser) REFERENCES users(id)
);

-- Tabla invoicesDetails
CREATE TABLE invoicesDetails (
    id INT(20) PRIMARY KEY AUTO_INCREMENT,
    idInvoice INT(20) NOT NULL,
    idProduct INT(20) NOT NULL,
    quantity INT(20) NOT NULL,
    createdAt DATETIME,
    updatedAt DATETIME,
    FOREIGN KEY (idInvoice) REFERENCES invoices(id),
    FOREIGN KEY (idProduct) REFERENCES products(id)
);

-- Tabla pay_methods
CREATE TABLE paymentMethods (
    id INT(20) PRIMARY KEY AUTO_INCREMENT,
    methodName VARCHAR(15),
    createdAt DATETIME,
    updatedAt DATETIME
);

-- Tabla locations
CREATE TABLE locations (
    id INT(20) PRIMARY KEY AUTO_INCREMENT,
    locationName VARCHAR(45) NOT NULL,
    idAddress INT(20) NOT NULL,
    phone VARCHAR(12),
    email VARCHAR(45),
    createdAt DATETIME,
    updatedAt DATETIME,
    FOREIGN KEY (idAddress) REFERENCES addresses(id)
);

-- Tabla paymentGateways
CREATE TABLE paymentGateways (
    id INT(20) PRIMARY KEY AUTO_INCREMENT,
    idPaymentMethod INT(20) NOT NULL,
    gateway VARCHAR(45),
    createdAt DATETIME,
    updatedAt DATETIME,
    FOREIGN KEY (idPaymentMethod) REFERENCES paymentMethods(id)
);

-- Tabla paymentGatewaysLocation
CREATE TABLE paymentGatewaysLocation (
    id INT(20) PRIMARY KEY AUTO_INCREMENT,
    idLocation INT(20) NOT NULL,
    idPaymentGateway INT(20) NOT NULL,
    createdAt DATETIME,
    updatedAt DATETIME,
    FOREIGN KEY (idLocation) REFERENCES locations(id),
    FOREIGN KEY (idPaymentGateway) REFERENCES paymentGateways(id)
);

-- Tabla payments
CREATE TABLE payments (
    id INT(20) PRIMARY KEY AUTO_INCREMENT,
    idInvoice INT(20) NOT NULL,
    amount DECIMAL(10,2),
    idPaymentMethod INT(20) NOT NULL,
    paymentDate DATETIME,
    `status` VARCHAR(45), -- exitoso, pendiente o fallido
    idPaymentGatewaysLocation INT(20) NOT NULL,
    createdAt DATETIME,
    updatedAt DATETIME,
    FOREIGN KEY (idInvoice) REFERENCES invoices(id),
    FOREIGN KEY (idPaymentGatewaysLocation) REFERENCES paymentGatewaysLocation(Id),
    FOREIGN KEY (idPaymentMethod) REFERENCES paymentMethods(id)
);

-- Tabla parameters
CREATE TABLE parameters (
    id INT(20) PRIMARY KEY AUTO_INCREMENT,
    `code` VARCHAR(15),
    `description` VARCHAR(45),
    createdAt DATETIME,
    updatedAt DATETIME
);

-- Tabla paymentGatewaysLocationParameter
CREATE TABLE paymentGatewaysLocationParameter (
    id INT(20) PRIMARY KEY AUTO_INCREMENT,
    idParameter INT(20) NOT NULL,
    idPaymentGatewayLocation INT(20) NOT NULL,
    `value` VARCHAR(45),
    createdAt DATETIME,
    updatedAt DATETIME,
    FOREIGN KEY (idParameter) REFERENCES parameters(id),
    FOREIGN KEY (idPaymentGatewayLocation) REFERENCES paymentGatewaysLocation(id)
);
-- Tabla locationProduct
CREATE TABLE locationProduct (
    id INT(20) PRIMARY KEY AUTO_INCREMENT,
    idProduct INT(20) NOT NULL,
    idLocation INT(20) NOT NULL,
    createdAt DATETIME,
    updatedAt DATETIME,
    FOREIGN KEY (idProduct) REFERENCES products(id),
    FOREIGN KEY (idLocation) REFERENCES locations(id)
);