WITH pizzeria_1 AS(
    SELECT DISTINCT menu.pizza_name AS pizza_name,
        pizzeria.name AS pizzeria_name_1,
        menu.price,
        pizzeria.id AS id_1
    FROM menu
        JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
),
pizzeria_2 AS (
    SELECT DISTINCT menu.pizza_name AS pizza_name,
        pizzeria.name AS pizzeria_name_2,
        menu.price,
        pizzeria.id AS id_2
    FROM menu
        JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
)
SELECT pizzeria_1.pizza_name,
    pizzeria_1.pizzeria_name_1,
    pizzeria_2.pizzeria_name_2,
    pizzeria_1.price
FROM pizzeria_2
    JOIN pizzeria_1 ON pizzeria_1.price = pizzeria_2.price
    AND pizzeria_1.pizza_name = pizzeria_2.pizza_name
WHERE pizzeria_1.pizzeria_name_1 != pizzeria_2.pizzeria_name_2
    AND pizzeria_1.id_1 > pizzeria_2.id_2
ORDER BY 1;