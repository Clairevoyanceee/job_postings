WITH jobs_converted AS (
  SELECT *, 
  CASE
    WHEN country = 'UK' then max_salary * 1.3
--current exchange rate 
    ELSE max_salary
END AS salary_usd
FROM job_listings
)

  SELECT 
  country,
  CASE
  WHEN job_category ILIKE '%scienist%' THEN 'Data Scientist'
  ELSE job_category
  END AS cleaned_category,
  COUNT(*) as total_jobs,
  ROUND(MAX(salary_usd),2) AS top_salary,
  ROUND(MIN(salary_usd),2) AS min_salary,
  ROUND(AVG(salary_usd),2) AS avg_salary,
  ROUND(percentile_cont(0.5) WITHIN GROUP(ORDER BY salary_usd)::decimal ,2) AS median_salary,
  ROUND(mode () WITHIN GROUP ( ORDER BY salary_usd ), 2) as mode
FROM jobs_converted
GROUP BY country, cleaned_category
ORDER by country ASC, total_jobs DESC;
