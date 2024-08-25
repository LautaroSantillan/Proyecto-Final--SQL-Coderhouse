#Inserción de datos a la DB
USE gamehub;

INSERT INTO PaymentMethod (Type) VALUES 
('Credit Card'),
('Debit Card'),
('Bank Transfer'),
('PayPal'),
('Cash');

INSERT INTO Platform (PlatformName) VALUES ('PC');
INSERT INTO Platform (PlatformName) VALUES ('PlayStation');
INSERT INTO Platform (PlatformName) VALUES ('XBOX');

INSERT INTO Category (CategoryName) VALUES 
('Action'),
('Adventure'),
('Arcade'),
('Sports'),
('Strategy'),
('Simulation'),
('RPG');

INSERT INTO VideoGame (Title, Descriptions, ReleaseDate, Price, Stock, ID_Platform, ID_Category) VALUES 
('Grand Theft Auto V', 'Open-world action game developed by Rockstar Games.', '2013-09-17', 29.99, 50, 2, 1),
('Star Wars: Outlaws', 'Upcoming open-world action game released by Ubisoft.', '2024-08-30', 70, 250, 1, 1),
('Red Dead Redemption 2', 'Open-world adventure game set in the Wild West, developed by Rockstar Games.', '2019-12-05', 59.99, 75, 2, 2),
('Minecraft', 'Sandbox construction game developed by Mojang Studios.', '2011-11-18', 12.75, 15, 3, 2),
('Pac-Man', 'Arcade game created by Toru Iwatani of Namco', '1980-05-22', 2.49, 10, 1, 3),
('Tetris', 'Soviet logic game originally designed by Alexey Pajitnov.', '1984-06-06', 1.25, 5, 1, 3),
('F1® 24', 'Racing game published by EA Sports. It is the 17th installment in the F1 series.', '2024-05-31', 52.99, 80, 2, 4),
('NBA 2K25', 'Upcoming basketball game based on the NBA. It is the 25th installment of the NBA 2K franchise.', '2024-09-06', 59.99, 50, 1, 4),
('Hearts of Iron IV', 'Complex war strategy game developed by Paradox Development Studio.', '2014-06-06', 29.99, 30, 1, 5),
('Age of Empires II: Definitive Edition', 'Strategy game published by Xbox Game Studios.', '2019-11-14', 9.99, 18, 3, 5),
('EA SPORTS FC™ 25', 'Upcoming football game by Electronic Arts. It will be the 32nd installment in the football simulation series.', '2024-09-27', 75, 500, 2, 6),
('Euro Truck Simulator 2', 'Travel across Europe as a king of the road, a trucker delivering important cargo over impressive distances.', '2018-10-18', 10.09, 30, 1, 6),
('Baldur´s Gate 3', 'RPG developed by Larian Studios. It is the third main installment in the Baldur´s Gate series.', '2023-08-03', 34.50, 125, 2, 7),
('Elden Ring', 'Action RPG developed by FromSoftware.', '2023-02-24', 47.99, 115, 1, 7);

INSERT INTO Customer (FirstName, LastName, DNI, Email, Location, Phone, ID_PaymentMethod) VALUES 
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

INSERT INTO `Order` (OrderDate, State, TotalAmount, ID_Customer) VALUES
('2024-08-04', 'Delivered', 112.98, 1),
('2024-08-05', 'Delivered', 89.98, 2),
('2024-08-06', 'Pending', 70.00, 3),
('2024-08-07', 'Delivered', 15.24, 4),
('2024-08-07', 'Pending', 1.25, 5),
('2024-08-08', 'Delivered', 52.99, 6),
('2024-08-08', 'Pending', 59.99, 7),
('2024-08-09', 'Delivered', 39.98, 8),
('2024-08-09', 'Pending', 75.00, 9),
('2024-08-10', 'Pending', 34.50, 10);

INSERT INTO OrderDetail (ID_Order, ID_VideoGame, Quantity, UnitPrice) VALUES
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
