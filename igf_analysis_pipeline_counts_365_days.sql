SELECT pipeline_name AS pipeline_name,
       count(seed_id) AS `Run counts`
FROM
  (select pl.pipeline_name,
          pls.seed_id
   from igfdb.pipeline pl
   join igfdb.pipeline_seed pls on pl.pipeline_id=pls.pipeline_id
   WHERE pls.seed_table in ('experiment',
                            'analysis')
     AND datediff(current_date, date(pls.date_stamp)) < 365) AS virtual_table
GROUP BY pipeline_name
ORDER BY `Run counts` DESC
LIMIT 10000;