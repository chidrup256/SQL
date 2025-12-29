use Hospital;

------------------------------------------------
-- 1. BASIC SELECT
------------------------------------------------
SELECT * FROM Patients;
SELECT * FROM Doctors;
SELECT * FROM Appointments;

------------------------------------------------
-- 2. WHERE CLAUSE
------------------------------------------------
SELECT * FROM Patients
WHERE city = 'Hyderabad';

------------------------------------------------
-- 3. ORDER BY
------------------------------------------------
SELECT * FROM Doctors
ORDER BY consultation_fee DESC;

------------------------------------------------
-- 4. DISTINCT
------------------------------------------------
SELECT DISTINCT department
FROM Doctors;

------------------------------------------------
-- 5. AGGREGATE FUNCTIONS
------------------------------------------------
SELECT COUNT(*) AS total_patients FROM Patients;

SELECT AVG(consultation_fee) AS avg_fee FROM Doctors;

SELECT MAX(consultation_fee) AS max_fee FROM Doctors;

------------------------------------------------
-- 6. GROUP BY
------------------------------------------------
SELECT department,
       COUNT(*) AS total_doctors
FROM Doctors
GROUP BY department;

------------------------------------------------
-- 7. HAVING
------------------------------------------------
SELECT department,
       COUNT(*) AS total_doctors
FROM Doctors
GROUP BY department
HAVING COUNT(*) > 1;

------------------------------------------------
-- 8. INNER JOIN
------------------------------------------------
SELECT p.patient_name,
       d.doctor_name,
       a.appointment_date
FROM Appointments a
INNER JOIN Patients p ON a.patient_id = p.patient_id
INNER JOIN Doctors d ON a.doctor_id = d.doctor_id;

------------------------------------------------
-- 9. LEFT JOIN
------------------------------------------------
SELECT p.patient_name,
       a.appointment_id
FROM Patients p
LEFT JOIN Appointments a
ON p.patient_id = a.patient_id;

------------------------------------------------
-- 10. RIGHT JOIN
------------------------------------------------
SELECT d.doctor_name,
       a.appointment_id
FROM Doctors d
RIGHT JOIN Appointments a
ON d.doctor_id = a.doctor_id;

------------------------------------------------
-- 11. SUBQUERY
------------------------------------------------
SELECT patient_name
FROM Patients
WHERE patient_id IN (
    SELECT patient_id
    FROM Appointments
);

------------------------------------------------
-- 12. CORRELATED SUBQUERY
------------------------------------------------
SELECT d.doctor_name
FROM Doctors d
WHERE consultation_fee >
    (SELECT AVG(consultation_fee) FROM Doctors);

------------------------------------------------
-- 13. IN, BETWEEN, LIKE
------------------------------------------------
SELECT * FROM Patients
WHERE city IN ('Hyderabad','Chennai');

SELECT * FROM Doctors
WHERE consultation_fee BETWEEN 500 AND 900;

SELECT * FROM Patients
WHERE patient_name LIKE 'A%';

------------------------------------------------
-- 14. CASE STATEMENT
------------------------------------------------
SELECT patient_name,
       age,
       CASE
           WHEN age < 18 THEN 'Minor'
           WHEN age BETWEEN 18 AND 60 THEN 'Adult'
           ELSE 'Senior'
       END AS age_group
FROM Patients;

------------------------------------------------
-- 15. DATE FUNCTIONS
------------------------------------------------
SELECT appointment_date,
       MONTH(appointment_date) AS month,
       YEAR(appointment_date) AS year
FROM Appointments;


------------------------------------------------
-- 16. LIMIT
------------------------------------------------
SELECT * FROM Doctors
ORDER BY consultation_fee DESC
LIMIT 2;

------------------------------------------------
-- 17. NOT EXISTS
------------------------------------------------
SELECT patient_name
FROM Patients p
WHERE NOT EXISTS (
    SELECT 1
    FROM Appointments a
    WHERE a.patient_id = p.patient_id
);

------------------------------------------------
-- 18. EXISTS
------------------------------------------------
SELECT patient_name
FROM Patients p
WHERE EXISTS (
    SELECT 1
    FROM Appointments a
    WHERE a.patient_id = p.patient_id
);