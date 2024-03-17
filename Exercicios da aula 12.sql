/*
LISTA DE EXERCICIOS

1- SELECIONE O NOME DE TODAS AS MULHERES DE TABELA 'GAFANHOTOS'

2- SELECIONE TODOS OS DADOS DAS PESSOAS QUE NASCERAM ENTRE 1/1/2000 E 31/12/2015

3- SELECIONE O NOME DE TODOS OS HOMENS QUE TRABALHAM COMO PROGRAMADORES

4- SELECTIONE TODAS AS MULHERES QUE NASCERAM NO BRASIL E COMEÇAM O NOME COM A LETRA 'J'

5- SELECIONE NOME E NACIONALIDADE DOS HOMENS QUE TEM SILVA NO NOME, NÃO NASCERAM NO BRASIL E PESAM MENOS DE 100KG

6- SELECIONE A MAIOR ALTURA ENTRE OS HOMENS QUE MORAM NO BRASIL

7- SELECIONE A MÉDIA DE PESO DAS PESSOAS CADASTRADAS

8- QUAL O MENOR PESO DAS MULHERES QUE NASCERAM ENTRE 1/1/1990 E 31/12/2000

9- QUANTAS MULHERES TEM MAIS DE 1.90 DE ALTURA
*/

-- Exercicio 1

desc gafanhotos;

select nome from gafanhotos
	where sexo = 'F'
		order by nome;
        
-- Exercicio 2

select * from gafanhotos;

select * from gafanhotos
	where nascimento between '2000-01-01' and '2015-12-31'
		order by nascimento;

-- Exercicio 3
desc gafanhotos;

select nome from gafanhotos
	where sexo = 'M' and 
		profissao = 'programador'
			order by nome;
        
-- Exercicio 4
desc gafanhotos;

select * from gafanhotos;

select * from gafanhotos
	where sexo = 'F' and 
		nacionalidade = 'Brasil' and 
			nome like 'J%';

-- Exercicio 5

select * from gafanhotos;

select nome, nacionalidade from gafanhotos
	where sexo = 'M' and 
		nome like '%Silva%' and 
			peso < '100' and 
				nacionalidade != 'Brasil'
					order by nome;

-- Exercicio 6

select * from gafanhotos;

select max(altura) from gafanhotos
	where sexo = 'M' and
		nacionalidade = 'Brasil';

-- Exercicio 7

select * from gafanhotos;

select avg(peso) from gafanhotos;

-- Exercicio 8

select * from gafanhotos;

select min(peso) from gafanhotos
	where sexo = 'F' and 
		nacionalidade != 'Brasil' and 
			nascimento between '1990-01-01' and '2000-12-31';

-- Exercicio 9

select * from gafanhotos;

select count(altura) from gafanhotos
	where sexo = 'F' and altura > '1.90';
		