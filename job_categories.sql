SELECT 
  CASE
  WHEN job_category ILIKE '%scienist%' THEN 'Data Scientist'
  ELSE job_category
  END AS cleaned_category,
  COUNT(*) AS total_listings
FROM job_listings
GROUP BY cleaned_category
ORDER BY total_listings DESC
;