WITH cte_amount_orders AS (
    SELECT pizzeria.name,
        COUNT(person_order.id) AS count
    FROM person_order
        JOIN menu ON menu_id = menu.id
        JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
    GROUP BY pizzeria.name
),
cte_amount_visits AS (
    SELECT pizzeria.name,
        COUNT(person_visits.id) AS count
    FROM person_visits
        JOIN pizzeria ON pizzeria_id = pizzeria.id
    GROUP BY pizzeria.name
),
cte_all AS (
    SELECT name,
        count
    FROM cte_amount_orders
    UNION ALL
    SELECT name,
        count
    FROM cte_amount_visits
)
SELECT name,
    SUM(count) AS total_count
FROM cte_all
GROUP BY name
ORDER BY 2 DESC,
    1;