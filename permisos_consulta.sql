/* Creamos usuario
CREATE USER 'consulta'@'localhost'; */

/*Permisos de ver*/
GRANT SELECT ON amongmeme.* TO 'consulta'@'localhost';

REVOKE UPDATE ON amongmeme.* TO 'consulta'@'localhost';

REVOKE DELETE ON amongmeme.* TO 'consulta'@'localhost';

REVOKE CREATE ON amongmeme.* TO 'consulta'@'localhost';

REVOKE DROP ON amongmeme.* TO 'consulta'@'localhost';

REVOKE RELOAD ON amongmeme.* TO 'consulta'@'localhost';

