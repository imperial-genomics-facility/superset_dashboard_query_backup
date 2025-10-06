SELECT project_igf_id AS project_igf_id,
       panel_info AS panel_info,
       count(panel_info) AS `COUNT(panel_info)`
FROM
  (SELECT p.project_igf_id,
          cs.panel_info,
          cs.slide_run_date
   FROM project p
   JOIN cosmx_run cr ON p.project_id=cr.project_id
   JOIN cosmx_slide cs ON cr.cosmx_run_id=cs.cosmx_run_id) AS virtual_table
GROUP BY project_igf_id,
         panel_info
ORDER BY `COUNT(panel_info)` DESC
LIMIT 1000;