USE tienda;

SELECT * FROM fabricante;
SELECT * FROM producto;

INSERT INTO fabricante(codigo,nombre) VALUES(10,'Apple');
INSERT INTO producto(codigo,nombre,precio,codigo_fabricante) VALUES(12,'iPhone XI', 1000,10);

SELECT nombre, precio FROM producto where precio>=200;
SELECT fab.nombre AS fabricante, prod.nombre AS nombre_producto, prod.precio FROM producto AS prod INNER JOIN fabricante AS fab ON fab.codigo=prod.codigo_fabricante;
SELECT fab.nombre AS fabricante, COUNT(prod.nombre) AS cantidad_productos FROM fabricante AS fab LEFT JOIN producto AS prod ON fab.codigo=prod.codigo_fabricante GROUP BY fab.codigo ORDER BY cantidad_productos desc;

UPDATE producto SET nombre='Disco SSD 500 GB' WHERE codigo=3;
UPDATE producto SET precio=999 WHERE codigo=9;

DELETE FROM producto WHERE codigo=12;
DELETE FROM fabricante WHERE codigo=10;