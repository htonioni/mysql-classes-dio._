-- cláusulas de ordenação (ORDER BY)

use company_constraints;
select * from employee order by Fname asc;

show tables;
select * from project;

select distinct d.Dname as Department, concat (e.Fname, ' ', e.Lname) as Employee, p.Pname as Project_Name, Address
		from department as d, employee e, works_on as w, project as p
        where (d.Dnumber = e.Dno and e.Ssn = w.Essn and w.Pno = p.Pnumber)
        order by d.Dname, e.Fname, e.Lname;
        
-- agregação

select COUNT(*) as Total_Empregados, SUM(salary) as Gasto_empresa_c_Salario from employee;





--             Cláusulas de agrupamento (GROUP BY)

select * from employee;

-- contando num de employees
select count(*) from employee;


--       Agrupando os departamentos pela média de salário 
select Dno, count(*), round(avg(Salary),2) from employee, department
		group by Dno;
-- Usando AS STATEMENT
select Dno, count(*) as Num_Employees, round(avg(Salary),2) as Salary_avg from employee, department
		group by Dno;
        
-- Pessoas por departamento
select Pnumber, Pname, count(*) as TT_pessoas
		from project, works_on
		where Pnumber = Pno
		group by Pnumber, Pname;
        
-- Quantos salários diferentes(distinct) há na empresa(DB) Utilizando o 
select count(distinct Salary) from employee;

-- Playing with functions in Salary.
select sum(Salary) as total_sal, max(Salary) as max_sal, min(Salary) as min_sal, avg(Salary) as avg_sal
		from employee;


