SELECT person.name,
    menu.pizza_name,
    menu.price,
    menu.price - (menu.price / 100 * person_discounts.discount) AS discount_price,
    pizzeria.name AS pizzeria_name
FROM person_order
    JOIN person ON person.id = person_order.person_id
    JOIN menu ON menu.id = person_order.menu_id
    JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
    JOIN person_discounts ON (
        person_discounts.person_id = person_order.person_id
        AND person_discounts.pizzeria_id = pizzeria.id
    )
ORDER BY 1,
    2;