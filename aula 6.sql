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