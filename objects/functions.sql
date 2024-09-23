#Creación de functions en la DB
USE gamehub;

--

DROP FUNCTION IF EXISTS fn_TotalSalesByCustomer;
# Calcular el total de ventas por cliente.
DELIMITER //
CREATE FUNCTION fn_TotalSalesByCustomer(customerID INT) RETURNS DECIMAL(10, 2)
	DETERMINISTIC
BEGIN
		DECLARE total DECIMAL(10, 2);
		SELECT SUM(TotalAmount) INTO total
		FROM `Order`
		WHERE ID_Customer = customerID;
	RETURN total;
END //
DELIMITER ;

SELECT fn_TotalSalesByCustomer(1) FROM DUAL;

--

DROP FUNCTION IF EXISTS fn_CalculateVIPDiscount;
# Aplicar un descuento del 10% en el monto total de un pedido si el cliente tiene más de 5 pedidos.
DELIMITER //
CREATE FUNCTION fn_CalculateVIPDiscount(ID_Customer INT, MontoTotal DECIMAL(10, 2)) RETURNS DECIMAL(10, 2)
DETERMINISTIC
BEGIN
    DECLARE totalPedidos INT;
    DECLARE descuento DECIMAL(10, 2);

    SELECT COUNT(*)
    INTO totalPedidos
    FROM `Order`
    WHERE ID_Customer = ID_Customer;

    IF totalPedidos > 5 THEN
        SET descuento =  MontoTotal * 0.90;
    ELSE
        SET descuento = 0;
    END IF;

    RETURN descuento;
END //
DELIMITER ;

SELECT fn_CalculateVIPDiscount(1, 112.98) FROM DUAL;

--

DROP FUNCTION IF EXISTS fn_ValidateEmail;
# Si el correo electrónico de un cliente contiene @example, lo reemplazará por @gmail.
DELIMITER //
CREATE FUNCTION fn_ValidateEmail(email_input VARCHAR(100))
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
    IF email_input LIKE '%@example%' THEN
        RETURN REPLACE(email_input, '@example', '@gmail');
    ELSE
        RETURN email_input;
    END IF;
END //
DELIMITER ;
