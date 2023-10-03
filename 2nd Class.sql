--- * PRIMARY KEY * ---
-- NECESITAMOS QUE EL VALOR codigolibro SEA UN SOLO CODIGOe

SELECT * FROM libros ORDER BY codigolibro;

-- Vamos a borrar la tabla libros para insertarla de nuevo pero con la primera
-- columna en lugar de ser de tipo varchar, va a ser del tipo primary key
-- lo que hará que cada codigo sea irrepetible.

DROP TABLE IF EXISTS libros;

CREATE TABLE libros(
codigolibro INTEGER PRIMARY KEY,
titulo VARCHAR(40),
autor VARCHAR(30),
nombreeditorial VARCHAR(45),
precio DECIMAL(5,2),
cantidad SMALLINT
);


INSERT INTO libros(codigolibro,titulo, autor,nombreeditorial,precio,cantidad)
VALUES(10001,'El lago','Gil Gamez','El buen lector',850,4),
(10002,'El conejito','Flors','Libro abierto',200.5,2),
(10003,'El elefante','De la Rosa','Mexico',100.5,3),
(10004,'Sor Juana','Juan Galileo','1998',400,4),
(10005,'La Bella','Flors','El lago',500.5,1),
(10006,'Los zapatos de Juana','Flors','La esperanza',100,1),
(10007,'Tasa de café','Anastacia Arco','Forever',200.5,1),
(10008,'Los pecesitos','Cristina Tomás','El buen lector',100.5,2),
(10009,'El sueño dorado','Ana Camello','Mexico',99.9,2),
(10010,'Andrés','Andrés Camareno','Mexico',200.5,4),
(10011,'Tasa de café 2','Anastacia Arco','España',200.5,1),
(10012,'LA tortuga','María Booleana','El buen lector',85.9,null),
(10013,'a felicidad','Gise Esmeralda','Libro abierto',600.5,null),
(10014,'Encontrando a Nemo','Marcos Marcos','Mexico',200.5,2),
(10015,'El arcoiris','Antonio Town','El buen lector',800,null),
(10016,'Programación web extensa','Mauricio Pérez','España',100.5,null),
(10017,'Sin ti','Lorena Garza','Forever',400,null),
(10019,'Antonieta','Flors','El buen lector',200.5,2),
(10020,'Cocinando sueños','De la Rosa','Mexico',100.5,3),
(10021,'El perdedor','Juan Galileo','Mexico',400,4),
(10022,'Doña Juana','Flors','Forever',500.5,1),
(10023,'Caperuza busa','Camilo Rosas','España',100,1),
(10024,'Es resplandor','Anastacia Arco','Mexico',200.5,1),
(10025,'Volver a comenzar','Cristina Tomás','1998',100.5,2),
(10026,'La sonrisa de Amalia','Ana Camello','Esperanza',99.9,2),
(10027,'El piano de Jose','Andrés Camareno','El buen lector',238.5,4),
(10028,'El huerto del terror','Anastacia Arco','Mexico',200.5,1),
(10029,'El payaso de las tinieblas','María Booleana','El buen lector',85.9,null),
(10030,'El bals de la esperanza','Gise Esmeralda','Mexico',600.5,null),
(10031,'Buscando a Hyun','Marcos Marcos','España',520,2),
(10032,'El arcoiris II','Antonio Town','Mexico',800.5,null),
(10033,'Programación en Java a fondo','Mauricio Pérez','España',100.5,null),
(10034,'Calculo I','Lorena Garza','España',150,null),
(10035,'Aprender CSS con Flor','Gise Esmeralda','Esperanza',600.5,null),
(10036,'MySQL a fondo','Marcos Marcos','Libro abierto',200.5,2),
(10037,'Calculo II','Antonio Town','Mexico',800.5,null),
(10038,'Programación en Java a fondo II','Mauricio Pérez','Mexico',100.5,null),
(10039,'Calculo III','Lorena Garza','El pueblo',200.5,null);

SELECT * FROM libros;

-- Probemos que el primary key funciona:

INSERT INTO libros 
VALUES(10001, 'El llano en llamas', 'Juan Rulfo', 'Mexico', 300.50, 4);
-- Este código viola la restricción de unicidad del PK 

-- Pero si metemos un nuevo registro que no tenga la clave duplicada veremos que no 
-- hay restricción:

INSERT INTO libros 
VALUES(10040, 'El llano en llamas', 'Juan Rulfo', 'Mexico', 300.50,4);

SELECT * FROM libros ORDER BY codigolibro;

--- * FOREING KEY & JOINS * ---

-- Ahora vamos a ver como unir a dos o más tablas
-- Para ello vamos a utilizar la clausula FOREING KEY 
-- Esto nos va a permitir añadir la restricción de NO introducir registros con idcliente que no estén dados de alta en 
-- la tabla clientes

-- Relación 1 a muchos: 
-- Un solo cliente tiene muchos pedidos.

CREATE TABLE pedidos(
    idpedido INTEGER PRIMARY KEY,
    idcliente INTEGER,
	descripcion VARCHAR(100),
	fecha DATE
);
CREATE TABLE clientes(
    idcliente INTEGER,
	nombre VARCHAR(45),
    apellidopaterno VARCHAR(45),
	apellidomaterno VARCHAR(45),
	telefono VARCHAR(45),
	PRIMARY KEY(idcliente)
);



INSERT INTO clientes(idcliente,nombre,apellidopaterno,apellidomaterno,telefono)
VALUES (1001,'Alberto','Gomez','Perez','2222222222'),
(1002,'Juan Jose','Sanchez','Guerra','4822222222'),
(1003,'Maria Antonia','Lopez','Gamez','2277222222'),
(1004,'Luis Roman','Espino','Garza','2222262222'),
(1005,'Ana Estela','Juarez','Lima','2222224522'),
(1006,'Jose','Esparza','Suarez','2222223822'),
(1007,'Alberto','Flores','Gonzalez','2222289222'),
(1008,'Luis Pedro','Higo','Suarez','22222423222'),
(1009,'Jose Carlos','Mendoza','Lopez','2222125222'),
(1010,'Maria Laura','Puga','Gomez','2222267422'),
(1011,'Sasha','Lopez','Quintana','2222267422'),
(1012,'Flor Celeste','Ramos','Espino','2228832222'),
(1013,'Jose Alberto','Sosa','Flores','2222888222'),
(1014,'Luis Miguel','Beltran','Gamez','2222211122'),
(1015,'Daniel','Esparza','Suarez','2222220002');
	
INSERT INTO pedidos(idpedido,idcliente,descripcion,fecha)
VALUES(1,'1015','8 Kg de carne para asar','2021-09-01'),
(2,'1012','12 Kg queso fresco','2021-09-01'),
(3,'1001','6 Kg de carne para bictec','2021-09-02'),
(4,'1001','1 Kg de asaderar','2021-09-02'),
(5,'1002','4 Kg de queso crema','2021-09-02'),
(6,'1011','4 L de crema','2021-09-03'),
(7,'1012','1 Kg de carne para asar','2021-09-03'),
(8,'1013','2 Kg de carne para asar','2021-09-03'),
(9,'1008','8 Kg de carne para asar','2021-09-04'),
(10,'1008','1 de asadera','2021-09-05'),
(11,'1001','4 Kg de manteca de cerdo','2021-09-06'),
(12,'1002','2 Kg mantequilla','2021-09-06'),
(13,'1002','12 Kg de carne para bictec','2021-09-07'),
(14,'1009','4 Kg de pata de puerco','2021-09-08'),
(15,'1012','8 Kg de carne de puerco','2021-09-08'),
(16,'1015','15 Kg de cabeza de res','2021-09-09'),
(17,'1012','2 Kg de carne para asar','2021-09-10'),
(18,'1012','1 Kg de carne para asar','2021-09-12');

-- Añadamos un registro a la tabla pedidos con un idcliente que no existe, que si
-- nos va a dejar en esta instancia:
insert into pedidos values(19, '1036', '3kg de arrachera', '2021-03-12');
delete from pedidos where idcliente = '1036';

-- Vamos a unir las tablas usando las funciones JOIN:


SELECT p.idpedido, p.descripcion, p.fecha, c.idcliente, c.nombre ||' '|| c.apellidopaterno ||' '|| c.apellidomaterno AS nombrecompleto
FROM clientes c
INNER JOIN pedidos p
ON c.idcliente = p.idcliente
ORDER BY idcliente

-- Relación 1 a 1:
-- Es una función que relaciona a un solo elemento del dominio con un solo elemento del codominio.

CREATE TABLE estudiantes(
	idestudiante INTEGER PRIMARY KEY,
	apellidos VARCHAR(45),
	nombres VARCHAR(45)
);

CREATE TABLE info_estudiantes(
	id_estudiante INTEGER PRIMARY KEY,
	ciudad VARCHAR(45),
	telefono VARCHAR(45),
	CONSTRAINT FK_id_estudiante FOREIGN KEY (id_estudiante) -- Esta restricción va a hacer que solo podamos ingresar valores registrados en la tabla estudiantes
	REFERENCES estudiantes(idestudiante)
);

INSERT INTO estudiantes(idestudiante,apellidos,nombres)
VALUES(1,'Gomez Perez','Juan'),
(2,'Gonzalez Sazueta','Carlos'),
(3,'Sanchez Ortiz','Cecilia'),
(4,'Camello Perez','Carlos'),
(5,'Gamez Hoya','Ana Maria'),
(6,'Delfin Garza','Jose');

INSERT INTO info_estudiantes(id_estudiante,ciudad,telefono)
VALUES(1,'Guadalajara','1242222299'),
(2,'Monterrey','7742222299'),
(3,'Hermosillo','7878434323'),
(4,'Obregon','8842222299'),
(5,'Guadalajara','8999222299');

--(1,'Cd. de Mexico','1242222299'); este registro viola la restricción de unicidad del FOREING KEY
INSERT INTO estudiantes 
VALUES(7, 'Vega Montes', 'Juan')

INSERT INTO info_estudiantes 
VALUES(7, 'Monterrey', '4433223344')

--INSERT INTO info_estudiantes
--VALUES(8, 'Morelia', '33442234433') Key (id_estudiante)=(8) is not present in table "estudiantes"

--Vamos a unir las tablas

SELECT c.idestudiante, c.nombres ||' '|| c.apellidos AS nombre_completo, p.ciudad, p.telefono  
FROM estudiantes c
INNER JOIN info_estudiantes p
ON c.idestudiante = p.id_estudiante
ORDER BY idestudiante;

-- podemos, alternativamente, usar un JOIN sin necesidad de usar el INNER JOIN

SELECT c.idcliente, c.nombre ||' '|| c.apellidopaterno ||' '|| c.apellidomaterno AS nombre_completo, c.telefono, p.idpedido, p.descripcion, p.fecha
FROM clientes c
JOIN pedidos p 
ON c.idcliente = p.idcliente
ORDER BY  c.idcliente;

-- podemos usar otro tipo de JOIN que se llama LEFT JOIN

DROP TABLE IF EXISTS libros;

-- Vamos a crear otra tabla llamada libros:


CREATE TABLE libros(
codigolibro INTEGER PRIMARY KEY,
titulo VARCHAR(40),
codigoautor INTEGER,
codigoeditorial INTEGER,
precio DECIMAL(5,2),
cantidad SMALLINT
);

INSERT INTO libros(codigolibro,titulo, codigoautor,codigoeditorial,precio,cantidad)
VALUES(10001,'el aleph',1,220,450,5),
(10002,'El conejito',1,221,200.5,2),
(10003,'El elefante',5,222,100.5,3),
(10004,'Sor Juana',3,223,400,4),
(10005,'La Bella',2,224,500.5,1),
(10006,'Los zapatos de Juana',1,225,100,1),
(10007,'Tasa de café',7,226,200.5,1),
(10008,'Los pecesitos',2,227,100.5,2),
(10009,'El sueño dorado',4,228,99.9,2),
(10010,'Andrés',8,229,200.5,4),
(10011,'Tasa de café 2',1,230,200.5,1),
(10012,'LA tortuga',1,231,85.9,null),
(10013,'a felicidad',1,232,600.5,null),
(10014,'Encontrando a Nemo',2,233,200.5,2),
(10015,'El arcoiris',7,234,800.5,null),
(10016,'Programación web extensa',7,235,100.5,null),
(10017,'Sin ti',4,236,200.5,null),
(10018,'Los sueños de Andrea',4,238,450,5),
(10019,'Antonieta',1,239,200.5,2),
(10020,'Cocinando sueños',9,240,100.5,3),
(10021,'El perdedor',7,241,400,4),
(10022,'Doña Juana',4,232,500.5,1),
(10023,'Caperuza busa',1,228,100,1),
(10024,'Es resplandor',2,226,200.5,1),
(10025,'Volver a comenzar',4,225,100.5,2),
(10026,'La sonrisa de Amalia',80,228,99.9,2),
(10027,'El piano de Jose',81,229,238.5,4),
(10028,'El huerto del terror',82,221,200.5,1),
(10029,'El payaso de las tinieblas',83,221,85.9,null),
(10030,'El bals de la esperanza',84,220,600.5,null),
(10031,'Buscando a Hyun',85,226,200.5,2),
(10032,'El arcoiris II',86,221,800.5,null),
(10033,'Programación en Java a fondo',87,227,100.5,null),
(10034,'Calculo I',88,232,200.5,null),
(10035,'Aprender CSS con Flor',88,220,600.5,null),
(10036,'MySQL a fondo',88,226,200.5,2),
(10037,'Calculo II',87,221,800.5,null),
(10038,'Programación en Java a fondo II',2,227,100.5,null),
(10039,'Calculo III',1,232,200.5,null);

-- El codigoeditorial no contiene más información en la tabla libros, pero en la tabla editorial contiene la información necesaria a cerca de la editorial

CREATE TABLE editorial(
codigo_editorial INTEGER,
nombre VARCHAR(45),
ciudad VARCHAR(45),
estado VARCHAR(45)
);

INSERT INTO editorial 
VALUES(220,'Mexico','Tijuana','Baja California'),
(221,'El buen lector','Celaya','Guanajuato'),
(222,'El capricho','Leon','Guanajuato'),
(223,'Forever 89','Mazatlan','Sinaloa'),
(224,'1950','Hermosillo','Sonora'),
(225,'Violeta','Navojoa','Sonora'),
(226,'Esperanza','Monterrey','Nuevo Leon'),
(227,'La luna','Monterrey','Nuevo Leon'),
(228,'Horizonte del mañana','Puebla','Puebla'),
(229,'Las flores','Guadalajara','Jalisco'),
(230,'Renacer','Puerto Vallarta','Jalisco'),
(231,'Celeste','Tepic','Nayarit'),
(232,'Antonios','Guadalajara','Jalisco'),
(233,'Madrid','Tijuana','Baja California'),
(234,'Paris','Mexicali','Baja California'),
(235,'California','Monterrey','Nuevo Leon'),
(236,'Monterrey','Monterrey','Nuevo Leon'),
(237,'Editorial Castellana','Guadalajara','Jalisco'),
(238,'La aventura lectora','Monterrey','Nuevo Leon');


-- Vamos a unir la tabla libro con la tabla editorial a partir del codigo editorial:

SELECT l.titulo, l.codigoautor, l.codigoeditorial, e.nombre AS nombre_editorial, e.ciudad ||', '|| e.estado AS lugar
FROM libros l
JOIN editorial e
ON l.codigoeditorial = e.codigo_editorial;


-- Añadiré algunos registros con editoriales con codigos que no se encuentran en la tabla libros para usar el LEFT JOIN:
INSERT INTO editorial 
VALUES(804, 'Arial', 'Morelia', 'Michoacan'),
(805, 'Vermont', 'Celaya', 'Guanajuato');


SELECT * FROM editorial ORDER BY codigo_editorial;

-- El LEFT JOIN nos va a ayudar a poder saber en que editoriales no hay libros
-- Que registros de una tabla no se encuentran en otra tabla.

SELECT * FROM euditorial;
LEFT JOIN libros
ON libros.codigoeditorial = editorial.codigo_editorial
ORDER BY codigo_editorial

-- Se usa para hacer coincidir registros de una  tabla izquieda en una tabla derecha, en pocas palabras vamos a buscar registros por codigo editorial en la tabla editorial
-- y vamos a ver si se encuentran en la tabla libros.

-- Por lo tanto, si un valor de la tabla izquieda (en este caso la tabla editorial) no está en la tabla derecha (libros) entonces va a rellenar esas casillas con valores nulos.

-- Para realizar otro ejercicio vamos a añadir dos tablas nuevas:

DROP TABLE IF EXISTS empleados;

CREATE TABLE empleados(
idempleado INTEGER PRIMARY KEY,
nombre VARCHAR(45),
puestoid INTEGER
);

INSERT INTO empleados VALUES
(1000,'Juan',1),
(1001,'Jose',1),
(1002,'Daniel',4),
(1003,'Laura',2),
(1004,'Carlos',1),
(1005,'Daniel',1),
(1006,'Luna',3),
(1007,'Oscar',5),
(1008,'Joao',6),
(1009,'Gabriel',7),
(1010,'Pedro',7),
(1011,'Jesus',2),
(1012,'Linda',6),
(1013,'Ana',7),
(1014,'Maria',7),
(1015,'Jose Carlos',2);




CREATE TABLE puestos(
puestoid INTEGER PRIMARY KEY,
nombrepuesto VARCHAR(45)
);


INSERT INTO puestos VALUES
(1,'Limpieza'),
(2,'Secretaria'),
(3,'Cajera'),
(4,'Facturista'),
(5,'Capturista'),
(6,'Contador'),
(7,'RH'),
(8,'Gerente'),
(9,'Subgerente'),
(10,'Jardinero'),
(11,'Office boy'),
(12,'Cocinero personal');


-- Aqui nos va a decir cuales puestos no tinene ningun empleado

SELECT * FROM puestos
LEFT JOIN empleados
ON puestos.puestoid = empleados.puestoid
ORDER BY puestos.puestoid

-- Aquí nos da los que hacen match únicamente

SELECT e.puestoid, p.nombrepuesto, e.idempleado, e.nombre FROM empleados e
JOIN puestos p
ON e.puestoid = p.puestoid
ORDER BY e.puestoid

-- RIGHT JOIN
-- El RIGHT JOIN hace la misma dinamica diciendonos que registros de la tabla derecha no estan en la tabla izquierda. A diferencia del LEFT JOIN
-- el RIGHT JOIN da preferencia a los registros de la tabla derecha, prueva este código:

SELECT * FROM empleados
RIGHT JOIN puestos
ON puestos.puestoid = empleados.puestoid
ORDER BY puestos.puestoid

-- en este caso hay más puestos que empleados que los ocupan

SELECT e.idempleado, p.puestoid, p.nombrepuesto FROM empleados e
RIGHT JOIN puestos p
ON p.puestoid = e.puestoid
ORDER BY idempleado


-- * ALTER TABLE * --


DROP TABLE IF EXISTS info_estudiantes;

CREATE  TABLE infoestudiante(
id_estudiante INTEGER,
ciudad VARCHAR(45),
telefono VARCHAR(12),
CONSTRAINT FK_id_estudiante FOREIGN KEY (id_estudiante)
REFERENCES estudiantes(idestudiante)
);


INSERT INTO infoestudiante(id_estudiante,ciudad,telefono)
VALUES(1,'Guadalajara','1242222299'),(2,'Monterrey','7742222299'),
(3,'Hermosillo','7878434323'),(4,'Obregon','8842222299'),
(5,'Guadalajara','8999222299'),(1,'Cd. de Mexico','1242222299');


-- Podemos cambiarle el nombre a nuestra tabla con ALTER TABLE de la siguiente manera:
ALTER TABLE infoestudiante RENAME TO info_estudiante;

-- Adempás podemos añadir columnas a nuestra tabla con ALTER TABLE:

ALTER TABLE info_estudiante ADD columna_1 VARCHAR(45);
ALTER TABLE info_estudiante ADD COLUMN columna_2 VARCHAR(45);

-- O borrarlas:
ALTER TABLE info_estudiante DROP COLUMN columna_2;
ALTER TABLE info_estudiante DROP COLUMN IF EXISTS columna_1, DROP COLUMN IF EXISTS columna_2;

-- Prueba operaciones con columnas:

CREATE TABLE sumas_restas(
	columna_1 INTEGER,
	columna_2 INTEGER,
	columna_3 INTEGER
);

INSERT INTO sumas_restas 
VALUES(1,2,null),
(2,3,null),
(4,5,null),
(5,6,null),
(6,7,null);

UPDATE sumas_restas
SET columna_3 = columna_2 + columna_1;

-----------------------------------------------------------------------------------------------------------

-- Además con ALTER TABLE podemos hacer PRIMARY KEY una clave:
DELETE FROM info_estudiante WHERE id_estudiante = 1;
ALTER TABLE info_estudiante ADD PRIMARY KEY(id_estudiante);
ALTER TABLE info_estudiante ADD FOREING KEY(id_estudiante) REFERENCES  estudiantes(idestudiante); -- no podremos añadir un registro en la tabla info_estudiante con id_estudiante que no esté en la tabla estudiantes

INSERT INTO info_estudiante
VALUES(10, 'Patzcuaro', '4545454545');

-- ERROR:  Key (id_estudiante)=(10) is not present in table "estudiantes".insert or update on table "info_estudiante" violates foreign key constraint "fk_id_estudiante" 


-- Vamos ahora a utilizar los JOINS con la claudula GROUP BY
-- Primero vamos a hacer un left join para ver el libro con su editorial (nombre de la editorial en la nueva tabla como editorial)

SELECT l.codigolibro, l.titulo, l.codigoeditorial, e.nombre AS editorial, e.ciudad||', '|| e.estado AS lugar, l.precio, l.cantidad FROM libros l
LEFT JOIN editorial e
ON l.codigoeditorial = e.codigo_editorial
ORDER BY codigoeditorial;

-- Nos gustaria saber cuantos libros hay por editorial, para eso usaremos el GROUP BY:


ALTER TABLE editorial RENAME COLUMN nombre TO nombre_editorial

SELECT e.codigo_editorial, e.nombre_editorial, e.ciudad ||', '|| e.estado AS lugar, COUNT(*)
FROM editorial e
JOIN libros l 
ON l.codigoeditorial = e.codigo_editorial
GROUP BY e.nombre_editorial, e.codigo_editorial, e.ciudad, e.estado
ORDER BY count DESC


-- Añadimos valores a la tabla editorial:
INSERT INTO editorial VALUES
(801,'El puerto','Celaya','Guanajuato'),
(802,'El intelectual','Leon','Guanajuato'),
(803,'Cartoons','Mazatlan','Sinaloa'),
(804,'Renacer','Hermosillo','Sonora'),
(805,'La casita del lector','Navojoa','Sonora'),
(806,'La hermosa','Monterrey','Nuevo Leon');

SELECT * FROM editorial WHERE codigo_editorial = 801 (!)


-- Prueba de tablas en .csv:

CREATE TABLE ejercicios(
	Ent_Mun VARCHAR(100),
	Sucursal VARCHAR (100),
	Gru_Descrip VARCHAR (450),
	Are_Descrip VARCHAR (450),
	Sar_Descrip VARCHAR (450),
	Anio INTEGER,
	Mes INTEGER,
	Mes_Desc VARCHAR (450),
	Decripcion_de_Gasto VARCHAR (450),
	Erc_Id INTEGER,
	Gas_Clave INTEGER,
	Monto DECIMAL (10,2),
	Cog_Cargo DECIMAL (10,2),
	Pro_Descrip VARCHAR(100),
	Gas_Descrip VARCHAR (450),
	Fig_Desc VARCHAR (450)
);

COPY ejercicios(Ent_Mun,Sucursal,Gru_Descrip,Are_Descrip,Sar_Descrip,Anio,Mes,Mes_Desc,
		   Decripcion_de_Gasto,Erc_Id,Gas_Clave,Monto,Cog_Cargo,Pro_Descrip,Gas_Descrip,Fig_Desc)
FROM '/Users/carloscarrillolazaro/Desktop/SQL/ejercicios.csv'
DELIMITER ',' CSV HEADER;




SELECT * FROM ejercicios;

-- EJERCICIOS:

-- 1. Realizar una(s) gráfica(s) que muestre(n) la participación (%) de cada uno de los conceptos de gasto con respecto al total de gastos. Tanto para 2022 como para 2023.

SELECT DISTINCT descripcion_de_gasto FROM ejercicios;

SELECT * FROM descripcion_de_gasto

CREATE TABLE descripcion_de_gasto
AS SELECT DISTINCT descripcion_de_gasto
FROM ejercicios


ALTER TABLE descripcion_de_gasto ADD COLUMN suma DECIMAL(12,2);

-- COSTO INTEGRAL POR PERSONA

SELECT 
SUM(monto)
FROM ejercicios WHERE descripcion_de_gasto = 'COSTO INTEGRAL POR PERSONA';

UPDATE descripcion_de_gasto 
SET suma = 834206755.84
WHERE descripcion_de_gasto = 'COSTO INTEGRAL POR PERSONA';

-- GASTOS DE VIAJE

SELECT 
SUM(monto)
FROM ejercicios WHERE descripcion_de_gasto = 'GASTOS DE VIAJE';

UPDATE descripcion_de_gasto 
SET suma = 51291620.68
WHERE descripcion_de_gasto = 'GASTOS DE VIAJE';


-- BROKERS / SERVICIOS DE INFORMACION

SELECT 
SUM(monto)
FROM ejercicios WHERE descripcion_de_gasto = 'BROKERS / SERVICIOS DE INFORMACION';

UPDATE descripcion_de_gasto 
SET suma = 13652402.60
WHERE descripcion_de_gasto = 'BROKERS / SERVICIOS DE INFORMACION';



-- RENTA OFICINAS

SELECT 
SUM(monto)
FROM ejercicios WHERE descripcion_de_gasto = 'RENTA OFICINAS';

UPDATE descripcion_de_gasto 
SET suma = 624347866.51
WHERE descripcion_de_gasto = 'RENTA OFICINAS';


-- PAPELERIA Y UTILES DE ESCRITORIO

SELECT 
SUM(monto)
FROM ejercicios WHERE descripcion_de_gasto = 'PAPELERIA Y UTILES DE ESCRITORIO';

UPDATE descripcion_de_gasto 
SET suma = 22879067.55
WHERE descripcion_de_gasto = 'PAPELERIA Y UTILES DE ESCRITORIO';


-- brOKERS / SERVICIOS DE INFORMACION

SELECT 
SUM(monto)
FROM ejercicios WHERE descripcion_de_gasto = 'brOKERS / SERVICIOS DE INFORMACION';

UPDATE descripcion_de_gasto 
SET suma = 0.00
WHERE descripcion_de_gasto = 'brOKERS / SERVICIOS DE INFORMACION';


-- GASTOS CON CLIENTES

SELECT 
SUM(monto)
FROM ejercicios WHERE descripcion_de_gasto = 'GASTOS CON CLIENTES';

UPDATE descripcion_de_gasto 
SET suma = 91831184.50
WHERE descripcion_de_gasto = 'GASTOS CON CLIENTES';


-- 2. Indicar cual es el promedio mensual para cada concepto de gasto. 

-- 3. Completar el siguiente cuadro resumen: 

-- Flg Descrip	| Sucursal	|  Monto total  |  Pro Descrip
-- 460294.1.45  |		    |               |
-- 567264.1.1	|		    |               |
-- 567234.1.1	|		    |               |

-- 4. Enlistar las 10 sucursales con mayor gasto en Renta de Oficina

-- 5. Realizar una gráfica donde se pueda ver claramente los gastos totales realizados por la sucursal de MONTERREY I KGVON diferenciando los realiados en 2022 y en 2023. 



--------------------------------------------------------------------------------------------------


-- Usando un LEFT JOIN y un GROUP BY para saber cuales son las editoriales que están en la tabla libros haremos:

SELECT e.nombre_editorial, COUNT(l.codigoeditorial)
FROM editorial e
LEFT JOIN libros l
ON e.codigo_editorial = l.codigoeditorial
GROUP BY e.nombre_editorial
ORDER BY count DESC


-- Copiar una tabla de excel en .csv a postgreSQL:

-- Primero vamos a borrar la tabla empleados para volverla a ingresar:

DROP TABLE IF EXISTS empleados;

-- Creamos las columnas de la tabla empleados:

CREATE TABLE empleados(
	empleadoid VARCHAR(42),
	nombre VARCHAR(42),
	apellidopaterno VARCHAR(42),
	apellidomaterno VARCHAR(42),
	edad INTEGER,
	telefono BIGINT,
	sueldo DECIMAL (8,2),
	puesto VARCHAR(42)
)

-- Copiamos los registros de la tabla con extensión .csv:

COPY empleados(empleadoid, nombre, apellidopaterno, apellidomaterno, 
				edad, telefono, sueldo, puesto)
FROM '/Users/carloscarrillolazaro/Desktop/SQL/TABLAS/employees.csv'
DELIMITER ',' CSV HEADER


-- Para obtener los registros con entradas distintas hacemos el siguiente código:

SELECT DISTINCT puesto FROM empleados;

-- CREATE SELECT vamos a crear tablas a partir de otras tablas:

CREATE TABLE puestos
AS SELECT DISTINCT puesto 
FROM empleados;


CREATE TABLE vendedores
AS SELECT nombre, apellidopaterno, apellidomaterno,
edad, telefono, sueldo
FROM empleados 
WHERE puesto = 'Vendedor'






















