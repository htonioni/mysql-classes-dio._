show databases;
create database if not exists hugo_example;
use hugo_example;
CREATE TABLE person(
	person_id smallint unsigned,
	fname VARCHAR(20),
	lname VARCHAR(20),
	gender enum('M', 'F'),
	birth_date DATE,
	street VARCHAR(30),
	city VARCHAR(20),
	state VARCHAR(20),
	country VARCHAR(20),
	postal_code VARCHAR(20),
    constraint pk_person primary key (person_id)
    );
desc person;

create table favorite_food(
	person_id smallint unsigned,
    food VARCHAR(20),
    constraint pk_favorite_food primary key (person_id, food),
    constraint fk_favorite_food_person_id foreign key (person_id) references person(person_id)
	);

desc favorite_food;
show databases;
select * from information_schema.table_constraints where CONSTRAINT_SCHEMA = 'hugo_example';

desc person;

insert into person values ('4', 'Monica', 'Tonioni', 'F', '1965-5-05',
							'Rua luis', 'VR', 'RJ', 'Brasil', '27335-020'),
                            ('5', 'Marcel', 'Santana', 'm', '1945-5-05',
							'Rua Marcio', 'SP', 'SP', 'Brasil', '17335-020');
select * from person;

delete from person where person_id = 2;

show databases;
use hugo_example;
show tables;
desc favorite_food;
insert into favorite_food values ('1', 'Lasanha');
select * from favorite_food;

