CREATE TABLE patients (
id SERIAL PRIMARY KEY,
name VARCHAR(50),
date_of_birth DATE
);

CREATE TABLE medical_histories (
  id SERIAL PRIMARY KEY,
  admitted_at TIMESTAMP,
  status VARCHAR(50)
);

CREATE TABLE treatments(
  id SERIAL PRIMARY KEY,
  type VARCHAR(50),
  name VARCHAR(50)
);

CREATE TABLE treatments_history(
  medical_history_id INT,
  treatments_id INT,
  PRIMARY KEY (medical_history_id,treatments_id),
  FOREIGN KEY(medical_history_id) REFERENCES medical_histories(id),
  FOREIGN KEY(treatments_id) REFERENCES treatments(id)
);

CREATE TABLE treatments_history(
  medical_history_id INT,
  treatments_id INT,
  PRIMARY KEY (medical_history_id,treatments_id),
  FOREIGN KEY(medical_history_id) REFERENCES medical_histories(id),
  FOREIGN KEY(treatments_id) REFERENCES treatments(id)
);

CREATE TABLE invoices(
  id SERIAL PRIMARY KEY,
  total_amounts DECIMAL(5,2)
  generated_at TIMESTAMP,
  payed_at TIMESTAMP,
  medical_history_id INT FOREIGN KEY(medical_history_id) REFERENCES medical_histories(id),


);