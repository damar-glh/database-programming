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
);

-- STORED PROSEDURE
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

-- 4. Buat SP dengan nama sp_updateEmployees untuk mengubah data pada tabel employees berdasarkan id dan data yang akan diubah adalah kolom job_title. Dan Panggil SP tersebut untuk mengubah job_title menjadi Programmer berdasarkan id=10. Dan jika ditampilkan maka data akan berubah.
DELIMITER $$;
DROP PROCEDURE IF EXISTS sp_updateEmployees_5209;
CREATE PROCEDURE sp_updateEmployees_5209(id_ int)
BEGIN
    UPDATE employee e SET job_title = "Programmer" WHERE e.id = id_;
END $$;
DELIMITER ;
CALL sp_updateEmployees_5209(10);

-- 5. Buat SP untuk menghapus data dengan nama sp_hapusEmployees berdasar job_title. Dan lakukan pemanggilan SP untuk menghapus data yang job_title adalah Assistant.
DELIMITER $$;
DROP PROCEDURE IF EXISTS sp_hapusEmployees_5209;
CREATE PROCEDURE sp_hapusEmployees_5209()
BEGIN
    DELETE FROM employee WHERE job_title = 'Assistant';
END $$;
DELIMITER ;
CALL sp_hapusEmployees_5209();

-- 6. Buatlah SP untuk menghapus data employees yang salarynya dibawah 3000, dengan nama SP_hapus_Salary. Jika dilakukan pemanggilan maka outputnya sebagai berikut
DELIMITER $$;
DROP PROCEDURE IF EXISTS SP_hapus_Salary_5209;
CREATE PROCEDURE SP_hapus_Salary_5209()
BEGIN
    DELETE FROM employee WHERE salary < 3000.00;
END $$;
DELIMITER ;
CALL SP_hapus_Salary_5209();

-- 7. Buatlah stored procedure dengan nama SP_tampil_Fname_Dept untuk menampilkan fist_name dan department berdasarkan id pada table employees dengan melibatkan parameter IN dan OUT.
DELIMITER $$;
DROP PROCEDURE IF EXISTS SP_tampil_Fname_Dept_5209;
CREATE PROCEDURE SP_tampil_Fname_Dept_5209(IN id_ INT, OUT first_name_ VARCHAR(50), OUT department_ VARCHAR(50))
BEGIN
    SELECT first_name, department INTO first_name_, department_ FROM employee WHERE id = id_;
END $$;
DELIMITER ;
CALL SP_tampil_Fname_Dept_5209(2, @first_name, @department);
SELECT @first_name, @department;

-- 8 Tampilkan semua SP yang dibuat dalam database ini dengan menggunakan perintah show procedure status. Dan tampilkan hasilnya.
SHOW PROCEDURE STATUS WHERE Db = 'week_10';

-- FUNCTION
-- 1. Buatlah stored function dengan insert_employees untuk menginputkan data pada table employees. Panggil nama fungsi input tersebut untuk memasukan data minimal 2 record teman anda yang sebelah kanan dan kiri.
DELIMITER $$;
DROP FUNCTION IF EXISTS insert_employees_5209;
CREATE FUNCTION insert_employees_5209(first_name varchar(50), last_name varchar(50), email varchar(100), phone_number varchar(20), hire_date_date date, job_title varchar(50), salary decimal(10,2), department varchar(50))
RETURNS INT
BEGIN
    INSERT INTO `employee`(`first_name`, `last_name`, `email`, `phone_number`, `hire_date`, `job_title`, `salary`, `department`) VALUES (first_name, last_name, email, phone_number, hire_date, job_title, salary, department);
    RETURN LAST_INSERT_ID();
END $$;
DELIMITER ;

SELECT insert_employees_5209('Rizal', 'Arfiyan', 'rizalarfiyan@gmail.com', '08123456789', '2021-11-01', 'Developer', 5000.00, 'Finance');
SELECT insert_employees_5209('Wisnu', 'Dewa', 'wisnudewa@gmail.com', '08123456789', '2021-11-01', 'Designer', 5000.00, 'Finance');

-- 2. Buatlah stored function dengan nama hapus_employees untuk menghapus data yang nama department nya adalah Finance. Panggil nama fungsi tersebut dan jika berhasil maka tampilan datanya akan sebagai berikut.
DELIMITER $$;
DROP FUNCTION IF EXISTS hapus_employees_5209;
CREATE FUNCTION hapus_employees_5209()
RETURNS INT
BEGIN
    DELETE FROM employee WHERE department = 'Finance';
    RETURN ROW_COUNT();
END $$;
DELIMITER ;
SELECT hapus_employees_5209();

-- 3. Buatlah stored function dengan SPhapus_function untuk menampilkan data pada table employees yang salary nya lebih besar atau sama dengan 4000. Panggil SPhapus_function maka hasilnya akan sebagai berikut.
DELIMITER $$;
DROP FUNCTION IF EXISTS SPhapus_function_5209;
CREATE FUNCTION SPhapus_function_5209()
RETURNS INT
BEGIN
    SELECT * FROM employee WHERE salary>=4000.00;
    RETURN ROW_COUNT();
END $$;
DELIMITER ;
SELECT SPhapus_function_5209();

-- 4. Buatlah stored function untuk menentukan level gaji berdasarkan gaji yang diterima. Jika gajinya diatas 4000 adalah Tinggi, gaji dengan nilai lebih besar atau sama dengan 3500 dan lebih kecil atau sama dengan 4000 adalah Sedang. Kemudian jika gaji yang diperoleh dibawah 3500 maka Rendah.
DELIMITER $$;
DROP FUNCTION IF EXISTS level_gaji_5209;
CREATE FUNCTION level_gaji_5209(salary decimal(10,2))
RETURNS VARCHAR(50)
BEGIN
    DECLARE level VARCHAR(50);
    IF salary > 4000.00 THEN
        SET level = 'Tinggi';
    ELSEIF salary >= 3500.00 AND salary <= 4000.00 THEN
        SET level = 'Sedang';
    ELSE
        SET level = 'Rendah';
    END IF;
    RETURN level;
END $$;
DELIMITER ;
SELECT first_name, last_name, level_gaji_5209(salary) FROM employee;

-- 5. Tampilkan semua stored Function yang dibuat dengan perintah show FUNCTION STATUS
SHOW FUNCTION STATUS WHERE Db = 'week_10';