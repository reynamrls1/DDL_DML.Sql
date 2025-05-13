USE `consultas`;
DROP procedure IF EXISTS `datosproductos`;

USE `consultas`;
DROP procedure IF EXISTS `consultas`.`datosproductos`;
;

DELIMITER $$
USE `consultas`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `datosproductos`(
in nom varchar(100), in val double, in fab int(10)
)
BEGIN
insert into producto (nombre, precio, codigo_fabricante) values (nom, val, fab);
END$$

DELIMITER ;
;
