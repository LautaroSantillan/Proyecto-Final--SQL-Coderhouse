DROP DATABASE IF EXISTS gameHub;
# Creación de la base de datos
CREATE DATABASE gameHub;
USE gameHub;

# Creación de las tablas
CREATE TABLE PaymentMethod (
    ID_PaymentMethod INT PRIMARY KEY AUTO_INCREMENT,
    Type VARCHAR(50) NOT NULL
);

CREATE TABLE Customer (
    ID_Customer INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(75) NOT NULL,
    LastName VARCHAR(75) NOT NULL,
    DNI INT NOT NULL UNIQUE,
    Email VARCHAR(100) NOT NULL,
    Location VARCHAR(100),           -- Ubicacion
    Phone VARCHAR(20),               -- Telefono
    ID_PaymentMethod INT,
    FOREIGN KEY (ID_PaymentMethod) REFERENCES PaymentMethod(ID_PaymentMethod)
);

CREATE TABLE `Order` (
    ID_Order INT PRIMARY KEY AUTO_INCREMENT,
    OrderDate DATE NOT NULL,          				-- Fecha
    State ENUM('Pending', 'Delivered') NOT NULL, 	-- Estado
    TotalAmount DECIMAL(10, 2) NOT NULL, 			-- Monto_Total
    ID_Customer INT,
    FOREIGN KEY (ID_Customer) REFERENCES Customer(ID_Customer)
);

CREATE TABLE Platform (
    ID_Platform INT PRIMARY KEY AUTO_INCREMENT,
    PlatformName VARCHAR(15) NOT NULL   -- Nombre_Plataforma
);

CREATE TABLE Category (
    ID_Category INT PRIMARY KEY AUTO_INCREMENT,
    CategoryName VARCHAR(50) NOT NULL  -- Nombre_Categoria
);

CREATE TABLE VideoGame (
    ID_VideoGame INT PRIMARY KEY AUTO_INCREMENT,
    Title VARCHAR(100) NOT NULL,
    Descriptions VARCHAR(150) NOT NULL,
    ReleaseDate DATE,                  -- Fecha_Lanzamiento
    Price DECIMAL(10, 2) NOT NULL,
    Stock INT NOT NULL,
    ID_Platform INT,
    ID_Category INT,
    FOREIGN KEY (ID_Platform) REFERENCES Platform(ID_Platform),
    FOREIGN KEY (ID_Category) REFERENCES Category(ID_Category)
);

CREATE TABLE OrderDetail (
    ID_OrderDetail INT PRIMARY KEY AUTO_INCREMENT,
    ID_Order INT,
    ID_VideoGame INT,
    Quantity INT NOT NULL,             -- Cantidad
    UnitPrice DECIMAL(10, 2) NOT NULL, -- Precio_Unitario
    Subtotal DECIMAL(10, 2) AS (Quantity * UnitPrice) STORED,
    FOREIGN KEY (ID_Order) REFERENCES `Order`(ID_Order),
    FOREIGN KEY (ID_VideoGame) REFERENCES VideoGame(ID_VideoGame)
);
