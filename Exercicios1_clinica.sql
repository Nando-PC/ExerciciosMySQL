create database db_clinica;
use db_clinica;
create table ambulatorios (
nroa int not null,
andar numeric(3) not null,
capacidade smallint,
PRIMARY KEY (nroa)
);
drop table ambulatorios;

create table medicos (
codm int not null,
nome varchar(40) not null,
idade smallint not null,
especialidade char(20),
cpf numeric(11) UNIQUE,
cidade varchar(30),
nroa int not null,
PRIMARY KEY (codm),
CONSTRAINT fk_nroa foreign key (nroa) references ambulatorios(nroa)
on delete no action
on update no action
);

create table pacientes (
codp int not null,
nome varchar(40) not null,
idade smallint not null,
cidade char(30),
cpf numeric(11) unique,
doenca varchar(40) not null,
PRIMARY KEY (codp)
);

create table funcionarios (
codf int not null,
nome varchar(40) not null,
idade smallint not null,
cpf numeric(11) unique,
cidade char(30),
salario numeric(10),
cargo varchar(20),
PRIMARY KEY (codf)
);

create table consultas (
codc int not null,
codm int not null,
codp int not null,
data_ date,
hora_ time,
PRIMARY KEY (codc),
CONSTRAINT fk_codm foreign key (codm) references medicos(codm)
on delete no action
on update no action,
CONSTRAINT fk_codp foreign key (codp) references pacientes(codp)
on delete no action 
on update no action
);

alter table funcionarios
	add nroa int;

ALTER TABLE funcionarios
	ADD CONSTRAINT fk_nroa2 FOREIGN KEY (nroa) REFERENCES ambulatorios(nroa);
    
create index idx_cpf on medicos(cpf);
create index idx_doenca on pacientes(doenca);
drop index idx_doenca on pacientes;

ALTER TABLE funcionarios
	DROP nroa;

insert into ambulatorios (nroa, andar, capacidade)
	values (5, 2, 55);
    
insert into medicos (codm, nome, idade, especialidade, cpf, cidade, nroa)
	values (5, 'Marcia', 33, 'neurologia', 11000111000, 'Biguaçu', 3);
    
insert into pacientes (codp, nome, idade, cidade, cpf, doenca)
	values (4, 'Carlos', 28, 'Joinville', 11000110000, 'sarampo');
    
insert into funcionarios (codf, nome, idade, cpf, cidade, salario)
	values (5, 'Paula', 33, 61000111000, 'Florianopolis', 2500);
    
insert into consultas (codc, codm, codp, data_, hora_)
	values (11, 4, 4, 20060622, 193000);
    
select * from pacientes;

update consultas
set hora_ = 120000
where (codc = 2);

select * from consultas;

update consultas
set hora_ = 133000
where (codc = 9);

update pacientes
set idade = 21
where (codp = 1);

select * from funcionarios;

delete from funcionarios
	where (codf  = 4);
    
delete from consultas
	where (codc = 11);

delete 
from consultas
where hora_ > 190000;

delete 
from pacientes p 
where p.doenca = 'cancer'
or p.idade < 10;

delete
from medicos m
where m.cidade = 'Biguaçu'
or m.cidade = 'Palhoca';