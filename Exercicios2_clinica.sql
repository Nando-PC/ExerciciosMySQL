select nome, cpf 
from medicos
where idade < 40
or especialidade <> 'traumatologia';

select *
from consultas
where data_ > 20060619
and hora_ > 120000;

select nome, idade
from pacientes
where cidade <> 'Florianopolis';

select nome, cidade 
from pacientes
where cidade <> 'Florianopolis';

select min(salario)
from funcionarios;

select max(salario) as maiorSalario
from funcionarios;

select max(hora_) as ultimaConsulta
from consultas
where data_ = 20060613;

select avg(idade) as mediaIdadeMedicos, count(nroa) as totalAmbulatorios
from medicos;

select codf, nome, (salario - salario*0.2) as salarioLiquido
from funcionarios;

select nome
from funcionarios
where nome like '%a';

select nome, cpf
from funcionarios
where cpf not like '%00000%';

select nome, especialidade
from medicos
where nome like '_o%o';

select codp, nome
from pacientes
where idade > 25
and doenca in ('tendinite', 'fratura', 'gripe', 'sarampo');
