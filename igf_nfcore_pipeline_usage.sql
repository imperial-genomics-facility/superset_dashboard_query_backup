SELECT repository AS repository,
       count(*) AS count
FROM
  (SELECT id,
          user_name,
          repository, start, last_updated
   FROM tw_workflow) AS virtual_table
GROUP BY repository
ORDER BY count DESC
LIMIT 100;