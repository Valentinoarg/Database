/*Consultas
Funciones de agregación, GROUP BY y HAVING

¿Cuántas películas hay?*/
SELECT COUNT(id)
FROM movies;

/*¿Cuántas películas tienen entre 3 y 7 premios?*/
SELECT COUNT(id)
FROM movies
WHERE awards BETWEEN 3 AND 7;

/*¿Cuántas películas tienen entre 3 y 7 premios y un rating mayor a 7?*/
SELECT COUNT(id)
FROM movies
WHERE awards BETWEEN 3 AND 7 AND rating > 7;

/*Crear un listado a partir de la tabla de películas, mostrar un reporte de la cantidad de películas por id. de género.*/
SELECT genre_id, COUNT(genre_id)
FROM movies
GROUP BY genre_id;

/*De la consulta anterior, listar sólo aquellos géneros que tengan como suma de premios un número mayor a 5.*/
SELECT genre_id, SUM(awards) AS cantidad_suma, COUNT(awards) AS cantidad_premios
FROM movies
GROUP BY genre_id
HAVING SUM(awards) > 5;