SELECT DATE(DATE_SUB(date_stamp, INTERVAL DAYOFWEEK(date_stamp) - 1 DAY)) AS __timestamp,
       count(seed_id) AS `Pipeline run count`
FROM
  (select pl.pipeline_name,
          pls.*
   FROM igfdb.pipeline pl
   join igfdb.pipeline_seed as pls on pl.pipeline_id=pls.pipeline_id
   WHERE pl.pipeline_name like '%demult%') AS virtual_table
WHERE date_stamp >= STR_TO_DATE('2023-12-13 00:00:00.000000', '%Y-%m-%d %H:%i:%s.%f')
  AND date_stamp < STR_TO_DATE('2024-12-13 00:00:00.000000', '%Y-%m-%d %H:%i:%s.%f')
GROUP BY DATE(DATE_SUB(date_stamp, INTERVAL DAYOFWEEK(date_stamp) - 1 DAY))
ORDER BY `Pipeline run count` DESC
LIMIT 5000;