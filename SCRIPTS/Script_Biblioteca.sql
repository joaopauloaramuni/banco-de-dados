-- Criando a tabela aluno
CREATE TABLE [ALUNO]
(
    [COD_ALUNO] INTEGER NOT NULL,
    [NOME] NVARCHAR(160)  NOT NULL,
    CONSTRAINT [PK_ALUNO] PRIMARY KEY ([COD_ALUNO])
);

CREATE UNIQUE INDEX [IPK_ALUNO] ON [ALUNO]([COD_ALUNO]);

-- Criando a tabela funcionário
CREATE TABLE [FUNCIONARIO]
(
    [COD_FUNCIONARIO] INTEGER NOT NULL,
    [NOME] NVARCHAR(160)  NOT NULL,
    [TELEFONE] NVARCHAR(160)  NOT NULL,
    CONSTRAINT [PK_FUNCIONARIO] PRIMARY KEY ([COD_FUNCIONARIO])
);

CREATE UNIQUE INDEX [IPK_FUNCIONARIO] ON [FUNCIONARIO]([COD_FUNCIONARIO]);

-- Criando a tabela autor
CREATE TABLE [AUTOR]
(
    [COD_AUTOR] INTEGER NOT NULL,
    [NOME] NVARCHAR(160) NOT NULL,
    CONSTRAINT [PK_AUTOR] PRIMARY KEY ([COD_AUTOR])
);

CREATE UNIQUE INDEX [IPK_AUTOR] ON [AUTOR]([COD_AUTOR]);

-- Criando a tabela assunto
CREATE TABLE [ASSUNTO]
(
    [COD_ASSUNTO] INTEGER NOT NULL,
    [DES_ASSUNTO] NVARCHAR(160) NOT NULL,
    CONSTRAINT [PK_ASSUNTO] PRIMARY KEY ([COD_ASSUNTO])
);

CREATE UNIQUE INDEX [IPK_ASSUNTO] ON [ASSUNTO]([COD_ASSUNTO]);

-- Criando a tabela gênero
CREATE TABLE [GENERO]
(
    [COD_GENERO] INTEGER NOT NULL,
    [DES_GENERO] NVARCHAR(160) NOT NULL,
    CONSTRAINT [PK_GENERO] PRIMARY KEY ([COD_GENERO]) 
);

CREATE UNIQUE INDEX [IPK_GENERO] ON [GENERO]([COD_GENERO]);

-- Criando a tabela livro
CREATE TABLE [LIVRO]
(
    [COD_LIVRO] INTEGER NOT NULL,
    [COD_AUTOR] INTEGER NOT NULL,
    [COD_ASSUNTO] INTEGER NOT NULL,
    [COD_GENERO] INTEGER NOT NULL,
    CONSTRAINT [PK_LIVRO] PRIMARY KEY ([COD_LIVRO]),
    CONSTRAINT [FK_AUTOR] FOREIGN KEY ([COD_AUTOR]) REFERENCES AUTOR(COD_AUTOR),
 	CONSTRAINT [FK_ASSUNTO] FOREIGN KEY ([COD_ASSUNTO]) REFERENCES ASSUNTO(COD_ASSUNTO),
 	CONSTRAINT [FK_GENERO] FOREIGN KEY ([COD_GENERO]) REFERENCES GENERO(COD_GENERO)  
);

CREATE UNIQUE INDEX [IPK_LIVRO] ON [LIVRO]([COD_LIVRO]);

-- Criando a tabela estoque
CREATE TABLE [ESTOQUE]
(
    [COD_ESTOQUE] INTEGER NOT NULL,
    [COD_LIVRO] INTEGER NOT NULL,
    [QTD_LIVRO] INTEGER NOT NULL,
    CONSTRAINT [PK_ESTOQUE] PRIMARY KEY ([COD_ESTOQUE]),
    CONSTRAINT [FK_LIVRO] FOREIGN KEY ([COD_LIVRO]) REFERENCES LIVRO(COD_LIVRO) 
);

CREATE UNIQUE INDEX [IPK_ESTOQUE] ON [ESTOQUE]([COD_ESTOQUE]);

-- Criando a tabela empréstimo
CREATE TABLE [EMPRESTIMO]
(
    [COD_EMPRESTIMO] INTEGER NOT NULL,
    [COD_ALUNO] INTEGER NOT NULL,
    [COD_FUNCIONARIO] INTEGER NOT NULL,
    [DATA_EMPRESTIMO] DATETIME NOT NULL,
    [DATA_DEVOLUCAO] DATETIME NOT NULL,
    [VLR_MULTA] FLOAT(8,2) NOT NULL,
    [ATIVO] BOOLEAN NOT NULL,
    CONSTRAINT [PK_EMPRESTIMO] PRIMARY KEY ([COD_EMPRESTIMO]),
    CONSTRAINT [FK_ALUNO] FOREIGN KEY ([COD_ALUNO]) REFERENCES ALUNO(COD_ALUNO),
    CONSTRAINT [FK_FUNCIONARIO] FOREIGN KEY ([COD_FUNCIONARIO]) REFERENCES FUNCIONARIO(COD_FUNCIONARIO)
);

CREATE UNIQUE INDEX [IPK_EMPRESTIMO] ON [EMPRESTIMO]([COD_EMPRESTIMO]);

-- Criando a tabela livros empréstimo
CREATE TABLE [LIVROS_EMPRESTIMO]
(
    [COD_LIVROS_EMPRESTIMO] INTEGER NOT NULL,
    [COD_EMPRESTIMO] INTEGER NOT NULL,
    [COD_LIVRO] INTEGER NOT NULL,
    CONSTRAINT [PK_LIVROS_EMPRESTIMO] PRIMARY KEY ([COD_LIVROS_EMPRESTIMO]),
    CONSTRAINT [FK_EMPRESTIMO] FOREIGN KEY ([COD_EMPRESTIMO]) REFERENCES EMPRESTIMO(COD_EMPRESTIMO),
    CONSTRAINT [FK_LIVRO] FOREIGN KEY ([COD_LIVRO]) REFERENCES LIVRO(COD_LIVRO)
);

CREATE UNIQUE INDEX [IPK_LIVROS_EMPRESTIMO] ON [LIVROS_EMPRESTIMO]([COD_LIVROS_EMPRESTIMO]);

-- Criando a tabela exemplares empréstimo
CREATE TABLE [EXEMPLARES_EMPRESTIMO]
(
    [COD_EXEMPLARES_EMPRESTIMO] INTEGER NOT NULL,
    [COD_LIVROS_EMPRESTIMO] INTEGER NOT NULL,
    [QTD_EXEMPLARES] INTEGER NOT NULL,
    CONSTRAINT [PK_EXEMPLARES_EMPRESTIMO] PRIMARY KEY ([COD_EXEMPLARES_EMPRESTIMO]),
    CONSTRAINT [FK_LIVROS_EMPRESTIMO] FOREIGN KEY ([COD_LIVROS_EMPRESTIMO]) REFERENCES LIVROS_EMPRESTIMO(COD_LIVROS_EMPRESTIMO)
);

CREATE UNIQUE INDEX [IPK_EXEMPLARES_EMPRESTIMO] ON [EXEMPLARES_EMPRESTIMO]([COD_EXEMPLARES_EMPRESTIMO]);