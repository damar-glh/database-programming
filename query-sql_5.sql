-- #1
start transactions;

INSERT INTO jobs(job_title, min_salary, max_salary) 
VALUES ('Database Engineer', 40000, 12000);
UPDATE employees 
SET job_id = (SELECT job_id FROM jobs WHERE job_title = 'Database Engineer')
WHERE employee_id = 103;

commit;

-- #2
SET FOREIGN_KEY_CHECKS = 0;
start transactions;

INSERT INTO countries(country_id, country_name, region_id) 
VALUES ('ID', 'Indonesia', 3);
SELECT * FROM countries;
DELETE FROM countries;
SELECT * FROM countries;

rollback;

-- #3 status autocommit
SET AUTOCOMMIT = 1;