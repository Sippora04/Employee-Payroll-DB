CREATE DATABASE payroll_service;
USE  payroll_service;
SELECT DATABASE();

CREATE TABLE employee_payroll (	
  id 			INT unsigned  NOT NULL AUTO_INCREMENT, 	
  name 			VARCHAR(150)  NOT NULL,		 	
  salary 		Double        NOT NULL,		 	
  start 		DATE          NOT NULL,			 	
  PRIMARY KEY(id)				 	
);

DESCRIBE employee_payroll; 

INSERT INTO employee_payroll (name,salary,start) VALUES
( 'Samuel', 300000.00, '2017-04-04' ),
( 'Akshay', 400000.00, '2018-10-11' ),
( 'David', 200000.00, '2020-06-22' );
    
SELECT * FROM employee_payroll; 