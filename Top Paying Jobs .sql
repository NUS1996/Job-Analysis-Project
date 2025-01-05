-- What are the top paying Data Analyst Jobs? 

SELECT  cd.name,
        jbf.job_title_short, 
        jbf.job_location, jbf.salary_year_avg
FROM 
    job_postings_fact AS jbf
LEFT JOIN   
    company_dim AS cd 
ON 
    jbf.company_id = cd.company_id
WHERE 
    jbf.job_title_short LIKE '%Data%Analyst%'
AND 
    jbf.salary_year_avg IS NOT NULL
ORDER BY 
    jbf.salary_year_avg DESC
LIMIT 15;

-- What are the top paying Data Analyst jobs that are remote?

SELECT  cd.name,
        jbf.job_title_short, 
        jbf.job_location, jbf.salary_year_avg
FROM 
    job_postings_fact AS jbf
LEFT JOIN   
    company_dim AS cd 
ON 
    jbf.company_id = cd.company_id
WHERE 
    (jbf.job_title_short LIKE '%Data%Analyst%')
AND 
(jbf.job_location = 'Anywhere' OR jbf.job_location = 'United Kingdom')
AND 
    jbf.salary_year_avg IS NOT NULL
ORDER BY 
    jbf.salary_year_avg DESC
LIMIT 15;

-- What was the average salary for data analyst in 2023?

SELECT 
    EXTRACT(YEAR FROM job_posted_date) AS Year,
    EXTRACT(MONTH FROM job_posted_date) As Month,
    ROUND(AVG(salary_year_avg),2) AS Averge_salary 
FROM 
    job_postings_fact 
WHERE 
    (job_title_short LIKE '%Data%Analyst%'
AND 
    salary_year_avg IS NOT NULL)
    GROUP BY 1,2
    ORDER BY 3 DESC;

