SELECT project_igf_id AS project_igf_id,
       analysis_triggered AS analysis_triggered
FROM
  (SELECT p.project_igf_id,
          COUNT(a.analysis_id) AS analysis_triggered
   FROM pipeline_seed ps
   JOIN pipeline pl ON pl.pipeline_id=ps.pipeline_id
   JOIN analysis a ON a.analysis_id=ps.seed_id
   AND ps.seed_table='analysis'
   JOIN project p ON p.project_id=a.project_id
   WHERE datediff(now(), ps.date_stamp) <= 365
   GROUP BY p.project_igf_id
   ORDER BY COUNT(a.analysis_id) desc) AS virtual_table
LIMIT 1000;