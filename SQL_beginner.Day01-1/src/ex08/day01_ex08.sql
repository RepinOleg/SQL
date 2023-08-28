SELECT order_date, name || ' (age:' || age || ')' AS person_information
FROM person
NATURAL JOIN (SELECT order_date, person_id AS id FROM person_order) AS second_table
ORDER BY order_date, person_information;