with female AS (
    SELECT DISTINCT pizzeria.name AS pizzeria_name
    FROM person_visits
        JOIN person ON gender = 'female'
        JOIN person_order ON person.id = person_order.person_id
        JOIN menu ON menu_id = menu.id
        JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
),
male AS (
    SELECT DISTINCT pizzeria.name
    FROM person_visits
        JOIN person ON gender = 'male'
        JOIN person_order ON person.id = person_order.person_id
        JOIN menu ON menu_id = menu.id
        JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
) (
    SELECT *
    FROM female
    EXCEPT
    SELECT *
    FROM male
)
UNION
(
    SELECT *
    FROM male
    EXCEPT
    SELECT *
    FROM female
);