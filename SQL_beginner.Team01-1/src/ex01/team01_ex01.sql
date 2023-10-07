--insert into currency values (100, 'EUR', 0.85, '2022-01-01 13:29');
--insert into currency values (100, 'EUR', 0.79, '2022-01-08 13:29');
WITH all_currency_before_date AS (
    SELECT user_id,
        "user".name,
        "user".lastname,
        currency_id,
        Balance.updated b_updated,
        Currency.updated c_updated
    FROM Balance
        FULL JOIN Currency ON Currency.id = Balance.currency_id
        AND Currency.updated <= Balance.updated
        AND Balance.currency_id IN (100, 200, 300)
        FULL JOIN "user" ON "user".id = Balance.user_id
),
all_currency_after_date AS (
    SELECT user_id,
        "user".name,
        "user".lastname,
        currency_id,
        Balance.updated b_updated,
        Currency.updated c_updated
    FROM Balance
        FULL JOIN Currency ON Balance.currency_id = Currency.id
        AND Balance.updated < Currency.updated
        AND Balance.currency_id IN (100, 200, 300)
        FULL JOIN "user" ON "user".id = Balance.user_id
),
did_not_have_exchange AS (
    SELECT user_id,
        name,
        lastname,
        currency_id,
        b_updated,
        MIN(c_updated)
    FROM (
            SELECT *
            FROM all_currency_after_date
            WHERE (user_id, currency_id, b_updated) IN (
                    SELECT user_id,
                        currency_id,
                        b_updated
                    FROM all_currency_before_date
                    WHERE c_updated IS NULL
                )
        ) AS curse_future
    GROUP BY user_id,
        name,
        lastname,
        currency_id,
        b_updated
),
was_have_exchange AS (
    SELECT user_id,
        name,
        lastname,
        currency_id,
        b_updated,
        MAX(c_updated)
    FROM (
            SELECT *
            FROM all_currency_before_date
            WHERE (user_id, currency_id, b_updated) NOT IN (
                    SELECT user_id,
                        currency_id,
                        b_updated
                    FROM did_not_have_exchange
                )
        ) AS curse_past
    GROUP BY user_id,
        name,
        lastname,
        currency_id,
        b_updated
),
res AS (
    SELECT CASE
            WHEN all_changes.name IS NULL THEN 'not defined'
            ELSE all_changes.name
        END AS name,
        CASE
            WHEN all_changes.lastname IS NULL THEN 'not defined'
            ELSE all_changes.lastname
        END AS lastname,
        q.name AS currency_name,
        (a.money * q.rate_to_usd)::real AS currency_
    FROM (
            SELECT *
            FROM was_have_exchange
            UNION
            SELECT *
            FROM did_not_have_exchange
        ) AS all_changes
        INNER JOIN Balance AS a ON a.updated = all_changes.b_updated
        AND a.user_id = all_changes.user_id
        AND a.currency_id = all_changes.currency_id
        INNER JOIN Currency AS q ON q.id = all_changes.currency_id
        AND q.updated = all_changes.max
)
SELECT *
FROM res
ORDER BY name DESC,
    lastname,
    currency_name;