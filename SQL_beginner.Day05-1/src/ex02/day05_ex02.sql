CREATE INDEX idx_person_name ON person(UPPER(name));
SET Enable_seqscan = OFF;
EXPLAIN ANALYZE
SELECT name
FROM person p
WHERE UPPER(name) = 'KATE';