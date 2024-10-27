USE gameHub;

-- Comenzar una transacción para las consultas y pruebas
START TRANSACTION;

-- Intento de consulta en vw_OrderSummary para obtener los clientes con mayores ventas acumuladas
SAVEPOINT sp_order_summary;
BEGIN;
    SELECT * FROM vw_OrderSummary LIMIT 10;
COMMIT;
ROLLBACK TO sp_order_summary;

-- Intento de consulta en vw_CostsCustomer_and_PaymentMethod para reportar costos totales de clientes
SAVEPOINT sp_costs_customer;
BEGIN;
    SELECT * FROM vw_CostsCustomer_and_PaymentMethod ORDER BY Costo_Total DESC; 
COMMIT;
ROLLBACK TO sp_costs_customer;

-- Utilizar la función fn_TotalSalesByCustomer para calcular ventas totales de un cliente específico
SAVEPOINT sp_fn_totalsales;
BEGIN;
    SELECT fn_TotalSalesByCustomer(1) AS Total_Sales FROM DUAL;
COMMIT;
ROLLBACK TO sp_fn_totalsales;

-- Finalizar la transacción
COMMIT;

# Con la tabla PaymentMethod no traerá nada ya que no tiene permisos para ver esa tablas
BEGIN;
    SELECT * FROM stockaudit;
COMMIT;
