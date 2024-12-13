SELECT seqrun_igf_id AS seqrun_igf_id,
       platform_name AS platform_name,
       trigger_count AS trigger_count
FROM
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
   join platform p on sr.platform_id=p.platform_id
   LIMIT 5) AS virtual_table
LIMIT 1000;