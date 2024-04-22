INSERT INTO person_visits(id, person_id, pizzeria_id, visit_date)
VALUES ((SELECT COUNT(*)+1 FROM person_visits),
        (SELECT p.id FROM person p
         WHERE p.name = 'Dmitriy'),
        (SELECT * FROM
               (SELECT pz.id FROM pizzeria pz JOIN menu m
               ON pz.id = m.pizzeria_id
                WHERE m.price < 800
                EXCEPT
                SELECT pz.id FROM pizzeria pz
                WHERE pz.name IN (SELECT mv.name
                FROM mv_dmitriy_visits_and_eats mv)) AS p_id
         LIMIT 1),
        '2022-01-08'::DATE
       );

REFRESH MATERIALIZED VIEW mv_dmitriy_visits_and_eats;