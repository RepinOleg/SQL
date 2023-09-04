SELECT pizzeria.name AS pizzeria_name from person_visits
JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
JOIN menu ON menu.pizzeria_id = pizzeria.id
JOIN person ON person_visits.person_id = person.id
WHERE person.name = 'Dmitriy' AND visit_date = '2022-01-08' AND price < 800;