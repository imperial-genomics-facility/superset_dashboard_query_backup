SELECT DATE(DATE_SUB(`Date`, INTERVAL DAYOFMONTH(`Date`) - 1 DAY)) AS __timestamp,
       sum(`Reads`) AS `Total reads`
FROM
  (SELECT sr.date_created as 'Date',
          ra.attribute_value as 'Reads'
   FROM igfdb.run r
   join igfdb.seqrun sr on sr.seqrun_id=r.seqrun_id
   join igfdb.run_attribute ra on r.run_id=ra.run_id
   WHERE ra.attribute_name='R1_READ_COUNT') AS virtual_table
WHERE `Date` >= STR_TO_DATE('2019-01-01 14:01:44.000000', '%Y-%m-%d %H:%i:%s.%f')
  AND `Date` < STR_TO_DATE('2024-12-13 10:39:30.000000', '%Y-%m-%d %H:%i:%s.%f')
GROUP BY DATE(DATE_SUB(`Date`, INTERVAL DAYOFMONTH(`Date`) - 1 DAY))
ORDER BY `Total reads` DESC
LIMIT 1000;