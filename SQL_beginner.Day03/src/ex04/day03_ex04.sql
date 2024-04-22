WITH po_and_p AS (
    SELECT p.gender, pz.name FROM person_order po JOIN person p
    ON p.id = po.person_id JOIN menu m
            ON m.id = po.menu_id JOIN pizzeria pz
                ON m.pizzeria_id = pz.id
),  male_table AS (
    SELECT name, COUNT(name) FROM po_and_p
    WHERE gender = 'male'
    GROUP BY name
),  female_table AS (
    SELECT name, COUNT(name) FROM po_and_p
    WHERE gender = 'female'
    GROUP BY name
)
(SELECT name FROM male_table
    EXCEPT
SELECT name FROM female_table)
UNION
(SELECT name FROM female_table
    EXCEPT
SELECT name FROM  male_table)
ORDER BY 1


