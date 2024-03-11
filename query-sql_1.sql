CREATE DATABASE property_rental_22.11.5209;

CREATE TABLE branches(
    branch_no char(4) PRIMARY KEY,
    street varchar(40) NOT NULL,
    city varchar(20) NOT NULL,  
    postal_code char(10) NOT NULL
)

INSERT INTO `branches`(`branch_no`, `street`, `city`,`postal_code`) VALUES 
('B005','22 Deer Rd','London','SW 1 4EH'),
('B007','16 Argyll St','Aberdeen','AB2 3SU'),
('B003','163 Main St','Glasgow','G11 9QX'),
('B004','32 Manse Rd','Bristol','BS99 1NZ'),
('B002','56 Clover Dr','London','SW 1 4EH')

CREATE TABLE staffs(
    staff_no char(4) PRIMARY KEY,
    fName varchar(50) NOT NULL,
    IName varchar(50) NOT NULL,
    position varchar(20) NOT NULL,  
    sex char(1),
    DOB date,
    salary int NOT NULL,
    branch_no char(4),
    FOREIGN KEY(branch_no) REFERENCES branches(branch_no)
)

INSERT INTO `staffs`(`staff_no`, `fName`, `IName`, `position`, `sex`, `DOB`, `salary`, `branch_no`) VALUES 
('SL21','John','White','Manager','M','1945-10-01',30000,'B005'),
('SG37','Ann','Beech','Assistant','F','1960-11-10',12000,'B003'),
('SG14','David','Ford','Supervisor','M','1958-03-24',18000,'B003')


CREATE TABLE private_owners(
    owner_No char(4) PRIMARY KEY,
    fName varchar(50) NOT NULL,
    IName varchar(50) NOT NULL,
    address varchar(50),
    phone char(15),
    email varchar(20) NOT NULL,
    password text NOT NULL
)

CREATE TABLE property_for_rent(
    property_no char(10) PRIMARY KEY,
    street varchar(30) NOT NULL,
    city varchar(20),
    postal_code char(10),
    type varchar(10) NOT NULL,
    rooms int NOT NULL,
    rent int NOT NULL,
    owner_no char(4),
    staff_no char(4),
    branch_no char(4),
    FOREIGN KEY(owner_no) REFERENCES private_owners(owner_no),
    FOREIGN KEY(staff_no) REFERENCES staffs(staff_no),
    FOREIGN KEY(branch_no) REFERENCES branches(branch_no)
)

DESCRIBE property_for_rent;

SELECT * FROM staffs;

SELECT branch_no, city FROM branches;