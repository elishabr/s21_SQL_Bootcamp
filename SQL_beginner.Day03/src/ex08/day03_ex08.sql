INSERT INTO menu(id, pizzeria_id, pizza_name, price)
VALUES ((SELECT COUNT(*) FROM menu)+1, (select pizzeria_id from menu WHERE id = 19), 'sicilian pizza', 900);