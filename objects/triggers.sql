#Creación de triggers en la DB
USE gamehub;

--

CREATE TABLE StockAudit (
    ID_Audit INT PRIMARY KEY AUTO_INCREMENT,
    ID_VideoGame INT,
    Fecha DATETIME,
    StockAnterior INT,
    StockNuevo INT,
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

--

# Actualizar el stock después de cada venta.
DELIMITER //
CREATE TRIGGER gamehub.after_update_AuditStockChange
	AFTER UPDATE ON VideoGame
	FOR EACH ROW
BEGIN
	IF NEW.Stock <> OLD.Stock THEN
		INSERT INTO StockAudit (ID_VideoGame, Fecha, StockAnterior, StockNuevo)
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

DELIMITER ;
