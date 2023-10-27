-- Consulta 0: Recuperar a data de nascimento eo endereço do empregado (s), cujo nome é John B. Smith
select bdate,address
from   employee
where  fname='John' and minit='B' and lname='Smith';


-- Consulta 1: Recuperar o nome e endereço de todos os empregados que trabalham para o departamento de pesquisa.
select fname,lname,address
from   employee,department
where  dnumber=dno and
       dname='Research';


-- Consulta 2: Para cada projeto localizado em Stafford, listar o número do projeto, o número do departamento de controle, e último nome do gerente de departamento, endereço e data de nascimento.
select pnumber,dnum,lname,address,bdate
from   project,department,employee
where  dnum=dnumber and mgrssn=ssn and plocation='Stafford';


-- Consulta 3: Recuperar os nomes de cada empregado que trabalha em todos os projetos controlados pelo departamento 5
select lname,fname
from   employee
where  not exists (
  select *
  from   works_on b
  where  (b.pno in (select pnumber from project where dnum=5) and not exists (
    select *
    from   works_on c
    where  ssn = c.essn and b.pno = c.pno));


-- Consulta 4: Faça uma lista de todos os números de projetos para projetos que envolvam um empregado cujo último nome é Smith ou como trabalhador ou como gerente do departamento que controla o projeto.
(select distinct pnumber
 from   project,department,employee
 where  dnum=dnumber and mgrssn=ssn and lname='Smith')
union
(select pnumber
 from   project,works_on,employee
 where  pnumber=pno and essn=ssn and lname='Smith');


-- Consulta 5: Recupere os nomes de todos os funcionários que têm dois ou mais dependentes.
select lname,fname
from   employee
where  (select count(*) from dependent where ssn=essn) >=2;



-- Consulta 6: Recuperar os nomes dos empregados que não têm dependentes.
select fname,lname
from   employee
where  not exists (select * from dependent where ssn=essn);


-- Consulta 7: Listar os nomes dos gerentes que têm pelo menos um dependente.
select fname,lname
from   employee
where  exists (select * from department where ssn=mgrssn) and
       exists (select * from dependent where ssn=essn);
	

-- Consulta 8: Para cada empregado, recupere primeiro e último nome do empregado e do primeiro e último nome de seu supervisor imediato
select e.fname,e.lname,s.fname,s.lname
from   employee as e, employee as s
where  e.superssn = s.ssn;



-- Consulta 9: Recuperar todos os CPFs de funcionários
select ssn
from   employee;


-- Consulta 10: Obter todas as combinações de NOME SSN e DEPARTAMENTO
select ssn,dname
from   employee,department;


-- Consulta 11: Recuperar o salário de cada empregado
select all salary
from   employee;



-- Consulta 11: Recuperar os valores salariais distintas
select distinct salary
from   employee;


-- Consulta 12: Recuperar todos os funcionários cujo endereço está em Houston, Texas
select fname,lname
from   employee
where  address like '%Houston, TX%';


-- Consulta 13: Ver os salários resultantes se cada empregado que trabalha no projeto ProdutoX é dado um aumento de 10%.
select fname,lname,1.1*salary as increased_sal
from   employee,works_on,project
where  ssn=essn and pno=pnumber and pname='ProductX';


-- Consulta 14: Obter todos os empregados do departamento 5 cujo salário é entre US $ 30.000 e US $ 40.000
select *
from   employee
where  dno=5 and (salary between 30000 and 40000);


-- Consulta 15: Obter uma lista de funcionários e os projetos em que estão trabalhando, ordenados por departamento e, dentro de cada departamento, em ordem alfabética pelo sobrenome, nome
select dname,lname,fname,pname
from   department,employee,works_on,project
where  dnumber=dno and ssn=essn and pno=pnumber
order by dname,lname,fname;



-- Consulta 16: Recuperar o nome de cada funcionário que tem um dependente com o mesmo nome e do mesmo sexo que o empregado
select e.fname,e.lname
from   employee as e
where  e.ssn in (select essn
                 from   dependent
                 where  e.fname=dependent_name and e.sex=sex);


-- Consulta 17: Recupere os números de segurança social de todos os empregados que trabalham em números de projetos 1, 2, ou 3.
select distinct essn
from   works_on
where  pno in (1,2,3);


-- Consulta 18: Recupere os nomes de todos os funcionários que não têm um supervisor
select fname,lname
from   employee
where  superssn is null;


-- Consulta 19: Encontre a soma dos salários de todos os funcionários, o salário máximo, o salário mínimo eo salário médio.
select sum(salary),max(salary),min(salary),avg(salary)
from   employee


-- Consulta 20: Encontre a soma dos salários de todos os funcionários do departamento de pesquisa, bem como o salário máximo, o salário mínimo, eo salário médio neste departamento.
select sum(salary),max(salary),min(salary),avg(salary)
from   employee, department
where  dno=dnumber and dname='Research';


-- Consulta 21: Recuperar o número total de empregados na empresa.
select count(*)
from   employee;



-- Consulta 22: Recuperar o número total de funcionários no departamento de Research.
select count(*)
from   employee,department
where  dno=dnumber and dname='Research';


-- Consulta 23: Contar o número de valores distintos de salário no banco de dados.
select count(distinct salary)
from   employee;



-- Consulta 24: Para cada departamento, recuperar o número do departamento, o número de funcionários do departamento, e sua média salarial
select dno,count(*),avg(salary)
from   employee
group by dno;


-- Consulta 25: Para cada projeto, recupere o número do projeto, o nome do projeto eo número de funcionários que trabalham no projeto.
select pnumber,pname,count(*)
from   project,works_on
where  pnumber=pno
group by pnumber,pname;


-- Consulta 26: Para cada projeto em que mais de dois funcionários a trabalhar, recuperar o número do projeto, o nome do projeto eo número de funcionários que trabalham no projeto.
select pnumber,pname,count(*)
from   project,works_on
where  pnumber=pno
group by pnumber,pname
having count(*)>2;


-- Consulta 27: Para cada projeto, recupere o número do projeto, o nome do projeto e do número de empregados do departamento 5 que trabalham no projeto.
select pnumber,pname,count(*)
from   project,works_on,employee
where  pnumber=pno and ssn=essn and dno=5
group by pnumber,pname;


-- Consulta 28: Para cada departamento que tenha mais de cinco empregados, recuperar o número do departamento eo número de seus funcionários que estão fazendo mais de US $ 40.000.
select dnumber,count(*)
from   department,employee
where  dnumber=dno and salary>40000 and 
  dno in (select dno from employee group by dno having count(*)>5)
group by dnumber;
