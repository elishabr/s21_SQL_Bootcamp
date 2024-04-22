DROP FUNCTION fnc_persons_female;
DROP FUNCTION fnc_persons_male;

CREATE OR REPLACE FUNCTION fnc_persons(pgender VARCHAR DEFAULT 'female')
RETURNS TABLE (id_person BIGINT, name VARCHAR, age INTEGER, gender VARCHAR, address VARCHAR)
AS $$
    SELECT * FROM person WHERE gender = pgender;
$$ LANGUAGE SQL;

-- SELECT * 
-- FROM fnc_persons(pgender := 'male');

-- SELECT * 
-- FROM fnc_persons();