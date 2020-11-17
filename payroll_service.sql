CREATE DATABASE payroll_service;
USE  payroll_service;
SELECT DATABASE();

CREATE TABLE employee_payroll(	
  id 			INT unsigned  NOT NULL AUTO_INCREMENT, 	
  name 			VARCHAR(150)  NOT NULL,		 	
  salary 		Double        NOT NULL,		 	
  start 		DATE          NOT NULL,			 	
  PRIMARY KEY(id)				 	
);

DESCRIBE employee_payroll; 

INSERT INTO employee_payroll (name,salary,start) VALUES
( 'Sippora', 300000.00, '2018-01-03' ),
( 'Terisa', 200000.00, '2019-11-13' ),
( 'Surbhi', 300000.00, '2020-05-21' );

