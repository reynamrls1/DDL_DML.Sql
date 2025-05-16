USE `actividad`;
DROP procedure IF EXISTS `datosproductos`;

USE `actividad`;
DROP procedure IF EXISTS `actividad`.`datosproductos`;
;

DELIMITER $$
USE `actividad`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `datosproductos`(
in nom varchar(100), in val double, in fab int(10)
)
BEGIN
insert into producto (nombre, precio, codigo_fabricante) values (nom, val, fab);
END$$

DELIMITER ;
;
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