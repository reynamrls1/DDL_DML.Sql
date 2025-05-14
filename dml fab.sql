call datosfabricantes("Asus");
call datosfabricantes("Lenovo");
call datosfabricantes("Hewlett-Packard");
call datosfabricantes("Samsung");
call datosfabricantes("Seagate");
call datosfabricantes("Crucial");
call datosfabricantes("Gigabyte");
call datosfabricantes("Huawei");
call datosfabricantes("Xiaomi");

call datosproductos("Disco duro SATA3 1TB", 86.99,5);
call datosproductos("Memoria RAM DDR4 8GB", 120, 6);
call datosproductos("Disco SSG 1 TB ", 150.99, 4);
call datosproductos("GeForce GTX 1050 Ti ", 185, 7);
call datosproductos("GeForce GTX 1080 Xtreme ", 755, 6);
call datosproductos("Monitor 24 LED Full HD ", 202, 1);
call datosproductos("Monitor 27 LED Full HD ", 245.99, 1);
call datosproductos( "Portatil Yoga 520 ", 559, 2);
call datosproductos( "Portatil Ideapd320 ", 444, 2);
call datosproductos( "Impresora HP Deskjet 3720", 59.99, 3);
call datosproductos( "Impresora HP Laserjet PRO M26nw", 180, 3);

/*1. Listar el nombre de todos los productos*/
select nombre from producto;

/*2. Listar el nombre y precio de todos los productos*/
select nombre,precio from producto;

/*3. Listar las columnas de la tabla productos*/
select * from producto;

/*4. Listar el nombre de los productos, precio en euro y el precio en dolares (USD)*/
select nombre, precio as precio_usd, precio * 0.8951 as precio_euro
from producto;

/*5. Listar el nombre de los productos, precio en euro utilizando los diguientes alias: Nombre de producto, euro, dolares*/
select nombre as "nombre de producto", precio * 0.8951 as euro, precio as "dólares"
from producto;

/*6. Listar los nombre y precios de todos los productos de la tabla productos, convirtiendo los nombres a mayuscula */
select upper(nombre) as nombre, precio
from producto;

/*7. Listar los nombre y precios de todos los productos de la tabla productos, convirtiendo los nombres a minuscula */
select lower(nombre) as nombre, precio
from producto;

/*8. Lista el nombre de todos los fabricantes en una columna y en otra obtenga en mayuscula los dos primeros caracteres del nombre del fabricante */
select nombre, upper(left(nombre, 2)) as nomMayus
from fabricante;

/*9. listar el nombre y los precios de todos los productos de la tabla de la tabla producto, redondeando el valor de los precio*/