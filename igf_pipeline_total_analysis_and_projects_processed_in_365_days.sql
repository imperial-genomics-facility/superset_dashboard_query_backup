SELECT total_analysis_triggers AS total_analysis_triggers,
       total_projects AS total_projects
FROM
  (SELECT total_analysis_triggers AS total_analysis_triggers,
          total_projects AS total_projects
   FROM
     (select count(t.analysis_name) as total_analysis_triggers,
             count(distinct(t.project_id)) as total_projects
      from
        (select a.analysis_name,
                pl.pipeline_name,
                ps.status,
                ps.date_stamp,
                a.project_id
         from pipeline_seed ps
         join analysis a on a.analysis_id=ps.seed_id
         join pipeline pl on pl.pipeline_id=ps.pipeline_id
         where datediff(now(), ps.date_stamp) <= 365
           and ps.seed_table="analysis") t) AS virtual_table
   LIMIT 10000) AS virtual_table
LIMIT 1000;