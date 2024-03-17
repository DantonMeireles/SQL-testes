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

