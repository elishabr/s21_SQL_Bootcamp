SELECT m.id
FROM menu m
WHERE  m.id NOT IN (SELECT p_or.menu_id
    FROM person_order p_or)
ORDER BY 1;