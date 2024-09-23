#Creación de views en la DB
USE gamehub;

--

SELECT * FROM gamehub.vw_ordersummary LIMIT 5;
SELECT * FROM gamehub.vw_CustomerPayment;
SELECT * FROM gamehub.vw_PendingOrders;
SELECT * FROM gamehub.vw_CostsCustomer_and_PaymentMethod;

--

DROP VIEW IF EXISTS vw_ordersummary;
# Mostar un top de clientes con mayores ventas acumuladas.
CREATE VIEW vw_OrderSummary 
AS
	SELECT 
		c.ID_Customer, 
		CONCAT(c.FirstName, ' ', c.LastName) AS FullName,
		SUM(o.TotalAmount) AS TotalSales
	FROM Customer c
	JOIN `Order` o ON c.ID_Customer = o.ID_Customer
	WHERE o.State = 'Delivered'
	GROUP BY 
		c.ID_Customer, FullName
	ORDER BY 
		TotalSales DESC
;

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
