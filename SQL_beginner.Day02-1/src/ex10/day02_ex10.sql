SELECT person.name AS person_name1, p.name AS person_name2, p.address AS common_address FROM person
JOIN (SELECT * FROM person) AS p ON person.address = p.address
WHERE person.address = p.address AND person.id > p.id
ORDER BY 1, 2, 3;
