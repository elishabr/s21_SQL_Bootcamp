CREATE VIEW  v_symmetric_union AS
WITH pv1 AS(
    SELECT *
    FROM person_visits pv
    WHERE pv.visit_date = '2022-01-02'
),  pv2 AS(
    SELECT *
    FROM person_visits pv
    WHERE pv.visit_date = '2022-01-06'
)

(SELECT pv1.person_id FROM pv1
EXCEPT
SELECT pv2.person_id FROM pv2)
UNION
(SELECT pv2.person_id FROM  pv2
EXCEPT
SELECT  pv1.person_id FROM  pv1)
ORDER BY 1;
