#Creación de stored procedures en la DB
USE gamehub;

--

DROP PROCEDURE IF EXISTS sp_UpdateOrderState;
# Actualizar el estado de un pedido, útil para gestionar el flujo de entrega.
DELIMITER //
CREATE PROCEDURE sp_UpdateOrderState (
    IN orderID INT, 
    IN newState ENUM('Pending', 'Delivered')
)
BEGIN
    IF newState IN ('Pending', 'Delivered') THEN
        UPDATE `Order`
        SET State = newState
        WHERE ID_Order = orderID;
    ELSE
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Estado no válido. Debe ser "Pending" o "Delivered".';
    END IF;
END //
DELIMITER ;

--

DROP PROCEDURE IF EXISTS sp_UpdateVideoGamePrice;
# Actualizar el precio de un videojuego segun su ID.
DELIMITER //
CREATE PROCEDURE sp_UpdateVideoGamePrice (
    IN gameID INT, 
    IN newPrice DECIMAL(10,2)
)
BEGIN
    DECLARE currentPrice DECIMAL(10,2);

    SELECT Price INTO currentPrice
    FROM VideoGame
    WHERE ID_VideoGame = gameID;

    IF newPrice <= 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El precio debe ser mayor que 0.';
    ELSEIF newPrice <= currentPrice THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El nuevo precio debe ser mayor que el precio actual.';
    ELSE
        UPDATE VideoGame
        SET Price = newPrice
        WHERE ID_VideoGame = gameID;
    END IF;
END //
DELIMITER ;
