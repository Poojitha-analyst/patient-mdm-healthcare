# 🏥 Patient Master Data Management (MDM) Project

![SQL](https://img.shields.io/badge/SQL-Server-blue)
![PowerBI](https://img.shields.io/badge/Power-BI-yellow)
![MDM](https://img.shields.io/badge/Informatica-MDM-orange)

## 📌 Problem Statement
A hospital network with 4 source systems had 17.5% duplicate 
patient records causing billing errors and compliance risks. 
This project builds a Patient MDM Hub with a single Golden 
Record per patient.

## 🎯 Objectives
- Detect and resolve duplicate patient records using SQL
- Standardize data across 4 source systems
- Build a DQ scorecard using DAMA dimensions
- Visualise golden record metrics in Power BI

## 🛠️ Tools & Skills
SQL Server · Informatica MDM · Power BI · ETL · Data Governance

## 📁 Project Structure
| Folder | Contents |
|--------|---------|
| 01_problem_scope | Problem statement & scope |
| 02_data_model | Schema DDL — 5 tables |
| 03_sample_data | 50-row dataset with DQ issues |
| 04_sql_queries | 5 SQL queries (profiling → golden record) |
| 05_dashboard | Power BI screenshots & NovyPro link |

## 📊 Key Results
- 20 patient records analysed across 4 source systems
- 6 duplicate pairs identified — 30% duplicate rate
- Overall Avg DQ Score: 90% (SQL verified)
- Legacy HIS lowest performing source at 76% DQ score
- 27 total DQ issues across 7 categories
- Apollo EHR highest quality source at 97.1%

## 👤 Author
Poojitha · Data Analyst @ Deloitte US–India
