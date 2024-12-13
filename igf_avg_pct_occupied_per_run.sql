SELECT seqrun_igf_id AS seqrun_igf_id,
       AVG(`Occupied`) AS `Average PCT Occupied`
FROM
  (SELECT sr.seqrun_igf_id,
          sr.date_created,
          sra.attribute_value as 'Occupied'
   FROM igfdb.seqrun sr
   join igfdb.seqrun_attribute sra on sr.seqrun_id=sra.seqrun_id
   WHERE sra.attribute_name='PCT Occupied') AS virtual_table
GROUP BY seqrun_igf_id
ORDER BY `Average PCT Occupied` DESC
LIMIT 5000;