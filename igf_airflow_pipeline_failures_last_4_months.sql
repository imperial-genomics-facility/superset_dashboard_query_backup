SELECT DATE_TRUNC('day', execution_date) AS __timestamp,
       count(dag_id) AS "Failed pipelines"
FROM
  (SELECT dag_id,
          execution_date
   from dag_run
   where state='failed'
   order by execution_date desc) AS virtual_table
WHERE execution_date >= TO_TIMESTAMP('2024-09-13 00:00:00.000000', 'YYYY-MM-DD HH24:MI:SS.US')
  AND execution_date < TO_TIMESTAMP('2024-12-13 00:00:00.000000', 'YYYY-MM-DD HH24:MI:SS.US')
GROUP BY DATE_TRUNC('day', execution_date)
LIMIT 50000;