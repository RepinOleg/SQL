SET ENABLE_SEQSCAN = OFF;
CREATE UNIQUE INDEX idx_menu_unique ON menu (pizzeria_id, pizza_name);
EXPLAIN ANALYZE
SELECT pizzeria_id,
    pizza_name
FROM menu
WHERE pizzeria_id = 2
    AND pizza_name = 'pepperoni pizza';