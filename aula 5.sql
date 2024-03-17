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