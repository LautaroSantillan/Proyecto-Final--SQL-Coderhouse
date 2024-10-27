#Creación de usuarios en la DB
USE gamehub;

-- Crear usuario master
CREATE USER 'master'@'localhost' IDENTIFIED BY 'passmaster123';
-- Otorgar permisos totales
GRANT ALL PRIVILEGES ON gameHub.* TO 'master'@'localhost' WITH GRANT OPTION;

# Crear usuario para lectura de ciertas tablas
CREATE USER 'user1'@'localhost' IDENTIFIED BY 'password1';
-- Permisos para user1
GRANT SELECT ON gameHub.Customer TO 'user1'@'localhost';
GRANT SELECT ON gameHub.VideoGame TO 'user1'@'localhost';
GRANT SELECT ON gameHub.vw_OrderSummary to 'user1'@'localhost';
GRANT SELECT ON gameHub.vw_CostsCustomer_and_PaymentMethod to 'user1'@'localhost';
GRANT SELECT ON gameHub.sp_fn_totalsales to 'user1'@'localhost';
-- Revocar permisos SELECT de user1 en las tablas específicas de GameHub
REVOKE SELECT ON gameHub.Customer FROM 'user1'@'localhost';
REVOKE SELECT ON gameHub.VideoGame FROM 'user1'@'localhost';
REVOKE SELECT ON gameHub.vw_OrderSummary FROM 'user1'@'localhost';
REVOKE SELECT ON gameHub.vw_CostsCustomer_and_PaymentMethod FROM 'user1'@'localhost';
REVOKE SELECT ON gameHub.sp_fn_totalsales FROM 'user1'@'localhost';
-- Eliminar el usuario usuario1
DROP USER 'user1'@'localhost';
