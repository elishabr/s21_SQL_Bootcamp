CREATE TABLE node (
  node_id bigint PRIMARY KEY,
  point_1 VARCHAR(1) NOT NULL,
  point_2 VARCHAR(1) NOT NULL,
  cost INTEGER NOT NULL
);

INSERT INTO node VALUES (1, 'a', 'b', 10);
INSERT INTO node VALUES (2, 'b', 'a', 10);
INSERT INTO node VALUES (3, 'a', 'c', 15);
INSERT INTO node VALUES (4, 'c', 'a', 15);
INSERT INTO node VALUES (5, 'a', 'd', 20);
INSERT INTO node VALUES (6, 'd', 'a', 20);
INSERT INTO node VALUES (7, 'b', 'c', 35);
INSERT INTO node VALUES (8, 'c', 'b', 35);
INSERT INTO node VALUES (9, 'b', 'd', 25);
INSERT INTO node VALUES (10, 'd', 'b', 25);
INSERT INTO node VALUES (11, 'c', 'd', 30);
INSERT INTO node VALUES (12, 'd', 'c', 30);

WITH RECURSIVE cte_node (node_id, point_1, point_2, result_cost, level, path) AS (
    SELECT node_id, point_1, point_2, 0, 0, cast('{a,' as text)  FROM node
        WHERE point_1 = 'a'

    UNION ALL

    SELECT n.node_id, n.point_1, n.point_2, ct.result_cost + n.cost as result_cost, level+1, ct.path || n.point_1 || ','  FROM node n
        JOIN cte_node ct ON ct.point_1 = n.point_2
        WHERE n.point_1 != 'a' AND ct.path not LIKE ('%' || n.point_1 || '%')

),
table_one AS (
SELECT (MIN(result_cost) + (SELECT cost FROM node WHERE (SELECT SUBSTRING(path, LENGTH(path) - 1, 1)) = node.point_1 AND node.point_2 = 'a')) AS total_cost, (path || 'a}') AS tour FROM cte_node
    WHERE level = 3
GROUP BY path
ORDER BY 1, 2
),
table_two AS (
    SELECT MIN(total_cost) FROM table_one
)

SELECT * FROM table_one
WHERE total_cost = (SELECT * FROM table_two);
