USE Inventory3;

INSERT INTO addresses (street, city, state, zipCode, createdAt, updatedAt)
VALUES 
('Calle 10', 'Bogotá', 'Cundinamarca', '110111', '2024-01-04 10:30:00', '2024-01-04 10:45:00'),
('Avenida Siempre Viva', 'Medellín', 'Antioquia', '050022', '2024-01-04 11:30:00', '2024-01-04 11:45:00'),
('Calle Falsa 123', 'Cali', 'Valle del Cauca', '760001', '2024-01-05 09:30:00', '2024-01-05 09:45:00');

INSERT INTO identificationType (`type`, createdAt, updatedAt)
VALUES 
('CC', '2024-01-03 10:30:00', '2024-01-03 10:45:00'), 
('TI', '2024-02-01 09:20:00', '2024-02-01 09:30:00'), 
('CE', '2024-03-01 08:10:00', '2024-03-01 08:15:00'),
('NIT', '2024-04-01 08:40:00', '2024-04-01 08:45:00');

INSERT INTO roles (roleName, createdAt, updatedAt)
VALUES 
('Admin', '2024-02-01 08:40:00', '2024-02-01 08:45:00'),
('Supplier', '2024-02-01 08:40:00', '2024-02-01 08:45:00'),
('Customer', '2024-02-01 08:40:00', '2024-02-01 08:45:00');

INSERT INTO users (userName, `password`, createdAt, updatedAt)
VALUES 
('admin_user', 'admin_pass', '2024-04-01 08:40:00', '2024-04-01 08:45:00'),
('supplier_user', 'supplier_pass', '2024-04-01 08:40:00', '2024-04-01 08:45:00'),
('customer_user', 'customer_pass', '2024-04-01 08:40:00', '2024-04-01 08:45:00');

INSERT INTO userRoles (idUser, idRole, createdAt, updatedAt)
VALUES 
(1, 1, '2024-04-01 08:40:00', '2024-04-01 08:45:00'),
(2, 2, '2024-04-01 08:40:00', '2024-04-01 08:45:00'),
(3, 3, '2024-04-01 08:40:00', '2024-04-01 08:45:00');

INSERT INTO people (idUser, idType, identificationNumber, firstName, middleName, lastName, email, phone, idAddress, createdAt, updatedAt)
VALUES 
(1, 1, '1234567890', 'Carlos', 'Alberto', 'Diaz', 'carlos@gmail.com', '3201234567', 1, '2024-04-01 08:40:00', '2024-04-01 08:45:00'),
(2, 2, '2345678901', 'Maria', NULL, 'Lopez', 'maria@hotmail.com', '3109876543', 2, '2024-04-01 08:40:00', '2024-04-01 08:45:00'),
(3, 3, '3456789012', 'Juan', 'Carlos', 'Gomez', 'juan@gmail.com', '3001239876', 3, '2024-04-01 08:40:00', '2024-04-01 08:45:00');

INSERT INTO orderStatus (`name`, createdAt, updatedAt)
VALUES 
('Pending', '2024-04-01 08:40:00', '2024-04-01 08:45:00'),
('Completed', '2024-04-01 08:40:00', '2024-04-01 08:45:00'),
('Cancelled', '2024-04-01 08:40:00', '2024-04-01 08:45:00');

INSERT INTO productCategories (categoryName, `description`, createdAt, updatedAt)
VALUES 
('Electronics', 'Electronic items', '2024-04-01 08:40:00', '2024-04-01 08:45:00'),
('Clothing', 'Apparel and clothing', '2024-04-01 08:40:00', '2024-04-01 08:45:00'),
('Furniture', 'Home and office furniture', '2024-04-01 08:40:00', '2024-04-01 08:45:00');

INSERT INTO products (`name`, `description`, price, idCategory, createdAt, updatedAt)
VALUES 
('Laptop', 'High-end gaming laptop', 2500000, 1, '2024-04-01 08:40:00', '2024-04-01 08:45:00'),
('T-shirt', 'Cotton t-shirt', 20000, 2, '2024-04-01 08:40:00', '2024-04-01 08:45:00'),
('Office Chair', 'Ergonomic office chair', 150000, 3, '2024-04-01 08:40:00', '2024-04-01 08:45:00');

INSERT INTO purchaseOrders (idSupplier, idStatus, createdAt, updatedAt)
VALUES 
(2, 1, '2024-04-01 08:40:00', '2024-04-01 08:45:00'),
(2, 2, '2024-04-01 08:40:00', '2024-04-01 08:45:00');

INSERT INTO orderDetails (idPurchaseOrder, idProduct, quantity, price, createdAt, updatedAt)
VALUES 
(1, 1, 5, 245000, '2024-04-01 08:40:00', '2024-04-01 08:45:00'),
(1, 2, 10, 19000, '2024-04-01 08:40:00', '2024-04-01 08:45:00'),
(2, 3, 4, 140000, '2024-04-01 08:40:00', '2024-04-01 08:45:00');

INSERT INTO historyProductPrices (idProduct, price, createdAt, updatedAt)
VALUES 
(1, 2240000, '2024-04-01 08:40:00', '2024-04-01 08:45:00'),
(2, 18000, '2024-04-01 08:40:00', '2024-04-01 08:45:00'),
(3, 145000, '2024-04-01 08:40:00', '2024-04-01 08:45:00');

INSERT INTO invoices (idUser, total, createdAt, updatedAt)
VALUES 
(3, 300000, '2024-03-01 08:40:00', '2024-03-01 08:45:00'),
(3, 150000, '2024-04-01 08:40:00', '2024-04-01 08:45:00');

INSERT INTO invoicesDetails (idInvoice, idProduct, quantity, createdAt, updatedAt)
VALUES 
(1, 1, 1, '2024-04-01 08:40:00', '2024-04-01 08:45:00'),
(2, 3, 1, '2024-04-01 08:40:00', '2024-04-01 08:45:00');

INSERT INTO paymentMethods (methodName, createdAt, updatedAt)
VALUES 
('Credit Card', '2024-04-01 08:40:00', '2024-04-01 08:45:00'),
('PayPal', '2024-04-01 09:40:00', '2024-04-01 09:45:00'),
('efecctive', '2024-04-01 07:40:00', '2024-04-01 07:45:00');

INSERT INTO locations (locationName, idAddress, phone, email, createdAt, updatedAt)
VALUES 
('Warehouse A', 1, '3123454567', 'warehouseA@gmail.com', '2024-04-01 08:40:00', '2024-04-01 08:45:00'),
('Store B', 2, '3122345678', 'storeB@gmail.com', '2024-04-01 08:40:00', '2024-04-01 08:45:00');

INSERT INTO paymentGateways (idPaymentMethod, gateway, createdAt, updatedAt)
VALUES 
(1, 'Stripe', '2024-04-01 08:40:00', '2024-04-01 08:45:00'),
(2, 'PayPal Gateway', '2024-04-01 08:40:00', '2024-04-01 08:45:00');

INSERT INTO paymentGatewaysLocation (idLocation, idPaymentGateway, createdAt, updatedAt)
VALUES 
(1, 1, '2024-04-01 08:40:00', '2024-04-01 08:45:00'),
(2, 2, '2024-04-01 08:40:00', '2024-04-01 08:45:00');

INSERT INTO payments (idInvoice, amount, idPaymentMethod, paymentDate, `status`, idPaymentGatewaysLocation, createdAt, updatedAt)
VALUES 
(1, 3000000, 1, NOW(), 'Success', 1, '2024-04-01 08:40:00', '2024-04-01 08:45:00'),
(2, 150000, 2, NOW(), 'Pending', 2, '2024-04-01 08:40:00', '2024-04-01 08:45:00');

INSERT INTO parameters (`code`, `description`, createdAt, updatedAt)
VALUES 
('TAX', 'Tax Percentage', '2024-04-02 08:40:00', '2024-04-02 08:45:00'),
('SHIPPING', 'Shipping Cost', '2024-04-04 08:40:00', '2024-04-04 08:45:00');

INSERT INTO paymentGatewaysLocationParameter (idParameter, idPaymentGatewayLocation, `value`, createdAt, updatedAt)
VALUES 
(1, 1, '10%', '2024-04-01 08:40:00', '2024-04-01 08:45:00'),
(2, 2, '5.00', '2024-04-01 08:40:00', '2024-04-01 08:45:00');

INSERT INTO locationProduct (idProduct, idLocation, createdAt, updatedAt)
VALUES 
(1, 1, '2024-04-01 08:40:00', '2024-04-01 08:45:00'),
(2, 2, '2024-04-01 08:40:00', '2024-04-01 08:45:00');
