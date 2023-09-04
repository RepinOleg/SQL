-- SESSION #1
START TRANSACTION;
UPDATE pizzeria
SET rating = 5
WHERE name = 'Pizza Hut';
SELECT *
FROM pizzeria
WHERE name = 'Pizza Hut';
-- SESSION #2
SELECT *
FROM pizzeria
WHERE name = 'Pizza Hut';
-- SESSION #1
COMMIT;
-- SESSION #2
SELECT *
FROM pizzeria
WHERE name = 'Pizza Hut';