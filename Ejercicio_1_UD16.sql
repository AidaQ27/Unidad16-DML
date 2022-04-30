/* 1.1 - Obten los nombres de los productos de la tienda*/

SELECT nombre FROM articulos;

/* 1.2 - Obten los nombres y precios de los productos de la tienda*/

SELECT nombre, precio FROM articulos;

/* 1.3 Obten el nombre de los productos cuyo precio sea menor que 200€ */

SELECT nombre FROM articulos WHERE precio < 200;

/* 1.4 Obten todos los datos de los articulos cuyo precio esté entre 60€ y 120€ (incluidos) */

SELECT * FROM articulos WHERE precio BETWEEN 60 AND 120;

/* 1.5 - Nombre del articulo y precio en pesetas*/

SELECT nombre, precio*166.386 FROM articulos WHERE precio;

/* 1.6 - Precio medio de los productos */

SELECT AVG(precio) FROM articulos;

/* 1.7 - Obten el precio medio de los artículos cuyo código de fabricante sea 2*/

SELECT AVG(precio) FROM articulos WHERE fabricante = 2;

/* 1.8 - Obten el numero de artículos cuyo precio sea mayor o igual a 180€ */

SELECT COUNT(*) FROM articulos WHERE precio >= 180;

/* 1.9 - Obtener el nombre y precio de los artículos con precio mayor o igual a 180€ y
ordenarlos descendentemente por precio, y luego ascendentemente por nombre*/

SELECT nombre, precio FROM articulos WHERE precio >= 180 ORDER BY precio DESC;

SELECT nombre, precio FROM articulos WHERE precio >= 180 ORDER BY nombre ASC;

/* 1.10 - Obtener un listado completo de artículos, incluyendo 
cada articulo losdatos del articulo y de su fabricante*/

SELECT articulos.*, fabricantes.* FROM articulos
INNER JOIN fabricantes ON articulos.fabricante=fabricantes.codigo;

/* 1.11 - Obtener un listado de artículos, incluyendo el nombre del artículo,
 su precio, y el nombre de su fabricante*/
 
SELECT articulos.nombre, articulos.precio, fabricantes.nombre AS nombre_fabricante
FROM articulos
INNER JOIN fabricantes ON articulos.fabricante=fabricantes.codigo;

/* 1.12 - Obten los precios medios de cada fabricante mostrando solo el codigo del fabricante */

SELECT AVG(precio), fabricante
from articulos group by fabricante;

/* 1.13 - Obten los precios medios de cada fabricante mostrando el nombre del fabricante */ 

SELECT AVG(precio), fabricantes.nombre
FROM articulos 
INNER JOIN fabricantes ON articulos.fabricante=fabricantes.codigo
GROUP BY fabricante;

/* 1.14 - Obten los nombres de los fabriantes que ofrezcan productos cuyo precio medio sea mayor o igual a 150 */ 

SELECT AVG(precio), fabricantes.nombre
FROM articulos
INNER JOIN fabricantes ON articulos.fabricante=fabricantes.codigo
GROUP BY fabricante
HAVING AVG(precio) >= 150;

/* 1.15 - Obtener el nombre y precio del artículo más barato*/

SELECT nombre, precio
FROM articulos
WHERE precio = (SELECT MIN(precio) from articulos);

/* 1.16 - Obtener una lista con el nombre y precio de los
 artículos más caros de cada proveedor (inc. nombre del proveedor) */
 
 SELECT a.nombre, a.precio, f.nombre 
 FROM articulos as a, fabricantes as f
 WHERE a.fabricante = f.codigo AND a.precio = (SELECT MAX(arti.precio) FROM articulos AS arti WHERE arti.fabricante = f.codigo);
 
 /*  1.17 - Añadir un nuevo producto. Altavoces de 70€ (del fabricante 2)*/

 INSERT INTO articulos VALUES
 (11, "Altavoces", 70, 2);
 
 /* 1.18 - Cambiar el nombre del producto 8 a "Impresora laser" */

UPDATE articulos
SET nombre = "Impresora laser"
WHERE codigo = 8;

/* 1.19 - Aplicar un descuento dle 10% (multiplicar por 0.9) a todos los productos */

UPDATE articulos
SET precio = precio * 0.9;

/* 1.20 - Aplica un descuento de 10€ a todos los productos cuyo precio sea mayor o igual a 120€ */

UPDATE articulos
SET precio = precio - 10
WHERE precio >= 120;
 