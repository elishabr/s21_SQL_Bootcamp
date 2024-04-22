CREATE SEQUENCE seq_person_discounts
START 1
INCREMENT BY 1
MINVALUE 1
MAXVALUE 9223372036854775807
CYCLE;

SELECT SETVAL('seq_person_discounts', (SELECT MAX(id) FROM person_discounts));

ALTER TABLE person_discounts
ALTER COLUMN id SET DEFAULT nextval('seq_person_discounts');

-- INSERT INTO person_discounts(person_id, pizzeria_id, discount)
-- VALUES (5,5,20);