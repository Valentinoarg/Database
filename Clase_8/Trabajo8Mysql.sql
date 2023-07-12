/*CATEGORÍAS Y PRODUCTOS*/

/*Queremos tener un listado de todas las categorías.*/
SELECT *
FROM categorias;

/*Cómo las categorías no tienen imágenes, solamente interesa obtener un listado de CategoriaNombre y Descripcion.*/
SELECT CategoriaNombre, Descripcion
FROM categorias;

/*Obtener un listado de los productos.*/
SELECT *
FROM productos;

/*¿Existen productos discontinuados? (Discontinuado = 1).*/
SELECT Discontinuado
FROM productos
WHERE Discontinuado =1;

/*Para el viernes hay que reunirse con el Proveedor 8. ¿Qué productos son los que nos provee?*/
SELECT ProductoNombre, ProveedorID
FROM productos
WHERE ProveedorID = 8;

/*Queremos conocer todos los productos cuyo precio unitario se encuentre entre 10 y 22.*/
SELECT ProductoNombre, PrecioUnitario
FROM productos
WHERE PrecioUnitario BETWEEN 10 AND 22;

/*Se define que un producto hay que solicitarlo al proveedor si sus unidades en stock son menores al Nivel de Reorden. ¿Hay productos por solicitar?*/
SELECT ProductoNombre
FROM productos
WHERE UnidadesStock < NivelReorden;

/*Se quiere conocer todos los productos del listado anterior, pero que unidades pedidas sea igual a cero.*/
SELECT ProductoNombre
FROM productos
WHERE UnidadesPedidas = 0;

/*CLIENTES*/

/*Obtener un listado de todos los clientes con Contacto, Compania, Título, País. Ordenar el listado por País.*/
SELECT Contacto, Compania, Titulo, Pais
FROM clientes
ORDER BY Pais;

/*Queremos conocer a todos los clientes que tengan un título “Owner”.*/
SELECT ClienteID, Titulo
FROM clientes
WHERE titulo LIKE '%Owner';

/*El operador telefónico que atendió a un cliente no recuerda su nombre. Solo sabe que comienza con “C”. ¿Lo ayudamos a obtener un listado con todos los contactos que inician con la letra “C”?*/
SELECT Contacto
FROM clientes
WHERE Contacto LIKE 'C%';

/*FACTURAS*/

/*Obtener un listado de todas las facturas, ordenado por fecha de factura ascendente.*/
SELECT *
FROM facturas
ORDER BY FechaFactura ASC;

/*Ahora se requiere un listado de las facturas con el país de envío “USA” y que su correo (EnvioVia) sea distinto de 3.*/
SELECT FacturaID, PaisEnvio
FROM facturas
WHERE PaisEnvio LIKE 'USA%'
AND EnvioVia != 3;

/*¿El cliente 'GOURL' realizó algún pedido?*/
SELECT *
FROM facturas
WHERE ClienteID LIKE 'GOURL';

/*Se quiere visualizar todas las facturas de los empleados 2, 3, 5, 8 y 9.*/
SELECT *
FROM facturas
WHERE EmpleadoID = 2 OR EmpleadoID = 3 OR EmpleadoID = 5 OR EmpleadoID = 8 OR EmpleadoID = 9;

/*PRODUCTOS*/

/*Obtener el listado de todos los productos ordenados descendentemente por precio unitario.*/
SELECT ProductoNombre AS PrecioUnitario
FROM productos
ORDER BY PrecioUnitario DESC;

/*Obtener el listado de top 5 de productos cuyo precio unitario es el más caro.*/
SELECT ProductoNombre
FROM productos
ORDER BY PrecioUnitario ASC
LIMIT 5;

/*Obtener un top 10 de los productos con más unidades en stock.*/
SELECT ProductoNombre, UnidadesStock
FROM productos
ORDER BY UnidadesStock DESC
LIMIT 10;

/*FACTURA DETALLE*/

/*Obtener un listado de FacturaID, ProductoID, Cantidad.*/
SELECT FacturaID, ProductoID, Cantidad
FROM facturadetalle;

/*Ordenar el listado anterior por cantidad descendentemente.*/
SELECT FacturaID, ProductoID, Cantidad
FROM facturadetalle
ORDER BY Cantidad DESC;

/*Filtrar el listado solo para aquellos productos donde la cantidad se encuentre entre 50 y 100.*/
SELECT ProductoID, Cantidad
FROM facturadetalle
WHERE Cantidad BETWEEN 50 AND 100;

/*En otro listado nuevo, obtener un listado con los siguientes nombres de columnas: NroFactura (FacturaID), Producto (ProductoID), Total (PrecioUnitario*Cantidad).*/
SELECT FacturaID, ProductoID, PrecioUnitario*Cantidad AS Total
FROM facturadetalle;

/*¡Extras!*/

/*Obtener un listado de todos los clientes que viven en “Brazil" o “Mexico”, o que tengan un título que empiece con “Sales”. */
SELECT *
FROM clientes
WHERE Pais IN ("Mexico", "Brazil") OR Titulo LIKE 'Sales%';

/*Obtener un listado de todos los clientes que pertenecen a una compañía que empiece con la letra "A".*/
SELECT Contacto, Compania
FROM clientes
WHERE Contacto LIKE 'A%';