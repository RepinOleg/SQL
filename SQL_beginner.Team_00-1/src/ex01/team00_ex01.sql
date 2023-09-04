CREATE TABLE points (
    point1 varchar,
    point2 varchar,
    cost int
);
INSERT INTO points
VALUES ('a', 'b', 10);
INSERT INTO points
VALUES ('b', 'a', 10);
INSERT INTO points
VALUES ('b', 'c', 35);
INSERT INTO points
VALUES ('c', 'b', 35);
INSERT INTO points
VALUES ('c', 'd', 30);
INSERT INTO points
VALUES ('d', 'c', 30);
INSERT INTO points
VALUES ('c', 'a', 15);
INSERT INTO points
VALUES ('a', 'c', 15);
INSERT INTO points
VALUES ('d', 'a', 20);
INSERT INTO points
VALUES ('a', 'd', 20);
INSERT INTO points
VALUES ('b', 'd', 25);
INSERT INTO points
VALUES ('d', 'b', 25);
WITH RECURSIVE paths AS (
    SELECT ('{' || point1) AS path,
        point2,
        cost AS total_cost
    FROM points
    WHERE point1 = 'a'
    UNION
    SELECT (paths.path || ',' || points.point1) AS path,
        points.point2,
        paths.total_cost + points.cost AS total_cost
    FROM points
        JOIN paths ON points.point1 = paths.point2
    WHERE path NOT LIKE ('%' || points.point1 || '%')
),
finall_path AS (
    SELECT total_cost,
        (path || ',a}') AS tour
    FROM paths
    WHERE point2 = 'a'
        AND LENGTH(path) = 8
    ORDER BY 1
),
result AS (
    SELECT total_cost,
        tour
    FROM finall_path
    WHERE (
            total_cost = (
                SELECT MIN(total_cost)
                FROM finall_path
            )
            OR total_cost = (
                SELECT MAX(total_cost)
                FROM finall_path
            )
        )
)
SELECT *
FROM result
ORDER BY 1,
    2;