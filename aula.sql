select * from aluno

update aluno
set idade = 11
where id = 7;

select nome, idade from aluno
where idade >= 11 and idade <= 20;

select nome, idade from aluno
where idade <> 20
order by  idade desc;

select idade from aluno
order by idade asc;

select nome, idade from aluno
where idade between 10 and 22;

select id, nome, cpf from aluno
where cpf is null;

insert into aluno (nome) values ('Mario');
insert into aluno (nome) values ('Roberta');

select nome from aluno
where nome like 'R%';

select nome from aluno
where nome not like 'R%';

select nome from aluno
where nome like 'Mari_';

select nome from aluno
where nome like '% %'