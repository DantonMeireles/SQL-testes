-- Exercicios da aula 13

/*
1- Uma lista com as profissões registradas e seus respectivos quantitavos (quantidade de pessoas na profissão)

2- Quantos homens e mulheres nasceram após 1/1/2005

3- Uma lista com as pessoas que nasceram fora do brasil, mostrando pais de origem e total de pessoas nascidas naquele pais
só interessam os paises que tem mais de 3 pessoas

4- Lista agrupada pela altura das pessoas registradas, mostrando quantas pessoas pesam mais de 100kg e que estão acima da média de 
altura registrada 
*/

-- 1° ----------------------------------------------------------

select * from gafanhotos;

select profissao, count(*) from gafanhotos
	group by profissao
		order by count(*);

-- 2° --------------------------------------------
select * from gafanhotos;

select sexo, count(*) from gafanhotos
	where nascimento > '2005-1-1'
		group by sexo
			order by sexo;

-- 3° -----------------------------------------------
select * from gafanhotos;

select nacionalidade, count(*) from gafanhotos
	where nacionalidade != 'brasil'
		group by nacionalidade
			having count(nacionalidade) >= 3
            order by count(*);

-- 4° ----------------------------------------
select * from gafanhotos;

select altura, count(*) from gafanhotos
	where peso > '100' 
		group by peso
			having peso > (select avg(peso) from gafanhotos);