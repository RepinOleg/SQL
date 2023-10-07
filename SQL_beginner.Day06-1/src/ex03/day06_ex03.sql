DROP INDEX idx_person_discounts_unique;
CREATE UNIQUE INDEX idx_person_discounts_unique ON person_discounts(person_id, pizzeria_id);
SET ENABLE_SEQSCAN = OFF;
EXPLAIN ANALYSE
SELECT *
FROM person_discounts pd
WHERE pizzeria_id = 5
    AND person_id = 3;