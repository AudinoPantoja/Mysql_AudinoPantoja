-- Insertar datos en la tabla identificationType
INSERT INTO identificationType (typeName, createdAt, updatedAt) 
VALUES 
('CC', '2023-09-15 10:30:00', '2023-09-15 10:45:00'), 
('TI', '2023-08-01 09:20:00', '2023-08-01 09:30:00'), 
('CE', '2023-07-10 08:10:00', '2023-07-10 08:15:00'),
('NIT', '2023-10-10 08:40:00', '2023-10-10 08:45:00');

-- Insertar datos en la tabla addresses
INSERT INTO addresses (street, city, state, zipCode, createdAt, updatedAt)
VALUES 
('cll 3 #23', 'Medellin', 'Antioquia', '15000', '2024-01-01 12:00:00', '2024-01-01 12:30:00'),
('cra 53 av Boyaca', 'Bogota', 'Cundinamarca', '08000', '2024-01-05 14:45:00', '2024-01-05 15:00:00'),
('cll 789 #23-12', 'Arequipa', 'Arequipa', '04000', '2024-02-10 10:00:00', '2024-02-10 10:15:00');

-- Insertar datos en la tabla orderStatus
INSERT INTO orderStatus (statusName, createdAt, updatedAt) 
VALUES 
('Pending', '2024-03-12 09:15:00', '2024-03-12 09:20:00'), 
('Completed', '2024-04-20 08:45:00', '2024-04-20 09:00:00'), 
('Cancelled', '2024-05-18 11:10:00', '2024-05-18 11:30:00');

-- Insertar datos en la tabla roles
INSERT INTO roles (roleName, createdAt, updatedAt) 
VALUES 
('Admin', '2024-02-28 13:00:00', '2024-02-28 13:05:00'), 
('Supplier', '2024-03-01 10:00:00', '2024-03-01 10:10:00'),
('Seller', '2024-04-01 10:30:00', '2024-04-01 10:32:00'), 
('Customer', '2024-05-15 14:20:00', '2024-05-15 14:30:00');

-- Insertar datos en la tabla people
INSERT INTO people (idType, identificationNumber, firstName, secondName, lastName1, lastName2, phone, email, idAddress, isSupplier, createdAt, updatedAt)
VALUES 
(1, '1123456789', 'Carlos', 'Alberto', 'Diaz', 'Perez', '3205451234', 'carlos@gmail.com', 1, 1, '2024-06-01 12:00:00', '2024-06-01 12:30:00'),
(2, '1098765432', 'María', NULL, 'Gomez', 'Torres', '3104567890', 'maria@gmail.com', 2, 0, '2024-06-02 14:45:00', '2024-06-02 15:00:00'),
(3, '1023456789', 'Andres', 'Felipe', 'Lopez', NULL, '3001234567', 'andres@hotmail.com', 3, 0, '2024-06-03 10:00:00', '2024-06-03 10:15:00'),
(4, '1009876543', 'Ana', 'Maria', 'Cruz', NULL, '3111234567', 'ana@gmail.com', 1, 0, '2024-06-04 09:00:00', '2024-06-04 09:30:00');

-- Insertar datos en la tabla users
INSERT INTO users (userName, `password`, idRole, createdAt, updatedAt)
VALUES 
('carlos123', 'password123', 2, '2024-06-01 12:10:00', '2024-06-01 12:30:00'),
('maria123', 'password456', 4, '2024-06-02 14:55:00', '2024-06-02 15:15:00'),
('andres123', 'password789', 3, '2024-06-03 10:10:00', '2024-06-03 10:25:00');

-- Insertar datos en la tabla productCategories
INSERT INTO productCategories (categoryName, description, createdAt, updatedAt)
VALUES 
('Electronics', 'Electronic devices and gadgets', '2024-06-05 12:00:00', '2024-06-05 12:30:00'),
('Clothing', 'Apparel and accessories', '2024-06-06 14:00:00', '2024-06-06 14:30:00'),
('Furniture', 'Home and office furniture', '2024-06-07 16:00:00', '2024-06-07 16:30:00');

-- Insertar datos en la tabla products
INSERT INTO products (productName, descriptionProduct, idCategory, createdAt, updatedAt)
VALUES 
('Laptop', 'High-performance laptop', 1, '2024-06-08 12:00:00', '2024-06-08 12:30:00'),
('T-Shirt', '100% cotton t-shirt', 2, '2024-06-09 14:00:00', '2024-06-09 14:30:00'),
('Office Chair', 'Ergonomic office chair', 3, '2024-06-10 16:00:00', '2024-06-10 16:30:00');

-- Insertar datos en la tabla historyProductPrices
INSERT INTO historyProductPrices (idProduct, price, effectiveDate, createdAt, updatedAt)
VALUES 
(1, 1200000.00, '2024-06-15', '2024-06-15 12:00:00', '2024-06-15 12:30:00'),
(2, 30000.00, '2024-06-16', '2024-06-16 14:00:00', '2024-06-16 14:30:00'),
(3, 250000.00, '2024-06-17', '2024-06-17 16:00:00', '2024-06-17 16:30:00');

-- Insertar datos en la tabla purchaseOrders
INSERT INTO purchaseOrders (idSupplier, orderDate, idOrderStatus, createdAt, updatedAt)
VALUES 
(1, '2024-06-20', 1, '2024-06-20 12:00:00', '2024-06-20 12:30:00'),
(2, '2024-06-21', 2, '2024-06-21 14:00:00', '2024-06-21 14:30:00');

-- Insertar datos en la tabla orderDetails
INSERT INTO orderDetails (idPurchaseOrder, idProduct, quantity, unitPrice, createdAt, updatedAt)
VALUES 
(1, 1, 2, 1200000.00, '2024-06-22 12:00:00', '2024-06-22 12:30:00'),
(2, 2, 5, 30000.00, '2024-06-23 14:00:00', '2024-06-23 14:30:00');
