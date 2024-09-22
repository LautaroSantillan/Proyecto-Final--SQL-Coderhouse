#Creación de views en la DB
USE gamehub;
--
DROP VIEW IF EXISTS vw_CustomerPayment;
# Visualizar los clientes junto con sus métodos de pago para informes de facturación o ventas.
CREATE VIEW vw_CustomerPayment 
AS
	SELECT 
		c.ID_Customer, 
		c.FirstName, 
		c.LastName, 
		c.Email, 
		pm.Type AS PaymentMethod
	FROM Customer c
	JOIN PaymentMethod pm ON c.ID_PaymentMethod = pm.ID_PaymentMethod
;

SELECT * FROM gamehub.vw_CustomerPayment;

--

DROP VIEW IF EXISTS vw_PendingOrders;
# Mostrar todos los pedidos que están en estado "Pending".
CREATE VIEW vw_PendingOrders 
AS
	SELECT 
		o.ID_Order, 
		o.OrderDate, 
		o.TotalAmount, 
		c.FirstName, 
		c.LastName
	FROM `Order` o
	JOIN Customer c ON o.ID_Customer = c.ID_Customer
	WHERE o.State = 'Pending'
;

SELECT * FROM gamehub.vw_PendingOrders;

--

DROP VIEW IF EXISTS vw_CostsCustomer_and_PaymentMethod;
# Reporte de costos totales por cliente y método de pago, agrupados por mes.
CREATE VIEW vw_CostsCustomer_and_PaymentMethod
AS
    SELECT
		data_agrupada.ID_Customer AS ID_Cliente,
        CONCAT_WS('-', YEAR(data_agrupada.OrderDate), MONTH(data_agrupada.OrderDate)) AS Periodo,
        data_agrupada.FirstName AS Nombre,
        data_agrupada.LastName AS Apellido,
        data_agrupada.Email AS Correo,
        data_agrupada.PaymentMethod AS Metodo_Pago,
        SUM(data_agrupada.TotalAmount) AS Costo_Total,
        COUNT(data_agrupada.ID_Order) AS Cantidad_Pedidos
    FROM (
        SELECT
            o.ID_Order,
            o.OrderDate,
            o.TotalAmount,
            c.ID_Customer,
            c.FirstName,
            c.LastName,
            c.Email,
            pm.Type AS PaymentMethod
        FROM `Order` o
        JOIN Customer c ON o.ID_Customer = c.ID_Customer
        JOIN PaymentMethod pm ON c.ID_PaymentMethod = pm.ID_PaymentMethod
	) AS data_agrupada
    GROUP BY 
		CONCAT_WS('-', YEAR(data_agrupada.OrderDate), MONTH(data_agrupada.OrderDate)),
        data_agrupada.ID_Customer,
        data_agrupada.PaymentMethod
;

SELECT * FROM gamehub.vw_CostsCustomer_and_PaymentMethod;