 /* 
Curso Full Stack Codo a Codo Comisión: 22035
Desafío Base de datos 

1) Dada la siguiente tabla de datos, armar las tablas pertinentes con sus claves primarias y claves foráneas correspondiente:
*/

CREATE DATABASE desafiodb;


CREATE TABLE departamentos (

Nro_Depto INT NOT NULL,
PRIMARY KEY(Nro_Depto),
Nombre_Depto VARCHAR(25) COLLATE latin1_swedish_ci NOT NULL,
Presupuesto FLOAT(15.2) NOT NULL

); 

INSERT INTO departamentos (Nro_Depto,Nombre_Depto,Presupuesto) VALUES ("14","Informática","80000");
INSERT INTO departamentos (Nro_Depto,Nombre_Depto,Presupuesto) VALUES ("77","Investigación","40000");
INSERT INTO departamentos (Nro_Depto,Nombre_Depto,Presupuesto) VALUES ("15","Gestión","95000");
INSERT INTO departamentos (Nro_Depto,Nombre_Depto,Presupuesto) VALUES ("37","Desarrollo","65000");
INSERT INTO departamentos (Nro_Depto,Nombre_Depto,Presupuesto) VALUES ("16","Comunicación","75000");


CREATE TABLE empleados (

DNI INT NOT NULL,
PRIMARY KEY(DNI),
Nombre VARCHAR(25) COLLATE latin1_swedish_ci NOT NULL,
Apellido VARCHAR(25) COLLATE latin1_swedish_ci NOT NULL,
Nro_Depto INT NOT NULL,
FOREIGN KEY(Nro_Depto) REFERENCES departamentos (Nro_Depto)

); 


INSERT INTO empleados (DNI,Nombre,Apellido,Nro_Depto) VALUES ("31096678","Juan","Lopez","14");
INSERT INTO empleados (DNI,Nombre,Apellido,Nro_Depto) VALUES ("31096675","Martin","Zarabia","77");
INSERT INTO empleados (DNI,Nombre,Apellido,Nro_Depto) VALUES ("34269854","Jose","velez","77");
INSERT INTO empleados (DNI,Nombre,Apellido,Nro_Depto) VALUES ("41369852","Paula","Madariaga","77");
INSERT INTO empleados (DNI,Nombre,Apellido,Nro_Depto) VALUES ("33698521","Pedro","Perez","14");
INSERT INTO empleados (DNI,Nombre,Apellido,Nro_Depto) VALUES ("32698547","Mariana","Lopez","15");
INSERT INTO empleados (DNI,Nombre,Apellido,Nro_Depto) VALUES ("42369854","Abril","Sanchez","37");
INSERT INTO empleados (DNI,Nombre,Apellido,Nro_Depto) VALUES ("36125896","Marti","Julia","14");
INSERT INTO empleados (DNI,Nombre,Apellido,Nro_Depto) VALUES ("36985471","Omar","Diaz","15");
INSERT INTO empleados (DNI,Nombre,Apellido,Nro_Depto) VALUES ("32145698","Guadalupe","Perez","77");
INSERT INTO empleados (DNI,Nombre,Apellido,Nro_Depto) VALUES ("32369854","Bernardo","pantera","37");
INSERT INTO empleados (DNI,Nombre,Apellido,Nro_Depto) VALUES ("36125965","Lucia","Pesaro","14");
INSERT INTO empleados (DNI,Nombre,Apellido,Nro_Depto) VALUES ("31236985","Maria","diamante","14");
INSERT INTO empleados (DNI,Nombre,Apellido,Nro_Depto) VALUES ("32698547","Carmen","barbieri","16");



/* 2) Realizar las siguientes consultas: */


/* 2.1 obtener los apellidos de los empleados */

SELECT apellido FROM empleados;



/* 2.2 obtener los apellidos de los empleados sin repeticiones */

SELECT DISTINCT apellido FROM empleados;



/* 2.3 obtener los datos de los empleados que tengan el apellido Lopez */

SELECT * FROM empleados WHERE apellido like "Lopez";



/* 2.4 obtener los datos de los empleados que tengan el apellido Lopez y los que tengan apellido Perez */

SELECT * FROM empleados WHERE (apellido LIKE "Lopez" OR apellido LIKE "Perez");



/* 2.5 Obtener todos los datos de los empleados que trabajen en el departamento 14 */

SELECT * FROM empleados WHERE Nro_Depto LIKE 14;



/* 2.6 Obtener todos los datos de los empleados que trabajen en el departamento 37 y 77 */

SELECT * FROM empleados WHERE (Nro_Depto LIKE "37" OR Nro_Depto LIKE "77");



/* 2.7 Obtener los datos de los empleados cuyo apellido comience con P */

SELECT * FROM empleados WHERE apellido LIKE "P%";



/* 2.8 Obtener el presupuesto total de todos los departamentos */

SELECT SUM(presupuesto) FROM departamentos;



/* 2.9 Obtener un listado completo de empleados, incluyendo por cada empleado los datos del empleado y de su departamento */

SELECT * FROM empleados LEFT JOIN departamentos ON empleados.Nro_Depto=departamentos.Nro_Depto;



/* 2.10 Obtener un listado completo de empleados, incluyendo el nombre y apellido del empleado junto al nombre y presupuesto de su 

departamento */

SELECT nombre,apellido,Nombre_Depto,Presupuesto FROM empleados INNER JOIN departamentos ON empleados.Nro_Depto=departamentos.Nro_Depto;



/* 2.11 Obtener los nombres y apellidos de los empleados que trabajen en departamentos cuyo presupuesto sea mayor de 60000 */

SELECT nombre,apellido FROM empleados INNER JOIN departamentos ON empleados.Nro_Depto=departamentos.Nro_Depto WHERE presupuesto>60000;



/* 2.12 Añadir un nuevo departamento: Calidad con un presupuesto de 40000 y código 11, añadir un empleado vinculado al departamento 

recién creado: Esther Vazquez, DNI 89267109 */

INSERT INTO departamentos (Nro_Depto,Nombre_Depto,Presupuesto) VALUES ("11","Calidad","40000");

INSERT INTO empleados (DNI,Nombre,Apellido,Nro_Depto) VALUES ("89267109","Esther","Vazquez","11");



/* 2.13 Aplicar un recorte presupuestario del 10% a todos los departamentos */

UPDATE departamentos SET Presupuesto=Presupuesto*0.9;



/* 2.14 Reasignar a los empleados del departamento de investigación (código 77) al departamento de informática (código 14) */

UPDATE empleados SET Nro_Depto = "14" WHERE Nro_Depto = "77";



/* 2.15 Despedir a los empleados del departamento de informática (código 14) */

DELETE FROM empleados WHERE Nro_Depto="14";



/* 2.16 Despedir a los empleados que trabajen en departamentos con un presupuesto superior a 90000 */

DELETE empleados FROM empleados INNER JOIN departamentos ON empleados.Nro_Depto=departamentos.Nro_Depto WHERE Presupuesto>90000;






















