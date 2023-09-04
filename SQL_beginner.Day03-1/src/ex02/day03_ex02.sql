SELECT menu.pizza_name AS pizza_name,
    price,
    pizzeria.name AS pizzeria_name
FROM menu
    LEFT JOIN person_order ON person_order.menu_id = menu.id
    JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
WHERE person_order IS NULL
ORDER BY 1,
    2;