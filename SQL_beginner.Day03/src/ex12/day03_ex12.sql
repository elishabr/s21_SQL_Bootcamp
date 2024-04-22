WITH new_values AS (
    SELECT
    id_po::BIGINT,
    id_p::BIGINT,
    (SELECT m.id FROM menu m WHERE m.pizza_name = 'greek pizza'),
    '2022-02-25'::DATE
    FROM GENERATE_SERIES(1::BIGINT, (SELECT COUNT(*) FROM person)) as id_p
    JOIN GENERATE_SERIES((SELECT COUNT(*) FROM person_order)+1,
    (SELECT COUNT(*) FROM person_order)+(SELECT COUNT(*) FROM person)) as id_po
    ON id_p = id_po-(SELECT COUNT(*) FROM person_order)
)

INSERT INTO person_order(id, person_id, menu_id, order_date)
SELECT * FROM new_values;

