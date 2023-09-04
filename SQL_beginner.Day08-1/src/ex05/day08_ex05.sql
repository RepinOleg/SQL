-- SESSION #1
BEGIN;
-- SESSION #2
BEGIN;
-- SESSION #1
SELECT SUM(rating)
FROM pizzeria;
-- SESSION #2
UPDATE pizzeria
SET rating = 1
WHERE name = 'Pizza Hut';
COMMIT;
-- SESSION #1
SELECT SUM(rating)
FROM pizzeria;
COMMIT;
-- SESSION #1
SELECT SUM(rating)
FROM pizzeria;
-- SESSION #2
SELECT SUM(rating)
FROM pizzeria;