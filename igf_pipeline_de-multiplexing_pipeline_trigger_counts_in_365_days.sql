SELECT demultiplexing_pipeline_trigger_count AS demultiplexing_pipeline_trigger_count
FROM
  (select sum(t.trigger_count) AS demultiplexing_pipeline_trigger_count
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
   LIMIT 5000) AS virtual_table
LIMIT 1000;