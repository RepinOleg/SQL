WITH days_cte AS (
	SELECT days::date AS missing_date FROM
	generate_series('2022-01-01'::timestamp,
	'2022-01-10'::timestamp,
	'1 day'::interval) AS days
			   
)		   
SELECT missing_date FROM days_cte   		   
LEFT JOIN (SELECT visit_date FROM person_visits
	WHERE person_id BETWEEN 1 AND 2) AS pv
ON days_cte.missing_date = pv.visit_date
WHERE visit_date is NULL
ORDER BY 1;
