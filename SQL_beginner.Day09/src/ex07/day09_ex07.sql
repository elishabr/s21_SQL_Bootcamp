CREATE OR REPLACE FUNCTION func_minimum(VARIADIC arr NUMERIC[] DEFAULT '{0}')
RETURNS NUMERIC
AS $BODY$
DECLARE
    minimum_value NUMERIC := arr[1];
	num NUMERIC := 0;
BEGIN
    FOREACH num IN ARRAY arr
    LOOP
        IF minimum_value > num THEN 
            minimum_value := num;
        END IF;
    END LOOP;
    RETURN minimum_value;
END;
$BODY$ LANGUAGE plpgsql;

-- SELECT func_minimum(VARIADIC arr => ARRAY[10.0, -1.0, 5.0, 4.4]);