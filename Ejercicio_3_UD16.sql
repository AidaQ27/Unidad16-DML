USE actividades;

SELECT * FROM almacenes;

SELECT * FROM cajas WHERE Valor > 150;

SELECT DISTINCT Contenido FROM cajas;

SELECT AVG(Valor) FROM cajas;

SELECT Almacen, AVG(Valor) FROM cajas GROUP BY Almacen;

SELECT Almacen, AVG(Valor) FROM cajas GROUP BY Almacen HAVING AVG(Valor) > 150;

SELECT NumReferencia, Lugar FROM almacenes, cajas WHERE Codigo = cajas.Almacen;

SELECT Almacen, COUNT(*) FROM cajas GROUP BY Almacen;

SELECT Codigo FROM almacenes WHERE Capacidad < ( SELECT COUNT(*) FROM cajas WHERE Almacen = Codigo );

SELECT NumReferencia FROM cajas WHERE Almacen IN ( SELECT Codigo FROM almacenes WHERE Lugar = 'Bilbao');

INSERT INTO almacenes (Codigo,Lugar, Capacidad) VALUES('6','Barcelona', 3);

INSERT INTO cajas VALUES('H5RT', 'Papel', 200, 2);

UPDATE cajas SET Valor = Valor * 0.85;

UPDATE cajas SET Valor = Valor * 0.80 WHERE Valor > (SELECT AVG (Valor) FROM cajas);

DELETE FROM cajas WHERE Valor < 100;

DELETE FROM cajas WHERE Almacen IN ( SELECT Codigo FROM cajas WHERE Capacidad < ( SELECT COUNT(*) FROM cajas WHERE Almacen = Codigo ) );