WITH my_cte1 AS (
    SELECT day::date AS missing_date
    FROM GENERATE_SERIES('2022-01-01'::date, '2022-01-10'::date, '1 day'::interval) day
),
    my_cte2 AS (SELECT visit_date
            FROM  person_visits
            WHERE person_id = 1 OR  person_id = 2
)
SELECT my_cte1.missing_date
FROM my_cte1 LEFT JOIN my_cte2 ON my_cte1.missing_date = my_cte2.visit_date
WHERE my_cte2.visit_date IS NULL
ORDER BY my_cte2.visit_date;