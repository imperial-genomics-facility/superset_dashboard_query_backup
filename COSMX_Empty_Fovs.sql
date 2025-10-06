SELECT cosmx_slide_igf_id AS cosmx_slide_igf_id,
       panel_info AS panel_info,
       count(empty_fov_ids) AS `COUNT(empty_fov_ids)`
FROM
  (SELECT cs.cosmx_slide_igf_id,
          cs.panel_info,
          cf.cosmx_fov_id,
          cf.cosmx_fov_name AS empty_fov_ids
   FROM cosmx_slide cs
   LEFT JOIN cosmx_fov cf ON cs.cosmx_slide_id=cf.cosmx_slide_id
   LEFT JOIN cosmx_fov_rna_qc fr ON cf.cosmx_fov_id=fr.cosmx_fov_id
   WHERE fr.cosmx_fov_id IS NULL
     AND cs.assay_type="RNA") AS virtual_table
GROUP BY cosmx_slide_igf_id,
         panel_info
ORDER BY `COUNT(empty_fov_ids)` DESC
LIMIT 1000;