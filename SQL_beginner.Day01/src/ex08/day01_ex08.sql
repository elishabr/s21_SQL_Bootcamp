SELECT order_date,
CONCAT(name, ' (age:', age::varchar, ')' )
AS person_information
FROM person_order
NATURAL JOIN 
(SELECT id AS person_id, name, age 
FROM person
) AS new_person
ORDER BY order_date, person_information;