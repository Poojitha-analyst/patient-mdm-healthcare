-- ================================================
-- Query 4: Data Quality Scoring
-- Purpose: Compute a DQ score (0-100) per record
--          based on 5 key field completeness checks
-- Author: Poojitha | Patient MDM Project
-- ================================================

-- Step 1: Compute DQ score per record
SELECT
  patient_id,
  source_system,
  first_name,
  last_name,
  dob,

  -- Score 20 points per field (5 fields = 100 max)
  (
    CASE WHEN first_name IS NOT NULL THEN 20 ELSE 0 END
  + CASE WHEN dob        IS NOT NULL THEN 20 ELSE 0 END
  + CASE WHEN phone      IS NOT NULL THEN 20 ELSE 0 END
  + CASE WHEN address    IS NOT NULL THEN 20 ELSE 0 END
  + CASE WHEN email      IS NOT NULL THEN 20 ELSE 0 END
  )                             AS dq_score,

  -- DQ grade based on score
  CASE
    WHEN (
      CASE WHEN first_name IS NOT NULL THEN 20 ELSE 0 END
    + CASE WHEN dob        IS NOT NULL THEN 20 ELSE 0 END
    + CASE WHEN phone      IS NOT NULL THEN 20 ELSE 0 END
    + CASE WHEN address    IS NOT NULL THEN 20 ELSE 0 END
    + CASE WHEN email      IS NOT NULL THEN 20 ELSE 0 END
    ) >= 80 THEN 'GOOD'
    WHEN (
      CASE WHEN first_name IS NOT NULL THEN 20 ELSE 0 END
    + CASE WHEN dob        IS NOT NULL THEN 20 ELSE 0 END
    + CASE WHEN phone      IS NOT NULL THEN 20 ELSE 0 END
    + CASE WHEN address    IS NOT NULL THEN 20 ELSE 0 END
    + CASE WHEN email      IS NOT NULL THEN 20 ELSE 0 END
    ) >= 60 THEN 'ACCEPTABLE'
    ELSE 'POOR'
  END                           AS dq_grade

FROM patient_source
ORDER BY dq_score ASC;

-- Step 2: Summary by source system
SELECT
  source_system,
  COUNT(*)                        AS total_records,
  ROUND(AVG(
    CASE WHEN first_name IS NOT NULL THEN 20 ELSE 0 END
  + CASE WHEN dob        IS NOT NULL THEN 20 ELSE 0 END
  + CASE WHEN phone      IS NOT NULL THEN 20 ELSE 0 END
  + CASE WHEN address    IS NOT NULL THEN 20 ELSE 0 END
  + CASE WHEN email      IS NOT NULL THEN 20 ELSE 0 END
  ), 2)                           AS avg_dq_score,
  SUM(CASE WHEN phone IS NULL
      THEN 1 ELSE 0 END)          AS poor_records
FROM patient_source
GROUP BY source_system
ORDER BY avg_dq_score ASC;
