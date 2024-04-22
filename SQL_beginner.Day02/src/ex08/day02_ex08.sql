
WITH po_and_m AS (
    SELECT * FROM person_order JOIN menu m
    ON person_order.menu_id = m.id
)

SELECT q1.name
FROM  po_and_m q2 JOIN person q1 ON q2.person_id = q1.id
WHERE q1.gender = 'male' AND (q1.address = 'Moscow' OR q1.address ='Samara')
  AND (q2.pizza_name = 'pepperoni pizza' OR q2.pizza_name = 'mushroom pizza')
ORDER BY q1.name DESC