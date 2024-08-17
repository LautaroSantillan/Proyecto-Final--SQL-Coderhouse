#Creación de la DB
CREATE DATABASE ecommerce_coderhouse;
USE ecommerce_coderhouse;

#Creación de las tablas
CREATE TABLE MetodoPago (
    ID_MetodoPago INT PRIMARY KEY AUTO_INCREMENT,
    Tipo VARCHAR(50) NOT NULL
);

CREATE TABLE Cliente (
    ID_Cliente INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(75) NOT NULL,
    Apellido VARCHAR(75) NOT NULL,
    DNI INT NOT NULL UNIQUE,
    Email VARCHAR(100) NOT NULL,
    Ubicacion VARCHAR(100),
    Telefono VARCHAR(20),
    ID_MetodoPago INT,
    FOREIGN KEY (ID_MetodoPago) REFERENCES MetodoPago(ID_MetodoPago)
);

CREATE TABLE Pedido (
    ID_Pedido INT PRIMARY KEY AUTO_INCREMENT,
    Fecha DATE NOT NULL,
    Estado ENUM('Pendiente', 'Entregado') NOT NULL,
    Monto_Total DECIMAL(10, 2) NOT NULL,
    ID_Cliente INT,
    FOREIGN KEY (ID_Cliente) REFERENCES Cliente(ID_Cliente)
);

CREATE TABLE Plataforma (
    ID_Plataforma INT PRIMARY KEY AUTO_INCREMENT,
    Nombre_Plataforma VARCHAR(15) NOT NULL
);

CREATE TABLE Categoria (
    ID_Categoria INT PRIMARY KEY AUTO_INCREMENT,
    Nombre_Categoria VARCHAR(50) NOT NULL
);

CREATE TABLE Videojuego (
    ID_Videojuego INT PRIMARY KEY AUTO_INCREMENT,
    Titulo VARCHAR(100) NOT NULL,
    Descripcion VARCHAR(150) NOT NULL,
    Fecha_Lanzamiento DATE,
    Precio DECIMAL(10, 2) NOT NULL,
    Stock INT NOT NULL,
    ID_Plataforma INT,
    ID_Categoria INT,
    FOREIGN KEY (ID_Plataforma) REFERENCES Plataforma(ID_Plataforma),
    FOREIGN KEY (ID_Categoria) REFERENCES Categoria(ID_Categoria)
);

CREATE TABLE DetallePedido (
    ID_Detalle INT PRIMARY KEY AUTO_INCREMENT,
    ID_Pedido INT,
    ID_Videojuego INT,
    Cantidad INT NOT NULL,
    Precio_Unitario DECIMAL(10, 2) NOT NULL,
    Subtotal DECIMAL(10, 2) AS (Cantidad * Precio_Unitario) STORED,
    FOREIGN KEY (ID_Pedido) REFERENCES Pedido(ID_Pedido),
    FOREIGN KEY (ID_Videojuego) REFERENCES Videojuego(ID_Videojuego)
);
