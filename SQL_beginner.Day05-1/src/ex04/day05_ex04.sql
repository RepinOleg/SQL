CREATE UNIQUE INDEX idx_menu_unique ON menu(pizzeria_id, pizza_name);
SET ENABLE_SEQSCAN = OFF;
EXPLAIN ANALYZE
SELECT pizzeria_id,
    pizza_name
FROM menu m
WHERE pizzeria_id = 4
    AND pizza_name = 'pepperoni pizza';