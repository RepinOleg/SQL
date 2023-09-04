SELECT person.address,
    pizzeria.name,
    COUNT(person_order.id) AS count_of_orders
FROM person_order
    JOIN person ON person_id = person.id
    JOIN menu ON menu_id = menu.id
    JOIN pizzeria ON pizzeria_id = pizzeria.id
GROUP BY address,
    pizzeria.name
ORDER BY 1,
    2;