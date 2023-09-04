WITH male AS (
    SELECT pizzeria.name AS pizzeria_name
    FROM pizzeria
        JOIN person_visits ON person_visits.pizzeria_id = pizzeria.id
        JOIN person ON person_visits.person_id = person.id
    WHERE person.gender = 'male'
),
female AS (
    SELECT pizzeria.name AS pizzeria_name
    FROM pizzeria
        JOIN person_visits ON person_visits.pizzeria_id = pizzeria.id
        JOIN person ON person_visits.person_id = person.id
    WHERE person.gender = 'female'
)
SELECT *
FROM male
EXCEPT ALL
SELECT *
FROM female
UNION ALL
(
    SELECT *
    FROM female
    EXCEPT ALL
    SELECT *
    FROM male
)
ORDER BY 1;