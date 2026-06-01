-- ================================================
-- Query 5: Golden Record Creation
-- Purpose: Build one best-of-breed master record
--          per patient cluster after deduplication
-- Author: Poojitha | Patient MDM Project
-- ================================================

-- Step 1: Create patient clusters from duplicates
CREATE TABLE patient_clusters AS
SELECT
  pid_1            AS patient_id,
  pid_1            AS cluster_id
FROM match_candidates
UNION
SELECT
  pid_2            AS patient_id,
  pid_1            AS cluster_id
FROM match_candidates;

-- Step 2: Build golden record using survivorship rules
-- Rule: Most recent non-null value wins per field
INSERT INTO golden_patient (
  golden_id,
  first_name,
  last_name,
  dob,
  gender,
  phone_primary,
  email,
  address,
  city,
  pincode,
  source_system,
  dq_score,
  record_status,
  created_at
)
SELECT
  CONCAT('GLD-', cluster_id)          AS golden_id,
  UPPER(TRIM(MAX(first_name)))        AS first_name,
  UPPER(TRIM(MAX(last_name)))         AS last_name,
  MAX(dob)                            AS dob,
  MAX(gender)                         AS gender,
  COALESCE(MAX(phone), 'UNKNOWN')     AS phone_primary,
  MAX(email)                          AS email,
  MAX(address)                        AS address,
  MAX(city)                           AS city,
  MAX(pincode)                        AS pincode,
  MAX(source_system)                  AS source_system,
  ROUND(AVG(
    CASE WHEN first_name IS NOT NULL THEN 20 ELSE 0 END
  + CASE WHEN dob        IS NOT NULL THEN 20 ELSE 0 END
  + CASE WHEN phone      IS NOT NULL THEN 20 ELSE 0 END
  + CASE WHEN address    IS NOT NULL THEN 20 ELSE 0 END
  + CASE WHEN email      IS NOT NULL THEN 20 ELSE 0 END
  ), 2)                               AS dq_score,
  'ACTIVE'                            AS record_status,
  CURRENT_TIMESTAMP                   AS created_at
FROM patient_source ps
JOIN patient_clusters pc
  ON ps.patient_id = pc.patient_id
GROUP BY cluster_id;

-- Step 3: Verify golden record count
SELECT
  record_status,
  COUNT(*)                            AS total_records,
  ROUND(AVG(dq_score), 2)            AS avg_dq_score
FROM golden_patient
GROUP BY record_status;
