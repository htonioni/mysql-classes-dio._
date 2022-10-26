-- explorando os comandos DDL

select now() as Timestamp;

create database if not exists manipulation;
use manipulation;



CREATE TABLE bankAccounts (
		Id_account INT auto_increment PRIMARY KEY,
        Ag_num INT NOT NULL,
        Ac_num INT NOT NULL,
        Saldo FLOAT,
        CONSTRAINT identification_account_constraint UNIQUE (Ag_num, Ac_num)
);

-- Inserindo uma conta de banco na relação!
insert into bankAccounts (Ag_num, Ac_num, Saldo) values (0147, 123456789, 0);
select * from bankAccounts;


       -- Adicionar Atributos a uma tabela existente! --
alter table bankAccounts add LimiteCredito float NOT NULL default 500.00;


	   -- Remover um atributo(Coluna) de uma tabela(Relação) --
alter table bankAccounts drop column LimiteCredito;

desc bankAccounts;

CREATE TABLE bankClient(
		Id_client INT auto_increment,
        ClientAccount INT,
        CPF CHAR(11) NOT NULL,
        RG CHAR(9) NOT NULL,
        Nome VARCHAR(50) NOT NULL,
        Endereço VARCHAR(100) NOT NULL,
        Renda_mensal FLOAT,
        PRIMARY KEY (Id_client, ClientAccount),
        CONSTRAINT fk_account_client FOREIGN KEY (ClientAccount) REFERENCES bankAccounts(Id_account)
        ON UPDATE CASCADE
);
-- Adicionando o atributo UFF (Estado)
alter table bankClient add UFF char(2) not null default 'RJ';

-- Inserindo um cliente 
insert into bankClient (ClientAccount, CPF, RG, Nome, Endereço, Renda_mensal) 
			values(1, 12345678912, 123456789, 'Hugo', 'Rua Carlão', 1700);


select * from bankClient;

CREATE TABLE bankTransactions(
		Id_transaction INT auto_increment PRIMARY KEY,
        Ocorrencia datetime,
        Status_transaction VARCHAR(20),
        Valor_transferido FLOAT,
        Source_account INT,
        Destination_account INT,
        CONSTRAINT fk_source_transaction foreign key (Source_account) REFERENCES bankAccounts(Id_account),
        CONSTRAINT fk_destination_transaction foreign key (destination_account) REFERENCES bankAccounts(Id_account)
);


