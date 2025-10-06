SELECT MAKEDATE(YEAR(slide_run_date), 1) + INTERVAL QUARTER(slide_run_date) QUARTER - INTERVAL 1 QUARTER AS __timestamp,
                                                                                                            MAKEDATE(YEAR(slide_run_date), 1) + INTERVAL QUARTER(slide_run_date) QUARTER - INTERVAL 1 QUARTER AS slide_run_date,
                                                                                                                                                                                                                 count(cosmx_slide_name) AS `COUNT(cosmx_slide_name)`
FROM
  (SELECT cosmx_slide_name,
          slide_run_date
   FROM cosmx_slide) AS virtual_table
GROUP BY MAKEDATE(YEAR(slide_run_date), 1) + INTERVAL QUARTER(slide_run_date) QUARTER - INTERVAL 1 QUARTER,
                                                                                                   MAKEDATE(YEAR(slide_run_date), 1) + INTERVAL QUARTER(slide_run_date) QUARTER - INTERVAL 1 QUARTER
ORDER BY `COUNT(cosmx_slide_name)` DESC
LIMIT 1000;