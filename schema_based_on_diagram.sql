CREATE TABLE treatments_history(
  medical_history_id INT,
  treatments_id INT,
  PRIMARY KEY (medical_history_id,treatments_id),
  FOREIGN KEY(medical_history_id) REFERENCES medical_histories(id),
  FOREIGN KEY(treatments_id) REFERENCES treatments(id)
);