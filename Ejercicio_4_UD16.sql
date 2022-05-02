/*ejercicio4.1*/
SELECT Nombre FROM PELICULAS;
/*ejercicio4.2*/
SELECT CALIFICACIONEDAD FROM peliculas;
/*ejercicio4.3*/
SELECT * 
FROM PELICULAS WHERE CalificacionEdad IS NULL;
/*ejercicio4.4*/
SELECT * 
FROM SALAS WHERE Pelicula IS NULL;
/*ejercicio4.5*/
SELECT *
FROM SALAS LEFT JOIN PELICULAS
ON SALAS.Pelicula = PELICULAS,Codigo;
/*ejercicio4.6*/
SELECT *
FROM SALAS RIGHT JOIN PELICULAS
ON SALAS.Pelicula = PELICULAS.Codigo;
/*ejercicio4.7*/
SELECT PELICULAS.Nombre
FROM SALAS RIGHT JOIN PELICULAS
ON SALAS.Pelicula = PELICULAS.Codigo
WHERE SALAS.Pelicula IS NULL;
/*ejercicio4.8*/
INSERT INTO PELICULAS(Nombre,CalificacionEdad) VALUES(‘Uno, Dos, Tres’, 7);
/*ejercicio4.9*/
UPDATE PELICULAS SET CalificacionEdad=13 WHERE CalificacionEdad IS NULL;
/*ejercicio4.10*/
DELETE FROM SALAS WHERE Pelicula IN
(SELECT Codigo FROM PELICULAS WHERE CalificacionEdad = 0);
