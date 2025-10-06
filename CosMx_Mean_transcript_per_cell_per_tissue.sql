SELECT mean_transcript_per_cell AS mean_transcript_per_cell,
       tissue_annotation AS tissue_annotation,
       sum(mean_transcript_per_cell) AS `SUM(mean_transcript_per_cell)`
FROM
  (SELECT annot.tissue_annotation,
          rna_qc.mean_transcript_per_cell
   FROM cosmx_fov fov
   JOIN cosmx_fov_annotation annot ON fov.cosmx_fov_id=annot.cosmx_fov_id
   JOIN cosmx_fov_rna_qc rna_qc ON fov.cosmx_fov_id=rna_qc.cosmx_fov_id
   WHERE fov.slide_type="RNA"
   LIMIT 1000000) AS virtual_table
GROUP BY mean_transcript_per_cell,
         tissue_annotation
LIMIT 50000;