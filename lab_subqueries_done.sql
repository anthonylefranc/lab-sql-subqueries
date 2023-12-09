use sakila;

-- Step 1

SELECT fi.title, COUNT(inv.inventory_id) AS number_of_copies
FROM film AS fi
JOIN inventory AS inv 
ON fi.film_id = inv.film_id
WHERE fi.title = 'Hunchback Impossible'
GROUP BY fi.title;

-- step 2

-- finding out the avergae length
SELECT round(AVG(length),0) FROM film;

-- filter out any film that is above the average length (115min) & ordering it 
SELECT title, length
FROM film
WHERE length > (SELECT AVG(length) FROM film)
ORDER BY length DESC;

-- step 3
-- Could be done by joining Film, Film_actor_ Actor tables to filter on "Alone trip" (simpler for me :) )

SELECT a.actor_id, a.first_name, a.last_name
FROM actor a
JOIN film_actor fa 
ON a.actor_id = fa.actor_id
JOIN film f 
ON fa.film_id = f.film_id
WHERE f.title = 'Alone Trip';

-- or using a subquery

SELECT a.actor_id, a.first_name, a.last_name
FROM actor a
WHERE a.actor_id IN (
    SELECT fa.actor_id
    FROM film_actor fa
    JOIN film f ON fa.film_id = f.film_id
    WHERE f.title = 'Alone Trip'
);