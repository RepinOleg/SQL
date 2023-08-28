SELECT object_name FROM (
	SELECT 2 AS marker, pizza_name AS object_name FROM menu
	UNION ALL
	SELECT 1 AS marker, name FROM person
	ORDER BY marker
) AS person_menu
ORDER BY marker, object_name;
