SELECT user_name AS user_name,
       count(id) AS `COUNT(id)`
FROM
  (SELECT id,
          user_name,
          repository, start, last_updated
   FROM tw_workflow) AS virtual_table
GROUP BY user_name
ORDER BY `COUNT(id)` DESC
LIMIT 1000;