#Creación de triggers en la DB
USE gamehub;

--

DROP TABLE IF EXISTS StockAudit;
CREATE TABLE StockAudit (
    ID_Audit INT PRIMARY KEY AUTO_INCREMENT,
    ID_VideoGame INT,
    DateStUp DATETIME,
    OldStock INT,
    NewStock INT,
    FOREIGN KEY (ID_VideoGame) REFERENCES VideoGame(ID_VideoGame)
);
/* 
	Si el stock ha cambiado, se guarda un registro con el ID del videojuego, la fecha, el stock anterior 
	y el nuevo stock en la tabla de auditoría.
*/

--

DROP TRIGGER IF EXISTS gamehub.after_update_AuditStockChange;
DROP TRIGGER IF EXISTS gamehub.after_insert_ReduceStockAfterOrderDetail;
DROP TRIGGER IF EXISTS gamehub.after_delete_RestoreStockAfterOrderDeletion;
DROP TRIGGER IF EXISTS gamehub.before_insert_CustomerEmail;

--

# Actualizar el stock después de cada venta.
DELIMITER //
CREATE TRIGGER gamehub.after_update_AuditStockChange
	AFTER UPDATE ON VideoGame
	FOR EACH ROW
BEGIN
	IF NEW.Stock <> OLD.Stock THEN
		INSERT INTO StockAudit (ID_VideoGame, DateStUp, OldStock, NewStock)
		VALUES (NEW.ID_VideoGame, NOW(), OLD.Stock, NEW.Stock);
	END IF;
END //

--

# Reducir el stock de un videojuego cuando se inserte un nuevo 'OrderDetail'.
CREATE TRIGGER gamehub.after_insert_ReduceStockAfterOrderDetail
	AFTER INSERT ON OrderDetail
	FOR EACH ROW
BEGIN
    UPDATE VideoGame
    SET Stock = Stock - NEW.Quantity
    WHERE ID_VideoGame = NEW.ID_VideoGame;
END //

# Restaurar el stock del videojuego correspondiente cuando se elimine un 'OrderDetail'.
CREATE TRIGGER gamehub.after_delete_RestoreStockAfterOrderDeletion
	AFTER DELETE ON OrderDetail
	FOR EACH ROW
BEGIN
    UPDATE VideoGame
    SET Stock = Stock + OLD.Quantity
    WHERE ID_VideoGame = OLD.ID_VideoGame;
END //

# Verificar si un email contiene @example y cambiarlo por @gmail.
CREATE TRIGGER gamehub.before_insert_CustomerEmail
	BEFORE INSERT ON Customer
	FOR EACH ROW
BEGIN
    SET NEW.email = fn_ValidateEmail(NEW.email);
END //

DELIMITER ;
