SELECT m.id, title, genre_id, g.id id_genre, name
FROM movies m
INNER JOIN genres g
ON genre_id = g.id;

SELECT DISTINCT m.id, m.title, a.id, a.first_name, a.last_name
FROM movies m
JOIN actor_movie am ON m.id = am.actor_id
JOIN actors a ON a.id = am.actor_id
WHERE title LIKE "Harry%";

SELECT DISTINCT a.first_name, a.last_name
FROM movies m
JOIN actor_movie am ON m.id = am.actor_id
JOIN actors a ON a.id = am.actor_id
WHERE title LIKE "Harry%";

/*ACTIVIDADES*/
/*Utilizando la base de datos de movies, queremos conocer, 
por un lado, los títulos y el nombre del género de todas las series de la base de datos.*/
SELECT s.title, g.name
FROM series AS s
JOIN genres AS g;

/*Por otro, necesitamos listar los títulos de los episodios 
junto con el nombre y apellido de los actores que trabajan en cada uno de ellos.*/
SELECT e.title, a.first_name, a.last_name
FROM episodes AS e
JOIN actors AS a;

/*Para nuestro próximo desafío, necesitamos obtener a todos los actores o actrices 
(mostrar nombre y apellido) que han trabajado en cualquier película de la saga de La Guerra de las galaxias.*/
SELECT a.first_name, a.last_name, m.title
FROM actors AS a
JOIN movies AS m
WHERE title LIKE "La guerra de las galaxias%";

/*Crear un listado a partir de la tabla de películas, mostrar un reporte de la cantidad de películas por nombre de género.*/
SELECT g.name, COUNT(m.id) AS total_peliculas
FROM movies AS m
Right JOIN genres AS g
ON g.id = m.genre_id
GROUP BY g.name;