CREATE INDEX idx_person_order_multi ON person_order(person_id, menu_id, order_date);
SET Enable_seqscan = OFF;
EXPLAIN ANALYZE
SELECT po.person_id,
    po.menu_id,
    po.order_date
FROM person_order po
WHERE person_id = 8
    AND menu_id = 19;