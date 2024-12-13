SELECT `Month` AS `Month`,
       sum(`NOVASEQ6000`) AS `NOVASEQ6000`,
       sum(`NEXTSEQ2000`) AS `NEXTSEQ2000`,
       sum(`HISEQ4000`) AS `HISEQ4000`,
       sum(`NEXTSEQ`) AS `NEXTSEQ`,
       sum(`MISEQ`) AS `MISEQ`
FROM
  (SELECT t3.Month,
          SUM(t3.NOVASEQ6000) as 'NOVASEQ6000',
          SUM(t3.NEXTSEQ2000) as 'NEXTSEQ2000',
          SUM(t3.HISEQ4000) as 'HISEQ4000',
          SUM(t3.NEXTSEQ) as 'NEXTSEQ',
          SUM(t3.MISEQ) as 'MISEQ'
   from
     (select t2.Month,
             CASE
                 WHEN t2.model_name = 'NEXTSEQ2000' THEN t2.total_runs
                 ELSE 0
             END AS 'NEXTSEQ2000',
             CASE
                 WHEN t2.model_name = 'MISEQ' THEN t2.total_runs
                 ELSE 0
             END AS 'MISEQ',
             CASE
                 WHEN t2.model_name = 'NEXTSEQ' THEN t2.total_runs
                 ELSE 0
             END AS 'NEXTSEQ',
             CASE
                 WHEN t2.model_name = 'HISEQ4000' THEN t2.total_runs
                 ELSE 0
             END AS 'HISEQ4000',
             CASE
                 WHEN t2.model_name = 'NOVASEQ6000' THEN t2.total_runs
                 ELSE 0
             END AS 'NOVASEQ6000'
      from
        (select t.Month,
                t.model_name,
                count(t.model_name) as 'total_runs'
         from
           (SELECT pl.model_name,
                   CAST(CONCAT(YEAR(sr.date_created), '-', MONTH(sr.date_created), '-01') as DATE) as 'Month'
            FROM igfdb.seqrun sr
            join igfdb.platform pl on pl.platform_id=sr.platform_id
            where sr.date_created > '2019-01-01') as t
         GROUP BY t.Month,
                  t.model_name
         ORDER BY t.Month desc) as t2) as t3
   GROUP BY t3.Month
   ORDER BY t3.Month DESC) AS virtual_table
GROUP BY `Month`
ORDER BY Month ASC
LIMIT 5000;