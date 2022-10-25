-- inserção de dados no bd company

use company_constraints;
show tables;

load data infile 'path' into table employee;


select * from employee;
insert into employee values ('John', 'B', 'Smith', 123456789, '1965-01-09', '731-Fondre-Houston-TX', 'M', 30000, null, 5);

insert into employee values ('Hugo', 'T', 'Santana', 222456789, '1900-01-10', '456-Luis-Sarasota-FL', 'M', 40000, null, 5),
							('Maciel', 'J', 'Santana', 222444789, '1945-05-18', '456-Luis-Sarasota-FL', 'M', 20000, null, 4);
                            
                            
select * from dependent;
insert into dependent values (222456789, 'Alice', 'F', '2030-05-05', 'Daughter'),
							(123456789, 'Manuela', 'F', '2030-05-05', 'Daughter');
                            
insert into department values ('Research', 5, 123456789, '1988-05-22', '1986-05-22'),
								('Administration', 4, 222456789, '1995-01-01', '1994-01-01');
select * from departament;


select * from dept_locations;
insert into dept_locations values (4, 'Houston'),
								(4, 'Scraton'),
                                (5, 'Miami');
                                
select * from project;
insert into project value ('ProductX', 1, 'Bellaire', 5),
						('ProductY', 2, 'Sugarland', 5),
                        ('ProductZ', 3, 'Houston', 5);



                                
select * from works_on ;
insert into works_on values (222456789, 1, 32.5),
							(123456789, 2, 40);



select * from employee;

-- gerente e seu departamento
select Ssn, Fname, Dname from employee e, department d where (e.Ssn = d.Mgr_ssn);

-- pessoas e seus dependentes 
select Relantionship, Fname, Dependent_name from employee, dependent where Essn = Ssn;

-- achando data de aniversario e endereço de tal funcionario 
select Bdate, Address from employee
	where Fname = 'John' and Minit = 'B' and Lname='Smith';
    
-- Olhando departamente especifico 
select * from department where Dname = 'Research';

select Fname, Lname, Address from employee, departament
	where Dname='Research' and Dnumber=Dno;