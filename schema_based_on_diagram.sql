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

CREATE TABLE invoice_items(
  id SERIAL PRIMARY KEY,
  units_price DECIMAL(5,2),
  quantity INT,
  total_price DECIMAL(5,2),
  invoice_id INT, FOREIGN KEY(invoice_id) REFERENCES invoices(id),
  treatments_id INT FOREIGN KEY(treatments_id) REFERENCES treatments(id),


);


-- Create indexes on foreign key columns
CREATE INDEX idx_mh_treat_medhist_id ON treatments_history (medical_history_id);
CREATE INDEX idx_mh_treat_treat_id ON treatments_history (treatment_id);

CREATE INDEX idx_inv_items_inv_id ON invoice_items (invoice_id);
CREATE INDEX idx_inv_items_treat_id ON invoice_items (treatment_id);

CREATE INDEX idx_invoices_medhist_id ON invoices (medical_history_id);

CREATE INDEX idx_medhist_patient_id ON medical_histories (patient_id);