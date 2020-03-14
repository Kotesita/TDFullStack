USE tienda;

SELECT nombre FROM producto;  -- nombres todos los productos
SELECT nombre, precio FROM producto; -- nombres y precios de todos los productos
SELECT * FROM producto; -- toda la información de producto
SELECT nombre, precio AS precio_USD, precio*0.89 AS precio_EUR FROM producto; -- nombre con precio en dólares y euros
SELECT UPPER(nombre), precio FROM producto; -- nombre con mayúsculas
SELECT LOWER(nombre), precio FROM producto; -- nombre con minúsculas
SELECT nombre, UPPER(SUBSTRING(nombre,1,2)) AS iniciales FROM fabricante; -- 2 primeros caracteres del nombre del fabricante
SELECT nombre, ceiling(precio) AS precio_aproximado FROM producto; -- productos con precio aproximado
SELECT nombre, floor(precio) AS precio_truncado FROM producto; -- productos con precio truncado
SELECT codigo_fabricante FROM producto; -- fabricantes que tienen productos
SELECT DISTINCT(codigo_fabricante) FROM producto; -- fabricantes que tienen productos (sin repetidos)
SELECT nombre FROM fabricante order by nombre asc; -- nombres de fabricantes ordenados ascendente
SELECT nombre FROM fabricante order by nombre desc; -- nombres de fabricantes ordenados descendente
SELECT nombre, precio FROM producto order by nombre asc, precio desc; -- productos ordenados por nombre y precio
SELECT * FROM fabricante LIMIT 5; -- 5 primeras filas de fabricantes
SELECT * FROM fabricante LIMIT 2 OFFSET 3; -- 2 filas desde la 4ta en adelante.
SELECT nombre, precio FROM producto ORDER BY precio ASC LIMIT 1; -- producto más barato
SELECT nombre, precio FROM producto ORDER BY precio DESC LIMIT 1; -- producto más caro
SELECT nombre FROM producto WHERE codigo_fabricante=2; -- nombres de los productos del fabricante 2
SELECT nombre FROM producto WHERE nombre LIKE '%portátil%'; -- prodcutos con nombre portátil
SELECT * FROM fabricante WHERE nombre like 's%'; -- fabricantes que comiencen con S
SELECT prod.nombre AS producto, prod.precio, fab.nombre AS fabricante FROM producto AS prod INNER JOIN fabricante AS fab ON prod.codigo_fabricante=fab.codigo; -- nombre, precio y fabricante de productos.
SELECT prod.nombre AS producto, prod.precio, fab.nombre AS fabricante FROM producto AS prod INNER JOIN fabricante AS fab ON prod.codigo_fabricante=fab.codigo ORDER BY fab.nombre asc; -- nombre, precio y fabricante de productos ordenados por nombre de fabricante.
SELECT prod.codigo AS codigo_producto, prod.nombre AS nombre_producto, fab.codigo AS codigo_fabricante, fab.nombre AS nombre_fabricante FROM producto AS prod INNER JOIN fabricante AS fab ON prod.codigo_fabricante=fab.codigo; -- codigo y nombre de producto y fabricante
SELECT prod.nombre AS producto, prod.precio, fab.nombre AS fabricante FROM producto AS prod INNER JOIN fabricante AS fab ON prod.codigo_fabricante=fab.codigo ORDER BY prod.precio ASC LIMIT 1; -- nombre, precio y fabricante del producto más barato.
SELECT prod.nombre AS product FROM producto AS prod INNER JOIN fabricante AS fab ON prod.codigo_fabricante=fab.codigo WHERE fab.nombre like '%LENOVO%'; -- nombre de productos del fabricante Lenovo
SELECT prod.nombre AS product FROM producto AS prod INNER JOIN fabricante AS fab ON prod.codigo_fabricante=fab.codigo WHERE fab.nombre in ('Asus', 'Hewlett-Packard','Seagate'); -- nombre de productos de los fabricantes Asus, Hewlett-Packard y Seagate
SELECT COUNT(*) AS cantidad_productos FROM producto; -- cuenta el total de productos
SELECT COUNT(*) AS cantidad_fabricantes FROM fabricante; -- cuenta el total de productos
SELECT AVG(precio) AS promedio_precios FROM producto; -- promedio de precios de todos los productos
SELECT MIN(precio) AS precio_minimo FROM producto; -- precio minimo de todos los productos
SELECT MAX(precio) AS maximo FROM producto; -- precio maximo de todos los productos
SELECT SUM(precio) AS precio_total FROM producto; -- suma de precios de todos los productos
SELECT fab.nombre AS nombre_fabricante, MAX(prod.precio) AS precio_maximo, MIN(prod.precio) AS precio_minimo, AVG(prod.precio) AS promedio_precios FROM producto AS prod INNER JOIN fabricante AS fab ON prod.codigo_fabricante=fab.codigo GROUP BY fab.codigo; -- precios minimo, maximo y promedio por fabricante
SELECT fab.nombre AS nombre_fabricante, MAX(prod.precio*0.89) AS precio_maximo, MIN(prod.precio*0.89) AS precio_minimo, AVG(prod.precio*0.89) AS promedio_precios, COUNT(prod.nombre) AS cantidad_productos FROM producto AS prod INNER JOIN fabricante AS fab ON prod.codigo_fabricante=fab.codigo WHERE prod.precio*0.89>=200 GROUP BY fab.codigo; -- precios minimo, maximo. promedio y cantidad de productos de cada fabricante con precios mayores a 200
SELECT fab.nombre AS nombre_fabricante, COUNT(prod.nombre) AS cantidad_productos FROM producto AS prod INNER JOIN fabricante AS fab ON prod.codigo_fabricante=fab.codigo WHERE prod.precio*0.89>=220 GROUP BY fab.codigo; -- precios minimo, maximo. promedio y cantidad de productos de cada fabricante con precios mayores a 220
SELECT fab.nombre AS nombre_fabricante, prod.nombre AS nombre_producto, MAX(prod.precio) AS precio FROM producto AS prod INNER JOIN fabricante AS fab ON prod.codigo_fabricante=fab.codigo GROUP BY fab.codigo; -- productos de mayor valor por cada fabricante





