SELECT person.name AS person_name FROM person_order
JOIN person ON person_order.person_id = person.id
JOIN (SELECT * FROM menu WHERE pizza_name = 'pepperoni pizza' OR pizza_name = 'mushroom pizza') AS m
ON person_order.menu_id = m.id
WHERE person.gender = 'male' AND (person.address = 'Moscow' OR person.address = 'Samara')
ORDER BY 1 DESC;