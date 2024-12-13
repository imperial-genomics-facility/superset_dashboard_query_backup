SELECT email AS email,
       last_access AS last_access
FROM
  (SELECT *
   from tower.tw_user) AS virtual_table
ORDER BY last_access DESC
LIMIT 100;