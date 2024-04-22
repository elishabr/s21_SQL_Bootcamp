CREATE OR REPLACE FUNCTION fnc_fibonacci( pstop INTEGER DEFAULT 10)
RETURNS SETOF INTEGER
AS $BODY$
DECLARE
    previous INTEGER := 0;
    current INTEGER := 1;
    amount INTEGER := 1;
    result INTEGER[] := ARRAY[0,1];
BEGIN
	IF pstop <= 0 THEN
		RETURN NEXT NULL;
	ELSE
		RETURN NEXT previous;
		IF pstop > 1 THEN
			RETURN NEXT current;
		END IF;
	END IF;
    WHILE amount < pstop LOOP
        previous := current;
        current := amount;
        amount := previous + current;
        RETURN NEXT current;
    END LOOP;
END;
$BODY$ LANGUAGE plpgsql;

-- select * from fnc_fibonacci(100);
-- select * from fnc_fibonacci();
-- SELECT * FROM fnc_fibonacci(10);
