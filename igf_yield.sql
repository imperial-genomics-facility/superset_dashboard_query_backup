SELECT DATE(DATE_SUB(date_created, INTERVAL DAYOFMONTH(date_created) - 1 DAY)) AS __timestamp,
       sum(yield) AS `Yield in GB`
FROM
  (SELECT sr.seqrun_igf_id,
          sr.date_created,
          sra.attribute_value as 'yield'
   FROM igfdb.seqrun sr
   join igfdb.seqrun_attribute sra on sr.seqrun_id=sra.seqrun_id
   WHERE sra.attribute_name='Actual yield') AS virtual_table
GROUP BY DATE(DATE_SUB(date_created, INTERVAL DAYOFMONTH(date_created) - 1 DAY))
ORDER BY `Yield in GB` DESC
LIMIT 1000;