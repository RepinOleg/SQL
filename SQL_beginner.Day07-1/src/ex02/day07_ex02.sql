WITH cte_amount_orders AS (
    SELECT pizzeria.name,
        COUNT(person_order.id) AS count,
        'order' AS action_type
    FROM person_order
        JOIN menu ON menu_id = menu.id
        JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
    GROUP BY pizzeria.name
    ORDER BY 2 DESC
    LIMIT 3
), cte_amount_visits AS (
    SELECT pizzeria.name,
        COUNT(person_visits.id) AS count,
        'visit' AS action_type
    FROM person_visits
        JOIN pizzeria ON pizzeria_id = pizzeria.id
    GROUP BY pizzeria.name
    ORDER BY 2 DESC
    LIMIT 3
)
SELECT *
FROM cte_amount_orders
UNION ALL
SELECT *
FROM cte_amount_visits
ORDER BY 3,
    2 DESC;