SELECT DATE(DATE_SUB(date_created, INTERVAL DAYOFMONTH(date_created) - 1 DAY)) AS __timestamp,
       flowcell_type AS flowcell_type,
       count(seqrun_id) AS `COUNT(seqrun_id)`
FROM
  (SELECT t2.seqrun_id,
          t2.date_created,
          SUM(t2.yield) AS yield,
          COALESCE(GROUP_CONCAT(t2.flowcell_type), 'UNKNOWN') AS flowcell_type
   FROM
     (SELECT t.seqrun_id,
             t.date_created,
             CASE
                 WHEN t.attribute_name = 'Actual yield' THEN t.attribute_value
                 ELSE NULL
             END yield,
             CASE
                 WHEN t.attribute_name = 'Flowcell mode' THEN t.attribute_value
                 ELSE NULL
             END flowcell_type
      FROM
        (SELECT sra.seqrun_id,
                sr.date_created,
                sra.attribute_name,
                sra.attribute_value
         FROM seqrun sr
         JOIN seqrun_attribute sra ON sr.seqrun_id = sra.seqrun_id
         WHERE sra.attribute_name IN ('Flowcell mode',
                                      'Actual yield')
         ORDER BY date_created DESC) AS t) AS t2
   GROUP BY t2.seqrun_id,
            t2.date_created) AS virtual_table
GROUP BY flowcell_type,
         DATE(DATE_SUB(date_created, INTERVAL DAYOFMONTH(date_created) - 1 DAY))
ORDER BY `COUNT(seqrun_id)` DESC
LIMIT 1000;