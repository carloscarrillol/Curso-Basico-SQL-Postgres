CREATE TABLE empleados(
num_empleado INTEGER,
nombre VARCHAR(45),
apellido_pat VARCHAR(45),
apellido_mat VARCHAR(45),
fecha_nac DATE,
sueldo DECIMAL(7,2),
puesto VARCHAR(45)
);

INSERT INTO empleados(num_empleado, nombre, apellido_pat, apellido_mat, fecha_nac, sueldo, puesto)
VALUES (1, 'Jorge Antonio', 'Sánchez', 'Pérez', '1997-07-28', 4250.8, 'Contador'),
       (2, 'Maria', 'López', 'Miranda', '1997-12-09', 95234.96, 'Director'),
	   (3, 'Isabel', 'Sánchez', 'Montesinos', '1992-06-12', 5345.02, 'Gerente');

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


