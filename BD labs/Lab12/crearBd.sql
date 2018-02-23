/*
*	LABORATORIO 12: Creación de Constraints Para Instrumentar Integridad Referencial en SQL Server
*	Dante Maximiliano Flores Moreno
*	A01207543
*/


/*
-----------------------------------EJERCICIO 1-----------------------------------------------
*/
--	CREACION DE LAS TABLAS


-- Crear Materiales
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Materiales')

DROP TABLE Materiales 

CREATE TABLE Materiales 
( 
  Clave numeric(5) not null, 
  Descripcion varchar(50), 
  Costo numeric (8,2) 
) 



-- Crear Proveedores
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Proveedores')

DROP TABLE Proveedores 

CREATE TABLE Proveedores 
( 
  RFC char(13) not null, 
  RazonSocial varchar(50) 
) 



-- Crear Proyectos
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Proyectos')

DROP TABLE Proyectos

CREATE TABLE Proyectos 
( 
  Numero numeric(5) not null, 
  Denominacion varchar(50) 
) 


-- Crear Entregan
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Entregan')

DROP TABLE Entregan 

CREATE TABLE Entregan 
( 
  Clave numeric(5) not null, 
  RFC char(13) not null, 
  Numero numeric(5) not null, 
  Fecha DateTime not null, 
  Cantidad numeric (8,2) 
) 




--	CARGA DE DATOS A LAS TABLAS


--Carga de Materiales
BULK INSERT a1207543.a1207543.Materiales
   FROM 'e:\wwwroot\a1207543\materiales.csv'
   WITH 
      (
         CODEPAGE = 'ACP',
         FIELDTERMINATOR = ',',
         ROWTERMINATOR = '\n'
      )


--Carga de Proveedores
BULK INSERT a1207543.a1207543.Proveedores
   FROM 'e:\wwwroot\a1207543\proveedores.csv'
   WITH 
      (
         CODEPAGE = 'ACP',
         FIELDTERMINATOR = ',',
         ROWTERMINATOR = '\n'
      )


--Carga de Proyectos
BULK INSERT a1207543.a1207543.Proyectos
   FROM 'e:\wwwroot\a1207543\proyectos.csv'
   WITH 
      (
         CODEPAGE = 'ACP',
         FIELDTERMINATOR = ',',
         ROWTERMINATOR = '\n'
      )


--Carga de Entergan
SET DATEFORMAT dmy

BULK INSERT a1207543.a1207543.Entregan
   FROM 'e:\wwwroot\a1207543\entregan.csv'
   WITH 
      (
         CODEPAGE = 'ACP',
         FIELDTERMINATOR = ',',
         ROWTERMINATOR = '\n'
      )



/*
-----------------------------------EJERCICIO 2-----------------------------------------------
*/
--Consultar tabla completa de Materiales
SELECT * FROM Materiales

--Agregar una nueva linea a la tabla materiales
INSERT INTO Materiales
	VALUES (1000,'xxx',1000)

--Eliminar todos los materiales con un costo y clave de 1000
DELETE 
FROM Materiales
WHERE Clave = 1000 AND Costo = 1000

--Definir Clave como llave primaria de Materiales mediante un constraint
ALTER TABLE Materiales
ADD CONSTRAINT llaveMateriales
PRIMARY KEY (Clave)

--Verificar constraints de las tablas
sp_helpconstraint Materiales 
sp_helpconstraint Proveedores 
sp_helpconstraint Proyectos 
sp_helpconstraint Entregan 


--Definir RFC como llave primaria de Proveedores mediante un constraint
ALTER TABLE Proveedores
ADD CONSTRAINT llaveProveedores
PRIMARY KEY (RFC)

--Definir RFC como llave primaria de Proyectos mediante un constraint
ALTER TABLE Proyectos
ADD CONSTRAINT llaveProyectos
PRIMARY KEY (Numero)

--Definir llave primaria de Entregan mediante un constraint
ALTER TABLE Entregan
ADD CONSTRAINT llaveEntregan
PRIMARY KEY (Clave, RFC, Numero, Fecha)

/*
-----------------------------------EJERCICIO 3-----------------------------------------------
*/

-- Consultar todos los datos de las tablas
SELECT *
FROM Materiales

SELECT *
FROM Proveedores

SELECT * 
FROM Proyectos

SELECT * 
FROM Entregan

-- Insertar dato inconsistente
INSERT INTO Entregan
VALUES (0, 'xxx', 0, '1-jan-02', 0)

-- Borrar dato inconsistente
DELETE FROM Entregan
WHERE Clave = 0

-- Asignar llave foranea de Entregan
ALTER TABLE Entregan 
ADD CONSTRAINT cfentreganClave 
FOREIGN KEY (Clave) 
REFERENCES Materiales(Clave)

ALTER TABLE Entregan 
ADD CONSTRAINT cfentreganRFC 
FOREIGN KEY (RFC) 
REFERENCES Proveedores(RFC)

ALTER TABLE Entregan 
ADD CONSTRAINT cfentreganNumero 
FOREIGN KEY (Numero) 
REFERENCES Proyectos(Numero)

/*
-----------------------------------EJERCICIO 4-----------------------------------------------
*/

--Agregar un registro con cantidad 0 a la tabla
INSERT INTO Entregan 
VALUES (1000, 'AAAA800101', 5000, GETDATE(), 0)

--Borrar registros que tengan cantidad 0
DELETE FROM Entregan
WHERE Cantidad = 0

--Agregar un constraint para que solo acepte registros con cantidades mayor a 0
ALTER TABLE Entregan
ADD CONSTRAINT Cantidad 
CHECK(Cantidad > 0)

