WITH cte_visits AS (
    SELECT person.name,
        COUNT(person_id) AS count_of_visits
    FROM person_visits
        JOIN person ON person.id = person_id
    GROUP BY person_id,
        person.name
    ORDER BY count_of_visits DESC,
        person.name
)
SELECT name,
    count_of_visits
FROM cte_visits
LIMIT 4;