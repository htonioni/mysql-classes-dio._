show databases;
create schema if not exists company_constraints;
use company_constraints;

select * from information_schema.table_constraints
where constraint_schema = 'company_constraints';

drop table employee;

create table employee(
	Fname VARCHAR(15) NOT NULL,
	Minit CHAR,
	Lname VARCHAR(15) NOT NULL,
	Ssn CHAR(9) NOT NULL,
	Bdate DATE,
	Address VARCHAR(30),
	sex CHAR,
	Salary decimal(10, 2),
	Super_ssn CHAR(9),
	Dno INT NOT NULL,
    constraint chk_salary_employee check (Salary > 2000.0),
    constraint pk_employee primary key (Ssn)
	);

alter table employee
	add constraint fk_employee
    foreign key(Super_ssn) references employee(Ssn)
    on delete set null 
    on update cascade;

alter table employee modify Dno int not null default 1;

desc employee;



create table department(
	Dname VARCHAR(15) NOT NULL,
    Dnumber INT NOT NULL,
    Mgr_ssn CHAR(9),
    Mgr_start_date date,
    Dept_create_date date,
    constraint chk_date_dept_2 check (Dept_create_date < Mgr_start_date),
    constraint pk_dept primary key (Dnumber),
    constraint unique_name_dept unique(Dname),
	foreign key (Mgr_ssn) references employee (Ssn)
);

-- modificar uma constraint: drop e add
alter table departament drop constraint departament_ibfk_1;
alter table department
		add constraint fk_dept foreign key(Mgr_ssn) references employee(Ssn)
        on update cascade;


desc departament;


create table dept_locations(
	Dnumber INT NOT NULL,
    Dlocation VARCHAR(15) NOT NULL,
	constraint pk_dept_locations primary key (Dnumber, Dlocation),
	constraint fk_dept_locations foreign key (Dnumber) references departament(Dnumber)
);

alter table dept_locations drop constraint fk_dept_locations;

alter table dept_locations
		add constraint fk_dept_locations foreign key (Dnumber) references departament(Dnumber)
        on delete cascade
        on update cascade;

create table project(
	Pname VARCHAR(15) NOT NULL,
	Pnumber INT NOT NULL,
	Plocation VARCHAR(15),
	Dnumber INT NOT NULL,
	primary key (Pnumber),
	constraint unique_project unique (Pname),
	constraint fk_project foreign key (Dnumber) references departament(Dnumber)
	);
    
    
create table works_on(
	Essn char(9) not null,
    Pno INT NOT NULL,
    Hours decimal(3,1) not null,
    primary key (Essn, Pno),
    constraint fk_employee_works_on foreign key (Essn) references employee (Ssn),
    constraint fk_proj_works_on foreign key (Pno) references project (Pnumber)
	);
    

drop table departament;

create table dependent(
	Essn char(9) not null,
    Dependent_name varchar(15) not null,
    Sex char,
    Bdate date,
    Relantionship VARCHAR(8),
    primary key (Essn, Dependent_name),
    constraint fk_dependent foreign key (Essn) references employee(Ssn)
	);
    
    show tables;
    desc employee;
    desc departament;
    -- Aula Definindo o esquema relacional de COMPANY com SQL
    