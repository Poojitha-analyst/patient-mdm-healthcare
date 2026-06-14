# 🏥 Patient Master Data Management (MDM) Project

![SQL](https://img.shields.io/badge/SQL-PostgreSQL-blue)
![PowerBI](https://img.shields.io/badge/Power-BI-yellow)
![MDM](https://img.shields.io/badge/Informatica-MDM-orange)

## 📌 Problem Statement
A hospital network with 4 source systems had duplicate patient 
records causing billing errors and compliance risks. This project 
builds a Patient MDM Hub with a single Golden Record per patient.

## 🎯 Objectives
- Detect and resolve duplicate patient records using SQL
- Standardize data across 4 source systems
- Score data quality using DAMA framework dimensions
- Visualise MDM metrics in a 3-page Power BI dashboard

## 🛠️ Tools & Skills
SQL · PostgreSQL 14 · Power BI Desktop · DAX · ETL · 
Informatica MDM · Data Governance · Data Quality

## 📁 Project Structure

| Folder | Contents |
|--------|---------|
| 01_problem_scope | Problem statement & scope document |
| 02_data_model | Schema DDL — patient_source & golden_patient tables |
| 03_sample_data | 20-row dataset with intentional DQ issues |
| 04_sql_queries | 6 SQL queries (profiling → golden record) |
| 05_dashboard | Power BI dashboard screenshots — 3 pages |

## 📊 Key Results (SQL Verified — PostgreSQL 14)
- 20 patient records analysed across 4 source systems
- 6 duplicate pairs identified — 30% duplicate rate
- Overall Avg DQ Score: **90%** (verified via Query 2)
- Legacy HIS lowest performing source: **76% DQ score**
- Apollo EHR highest quality source: **97.1% DQ score**
- 27 total DQ issues across 7 categories
- Missing phone: 6 records (30%) | Missing email: 4 records (20%)

## 🔍 SQL Queries Written

| File | Purpose |
|------|---------|
| 01_data_profiling.sql | Null counts & completeness % per column |
| 02_duplicate_detection.sql | SOUNDEX + DOB matching |
| 03_standardization.sql | Gender codes, name casing, phone format |
| 04_dq_scoring.sql | DQ score 0–100 per record + grade |
| 05_golden_record.sql | Best-of-breed survivorship rules |
| 06_source_system_summary.sql | Avg DQ score per source system |

## 📈 Power BI Dashboard
3-page dashboard built on SQL-verified data:
- Page 1: Executive Summary — KPI cards + source charts
- Page 2: Source System Analysis — DQ scores + missing fields
- Page 3: DQ Issues Analysis — severity breakdown + issues log

## 👤 Author
Poojitha · Data Analyst @ Deloitte US–India
