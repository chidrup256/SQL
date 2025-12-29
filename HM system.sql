create database Hospital;
use Hospital;
CREATE TABLE Patients (
    patient_id INT PRIMARY KEY,
    patient_name VARCHAR(50),
    age INT,
    gender VARCHAR(10),
    city VARCHAR(30)
);

INSERT INTO Patients VALUES
(01, 'Ravi', 25, 'Male', 'Hyderabad'),
(02, 'Anitha', 30, 'Female', 'Bangalore'),
(03, 'Suresh', 45, 'Male', 'Chennai'),
(04, 'Anjita', 30, 'Female', 'Bangalore'),
(05, 'Anjineyalu', 40, 'Male', 'Bangalore'),
(06, 'Rakesh', 28, 'Male', 'Hyderabad'),
(07, 'Nikitha', 35, 'Female', 'Hyderabad'),
(08, 'Rajesh', 25, 'Male', 'Chennai'),
(09, 'Rakesh', 45, 'Male', 'Chennai'),
(10, 'Ankitha', 30, 'Female', 'Mumbai');

CREATE TABLE Doctors (
    doctor_id INT PRIMARY KEY,
    doctor_name VARCHAR(50),
    department VARCHAR(30),
    consultation_fee INT
);

INSERT INTO Doctors VALUES
(101, 'Dr. Kumar', 'Cardiology', 800),
(102, 'Dr. Meena', 'Neurology', 1000),
(103, 'Dr. Rao', 'Orthopedics', 600);

CREATE TABLE Appointments (
    appointment_id INT PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    appointment_date DATE,
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id)
);
INSERT INTO Appointments VALUES
(1001, 01, 101, '2024-01-10'),
(1002, 02, 102, '2024-01-12'),
(1003, 03, 103, '2024-01-15'),
(1004, 04, 101, '2024-01-18'),
(1005, 05, 102, '2024-01-16'),
(1006, 06, 103, '2024-01-17'),
(1007, 07, 101, '2024-01-20'),
(1008, 07, 101, '2024-01-25');