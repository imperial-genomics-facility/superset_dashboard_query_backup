SELECT panel_info AS panel_info,
       count(panel_info) AS `COUNT(panel_info)`
FROM
  (SELECT panel_info
   FROM cosmx_slide) AS virtual_table
GROUP BY panel_info
ORDER BY `COUNT(panel_info)` DESC
LIMIT 10000;