USE `actividad`;
DROP procedure IF EXISTS `datosfabricantes`;

DELIMITER $$
USE `actividad`$$
CREATE PROCEDURE datosfabricantes (
IN nom varchar(100)
)
BEGIN
insert into fabricante (nombre) Values(nom);
END$$

DELIMITER ;


