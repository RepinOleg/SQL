SELECT DISTINCT pizzeria.name AS pizzeria_name
FROM person_visits
    JOIN person ON person.id = person_visits.person_id
    JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
    JOIN person_order ON person.id = person_order.person_id
WHERE person.name = 'Andrey'
    AND visit_date != order_date
ORDER BY 1;