WITH cte_table1 AS (
    SELECT person_id,
    COUNT(*) AS count_of_visits
    FROM person_visits
    GROUP BY person_id
    ORDER BY count_of_visits DESC,person_id ASC
)

SELECT p.name,
cte.count_of_visits
FROM cte_table1 cte JOIN person p ON cte.person_id = p.id
LIMIT 4;