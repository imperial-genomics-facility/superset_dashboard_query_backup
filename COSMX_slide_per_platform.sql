SELECT cosmx_platform_name AS cosmx_platform_name,
       count(cosmx_slide_id) AS `COUNT(cosmx_slide_id)`
FROM
  (SELECT slide.cosmx_slide_id,
          platform.cosmx_platform_name
   FROM cosmx_slide slide
   JOIN cosmx_platform platform ON slide.cosmx_platform_id = platform.cosmx_platform_id
   LIMIT 10000) AS virtual_table
GROUP BY cosmx_platform_name
ORDER BY `COUNT(cosmx_slide_id)` DESC
LIMIT 1000;