CREATE DATABASE veterinary;

-- DON'T FORGET TO SAVE BEFORE ADDING TO GIT TRACK CHANGES!

CREATE TABLE owners(
    ownerid INT PRIMARY KEY,
    ofirstname VARCHAR(50),
    olastname VARCHAR(50),
    address VARCHAR(100),
    phone VARCHAR(15),
    email VARCHAR(100)
);

CREATE TABLE animals (
    animalid INT PRIMARY KEY,
    name VARCHAR(50),
    species VARCHAR(50),
    breed VARCHAR(50),
    dateofbirth DATE,
    gender VARCHAR(10),
    color VARCHAR(50),
    ownerid INT,
    FOREIGN KEY (ownerid) REFERENCES owners(ownerid)
);

CREATE TABLE appointments (
    appointid INT PRIMARY KEY,
    animalid INT,
    appointdate DATE,
    reason VARCHAR(255),
    FOREIGN KEY (animalid) REFERENCES animals(animalid)
);

CREATE TABLE doctors (
    doctorid INT PRIMARY KEY AUTO_INCREMENT,
    dfirstname VARCHAR(50) NOT NULL,
    dlastname VARCHAR(50) NOT NULL,
    specialty VARCHAR(100),
    phone VARCHAR(15),
    email VARCHAR(100)
);

CREATE TABLE invoices (
    invoiceid INT PRIMARY KEY AUTO_INCREMENT,
    appointid INT,
    totalamount NUMERIC(10,2),
    paymentdate TIME,
    FOREIGN KEY (appointid) REFERENCES appointments(appointid)
);

CREATE TABLE medicalrecords (
    recordid INT PRIMARY KEY,
    animalid INT,
    recorddate DATETIME,
    doctorid INT,
    diagnosis VARCHAR(255),
    prescription VARCHAR(255),
    notes TEXT,
    FOREIGN KEY (animalid) REFERENCES animals(animalid),
    FOREIGN KEY (doctorid) REFERENCES doctors(doctorid)
);

INSERT INTO owners (ownerid, ofirstname, olastname, address, phone, email)
VALUES
(1, 'Ace', 'Salva', 'Quezon City', '09171234567', 'johncruz@example.com'),
(2, 'Maria', 'Santos', 'Pasig City', '09182345678', 'mariasantos@example.com'),
(3, 'Annies', 'Reyes', 'Makati City', '09193456789', 'carlosreyes@example.com'),
(4, 'Anna', 'Dela Cruz', 'Taguig City', '09204567891', 'annadelacruz@example.com'),
(5, 'Mark', 'Lopez', 'Caloocan City', '09215678901', 'marklopez@example.com'),
(6, 'Sarah', 'Ramirez', 'Manila City', '09226789012', 'sarahramirez@example.com'),
(7, 'David', 'Flores', 'Mandaluyong City', '09237890123', 'davidflores@example.com'),
(8, 'Paula', 'Gonzales', 'Las Piñas City', '09248901234', 'paulagonzales@example.com'),
(9, 'Kevin', 'Torres', 'Parañaque City', '09259012345', 'kevintorres@example.com'),
(10, 'Julia', 'Navarro', 'Marikina City', '09260123456', 'julianavarro@example.com');

INSERT INTO animals (animalid, name, species, breed, dateofbirth, gender, color, ownerid)
VALUES
(1, 'Christopher', 'Cat', 'Persian', '2006-07-04', 'Male', 'Black', 1),
(2, 'Chris', 'Cat', 'Siamese', '2019-03-10', 'Male', 'Brown', 2),
(3, 'Simba', 'Cat', 'Bengal', '2020-01-15', 'Male', 'Orange', 3),
(4, 'Milo', 'Dog', 'Beagle', '2018-09-12', 'Male', 'Tri-color', 4),
(5, 'Luna', 'Cat', 'Ragdoll', '2021-06-22', 'Female', 'White', 5),
(6, 'Bella', 'Dog', 'Poodle', '2017-03-30', 'Female', 'Cream', 6),
(7, 'Shadow', 'Dog', 'Husky', '2019-11-05', 'Male', 'Gray', 7),
(8, 'Cleo', 'Cat', 'Sphynx', '2022-02-17', 'Female', 'Pink', 3),
(9, 'Rex', 'Dog', 'German Shepherd', '2016-08-20', 'Male', 'Black and Tan', 9),
(10, 'Buddy', 'Dog', 'Labrador', '2018-12-02', 'Male', 'Black', 10);

INSERT INTO appointments (appointid, animalid, appointdate, reason)
VALUES
(1, 1, '2025-11-01', 'Annual vaccination'),
(2, 2, '2025-11-03', 'Routine check-up'),
(3, 3, '2025-11-05', 'Skin allergy treatment'),
(4, 4, '2025-11-07', 'Dental cleaning'),
(5, 5, '2025-11-09', 'Injury examination'),
(6, 6, '2025-11-11', 'Spay/Neuter consultation'),
(7, 7, '2025-11-13', 'Digestive issues follow-up'),
(8, 8, '2025-11-15', 'Fever and lethargy'),
(9, 9, '2025-11-17', 'Weight management advice'),
(10, 10, '2025-11-19', 'Vaccination booster');

INSERT INTO doctors(doctorid, dfirstname, dlastname, speciality, phone, email)
VALUES
(1, 'Dr.Maria', 'Santos', 'General Veterinarian', '987-654-3210', 'maria@example.com'),
(2, 'Dr.Antonio', 'Gonzales', 'Feline Specialist', '555-123-4567', 'antonio@example.com'),
(3, 'Dr.Felipe', 'Luna', 'Orthopedic Specialist', '111-222-3333', 'felipe@example.com'),
(4, 'Dr.Sofia', 'Reyes', 'Dermatology Specialist', '999-888-7777', 'sofia@xample.com'),
(5, 'Dr.Luis', 'Torres', 'Surgery Specialist', '123-555-7777', 'luis@example.com'),
(6, 'Dr.Carmen', 'Fernandez', 'Opthalmology Specialist', '333-222-1111', 'carmen@example.com');
(7, 'Dr.Emily', 'Garcia', 'Cardiology Specialist', '444-555-6666', 'emily@example.com'),
(8, 'Dr.John', 'Velasco', 'Neurology Specialist', '777-888-9999', 'john@example.com'),
(9, 'Dr.Linda', 'Morales', 'Nutrition Specialist', '222-333-4444', 'linda@example.com'),
(10, 'Dr.Rafael', 'Cruz', 'Behavioral Specialist', '555-666-7777', 'rafael@example.com');

INSERT INTO invoices(invoiceid, appointid, totalamount, paymentdate)
VALUES
(1, 1, 50.00, '09:30:00'),
(2, 2, 75.00, '14:15:00'),
(3, 3, 100.00, '11:00:00'),
(4, 4, 200.00, '13:45:00'),
(5, 5, 80.00, '10:30:00'),
(6, 6, 30.00, '15:00:00'),
(7, 7, 75.00, '09:15:00'),
(8, 8, 150.00, '16:30:00'),
(9, 9, 60.00, '14:45:00'),
(10, 10, 40.00, '11:30:00');