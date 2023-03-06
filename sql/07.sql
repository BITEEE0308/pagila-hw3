/*
 * List all actors with Bacall Number 2;
 * That is, list all actors that have appeared in a film with an actor that has appeared in a film with 'RUSSELL BACALL',
 * but do not include actors that have Bacall Number < 2.
 */

SELECT DISTINCT first_name || ' ' || last_name AS "Actor Name" FROM actor JOIN film_actor USING (actor_id)
JOIN film USING (film_id)
WHERE title IN 
    (SELECT title FROM actor 
        JOIN film_actor USING (actor_id)
        JOIN film USING (film_id)
        WHERE first_name || ' ' || last_name
        IN (SELECT DISTINCT first_name || ' ' || last_name AS "Actor Name"
            FROM actor
            JOIN film_actor USING (actor_id)
            JOIN film USING (film_id)
            WHERE title IN
            (SELECT title FROM actor
                JOIN film_actor USING (actor_id)
                JOIN film USING (film_id)
                WHERE first_name || ' ' || last_name = 'RUSSELL BACALL')
            AND NOT first_name || ' ' || last_name = 'RUSSELL BACALL'))
    AND NOT actor_id
    IN (SELECT DISTINCT actor_id
        FROM actor
        JOIN film_actor USING (actor_id)
        JOIN film USING (film_id)
        WHERE title IN
        (SELECT title FROM actor
            JOIN film_actor USING (actor_id)
            JOIN film USING (film_id)
            WHERE first_name || ' ' || last_name = 'RUSSELL BACALL')) ORDER BY "Actor Name";
