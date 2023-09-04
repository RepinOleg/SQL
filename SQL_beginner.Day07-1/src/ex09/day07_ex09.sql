WITH table_age AS (
    SELECT person.address,
        ROUND(
            (
                MAX(age) - (MIN(age)::numeric / MAX(age)::numeric)
            ),
            2
        )::real AS formula,
        ROUND(AVG(age), 2)::real AS average
    FROM person
    GROUP BY address
)
SELECT address,
    formula,
    average,
    (
        CASE
            WHEN formula > average THEN TRUE
            ELSE FALSE
        END
    ) AS comparison
FROM table_age
ORDER BY 1;