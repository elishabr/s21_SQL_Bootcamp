
WITH fresh_currency AS (
SELECT id,name, max(updated) as update
    FROM currency
    GROUP BY id,name
), nw_fresh_currency AS(
    SELECT fc.id,fc.name,rate_to_usd,updated FROM fresh_currency fc
    LEFT JOIN currency c ON c.updated = fc.update and c.name = fc.name
), fresh_balance AS(
    SELECT user_id,type, max(updated) as update, sum(money) as sum_money
    FROM balance
    GROUP BY user_id,type
), nw_fresh_balance AS (
    SELECT fb.user_id, sum_money, fb.type, currency_id, fb.update FROM fresh_balance fb
    LEFT JOIN balance b ON fb.user_id = b.user_id and fb.update = b.updated and fb.type = b.type
)

SELECT coalesce(u.name,'not defined') as name, coalesce(u.lastname,'not defined') as lastname,
       b.type, sum_money as volume, coalesce(c.name,'not defined') as currency_name,
       coalesce(c.rate_to_usd,1::numeric) as last_rate_to_usd,
       sum_money * coalesce(c.rate_to_usd,1::numeric) as total_volume_in_usd
FROM "user" u
FULL JOIN nw_fresh_balance b on u.id = b.user_id
FULL JOIN nw_fresh_currency c ON c.id = b.currency_id
ORDER BY name DESC, lastname, type;