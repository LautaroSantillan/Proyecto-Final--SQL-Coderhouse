USE gameHub;

START TRANSACTION;

-- Punto de control para orden de resumen en vista 'vw_OrderSummary'
SAVEPOINT sp_order_summary;
BEGIN;
    SELECT * FROM vw_OrderSummary LIMIT 10;
    COMMIT;
ROLLBACK TO sp_order_summary;

-- Punto de control para consulta de costos de cliente
SAVEPOINT sp_costs_customer;
BEGIN;
    SELECT * FROM vw_CostsCustomer_and_PaymentMethod ORDER BY Costo_Total DESC;
    COMMIT;
ROLLBACK TO sp_costs_customer;

-- Punto de control para función de ventas totales por cliente
SAVEPOINT sp_fn_totalsales;
BEGIN;
    SELECT fn_TotalSalesByCustomer(1) AS Total_Sales FROM DUAL;
    COMMIT;
ROLLBACK TO sp_fn_totalsales;

-- Punto de control para insertar un nuevo cliente en la tabla 'Customer'
SAVEPOINT sp_insert_customer;
BEGIN;
    INSERT INTO Customer (DNI, Nombre, Apellido, FechaNac, Sexo, Email, Telefono)
    VALUES (12345678, 'Nuevo', 'Cliente', '1985-04-23', 'M', 'nuevo.cliente@email.com', '123456789');
    COMMIT;
ROLLBACK TO sp_insert_customer;

-- Finalizar la transacción principal
COMMIT;
