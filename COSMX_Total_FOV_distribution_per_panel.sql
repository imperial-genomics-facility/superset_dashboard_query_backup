SELECT total_fovs AS total_fovs,
       panel_info AS panel_info,
       (total_fovs) AS `(total_fovs)`
FROM
  (SELECT cs.cosmx_slide_igf_id,
          cs.panel_info,
          COUNT(cf.cosmx_fov_name) AS total_fovs
   FROM cosmx_slide cs
   JOIN cosmx_fov cf ON cs.cosmx_slide_id=cf.cosmx_slide_id
   GROUP BY cs.cosmx_slide_igf_id,
            cs.panel_info) AS virtual_table
GROUP BY total_fovs,
         panel_info
LIMIT 50000;