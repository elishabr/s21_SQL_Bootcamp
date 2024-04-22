CREATE MATERIALIZED VIEW mv_dmitriy_visits_and_eats AS
WITH p_or_and_m AS (
    SELECT * FROM pizzeria JOIN
        menu m ON pizzeria.id = m.pizzeria_id
),
     p_and_p_v AS (
    SELECT * FROM person JOIN  person_visits pv ON person.id = pv.person_id
)

SELECT q1.name
FROM p_or_and_m q1 JOIN p_and_p_v q2 ON q1.pizzeria_id = q2.pizzeria_id
WHERE q2.name = 'Dmitriy' AND q1.price <800 AND q2.visit_date = '2022-01-08'
