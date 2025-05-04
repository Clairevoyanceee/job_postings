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
 CASE
  WHEN salary_usd < 40000 
THEN 'Under $39,999'
  WHEN salary_usd < 60000 AND salary_usd >= 40000 
THEN '$40,000-$59,999'
  WHEN salary_usd < 80000 AND salary_usd >=60000
THEN '$60,000-79,999'
  WHEN salary_usd < 100000 AND salary_usd >= 80000
THEN '$80,000-$99,999'
  WHEN salary_usd >= 100000
THEN '$100,000+'
  ELSE 'Uncategorized'
END AS salary_range,
CASE
WHEN job_category ILIKE '%scienist%' THEN 'Data Scientist'
  ELSE job_category
  END AS cleaned_category,
COUNT(*) as total_jobs
FROM jobs_converted
GROUP BY salary_range, cleaned_category
ORDER BY total_jobs DESC;

