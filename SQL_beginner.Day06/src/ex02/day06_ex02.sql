SELECT p.name, 
m.pizza_name, 
m.price, 
ROUND((1 - pd.discount/100) * m.price) AS discount_price, 
pz.name
FROM (((person_order po JOIN menu m ON po.menu_id = m.id) 
JOIN pizzeria pz ON m.pizzeria_id = pz.id) 
JOIN person p ON po.person_id = p.id) 
JOIN person_discounts pd ON pd.person_id = p.id
AND pd.pizzeria_id = m.pizzeria_id
ORDER BY 1,2;