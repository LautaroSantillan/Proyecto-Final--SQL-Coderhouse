#Creación de vistas de la DB
USE gamehub;
--
CREATE VIEW OrderSummary 
AS
	SELECT 
		CONCAT(c.FirstName, ' ', c.LastName) AS 'Customer Name',
		o.OrderDate  AS 'Order Date',
		o.TotalAmount  AS 'Total Amount'
	FROM  `order` o
	JOIN customer c ON o.ID_Customer = c.ID_Customer
;
--
SELECT * FROM gamehub.ordersummary LIMIT 3;
