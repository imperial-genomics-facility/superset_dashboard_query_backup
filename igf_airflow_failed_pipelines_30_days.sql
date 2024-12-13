SELECT dag_id AS dag_id,
       count(dag_id) AS "COUNT(dag_id)"
FROM
  (SELECT dag_id,
          execution_date
   from dag_run
   where state='failed'
   order by execution_date desc) AS virtual_table
WHERE execution_date >= TO_TIMESTAMP('2024-11-13 00:00:00.000000', 'YYYY-MM-DD HH24:MI:SS.US')
  AND execution_date < TO_TIMESTAMP('2024-12-13 00:00:00.000000', 'YYYY-MM-DD HH24:MI:SS.US')
GROUP BY dag_id
ORDER BY "COUNT(dag_id)" DESC
LIMIT 100;