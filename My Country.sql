-- Main Tables --
SELECT * FROM cities;
SELECT * FROM countries;

-- What query would you run to get all the countries that speak Slovene? 
-- Your query should return the name of the country, language and language percentage. 
-- Your query should arrange the result by language percentage in descending order. (1)
SELECT name, language, percentage FROM countries 
LEFT JOIN languages
ON countries.id = languages.country_id
WHERE languages. language = "Slovene"
ORDER BY percentage DESC;

--  Your query should return the name of the country and the total number of cities.
--  Your query should arrange the result by the number of cities in descending order. (3)
 -- What query would you run to display the total number of cities for each country?
 -- need to refactor this should be join only
SELECT  countries.name AS country, COUNT(cities.id) AS city 
FROM cities 
JOIN countries ON countries.id = cities.country_id
GROUP BY countries.name
ORDER BY city DESC;

--  What query would you run to get all the cities in Mexico with a population of greater than 500,000? 
-- Your query should arrange the result by population in descending order. (1)
SELECT cities.name AS city, cities.population AS population FROM cities 
LEFT JOIN countries ON cities.country_id = countries.id
WHERE countries.name = 'Mexico' AND cities.population > 500000
ORDER BY cities.population DESC;

 -- What query would you run to get all languages in each country with a percentage greater than 89%? 
 -- Your query should arrange the result by percentage in descending order. (1)
SELECT DISTINCT name, language, percentage FROM countries 
LEFT JOIN languages
ON countries.id = languages.country_id
WHERE percentage > 89
ORDER BY percentage DESC;

-- What query would you run to get all the countries with Surface Area below 501 and Population greater than 100,000? (2)
SELECT DISTINCT name, surface_area, population FROM countries
WHERE surface_area < 501 AND population > 100000;

-- What query would you run to get countries with only Constitutional Monarchy with a capital greater than 200 and a life expectancy greater than 75 years? (1)
SELECT DISTINCT name, government_form, capital FROM countries
WHERE government_form = 'Constitutional Monarchy' AND capital > 200 AND life_expectancy > 75;

-- What query would you run to get all the cities of Argentina inside the Buenos Aires district and have the population greater than 500, 000? 
-- The query should return the Country Name, City Name, District and Population. (2)
SELECT countries.name AS county,  cities.name AS city, cities.district AS district, cities.population AS population FROM cities 
LEFT JOIN countries ON cities.country_id = countries.id
WHERE countries.name = 'Argentina' AND cities.district = 'Buenos Aires' AND cities.population > 500000
ORDER BY cities.population DESC;

-- What query would you run to summarize the number of countries in each region? 
-- The query should display the name of the region and the number of countries. 
-- Also, the query should arrange the result by the number of countries in descending order. (2)
SELECT countries.region AS region, COUNT(name) AS country FROM countries
GROUP BY region
ORDER BY country DESC;






