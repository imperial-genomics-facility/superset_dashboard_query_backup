SELECT DATE_TRUNC('week', queued_at) AS __timestamp,
       state AS state,
       count(state) AS "COUNT(state)"
FROM
  (SELECT *,
          end_date - start_date as duration
   from dag_run
   order by start_date DESC) AS virtual_table
GROUP BY state,
         DATE_TRUNC('week', queued_at)
ORDER BY "COUNT(state)" DESC
LIMIT 1000;