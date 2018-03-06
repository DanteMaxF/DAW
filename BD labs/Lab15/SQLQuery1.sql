--LAB15 DANTE FLORES MORENO	A01207543--



--Consulta de una tabla completa
SELECT * FROM Materiales

--Seleccion
SELECT * FROM Materiales WHERE clave=1000

--Proyeccion
SELECT Clave,RFC,Fecha FROM Entregan

--Reunion Natural
SELECT * FROM Materiales,Entregan 
WHERE Materiales.clave = Entregan.clave

--Reunion con criterio especifico
SELECT * FROM Entregan, Proyectos
WHERE Entregan.numero <= Proyectos.numero

--Union (se ilustra junto con seleccion)
(SELECT * FROM Entregan WHERE Clave=1450)
union
(SELECT * FROM Entregan WHERE Clave=1300)

SELECT * FROM Entregan WHERE Clave=1450 OR Clave=1300

--Interseccion (se ilustra junto con seleccion y proyeccion
(select clave from entregan where numero=5001) 
intersect 
(select clave from entregan where numero=5018) 

--Diferencia (se ilustra con selección ) 
SELECT * FROM Entregan WHERE clave != 1000

--Producto Cartesiano
select * from entregan,materiales 

--Construcción de consultas a partir de una especificación 
SET DATEFORMAT dmy
SELECT Descripcion
FROM Materiales M, Entregan E
WHERE M.Clave = E.Clave 
	AND Fecha BETWEEN '01/01/00' AND '31/12/00'

--Uso del calificador distinct
SET DATEFORMAT dmy
SELECT DISTINCT Descripcion
FROM Materiales M, Entregan E
WHERE M.Clave = E.Clave 
	AND Fecha BETWEEN '01/01/00' AND '31/12/00'

--Ordenamientos
SELECT P.Numero, P.Denominacion, E.Fecha, E.Cantidad
FROM Proyectos P, Entregan E
WHERE P.Numero = E.Numero
ORDER BY P.Numero ASC, E.Fecha DESC

--Operadores de cadena
SELECT * FROM Materiales where Descripcion LIKE 'Si%' 
SELECT * FROM Materiales where Descripcion LIKE 'Si'

DECLARE @foo varchar(40); 
DECLARE @bar varchar(40); 
SET @foo = '¿Que resultado'; 
SET @bar = ' ¿¿¿??? ' 
SET @foo += ' obtienes?'; 
PRINT @foo + @bar; 

SELECT RFC FROM Entregan WHERE RFC LIKE '[A-D]%';
SELECT RFC FROM Entregan WHERE RFC LIKE '[^A]%'; 
SELECT Numero FROM Entregan WHERE Numero LIKE '___6'; 

--Operadores logicos
SELECT Clave,RFC,Numero,Fecha,Cantidad 
FROM Entregan 
WHERE Numero Between 5000 and 5010; 

SELECT RFC,Cantidad, Fecha,Numero 
FROM [Entregan] 
WHERE [Numero] Between 5000 and 5010 AND 
Exists ( SELECT [RFC]
FROM [Proveedores] 
WHERE RazonSocial LIKE 'La%' and [Entregan].[RFC] = [Proveedores].[RFC] ) 

SELECT RFC,Cantidad, Fecha,Numero 
FROM [Entregan] 
WHERE [Numero] Between 5000 and 5010 AND 
RFC IN ( SELECT [RFC]
FROM [Proveedores] 
WHERE RazonSocial LIKE 'La%' and [Entregan].[RFC] = [Proveedores].[RFC] ) 

SELECT RFC,Cantidad, Fecha,Numero 
FROM [Entregan] 
WHERE [Numero] Between 5000 and 5010 AND 
RFC NOT IN ( SELECT [RFC]
FROM [Proveedores] 
WHERE RazonSocial NOT LIKE 'La%' and [Entregan].[RFC] = [Proveedores].[RFC] ) 

SELECT cantidad 
FROM entregan
WHERE cantidad = ANY (
SELECT cantidad
FROM entregan
WHERE cantidad > 100)


SELECT TOP 2 * FROM Proyectos 

SELECT TOP Numero FROM Proyectos 

--Modificando la estructura de un tabla existente. 
ALTER TABLE materiales ADD PorcentajeImpuesto NUMERIC(6,2); 

UPDATE materiales SET PorcentajeImpuesto = 2*clave/1000; 

SELECT Descripcion, SUM(e.cantidad)*costo*(1+porcentajeImpuesto/100) AS 'Total'
FROM entregan e, Materiales M
WHERE e.clave = m.clave
GROUP BY costo, porcentajeImpuesto, descripcion

--vistas
CREATE VIEW vista1
AS
SELECT * FROM Entregan WHERE clave != 1000;

CREATE VIEW vista2
AS
(SELECT * FROM Entregan WHERE Clave=1450)
union
(SELECT * FROM Entregan WHERE Clave=1300)


CREATE VIEW vista3
AS
SELECT * FROM Materiales where Descripcion LIKE 'Si%' 

CREATE VIEW vista4
AS
SELECT Numero FROM Entregan WHERE Numero LIKE '___6'; 

CREATE VIEW vista5
AS
SELECT * FROM Entregan WHERE Clave=1450 OR Clave=1300


SELECT * FROM vista1

SELECT * FROM vista2

SELECT * FROM vista3

SELECT * FROM vista4

-------A continuación se te dan muchos enunciados de los cuales deberás generar su correspondiente consulta. 

--Los materiales (clave y descripción) entregados al proyecto "México sin ti no estamos completos". 
SELECT	M.Clave, M.Descripcion
FROM Materiales M, Proyectos P, Entregan E
WHERE M.Clave = E.Clave AND P.Numero = E.Numero
		AND Denominacion = 'Mexico sin ti no estamos completos'

--Los materiales (clave y descripción) que han sido proporcionados por el proveedor "Acme tools". 
SELECT M.Clave, M.Descripcion
FROM Materiales M, Proveedores P, Entregan E
WHERE M.Clave = E.Clave AND P.RFC = E.RFC
		AND RazonSocial = 'Acme tools'

--El RFC de los proveedores que durante el 2000 entregaron en promedio cuando menos 300 materiales. 
SET DATEFORMAT dmy
SELECT  RFC, SUM(E.Cantidad) as 'TOTAL'
FROM Entregan E
WHERE E.Fecha BETWEEN '1/1/2000' AND '31/12/2000'
GROUP BY RFC
HAVING SUM(E.Cantidad) >= 300

--El Total entregado por cada material en el año 2000. 
SET DATEFORMAT dmy
SELECT M.Descripcion, SUM(E.Cantidad) as 'TOTAL'
FROM Materiales M, Entregan e
WHERE E.Fecha BETWEEN '1/1/2000' AND '31/12/2000'
GROUP BY M.Descripcion

--La Clave del material más vendido durante el 2001. (se recomienda usar una vista intermedia para su solución) 
CREATE VIEW total2001
AS
SELECT SUM(Cantidad) as 'TOTAL'
FROM Entregan
WHERE Fecha BETWEEN '1/1/2001' AND '31/12/2001'
GROUP BY Clave

SELECT TOP 1 TOTAL FROM total2001

--Productos que contienen el patrón 'ub' en su nombre. 
SELECT Descripcion
FROM Materiales
WHERE Descripcion LIKE '%ub%'

--Denominación y suma del total a pagar para todos los proyectos. 
SELECT Denominacion, SUM(E.Cantidad*M.Costo*(1+porcentajeImpuesto/100)) AS 'Total a pagar'
FROM Materiales M, Proyectos P, Entregan E
WHERE M.Clave = E.Clave AND P.Numero = E.Numero
GROUP BY Denominacion

--Denominación, RFC y RazonSocial de los proveedores que se suministran materiales al proyecto Televisa en acción que no se encuentran apoyando al proyecto Educando en Coahuila. (Solo usando vistas) 
CREATE VIEW ProveedoresTelevisa (denominacion, rfc, razonsocial) AS
	(SELECT DISTINCT pr.denominacion, p.rfc, p.RazonSocial
	FROM proveedores p, proyectos pr, entregan e
	WHERE p.rfc = e.rfc AND pr.numero = e.numero AND pr.denominacion LIKE 'Televisa en acción')

CREATE VIEW ProveedoresCoahuila (denominacion, rfc, razonsocial) AS
	(SELECT DISTINCT pr.denominacion, p.rfc, p.RazonSocial
	FROM proveedores p, proyectos pr, entregan e
	WHERE p.rfc = e.rfc AND pr.numero = e.numero AND pr.denominacion LIKE 'Educando en Coahuila')

CREATE VIEW diferenciaProveedores AS
	(SELECT razonsocial FROM ProveedoresTelevisa
	except
	SELECT razonsocial FROM ProveedoresCoahuila)

SELECT * FROM ProveedoresTelevisa WHERE razonsocial IN (SELECT * FROM diferenciaProveedores)


--Denominación, RFC y RazonSocial de los proveedores que se suministran materiales al proyecto Televisa 
--en acción que no se encuentran apoyando al proyecto Educando en Coahuila. (Sin usar vistas, utiliza not in, in o exists) 

SELECT DISTINCT p.denominacion, pr.rfc, pr.razonsocial  
FROM entregan e, proyectos p, proveedores pr
WHERE e.rfc = pr.rfc AND p.numero = e.numero AND p.denominacion LIKE 'Televisa en acción' and pr.rfc
NOT IN
(SELECT e.rfc 
FROM entregan e, proyectos p
WHERE p.numero = e.numero AND p.denominacion LIKE 'Educando en Coahuila')


	

--Costo de los materiales y los Materiales que son entregados al proyecto Televisa en acción cuyos 
--proveedores también suministran materiales al proyecto Educando en Coahuila.
	SELECT m.Costo, m.Descripcion
	FROM Entregan e, proyectos p, Proveedores pr, materiales m
	WHERE p.numero=e.numero and pr.RFC=e.RFC and m.Clave = e.clave
		AND p.Denominacion LIKE 'Televisa%'  
		AND pr.RFC  in (
						SELECT pr.RFC
						FROM Entregan e, Proyectos p, Proveedores pr, Materiales m
						WHERE p.numero=e.numero AND pr.RFC=e.RFC AND m.Clave = e.clave 
							AND p.Denominacion LIKE '%coahuila%')
