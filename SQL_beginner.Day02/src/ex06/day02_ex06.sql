WITH all_pizza_pizzeria AS (
    SELECT pz.name, pz.id AS piz_id
    FROM pizzeria pz
),
     all_order_anna_den AS (
         SELECT p.name AS person_name, m.pizza_name, m.pizzeria_id
         FROM person_order JOIN menu m
             ON person_order.menu_id = m.id JOIN person p
                 ON person_order.person_id = p.id
)

SELECT q1.pizza_name AS pizza_name,
       all_pizza_pizzeria.name AS pizzeria_name
FROM all_pizza_pizzeria JOIN all_order_anna_den  q1
    ON all_pizza_pizzeria.piz_id = q1.pizzeria_id
WHERE q1.person_name = 'Anna' OR q1.person_name = 'Denis'
ORDER BY 1,2;