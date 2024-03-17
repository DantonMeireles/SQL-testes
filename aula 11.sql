create database cadastro character set = utf8mb4 collate = utf8mb4_general_ci; -- Criei o banco

use cadastro; -- Abri o banco

create table if not exists pessoas (
id int not null auto_increment,
nome varchar(30) not null,
peso decimal(5,2) not null,
altura decimal(3,2) not null,
sexo enum('Masculino','Feminino') not null,
nacionalidade varchar(30) not null,
data_nascimento date not null,
cpf varchar(11) not null,
	primary key (id)
    );


-- Aula 5 (insert)

insert into pessoas
	(id, nome, peso, altura, sexo, nacionalidade, data_nascimento, cpf)
		values
			(default, 'teste', '90.00', '1.80', 'Masculino', 'Brasileiro', '2005-05-04', '11111111111');
			
            -- No primeiro caso eu informei os campos e os dados que eu queria colocar na tabela
            
insert into pessoas
		values
			(default, 'teste2', '90.00', '1.80', 'Masculino', 'Brasileiro', '2005-05-04', '11111111111');
            
            -- Caso os dados estejam na ordem em que eles estão na parte do 'schemas' eu não preciso necessáriamente colocar o nome dos campos, posso simplesmente colocar os dados que eu quero inserir
            
insert into pessoas
	(id, nome, peso, altura, sexo, nacionalidade, data_nascimento, cpf)
		values
			(default, 'teste3', '90.00', '1.80', 'Masculino', 'Brasileiro', '2005-05-04', '11111111111'),
            (default, 'teste4', '90.00', '1.80', 'Masculino', 'Brasileiro', '2005-05-04', '11111111111'),
            (default, 'teste5', '90.00', '1.80', 'Masculino', 'Brasileiro', '2005-05-04', '11111111111');

			-- Também posso inserir vários dados usando apenas um insert
select * from pessoas;



-- Aula 6 (alter table)

desc pessoas; -- descreve os campos da tabela

alter table pessoas -- altera a tabela
	add column profissao varchar(10) after nome; -- adicionando uma coluna depois da coluna 'nome'

alter table pessoas
	add column codigo int first; -- adicionando uma coluna como primeiro campo da tabela pessoas

alter table pessoas
	modify column profissao varchar(20); -- 'modify' modifica o tipo do dado, eu posso aumentar a quantidade de caracteres 
										 --  ou também posso mudar de 'char' para 'int' por exemplo
										
alter table pessoas
	change column profissao prof varchar(20); -- só é recomendado usar o change para alterar o nome de uma coluna, de resto use o modify

alter table pessoas
	rename to jorge; -- 'rename' troca o nome da tabela
    
alter table jorge
	rename to pessoas;

alter table pessoas
	drop column profissao; -- deletando a coluna

select * from pessoas;

-- -------------------------------------------------- 

create table if not exists cursos (
nome varchar(30) not null unique, -- 'unique' eu não vou poder registrar mais de um curso com o mesmo nome, literalmente unico
descricao text,
carga int unsigned, -- 'unsigned' vai economizar bites para cada carga horaria registrada
aulas int,
ano year default '2023'
);

alter table cursos
	add column idcurso int first; -- criando a culuna do id e colocando em primeira coluna da tabela

alter table cursos
	add primary key (idcurso); -- adicionado a primary key no id dos cursos

alter table cursos
	modify column idcurso int auto_increment; -- adicionando o auto_increment
    
desc cursos;

create table if not exists jorge(
id int not null auto_increment primary key,
nome varchar(69)
);

insert into jorge value
	(default, 'jorge');

select * from jorge;

drop table if exists jorge; -- deletei a tabela 'jorge'


-- aula 7 (update, delete e truncate)

desc cursos; -- pegando a descrição da tabela cursos

insert into cursos values -- inserindo valores aleatórios para eu usar o update dps
(default, 'html', 'curso de linguagem html', '10', '10', default),
(default, 'java', 'curso de linguagem java', '20', '10', default),
(default, 'css', 'curso de linguagem css', '30', '10', default),
(default, 'php', 'curso de linguagem php', '40', '10', default),
(default, 'oracle', 'curso de oracle', '50', '10', default);

select * from cursos; -- vendo as infos que eu adicionei

update cursos -- fazendo o update de informação (no caso eu troquei o nome de 'html' para 'HTML5'
	set nome = 'HTML5' 
		where idcurso = '1';
        
update cursos -- troquei todas as infos do curso de 'oracle' para 'mysql'
	set nome = 'mysql', descricao = 'curso de banco de dados em linguagem mysql'
		where idcurso = '5';
        
delete from cursos -- deletando o antigo curso de 'css'
	where idcurso = '3';

-- CRIANDO UMA TABELA ALEATÓRIA PARA USAR O COMANDO 'truncate'
create table if not exists sla (
nome varchar(30) not null unique, -- 'unique' eu não vou poder registrar mais de um curso com o mesmo nome, literalmente unico
ano year default '2023'
);

insert into sla values
('jorge', default),
('jorge1', default),
('jorge2', default),
('jorge3', default);

select * from sla;

truncate sla; -- esse comando apaga todos os dados que estavam inseridos na tabela

-- aula 11 (select) ---------------------------------------------------------


select * from cursos -- selecionando os cursos pelo nome 
	order by nome;

describe cursos;

select nome, carga, ano from cursos -- selecionei apenas os campos 'nome, carga e ano' usando nome como ordem 
	order by nome;

select * from cursos  -- pegando todos os cursos do ano de '2016' e usando 'nome' como ordem
	where ano = '2016'
		order by nome;
        
select nome, descricao, carga from cursos-- pegando o nome, descrição e carga da tabela cursos em que o ano seja igual ou menor que 2015
	where ano <= '2015' 
		order by carga /*desc*/;  -- o comando 'desc' no order by ele muda ordem do menor para o maior ou vice-versa

select nome, ano from cursos -- pegando os cursos que foram lançados de 2014 até 2016
	where ano between 2014 and 2016 -- o comando 'between' faz a ação
		order by ano;
        
select nome, ano from cursos -- pegando os cursos apenas dos anos 2014 e 2016
	where ano in (2014, 2016) -- o comando 'in' só mostra os dados determinados que eu escrever
		order by ano;
        
select * from cursos -- pegando os dados com carga maior que 35 e aulas menor que 30
	where carga > '35' and totaulas < '30' -- o 'and' é literalmente o 'E' 
		order by nome;
        
select * from cursos -- pegando os dados com carga maior que 35 e aulas menor que 30
	where carga > '35' or totaulas < '30' -- o 'or' é literalmente o 'OU' 
		order by nome;