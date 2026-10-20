-- Diabetes Hospital Readmission Analysis
-- Database: MariaDB

-- Data Quality Checks -----

USE diabetes_readmission;

DESCRIBE diabetes_hospital_readmission;

SELECT * FROM diabetes_hospital_readmission LIMIT 20;

SELECT COUNT(*) AS total_encounters,
       COUNT(DISTINCT encounter_id) AS unique_encounters,
       COUNT(DISTINCT patient_nbr) AS unique_patients
FROM diabetes_hospital_readmission;

-- Check Duplicate Encounter IDs
SELECT encounter_id,
       COUNT(*) AS duplicate_count
  FROM diabetes_hospital_readmission
  GROUP BY encounter_id
  HAVING COUNT(*) > 1
  ORDER BY duplicate_count DESC;

-- Check missing values in selected columns
SELECT
    SUM(CASE WHEN race = '?' OR race IS NULL
        THEN 1 ELSE 0 END) AS missing_race,
    SUM(CASE WHEN weight = '?' OR weight IS NULL
        THEN 1 ELSE 0 END) AS missing_weight,      
    SUM(CASE WHEN medical_specialty = '?'
                  OR medical_specialty IS NULL
        THEN 1 ELSE 0 END) AS missing_specialty,
    SUM(CASE WHEN diag_1 = '?' OR diag_1 IS NULL
        THEN 1 ELSE 0 END) AS missing_primary_diagnosis
FROM diabetes_hospital_readmission;


