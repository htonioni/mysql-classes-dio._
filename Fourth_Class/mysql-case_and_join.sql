show databases;

use company_constraints;
show tables;
select * from department;
select * from employee;
select Fname, Lname, Ssn, Salary from employee;

-- CASE statement --

-- update na relação employee = aumento de salario por departamento (Dno => 4 e 5)
update employee set Salary =
		case
            when Dno=4 then Salary+ 444
            when Dno=5 then Salary+ 555
            else Salary + 0
        end;    
        

-- JOIN statement --

SELECT employee.fname, employee.lname, department.Dname 
			from employee 
            join department;


-- Juntando nome e sobrenome
SELECT concat(employee.fname,' ', employee.lname), department.Dname 
			from employee 	
            join department;

-- Utilizando AS STATEMENT
SELECT concat(e.fname,' ', e.lname) as Nome_Completo, d.Dname 
			from employee as e 
            join department as d;
            
-- Join ON -> INNER JOIN ON
desc employee;
desc works_on;
select * from employee INNER JOIN works_on on Ssn=Essn;
select * from employee, works_on where Ssn=Essn;


-- CROSS Join

select * from employee CROSS JOIN dependent;

-- Join com mais de 2 tabelas --
-- project, works_on e employee
SELECT CONCAT(Fname,' ', Lname) as Complete_Name, Dno as Dpt_Number, Essn as Social_Sec_NUM, Pname as Project_Name, Plocation as Project_Name FROM employee
		INNER JOIN works_on ON Ssn=Essn
        INNER JOIN project ON Pno=Pnumber
        where Plocation like 'B%'
        order by Pnumber;
        
        
-- department, dept_location, employee 
select * from department;
select * from dept_locations;
select * from employee;

-- Dnumber é o mesmo nome nas duas TABLES, então utilizamos o using()
select * from department
		inner join dept_locations using(Dnumber)
        inner join employee on Dno=Dnumber;
        





