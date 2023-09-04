CREATE MATERIALIZED VIEW mv_dmitriy_visits_and_eats AS
SELECT pizzeria.name AS pizzeria_name
FROM person_visits
    JOIN person ON name = 'Dmitriy'
    JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
    JOIN menu ON pizzeria.id = menu.pizzeria_id
WHERE visit_date = '2022-01-08'
    AND price < 800
ORDER BY 1;