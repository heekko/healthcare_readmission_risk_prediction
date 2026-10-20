-- Diabetes Hospital Readmission Analysis
-- Database: MariaDB

CREATE DATABASE IF NOT EXISTS diabetes_readmission;

USE diabetes_readmission;

-- Create table to import dataset
CREATE TABLE IF NOT EXISTS diabetes_hospital_readmission(
    encounter_id VARCHAR(10) PRIMARY KEY,
    patient_nbr INT,
    race VARCHAR(10),
    gender VARCHAR(10),
    age VARCHAR(20),
    weight VARCHAR(20),
    admission_type_id INT,
    discharge_disposition_id INT,
    admission_source_id INT,
    time_in_hospital INT,
    payer_code VARCHAR(20),
    medical_specialty VARCHAR(30),
    num_lab_procedures INT,
    num_procedures INT,
    num_medications INT,
    number_outpatient INT,
    number_emergency INT,
    number_inpatient INT,
    diag_1 VARCHAR(30),
    diag_2 VARCHAR(30),
    diag_3 VARCHAR(30),
    number_diagnoses INT,
    max_glu_serum VARCHAR(30),
    A1Cresult VARCHAR(30),
    metformin VARCHAR(30),
    repaglinide VARCHAR(30),
    nateglinide VARCHAR(30),
    chlorpropamide VARCHAR(30),
    glimepiride  VARCHAR(30),
    acetohexamide VARCHAR(30),
    glipizide VARCHAR(30),
    glyburide VARCHAR(30),
    tolbutamide VARCHAR(30),
    pioglitazone VARCHAR(30),
    rosiglitazone VARCHAR(30),
    acarbose VARCHAR(30),
    miglitol VARCHAR(30),
    troglitazone VARCHAR(30),
    tolazamide VARCHAR(30),
    examide VARCHAR(30),
    citoglipton VARCHAR(30),
    insulin VARCHAR(30),
    `glyburide-metformin` VARCHAR(30),
    `glipizide-metformin` VARCHAR(30),
    `glimepiride-pioglitazone` VARCHAR(30),
    `metformin-rosiglitazone` VARCHAR(30),
    `metformin-pioglitazone` VARCHAR(30),
    `change` VARCHAR(30),
    diabetesMed VARCHAR(50),
    readmitted VARCHAR(30)
);


-- Import the CSV ------
-- Update this path to the local location of the dataset.
LOAD DATA LOCAL INFILE 'data/diabetic_data.csv'
    INTO TABLE diabetes_hospital_readmission
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
    LINES TERMINATED BY '\r\n'
    IGNORE 1 ROWS;

