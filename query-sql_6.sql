DECLARE @min_salary int default 0;
set @min_salary = 4000;
SELECT * 
FROM jobs
WHERE min_salary > @min_salary
ORDER BY min_salary ASC;

DECLARE @new_region string;
set @new_region = "Australia";
INSERT INTO regions(region_name) VALUES (@new_region);

DELIMITER //
DROP PROCEDURE IF EXISTS number;
CREATE PROCEDURE number( IN number INT, OUT hasil VARCHAR(100))
BEGIN
IF number > 100 THEN
    SET hasil = 'Angka lebih besar dari 100';
ELSE 
    SET hasil = 'Angka lebih kecil dari 100';
END IF;
END //
DELIMITER ;

CALL number(600, @tampil);
SELECT @tampil;