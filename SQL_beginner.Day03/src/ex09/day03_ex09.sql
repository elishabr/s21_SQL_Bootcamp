INSERT INTO person_visits(id, person_id, pizzeria_id, visit_date)
VALUES ((SELECT COUNT(*)+1 FROM person_visits),
        (SELECT id FROM person p
        WHERE p.name = 'Denis' ),
        (SELECT id FROM pizzeria pz
        WHERE pz.name = 'Dominos'),
        '2022-02-24');
INSERT INTO person_visits(id, person_id, pizzeria_id, visit_date)
VALUES ((SELECT COUNT(*)+1 FROM person_visits),
        (SELECT id FROM person p
        WHERE p.name = 'Irina' ),
        (SELECT id FROM pizzeria pz
        WHERE pz.name = 'Dominos'),
        '2022-02-24');
