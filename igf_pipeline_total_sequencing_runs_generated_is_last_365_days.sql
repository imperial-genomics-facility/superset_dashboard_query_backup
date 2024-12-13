SELECT platform_name AS platform_name,
       sequencing_runs AS sequencing_runs
FROM
  (select t2.platform_name,
          count(t2.seqrun_igf_id) as sequencing_runs
   from
     (select sr.seqrun_igf_id,
             p.model_name as platform_name,
             t.trigger_count
      from seqrun sr
      join
        (select seed_id,
                count(date_stamp) as 'trigger_count'
         from pipeline_seed
         where datediff(now(), date_stamp) <= 365
           and seed_table="seqrun"
         group by seed_id
         order by count(pipeline_id) desc) t on sr.seqrun_id=t.seed_id
      join platform p on sr.platform_id=p.platform_id) t2
   group by t2.platform_name
   order by count(t2.seqrun_igf_id) desc) AS virtual_table
LIMIT 1000;