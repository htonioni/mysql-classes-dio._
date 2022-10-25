select * from department;
select * from dept_locations;
-- Ambas Relações possuem Dnumber, o que gera ambiguidade


select Dname, l.Dlocation as Department_name
		from department as d, dept_locations as l
        where d.Dnumber = l.Dnumber;
        
-- test
select concat(Fname, ' ', Minit) as Employee from employee;