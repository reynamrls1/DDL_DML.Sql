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
select nombre, ROUND(precio) as precio_redondeado
from producto;

/*10. listar los nombres y los precios de todos los productos, trucnando el valor del precio para mostrarlo sin ninguna decimal*/
select nombre, truncate(precio, 0) as precio_truncado
from producto;

/*11. listar el identificador de los fabricantes que tienen productos en la tabla de productos*/
select distinct codigo
from producto;

/*12. listar el identificador de los fabricantes que tienen productos y eliminar los identificadores que aparecen repetidos en la tabla de productos*/
select codigo_fabricante
from producto
group by codigo_fabricante
order by MIN(codigo);

/*13. Lista los nombres de los fabricantes ordenados de forma ascendente.*/
select nombre
from fabricante
order by nombre asc;

/*14. Lista los nombres de los fabricantes ordenados de forma descendente.*/
select nombre
from fabricante
order by nombre desc;

/*15. Lista los nombres de los productos ordenados en primer lugar por el nombre de forma
ascendente y en segundo lugar por el precio de forma descendente.*/
select nombre, precio
from producto
order by nombre asc, precio desc;

/*16. Devuelve una lista con las 5 primeras filas de la tabla fabricante*/
select *
from fabricante
limit 5;

/*17. Devuelve una lista con 2 filas a partir de la cuarta fila de la tabla fabricante. La cuarta
fila también se debe incluir en la respuesta.*/
select *
from fabricante
limit 2 offset 3;

/*18. Lista el nombre y el precio del producto más barato. (Utilice solamente las cláusulas
ORDER BY y LIMIT) */
select nombre, precio
from producto
order by precio asc
limit 1;

/*19. Lista el nombre y el precio del producto más caro. (Utilice solamente las cláusulas
ORDER BY y LIMIT)*/
select nombre, precio
from producto
order by precio desc
limit 1;

/*20.  Lista el nombre de todos los productos del fabricante cuyo identificador de fabricante
es igual a 2*/
select nombre
from producto
where codigo_fabricante = 2;

/*21. Lista el nombre de los productos que tienen un precio menor o igual a 120€*/
select nombre, precio
from producto
where precio <= 120;

/*22.  Lista el nombre de los productos que tienen un precio mayor o igual a 400€*/
select nombre, precio
from producto
where precio >= 400;

/*23. Lista el nombre de los productos que no tienen un precio mayor o igual a 400€*/
select nombre, precio
from producto
where not precio >= 400;

/*24. Productos con precio entre 80€ y 300€ sin usar BETWEEN*/
select nombre, precio
from producto
where precio >= 80 and precio <= 300;

/*25. Productos con precio entre 60€ y 200€ usando BETWEEN*/
select nombre, precio
from producto
where precio between 60 and 200;

/*26. Productos con precio mayor que 200€ y fabricante = 6*/
select *
from producto
where precio > 200 and codigo_fabricante = 6;

/*27. Productos con fabricante 1, 3 o 5 sin usar IN*/
select *
from producto
where codigo_fabricante = 1 or codigo_fabricante = 3 or codigo_fabricante = 5;

/*28. Productos con fabricante 1, 3 o 5 usando IN*/
select *
from producto
where codigo_fabricante in (1, 3, 5);

/*29. Nombre y precio en céntimos (precio * 100) con alias centimos*/
select nombre, precio * 100 as "céntimos"
from producto;

/*30. Fabricantes cuyo nombre empieza por "S"*/
select nombre
from fabricante
where nombre like 'S%';

/*31. Fabricantes cuyo nombre termina en vocal "e"*/
select nombre
from fabricante
where nombre like '%e';

/*32. Fabricantes cuyo nombre contiene la letra "w"*/
select nombre
from fabricante
where nombre like '%w%';

/*33. Fabricantes cuyo nombre tiene exactamente 4 caracteres*/
select nombre
from fabricante
where CHAR_LENGTH(nombre) = 4;

/*34. Productos cuyo nombre contiene la cadena "Portátil"*/
select nombre
from producto
where nombre like '%Portátil%';

/*35. Productos con nombre que contiene "Monitor" y precio inferior a 215€*/
select nombre, precio
from producto
where nombre like '%Monitor%' and precio < 215;

/*36. Nombre y precio de productos con precio >= 180€, ordenados por precio desc y luego nombre asc*/
select nombre, precio
from producto
where precio >= 180
order by precio desc, nombre asc;

/*CONSULTAS MULTITABLA*/
/*1. Nombre del producto, precio y nombre del fabricante*/
select p.nombre, p.precio, f.nombre
from producto as p
join fabricante f on p.codigo_fabricante = f.codigo; /*se puede usar join o where*/

/*2. Igual al anterior pero ordenado por nombre del fabricante de forma alfabetica*/
select p.nombre, p.precio, f.nombre
from producto as p, fabricante as f
where p.codigo_fabricante = f.codigo
order by f.nombre asc;

/*3. ID del producto, nombre, ID y nombre del fabricante*/
select p.codigo, p.nombre, f.codigo, f.nombre
from producto as p, fabricante as f
where p.codigo_fabricante = f.codigo;

/*4. Producto más barato*/
select p.nombre, p.precio, f.nombre
from producto as p, fabricante as f
where p.codigo_fabricante = f.codigo
order by p.precio asc
limit 1;

/*5. Producto más caro*/
select p.nombre, p.precio, f.nombre
from producto as p, fabricante as f
where p.codigo_fabricante = f.codigo
order by p.precio desc
limit 1;

/*6. Productos del fabricante Lenovo*/
select p.*, f.nombre
from producto as p, fabricante as f
where p.codigo_fabricante = f.codigo and f.nombre = 'Lenovo';

/*7. Productos de Crucial con precio > 200€*/
select p.*, f.nombre
from producto as p, fabricante as f
where p.codigo_fabricante = f.codigo and f.nombre = 'Crucial' and p.precio > 200;

/*8. Productos de Asus, Hewlett-Packard y Seagate (sin IN)*/
select p.*, f.nombre
from producto as p, fabricante as f
where p.codigo_fabricante = f.codigo and 
     (f.nombre = 'Asus' or f.nombre = 'Hewlett-Packard' or f.nombre = 'Seagate');
     
/*9. Productos de Asus, Hewlett-Packard y Seagate usando IN*/
select p.*, f.nombre
from producto as p, fabricante as f
where p.codigo_fabricante = f.codigo and 
      f.nombre in ('Asus', 'Hewlett-Packard', 'Seagate');
      
/*10. Productos cuyos fabricantes terminan en "e"*/
select p.nombre, p.precio
from producto as p, fabricante as f
where p.codigo_fabricante = f.codigo and f.nombre like '%e';

/*11. Productos con fabricantes que contienen "w"*/
select p.nombre, p.precio
from producto as p, fabricante as f
where p.codigo_fabricante = f.codigo and f.nombre like '%w%';

/*12. Productos con precio mayor o igual a 180€, ordenados por precio DESC y nombre ASC*/
select p.nombre, p.precio, f.nombre
from producto as p, fabricante as f
where p.codigo_fabricante = f.codigo and p.precio >= 180
order by p.precio desc, p.nombre asc;

/*13. Fabricantes que tienen productos*/
select distinct f.codigo, f.nombre
from producto as p, fabricante as f
where p.codigo_fabricante = f.codigo; 

/*1.1.5. Connsultas multitablas (composicion externa)*/ 
/* 1. devuelve un listado de TODOS LOS FABRICANTES que existen en la base de datos, junto con los productos que tienen cada uno de ellos. el listado debera mostrar tambien aquellos fabricantes que no tienen productos asociados */

select f.nombre as fabricante, p.nombre as producto, p.precio
from fabricante f
left join producto p on f.codigo = p.codigo_fabricante
order by f.nombre;

/*2. devuelve un listado donde solo aparezcan aquellos fabricantes que no tienen ningun producto asociado*/ 
select f.nombre as fabricante
from fabricante f
left join producto p on f.codigo = p.codigo_fabricante
where p.codigo is null;

/*3.  ¿Pueden existir productos que no esten  relacionados con un fabricante? justifique su respiesta*/ 

/*1.1.6 Consultas resumen*/ 
/* 1. Calcula el numero total de productos que hay en la tabla productos. */ 
select COUNT(*) as total_productos
from producto;

/* 2. Calcula el numero total de fabricante que hay en la tabla de fabricante. */ 
select COUNT(*) as Total_fabricante
from fabricante;

 /*3. Calcula el numero de valores distintos de identificador de fabricante que aparecen en la tabla producto */ 
 select COUNT(distinct codigo_fabricante) as fabricantes_productos
from producto;

/*4. calcula la media del precio de todos los productos */ 
select avg(precio) as media_precio
from producto;

/*5. calcula el precio mas barato de todos los productos*/ 
select MIN(precio) as precio_mas_barato
from producto;

/*6. calcular el precio mas caro de todos los productos */ 
select MAX(precio) as precio_mas_alto
from producto;

/*7. Lista el nombre y el precio del producto mas barato  */ 
select nombre, precio
from producto
where precio = (select MIN(precio) from producto);

/*8. Lista el nombre y el precio del producto mas caro  */ 
select nombre, precio
from producto
where precio = (select max(precio) from producto);

/*9. Calcula la suma de los precios de todos los productos */ 
select SUM(precio) as suma_total
from producto;

/*10. Calcula el numero de productos que tienen el fabricante de Asus*/ 
select count(*) as productos_asus
from producto
where codigo_fabricante = (
    select codigo from fabricante
    where nombre = 'Asus'
);

/*11. Calcula la media del precio de todos los productos del fabricante Asus  */
select avg(precio) as media_asus
from producto
where codigo_fabricante = (
    select codigo from fabricante
    where nombre = 'Asus'
);

/*12. Calcula el precio mas barato de todos los productos del fabricante Asus */
select min(precio) as precio_barato_asus
from producto
where codigo_fabricante = (
    select codigo from fabricante
    where nombre = 'Asus'
);

/*13. Calcula el precio mas Caro de todos los productos del fabricante Asus  */  
select MAX(precio) as precio_maximo_asus
from producto
where codigo_fabricante = (
    select codigo from fabricante
    where nombre = 'Asus'
);

/*14. Calcula la suma de todos los productos del fabricante Asus */
select SUM(precio) as suma_todos_asus
from producto
where codigo_fabricante = (
    select codigo from fabricante
    where nombre = 'Asus'
);

/*15. Muestra el precio maximo, minimo, precio medio y el numero total de productos que tienen la fabrica Crucial */
select max(precio) as precio_maximo,
min(precio) as precio_minimo,
avg(precio) as precio_medio,
count(*) as total_productos
from producto
where codigo_fabricante = (
select codigo from fabricante
where nombre = 'Crucial'
);

/*16. Muestra el numero tyotal del productos que tiene cada uno de los fabricantes, el listado tambien debe incuir los fabricantes que no tienen ningun producto. El resultado mostrara dos columnas, una con el nombre del fabricante y la otra con el numero de productos que tiene. ordene el resultado descendente´por el numero del producto .*/

/*17. Muestra el precio maximo, precio minimo y precio medio de los productos de cada uno de los fabricantes. el resultado mostrara el nombre del fabricante junto con los datos que se solicitan*/

/*18. Muestra el precio maximo, precio minimo y precio medio y el numero total de los productos de los fabricantes que tienen un precio medio superior a 200E. noo es necesario mostrar el nombre del fabricante, con el identificador del fabricante es suficiente.*/

/*19. Muestra el nombre de cada fabricante, junto con el precio maximo precio minimo y precio medio y numero total  de los productos de los fabricantes que tienen un precio medio superior a 200e. es necesario mostrar el nombre del fabricante*/

/*20. Calcula el numero de producto que tiene un precio mayor o igual a 180 e  */

/*21. Calcula el numero de productos que tiene cada fabricante con un precio mayor  */



 