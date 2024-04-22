WITH pv_and_p_pz AS (
    SELECT p.gender, pz.name
    FROM  person_visits pv JOIN person p
    ON pv.person_id = p.id JOIN pizzeria pz
    ON pv.pizzeria_id = pz.id
), male_table AS (
    SELECT name, COUNT(name) AS m_count FROM pv_and_p_pz
    WHERE gender = 'male'
    GROUP BY name
), female_table AS (
    SELECT name, COUNT(name) AS f_count FROM pv_and_p_pz
    WHERE gender = 'female'
    GROUP BY name
)
SELECT f.name FROM female_table f JOIN male_table m ON f.name = m.name
WHERE f.f_count <> m.m_count
ORDER BY 1;
