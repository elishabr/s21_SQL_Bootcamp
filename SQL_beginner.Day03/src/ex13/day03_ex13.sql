DELETE FROM person_order po
WHERE po.order_date = '2022-02-25'::DATE;
DELETE FROM menu m
WHERE m.pizza_name = 'greek pizza';