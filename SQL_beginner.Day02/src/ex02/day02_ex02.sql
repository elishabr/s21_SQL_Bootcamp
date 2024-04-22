SELECT COALESCE(person.name, '-') AS person_name,
q1.visit_date AS visit_date,
COALESCE(pizzeria.name, '-') AS pizzeria_name
FROM (person
     FULL JOIN (SELECT person_id, visit_date, pizzeria_id FROM  person_visits
        WHERE visit_date BETWEEN '2022-01-01' AND '2022-01-03') q1
         ON person.id = q1.person_id FULL JOIN pizzeria ON q1.pizzeria_id = pizzeria.id)
ORDER BY 1,2,3;
