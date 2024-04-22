
WITH po_and_m AS (
    SELECT q2.name, m.pizza_name, q2.gender FROM person_order q1 JOIN menu m
    ON q1.menu_id = m.id JOIN person q2
        ON q1.person_id = q2.id
)

SELECT DISTINCT name FROM po_and_m
WHERE name IN (SELECT name FROM po_and_m p1
    WHERE p1.pizza_name = 'pepperoni pizza') AND
      name IN (SELECT name FROM po_and_m p2
          WHERE  p2.pizza_name = 'cheese pizza') AND po_and_m.gender = 'female'
ORDER BY 1