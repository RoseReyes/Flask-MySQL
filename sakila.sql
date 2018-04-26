--  What query would you run to get all the customers inside city_id = 312? 
-- --Your query should return customer first name, last name, email, and address.--

SELECT * FROM customer;
SELECT * FROM address;
SELECT * FROM city;

SELECT city.city_id, city.city, customer.first_name, customer.last_name, customer.email, address.address FROM customer 
LEFT JOIN address ON address.address_id = customer.address_id
LEFT JOIN city ON  city.city_id = address.city_id
WHERE city.city_id = 312;

-- What query would you run to get all comedy films? Your query should return film title, description, release year, rating, special features, and genre (category)-- 
SELECT * FROM film;
SELECT * FROM film_category;
SELECT * FROM category;

SELECT DISTINCT film.film_id AS film_id, film.title AS film_title, film.description, film.release_year, film.rating, film.special_features, film_category.category_id, category.name
FROM film 
LEFT JOIN film_category ON film_category.category_id = film.film_id
LEFT JOIN category ON category.category_id = film_category.category_id
WHERE category.name = 'Comedy';

-- What query would you run to get all the films joined by actor_id=5? Your query should return the actor id, actor name, film title, description, and release year.
SELECT * FROM film;
SELECT * FROM film_actor;
SELECT * FROM actor;

SELECT DISTINCT actor.actor_id, actor.first_name, actor.last_name, film.title, film.description, film.release_year FROM film
JOIN film_actor ON film.film_id = film_actor.film_id
JOIN actor ON actor.actor_id = film_actor.actor_id
WHERE film_actor.actor_id = 5;

-- What query would you run to get all the customers in store_id = 1 and inside these cities (1, 42, 312 and 459)? 
-- Your query should return customer first name, last name, email, and address.
SELECT * FROM customer;
SELECT * FROM address;
SELECT * FROM city;
SELECT * FROM store;

SELECT store.store_id, city.city_id, customer.first_name, customer.last_name, customer.email, address.address FROM customer 
LEFT JOIN store ON store.store_id = customer.store_id
LEFT JOIN address ON address.address_id = customer.address_id
LEFT JOIN city ON  city.city_id = address.city_id
WHERE city.city_id IN (1,42,312,459) AND store.store_id = 1;

--  What query would you run to get all the films with a rating = G and special feature = behind the scenes, joined
-- by actor_id = 15? Your query shoud return the film title, description, release year, rate and special feature.

SELECT * FROM film;
SELECT * FROM film_actor;
SELECT * FROM actor;

SELECT DISTINCT film.title, film.description, film.release_year, film.rating, film.special_features FROM film
JOIN film_actor ON film.film_id = film_actor.film_id
JOIN actor ON actor.actor_id = film_actor.actor_id
WHERE film.rating = 'G' AND film.special_features = 'Behind the Scenes' AND film_actor.actor_id = 15;


-- What query would you run to get all the actors that joined in the film_id = 369? Your query should return the film_id, title, actor_id, and actor_name.
SELECT  DISTINCT film.film_id, film.title, actor.actor_id, actor.first_name, actor.last_name FROM film
JOIN film_actor ON film.film_id = film_actor.film_id
JOIN actor ON actor.actor_id = film_actor.actor_id
WHERE film.film_id = 369;

-- What query would you run to get all drama films with a rental rate of 2.99? Your query should return film title, description, release year, rating, special features, and genre (category).
SELECT film.film_id, film.title, film.description, film.release_year, film.rating, film.special_features, category.name FROM film 
JOIN film_category ON film.film_id = film_category.film_id
JOIN category ON film_category.category_id = category.category_id
WHERE film.rental_rate = 2.99 AND category.category_id = 7;



-- What query would you run to get all the action films joined by SANDRA KILMER. Your query should return film
-- title, description, release year, rating, special features, genre and actor's first name and last name.
SELECT film.title, film.description, film.rating, film.special_features, category.name, CONCAT_WS(actor.first_name, actor.last_name) AS actor_name FROM film
JOIN film_category ON film.film_id = film_category.film_id
JOIN category ON category.category_id = film_category.category_id
JOIN film_actor ON film_actor.film_id = film.film_id
JOIN actor ON film_actor.actor_id = actor.actor_id
WHERE category.category_id = 1 AND actor.actor_id = 23;



























































