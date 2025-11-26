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