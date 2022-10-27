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

select COUNT(*) as Total_Empregados, SUM(salary) as Gasto_empresa_c_Salario from employee