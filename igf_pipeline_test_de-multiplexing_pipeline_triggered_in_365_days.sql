SELECT test_demultiplexing_triggered AS test_demultiplexing_triggered
FROM
  (SELECT COUNT(dag_id) AS Test_demultiplexing_triggered
   FROM dag_run
   WHERE dag_id='dag23_test_bclconvert_demult'
     AND date_part('day', now()-execution_date)<=365) AS virtual_table
LIMIT 1000;