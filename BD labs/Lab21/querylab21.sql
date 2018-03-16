/*
*	Dante Maximiliano Flores Moreno
*	A01207543
*	BASES DE DATOS
*	LABORATORIO 19
*/


-------------PROCEDIMIENTOS MATERIALES----------------

-- Crear procedimiento 'CrearMaterial'
IF EXISTS (SELECT name FROM sysobjects WHERE name = 'creaMaterial' AND type = 'P')
                DROP PROCEDURE creaMaterial
            GO
            
            CREATE PROCEDURE creaMaterial
                @uclave NUMERIC(5,0),
                @udescripcion VARCHAR(50),
                @ucosto NUMERIC(8,2),
                @uimpuesto NUMERIC(6,2)
            AS
                INSERT INTO Materiales VALUES(@uclave, @udescripcion, @ucosto, @uimpuesto)
            GO


-- Ejecutar procedimiento 'crearMaterial'
EXECUTE creaMaterial 5000,'Martillos Acme',250,15 



-- Crear procedimiento 'modificaMaterial
IF EXISTS (SELECT name FROM sysobjects WHERE name = 'modificarMaterial' AND type = 'P')
                DROP PROCEDURE modificarMaterial
            GO
            
            CREATE PROCEDURE modificarMaterial
                @uclave NUMERIC(5,0),
                @udescripcion VARCHAR(50),
                @ucosto NUMERIC(8,2),
                @uimpuesto NUMERIC(6,2)
            AS
                UPDATE Materiales
				SET Descripcion=@udescripcion, Costo=@ucosto, PorcentajeImpuesto=@uimpuesto
				WHERE Clave=@uclave
            GO

-- Crear procedimiento 'eliminarMaterial'
IF EXISTS (SELECT name FROM sysobjects WHERE name = 'eliminarMaterial' AND type = 'P')
                DROP PROCEDURE eliminarMaterial
            GO
            
            CREATE PROCEDURE eliminarMaterial
                @uclave NUMERIC(5,0)
            AS
                DELETE FROM Materiales WHERE Clave=@uclave
		    GO


-------------PROCEDIMIENTOS PROYECTOS----------------


-- Crear procedimiento 'crearProyecto'
IF EXISTS (SELECT name FROM sysobjects WHERE name = 'crearProyecto' AND type = 'P')
                DROP PROCEDURE crearProyecto
            GO
            
            CREATE PROCEDURE crearProyecto
                @unumero NUMERIC(5,0),
                @udenominacion VARCHAR(50)
            AS
                INSERT INTO Proyectos VALUES(@unumero, @udenominacion)
            GO

-- Crear procedimiento 'modificarProyecto'
IF EXISTS (SELECT name FROM sysobjects WHERE name = 'modificarProyecto' AND type = 'P')
                DROP PROCEDURE modificarProyecto
            GO
            
            CREATE PROCEDURE modificarProyecto
                @unumero NUMERIC(5,0),
                @udenominacion VARCHAR(50)
            AS
                UPDATE Proyectos
				SET Denominacion=@udenominacion
				WHERE Numero=@unumero
            GO

-- Crear procedimiento 'eliminarProyecto'
IF EXISTS (SELECT name FROM sysobjects WHERE name = 'eliminarProyecto' AND type = 'P')
                DROP PROCEDURE eliminarProyecto
            GO
            
            CREATE PROCEDURE eliminarProyecto
                @unumero NUMERIC(5,0)
            AS
                DELETE FROM Proyectos WHERE Numero=@unumero
		    GO
			

-------------PROCEDIMIENTOS PROVEEDORES----------------
-- Crear procedimiento 'crearProveedor'
IF EXISTS (SELECT name FROM sysobjects WHERE name = 'crearProveedor' AND type = 'P')
                DROP PROCEDURE crearProveedor
            GO
            
            CREATE PROCEDURE crearProveedor
                @RFC CHAR(13),
                @RazonSocial VARCHAR(50)
            AS
                INSERT INTO Proveedores VALUES(@RFC, @RazonSocial)
            GO

-- Crear procedimiento 'modificarProveedor'
IF EXISTS (SELECT name FROM sysobjects WHERE name = 'modificarProveedor' AND type = 'P')
                DROP PROCEDURE modificarProveedor
            GO
            
            CREATE PROCEDURE modificarProveedor
                @RFC CHAR(13),
                @RazonSocial VARCHAR(50)
            AS
                UPDATE Proveedores
				SET RazonSocial=@RazonSocial
				WHERE RFC=@RFC
            GO

-- Crear procedimiento 'eliminarProveedor'
IF EXISTS (SELECT name FROM sysobjects WHERE name = 'eliminarProveedor' AND type = 'P')
                DROP PROCEDURE eliminarProveedor
            GO
            
            CREATE PROCEDURE eliminarProveedor
                @RFC CHAR(13)
            AS
                DELETE FROM Proveedores WHERE RFC=@RFC
		    GO

-------------PROCEDIMIENTOS ENTREGAN----------------
-- Crear procedimiento 'crearEntrega'
IF EXISTS (SELECT name FROM sysobjects WHERE name = 'crearEntrega' AND type = 'P')
				DROP PROCEDURE crearEntrega
			GO

			CREATE PROCEDURE crearEntrega
				@uclave NUMERIC(5,0),
				@uRFC CHAR(13),
				@unumero NUMERIC(5,0),
				@ufecha DATETIME,
				@ucantidad NUMERIC(8,2)
			AS
				INSERT INTO Entregan VALUES(@uclave,@uRFC,@unumero,@ufecha,@ucantidad)
			GO

-- Crear procedimiento 'modificarEntrega'
IF EXISTS (SELECT name FROM sysobjects WHERE name = 'modificarEntrega' AND type = 'P')
				DROP PROCEDURE modificarEntrega
			GO

			CREATE PROCEDURE modificarEntrega
				@uclave NUMERIC(5,0),
				@uRFC CHAR(13),
				@unumero NUMERIC(5,0),
				@ufecha DATETIME,
				@ucantidad NUMERIC(8,2)
			AS
				UPDATE Entregan
				SET Cantidad=@ucantidad
				WHERE Clave=@uclave AND RFC=@uRFC AND Numero=@unumero AND Fecha=@ufecha
			GO

-- Test de los procedimientos --
SELECT * FROM Materiales

EXECUTE modificarMaterial 1514,'Arcilla de la chida',130,15

EXECUTE eliminarMaterial 5000



-- PROCEDIMIENTOS PARA REALIZAR CONSULTAS
IF EXISTS (SELECT name FROM sysobjects WHERE name = 'queryMaterial' AND type = 'P')
                                DROP PROCEDURE queryMaterial
                            GO
                            
                            CREATE PROCEDURE queryMaterial
                                @udescripcion VARCHAR(50),
                                @ucosto NUMERIC(8,2)
                            
                            AS
                                SELECT * FROM Materiales WHERE descripcion 
                                LIKE '%'+@udescripcion+'%' AND costo > @ucosto 
                            GO

EXECUTE queryMaterial 'Lad',20 
                            