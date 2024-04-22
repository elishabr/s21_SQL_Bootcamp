

insert into currency values (100, 'EUR', 0.85, '2022-01-01 13:29');
insert into currency values (100, 'EUR', 0.79, '2022-01-08 13:29');

CREATE OR REPLACE FUNCTION fnc_nearest_currency(balance_updated timestamp,cur bigint)
RETURNS numeric AS
$$
DECLARE
    sum numeric := 0;
    current_currency timestamp := null;
    row_date RECORD;
BEGIN
    FOR row_date IN SELECT rate_to_usd, updated FROM currency WHERE id = cur ORDER BY updated LOOP
        IF(row_date.updated < balance_updated) THEN
            sum := row_date.rate_to_usd;
        end if;
    end loop;
    IF(sum = 0) THEN
        FOR row_date IN SELECT rate_to_usd, updated FROM currency WHERE id = cur ORDER BY updated desc LOOP
            IF(row_date.updated > balance_updated) THEN
                sum := row_date.rate_to_usd;
            end if;
        end loop;
    end if;
    RETURN sum;
end; $$ LANGUAGE plpgsql;

SELECT DISTINCT coalesce(u.name, 'not defined')     as name,
        coalesce(u.lastname, 'not defined') as lastname,
        c.name                              as currency_name,
        fnc_nearest_currency(balance_updated := b.updated, cur := b.currency_id)*b.money as currency_in_usd
FROM balance b
FULL JOIN public."user" u on u.id = b.user_id
JOIN public.currency c on b.currency_id = c.id
ORDER BY name desc, lastname, currency_name;