SELECT pizzeria.name,
    COUNT(person_order.id) AS count_of_orders,
    ROUND(AVG(menu.price), 2)::real AS average_price,
    MAX(menu.price) AS max_price,
    MIN(menu.price) AS min_price
FROM person_order
    JOIN menu ON menu_id = menu.id
    JOIN pizzeria ON pizzeria_id = pizzeria.id
GROUP BY name
ORDER BY 1;