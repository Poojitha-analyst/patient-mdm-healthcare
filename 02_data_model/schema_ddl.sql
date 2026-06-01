-- Patient MDM Schema

CREATE TABLE patient_source (
  patient_id     VARCHAR(20),
  source_system  VARCHAR(50),
  first_name     VARCHAR(100),
  last_name      VARCHAR(100),
  dob            DATE,
  gender         CHAR(1),
  phone          VARCHAR(15),
  email          VARCHAR(200),
  address        VARCHAR(200),
  city           VARCHAR(100),
  pincode        VARCHAR(10),
  mrn_number     VARCHAR(20),
  record_date    DATE
);

CREATE TABLE golden_patient (
  golden_id      VARCHAR(20) PRIMARY KEY,
  first_name     VARCHAR(100),
  last_name      VARCHAR(100),
  dob            DATE,
  gender         CHAR(1),
  phone_primary  VARCHAR(15),
  email          VARCHAR(200),
  address        VARCHAR(200),
  city           VARCHAR(100),
  pincode        VARCHAR(10),
  source_system  VARCHAR(50),
  dq_score       DECIMAL(5,2),
  record_status  VARCHAR(20),
  created_at     TIMESTAMP,
  updated_at     TIMESTAMP
);
