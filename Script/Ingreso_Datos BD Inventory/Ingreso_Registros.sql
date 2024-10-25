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
INSERT INTO people (idType, identificationNumber, firstName, secondName, lastName1, lastName2, phone, email, idAddress, createdAt, updatedAt)
VALUES 
(1, '1127074567', 'Carlos', 'Alberto', 'Diaz', 'Solarte', '3205453423', 'carlos@gmail.com', 1, '2024-05-20 12:00:00', '2024-05-20 12:15:00'),
(2, '98765223', 'Janeth', NULL, 'Ruiz', NULL, '3124562314', 'janeth@gmail.com', 2, '2024-06-25 09:30:00', '2024-06-25 09:45:00'),
(3, '1000345234', 'Andres', 'Felipe', 'Rosales', NULL, '3165562314', 'andres@hotmail.com', 3, '2024-07-25 09:30:00', '2024-07-25 09:45:00'),
(4, '900244062-9', 'Cda', NULL, 'Putumayo', NULL, '3100562314', 'cdaputumayo1@hotmail.com', 2, '2024-08-25 09:30:00', '2024-08-25 09:45:00'),
(1, '1124864567', 'Julian', 'Steven', 'Pantoja', 'Fernandez', '3205453423', 'julians@gmail.com', 3, '2024-05-20 12:00:00', '2024-05-20 12:15:00');

-- Insertar datos en la tabla users y asignar roles
-- Aseguramos que no se repita el username 'carlos'
INSERT INTO users (idPerson, idRole, userName, `password`, createdAt, updatedAt)
VALUES 
(1, 2, 'carlosA', 'vbcd123', '2024-07-01 11:00:00', '2024-07-01 11:10:00'),  -- Carlos es un Supplier
(2, 4, 'janethR', 'asd123', '2024-08-10 08:50:00', '2024-08-10 09:00:00'),   -- Janeth es Customer
(3, 3, 'andresR', '12334', '2024-09-10 08:50:00', '2024-09-10 09:00:00'),    -- Andres es Seller
(4, 2, 'cdaputumayo', 'qwer1234', '2024-10-10 08:50:00', '2024-10-10 09:00:00'), -- Cda es un Supplier
(5, 2, 'julianP', 'pass456', '2024-10-15 08:50:00', '2024-10-15 09:00:00');  -- Julian es un Supplier

-- Insertar datos en la tabla suppliers
-- Carlos, Cda y Julian son suppliers, con el rol 2 asignado en la tabla users
INSERT INTO suppliers (idPerson, createdAt, updatedAt) 
VALUES 
(1, '2024-01-01 10:00:00', '2024-01-01 10:15:00'),  -- Carlos
(4, '2024-01-02 10:00:00', '2024-01-02 10:15:00'),  -- Cda
(5, '2024-01-03 10:00:00', '2024-01-03 10:15:00');  -- Julian

-- Insertar datos en la tabla productCategories
INSERT INTO productCategories (categoryName, `description`, createdAt, updatedAt)
VALUES 
('Electronics', 'Electronic devices and gadgets', '2024-09-05 14:00:00', '2024-09-05 14:10:00'), 
('Clothing', 'Apparel and clothing', '2024-09-10 15:20:00', '2024-09-10 15:30:00'), -- cualquier tipo de ropa o vestimenta.
('Home Appliances', 'Appliances for home use', '2024-10-01 12:00:00', '2024-10-01 12:15:00'); -- Electrodomesticos de hogar

-- Insertar datos en la tabla products
INSERT INTO products (productName, descriptionProduct, idCategory, createdAt, updatedAt)
VALUES 
('Laptop', 'High performance laptop', 1, '2024-10-01 16:00:00', '2024-10-01 16:15:00'), 
('T-shirt', '100% cotton t-shirt', 2, '2024-10-05 11:30:00', '2024-10-05 11:45:00'),
('blender', 'Effective crushing', 3, '2024-10-05 12:30:00', '2024-10-05 12:45:00');

-- Insertar datos en la tabla historyProductPrices
INSERT INTO historyProductPrices (idProduct, price, effectiveDate, createdAt, updatedAt)
VALUES 
(1, 1200000, '2024-01-03', '2024-01-03 10:00:00', '2024-01-03 10:15:00'), 
(2, 20990, '2024-02-01', '2024-02-01 11:00:00', '2024-02-01 11:15:00'),
(3, 150000, '2024-03-01', '2024-03-01 10:00:00', '2024-03-01 10:15:00');

-- Insertar datos en la tabla purchaseOrders
-- Asignar una orden a Carlos y a Julian (suppliers con idPerson 1 y 5)
INSERT INTO purchaseOrders (idSupplier, orderDate, idOrderStatus, createdAt, updatedAt)
VALUES 
(1, '2024-02-15', 1, '2024-02-15 14:00:00', '2024-02-15 14:15:00'),   -- Orden de Carlos
(3, '2024-03-20', 2, '2024-03-20 14:00:00', '2024-03-20 14:15:00');   -- Orden de Julian

-- Insertar datos en la tabla orderDetails
-- Los detalles de las órdenes asignadas a Carlos y Julian
INSERT INTO orderDetails (idPurchaseOrder, idProduct, quantity, unitPrice, createdAt, updatedAt)
VALUES 
(1, 1, 2, 1200000, '2024-03-01 12:30:00', '2024-03-01 12:45:00'), 
(1, 2, 5, 20990, '2024-03-01 13:00:00', '2024-03-01 13:15:00'), 
(2, 1, 1, 115000, '2024-03-22 14:00:00', '2024-03-22 14:15:00'), 
(2, 2, 3, 19.99, '2024-03-22 15:00:00', '2024-03-22 15:15:00');
