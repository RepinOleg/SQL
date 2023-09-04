SELECT menu.id AS menu_id
FROM menu
    LEFT JOIN person_order ON menu_id = menu.id
WHERE order_date is NULL
ORDER BY 1;