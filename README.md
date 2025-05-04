
# 📊 Data Job Market Dashboard (US vs UK)

A snapshot of the current data job market across the United States and the United Kingdom, based on 150 job postings pulled from each country via the Adzuna API. This project involved SQL data modeling, category classification, salary analysis, and a final dashboard built in Looker Studio.

**Dashboard Link:** [View Dashboard](https://lookerstudio.google.com/reporting/72a3e768-1da4-41ff-93c3-00961887a5f3)  
**LinkedIn:** [Claire Sifuentes](https://www.linkedin.com/in/claire-sifuentes-222037253/)

---

## 📌 Project Summary

- Used Adzuna API to pull 150 data-related job listings from both the US and UK (300 total).
- Cleaned the dataset in Excel to remove irrelevant job types.
- Categorized roles using regex and manual review.
- Analyzed job types, salary distribution, and country-by-country breakdowns.
- Designed a polished dashboard in Looker Studio using CSV and SQL-prepped data.

---

## 📈 Key Insights

- 42% of roles pay between $40K–$59K  
- Only 14.5% exceed $100K  
- Data Scientists average $138,324  
- UK Data Engineers average $119K  
- Data Analyst roles range from $39K–$140K  

---

## 🧠 SQL Highlights

### 🧩 Role Breakdown by Category

```sql
SELECT
  CASE
    WHEN job_category ILIKE '%scientist%' THEN 'Data Scientist'
    ELSE job_category
  END AS clean_category,
  COUNT(*)
FROM job_listings
GROUP BY clean_category;
```

**Results:**
- Data Analyst: 41  
- Data Scientist: 19  
- Data Engineer: 44  
- Analytics – Other: 62  

---

### 🥇 Top Job Titles (by Frequency)

```sql
SELECT job_title, COUNT(*) AS total_jobs
FROM job_listings
GROUP BY job_title
ORDER BY total_jobs DESC
LIMIT 10;
```

---

### 🌍 Country Comparison

```sql
SELECT country, COUNT(*) as total_listings
FROM job_listings
GROUP BY country
ORDER BY total_listings DESC;
```

- US: 89 listings  
- UK: 77 listings  

---

### 💰 Salary Aggregates

```sql
SELECT 
  ROUND(MAX(max_salary), 2) AS top_salary,
  ROUND(MIN(max_salary), 2) AS min_salary,
  ROUND(AVG(max_salary), 2) AS avg_salary,
  ROUND(PERCENTILE_CONT(0.5) WITHIN GROUP(ORDER BY max_salary)::decimal, 2) AS median_salary,
  ROUND(MODE() WITHIN GROUP(ORDER BY max_salary), 2) AS mode
FROM job_listings;
```

- Top Salary: $245,980.98  
- Min Salary: $27,441.68  
- Avg Salary: $76,694.48  
- Median Salary: $56,646.09  
- Mode: $65,000  

---

## 🔧 Tools Used

- PostgreSQL  
- Excel  
- Canva  
- Google Looker Studio  
- Adzuna API  

---

## 📬 Contact

Feel free to connect or reach out via [LinkedIn](https://www.linkedin.com/in/claire-sifuentes-222037253/)!
