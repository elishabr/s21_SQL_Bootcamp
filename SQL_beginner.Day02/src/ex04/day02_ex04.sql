WITH my_cte AS (
    SELECT pizza_name,
           pz.name AS pizzeria_name,
           price
    FROM menu JOIN pizzeria pz ON menu.pizzeria_id = pz.id
)
SELECT * FROM my_cte
WHERE my_cte.pizza_name = 'mushroom pizza' OR my_cte.pizza_name = 'pepperoni pizza'
ORDER BY  1,2;