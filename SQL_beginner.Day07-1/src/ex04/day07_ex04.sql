SELECT person.name,
    COUNT(person_visits.person_id) AS count_of_visits
FROM person_visits
    JOIN person ON person.id = person_id
GROUP BY name
HAVING COUNT(person_visits.person_id) > 3;