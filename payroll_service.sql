#CREATE DATABASE payroll_service;
USE  payroll_service;
SELECT DATABASE();

CREATE TABLE employee_payroll (	
  id 			INT unsigned  NOT NULL AUTO_INCREMENT, 	
  name 			VARCHAR(150)  NOT NULL,		 	
  salary 		Double        NOT NULL,		 	
  start 		DATE          NOT NULL,			 	
  PRIMARY KEY 		(id)				 	
);
DESCRIBE employee_payroll;