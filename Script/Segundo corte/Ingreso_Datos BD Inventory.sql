-- Insertar datos en la tabla identificationType
INSERT INTO identificationType (typeName, createdAt, updatedAt) 
VALUES 
('CC', '2024-01-01 10:30:00', '2024-01-01 10:45:00'), 
('TI', '2024-02-01 09:20:00', '2024-02-01 09:30:00'), 
('CE', '2024-03-01 08:10:00', '2024-03-01 08:15:00'),
('NIT', '2024-04-01 08:40:00', '2024-04-01 08:45:00');

-- Insertar datos en la tabla addresses
INSERT INTO addresses (street, city, state, zipCode, createdAt, updatedAt)
VALUES 
('Calle 3 #23', 'Medellin', 'Antioquia', '15000', '2024-01-01 12:00:00', '2024-01-01 12:30:00'),
('Carrera 53', 'Bogotá', 'Cundinamarca', '08000', '2024-01-05 14:45:00', '2024-01-05 15:00:00'),
('Calle 789 #23-12', 'Arequipa', 'Arequipa', '04000', '2024-02-10 10:00:00', '2024-02-10 10:15:00'),
('Calle 234 #13-32', 'Mocoa', 'Putumayo', '86000', '2024-06-10 10:00:00', '2024-06-10 10:15:00');

-- Insertar datos en la tabla orderStatus
INSERT INTO orderStatus (statusName, createdAt, updatedAt) 
VALUES 
('Pending', '2024-01-01 09:15:00', '2024-01-01 09:20:00'), 
('Completed', '2024-01-02 08:45:00', '2024-01-02 09:00:00'), 
('Cancelled', '2024-01-03 11:10:00', '2024-01-03 11:30:00'),
('In Progress', '2024-01-04 10:10:00', '2024-01-04 10:30:00');

-- Insertar datos en la tabla roles
INSERT INTO roles (roleName, createdAt, updatedAt) 
VALUES 
('Admin', '2024-02-28 13:00:00', '2024-02-28 13:05:00'), 
('Supplier', '2024-03-01 10:00:00', '2024-03-01 10:10:00'),
('Seller', '2024-04-01 10:30:00', '2024-04-01 10:32:00'), 
('Customer', '2024-05-15 14:20:00', '2024-05-15 14:30:00');

-- Insertar datos en la tabla users
INSERT INTO users (userName, `password`, createdAt, updatedAt)
VALUES 
('carlos123', 'password123', '2024-06-01 12:10:00', '2024-06-01 12:30:00'),
('maria123', 'password456', '2024-06-02 14:55:00', '2024-06-02 15:15:00'),
('andres123', 'password789', '2024-06-03 10:10:00', '2024-06-03 10:25:00'),
('luisa123', 'password321', '2024-06-04 10:30:00', '2024-06-04 10:45:00');

-- Insertar datos en la tabla usersRoles
INSERT INTO usersRoles (idUser, idRole, createdAt, updatedAt)
VALUES 
(1, 1, '2024-06-01 12:10:00', '2024-06-01 12:30:00'),
(2, 2, '2024-06-02 14:55:00', '2024-06-02 15:15:00'),
(3, 3, '2024-06-03 10:10:00', '2024-06-03 10:25:00'),
(4, 4, '2024-06-04 10:30:00', '2024-06-04 10:45:00');

-- Insertar datos en la tabla people
INSERT INTO people (idUser, idType, identificationNumber, firstName, secondName, lastName1, lastName2, phone, email, idAddress, createdAt, updatedAt)
VALUES 
(1, 1, '1123456789', 'Carlos', 'Alberto', 'Diaz', 'Perez', '3205451234', 'carlos@gmail.com', 1, '2024-06-01 12:00:00', '2024-06-01 12:30:00'),
(2, 2, '1098765432', 'Maria', NULL, 'Gomez', 'Torres', '3104567890', 'maria@gmail.com', 2, '2024-06-02 14:45:00', '2024-06-02 15:00:00'),
(3, 3, '1023456789', 'Andres', 'Felipe', 'Lopez', NULL, '3001234567', 'andres@hotmail.com', 3, '2024-06-03 10:00:00', '2024-06-03 10:15:00'),
(4, 4, '1034567890', 'Luisa', 'Sofia', 'Martinez', 'Gomez', '3216549870', 'luisa@gmail.com', 4, '2024-06-04 11:00:00', '2024-06-04 11:15:00');

-- Insertar datos en la tabla productCategories
INSERT INTO productCategories (categoryName, description, createdAt, updatedAt)
VALUES 
('Electronics', 'Electronic devices and gadgets', '2024-06-05 12:00:00', '2024-06-05 12:30:00'),
('Clothing', 'Apparel and accessories', '2024-06-06 14:00:00', '2024-06-06 14:30:00'),
('Furniture', 'Home and office furniture', '2024-06-07 16:00:00', '2024-06-07 16:30:00'),
('Books', 'Literature and educational materials', '2024-06-08 17:00:00', '2024-06-08 17:30:00');

-- Insertar datos en la tabla products
INSERT INTO products (productName, descriptionProduct, idCategory, createdAt, updatedAt)
VALUES 
('Laptop', 'High-performance laptop', 1, '2024-06-08 12:00:00', '2024-06-08 12:30:00'),
('T-Shirt', '100% cotton t-shirt', 2, '2024-06-09 14:00:00', '2024-06-09 14:30:00'),
('Office Chair', 'Ergonomic office chair', 3, '2024-06-10 16:00:00', '2024-06-10 16:30:00'),
('Novel', 'Bestselling fiction novel', 4, '2024-06-11 17:00:00', '2024-06-11 17:30:00');

-- Insertar datos en la tabla historyProductPrices
INSERT INTO historyProductPrices (idProduct, price, effectiveDate, createdAt, updatedAt)
VALUES 
(1, 1200000.00, '2024-06-15', '2024-06-15 12:00:00', '2024-06-15 12:30:00'),
(2, 30000.00, '2024-06-16', '2024-06-16 14:00:00', '2024-06-16 14:30:00'),
(3, 250000.00, '2024-06-17', '2024-06-17 16:00:00', '2024-06-17 16:30:00'),
(4, 45000.00, '2024-06-18', '2024-06-18 17:00:00', '2024-06-18 17:30:00');

-- Insertar datos en la tabla purchaseOrders
INSERT INTO purchaseOrders (idSupplier, orderDate, idOrderStatus, createdAt, updatedAt)
VALUES 
(1, '2024-06-20', 1, '2024-06-20 12:00:00', '2024-06-20 12:30:00'),
(2, '2024-06-21', 2, '2024-06-21 14:00:00', '2024-06-21 14:30:00'),
(3, '2024-06-22', 3, '2024-06-22 16:00:00', '2024-06-22 16:30:00'),
(4, '2024-06-23', 4, '2024-06-23 17:00:00', '2024-06-23 17:30:00');

-- Insertar datos en la tabla orderDetails
INSERT INTO orderDetails (idPurchaseOrder, idProduct, quantity, unitPrice, createdAt, updatedAt)
VALUES 
(1, 1, 2, 1200000.00, '2024-06-22 12:00:00', '2024-06-22 12:30:00'),
(2, 2, 5, 30000.00, '2024-06-23 14:00:00', '2024-06-23 14:30:00'),
(3, 3, 1, 250000.00, '2024-06-24 16:00:00', '2024-06-24 16:30:00'),
(4, 4, 10, 45000.00, '2024-06-25 17:00:00', '2024-06-25 17:30:00');

-- Insertar datos en la tabla paymentMethods
INSERT INTO paymentMethods (methodName, createdAt, updatedAt)
VALUES 
('Cash', '2024-06-01 10:00:00', '2024-06-01 10:30:00'),
('Transfer', '2024-06-02 11:00:00', '2024-06-02 11:30:00'),
('Credit Card', '2024-06-03 12:00:00', '2024-06-03 12:30:00'),
('Cryptocurrency', '2024-06-04 13:00:00', '2024-06-04 13:30:00');

-- Insertar datos en la tabla invoices
INSERT INTO invoices (idUser, invoiceDate, total, createdAt, updatedAt)
VALUES 
(1, '2024-06-22 10:00:00', 50000.00, '2024-06-22 10:30:00', '2024-06-22 10:30:00'),
(2, '2024-06-23 12:00:00', 75000.00, '2024-06-23 12:30:00', '2024-06-23 12:30:00'),
(3, '2024-06-24 14:00:00', 100000.00, '2024-06-24 14:30:00', '2024-06-24 14:30:00'),
(1, '2024-06-25 16:00:00', 120000.00, '2024-06-25 16:30:00', '2024-06-25 16:30:00');

-- Insertar datos en la tabla invoiceDetails
INSERT INTO invoiceDetails (idInvoice, idProduct, quantity, unitPrice, createdAt, updatedAt)
VALUES 
(1, 1, 2, 1200000.00, '2024-06-22 12:00:00', '2024-06-22 12:30:00'),
(1, 2, 1, 30000.00, '2024-06-22 12:10:00', '2024-06-22 12:30:00'),
(2, 2, 3, 30000.00, '2024-06-23 12:10:00', '2024-06-23 12:30:00'),
(3, 3, 1, 250000.00, '2024-06-24 14:10:00', '2024-06-24 14:30:00'),
(4, 4, 10, 45000.00, '2024-06-25 16:10:00', '2024-06-25 16:30:00');

-- Insertar datos en la tabla payments
INSERT INTO payments (idInvoice, idPaymentMethod, paymentDate, amount, `status`, createdAt, updatedAt)
VALUES 
(1, 3, '2024-06-22 10:45:00', 50000.00, 'Completed', '2024-06-22 10:50:00', '2024-06-22 10:50:00'),
(2, 2, '2024-06-23 12:50:00', 75000.00, 'Completed', '2024-06-23 12:55:00', '2024-06-23 12:55:00'),
(3, 1, '2024-06-24 14:50:00', 100000.00, 'Pending', '2024-06-24 15:00:00', '2024-06-24 15:00:00'),
(4, 4, '2024-06-25 16:50:00', 120000.00, 'Completed', '2024-06-25 17:00:00', '2024-06-25 17:00:00');


-- Insertar datos en la tabla paymentGatewayRecords
INSERT INTO paymentGatewayRecords (`reference`, idPayment, dataResponse, createdAt, updatedAt)
VALUES 
('REF123456', 1, '{"status": "success", "amount": 50000, "method": "Credit Card"}', '2024-06-22 10:45:00', '2024-06-22 10:45:00'),
('REF234567', 2, '{"status": "success", "amount": 75000, "method": "Transfer"}', '2024-06-23 12:45:00', '2024-06-23 12:45:00'),
('REF345678', 3, '{"status": "failed", "amount": 100000, "method": "Cash"}', '2024-06-24 14:45:00', '2024-06-24 14:45:00'),
('REF456789', 4, '{"status": "success", "amount": 120000, "method": "Credit Card"}', '2024-06-25 16:45:00', '2024-06-25 16:45:00');
