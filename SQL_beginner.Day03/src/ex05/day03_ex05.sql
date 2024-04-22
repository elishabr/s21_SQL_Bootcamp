WITH po_and_p_m AS (
    SELECT pz.name FROM person_order po JOIN person p
    ON p.id = po.person_id JOIN menu m
            ON m.id = po.menu_id JOIN pizzeria pz
                ON m.pizzeria_id = pz.id
    WHERE p.name = 'Andrey'
), pv_and_p_pz AS (
    SELECT pz.name
    FROM  person_visits pv JOIN person p
    ON pv.person_id = p.id JOIN pizzeria pz
    ON pv.pizzeria_id = pz.id
    WHERE p.name = 'Andrey'
)
SELECT  * FROM pv_and_p_pz
EXCEPT
SELECT * FROM po_and_p_m
ORDER BY 1;