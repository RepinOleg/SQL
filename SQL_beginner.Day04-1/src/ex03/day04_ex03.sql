SELECT generated_date AS missing_date
FROM v_generated_dates
    LEFT JOIN person_visits ON visit_date = generated_date
WHERE visit_date IS NULL
ORDER BY 1;