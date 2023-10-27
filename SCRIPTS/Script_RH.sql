# Comandos SQL para criar database BD_RH no MySQL e preencher os dados nas tabelas do database

drop database if exists BD_RH;

create database BD_RH;

use BD_RH;

create table Administrador
(
   Cod_Func             int not null,
   Des_CRA              varchar(20) not null,
   primary key (Cod_Func)
);

create table Cargo
(
   Cod_Cargo            tinyint not null,
   Nom_Cargo            varchar(50) not null,
   Val_Salario_Base     decimal(18,2),
   primary key (Cod_Cargo)
);

create table Departamento
(
   Cod_Departamento     int not null,
   Nom_Departamento     varchar(30) not null,
   Cod_Func_Gerente     int,
   Dta_Inicio_Gerente   date,
   Val_Gratificacao_Gerente decimal(18,2),
   primary key (Cod_Departamento)
);

create table Dependente
(
   Cod_Dependente       int not null auto_increment,
   Cod_Func             int not null,
   Nom_Dependente       varchar(50) not null,
   Dta_Nascimento       date,
   Des_Sexo             char(1),
   primary key (Cod_Dependente)
);

create table Engenheiro
(
   Cod_Func             int not null,
   Des_CREA             varchar(30) not null,
   primary key (Cod_Func)
);

create table Formacao_Escolar
(
   Cod_Formacao         tinyint not null,
   Nom_Formacao         varchar(50) not null,
   primary key (Cod_Formacao)
);

create table Funcionario
(
   Cod_Func             int not null,
   Nom_Func             varchar(50) not null,
   Des_Endereco         varchar(100),
   Des_Num_Telefone     varchar(20),
   Dta_Nascimento       date,
   Dta_Demissao         date,
   Dta_Admissao         date,
   Val_Salario          decimal(18,2),
   Num_Total_Dependentes tinyint,
   Cod_Cargo            tinyint,
   Dta_Inicio_Cargo     date,
   Cod_Formacao         tinyint,
   Cod_Func_Supervisor  int,
   primary key (Cod_Func)
);

create table Lotacao
(
   Cod_Lotacao          int not null auto_increment,
   Cod_Func             int not null,
   Cod_Departamento     int not null,
   Dta_Inicio_Lotacao   date not null,
   Dta_Fim_Lotacao      date,
   primary key (Cod_Lotacao)
);

create table Parametros
(
   Cod_Parametro        int not null,
   Nom_Empresa          char(50) not null,
   Des_CNPJ             char(20) not null,
   Val_Salario_Minimo   decimal(18,2),
   primary key (Cod_Parametro)
);

create table Pedido
(
   Cod_Pedido           int not null,
   Val_Total_Pedido     decimal(18,2) not null,
   Dta_Pedido           datetime,
   Cod_Func             int,
   primary key (Cod_Pedido)
);

create table Pedido_Itens
(
   Cod_Pedido_Itens     int not null auto_increment,
   Cod_Produto          int not null,
   Cod_Pedido           int not null,
   Num_Quantidade       int not null,
   Val_Preco_Pago       decimal(18,2) not null,
   primary key (Cod_Pedido_Itens)
);

create table Produto
(
   Cod_Produto          int not null,
   Nom_Produto          varchar(50) not null,
   Num_Quantidade_Estoque int not null,
   Val_Preco_Venda      decimal(18,2),
   primary key (Cod_Produto)
);

create table Projeto
(
   Cod_Projeto          int not null,
   Nom_Projeto          varchar(50) not null,
   Dta_Inicio           date not null,
   Dta_Fim              date,
   Cod_Func_Coordenador int,
   primary key (Cod_Projeto)
);

create table Trabalha_Em
(
   Cod_Trabalha_Em      int not null auto_increment,
   Cod_Func             int not null,
   Cod_Projeto          int not null,
   Num_Total_Horas      decimal(7,1),
   primary key (Cod_Trabalha_Em)
);

create table Vendedor
(
   Cod_Func                int not null,
   Num_Percentual_Comissao decimal(3,1),
   primary key (Cod_Func)
);

alter table Administrador add constraint FK_Funcionario_Administrador foreign key (Cod_Func)
      references Funcionario (Cod_Func);

alter table Departamento add constraint FK_Departamento_Gerente foreign key (Cod_Func_Gerente)
      references Administrador (Cod_Func);

alter table Dependente add constraint FK_Funcionario_Dependente foreign key (Cod_Func)
      references Funcionario (Cod_Func) on delete cascade;

alter table Engenheiro add constraint FK_Funcionario_Engenheiro foreign key (Cod_Func)
      references Funcionario (Cod_Func);

alter table Funcionario add constraint FK_Funcionario_Cargo foreign key (Cod_Cargo)
      references Cargo (Cod_Cargo);

alter table Funcionario add constraint FK_Funcionario_Formacao_Escolar foreign key (Cod_Formacao)
      references Formacao_Escolar (Cod_Formacao);

alter table Funcionario add constraint FK_Funcionario_Supervisiona foreign key (Cod_Func_Supervisor)
      references Funcionario (Cod_Func);

alter table Lotacao add constraint FK_Departamento_Lotacao foreign key (Cod_Departamento)
      references Departamento (Cod_Departamento);

alter table Lotacao add constraint FK_Funcionario_Lotacao foreign key (Cod_Func)
      references Funcionario (Cod_Func);

alter table Pedido add constraint FK_Pedido_Vendedor foreign key (Cod_Func)
      references Vendedor (Cod_Func);

alter table Pedido_Itens add constraint FK_Pedido_Pedido_Itens foreign key (Cod_Pedido)
      references Pedido (Cod_Pedido);

alter table Pedido_Itens add constraint FK_Produto_Pedido_Itens foreign key (Cod_Produto)
      references Produto (Cod_Produto);

alter table Projeto add constraint FK_Projeto_Coordenador foreign key (Cod_Func_Coordenador)
      references Administrador (Cod_Func);

alter table Trabalha_Em add constraint FK_Engenheiro_Trabalha_Em foreign key (Cod_Func)
      references Engenheiro (Cod_Func);

alter table Trabalha_Em add constraint FK_Projeto_Trabalha_Em foreign key (Cod_Projeto)
      references Projeto (Cod_Projeto);

alter table Vendedor add constraint FK_Funcionario_Vendedor foreign key (Cod_Func)
      references Funcionario (Cod_Func);

# Insere linhas nas tabelas do database

# Insere Dados na tabela Parametros
INSERT INTO Parametros
(Cod_Parametro,Nom_Empresa,Des_CNPJ,Val_Salario_Minimo) VALUES
(1,'Newton Paiva','11.222.333/0001-81', 1100);

# Insere Dados na tabela Cargo  
INSERT INTO Cargo 
(Cod_Cargo, Nom_Cargo, Val_Salario_Base) VALUES
(1,'Engenheiro', 1890.00);
INSERT INTO Cargo 
(Cod_Cargo, Nom_Cargo, Val_Salario_Base) VALUES
(2,'Administrador', 2780.00);
INSERT INTO Cargo 
(Cod_Cargo, Nom_Cargo, Val_Salario_Base) VALUES
(3,'Secretaria', 498.00);
INSERT INTO Cargo 
(Cod_Cargo, Nom_Cargo, Val_Salario_Base) VALUES
(4,'Analista de Sistemas', 2720.00);
INSERT INTO Cargo 
(Cod_Cargo, Nom_Cargo, Val_Salario_Base) VALUES
(5,'Programador', 830.00);
INSERT INTO Cargo 
(Cod_Cargo, Nom_Cargo, Val_Salario_Base) VALUES
(6,'Vendedor', 810.00);
INSERT INTO Cargo 
(Cod_Cargo, Nom_Cargo, Val_Salario_Base) VALUES
(7,'Pé de Chinelo', 150.00);

# Insere Dados na tabela Formacao_Escolar 
INSERT INTO Formacao_Escolar 
(Cod_Formacao, Nom_Formacao) VALUES
(1,'Ensino Primário');
INSERT INTO Formacao_Escolar VALUES
(2,'Ensino Secundario');
INSERT INTO Formacao_Escolar VALUES
(3,'Ensino Medio');
INSERT INTO Formacao_Escolar VALUES
(4,'Ensino Superior');
INSERT INTO Formacao_Escolar VALUES
(5,'Especialização');
INSERT INTO Formacao_Escolar VALUES
(6,'Mestre');
INSERT INTO Formacao_Escolar VALUES
(7,'Doutor');

# Insere Dados na tabela Funcionario  
INSERT INTO Funcionario
(Cod_Func, Nom_Func, Des_Endereco, Des_Num_Telefone, Dta_Nascimento, Dta_Admissao, Dta_Demissao, 
 Val_Salario, Cod_Cargo, Dta_Inicio_Cargo, Cod_Formacao,  Cod_Func_Supervisor)
 VALUES
(1, 'Iremar Nunes de Lima', 'Rua Quebec 145 João Pinheiro BH',
 '31-33750956', '1969-01-05', '1998-02-01', NULL, 
  17670, 4, '2009-02-01', 6, NULL);

INSERT INTO Funcionario
(Cod_Func, Nom_Func, Des_Endereco, Des_Num_Telefone, Dta_Nascimento, Dta_Admissao, Dta_Demissao, 
 Val_Salario, Cod_Cargo, Dta_Inicio_Cargo, Cod_Formacao,  Cod_Func_Supervisor)
 VALUES
(2, 'Renata Almeida Silva', 'Rua Quebec 145 João Pinheiro BH',
 '31-34094567', '1955-01-25', '1999-07-13', NULL, 
  2480, 1, '1999-01-17', 4, 1);

INSERT INTO Funcionario
(Cod_Func, Nom_Func, Des_Endereco, Des_Num_Telefone, Dta_Nascimento, Dta_Admissao, Dta_Demissao, 
 Val_Salario, Cod_Cargo, Dta_Inicio_Cargo, Cod_Formacao,  Cod_Func_Supervisor)
 VALUES
(3, 'José Rodrigues da Paixão', 'Av. Antônio Cargolos 2389 BH',
 '31-54343278', '1967-06-27', '2001-03-18', NULL, 
  930, 5, '1998-12-18', 3, 1);

INSERT INTO Funcionario
(Cod_Func, Nom_Func, Des_Endereco, Des_Num_Telefone, Dta_Nascimento, Dta_Admissao, Dta_Demissao, 
 Val_Salario, Cod_Cargo, Dta_Inicio_Cargo, Cod_Formacao,  Cod_Func_Supervisor)
 VALUES
(4, 'Ana Maria Petronilho', 'Av. Afonso Pena 383 BH',
 '31-34983432', '1970-03-19', '2009-07-13', NULL, 
  798, 3, '2001-09-16', 4, 3);

INSERT INTO Funcionario
(Cod_Func, Nom_Func, Des_Endereco, Des_Num_Telefone, Dta_Nascimento, Dta_Admissao, Dta_Demissao, 
 Val_Salario, Cod_Cargo, Dta_Inicio_Cargo, Cod_Formacao,  Cod_Func_Supervisor)
 VALUES
(5, 'Geraldo Almeida dos Santos', 'Rua Barão do Bareri 945 BH',
 '31-91190997', '1965-08-26', '1999-08-16', '2001-07-23', 
  1890, 4, '1999-11-20', 2, NULL);

INSERT INTO Funcionario
(Cod_Func, Nom_Func, Des_Endereco, Des_Num_Telefone, Dta_Nascimento, Dta_Admissao, Dta_Demissao, 
 Val_Salario, Cod_Cargo, Dta_Inicio_Cargo, Cod_Formacao,  Cod_Func_Supervisor)
 VALUES
(6, 'Maurício Sales Santos', 'Rua Apaendi 564 Nova Lima',
 '31-98654332', '1960-12-22', '2001-12-23', NULL, 
  2280, 1, '2011-11-25', 3, NULL);

INSERT INTO Funcionario
(Cod_Func, Nom_Func, Des_Endereco, Des_Num_Telefone, Dta_Nascimento, Dta_Admissao, Dta_Demissao, 
 Val_Salario, Cod_Cargo, Dta_Inicio_Cargo, Cod_Formacao,  Cod_Func_Supervisor)
 VALUES
(7, 'Maria Antônia Oliveira', 'Rua Emiliano Franklin 639 Contagem',
 '31-9867663', '1972-02-14', '2009-03-19', NULL, 
  2880, 1, '2009-09-23', 7, 6);

INSERT INTO Funcionario
(Cod_Func, Nom_Func, Des_Endereco, Des_Num_Telefone, Dta_Nascimento, Dta_Admissao, Dta_Demissao, 
 Val_Salario, Cod_Cargo, Dta_Inicio_Cargo, Cod_Formacao,  Cod_Func_Supervisor)
 VALUES
(8, 'Beatriz Rodrigues Oliveira', 'Rua Itaquera 387/213 BH',
 '31-34442487', '1967-11-28', '2001-06-30', NULL, 
  2280, 1, '2001-12-21' , 3, 6);

INSERT INTO Funcionario
(Cod_Func, Nom_Func, Des_Endereco, Des_Num_Telefone, Dta_Nascimento, Dta_Admissao, Dta_Demissao, 
 Val_Salario, Cod_Cargo, Dta_Inicio_Cargo, Cod_Formacao,  Cod_Func_Supervisor)
 VALUES
(9, 'Antônio Teixeira Pannel', 'Rua Ipanema 07 BH',
 '31-34136966', '1959-04-24', '1998-01-21', NULL, 
  3270, 2, '1999-05-16' , 3, 7);

INSERT INTO Funcionario
(Cod_Func, Nom_Func, Des_Endereco, Des_Num_Telefone, Dta_Nascimento, Dta_Admissao, Dta_Demissao, 
 Val_Salario, Cod_Cargo, Dta_Inicio_Cargo, Cod_Formacao,  Cod_Func_Supervisor)
 VALUES
(10, 'Lucas Silva de Lima', 'Rua Jequiá 298 BH',
 '31-31500090', '1975-10-26', '2001-06-29', NULL, 
  2680, 1, '2001-06-23' , 6, 3);

INSERT INTO Funcionario
(Cod_Func, Nom_Func, Des_Endereco, Des_Num_Telefone, Dta_Nascimento, Dta_Admissao, Dta_Demissao, 
 Val_Salario, Cod_Cargo, Dta_Inicio_Cargo, Cod_Formacao,  Cod_Func_Supervisor)
 VALUES
(11, 'Manuel Costa Porto', 'Av. Olegário Maciel 456 BH',
 '31-34919030', '1977-12-25', '2009-08-19', '2001-08-27' , 
  2480, 1, '2009-03-18' , 4, NULL);

INSERT INTO Funcionario
(Cod_Func, Nom_Func, Des_Endereco, Des_Num_Telefone, Dta_Nascimento, Dta_Admissao, Dta_Demissao, 
 Val_Salario, Cod_Cargo, Dta_Inicio_Cargo, Cod_Formacao,  Cod_Func_Supervisor)
 VALUES
(12, 'Adriana Vaz de Mello', 'Rua Senador Amaral 187/432 BH',
 '31-34817575', '1971-11-29', '1999-09-24', NULL , 
  898, 3, '2001-11-17' , 5, 4);

INSERT INTO Funcionario
(Cod_Func, Nom_Func, Des_Endereco, Des_Num_Telefone, Dta_Nascimento, Dta_Admissao, Dta_Demissao, 
 Val_Salario, Cod_Cargo, Dta_Inicio_Cargo, Cod_Formacao,  Cod_Func_Supervisor)
 VALUES
(13, 'Giovani Braz Ferraz', 'Rua Arthur da Távola 567/62 BH',
 '31-30938998', '1956-08-14', '1993-11-30', NULL , 
  2590.89, 4, '2009-01-23' , 7,NULL);

INSERT INTO Funcionario
(Cod_Func, Nom_Func, Des_Endereco, Des_Num_Telefone, Dta_Nascimento, Dta_Admissao, Dta_Demissao, 
 Val_Salario, Cod_Cargo, Dta_Inicio_Cargo, Cod_Formacao,  Cod_Func_Supervisor)
 VALUES
(14, 'Luiz Freitas Figueiredo', 'Rua Marte 98 BH',
 '31-30947576', '1976-06-21', '1999-03-29', NULL , 
  710.00, 6, '1999-09-22' , 1, 13 );

INSERT INTO Funcionario
(Cod_Func, Nom_Func, Des_Endereco, Des_Num_Telefone, Dta_Nascimento, Dta_Admissao, Dta_Demissao, 
 Val_Salario, Cod_Cargo, Dta_Inicio_Cargo, Cod_Formacao,  Cod_Func_Supervisor)
 VALUES
(15, 'Josef Brindick leão', 'Rua Osama Bin Lader 876 SP',
 '31-35993234', '1973-03-23', '2001-04-28', NULL , 
  2680, 1, '2001-05-13' , 6, 6 );

INSERT INTO Funcionario
(Cod_Func, Nom_Func, Des_Endereco, Des_Num_Telefone, Dta_Nascimento, Dta_Admissao, Dta_Demissao, 
 Val_Salario, Cod_Cargo, Dta_Inicio_Cargo, Cod_Formacao,  Cod_Func_Supervisor)
 VALUES
(16, 'Bill Gates', 'Rua do Broklin 876/443 EUA',
 '55-12345688', '1960-07-16', '2001-04-28', '2001-05-18' , 
  810.00, 6, '2001-04-18' , 2, 1);

INSERT INTO Funcionario
(Cod_Func, Nom_Func, Des_Endereco, Des_Num_Telefone, Dta_Nascimento, Dta_Admissao, Dta_Demissao, 
 Val_Salario, Cod_Cargo, Dta_Inicio_Cargo, Cod_Formacao,  Cod_Func_Supervisor)
 VALUES
(17, 'João Nada Faz', NULL,
 NULL, NULL, NULL, NULL , 
 NULL, NULL, NULL, NULL, NULL);

# Atualiza o salario de todos os funcionarios com salario atual inferior ao valor do salario mínimo
UPDATE Funcionario
SET Val_Salario = (SELECT Val_Salario_Minimo FROM Parametros)
WHERE Val_Salario < (SELECT Val_Salario_Minimo FROM Parametros);

# Insere Dados na tabela Administrador  
INSERT INTO Administrador
(Cod_Func, Des_CRA) VALUES
(6, '24797657');

INSERT INTO Administrador
(Cod_Func, Des_CRA) VALUES
(7, '84745666');

INSERT INTO Administrador
(Cod_Func, Des_CRA) VALUES
(1, '56483000');

INSERT INTO Administrador
(Cod_Func, Des_CRA) VALUES
(12, '20355567');

INSERT INTO Administrador
(Cod_Func, Des_CRA) VALUES
(16, '32765906');

# Insere Dados na tabela Departamento  

INSERT INTO Departamento
(Cod_Departamento, Nom_Departamento, Cod_Func_Gerente, Dta_Inicio_Gerente, Val_Gratificacao_Gerente) VALUES
(1, 'Engenharia e Produção',  6, '2001-01-24', 290);
INSERT INTO Departamento
(Cod_Departamento, Nom_Departamento, Cod_Func_Gerente, Dta_Inicio_Gerente, Val_Gratificacao_Gerente) VALUES
(2, 'Tecnologia e Informação', 1, '2009-09-23', 370);

INSERT INTO Departamento
(Cod_Departamento, Nom_Departamento, Cod_Func_Gerente, Dta_Inicio_Gerente, Val_Gratificacao_Gerente) VALUES
(3, 'Administração BD_Pessoal',  7, '2001-07-17',400);

INSERT INTO Departamento
(Cod_Departamento, Nom_Departamento, Cod_Func_Gerente, Dta_Inicio_Gerente, Val_Gratificacao_Gerente) VALUES
(4, 'Recursos Humanos',  NULL, NULL ,NULL);

# Insere Dados na tabela Projeto  
INSERT INTO Projeto
( Cod_Projeto, Nom_Projeto, Dta_Inicio, Dta_Fim, Cod_Func_Coordenador) VALUES
(1, 'Construção de Tucuruí', '2009-01-13', NULL, 6);

INSERT INTO Projeto
( Cod_Projeto, Nom_Projeto, Dta_Inicio, Dta_Fim, Cod_Func_Coordenador) VALUES
(2, 'Construção do Prédio Tamanduá', '2001-09-15', NULL, 7);

INSERT INTO Projeto
( Cod_Projeto, Nom_Projeto, Dta_Inicio, Dta_Fim, Cod_Func_Coordenador) VALUES
(3, 'Desenvolvimento do Sistema SPD ', '2009-03-23', '2004-11-20', NULL);

INSERT INTO Projeto
( Cod_Projeto, Nom_Projeto, Dta_Inicio, Dta_Fim, Cod_Func_Coordenador) VALUES
(4, 'Implantação da Qualidade Total', '1999-01-14', NULL, 12);

INSERT INTO Projeto
( Cod_Projeto, Nom_Projeto, Dta_Inicio, Dta_Fim, Cod_Func_Coordenador) VALUES
(5, 'Desenvolvimento Sistema Gestão', '2009-09-27', NULL, 1);

INSERT INTO Projeto
( Cod_Projeto, Nom_Projeto, Dta_Inicio, Dta_Fim, Cod_Func_Coordenador) VALUES
(6, 'DNA e SMPB Corrupção', '2005-04-24', NULL, NULL);

# Insere Dados na tabela Lotacao  
INSERT INTO Lotacao
(Cod_Func, Cod_Departamento, Dta_Inicio_Lotacao, Dta_Fim_Lotacao) VALUES
(1, 2, '2009-04-21', NULL );

INSERT INTO Lotacao
(Cod_Func, Cod_Departamento, Dta_Inicio_Lotacao, Dta_Fim_Lotacao) VALUES
(2, 1, '2001-06-16', NULL );

INSERT INTO Lotacao
(Cod_Func, Cod_Departamento, Dta_Inicio_Lotacao, Dta_Fim_Lotacao) VALUES
(3, 2, '2001-08-16', NULL );

INSERT INTO Lotacao
(Cod_Func, Cod_Departamento, Dta_Inicio_Lotacao, Dta_Fim_Lotacao) VALUES
(4, 3, '2009-09-15', NULL );

INSERT INTO Lotacao
(Cod_Func, Cod_Departamento, Dta_Inicio_Lotacao, Dta_Fim_Lotacao) VALUES
(5, 2, '1999-12-21', NULL );

INSERT INTO Lotacao
(Cod_Func, Cod_Departamento, Dta_Inicio_Lotacao, Dta_Fim_Lotacao) VALUES
(6, 1, '2009-09-24', NULL );

INSERT INTO Lotacao
(Cod_Func, Cod_Departamento, Dta_Inicio_Lotacao, Dta_Fim_Lotacao) VALUES
(7, 1, '2009-12-16', NULL );

INSERT INTO Lotacao
(Cod_Func, Cod_Departamento, Dta_Inicio_Lotacao, Dta_Fim_Lotacao) VALUES
(8, 1, '1999-07-19', NULL );

INSERT INTO Lotacao
(Cod_Func, Cod_Departamento, Dta_Inicio_Lotacao, Dta_Fim_Lotacao) VALUES
(9, 4, '1987-01-17', '2009-01-27' );

INSERT INTO Lotacao
(Cod_Func, Cod_Departamento, Dta_Inicio_Lotacao, Dta_Fim_Lotacao) VALUES
(9, 3, '2009-02-27', NULL );

INSERT INTO Lotacao
(Cod_Func, Cod_Departamento, Dta_Inicio_Lotacao, Dta_Fim_Lotacao) VALUES
(10, 1, '2001-04-09', NULL );

INSERT INTO Lotacao
(Cod_Func, Cod_Departamento, Dta_Inicio_Lotacao, Dta_Fim_Lotacao) VALUES
(11, 1, '2009-11-27', NULL );

INSERT INTO Lotacao
(Cod_Func, Cod_Departamento, Dta_Inicio_Lotacao, Dta_Fim_Lotacao) VALUES
(12, 1, '1991-12-17', '1999-10-19' );
INSERT INTO Lotacao
(Cod_Func, Cod_Departamento, Dta_Inicio_Lotacao, Dta_Fim_Lotacao) VALUES
(12, 3, '1999-10-19', NULL );

INSERT INTO Lotacao
(Cod_Func, Cod_Departamento, Dta_Inicio_Lotacao, Dta_Fim_Lotacao) VALUES
(13, 2, '2009-09-15', NULL );

INSERT INTO Lotacao
(Cod_Func, Cod_Departamento, Dta_Inicio_Lotacao, Dta_Fim_Lotacao) VALUES
(13, 3, '1999-06-15', '2009-09-14' );

INSERT INTO Lotacao
(Cod_Func, Cod_Departamento, Dta_Inicio_Lotacao, Dta_Fim_Lotacao) VALUES
(14, 1, '2009-06-18', NULL );

INSERT INTO Lotacao
(Cod_Func, Cod_Departamento, Dta_Inicio_Lotacao, Dta_Fim_Lotacao) VALUES
(15, 2, '1999-02-12', '2009-06-15' );

INSERT INTO Lotacao
(Cod_Func, Cod_Departamento, Dta_Inicio_Lotacao, Dta_Fim_Lotacao) VALUES
(15, 1, '2009-06-04', NULL );

# Insere Dados na tabela Engenheiro 
 
INSERT INTO Engenheiro
( Cod_Func, Des_CREA) VALUES
(2, '84845790');

INSERT INTO Engenheiro
( Cod_Func, Des_CREA) VALUES
(6, '97474766');

INSERT INTO Engenheiro
( Cod_Func, Des_CREA) VALUES
(7, '09646478');

INSERT INTO Engenheiro
( Cod_Func, Des_CREA) VALUES
(8, '90988221');

INSERT INTO Engenheiro
( Cod_Func, Des_CREA) VALUES
(10, '94747656');

INSERT INTO Engenheiro
( Cod_Func, Des_CREA) VALUES
(11, '97474699');

INSERT INTO Engenheiro
( Cod_Func, Des_CREA) VALUES
(15, '97474651');

# Insere Dados na tabela Trabalha_Em  

INSERT INTO Trabalha_Em 
(Cod_Func,Cod_Projeto,Num_Total_Horas) VALUES
(2,2, 17);

INSERT INTO Trabalha_Em 
(Cod_Func,Cod_Projeto,Num_Total_Horas) VALUES
(6,2, 11);

INSERT INTO Trabalha_Em 
(Cod_Func,Cod_Projeto,Num_Total_Horas) VALUES
(7,1, 9);

INSERT INTO Trabalha_Em 
(Cod_Func,Cod_Projeto,Num_Total_Horas) VALUES
(7,2, 15);

INSERT INTO Trabalha_Em 
(Cod_Func,Cod_Projeto,Num_Total_Horas) VALUES
(8,2, 12);

INSERT INTO Trabalha_Em 
(Cod_Func,Cod_Projeto,Num_Total_Horas) VALUES
(10,2, 13);

INSERT INTO Trabalha_Em 
(Cod_Func,Cod_Projeto,Num_Total_Horas) VALUES
(10,1, 77);

INSERT INTO Trabalha_Em 
(Cod_Func,Cod_Projeto,Num_Total_Horas) VALUES
(11,1, 90);

# Insere Dados na tabela Dependente  

INSERT INTO Dependente 
(Cod_Func, Nom_Dependente, Dta_Nascimento,Des_Sexo) VALUES
(2, 'Beatriz Lima', '1975-11-04/','F');

INSERT INTO Dependente 
(Cod_Func, Nom_Dependente, Dta_Nascimento,Des_Sexo) VALUES
(2, 'Lucas Lima', '1999-10-04/15','M');

INSERT INTO Dependente 
(Cod_Func, Nom_Dependente, Dta_Nascimento,Des_Sexo) VALUES
(4, 'Samuel Vieira', '1945-11-18','M');

INSERT INTO Dependente 
(Cod_Func, Nom_Dependente, Dta_Nascimento,Des_Sexo) VALUES
(4, 'Renata Vieira', '1948-12-16','F');

INSERT INTO Dependente 
(Cod_Func, Nom_Dependente, Dta_Nascimento,Des_Sexo) VALUES
(4, 'Luciana Almeida', '2005-11-20','F');

INSERT INTO Dependente 
(Cod_Func, Nom_Dependente, Dta_Nascimento,Des_Sexo) VALUES
(7, 'Mariza', '1976-11-08','F');

INSERT INTO Dependente 
(Cod_Func, Nom_Dependente, Dta_Nascimento,Des_Sexo) VALUES
(9, 'Jose Figueira', '2001-02-09','M');

INSERT INTO Dependente 
(Cod_Func, Nom_Dependente, Dta_Nascimento,Des_Sexo) VALUES
(10, 'Beatriz Alvarenga', '2009-10-14','F');

INSERT INTO Dependente 
(Cod_Func, Nom_Dependente, Dta_Nascimento,Des_Sexo) VALUES
(13, 'Elias Samurai', '2001-11-07','M');

# Atualiza o Atributo TotalDependete para o valor correto

UPDATE Funcionario F
SET F.Num_Total_Dependentes = (SELECT COUNT(1) FROM dependente D WHERE D.Cod_Func = F.Cod_Func);

# Insere Dados na tabela Vendedor  

INSERT INTO Vendedor
(Cod_Func, Num_Percentual_Comissao) VALUES
(2, 2.2);

INSERT INTO Vendedor
(Cod_Func, Num_Percentual_Comissao) VALUES (4, 1.8);

INSERT INTO Vendedor
(Cod_Func, Num_Percentual_Comissao) VALUES (6, 4.3);

INSERT INTO Vendedor
(Cod_Func, Num_Percentual_Comissao) VALUES
(8, 6.1);

INSERT INTO Vendedor
(Cod_Func, Num_Percentual_Comissao) VALUES
(10, 3.7);

INSERT INTO Vendedor
(Cod_Func, Num_Percentual_Comissao) VALUES
(12, 5.9);

INSERT INTO Vendedor
(Cod_Func, Num_Percentual_Comissao) VALUES
(14, 3);

# Insere Dados na tabela Produto

INSERT INTO Produto
(Cod_Produto, Nom_Produto, Num_Quantidade_Estoque, Val_Preco_Venda) VALUES
(1, 'Produto 1', 20, 240.00);

INSERT INTO Produto
( Cod_Produto, Nom_Produto, Num_Quantidade_Estoque, Val_Preco_Venda) VALUES
(2, 'Produto 2', 38, 42.00);

INSERT INTO Produto
(Cod_Produto, Nom_Produto, Num_Quantidade_Estoque, Val_Preco_Venda) VALUES
(3, 'Produto 3', 5, 3242.70);

INSERT INTO Produto
(Cod_Produto, Nom_Produto, Num_Quantidade_Estoque, Val_Preco_Venda) VALUES
(4, 'Produto 4',12, 842.34);

INSERT INTO Produto
(Cod_Produto, Nom_Produto, Num_Quantidade_Estoque, Val_Preco_Venda) VALUES
(5, 'Produto 5',36, 46.10);

INSERT INTO Produto
(Cod_Produto, Nom_Produto, Num_Quantidade_Estoque, Val_Preco_Venda) VALUES
(6, 'Produto 6',23, 98.62);

INSERT INTO Produto
(Cod_Produto, Nom_Produto, Num_Quantidade_Estoque, Val_Preco_Venda) VALUES
(7, 'Produto 7',13, 133.51);

INSERT INTO Produto
(Cod_Produto, Nom_Produto, Num_Quantidade_Estoque, Val_Preco_Venda) VALUES
(8, 'Produto 8',7, 799.90);

INSERT INTO Produto
(Cod_Produto, Nom_Produto, Num_Quantidade_Estoque, Val_Preco_Venda) VALUES
(9, 'Produto 9',19, 1899.00);

INSERT INTO Produto
(Cod_Produto, Nom_Produto, Num_Quantidade_Estoque, Val_Preco_Venda) VALUES
(10, 'Produto 10',39, 28.30);

INSERT INTO Produto
(Cod_Produto, Nom_Produto, Num_Quantidade_Estoque, Val_Preco_Venda) VALUES
(11, 'Produto 11',3 , 570.90);

# Insere Dados na tabela Pedido e Itens
INSERT INTO Pedido
(Cod_Pedido, Val_Total_Pedido, Dta_Pedido, Cod_Func) VALUES
(1,161.90 , '2020-01-13' , 4);

INSERT INTO Pedido_Itens
(Cod_Pedido, Cod_Produto, Num_Quantidade, Val_Preco_Pago) VALUES
(1, 5, 3, 120.90);

INSERT INTO Pedido_Itens
(Cod_Pedido, Cod_Produto, Num_Quantidade, Val_Preco_Pago) VALUES
(1, 2, 1, 41);

INSERT INTO Pedido
(Cod_Pedido, Val_Total_Pedido, Dta_Pedido, Cod_Func) VALUES
(2, 799.90 , '2020-02-23' , 6);

INSERT INTO Pedido_Itens
(Cod_Pedido, Cod_Produto, Num_Quantidade, Val_Preco_Pago) VALUES
(2, 8, 1, 799.90);

INSERT INTO Pedido
(Cod_Pedido, Val_Total_Pedido, Dta_Pedido, Cod_Func) VALUES
(3, 181.9 , '2020-11-16', 8);

INSERT INTO Pedido_Itens
(Cod_Pedido, Cod_Produto, Num_Quantidade, Val_Preco_Pago) VALUES
(3, 7, 1, 127.90);

INSERT INTO Pedido_Itens
(Cod_Pedido, Cod_Produto, Num_Quantidade, Val_Preco_Pago) VALUES
(3, 10, 2, 27.00 );

INSERT INTO Pedido
(Cod_Pedido, Val_Total_Pedido, Dta_Pedido, Cod_Func) VALUES
(4, 2643.16 , '2019-11-16', 10 );

INSERT INTO Pedido_Itens
(Cod_Pedido, Cod_Produto, Num_Quantidade, Val_Preco_Pago) VALUES
(4, 1, 2, 240 );

INSERT INTO Pedido_Itens
(Cod_Pedido, Cod_Produto, Num_Quantidade, Val_Preco_Pago) VALUES
(4, 7, 4, 534.04 );

INSERT INTO Pedido_Itens
(Cod_Pedido, Cod_Produto, Num_Quantidade, Val_Preco_Pago) VALUES
(4, 10, 1, 27.00 );

INSERT INTO Pedido
(Cod_Pedido, Val_Total_Pedido, Dta_Pedido, Cod_Func) VALUES
(5, 2440.15, '2019-10-16', 12 );

INSERT INTO Pedido_Itens
(Cod_Pedido, Cod_Produto, Num_Quantidade, Val_Preco_Pago) VALUES
(5, 7, 3, 400.53 );

INSERT INTO Pedido_Itens
(Cod_Pedido, Cod_Produto, Num_Quantidade, Val_Preco_Pago) VALUES
(5, 9, 1, 1899 );

INSERT INTO Pedido_Itens
(Cod_Pedido, Cod_Produto, Num_Quantidade, Val_Preco_Pago) VALUES
(5, 2, 1, 42 );

INSERT INTO Pedido_Itens
(Cod_Pedido, Cod_Produto, Num_Quantidade, Val_Preco_Pago) VALUES
(5, 6, 1, 98.62 );

INSERT INTO Pedido
(Cod_Pedido, Val_Total_Pedido, Dta_Pedido, Cod_Func) VALUES
(6, 267.02, '2020-02-16', 2 );

INSERT INTO Pedido_Itens
(Cod_Pedido, Cod_Produto, Num_Quantidade, Val_Preco_Pago) VALUES
(6, 7, 2, 267.02 );

INSERT INTO Pedido
(Cod_Pedido, Val_Total_Pedido, Dta_Pedido, Cod_Func) VALUES
(7, 210, '2020-05-15', 4 );

INSERT INTO Pedido_Itens
( Cod_Pedido, Cod_Produto, Num_Quantidade, Val_Preco_Pago) VALUES
(7, 2, 5, 210 );

INSERT INTO Pedido
(Cod_Pedido, Val_Total_Pedido, Dta_Pedido, Cod_Func) VALUES
(8, 394.48, '2019-02-15', 8 );

INSERT INTO Pedido_Itens
(Cod_Pedido, Cod_Produto, Num_Quantidade, Val_Preco_Pago) VALUES
(8, 6, 4, 394.48 );

INSERT INTO Pedido
(Cod_Pedido, Val_Total_Pedido, Dta_Pedido, Cod_Func) VALUES
(9, 324.9, '2020-01-22', 8 );

INSERT INTO Pedido_Itens
(Cod_Pedido, Cod_Produto, Num_Quantidade, Val_Preco_Pago) VALUES
(9, 1, 1, 240 );

INSERT INTO Pedido_Itens
(Cod_Pedido, Cod_Produto, Num_Quantidade, Val_Preco_Pago) VALUES
(9, 10, 3, 84.90 );

# Atualiza o Atributo Val_Preco_Pago da tabel Pedido para o valor correto

UPDATE Pedido P
SET P.Val_Total_Pedido = (SELECT SUM(PI.Num_Quantidade * PI.Val_Preco_Pago) 
FROM Pedido_Itens PI WHERE PI.Cod_Pedido = P.Cod_Pedido);


