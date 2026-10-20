-- Diabetes Hospital Readmission Analysis
-- Database: MariaDB

-- Data Transformation -----

USE diabetes_readmission;

-- Add column for readmitted_binary
ALTER TABLE diabetes_hospital_readmission
ADD COLUMN IF NOT EXISTS readmitted_binary INT; 

UPDATE diabetes_hospital_readmission
SET readmitted_binary =
    CASE
     WHEN readmitted = 'NO' THEN 0
     WHEN readmitted = '>30' THEN 1
     WHEN readmitted = '<30' THEN 1
    END;

-- Add column for 30-days readmission
ALTER TABLE diabetes_hospital_readmission
ADD COLUMN IF NOT EXISTS readmitted_30days INT;

UPDATE diabetes_hospital_readmission
SET readmitted_30days =
    CASE
       WHEN readmitted = '<30' THEN 1
       WHEN readmitted IN ('NO', '>30') THEN 0
       ELSE NULL
    END;

-- Validate readmission target variables
SELECT readmitted,
       readmitted_binary,
       readmitted_30days,
       COUNT(*) AS total_encounters
    FROM diabetes_hospital_readmission
    GROUP BY readmitted,
             readmitted_binary,
             readmitted_30days
    ORDER BY readmitted;


