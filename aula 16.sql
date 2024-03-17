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
 
 
-- aula 12 select --------------------------------------------------------------------------------------------

select * from cursos -- no caso esse comando vai buscar tudo que começa com a letra 'P'
	where nome like 'P%'; -- o comando 'like' quer dizer que é parecido, e o '%' é nenhum ou qualquer coisa
				-- leitura literal do código : Selecione tudo da tabela cursos onde nome PARECA com 'P e quaisquer outros caracteres'
                
select * from cursos -- no caso desse comando eu pego tudo que o nome termina em 'A'
	where nome like '%a';
    
select * from cursos -- no caso desse comando eu pego tudo que o nome tem 'A' no meio da palavra
	where nome like '%a%';
    
select * from cursos -- trate a funcionalidade do código igual ao de cima, porém o not é uma negação, ou seja, ele faz o contrario
	where nome not like '%a';

select * from gafanhotos
	where nome like '%_silva%'; -- o '_' siginifica que tem uma letra ou espaço naquele lugar
    
SELECT nacionalidade FROM gafanhotos; -- aqui eu pego a nacionalidade das pessoas cadastradas, porém repete o nome dos países

select distinct nacionalidade from gafanhotos -- aqui eu pego a nacionalidade, mas caso tenha repetida ele não irá mostras a 
	order by nacionalidade;					  -- quantidade de vezes a mesma palavra 
    
select distinct carga from cursos -- pegando a carga horaria dos cursos
	order by carga;
    
select count(*) from cursos; -- o 'count' faz a contagem, nesse caso eu estou contando a quantidade de cursos

select count(*) from gafanhotos; -- contando a quantidade de pessoas registradas

select count(*) from gafanhotos -- vendo a quantida de pessoas que não tem 'a' no meio do nome
	where nome not like '%a%';
    
select max(totaulas) from cursos; -- vendo o curso com a maior quantidad de aulas

select max(carga) from cursos -- vendo o curso com maior carga horário que seja menor que 40 horas
	where carga < '40';
    
select min(totaulas) from cursos; -- vendo qual o curso tem a menor quantidade de aulas

desc cursos;

select nome, descricao, carga, min(totaulas) from cursos; -- menor numero de aulas, porém uma pesquisa com mais detalhes

select nome, descricao, carga, min(totaulas) from cursos where ano = '2019'; -- menor numero de aulas, porém uma pesquisa 
																			 -- com mais detalhes em 2019

select * from cursos;

select sum(totaulas) from cursos; -- somando o total de aulas da tabela cursos

select sum(carga) from cursos; -- somando o total da carga horaria dos cursos

select avg(totaulas) from cursos; -- pegando a média do total de aulas da tabela cursos

-- Aula 13 (select) -----------------------------------------------------------------------------------


select carga, count(*) from cursos -- o 'group' ele agrupa quando algum dado seja repetido, mas para usar ele com eficiencia é bom usar
	group by carga 				   -- o 'count' para ele contar quantos do mesmo dado sao repitidos, pois sem isso ele não mostra
		order by carga;
        
select ano, count(*) from cursos -- o 'having' ele agrupa, é como se fosse o where, é meio confuso, mas nesse caso ele só mostrou os 
	group by ano				 -- cursos dps do ano de 2013
		having ano > 2013
			order by count(*);

select carga, count(*) from cursos -- aqui pedi para mostrar a carga dos cursos, que foram feitos dps do ano de 2015 e que tem
	where ano > 2015			   -- a carga horaria maior do que a média da carga de todos os cursos, o count é só para mostrar qtd
		group by carga			   -- o 'having' só funciona no campo em que eu coloquei o group by
			having carga > (select avg(carga) from cursos);
            

-- Aula 15 Foreing Key ------------------------------------------------------------------------------------

desc gafanhotos;

alter table gafanhotos add column curso_preferido int; -- criando uma nova coluna para dps tranformas em chave estrangeira, tem que ser
-- do mesmo tipo de dado da outra tabela (nesse caso o tipo do dado é o 'INT'

alter table gafanhotos
	add foreign key (curso_preferido) -- Adicionando a foreing key
		references cursos(idcurso); -- Referenciando a primary key da outra tabel

select * from gafanhotos;

delete from cursos 
	where idcurso = '1'; -- Quando eu referencio e junto as tabelas eu não posso apagar determinados dados, pois causaria um
    -- erro no sistema, caso algum curso não fosse o favorito de nenhum aluno eu poderia apagar sem problema
    
-- Aula 15.1 Join ----------------------------------------------------------------------

select * from gafanhotos;

select gafanhotos.nome, gafanhotos.curso_preferido, cursos.nome, cursos.ano
	from gafanhotos join cursos -- Peguei as infos e juntei, n sei explicar mt bem isso daqui
		on cursos.idcurso = gafanhotos.curso_preferido; -- Uso do 'ON' é muito recomendado  
        
/*Left e Right join eles vao dar preferencia para as informações da tabela, no caso do jeito que um usuario colocou as informações
Exemplo:

From 'Tabela1' join 'Tabela2'

Caso eu use o left join ele dará preferencia as informações da 'tabela1', pois ele está na esquerda, foi escrita de forma que está
posicionada na esquerda

Caso eu user o right join ele dará preferencia as informações da 'tabela2', pois ela está na direita*/

-- Aula 16 (inner join) ---------------------------------------------------------

-- Criando tabela para poder fazer inner join com 3 tabelas
create table aluno_assiste_curso (
	id int not null auto_increment,
    data date,
    idgafanhoto int,
    idcurso int,
    primary key (id), 
    foreign key (idgafanhoto) references gafanhotos(id), -- inserindo chave estrangeira
    foreign key (idcurso) references cursos(idcurso) -- inserindo chave estrangeira
);
 
insert into aluno_assiste_curso values -- inserindo valores
(default, '2014-03-01', '1', '2');    

select * from aluno_assiste_curso; -- conferindo

desc gafanhotos;
desc aluno_assiste_curso;
desc cursos;

select gafanhotos.nome, gafanhotos.id, aluno_assiste_curso.data, aluno_assiste_curso.idcurso, cursos.nome from gafanhotos
	join aluno_assiste_curso
		on gafanhotos.id = aluno_assiste_curso.idgafanhoto -- juntando a chave primaria de uma tabela com a estrangeira da outra
			join cursos
				on cursos.idcurso = aluno_assiste_curso.idcurso; -- juntando a chave primaria de uma tabela com a estrangeira da outra