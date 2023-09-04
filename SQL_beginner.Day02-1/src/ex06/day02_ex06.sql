SELECT pizza_name, pizzeria.name AS pizzeria_name FROM menu
JOIN person_order ON menu.id = menu_id
JOIN pizzeria ON pizzeria_id = pizzeria.id
WHERE person_order.person_id = 1 OR person_order.person_id = 4
ORDER BY 1, 2;