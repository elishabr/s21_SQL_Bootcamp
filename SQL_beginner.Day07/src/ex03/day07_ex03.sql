WITH cte_visits AS (
    SELECT pz.name,
    COUNT(*) AS count
    FROM person_visits pv JOIN pizzeria pz ON pv.pizzeria_id = pz.id
    GROUP BY pz.name
),	cte_order AS (
    SELECT pz.name,
    COUNT(*) AS count
    FROM (person_order po JOIN menu m ON po.menu_id = m.id)
    JOIN pizzeria pz ON m.pizzeria_id = pz.id
    GROUP BY pz.name
)

SELECT v.name,
v.count + o.count AS total_count
FROM cte_visits v FULL JOIN cte_order o ON v.name = o. name
ORDER BY total_count DESC, name ASC;