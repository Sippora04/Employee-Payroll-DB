#UC1
CREATE DATABASE payroll_service1;
USE payroll_service1;
SELECT database();

#UC2
CREATE TABLE employee_payroll(	
  id 			INT unsigned  NOT NULL AUTO_INCREMENT, 	
  name 			VARCHAR(150)  NOT NULL,		 	
  salary 		Double        NOT NULL,		 	
  start 		DATE          NOT NULL,			 	
  PRIMARY KEY 		(id)				 	
);

#UC3
DESCRIBE employee_payroll;

INSERT INTO employee_payroll (name,salary,start) VALUES
( 'Bill', 5000000.00, '2018-01-03' ),
( 'Terisa', 2000000.00, '2019-11-13' ),
( 'Charlie', 3000000.00, '2020-05-21' );

#UC4
SELECT * from employee_payroll;

#UC5
SELECT salary FROM employee_payroll WHERE name = 'Bill';	
SELECT * FROM employee_payroll WHERE start BETWEEN CAST('2018-01-01' AS DATE) AND DATE(NOW());

#UC6 
ALTER TABLE employee_payroll ADD gender CHAR(1) AFTER name; 	
UPDATE employee_payroll SET gender = 'F' where name = 'Terisa';
UPDATE employee_payroll SET gender = 'M' WHERE name = 'Bill' or name = 'CHARLIE';
UPDATE employee_payroll SET salary = 3000000.00 WHERE name = 'Terisa';

#UC7
SELECT AVG(salary) FROM employee_payroll 			
WHERE gender = 'M' GROUP BY gender; 	
SELECT gender, AVG(salary) FROM employee_payroll GROUP BY gender;
SELECT gender, COUNT(name) FROM employee_payroll GROUP BY gender;
SELECT gender, SUM(salary) FROM employee_payroll GROUP BY gender;
SELECT gender, MIN(salary) FROM employee_payroll GROUP BY gender;
SELECT gender, MAX(salary) FROM employee_payroll GROUP BY gender;

#UC8
ALTER TABLE employee_payroll ADD phone_number BIGINT AFTER name;
ALTER TABLE employee_payroll ADD address VARCHAR(250) AFTER phone_number;
ALTER TABLE employee_payroll ADD department VARCHAR(150) NOT NULL AFTER address;
ALTER TABLE employee_payroll ALTER address SET DEFAULT 'TBD';

#UC9	
ALTER TABLE employee_payroll RENAME COLUMN salary TO basic_pay;
ALTER TABLE employee_payroll ADD deductions Double NOT NULL AFTER basic_pay;
ALTER TABLE employee_payroll ADD taxable_pay Double NOT NULL AFTER deductions;
ALTER TABLE employee_payroll ADD tax Double NOT NULL AFTER taxable_pay;
ALTER TABLE employee_payroll ADD net_pay Double NOT NULL AFTER tax;