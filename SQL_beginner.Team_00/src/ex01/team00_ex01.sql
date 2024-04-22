WITH RECURSIVE cte_node (node_id, point_1, point_2, result_cost, level, path) AS (
    SELECT node_id, point_1, point_2, 0, 0, cast('{a,' as text)  FROM node
        WHERE point_1 = 'a'

    UNION ALL

    SELECT n.node_id, n.point_1, n.point_2, ct.result_cost + n.cost as result_cost, level+1, ct.path || n.point_1 || ','  FROM node n
        JOIN cte_node ct ON ct.point_1 = n.point_2
        WHERE n.point_1 != 'a' AND ct.path not LIKE ('%' || n.point_1 || '%')

)


SELECT (MIN(result_cost) + (SELECT cost FROM node WHERE (SELECT SUBSTRING(path, LENGTH(path) - 1, 1)) = node.point_1 AND node.point_2 = 'a')) AS total_cost, (path || 'a}') AS tour FROM cte_node
    WHERE level = 3
GROUP BY path
ORDER BY 1, 2
