select * from products;
select * from historyproductprices;
select * from productcategories;
select * from invoices;
select * from payments;
select * from users;
select * from userroles;


UPDATE users
SET userName = 'NewPrueba'
WHERE id = 4;

UPDATE products
SET price = 999000
WHERE id = 1;


INSERT INTO products (name, description, price, idCategory, createdAt, updatedAt)
VALUES ('ProdPrueba', 'Nuevo producto', 888000.00, 1, NOW(), NOW());

SELECT u.userName, r.roleName
FROM users u
LEFT JOIN userRoles ur ON u.id = ur.idUser
LEFT JOIN roles r ON ur.idRole = r.id;


