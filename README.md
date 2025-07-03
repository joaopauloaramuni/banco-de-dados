-----

<img alt="newtonpaiva" src="https://joaopauloaramuni.github.io/image/newton-logo2.png?raw=true"/>

-----

# Repo Banco de Dados

Disciplina dos cursos de Ciência da Computação, Sistemas de Informação e Análise e Desenvolvimento de Sistemas do Centro Universitário Newton Paiva

- 2°Sem 2023

-----

### Sumário:
- [Aulas em PDF](https://github.com/joaopauloaramuni/banco-de-dados/tree/main/PDF)
- [Modelos Conceituais e Lógicos](https://github.com/joaopauloaramuni/banco-de-dados/tree/main/MODELOS%20CONCEITUAIS%20E%20LO%CC%81GICOS)
- [Listas](https://github.com/joaopauloaramuni/banco-de-dados/tree/main/LISTAS)
- [Scripts](https://github.com/joaopauloaramuni/banco-de-dados/tree/main/SCRIPTS)
- [Backup BD](https://github.com/joaopauloaramuni/banco-de-dados/tree/main/BACKUP%20BD)

#### Links úteis:

##### 🧰 Ferramentas de Diagramação e Design
- 🧩 [Draw.io (Modelagem Visual)](https://www.drawio.com/)
- 🎨 [Figma Templates](https://www.figma.com/pt-br/templates/)
- 🗂️ [DBDiagram (Modelagem de Banco de Dados)](https://dbdiagram.io/home)

-----

##### 🗃️ Sistemas de Gerenciamento de Bancos de Dados (SGBDs)

###### 💻 Ferramentas de Acesso e Administração
- 🐬 [DBeaver (Client SQL Universal)](https://dbeaver.io/download/)

###### 💾 Relacionais (SQL)
Esses bancos utilizam linguagem estruturada (SQL) para manipular dados relacionais organizados em tabelas.

**🐘 PostgreSQL**
- 🌐 [Site Oficial - PostgreSQL](https://www.postgresql.org/)
- 📥 [Download do PostgreSQL](https://www.enterprisedb.com/downloads/postgres-postgresql-downloads)

**🧱 SQLite**
- 🌐 [Site Oficial - SQLite](https://www.sqlite.org/index.html)
- 📚 [Documentação Oficial - SQLite](https://www.sqlite.org/docs.html)

###### 🍃 Não Relacional (NoSQL)
Bancos de dados orientados a documentos, chave-valor ou grafos, mais flexíveis para dados semi-estruturados.

**🍃 MongoDB**
- 🌐 [MongoDB Community Server - Download](https://www.mongodb.com/try/download/community)
- 🧭 [MongoDB Compass (Interface Gráfica)](https://www.mongodb.com/products/tools/compass)

-----

##### 📚 Livros Recomendados

- **📘 ["Sistema de Banco de Dados" — Abraham Silberschatz, Henry Korth, S. Sudarshan](https://www.amazon.com.br/Sistema-Banco-Dados-Abraham-SILBERSCHATZ/dp/8595157332)**  
  Um clássico da área, amplamente usado em cursos de graduação. Cobre fundamentos, modelagem, SQL, transações, processamento de consultas e muito mais.

- **📗 ["Livro Projeto de Banco de Dados" — Carlos A. Heuser (Clube de Autores)](https://www.amazon.com.br/Clube-Autores-Livro-Projeto-Banco/dp/6501222109)**  
  Livro nacional focado em modelagem conceitual e projeto de bancos de dados relacionais. Didático e com muitos exemplos práticos.

-----

##### 📜 Scripts de exemplo
- :octocat: [Scripts de Banco de Dados no GitHub](https://github.com/joaopauloaramuni/banco-de-dados/tree/main/SCRIPTS)

-----

##### 📜 Comandos úteis

```sql
-- 📌 Criação de tabela com chave primária
CREATE TABLE [NOME_TABELA] (
    [COLUNA1] TIPO NOT NULL,
    [COLUNA2] TIPO,
    ...
    CONSTRAINT [PK_NOME_TABELA] PRIMARY KEY ([COLUNA1])
);
-- Cria uma nova tabela com colunas e define a chave primária

-- 🔐 Criação de índice único
CREATE UNIQUE INDEX [IPK_NOME_TABELA] ON [NOME_TABELA]([COLUNA]);
-- Cria um índice que garante unicidade na coluna e melhora performance de busca

-- 📥 Inserção de dados
INSERT INTO NOME_TABELA (COLUNA1, COLUNA2, ...) 
VALUES (VALOR1, VALOR2, ...);
-- Insere um novo registro na tabela

-- 🔍 Consulta simples com filtro
SELECT * FROM TABELA WHERE COLUNA LIKE '%VALOR%';
-- Filtra registros que contenham o valor indicado

-- ✏️ Atualização de dados
UPDATE NOME_TABELA SET COLUNA = NOVO_VALOR WHERE CONDICAO;
-- Altera dados existentes com base em uma condição

-- ❌ Exclusão de registros
DELETE FROM NOME_TABELA WHERE CONDICAO;
-- Remove registros da tabela que satisfaçam a condição

-- 🔗 INNER JOIN: registros com correspondência em ambas as tabelas
SELECT A.COLUNA, B.COLUNA
FROM TABELA_A A
INNER JOIN TABELA_B B ON A.CHAVE = B.CHAVE;
-- Retorna dados apenas onde há correspondência entre as tabelas

-- 🔗 LEFT JOIN: todos da esquerda + correspondentes da direita
SELECT A.COLUNA, B.COLUNA
FROM TABELA_A A
LEFT JOIN TABELA_B B ON A.CHAVE = B.CHAVE;
-- Retorna todos os registros da tabela da esquerda, mesmo sem correspondência

-- 🔗 RIGHT JOIN: todos da direita + correspondentes da esquerda
SELECT A.COLUNA, B.COLUNA
FROM TABELA_A A
RIGHT JOIN TABELA_B B ON A.CHAVE = B.CHAVE;
-- Retorna todos os registros da tabela da direita, mesmo sem correspondência

-- 🔗 FULL OUTER JOIN: todos os registros de ambas as tabelas
SELECT A.COLUNA, B.COLUNA
FROM TABELA_A A
FULL OUTER JOIN TABELA_B B ON A.CHAVE = B.CHAVE;
-- Retorna todos os registros, com ou sem correspondência

-- 📊 GROUP BY com agregação
SELECT COLUNA_AGRUPADA, SUM(VALOR) AS TOTAL
FROM TABELA
GROUP BY COLUNA_AGRUPADA;
-- Agrupa registros e aplica função agregadora (SUM, AVG, COUNT...)

-- 📈 ORDER BY para ordenar resultados
SELECT * FROM TABELA
ORDER BY COLUNA DESC;
-- Ordena os resultados de forma crescente (ASC) ou decrescente (DESC)

-- 📎 Subquery (subconsulta)
SELECT COLUNA, (SELECT AVG(VALOR) FROM OUTRA_TABELA) AS MEDIA
FROM TABELA;
-- Usa o resultado de uma subconsulta como coluna no SELECT principal

-- 🔄 UNION: une resultados de duas consultas
SELECT COLUNA1 FROM TABELA1
UNION
SELECT COLUNA1 FROM TABELA2;
-- Junta resultados diferentes em uma única lista (sem duplicados)

-- 🔢 AVG, MAX, MIN
SELECT 
    AVG(VALOR) AS MEDIA, 
    MAX(VALOR) AS MAIOR, 
    MIN(VALOR) AS MENOR 
FROM TABELA;
-- Calcula média, maior e menor valores de uma coluna
```

-----
