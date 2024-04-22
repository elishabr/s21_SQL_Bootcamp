WITH pv_and_p AS (
    SELECT p.name, pv.visit_date, pv.pizzeria_id  FROM person_visits pv JOIN person p
    ON pv.person_id = p.id
),
     pz_and_m AS (
    SELECT pz.name, m.price , m.pizzeria_id, m.pizza_name FROM  pizzeria pz JOIN  menu m
    ON pz.id = m.pizzeria_id
)

SELECT q1.pizza_name AS pizza_name,
       q1.price AS price,
       q1.name AS pizzeria_name,
       q2.visit_date
FROM pz_and_m q1 JOIN  pv_and_p q2 ON q1.pizzeria_id = q2.pizzeria_id
WHERE q2.name = 'Kate' AND q1.price BETWEEN 800 AND 1000
ORDER BY 1,2,3;