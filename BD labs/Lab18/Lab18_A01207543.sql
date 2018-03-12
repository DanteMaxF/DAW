/*
*	Dante Maximiliano Flores Moreno
*	A01207543
*	BASES DE DATOS
*	LABORATORIO 19
*/

-- La suma de las cantidades e importe total de todas las entregas realizadas durante el 97. 
SET DATEFORMAT dmy
SELECT SUM(E.Cantidad) as 'Cantidad total',  SUM(E.Cantidad*(M.Costo+(M.Costo*(M.PorcentajeImpuesto/100)))) as 'Importe'
FROM Entregan E, Materiales M
WHERE E.Clave = M.Clave 
	AND E.Fecha BETWEEN '01/01/1997' AND '31/12/1997'

--Para cada proveedor, obtener la razón social del proveedor, número de entregas e importe total de las entregas realizadas. 
SELECT E.RFC, COUNT(E.RFC) as 'Numero de Entregas', SUM(E.Cantidad*(M.Costo+(M.Costo*(M.PorcentajeImpuesto/100)))) as 'Importe'
FROM Entregan E, Materiales M
WHERE E.Clave = M.Clave
GROUP BY E.RFC

-- Por cada material obtener la clave y descripción del material, la cantidad total entregada, 
-- la mínima cantidad entregada, la máxima cantidad entregada, 
-- el importe total de las entregas de aquellos materiales en los que la cantidad promedio entregada sea mayor a 400.
SELECT E.Clave, M.Descripcion, SUM(E.Cantidad) as 'Total Entregado', MIN(E.Cantidad) as 'Cantidad Minima', MAX(E.Cantidad) as 'Cantidad Maxima', SUM(E.Cantidad*(M.Costo+(M.Costo*(M.PorcentajeImpuesto/100)))) as 'Importe'
FROM Materiales M, Entregan E
WHERE M.Clave = E.Clave
GROUP BY E.Clave, M.Descripcion
HAVING AVG(E.Cantidad) > 400

-- Para cada proveedor, indicar su razón social y mostrar la cantidad promedio de cada material entregado,
-- detallando la clave y descripción del material, excluyendo aquellos proveedores para los que la cantidad 
-- promedio sea menor a 500. 

SELECT E.RFC, E.Clave, M.Descripcion, AVG(E.Cantidad) as 'Cantidad Promedio'
FROM Entregan E, Materiales M
WHERE E.Clave = M.Clave
GROUP BY E.Clave, E.RFC, M.Descripcion
HAVING AVG(E.Cantidad) >=500
ORDER BY E.RFC

-- 5 Mostrar en una solo consulta los mismos datos que en la consulta anterior pero para dos grupos de
-- proveedores: aquellos para los que la cantidad promedio entregada es menor a 370 y aquellos para
-- los que la cantidad promedio entregada sea mayor a 450.

SELECT E.RFC, E.Clave, M.Descripcion, AVG(E.Cantidad) as 'Cantidad Promedio'
FROM Entregan E, Materiales M
WHERE E.Clave = M.Clave
GROUP BY E.Clave, E.RFC, M.Descripcion
HAVING AVG(E.Cantidad)<370 OR AVG(E.Cantidad)>450
ORDER BY E.RFC


--INSERT DE MATERIALES
INSERT INTO Materiales
VALUES(1510,'Tezontle del chido',180,3.02)

INSERT INTO Materiales
VALUES(1511,'Cantera verde',230,2.80)

INSERT INTO Materiales
VALUES(1512,'Vigas de metal',530,1.02)

INSERT INTO Materiales
VALUES(1513,'Bloques de adamantium',1000,5)

INSERT INTO Materiales
VALUES(1514,'Arcilla',128,2.03)


-- Clave y descripción de los materiales que nunca han sido entregados. 
SELECT M.Clave, M.Descripcion
FROM Materiales M
WHERE Clave NOT IN (SELECT E.Clave FROM Entregan E)

-- Razón social de los proveedores que han realizado entregas tanto al
-- proyecto 'Vamos México' como al proyecto 'Querétaro Limpio'. 
SELECT E.RFC
FROM Entregan E, Proyectos P
WHERE E.Numero = P.Numero
	AND P.Denominacion LIKE '%vamos%'
	OR P.Denominacion LIKE '%Limpio%'

-- Descripción de los materiales que nunca han sido entregados al proyecto
-- 'CIT Yucatán'. 
SELECT M.Descripcion
FROM Materiales M
WHERE M.Clave NOT IN (SELECT DISTINCT E.Clave
						FROM Entregan E, Proyectos P 
						WHERE P.Denominacion LIKE '%CIT%')

-- ***Razón social y promedio de cantidad entregada de los proveedores cuyo
-- promedio de cantidad entregada es mayor al promedio de la cantidad
-- entregada por el proveedor con el RFC 'VAGO780901'
SELECT RFC, AVG(Cantidad) as 'Promedio de entregas'
FROM Entregan
GROUP BY RFC
HAVING AVG(Cantidad) > (SELECT AVG(Cantidad) FROM Entregan WHERE RFC LIKE '%VAGO780901%')


-- RFC, razón social de los proveedores que participaron en el proyecto
-- 'Infonavit Durango' y cuyas cantidades totales entregadas en el 2000
-- fueron mayores a las cantidades totales entregadas en el 2001.
SET DATEFORMAT dmy
SELECT DISTINCT Prov.RFC, Prov.RazonSocial
FROM Entregan E, Proveedores Prov, Proyectos Proy
WHERE E.RFC=Prov.RFC AND E.Numero=Proy.Numero
		AND Proy.Denominacion LIKE '%infonavit%'
		AND E.Fecha BETWEEN '01/01/2000' AND '31/12/2000'
GROUP BY Prov.RFC, Prov.RazonSocial
HAVING SUM(E.Cantidad) >
(
SELECT DISTINCT SUM(E.Cantidad) as 'Cantidades del 2000'
FROM Entregan E, Proveedores Prov, Proyectos Proy
WHERE E.RFC=Prov.RFC AND E.Numero=Proy.Numero
		AND Proy.Denominacion LIKE '%infonavit%'
		AND E.Fecha BETWEEN '01/01/2001' AND '31/12/2001'
GROUP BY Prov.RFC, Prov.RazonSocial
)


