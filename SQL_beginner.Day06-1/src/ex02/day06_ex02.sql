SELECT p.name,
    m.pizza_name,
    m.price,
    (m.price - (m.price * (pd.discount / 100)))::real AS discount_price,
    pi.name AS pizzeria_name
FROM person_order po
    JOIN person p ON po.person_id = p.id
    JOIN menu m ON m.id = po.menu_id
    JOIN pizzeria pi ON pi.id = m.pizzeria_id
    JOIN person_discounts pd ON pd.person_id = po.person_id
    AND pd.pizzeria_id = pi.id
ORDER BY 1,
    2;