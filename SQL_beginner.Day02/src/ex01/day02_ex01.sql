SELECT p1::date AS missing_date
FROM GENERATE_SERIES('2022-01-01'::date, '2022-01-10'::date, '1 day'::interval) p1
LEFT JOIN (SELECT visit_date
            FROM  person_visits
            WHERE person_id = 1 OR  person_id = 2
    ) p2
ON p1 = p2.visit_date
WHERE p2.visit_date IS NULL
ORDER BY p2.visit_date;