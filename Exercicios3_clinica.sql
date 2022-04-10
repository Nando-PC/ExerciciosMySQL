select m.nome, m.cpf
from medicos m join pacientes p
on m.nome = p.nome;

select f.nome as Funcionarios, f.codf CodFuncionarios, m.nome as Medicos, m.codm as CodMedicos
from funcionarios f join medicos m
on f.cidade = m.cidade;

select p.nome, p.codp
from pacientes p
where exists
	(select *
    from consultas
    where hora_ > 140000
    and codp = p.codp);

select a.nroa, a.andar
from ambulatorios a
where exists
	(select *
    from medicos m
    where m.especialidade = 'ortopedia'
    and a.nroa = m.nroa);
    
select p.nome, p.cpf
from pacientes p
where exists
	(select *
    from consultas c
    where data_ between '2006/06/14' and '2006/06/16'
    and p.codp = c.codp);
    
select m.nome, m.idade
from medicos m
where exists
	(select *
    from consultas c
    where c.codp = 1
    and m.codm = c.codm);
    
select * from medicos;
    
select distinct m.codm, m.nome
from medicos m, consultas c
where m.nroa = 2
and c.data_ = 20060614;

select f.codf, f.nome
from funcionarios f
where f.salario > 1200
and f.cidade = 'Florianopolis';

select a.nroa, a.andar, a.capacidade, m.codm, m.nome
from ambulatorios a, medicos m
where exists
	(select *
    from medicos m
    where m.nroa = a.nroa);
    
select m.nome, m.cpf
from medicos m join pacientes p 
on m.cpf = p.cpf;

select p.codp, p.nome
from pacientes p, consultas c 
where hora_ > 140000
and c.codp in (p.codp);

select distinct a.nroa, a.andar
from ambulatorios a, medicos m
where a.nroa not in (m.nroa);

select distinct p.nome, p.cpf, p.idade
from pacientes p, consultas c 
where data_ < 20060616;

select m.nome, m.cpf
from medicos m
where exists
	(select *
    from pacientes p 
    where p.cpf = m.cpf);
select * from medicos;

select a.nroa
from ambulatorios a 
where capacidade = 55;

select m.nome, m.cpf
from medicos m
where exists
	(select *
    from consultas c 
    where m.codm = c.codm);
    
select m.nome, m.cpf
from medicos m
where m.especialidade = 'ortopedia'
and exists
	(select *
    from consultas c
    where c.codm = m.codm
    and c.codp = 1);
        
select * from medicos;