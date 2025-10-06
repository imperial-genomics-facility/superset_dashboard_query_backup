SELECT `2019` AS `2019`,
       `2020` AS `2020`,
       `2021` AS `2021`,
       `2022` AS `2022`,
       `2023` AS `2023`,
       `2024` AS `2024`,
       `2025` AS `2025`
FROM
  (select count(CASE
                    WHEN p.start_timestamp >= '2019-07-01'
                         and p.start_timestamp < '2020-07-01' THEN 1
                END) as '2019',
          count(CASE
                    WHEN p.start_timestamp >= '2020-07-01'
                         and p.start_timestamp < '2021-07-01' THEN 1
                END) as '2020',
          count(CASE
                    WHEN p.start_timestamp >= '2021-07-01'
                         and p.start_timestamp < '2022-07-01' THEN 1
                END) as '2021',
          count(CASE
                    WHEN p.start_timestamp >= '2022-07-01'
                         and p.start_timestamp < '2023-07-01' THEN 1
                END) as '2022',
          count(CASE
                    WHEN p.start_timestamp >= '2023-07-01'
                         and p.start_timestamp < '2024-07-01' THEN 1
                END) as '2023',
          count(CASE
                    WHEN p.start_timestamp >= '2024-07-01'
                         and p.start_timestamp < '2025-07-01' THEN 1
                END) as '2024',
          count(CASE
                    WHEN p.start_timestamp >= '2025-07-01'
                         and p.start_timestamp < '2026-07-01' THEN 1
                END) as '2025'
   FROM igfdb.project p
   WHERE p.deliverable="FASTQ") AS virtual_table
LIMIT 1000;