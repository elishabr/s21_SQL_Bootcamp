WITH pz_and_m AS (
    SELECT pz.name, m.pizza_name, m.price, pz.id FROM pizzeria pz
        JOIN menu m ON m.pizzeria_id = pz.id
)

SELECT q1.pizza_name AS pizza_name,
       q2.name AS pizzeria_name_1,
       q1.name AS pizzeria_name_2,
       q1.price AS price
FROM pz_and_m q2 JOIN pz_and_m q1
ON q1.price = q2.price
WHERE q1.pizza_name = q2.pizza_name AND q1.id < q2.id
ORDER BY 1;