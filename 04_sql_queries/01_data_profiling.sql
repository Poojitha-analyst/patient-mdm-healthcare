-- ================================================
-- Query 1: Data Profiling
-- Purpose: Analyse completeness of each column
-- Author: Poojitha | Patient MDM Project
-- ================================================

SELECT
  COUNT(*)                                          AS total_records,

  -- Null counts per column
  SUM(CASE WHEN first_name IS NULL THEN 1 ELSE 0 END) AS missing_first_name,
  SUM(CASE WHEN last_name  IS NULL THEN 1 ELSE 0 END) AS missing_last_name,
  SUM(CASE WHEN dob        IS NULL THEN 1 ELSE 0 END) AS missing_dob,
  SUM(CASE WHEN phone      IS NULL THEN 1 ELSE 0 END) AS missing_phone,
  SUM(CASE WHEN email      IS NULL THEN 1 ELSE 0 END) AS missing_email,
  SUM(CASE WHEN address    IS NULL THEN 1 ELSE 0 END) AS missing_address,

  -- Completeness % per column
  ROUND(SUM(CASE WHEN phone IS NOT NULL THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2)
    AS phone_completeness_pct,
  ROUND(SUM(CASE WHEN email IS NOT NULL THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2)
    AS email_completeness_pct,
  ROUND(SUM(CASE WHEN dob   IS NOT NULL THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2)
    AS dob_completeness_pct

FROM patient_source;
