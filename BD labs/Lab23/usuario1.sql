/*
*	LABORATORIO 23: Manipulación de datos usando Transacciones en SQL Server
*	Dante Maximiliano Flores Moreno
*	A01207543
*/

-- CREACION DE LAS TABLAS

IF EXISTS (SELECT *FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Clientes_Banca')
DROP TABLE Clientes_Banca
CREATE TABLE Clientes_Banca
(
	NoCuenta varchar(5) not null PRIMARY KEY,
	Nombre varchar(30),
	Saldo numeric(10,2)
)

IF EXISTS (SELECT *FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Tipos_Movimiento')
DROP TABLE Tipos_Movimiento
CREATE TABLE Tipos_Movimiento
(
	ClaveM varchar(2) not null PRIMARY KEY,
	Descripcion varchar(30)
)

IF EXISTS (SELECT *FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Movimientos')
DROP TABLE Movimientos
CREATE TABLE Movimientos
(
	NoCuenta varchar(5) FOREIGN KEY REFERENCES Clientes_Banca(NoCuenta),
	ClaveM varchar(2) FOREIGN KEY REFERENCES Tipos_Movimiento(ClaveM),
	Fecha datetime,
	Monto numeric(10,2)
)


-- CREACION DE TRANSACCION Y EJECUCION
BEGIN TRANSACTION PRUEBA1
INSERT INTO CLIENTES_BANCA VALUES('001', 'Manuel Rios Maldonado', 9000);
INSERT INTO CLIENTES_BANCA VALUES('002', 'Pablo Perez Ortiz', 5000);
INSERT INTO CLIENTES_BANCA VALUES('003', 'Luis Flores Alvarado', 8000);
COMMIT TRANSACTION PRUEBA1 

SELECT * FROM Clientes_Banca


-- Comprobando la propiedad de Atomicidad en una BD. 

BEGIN TRANSACTION PRUEBA3
INSERT INTO TIPOS_MOVIMIENTO VALUES('A','Retiro Cajero Automatico');
INSERT INTO TIPOS_MOVIMIENTO VALUES('B','Deposito Ventanilla');
COMMIT TRANSACTION PRUEBA3

BEGIN TRANSACTION PRUEBA4
INSERT INTO MOVIMIENTOS VALUES('001','A',GETDATE(),500);
UPDATE CLIENTES_BANCA SET SALDO = SALDO -500
WHERE NoCuenta='001'
COMMIT TRANSACTION PRUEBA4


--Manejando Fallas en una Transacción 

BEGIN TRANSACTION PRUEBA5
INSERT INTO CLIENTES_BANCA VALUES('005','Rosa Ruiz Maldonado',9000);
INSERT INTO CLIENTES_BANCA VALUES('006','Luis Camino Ortiz',5000);
INSERT INTO CLIENTES_BANCA VALUES('001','Oscar Perez Alvarado',8000);


IF @@ERROR = 0
COMMIT TRANSACTION PRUEBA5
ELSE
BEGIN
PRINT 'A transaction needs to be rolled back'
ROLLBACK TRANSACTION PRUEBA5
END


 -- Ejercicio

 IF EXISTS (SELECT name FROM sysobjects WHERE name = 'REGISTRAR_RETIRO_CAJERO' AND type = 'P')
	DROP PROCEDURE REGISTRAR_RETIRO_CAJERO
	GO
	CREATE PROCEDURE REGISTRAR_RETIRO_CAJERO
		@ucuenta varchar(5),
		@umonto numeric(10,2)
	AS
		BEGIN TRANSACTION PRUEBAEJ1
		INSERT INTO Movimientos VALUES(@ucuenta,'A',GETDATE(),@umonto)
		UPDATE Clientes_Banca SET Saldo = Saldo - @umonto
		WHERE NoCuenta=@ucuenta

		IF @@ERROR = 0
		COMMIT TRANSACTION PRUEBAJEJ1
		ELSE
		PRINT 'A transaction needs to be rolled back'
		ROLLBACK TRANSACTION PRUEBAEJ1
	GO

EXECUTE REGISTRAR_RETIRO_CAJERO '001', 10;
SELECT * FROM Clientes_Banca
SELECT * FROM Movimientos



IF EXISTS (SELECT name FROM sysobjects WHERE name = 'REGISTRAR_DEPOSITO_VENTANILLA' AND type = 'P')
            DROP PROCEDURE REGISTRAR_DEPOSITO_VENTANILLA
            GO
            
            CREATE PROCEDURE REGISTRAR_DEPOSITO_VENTANILLA
                @ucuenta varchar(5),
                @umonto numeric(10,2)
            AS
				BEGIN TRANSACTION PRUEBAEJ2
				INSERT INTO Movimientos VALUES(@ucuenta,'B',GETDATE(),@umonto)
				UPDATE Clientes_Banca SET SALDO = SALDO + @umonto
				WHERE NoCuenta=@ucuenta

				IF @@ERROR = 0
				COMMIT TRANSACTION PRUEBAEJ2
				ELSE
				BEGIN
				PRINT 'A transaction needs to be rolled back'
				ROLLBACK TRANSACTION PRUEBAEJ2
				END
            GO

EXECUTE REGISTRAR_DEPOSITO_VENTANILLA '001', 20;
SELECT * FROM Clientes_Banca
SELECT * FROM Movimientos
/*Probar procedure*/

