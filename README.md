# Hospital Readmission Risk Analysis and Prediction

## Project Overview

Hospital readmissions place a significant burden on healthcare systems and are associated with increased healthcare costs and poorer patient outcomes.

This project analyses hospital readmission patterns using the **Diabetes 130-US Hospitals Dataset** and develops machine learning models to identify patients at higher risk of readmission. The project combines data analysis, predictive modelling, and interactive visualisation using Power BI.

---

## Business Problem

Hospital readmissions are an important quality indicator in healthcare.

The objective of this project is to:

- Identify factors associated with hospital readmission.
- Predict patient readmission risk using different machine learning models.
- Present findings through an interactive Power BI dashboard.
- Support evidence-based decision making for healthcare providers.

---

## Dataset

**Dataset:** Diabetes 130-US Hospitals Dataset

Source:
https://www.kaggle.com/datasets/brandao/diabetes

The dataset contains over 100,000 hospital admissions for diabetic patients and includes:

- Patient demographics
- Admission information
- Diagnoses
- Medications
- Laboratory procedures
- Length of hospital stay
- Readmission status

---

## Tools and Technologies

- Python
- Pandas
- NumPy
- Matplotlib
- Seaborn
- Scikit-learn
- XGBoost
- SQLite (sqlite3)
- SQL 
- Power BI
- Jupyter Notebook

---

## Project Workflow

1. Data cleaning
2. Exploratory Data Analysis (EDA)
3. SQL business analysis
4. Feature engineering
5. Machine learning modelling
    - Logistic Regression
    - Random Forest
    - XGBoost
6. Model evaluation
7. Interactive Power BI dashboard

---

## Machine Learning Results

Three machine learning models were evaluated.

| Model | Accuracy | Precision | Recall | F1 Score | ROC-AUC |
|--------|---------:|----------:|--------:|----------:|---------:|
| Logistic Regression | 0.62 | 0.63 | 0.44 | 0.52 | 0.66 |
| Random Forest | 0.63 | 0.62 | 0.52 | 0.56 | 0.68 |
| XGBoost | **0.65** | **0.63** | **0.56** | **0.59** | **0.70** |

XGBoost achieved the strongest predictive performance, demonstrating improved identification of patients at risk of hospital readmission.

---

## Key Findings

- Patients aged **70–90 years** exhibited the highest readmission risk.
- Longer hospital stays were associated with increased readmission.
- Patients with more medications and diagnoses were more likely to be readmitted.
- Previous inpatient visits were among the strongest predictors of future readmission.
- XGBoost produced the best overall predictive performance.

---

## Dashboard

The Power BI dashboard includes:

- Readmission KPIs
- Readmission by Age Group
- Readmission by Diagnosis Category
- Readmission by Previous Inpatient Visits
- Feature importance comparison
- Machine learning model comparison
- Interactive slicers

---

## Repository Structure

```
Hospital-Readmission-Risk/
│
├── data/
├── notebooks/
│   └── diabetes_risk analysis_prediction.ipynb
│
├── notebooks_sql/
│   └── diabetes_risk analysis-sql.ipynb
|   └── diabetes_risk.db
│
├── powerbi/
│   ├── diabetes_risk prediction dashboard_4.pbix
│   └── diabetes_risk prediction dashboard_4.pdf
│
├── requirements.txt
└── README.md
```

---

## Future Improvements

- Hyperparameter tuning
- Cross-validation
- SHAP model explainability
- Deployment using Streamlit
