# Curso-Basico-SQL-Postgres
Curso (extremadamente) básico de SQL con pgadmin4. 

Este curso en realidad es la transcripción en código de este video:
#### https://www.youtube.com/watch?v=HGfrzsGg3As&t=14909s



-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 1era Parte

-- Crear una tabla:

CREATE TABLE empleados(
num_empleado INTEGER,
nombre VARCHAR(45),
apellido_pat VARCHAR(45),
apellido_mat VARCHAR(45),
fecha_nac DATE,
sueldo DECIMAL(7,2),
puesto VARCHAR(45)
);

-- Insertar valores en la tabla por columnas:

INSERT INTO empleados(num_empleado, nombre, apellido_pat, apellido_mat, fecha_nac, sueldo, puesto)
VALUES (1, 'Jorge Antonio', 'Sánchez', 'Pérez', '1997-07-28', 4250.8, 'Contador'),
       (2, 'Maria', 'López', 'Miranda', '1997-12-09', 95234.96, 'Director'),
	   (3, 'Isabel', 'Sánchez', 'Montesinos', '1992-06-12', 5345.02, 'Gerente');

-- Seleccionar Tablas o Partes de la tabla:

SELECT * FROM empleados;

SELECT nombre, apellido_pat, apellido_mat, sueldo FROM empleados;

SELECT nombre, apellido_pat, sueldo FROM empleados;


-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
CREATE TABLE alumnos(
numcontrol BIGINT, -- BIGINT es un tipo de dato entero grande --
nombre VARCHAR(45), -- VARCHAR es un tipo de dato texto --
apellidopaterno VARCHAR(45),
apellidomaterno VARCHAR(45),
fechaingreso DATE, -- DATE tipo de dato tipo fecha --
fechanacimiento DATE, 
telefono VARCHAR(12),
idcarrera VARCHAR(45),
promedio DECIMAL(6,2) -- DECIMAL tipo de dato tipo flotante --
);


-- Ahora se meten los datos en las tablas con el siguiente comando y los siguientes vectores transpuestos --
INSERT INTO alumnos(numcontrol,nombre,apellidopaterno,apellidomaterno,fechaingreso,fechanacimiento,telefono,idcarrera,promedio)
 VALUES(1000,'Juan','Vazquez','Perez','2016-05-08','1992-02-18',
'1234564343',1,95.92),(1001,'Juan','Vazquez','Perez','2018-02-08','1991-05-12',
'1234564348',4,85.2),(1002,'Carlos Miguel','Lopez','Perez','2017-03-15','1989-07-15',
'1234564349',2,90),(1003,'Maria Carlota','SAnchez','Perez','2018-02-02','1995-08-17',
'1234564322',2,95.8),(1004,'Casandra','Gavilan','Gonzalez','2018-07-25','1995-06-18',
'1234564335',1,89.2),(1005,'Andrea','Davila','Antonios','2018-06-02','1996-06-21',
'1234564326',3,99),(1006,'Joao','Aguiar','Garza','2015-03-15','1993-03-28',
'1234564327',2,92.4),(1007,'Daniel','Zambrano','Espino','2015-07-18','1996-02-05',
'1234564328',4,100),(1008,'Flor','Velazquez','Espinoza','2017-02-08','1995-05-07',
'1234564345',5,100),(1009,'Celeste','Vazquez','De la O','2015-08-22','1995-01-31',
'1234564385',6,99.9),(1010,'Abigail','Andrade','Beltran','2020-05-12','1999-01-17',
'1234564373',4,85.2),(1011,'Juan Carlos','Espinoza','Campos','2020-05-15','1995-01-15',
'1234564399',2,100),(1012,'Dionicio','Espino','Espinoza','2021-06-15','2003-05-12',
'1234564398',1,85),(1013,'Jose Carlos','Flores','Garcia','2021-07-17','2003-08-12',
'1234564390',1,82.9),(1014,'Jose Pedro','Valle','Perez','2021-08-01','2002-06-25',
'1234564312',1,84.2),(1015,'Miguel Luis','Flores','Sanchez','2021-01-15','2002-05-28',
'1234564315',2,92.5),(1016,'JoseMarcelo','Gonzalez','Miranda','2018-05-12','1998-06-25',
'1234564222',5,75.9),(1017,'Flor Estela','Huerta','Espinosa','2018-07-09','1998-06-25',
'1234564555',6,91.1),(1018,'Cristian Jesus','Kilberth','Perez','2018-01-08','1998-02-01',
'1234564532',7,94.2),(1019,'Maria Cecilia','Lopez','Lopez','2020-07-28','2003-05-25',
'1234564145',8,85.6),(1020,'Juan Alberto','Martinez','Vazquez','2016-07-22','1998-02-25',
'1234564142',7,80.2),(1021,'Franchesco Daniel','Nunez','Perez','2017-07-15','1995-09-02',
'1234564248',8,99.2),(1022,'Laura','Quinonez','Garcia','2020-02-08','2003-05-04',
'1234564788',7,95.2);

SELECT * FROM alumnos;

-- Clausula WHERE nos va a ayudar a ver la información que necesitamos la información en ese momento.
-- Por ejemplo, si queremos ver solo a los alumnos de esta base de datos que tienen promedio mayor o igual a 70.

SELECT * FROM alumnos WHERE promedio>=70; -- Este ejemplo no es demostrativo porque todos los alumnos tienen más de 70.

SELECT * FROM alumnos WHERE promedio>=90; --Esta linea nos da los alumnos que tienen promedio mayor a 90 (igual no como en Python ==)

SELECT nombre, apellidopaterno, apellidomaterno, idcarrera, promedio FROM alumnos WHERE promedio>=90; -- subtabla alumnos solo con nombre completo--

-- Vamos a hacer una concatenación de nombre y apellido con "||" y vamos a renombrar esa columna con la sentencia AS --

SELECT nombre ||' '|| apellidopaterno ||' '|| apellidomaterno AS Nombre_Completo, promedio FROM alumnos WHERE promedio>=90;

-- Podemos establecer más de una condición en las consultas con los operadores lógicos AND u OR --

SELECT nombre ||' '|| apellidopaterno ||' '|| apellidomaterno AS Nombre_Completo, promedio, idcarrera FROM alumnos 
WHERE promedio>=90 AND idcarrera='1';

SELECT nombre ||' '|| apellidopaterno ||' '|| apellidomaterno AS Nombre_Completo, promedio, idcarrera FROM alumnos 
WHERE promedio>=90 AND idcarrera='2';

SELECT nombre ||' '|| apellidopaterno ||' '|| apellidomaterno AS Nombre_Completo, promedio, idcarrera FROM alumnos 
WHERE promedio<90 OR idcarrera='3'; -- Que estudie la carrera 3 ó que tenga promedio menor que 90 ó ambos --

SELECT nombre ||' '|| apellidopaterno ||' '|| apellidomaterno AS Nombre_Completo, promedio, idcarrera FROM alumnos 
WHERE NOT idcarrera='3'; -- Que no estudie la carrera 3 --


-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

CREATE TABLE clientes(
idcliente INTEGER,
nombre VARCHAR(45),
apellidopaterno VARCHAR(45),
apellidomaterno VARCHAR(45),
telefono VARCHAR(12),
ciudad VARCHAR(45),
estado VARCHAR(45),
totaldeuda DECIMAL(8,2),
tipocliente CHARACTER(1)
);
	
INSERT INTO clientes VALUES(1000,'Alberto','Esparza','Suarez','2222222222','Mochis','Sinaloa',8000,'A'),
(1001,'Alberto','Gomez','Perez','2222222222','Mochis','Sinaloa',8000,'A'),
(1002,'Juan Jose','Sanchez','Guerra','2222222222','Mazatlan','Sinaloa',15000,'A'),
(1003,'Maria Antonia','Lopez','Gamez','2222222222','Guasave','Sinaloa',2500,'B'),
(1004,'Luis Roman','Espino','Garza','2222222222','Guadalajara','Jalisco',1000,'A'),
(1005,'Ana Estela','Juarez','Lima','2222222222','Mochis','Sinaloa',250.4,'C'),
(1006,'Jose','Esparza','Suarez','2222222222','Guadalajara','Jalisco',800,'A'),
(1007,'Alberto','Flores','Gonzalez','2222222222','Tijuana','Baja California',1500,'B'),
(1008,'Luis Pedro','Higo','Suarez','2222222222','Tijuana','Baja California',1000,'A'),
(1009,'Jose Carlos','Mendoza','Lopez','2222222222','Ensenada','Baja California',4500,'A'),
(1010,'Maria Laura','Puga','Gomez','2222222222','Mochis','Sinaloa',2000,'A'),
(1011,'Sasha','Lopez','Quintana','2222222222','Puerto Vallarta','Jalisco',1500,'B'),
(1012,'Flor Celeste','Ramos','Espino','2222222222','Veracruz','Veracruz',8000,'A'),
(1013,'Jose Alberto','Sosa','Flores','2222222222','Acapulco','Guerrero',8000,'B'),
(1014,'Luis Miguel','Beltran','Gamez','2222222222','Mochis','Sinaloa',4000.2,'A'),
(1014,'Daniel','Esparza','Suarez','2222222222','Mochis','Sinaloa',12000,'C');

SELECT * FROM clientes;

-- 2da Parte


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


























