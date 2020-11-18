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

#UC10
UPDATE employee_payroll SET department = 'Sales' WHERE name = 'Terisa';  
INSERT INTO employee_payroll(name, department, gender, basic_pay, deductions, taxable_pay, tax, net_pay, start) VALUES
('Terisa', 'Marketing', 'F', 3000000.00, 1000000.00, 2000000.00, 500000.00, 1500000.00, '2018-01-03');
SELECT * FROM employee_payroll WHERE name = 'Terisa';

#UC11
CREATE TABLE employee 						
(
 id 		    INT unsigned NOT NULL AUTO_INCREMENT PRIMARY KEY,
 company_id 	INT  REFERENCES company(company_id),
 employee_name  VARCHAR(50)    NOT NULL,
 phone_number 	BIGINT         NOT NULL,
 address 	    VARCHAR(250)   NOT NULL DEFAULT 'TBD',
 gender 	    CHAR(1)        NOT NULL
);
CREATE TABLE payroll
(
 emp_id 	    INT REFERENCES employee(id),
 basic_pay 	    DOUBLE NOT NULL,
 deductions 	DOUBLE NOT NULL,
 taxable_pay 	DOUBLE NOT NULL,
 tax 		    DOUBLE NOT NULL,
 net_pay 	    DOUBLE NOT NULL
);
CREATE TABLE company						
(
 company_id 	INT         PRIMARY KEY, 				
 company_name 	VARCHAR(100) NOT NULL
);
CREATE TABLE department
(
 dept_id 	INT         PRIMARY KEY,
 dept_name 	VARCHAR(150) NOT NULL
);

CREATE TABLE employee_department
(
 emp_id 	INT REFERENCES employee(id),
 dept_id 	INT REFERENCES department(dept_id)
);

INSERT INTO company VALUES 					
 	(1,'Reliance'),
 	(2,'Tata'),
 	(3,'HM');
INSERT INTO employee VALUES 					
 	(101, 1, 'Bill', '7717654009', 'California', 'M' ),
	(102, 1, 'Terisa', '8156640201', 'San Francisco', 'F' ),
	(103, 2, 'Charlie', '9899053203', 'New York', 'M' );
INSERT INTO payroll VALUES 			
 	(101,100000,10000,80000,4000,94000),
 	(102,300000,30000,180000,10000,170000),
 	(103,80000,6000,74000,2000,72000);
INSERT INTO department VALUES  		
 	(11, 'Sales'),
 	(12, 'Marketing'),
 	(13, 'Testing'),
 	(14, 'Management');
    INSERT INTO employee_department VALUES  				
 	(101,13),
 	(102,12),
 	(102,11),
 	(103,14);

#UC12
SELECT gender, COUNT(net_pay) FROM (employee INNER JOIN payroll ON employee.id=payroll.emp_id) GROUP BY gender;
SELECT gender, AVG(net_pay) FROM (employee INNER JOIN payroll ON employee.id=payroll.emp_id) GROUP BY gender;
SELECT gender, MAX(net_pay) FROM (employee INNER JOIN payroll ON employee.id=payroll.emp_id) GROUP BY gender;

