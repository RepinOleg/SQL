WITH first_table AS (
    SELECT u.name,
        u.lastname,
        b.type,
        SUM(b.money) AS volume,
        b.currency_id
    FROM "user" u
        FULL JOIN balance b ON b.user_id = u.id
    GROUP by 1,
        2,
        3,
        5
    ORDER BY 1 DESC,
        2,
        3
),
second_table AS (
    SELECT c.id,
        c.name AS currency_name,
        c.rate_to_usd AS last_rate_to_usd,
        c.updated
    FROM currency c
        JOIN (
            SELECT MAX(updated) AS updated
            FROM currency
        ) c2 ON c.updated = c2.updated
)
SELECT COALESCE(f.name, 'not defined') AS name,
    COALESCE(f.lastname, 'not defined') AS lastname,
    f.type,
    f.volume,
    COALESCE(s.currency_name, 'not defined') AS currency_name,
    COALESCE(s.last_rate_to_usd, 1) AS last_rate_to_usd,
    COALESCE(
        (f.volume * s.last_rate_to_usd)::real,
        f.volume * 1
    ) AS total_volume_in_usd
FROM second_table s
    FULL JOIN first_table f ON f.currency_id = s.id
ORDER BY 1 DESC,
    2,
    3;