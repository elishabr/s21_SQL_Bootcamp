SELECT v_p_f.name
FROM v_persons_female v_p_f
UNION ALL
SELECT v_p_m.name
FROM v_persons_male v_p_m
ORDER BY 1;