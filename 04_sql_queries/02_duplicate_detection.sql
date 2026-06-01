-- ================================================
-- Query 2: Duplicate Detection
-- Purpose: Identify potential duplicate patients
--          using SOUNDEX + DOB matching
-- Author: Poojitha | Patient MDM Project
-- ================================================

WITH match_candidates AS (
  SELECT
    a.patient_id        AS pid_1,
    b.patient_id        AS pid_2,
    a.first_name,
    a.last_name,
    a.dob,
    a.source_system     AS source_1,
    b.source_system     AS source_2,
    SOUNDEX(a.last_name) AS soundex_a,
    SOUNDEX(b.last_name) AS soundex_b
  FROM patient_source a
  JOIN patient_source b
    ON  a.dob = b.dob
    AND SOUNDEX(a.last_name) = SOUNDEX(b.last_name)
    AND a.patient_id < b.patient_id  -- avoid self-joins
)
SELECT
  pid_1,
  pid_2,
  first_name,
  last_name,
  dob,
  source_1,
  source_2,
  CASE
    WHEN first_name = first_name THEN 'HIGH'
    ELSE 'MEDIUM'
  END AS match_confidence
FROM match_candidates
ORDER BY match_confidence, last_name;
