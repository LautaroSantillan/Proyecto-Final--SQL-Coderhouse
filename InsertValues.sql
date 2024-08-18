#Inserción de datos a la DB
USE ecommerce_coderhouse;

INSERT INTO MetodoPago (Tipo) VALUES 
('Tarjeta de crédito'),
('Tarjeta de débito'),
('Transferencia bancaria'),
('PayPal'),
('Efectivo');

INSERT INTO Plataforma (Nombre_Plataforma) VALUES ('PC');
INSERT INTO Plataforma (Nombre_Plataforma) VALUES ('PlayStation');
INSERT INTO Plataforma (Nombre_Plataforma) VALUES ('XBOX');

INSERT INTO Categoria (Nombre_Categoria) VALUES 
('Acción'),
('Aventura'),
('Arcade'),
('Deportivo'),
('Estrategia'),
('Simulación'),
('RPG');

INSERT INTO Videojuego (Titulo, Descripcion, Fecha_Lanzamiento, Precio, Stock, ID_Plataforma, ID_Categoria) VALUES 
('Grand Theft Auto V', 'Es un videojuego de acción de mundo abierto desarrollado por Rockstar Games.', '2013-09-17', 29.99, 50, 2, 1),
('Star Wars: Outlaws', 'Próximo videojuego de mundo abierto y de acción lanzado por Ubisoft.', '2024-08-30', 70, 250, 1, 1),
('Red Dead Redemption 2', 'Videojuego de aventura de mundo abierto con temática del Salvaje Oeste desarrollado por Rockstar Games.', '2019-12-05', 59.99, 75, 2, 2),
('Minecraft', 'Es un videojuego de construcción de tipo sandbox creado por Mojang Studios.', '2011-11-18', 12.75, 15, 3, 2),
('Pac-Man', 'Videojuego arcade creado por el diseñador de videojuegos Toru Iwatani de la empresa Namco', '1980-05-22', 2.49, 10, 1, 3),
('Tetris', 'Es un videojuego de lógica soviético originalmente diseñado y programado por Alekséi Pázhitnov.', '1984-06-06', 1.25, 5, 1, 3),
('F1® 24', 'Videojuego de carreras publicado por EA Sports. Es la 17ª entrega de la serie F1.', '2024-05-31', 52.99, 80, 2, 4),
('NBA 2K25', 'Próximo videojuego de baloncesto, basado en la NBA​. Es la 25ª entrega de la franquicia NBA 2K​.', '2024-09-06', 59.99, 50, 1, 4),
('Hearts of Iron IV', 'Videojuego de estrategia bélica compleja desarrollado por Paradox Development Studio.', '2014-06-06', 29.99, 30, 1, 5),
('Age of Empires II: Definitive Edition', 'Es un videojuego de estrategia publicado por Xbox Game Studios.', '2019-11-14', 9.99, 18, 3, 5),
('EA SPORTS FC™ 25', 'Próximo videojuego de fútbol por Electronic Arts. Será la 32ª entrega de los juegos de simulación de fútbol.', '2024-09-27', 75, 500, 2, 6),
('Euro Truck Simulator 2', 'Viaja por Europa como el rey de la carretera, un camionero que entrega carga importante a través de distancias impresionantes.', '2018-10-18', 10.09, 30, 1, 6),
('Baldur´s Gate 3', 'Videojuego de rol desarrollado por Larian Studios. Representa la tercera entrega principal de la serie Baldur´s Gate.', '2023-08-03', 34.50, 125, 2, 7),
('Elden Ring', 'Es un videojuego de rol de acción desarrollado por FromSoftware.', '2023-02-24', 47.99, 115, 1, 7);

INSERT INTO Cliente (Nombre, Apellido, DNI, Email, Ubicacion, Telefono, ID_MetodoPago) VALUES 
('Lautaro', 'Santillan', 45175053, 'santillanlautaro03@gmail.com', 'Buenos Aires', '11 6579-9996', 2),
('Juan', 'Pérez', 12345678, 'juan.perez@example.com', 'Buenos Aires', '15 1234-5678', 1),
('Maria', 'Gómez', 87654321, 'maria.gomez@example.com', 'Córdoba', '8765-4321', 2),
('Carlos', 'Rodríguez', 11223344, 'carlos.rodriguez@example.com', 'Rosario', '1122-3344', 3),
('Ana', 'Martínez', 22334455, 'ana.martinez@example.com', 'Mendoza', '2233-4455', 4),
('Luis', 'Fernández', 33445566, 'luis.fernandez@example.com', 'La Plata', '3344-5566', 5),
('Elena', 'Sánchez', 44556677, 'elena.sanchez@example.com', 'San Juan', '4455-6677', 1),
('Ricardo', 'González', 55667788, 'ricardo.gonzalez@example.com', 'Salta', '5566-7788', 2),
('Lucía', 'Ramírez', 66778899, 'lucia.ramirez@example.com', 'Santa Fe', '6677-8899', 3),
('Javier', 'Roldán', 43129004, 'javier.roldan@example.com', 'Rosario', '3456-7890', 1);

INSERT INTO Pedido (Fecha, Estado, Monto_Total, ID_Cliente) VALUES
('2024-08-04', 'Entregado', 112.98, 1),
('2024-08-05', 'Entregado', 89.98, 2),
('2024-08-06', 'Pendiente', 70.00, 3),
('2024-08-07', 'Entregado', 15.24, 4),
('2024-08-07', 'Pendiente', 1.25, 5),
('2024-08-08', 'Entregado', 52.99, 6),
('2024-08-08', 'Pendiente', 59.99, 7),
('2024-08-09', 'Entregado', 39.98, 8),
('2024-08-09', 'Pendiente', 75.00, 9),
('2024-08-10', 'Pendiente', 34.50, 10);

INSERT INTO DetallePedido (ID_Pedido, ID_Videojuego, Cantidad, Precio_Unitario) VALUES
(1, 3, 1, 59.99),
(1, 7, 1, 52.99),
(2, 1, 1, 29.99),
(2, 3, 1, 59.99),
(3, 2, 1, 70.00),
(4, 4, 1, 12.75),
(4, 5, 1, 2.49),
(5, 6, 1, 1.25),
(6, 7, 1, 52.99),
(7, 8, 1, 59.99),
(8, 9, 1, 29.99),
(8, 10, 1, 9.99),
(9, 11, 1, 75.00),
(10, 12, 1, 34.50);
