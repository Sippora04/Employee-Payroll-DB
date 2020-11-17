CREATE DATABASE payroll_service;
USE  payroll_service;
SELECT DATABASE();

CREATE TABLE employee_payroll(	
  id 			INT unsigned  NOT NULL AUTO_INCREMENT, 	
  name 			VARCHAR(150)  NOT NULL,		 	
  salary 		Double        NOT NULL,		 	
  start 		DATE          NOT NULL,			 	
  PRIMARY KEY 		(id)				 	
);

DESCRIBE employee_payroll; 

INSERT INTO employee_payroll (name,salary,start) VALUES
( 'Bill', 1000000.00, '2018-01-03' ),
( 'Terisa', 2000000.00, '2019-11-13' ),
( 'Charlie', 3000000.00, '2020-05-21' );
    
SELECT * FROM employee_payroll; 

SELECT salary FROM employee_payroll WHERE name = 'Bill';	
SELECT * FROM employee_payroll 
WHERE start BETWEEN CAST('2018-01-01' AS DATE) AND DATE(NOW());

ALTER TABLE employee_payroll ADD gender CHAR(1) AFTER name; 	
UPDATE employee_payroll SET gender = 'F' where name = 'Sippora';
UPDATE employee_payroll SET gender = 'M' WHERE name = 'Bill' or name = 'CHARLIE';
UPDATE employee_payroll SET salary = 3000000.00 WHERE name = 'Terisa';