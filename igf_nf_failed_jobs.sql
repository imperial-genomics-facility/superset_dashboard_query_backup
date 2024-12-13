SELECT last_updated AS last_updated,
       workflow_id AS workflow_id,
       name AS name,
       workdir AS workdir,
       error_action AS error_action
FROM
  (SELECT d.last_updated,
          t.workflow_id,
          d.name,
          d.workdir,
          d.error_action
   from tw_task t
   JOIN tw_task_data d ON t.data_id=d.id
   where t.status='FAILED'
   order by d.last_updated desc
   limit 50) AS virtual_table
ORDER BY last_updated DESC
LIMIT 1000;