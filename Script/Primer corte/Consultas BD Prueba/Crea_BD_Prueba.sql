CREATE DATABASE IF NOT EXISTS Prueba;
USE Prueba;
CREATE TABLE compradores (
idcomprador int,
nombres varchar (45),
apellidos varchar(45),
correo varchar(45),
telefono varchar(45),
direccion varchar(45),
createdAt date,
updatedAt date
);