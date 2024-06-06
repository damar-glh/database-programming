CREATE DATABASE week_10;

CREATE TABLE employee (
	id int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    first_name varchar(50) NOT NULL,
    last_name varchar(50) NOT NULL,
    email varchar(100) NOT NULL,
    phone_number varchar(20) NULL,
    hire_date date NULL,
    job_title varchar(50) NULL,
    salary decimal(10, 2) NULL,
    department varchar(50) NULL
)

-- 1.Buatlah SP dengan nama sp_insertEmployees pada tabel employees dengan data sebagai berikut,
-- Dan panggil nama sp_insertEmployees untuk memasukan semua data tersebut diatas
DELIMITER $$;
DROP PROCEDURE IF EXISTS sp_insertEmployees_5209;
CREATE PROCEDURE sp_insertEmployees_5209(first_name varchar(50), last_name varchar(50), email varchar(100), phone_number varchar(20), hire_date_date date, job_title varchar(50), salary decimal(10,2), department varchar(50))
BEGIN
    INSERT INTO `employee`(`first_name`, `last_name`, `email`, `phone_number`, `hire_date`, `job_title`, `salary`, `department`) VALUES (first_name, last_name, email, phone_number, hire_date, job_title, salary, department);
END $$;
DELIMITER ;

CALL sp_insertEmployees_5209('John', 'Doe', 'john.doe@example.com', '1234567890',  '2021-01-01', 'Manager', 5000.00, 'Finance');
CALL sp_insertEmployees_5209('Jane', 'Smith', 'jane.smith@example.com', '0987654321', '2021-02-01', 'Supervisor', 4000.00, 'Sales');
CALL sp_insertEmployees_5209('Michael', 'Johnson', 'michael.johnson@example.com', '5555555555', '2021-03-01', 'Analyst', 3000.00, 'Marketing');
CALL sp_insertEmployees_5209('Emily', 'Davis', 'emily.davis@example.com', '1111111111', '2021-04-01', 'Assistant', 2500.00, 'HR');
CALL sp_insertEmployees_5209('David', 'Brown', 'david.brown@example.com', '9999999999', '2021-05-01', 'Developer', 4500.00, 'IT');
CALL sp_insertEmployees_5209('Sarah', 'Miller', 'sarah.miller@example.com', '7777777777', '2021-06-01', 'Designer', 3500.00, 'Creative');
CALL sp_insertEmployees_5209('Robert', 'Taylor', 'robert.taylor@example.com', '3333333333', '2021-07-01', 'Engineer', 4000.00, 'R&D');
CALL sp_insertEmployees_5209('Jessica', 'Wilson', 'jessica.wilson@example.com', '2222222222', '2021-08-01', 'Coordinator', 2800.00, 'Operations');
CALL sp_insertEmployees_5209('Daniel', 'Anderson', 'daniel.anderson@example.com', '4444444444', '2021-09-01', 'Accountant', 3200.00, 'Finance');
CALL sp_insertEmployees_5209('Olivia', 'Martinez', 'olivia.martinez@example.com', '6666666666', '2021-10-01', 'Assistant', 2300.00, 'Sales');


-- 2.Buat SP untuk menampikan semua data pada table employees dengan nama
-- sp_tampilEmployees
DELIMITER $$;
DROP PROCEDURE IF EXISTS sp_tampilEmployees_5209;
CREATE PROCEDURE sp_tampilEmployees_5209()
BEGIN
    SELECT * FROM employee;
END $$;
DELIMITER ;
CALL sp_tampilEmployees_5209();

-- 3.	Buat SP dengan nama sp_tampilDept untuk menampilkan yang kolom department yang salary diantara 2000 sampai dengan 4000.
DELIMITER $$;
DROP PROCEDURE IF EXISTS sp_tampilDept_5209;
CREATE PROCEDURE sp_tampilDept_5209()
BEGIN
    SELECT department FROM employee 
    WHERE salary BETWEEN 2000.00 AND 4000.00; 
END $$;
DELIMITER ;
CALL sp_tampilDept_5209();