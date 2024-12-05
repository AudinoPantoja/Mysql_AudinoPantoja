use inventory3;

CREATE USER 'AudinoPantoja'@'localhost' IDENTIFIED BY '123456789';

CREATE ROLE 'Admin';

GRANT 'Lector' TO 'AudinoPantoja'@'localhost';
GRANT 'Admin' TO 'AudinoPantoja'@'localhost';

grant select on users to 'lector';

grant select, insert, update, delete on users to 'Admin';

-- encriptar la contraseña de user
alter table users modify column `password` varbinary(255);

update users
set `password` = AES_ENCRYPT(`password`, '123456789')
where users.id = 1;

select hex(password) from users where users.id = 1;

select users.id , CAST(AES_DECRYPT(`password`, '123456789') as char) as password
from users 
where users.id = 1;
-- encriptar un valor simple
set @plaintext = '123456789';
set @ciphertext = aes_encrypt(@plaintext, '123456789');

select hex(@ciphertext);
-- descencriptar el valor
select CAST(AES_DECRYPT(@ciphertext, '123456789') as char);

-- establecer politica de las contraseñas

alter user 'AudinoPantoja'@'localhost' password expire interval 90 day;

-- auditorias de acciones
-- en mysql, puede habilitar la auditoria (si esta soportado) 
SHOW plugins;
SELECT version ();
-- activa la auditoria
set global general_log = 'on';
show variables like 'general_log%';
