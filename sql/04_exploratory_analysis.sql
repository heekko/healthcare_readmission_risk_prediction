-- Diabetes Hospital Readmission Analysis
-- Database: MariaDB

SHOW DATABASES;

USE diabetes_readmission;

SELECT DATABASE();

SHOW TABLES;

-- Exploratory Data Analysis -----

-- 1. Any Readmission rate by Age Group
SELECT age,
       COUNT(*) AS total_encounters,
       SUM(CASE WHEN readmitted_binary = 1 THEN 1 ELSE 0 END) AS readmitted_encounters,
       ROUND(SUM(CASE WHEN readmitted_binary = 1 THEN 1 ELSE 0 END)/COUNT(*)*100, 2) AS readmission_rate_pct
  FROM diabetes_hospital_readmission
  GROUP BY age
  ORDER BY readmission_rate_pct DESC;

-- 2. Hospital Stay by Diabetes Medication
SELECT diabetesMed,
       ROUND(AVG(time_in_hospital),2) AS avg_hospital_stay
  FROM diabetes_hospital_readmission
  GROUP BY diabetesMed;

-- 3. Medication Burden by Readmission
SELECT readmitted,
       COUNT(*) AS total_encounters,
       ROUND(AVG(num_medications), 2) AS avg_num_medications,
       ROUND(AVG(time_in_hospital), 2) AS avg_hospital_stay
  FROM diabetes_hospital_readmission
  GROUP BY readmitted;

-- 4. Any Readmission Rate by Previous Inpatient Visits
SELECT 
    CASE 
        WHEN number_inpatient = 0 THEN '0'
        WHEN number_inpatient = 1 THEN '1'
        WHEN number_inpatient = 2 THEN '2'
        WHEN number_inpatient IS NULL THEN 'Missing'
        ELSE '3+'
    END AS previous_inpatient_group,
    COUNT(*) AS total_encounters,
    SUM(readmitted_binary) AS readmitted_encounters,
    ROUND(AVG(readmitted_binary)*100, 2) AS readmission_rate_pct
  FROM diabetes_hospital_readmission
  GROUP BY previous_inpatient_group
  ORDER BY MIN(number_inpatient);

-- 5. Any Readmission Rate by HbA1C Test Result
SELECT A1Cresult,
       COUNT(*) AS total_encounters,
       SUM(readmitted_binary) AS readmitted_encounters,
       ROUND(AVG(readmitted_binary)*100, 2) AS readmission_rate_pct,
       ROUND(AVG(time_in_hospital), 2) AS avg_hospital_stay
  FROM diabetes_hospital_readmission
  GROUP BY A1Cresult
 ORDER BY readmission_rate_pct DESC;

-- 6. Any Readmission Rate by Hospital Stay Duration
SELECT
    CASE
      WHEN time_in_hospital <= 3 THEN '1-3 days'
      WHEN time_in_hospital <= 7 THEN '4-7 days'
      WHEN time_in_hospital IS NULL THEN 'Missing'
      ELSE '8+ days'
    END AS hospital_stay_group,
    COUNT(*) AS total_encounters,
    SUM(readmitted_binary) AS readmitted_encounters,
    ROUND(AVG(readmitted_binary)*100, 2) AS readmission_rate_pct,
    ROUND(AVG(num_medications), 2) AS avg_num_medications
  FROM diabetes_hospital_readmission
  GROUP BY hospital_stay_group
  ORDER BY readmission_rate_pct DESC;
  
-- 7. 30-day Readmission Rate
  SELECT COUNT(*) AS total_encounters,
         SUM(readmitted_30days) AS readmitted_30days,
         ROUND(AVG(readmitted_30days)*100, 2) AS readmission_30days_rate_pct
    FROM diabetes_hospital_readmission;

-- 8. Compare Early vs Late vs None Readmissions 
SELECT
    CASE
        WHEN readmitted = '<30' THEN 'Early (<30 days)'
        WHEN readmitted = '>30' THEN 'Late (>30 days)'
        ELSE 'Not readmitted'
    END AS readmission_group,
    COUNT(*) AS total_encounters,
    ROUND(AVG(time_in_hospital), 2) AS avg_hospital_stay,
    ROUND(AVG(num_medications), 2) AS avg_medications,
    ROUND(AVG(number_inpatient), 2) AS avg_previous_inpatient
FROM diabetes_hospital_readmission
GROUP BY readmission_group;

-- 9. Compare any Readmission vs 30-day Readmission
SELECT age,
       COUNT(*) AS total_encounters,
       ROUND(AVG(readmitted_binary) * 100, 2) AS any_readmission_rate_pct,
       ROUND(AVG(readmitted_30days) * 100, 2) AS readmission_30day_rate_pct
FROM diabetes_hospital_readmission
GROUP BY age
ORDER BY age;

-- 10. Readmission Rate by Diagnosis Burden
SELECT
    CASE
        WHEN number_diagnoses <= 3 THEN '1-3'
        WHEN number_diagnoses <= 6 THEN '4-6'
        WHEN number_diagnoses IS NULL THEN 'Missing'
        ELSE '7+'
    END AS diagnosis_group,
    COUNT(*) AS total_encounters,
    ROUND(AVG(readmitted_30days) * 100, 2) AS readmission_30day_rate_pct,
    ROUND(AVG(time_in_hospital), 2) AS avg_hospital_stay
FROM diabetes_hospital_readmission
GROUP BY diagnosis_group
ORDER BY MIN(number_diagnoses);

-- 11. Rank Age Groups by 30-day Readmission Rate
WITH age_readmission AS (
     SELECT age,
            COUNT(*) AS total_encounters,
            AVG(readmitted_30days) * 100 AS rate_pct
        FROM diabetes_hospital_readmission
        GROUP BY age
        )
SELECT age,
       total_encounters,
       ROUND(rate_pct, 2) AS readmission_30days_rate_pct,
       DENSE_RANK() OVER (ORDER BY rate_pct DESC) AS risk_rank
FROM age_readmission
ORDER BY risk_rank;