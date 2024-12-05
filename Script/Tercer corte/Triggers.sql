-- Trigger para actualizar la fecha de actualización (updatedAt) en users cuando se modifica un registro
DELIMITER //
CREATE TRIGGER before_user_update
BEFORE UPDATE ON users
FOR EACH ROW
BEGIN
    SET NEW.updatedAt = NOW();
END //
DELIMITER ;

drop trigger if exists before_user_update;

-- Trigger para registrar automáticamente un historial de precios cuando el precio de un producto cambia
DELIMITER //
CREATE TRIGGER after_product_price_update
AFTER UPDATE ON products
FOR EACH ROW
BEGIN
    IF OLD.price != NEW.price THEN
        INSERT INTO historyProductPrices (idProduct, price, createdAt, updatedAt)
        VALUES (NEW.id, NEW.price, NOW(), NOW());
    END IF;
END //
DELIMITER ;

-- Trigger para actualizar el total de una factura al agregar un nuevo detalle de factura
DELIMITER //
CREATE TRIGGER after_invoice_detail_insert
AFTER INSERT ON invoicesDetails
FOR EACH ROW
BEGIN
    -- Actualizar el total de la factura sumando el precio del nuevo detalle
    UPDATE invoices
    SET total = total + (NEW.quantity * NEW.price), updatedAt = NOW()
    WHERE id = NEW.idInvoice;
END //
DELIMITER ;

-- Trigger para la validación de precio de producto positivo antes de inserción
DELIMITER //
CREATE TRIGGER before_product_insert
BEFORE INSERT ON products
FOR EACH ROW
BEGIN
    -- Comprobar si el precio es negativo
    IF NEW.price < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El precio del producto no puede ser negativo';
    END IF;
END //
DELIMITER ;
