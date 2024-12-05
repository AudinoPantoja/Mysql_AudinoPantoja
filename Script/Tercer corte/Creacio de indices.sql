-- indice clustered
CREATE INDEX idx_idUser ON people(idUser);

SELECT * FROM people WHERE idUser = 1;

SELECT * FROM people WHERE idUser BETWEEN 1 AND 2;

-- indice non-clustered
CREATE INDEX idx_users_createdAt ON users (createdAt);

-- Consulta 
SELECT * FROM users WHERE createdAt > '2024-11-01';

-- 2
CREATE INDEX idx_payments_paymentDate ON payments (paymentDate);

-- Consulta 
SELECT * FROM payments 
WHERE paymentDate BETWEEN '2024-01-01' AND '2024-12-31';


-- indice único
CREATE UNIQUE INDEX idx_unique_userName ON users (userName);

-- Consulta 
SELECT * FROM users WHERE userName = 'supplier_user';

-- 2
CREATE UNIQUE INDEX idx_unique_statusName ON orderstatus (name);

SELECT * FROM orderstatus WHERE name = 'pending';

-- 3
CREATE UNIQUE INDEX idx_unique_order_product ON orderDetails (idPurchaseOrder, idProduct);

-- Consulta 
SELECT * FROM orderDetails 
WHERE idPurchaseOrder = 1 AND idProduct = 2;


-- indice compuesto
CREATE INDEX idx_products_name_category ON products (name, idCategory);

-- Consulta 
SELECT * FROM products WHERE name LIKE 'off%' AND idCategory = 3;

-- 2
CREATE INDEX idx_invoices_user_date ON invoices (idUser, createdAt);

-- Consulta 
SELECT * FROM invoices 
WHERE idUser = 3 AND createdAt BETWEEN '2024-03-01' AND '2024-04-01';

-- 3
CREATE INDEX idx_payments_invoice_method ON payments (idInvoice, idPaymentMethod);

-- Consulta 
SELECT * FROM payments 
WHERE idInvoice = 1 AND idPaymentMethod = 1;


