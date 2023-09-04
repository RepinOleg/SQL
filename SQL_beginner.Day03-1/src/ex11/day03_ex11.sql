UPDATE menu
SET price = ROUND(price - (price / 10))
WHERE pizza_name = 'greek pizza';