SELECT person.name, menu.pizza_name, pizzeria.name FROM person
JOIN person_order ON person_id = person.id
JOIN menu ON person_order.menu_id = menu.id
JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
ORDER BY 1, 2, 3;

