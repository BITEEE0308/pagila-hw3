/*
 * Compute the number of customers who live outside of the US.
 */

SELECT COUNT(customer_id) FROM CUSTOMER JOIN address USING (address_id) JOIN city USING (city_id) JOIN country USING (country_id) WHERE NOT country_id = 103;
