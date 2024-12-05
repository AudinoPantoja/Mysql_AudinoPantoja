-- Procedimiento para agregar un nuevo usuario
DELIMITER //
CREATE PROCEDURE addUser(
    IN userName VARCHAR(45),
    IN userPassword VARCHAR(60),
    IN roleId INT
)
BEGIN
   DECLARE newUserId INT;
-- Insertar nuevo usuario en la tabla 'users'
    INSERT INTO users (userName, `password`, createdAt, updatedAt)
    VALUES (userName, userPassword, NOW(), NOW());
-- Obtener el ID del usuario recién insertado
    SET newUserId = LAST_INSERT_ID();
-- Asignar el rol al nuevo usuario en la tabla 'userRoles'
    INSERT INTO userRoles (idUser, idRole, createdAt, updatedAt)
    VALUES (newUserId, roleId, NOW(), NOW());
END //
DELIMITER ;
CALL addUser('AudinoP', '1454ASDF', 2);

-- Procedimiento para actualizar el precio de un producto y registrar el historial de precios
DELIMITER //
CREATE PROCEDURE updateProductPrice(
    IN productId INT,
    IN newPrice DECIMAL(10, 2)
)
BEGIN
    -- Registrar el historial de precio
    INSERT INTO historyProductPrices (idProduct, price, createdAt, updatedAt)
    VALUES (productId, newPrice, NOW(), NOW());
    
    -- Actualizar el precio del producto
    UPDATE products
    SET price = newPrice, updatedAt = NOW()
    WHERE id = productId;
END //
DELIMITER ;

CALL updateProductPrice (1, 88000);

-- Procedimiento para obtener todos los productos en una categoría específica
DELIMITER //
CREATE PROCEDURE getProductsByCategory(
    IN categoryName VARCHAR(45)
)
BEGIN
    SELECT p.id, p.name, p.description, p.price
    FROM products p
    INNER JOIN productCategories pc ON p.idCategory = pc.id
    WHERE pc.categoryName = categoryName;
END //
DELIMITER ;

CALL getProductsByCategory ('Clothing');

-- Procedimiento para registrar un pago de factura
DELIMITER //
CREATE PROCEDURE registerPayment(
    IN invoiceId INT,
    IN paymentAmount DECIMAL(10, 2),
    IN paymentMethodId INT,
    IN paymentStatus VARCHAR(45),
    IN paymentGatewaysLocationId INT
)
BEGIN
    -- Insertar el registro de pago con el campo idPaymentGatewaysLocation
    INSERT INTO payments (idInvoice, amount, idPaymentMethod, paymentDate, `status`, idPaymentGatewaysLocation, createdAt, updatedAt)
    VALUES (invoiceId, paymentAmount, paymentMethodId, NOW(), paymentStatus, paymentGatewaysLocationId, NOW(), NOW());

    -- Si el estado del pago es 'Completed', actualizar la factura
    IF paymentStatus = 'Completed' THEN
        UPDATE invoices
        SET total = total + paymentAmount, updatedAt = NOW()
        WHERE id = invoiceId;
    END IF;
END //
DELIMITER ;

CALL registerPayment(1, 444000, 1, 'Completed',1);



