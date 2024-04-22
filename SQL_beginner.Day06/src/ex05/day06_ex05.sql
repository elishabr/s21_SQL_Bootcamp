-- Коментарий к таблицце
COMMENT ON TABLE person_discounts  IS 'Таблица с информацией о скидках поситителей в разных пицериях';
-- Коментарий к столбцам
COMMENT ON COLUMN person_discounts.id IS 'Первичный ключь строки в базе данных';
COMMENT ON COLUMN person_discounts.person_id IS 'Внешние ключи обеспечивает связь таблицы с таблицей person';
COMMENT ON COLUMN person_discounts.pizzeria_id IS 'Внешние ключи обеспечивает связь таблицы  с таблице pizzeria';
COMMENT ON COLUMN person_discounts.discount IS 'Размер скидки в процентах';