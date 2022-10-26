-- Cláusulas com EXISTS e UNIQUE

show databases;
use company_constraints;
show tables;
select * from employee;

select * from dependent;

-- Quais Employees poussuem Dependents
select e.Fname, e.Lname from employee as e
		where exists(select * from dependent as d
					 where e.Ssn = d.Essn);
                     
 -- E Quais nao possuem?
 select e.Fname, e.Lname from employee as e
		where not exists(select * from dependent as d
					 where e.Ssn = d.Essn);


-- Inserindo em dependentes, mais um filho para o funcionario SSN 222456789
select * from employee;
select * from dependent;
insert into dependent values(222456789, 'Joao', 'M', '2030-04-06', 'Son');

-- Selecionar Employees com dois ou mais dependentes
select Fname, Lname, Ssn from employee
	where(select count(*) from dependent where Ssn=Essn)>=2;