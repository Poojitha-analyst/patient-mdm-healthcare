-- ================================================
-- Query 3: Data Standardization
-- Purpose: Fix gender codes, date formats,
--          name casing and phone formats
-- Author: Poojitha | Patient MDM Project
-- ================================================

-- Step 1: Standardize gender codes
-- Converts Male/Female/1/2 → M/F/U
UPDATE patient_source
SET gender = CASE
  WHEN UPPER(gender) IN ('MALE',   'M', '1') THEN 'M'
  WHEN UPPER(gender) IN ('FEMALE', 'F', '2') THEN 'F'
  ELSE 'U'
END;

-- Step 2: Standardize name casing
-- Converts to UPPER TRIM format
UPDATE patient_source
SET
  first_name = UPPER(TRIM(first_name)),
  last_name  = UPPER(TRIM(last_name));

-- Step 3: Standardize phone numbers
-- Removes spaces, dashes, brackets
UPDATE patient_source
SET phone = REPLACE(
              REPLACE(
                REPLACE(
                  REPLACE(phone, ' ', ''),
                '-', ''),
              '(', ''),
            ')', '');

-- Step 4: Verify standardization results
SELECT
  gender,
  COUNT(*) AS record_count
FROM patient_source
GROUP BY gender
ORDER BY gender;
