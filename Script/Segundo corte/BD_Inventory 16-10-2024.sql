-- Eliminar el esquema si existe y crear uno nuevo
DROP SCHEMA IF EXISTS Inventory2;
CREATE DATABASE IF NOT EXISTS Inventory2;
USE Inventory2;

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

-- Crear la tabla de usuarios
CREATE TABLE users (
    id INT(20) PRIMARY KEY AUTO_INCREMENT,
    userName VARCHAR(45) NOT NULL UNIQUE,
    `password` VARCHAR(60) NOT NULL, 
    createdAt DATETIME,
    updatedAt DATETIME
);

-- Crear la tabla intermedia para usuarios y roles (muchos a muchos)
CREATE TABLE usersRoles (
    id INT(20) PRIMARY KEY AUTO_INCREMENT,
    idUser INT(20) NOT NULL,
    idRole INT(20) NOT NULL,
    createdAt DATETIME,
    updatedAt DATETIME,
    FOREIGN KEY (idUser) REFERENCES users(id),
    FOREIGN KEY (idRole) REFERENCES roles(id)
);

-- Crear la tabla de personas
CREATE TABLE people (
    id INT(20) PRIMARY KEY AUTO_INCREMENT,
    idUser INT(20),
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
    FOREIGN KEY (idUser) REFERENCES users(id),
    FOREIGN KEY (idType) REFERENCES identificationType(id),
    FOREIGN KEY (idAddress) REFERENCES addresses(id)
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
    FOREIGN KEY (idSupplier) REFERENCES users(id),
    FOREIGN KEY (idOrderStatus) REFERENCES orderStatus(id)
);

-- Crear la tabla de detalles de órdenes
CREATE TABLE orderDetails (
    id INT(20) PRIMARY KEY AUTO_INCREMENT,
    idPurchaseOrder INT(20) NOT NULL,
    idProduct INT(20) NOT NULL,
    quantity INT(20) NOT NULL,
    unitPrice DECIMAL(10, 2) NOT NULL,
    createdAt DATETIME,
    updatedAt DATETIME,
    FOREIGN KEY (idPurchaseOrder) REFERENCES purchaseOrders(id),
    FOREIGN KEY (idProduct) REFERENCES products(id)
);

-- Crear la tabla de facturas (invoices)
CREATE TABLE invoices (
    id INT(20) PRIMARY KEY AUTO_INCREMENT,
    idUser INT(20) NOT NULL,           -- Usuario que generó la factura
    invoiceDate DATETIME NOT NULL,     -- Fecha de emisión de la factura
    total DECIMAL(10, 2) NOT NULL,     -- Total de la factura
    createdAt DATETIME,
    updatedAt DATETIME,
    FOREIGN KEY (idUser) REFERENCES users(id)
);

-- Crear la tabla de detalles de facturas
CREATE TABLE invoiceDetails (
    id INT(20) PRIMARY KEY AUTO_INCREMENT,
    idInvoice INT(20) NOT NULL,         -- Relación con la tabla de facturas
    idProduct INT(20) NOT NULL,         -- Producto facturado
    quantity INT(20) NOT NULL,          -- Cantidad del producto
    unitPrice DECIMAL(10, 2) NOT NULL,  -- Precio unitario del producto
    createdAt DATETIME,
    updatedAt DATETIME,
    FOREIGN KEY (idInvoice) REFERENCES invoices(id),
    FOREIGN KEY (idProduct) REFERENCES products(id)
);

-- Crear la tabla de métodos de pago
CREATE TABLE paymentMethods (
    id INT(20) PRIMARY KEY AUTO_INCREMENT,
    methodName VARCHAR(45) NOT NULL,   -- Efectivo, Transferencia, Tarjeta de crédito, etc.
    createdAt DATETIME,
    updatedAt DATETIME
);

-- Crear la tabla de pagos (payments)
CREATE TABLE payments (
    id INT(20) PRIMARY KEY AUTO_INCREMENT,
    idInvoice INT(20) NOT NULL,           -- Relación con la tabla de facturas
    idPaymentMethod INT(20) NOT NULL,     -- Método de pago utilizado
    paymentDate DATETIME NOT NULL,        -- Fecha del pago
    amount DECIMAL(10, 2) NOT NULL,       -- Monto pagado
    `status` VARCHAR(20) NOT NULL,          -- Estado del pago (Ej. completado, pendiente)
    createdAt DATETIME,
    updatedAt DATETIME,
    FOREIGN KEY (idInvoice) REFERENCES invoices(id),
    FOREIGN KEY (idPaymentMethod) REFERENCES paymentMethods(id)
);

-- Crear la tabla para almacenar los registros del gateway de pagos
CREATE TABLE paymentGatewayRecords (
    id INT(20) PRIMARY KEY AUTO_INCREMENT,
    `reference` VARCHAR(45) NOT NULL,   -- Referencia de la transacción
    idPayment INT(20) NOT NULL,       -- Relación con la tabla de pagos
    dataResponse TEXT NOT NULL,       -- Respuesta completa del gateway de pago en formato JSON
    createdAt DATETIME,
    updatedAt DATETIME,
    FOREIGN KEY (idPayment) REFERENCES payments(id)
);
