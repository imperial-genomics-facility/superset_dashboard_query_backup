SELECT pipeline_name AS pipeline_name,
       pipeline_trigger_count AS pipeline_trigger_count
FROM
  (select t.pipeline_name,
          count(t.analysis_name) as pipeline_trigger_count
   from
     (select a.analysis_name,
             p.project_igf_id,
             pl.pipeline_name,
             ps.status,
             ps.date_stamp
      from pipeline_seed ps
      join analysis a on a.analysis_id=ps.seed_id
      join pipeline pl on pl.pipeline_id=ps.pipeline_id
      join project p on a.project_id=p.project_id
      where datediff(now(), ps.date_stamp) <= 365
        and ps.seed_table="analysis") t
   group by t.pipeline_name
   order by count(t.analysis_name) desc) AS virtual_table
LIMIT 1000;