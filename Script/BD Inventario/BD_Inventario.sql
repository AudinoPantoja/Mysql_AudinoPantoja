DROP SCHEMA  IF EXISTS Inventario;
CREATE DATABASE IF NOT EXISTS Inventario;
USE Inventario;

CREATE TABLE tipo_identificacion(
tipo_identificacion_id INT PRIMARY KEY AUTO_INCREMENT,
tipo_identificacion VARCHAR(4) NOT NULL	 
);

CREATE TABLE Proveedores (
    proveedor_id INT PRIMARY KEY AUTO_INCREMENT,
    tipo_identificacion_id INT NOT NULL,
    identificacion VARCHAR(12) NOT NULL,    
    nombres VARCHAR(45) NOT NULL,
    primer_apellido VARCHAR(45),
    segundo_apellido VARCHAR(45),
    telefono VARCHAR(12),
    email VARCHAR(45),
    direccion VARCHAR(45),
    FOREIGN KEY (tipo_identificacion_id) REFERENCES tipo_identificacion(tipo_identificacion_id)
);

CREATE TABLE Productos (
    producto_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(45) NOT NULL,
    descripcion TEXT,
    precio_base DECIMAL(10, 2) NOT NULL
);

CREATE TABLE OrdenesCompra (
    orden_id INT PRIMARY KEY AUTO_INCREMENT,
    proveedor_id INT NOT NULL,
    fecha DATE NOT NULL,
    FOREIGN KEY (proveedor_id) REFERENCES Proveedores(proveedor_id)
);

CREATE TABLE DetalleOrdenCompra (
    detalle_id INT PRIMARY KEY AUTO_INCREMENT,
    orden_id INT NOT NULL,
    producto_id INT NOT NULL,
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(10, 2) NOT NULL,
    Precio_total DECIMAL(10, 2) GENERATED ALWAYS AS (cantidad * precio_unitario) STORED,
    FOREIGN KEY (orden_id) REFERENCES OrdenesCompra(orden_id),
    FOREIGN KEY (producto_id) REFERENCES Productos(producto_id)
);
