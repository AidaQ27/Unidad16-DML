CREATE DATABASE EJ02UD16;

USE EJ02UD16;

CREATE TABLE `departamentos` (
  `CODIGO` int NOT NULL,
  `NOMBRE` varchar(255) NOT NULL,
  `PRESUPUESTO` decimal(10,0) NOT NULL,
  PRIMARY KEY (`CODIGO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `departamentos` VALUES 
(14,'IT',65000),
(37,'Accounting',15000),
(59,'Human Resources',240000),
(77,'Research',55000);


CREATE TABLE `empleados` (
  `DNI` int NOT NULL,
  `NOMBRE` varchar(255) NOT NULL,
  `APELLIDOS` varchar(255) NOT NULL,
  `DEPARTAMENTO` int NOT NULL,
  PRIMARY KEY (`DNI`),
  KEY `DEPARTAMENTO` (`DEPARTAMENTO`),
  CONSTRAINT `empleados_ibfk_1` FOREIGN KEY (`DEPARTAMENTO`) REFERENCES `departamentos` (`CODIGO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `empleados` VALUES 
(123234877,'Michael','Rogers',14),
(152934485,'Anand','Manikutty',14),
(222364883,'Carol','Smith',37),
(326587417,'Joe','Stevens',37),
(332154719,'Mary-Anne','Foster',14),
(332569843,'George','O\'Donnell',77),
(546523478,'John','Doe',59),
(631231482,'David','Smith',77),
(654873219,'Zacary','Efron',59),
(745685214,'Eric','Goldsmith',59),
(845657233,'Luis','López',14),
(845657245,'Elizabeth','Doe',14),
(845657246,'Kumar','Swamy',14),
(845657266,'Jose','Pérez',77);

/*Obtener los apellidos de los empleados*/
SELECT apellidos FROM empleados;

/*Obtener los apellidos de los empleados sin repeticiones*/
SELECT DISTINCT(apellidos) FROM empleados;

/*Obtener todos los datos de los empleados que se llaman Smith*/
SELECT * FROM empleados WHERE apellidos='Smith';

/*Obtener todos los datos de los empleados que se apellidan 'Smith' y los que se paellidan 'Rogers'*/
SELECT * FROM empleados WHERE apellidos='Smith' OR apellidos='Rogers';

/*Obtener todos los datos de los empleados que trabajan para el departamento 14*/
SELECT * FROM empleados WHERE departamento=14;

/*Obtener todos los datos de los empleados que trabajan pra el departamento 37 y para el departamente 77*/
SELECT * FROM empleados WHERE departamento=37 or departamento=77;

/*Obtener todos los datos de los mepleados cuyo apellidos comience por 'P'*/
SELECT * FROM empleados WHERE apellidos LIKE'P%';

/*Obtener el presupuesto total de todos los departamentos*/
SELECT SUM(presupuesto) FROM departamentos;

/*Obtener el numero de empleados en cada departameto*/
SELECT departamento, COUNT(*) FROM empleados GROUP BY departamento;

/*Obtener un listado completo de empleados, incluyendo por cada empleado los datos del empleado y su departamento*/
SELECT * FROM empleados 
INNER JOIN departamentos 
ON empleados.departamento=departamentos.codigo;

/*Obtener un listado completo de empleados, incluyendo el nombre y apellidos del empleado junto al nombre y presupuesto de su departamento*/
SELECT empleados.nombre, empleados.apellidos, empleados.departamento, departamentos.nombre, departamentos.presupuesto
FROM empleados 
INNER JOIN departamentos 
ON empleados.departamento=departamentos.codigo;

/*Obtener los nombres y apellidos de los empleados que trabajen en departamentos cuyo presupuesto sea mayor de 60000*/
SELECT empleados.nombre, empleados.apellidos, departamentos.presupuesto 
FROM empleados, departamentos
WHERE empleados.departamento=departamentos.codigo AND presupuesto>60000;

/*Obtener los datos de los departamentos cuyo presupuesto es superior al prsupuesto medio de todos los departamentos*/
SELECT nombre
FROM departamentos
WHERE presupuesto>(Select AVG(presupuesto)FROM departamentos);

/*Obtener los nombres (solo los nombres) de los departamentos que tienen más de dos empleados */
SELECT nombre FROM departamentos
WHERE codigo IN 
( SELECT departamento FROM empleados GROUP BY departamento HAVING COUNT(*) > 2);

/*Añadir un nuevo departamento: 'Calidad', con presupuesto de 40000 € y codigo 11. Añadir un empleado vinculado al departamento recién creado: Esther Vazquez, DNI: 89267109*/
INSERT INTO departamentos(codigo, nombre, presupuesto) VALUES
(11, 'Calidad', 40000);

INSERT INTO empleados(dni, nombre, apellidos, departamento) VALUES
(89267109, 'Esther', 'Vazquez', 11);

/*Aplicar un recorte presupuestario del 10% a todos de los departamentos*/
UPDATE departamentos SET presupuesto = presupuesto * 1.10;

/*Reasignar a los empleados del departamento de investigación (codigo 77) al departamento de informatico (codigo 14)*/
UPDATE empleados SET departamento = 14 WHERE departamento = 77;

/*Despedir a todos los empleados que trabajan para el departamento de informatica (codigo 14)*/
DELETE FROM empleados WHERE departamento = 14;

/*Despedir a todos los empleados que trbajen para departamentos cuyo presupuesto sea superior a los 600000*/
DELETE FROM empleados 
WHERE departamento IN (SELECT codigo FROM departamento WHERE presupuesto >= 60000);

/*Despedir a todos los empleados*/
DELETE FROM empleados;