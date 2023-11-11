-- Criando a Tabela Cliente
CREATE TABLE [Cliente]
(
    [ClienteId] INTEGER  NOT NULL,
    [UsuarioId] INTEGER  NOT NULL,
    [Nome] NVARCHAR(160)  NOT NULL,
    [CPF] NVARCHAR(160)  NOT NULL,
    [Endereço] NVARCHAR(160)  NOT NULL,
    [Telefone] NVARCHAR(160)  NOT NULL,
    CONSTRAINT [PK_Cliente] PRIMARY KEY ([ClienteId]) 
    CONSTRAINT [FK_Cliente_Usuario] FOREIGN KEY ([UsuarioId]) REFERENCES Usuario(UsuarioId)
);

 CREATE UNIQUE INDEX [IPK_Cliente] ON [Cliente]([ClienteId]);

-- Criando a Tabela Usuario
CREATE TABLE [Usuario]
(
    [UsuarioId] INTEGER  NOT NULL,
    [Loguin] NVARCHAR(160)  NOT NULL,
    [Senha] NVARCHAR(160)  NOT NULL,
    [Email] NVARCHAR(160)  NOT NULL,
    CONSTRAINT [PK_Usuario] PRIMARY KEY ([UsuarioId])  
);

 CREATE UNIQUE INDEX [IPK_Usuario] ON [Usuario]([UsuarioId]);

-- Criando a Tabela Fornecedor
CREATE TABLE [Fornecedor]
(
    [FornecedorId] INTEGER  NOT NULL,
    [Nome] NVARCHAR(160)  NOT NULL,
    [Email] NVARCHAR(160)  NOT NULL,
    [Endereço] NVARCHAR(160)  NOT NULL,
    [CNPJ] NVARCHAR(160)  NOT NULL,
    [Telefone] NVARCHAR(160)  NOT NULL,
    CONSTRAINT [PK_Fornecedor] PRIMARY KEY ([FornecedorId])  
);

 CREATE UNIQUE INDEX [IPK_Fornecedor] ON [Fornecedor]([FornecedorId]);

-- Criando a tabela Produto
CREATE TABLE [Produto]
(
    [ProdutoId] INTEGER  NOT NULL,
    [FornecedorId] INTEGER  NOT NULL,
    [Nome] NVARCHAR(160)  NOT NULL,
    [VLR_Produto] FLOAT(15,2)  NOT NULL,
    CONSTRAINT [PK_Produto] PRIMARY KEY ([ProdutoId])
    CONSTRAINT [FK_Produto_Fornecedor] FOREIGN KEY ([FornecedorId]) REFERENCES Fornecedor(FornecedorId)
);

CREATE UNIQUE INDEX [IPK_Produto] ON [Produto]([ProdutoId]);

-- Criando a tabela Loja
CREATE TABLE [Loja]
(
    [LojaId] INTEGER  NOT NULL,
    [Nome] NVARCHAR(160)  NOT NULL,
    [Endereço] NVARCHAR(160)  NOT NULL,
    [Telefone] NVARCHAR(160)  NOT NULL,
    CONSTRAINT [PK_Loja] PRIMARY KEY ([LojaId])
);

CREATE UNIQUE INDEX [IPK_Loja] ON [Loja]([LojaId]);

-- Criando a tabela Vendedor
CREATE TABLE [Vendedor]
(
    [VendedorId] INTEGER  NOT NULL,
    [UsuarioId] INTEGER  NOT NULL,
    [LojaId] INTEGER  NOT NULL,
    [Nome] NVARCHAR(160)  NOT NULL,
    [CPF] NVARCHAR(160)  NOT NULL,
    [Endereco] NVARCHAR(160)  NOT NULL,
    [Telefone] NVARCHAR(160)  NOT NULL,
    [Admin] NVARCHAR(160)  NOT NULL,
    CONSTRAINT [PK_Vendedor] PRIMARY KEY ([VendedorId])
    CONSTRAINT [FK_Vendedor_Usuario] FOREIGN KEY ([UsuarioId]) REFERENCES Usuario(UsuarioId)
    CONSTRAINT [FK_Vendedor_Loja] FOREIGN KEY ([LojaId]) REFERENCES Loja(LojaId)
);

CREATE UNIQUE INDEX [IPK_Vendedor] ON [Vendedor]([VendedorId]);

-- Criando a tabela Estoque
CREATE TABLE [Estoque]
(
    [EstoqueId] INTEGER  NOT NULL,
    [ProdutoId] INTEGER  NOT NULL,
    [LojaId] INTEGER  NOT NULL,
    [Quant_Produto] INTEGER  NOT NULL,
    CONSTRAINT [PK_Estoque] PRIMARY KEY ([EstoqueId])
    CONSTRAINT [FK_Estoque_Produto] FOREIGN KEY ([ProdutoId]) REFERENCES Produto(ProdutoId)
    CONSTRAINT [FK_Estoque_Loja] FOREIGN KEY ([LojaId]) REFERENCES Loja(LojaId)
);

CREATE UNIQUE INDEX [IPK_Estoque] ON [Estoque]([EstoqueId]);

-- Criando a tabela Relatorio
CREATE TABLE [Relatorio]
(
    [RelatorioId] INTEGER  NOT NULL,
    [LojaId] INTEGER  NOT NULL,
    [VLR_Total] FLOAT(15,2)  NOT NULL,
    [Data_Inicio] DATETIME NOT NULL,
    [Data_Fim] DATETIME NOT NULL,
    CONSTRAINT [PK_Relatorio] PRIMARY KEY ([RelatorioId])
    CONSTRAINT [FK_Relatorio_Loja] FOREIGN KEY ([LojaId]) REFERENCES Loja(LojaId)
);

CREATE UNIQUE INDEX [IPK_Relatorio] ON [Relatorio]([RelatorioId]);

-- Criando a tabela Pedido
CREATE TABLE [Pedido]
(
    [PedidoId] INTEGER  NOT NULL,
    [ClienteId] INTEGER  NOT NULL,
    [VendedorId] INTEGER  NOT NULL,
    [LojaId] INTEGER  NOT NULL,
    [Status] NVARCHAR(160)  NOT NULL,
    [Tempo_Espera] TIME  NOT NULL,
    [CPF] NVARCHAR(160)  NOT NULL,
    [VLR_Pedido] FLOAT(15,2)  NOT NULL,
    [Data_Pedido] DATETIME  NOT NULL,
    CONSTRAINT [PK_Pedido] PRIMARY KEY ([PedidoId])
    CONSTRAINT [FK_Pedido_Cliente] FOREIGN KEY ([ClienteId]) REFERENCES Cliente(ClienteId)
    CONSTRAINT [FK_Pedido_Vendedor] FOREIGN KEY ([VendedorId]) REFERENCES Vendedor(VendedorId)
    CONSTRAINT [FK_Pedido_Loja] FOREIGN KEY ([LojaId]) REFERENCES Loja(LojaId)
);

CREATE UNIQUE INDEX [IPK_Pedido] ON [Pedido]([PedidoId]);

-- Criando a tabela Item Pedido
CREATE TABLE [Item_Pedido]
(
    [Item_PedidoId] INTEGER  NOT NULL,
    [PedidoId] INTEGER  NOT NULL,
    [ProdutoId] INTEGER  NOT NULL,
    [Quant_Produto] INTEGER  NOT NULL,
    CONSTRAINT [PK_Item_Pedido] PRIMARY KEY ([Item_PedidoId]) 
    CONSTRAINT [FK_Item_pedido_Pedido] FOREIGN KEY ([PedidoId]) REFERENCES Pedido(PedidoId)
    CONSTRAINT [FK_Item_pedido_Produto] FOREIGN KEY ([ProdutoId]) REFERENCES Produto(ProdutoId)
);

 CREATE UNIQUE INDEX [IPK_Item_Pedido] ON [Item_Pedido]([Item_PedidoId]);

-- INSERT [Exemplo de INSERT na Tabela CLIENTE]
INSERT INTO Cliente  (ClienteId, UsuarioId, Nome, CPF, Endereço, Telefone)
VALUES (1, 1, 'Maria Aparecida', '10501405626', 'Rua x 123', '31999866606');

INSERT INTO Cliente  (ClienteId, UsuarioId, Nome, CPF, Endereço, Telefone)
VALUES (2, 2,'Jennifer Maia', '05604305677', 'Rua LK 161','31994533390');

INSERT INTO Cliente  (ClienteId, UsuarioId, Nome, CPF, Endereço, Telefone)
VALUES (3, 3, 'Joyce Eloisa', '13405606500', 'Rua Lu 11','31998755541');

INSERT INTO Cliente  (ClienteId, UsuarioId, Nome, CPF, Endereço, Telefone)
VALUES (4, 4, 'Ana Clara', '04406507688', 'Rua azul 12','31998755456');


-- INSERT [Exemplo de INSERT na Tabela USUARIO]
INSERT INTO Usuario  (UsuarioId, Loguin, Senha, Email)
VALUES (1, 'Maria_parecida', 'Ma123456', 'mariaaparecida@gmail.com');

INSERT INTO Usuario  (UsuarioId, Loguin, Senha, Email)
VALUES (2, 'Jennifer Maia', 'Je123456', 'jennifermaia@gmail.com');

INSERT INTO Usuario  (UsuarioId, Loguin, Senha, Email)
VALUES (3, 'Joyce Eloisa', 'Jo123456', 'joyceeloisa@gmail.com');

INSERT INTO Usuario  (UsuarioId, Loguin, Senha, Email)
VALUES (4, 'Ana Clara', 'Ac123456', 'anaclara@gmail.com');

-- INSERT [Exemplo de INSERT na Tabela FORNECEDOR]
INSERT INTO Fornecedor  (FornecedorId, Nome, Email, Endereço, CNPJ, Telefone)
VALUES (1, 'Supermercados BH', 'mariaaparecida@supermercadosbh.com.br', 'Rua x', '71333456000192', '03133367744');

INSERT INTO Fornecedor  (FornecedorId, Nome, Email, Endereço, CNPJ, Telefone)
VALUES (2, 'Supermercados Super Nosso', 'joao@supermercadossupernosso.com.br', 'Rua y', '91333356023192', '03138937445');

INSERT INTO Fornecedor  (FornecedorId, Nome, Email, Endereço, CNPJ, Telefone)
VALUES (3, 'Supermercados Villefort', 'maria@supermercadosvillefort.com.br', 'Rua z', '39333456000652', '03133637445');

INSERT INTO Fornecedor  (FornecedorId, Nome, Email, Endereço, CNPJ, Telefone)
VALUES (4, 'Supermercados Dia', 'aparecida@supermercadosdia.com.br', 'Rua w', '74535056005692', '03135637445');

-- INSERT [Exemplo de INSERT na Tabela PRODUTO]
INSERT INTO Produto  (ProdutoId, FornecedorId, Nome, VLR_produto  )
VALUES (1, 1, 'Fanta', 4.00);

INSERT INTO Produto  (ProdutoId, FornecedorId, Nome, VLR_produto  )
VALUES (2, 1, 'Coca Cola', 5.00);

INSERT INTO Produto  (ProdutoId, FornecedorId, Nome, VLR_produto  )
VALUES (3, 1, 'Guarapan', 3.00);

INSERT INTO Produto  (ProdutoId, FornecedorId, Nome, VLR_produto  )
VALUES (4, 1, 'Sukita', 4.00);

-- INSERT [Exemplo de INSERT na Tabela LOJA]
INSERT INTO Loja  (lojaId, Nome, Endereço, Telefone)
VALUES (1,'Patio Savassi', 'Rua x', '03133627444');

-- INSERT [Exemplo de INSERT na Tabela VENDEDOR]
INSERT INTO Vendedor  (VendedorId, UsuarioId, LojaId, Nome, CPF, Endereco, Telefone, Admin)
VALUES (1, 1, 1, 'Flavia Moura', '04404504607','Rua x','03199992663', 1);

INSERT INTO Vendedor  (VendedorId, UsuarioId, LojaId, Nome, CPF, Endereco, Telefone, Admin)
VALUES (2, 2, 1, 'Ana Cristina', '04302606607','Rua Alfa','03199992446', 1);

INSERT INTO Vendedor  (VendedorId, UsuarioId, LojaId, Nome, CPF, Endereco, Telefone, Admin)
VALUES (3, 3, 1, 'Camila Fernanda', '04403334607','Rua Beta','03199992226', 1);

INSERT INTO Vendedor  (VendedorId, UsuarioId, LojaId, Nome, CPF, Endereco, Telefone, Admin)
VALUES (4, 4, 1, 'Kaylane Braga', '23354504607','Rua Roma','03199996464', 1);

-- INSERT [Exemplo de INSERT na Tabela ESTOQUE]
INSERT INTO Estoque  (EstoqueId, ProdutoId, LojaId, Quant_Produto)
VALUES (1, 1, 1, '30');

INSERT INTO Estoque  (EstoqueId, ProdutoId, LojaId, Quant_Produto)
VALUES (2, 2, 1, '50');

INSERT INTO Estoque  (EstoqueId, ProdutoId, LojaId, Quant_Produto)
VALUES (3, 3, 1, '40');

INSERT INTO Estoque  (EstoqueId, ProdutoId, LojaId, Quant_Produto)
VALUES (4, 4, 1, '60');

-- INSERT [Exemplo de INSERT na Tabela RELATORIO]
INSERT INTO Relatorio  (relatorioId, LojaId, VLR_Total, Data_Inicio, Data_Fim)
VALUES (1, 1, 500.00, '2023-10-01 07:00:00', '2023-10-28 22:00:00');

INSERT INTO Relatorio  (relatorioId, LojaId, VLR_Total, Data_Inicio, Data_Fim)
VALUES (2, 1, 1000.00, '2023-09-01 07:00:00', '2023-09-28 22:00:00');

INSERT INTO Relatorio  (relatorioId, LojaId, VLR_Total, Data_Inicio, Data_Fim)
VALUES (3, 1, 800.00, '2023-08-01 07:00:00', '2023-09-28 22:00:00');

INSERT INTO Relatorio  (relatorioId, LojaId, VLR_Total, Data_Inicio, Data_Fim)
VALUES (4, 1, 200.00, '2023-07-01 07:00:00', '2023-07-28 22:00:00');

-- INSERT [Exemplo de INSERT na Tabela PEDIDO]
INSERT INTO Pedido (PedidoId, ClienteId, VendedorId, LojaId, Status, Tempo_Espera, CPF, VLR_Pedido, Data_Pedido)
VALUES (1, 1, 1, 1, 'Entregue','00:30:00','00500785856',45.00, '2023-10-31 22:00:00');

INSERT INTO Pedido (PedidoId, ClienteId, VendedorId, LojaId, Status, Tempo_Espera, CPF, VLR_Pedido, Data_Pedido)
VALUES (2, 2, 1, 1, 'Entregue','00:30:00','00600785845',85.00, '2023-10-31 22:00:00');

INSERT INTO Pedido (PedidoId, ClienteId, VendedorId, LojaId, Status, Tempo_Espera, CPF, VLR_Pedido, Data_Pedido)
VALUES (3, 3, 3, 1, 'Cancelado','00:50:00','00700785866',25.00, '2023-10-31 22:00:00');

INSERT INTO Pedido (PedidoId, ClienteId, VendedorId, LojaId, Status, Tempo_Espera, CPF, VLR_Pedido, Data_Pedido)
VALUES (4, 4, 3, 1, 'Em Producao','00:20:00','00200785832',35.00, '2023-10-31 22:00:00');

-- INSERT [Exemplo de INSERT na Tabela ITEM PEDIDO]
INSERT INTO Item_Pedido  (Item_PedidoId, PedidoId, ProdutoId, Quant_Produto)
VALUES (1, 1, 1, '100');

INSERT INTO Item_Pedido  (Item_PedidoId, PedidoId, ProdutoId, Quant_Produto)
VALUES (2, 2, 3, '150');

INSERT INTO Item_Pedido  (Item_PedidoId, PedidoId, ProdutoId, Quant_Produto)
VALUES (3, 3, 4, '80');

INSERT INTO Item_Pedido  (Item_PedidoId, PedidoId, ProdutoId, Quant_Produto)
VALUES (4, 4, 2, '90');


-- SELECT [Exemplo de SELECT na Tabela CLIENTE]
SELECT * FROM Cliente c ;
SELECT * FROM Cliente c WHERE Nome  LIKE '%Apa%';
SELECT * FROM Cliente c WHERE Nome  LIKE '%Elo%';
SELECT * FROM Cliente c WHERE Nome  LIKE 'Jen%';

-- SELECT [Exemplo de SELECT na Tabela USUARIO]
SELECT * FROM Usuario u ;
SELECT * FROM Usuario u WHERE Loguin  LIKE '%Apa%';
SELECT * FROM Usuario u WHERE Loguin  LIKE '%Elo%';
SELECT * FROM Usuario u WHERE Loguin  LIKE 'Jen%';

-- SELECT [Exemplo de SELECT na Tabela FORNECEDOR]
SELECT * FROM Fornecedor f ;
SELECT * FROM Fornecedor f WHERE Nome  LIKE '%BH%' ;
SELECT * FROM Fornecedor f WHERE Endereço  LIKE '%prim%';
SELECT * FROM Fornecedor f WHERE CNPJ  LIKE '%333%';

-- SELECT [Exemplo de SELECT na Tabela PRODUTO]
SELECT * FROM Produto p ;
SELECT * FROM Produto p WHERE Nome  LIKE 'coc%';
SELECT * FROM Produto p WHERE VLR_Produto  LIKE 8.00;
SELECT * FROM Produto p WHERE Nome  LIKE 'su%';

-- SELECT [Exemplo de SELECT na Tabela LOJA]
SELECT * FROM Loja l ;

-- SELECT [Exemplo de SELECT na Tabela VENDEDOR]
SELECT * FROM Vendedor v ;
SELECT * FROM Vendedor v WHERE Nome  LIKE 'fla%';
SELECT * FROM Vendedor v WHERE CPF  LIKE '23%';
SELECT * FROM Vendedor v WHERE Endereco  LIKE '%roma%';

-- SELECT [Exemplo de SELECT na Tabela ESTOQUE]
SELECT * FROM Estoque e ;
SELECT * FROM Estoque e WHERE Quant_Produto  LIKE '150';
SELECT * FROM Estoque e WHERE Quant_Produto  LIKE '200';
SELECT * FROM Estoque e WHERE EstoqueId  LIKE '4';

-- SELECT [Exemplo de SELECT na Tabela RELATORIO]
SELECT * FROM Relatorio r ;
SELECT * FROM Relatorio r WHERE RelatorioId  LIKE '3';
SELECT * FROM Relatorio r WHERE  Data_Inicio LIKE '2023-09-01 07:00:00';
SELECT * FROM Relatorio r WHERE VLR_Total  LIKE 1000.00;

-- SELECT [Exemplo de SELECT na Tabela PEDIDO]
SELECT * FROM Pedido p ;
SELECT * FROM Pedido p  WHERE Status  LIKE 'Em Producao';
SELECT * FROM Pedido p  WHERE Status  LIKE 'Entregue';
SELECT * FROM Pedido p  WHERE PedidoId  LIKE '3';

-- SELECT [Exemplo de SELECT na Tabela ITEM PEDIDO]
SELECT * FROM Item_Pedido ip ;
SELECT * FROM Item_Pedido ip WHERE Item_PedidoId  LIKE '3';
SELECT * FROM Item_Pedido ip WHERE Quant_Produto  LIKE '40';
SELECT * FROM Item_Pedido ip WHERE PedidoId  LIKE '3';


-- UPDATE [Exemplo de UPDATE na Tabela CLIENTE]
UPDATE Cliente  SET Telefone  = '31999866606' WHERE ClienteId  = 1;
UPDATE Cliente  SET CPF  = '04803303403' WHERE ClienteId  = 2;
UPDATE Cliente  SET Nome  = 'Ana Clara Diniz' WHERE ClienteId  = 4;
UPDATE Cliente  SET Endereço  = 'Rua Indiana 123' WHERE ClienteId  = 3;

-- UPDATE [Exemplo de UPDATE na Tabela USUARIO]
UPDATE Usuario  SET Email  = 'mariaaparecidadejesus@gmail.com' WHERE UsuarioId  = 1;
UPDATE Usuario  SET Loguin  = 'Jennifer_maia' WHERE UsuarioId  = 2;
UPDATE Usuario  SET Loguin  = 'Maria_Aparecida' WHERE UsuarioId  = 1;
UPDATE Usuario  SET Senha  = 'Acm123456' WHERE UsuarioId  = 4;

-- UPDATE [Exemplo de UPDATE na Tabela FORNECEDOR]
UPDATE Fornecedor  SET Nome  = 'Supermercados BH Centro' WHERE FornecedorId  = 1;
UPDATE Fornecedor  SET Nome  = 'Supermercados Super Nosso Zona Sul' WHERE FornecedorId  = 2;
UPDATE Fornecedor  SET Endereço  = 'Rua Primeiro de Maio' WHERE FornecedorId  = 3;
UPDATE Fornecedor  SET Telefone  = '03133744002' WHERE FornecedorId  = 4;

-- UPDATE [Exemplo de UPDATE na Tabela PRODUTO]
UPDATE Produto  SET VLR_produto  = 6.00 WHERE ProdutoId  = 1;
UPDATE Produto  SET VLR_produto  = 10.00 WHERE ProdutoId  = 2;
UPDATE Produto  SET VLR_produto  = 8.00 WHERE ProdutoId  = 3;
UPDATE Produto  SET VLR_produto  = 8.00 WHERE ProdutoId  = 4;

-- UPDATE [Exemplo de UPDATE na Tabela LOJA]
UPDATE Loja  SET Nome  = 'Patio Savassi 2' WHERE LojaId  = 1;
UPDATE Loja  SET Endereço  = 'Av, Getulio Vargas 2000' WHERE LojaId  = 1;
UPDATE Loja  SET Telefone  = '3133766609' WHERE LojaId  = 1;

-- UPDATE [Exemplo de UPDATE na Tabela VENDEDOR]
UPDATE Vendedor  SET NOME = 'Flavia Diniz Moura' WHERE VendedorId  = 1;
UPDATE Vendedor  SET NOME = 'Ana Cristina Santos' WHERE VendedorId  = 2;
UPDATE Vendedor  SET NOME = 'Camila Fernanda Araujo' WHERE VendedorId  = 3;
UPDATE Vendedor  SET NOME = 'Kaylane Borges Braga' WHERE VendedorId  = 4;

-- UPDATE [Exemplo de UPDATE na Tabela ESTOQUE]
UPDATE Estoque  SET Quant_Produto  = '100' WHERE EstoqueId  = 1;
UPDATE Estoque  SET Quant_Produto  = '200' WHERE EstoqueId  = 2;
UPDATE Estoque  SET Quant_Produto  = '150' WHERE EstoqueId  = 3;
UPDATE Estoque  SET Quant_Produto  = '180' WHERE EstoqueId  = 4;

-- UPDATE [Exemplo de UPDATE na Tabela RELATORIO]
UPDATE Relatorio  SET Data_Fim  = '2023-08-30 07:00:00' WHERE RelatorioId  = 1;
UPDATE Relatorio  SET Data_Fim  = '2023-08-30 07:00:00' WHERE RelatorioId  = 2;
UPDATE Relatorio  SET Data_Fim  = '2023-08-30 07:00:00' WHERE RelatorioId  = 3;
UPDATE Relatorio  SET Data_Fim  = '2023-08-30 07:00:00' WHERE RelatorioId  = 4;

-- UPDATE [Exemplo de UPDATE na Tabela PEDIDO]
UPDATE Pedido  SET Status  = 'Em Producao' WHERE PedidoId  = 1;
UPDATE Pedido  SET Status  = 'Em Producao' WHERE PedidoId  = 2;
UPDATE Pedido  SET Status  = 'Entregue' WHERE PedidoId  = 3;
UPDATE Pedido  SET Status  = 'Entregue' WHERE PedidoId  = 4;

-- UPDATE [Exemplo de UPDATE na Tabela ITEM PEDIDO]
UPDATE Item_Pedido  SET Quant_Produto  = '20' WHERE Item_PedidoId  = 1;
UPDATE Item_Pedido  SET Quant_Produto  = '30' WHERE Item_PedidoId  = 2;
UPDATE Item_Pedido  SET Quant_Produto  = '40' WHERE Item_PedidoId  = 3;
UPDATE Item_Pedido  SET Quant_Produto  = '50' WHERE Item_PedidoId  = 4;

-- DELETE [Exemplo de DELETE na Tabela CLIENTE]
DELETE FROM Cliente  WHERE ClienteId  = 1;
DELETE FROM Cliente  WHERE ClienteId  = 2;
DELETE FROM Cliente  WHERE ClienteId  = 3;
DELETE FROM Cliente  WHERE ClienteId  = 4;

-- DELETE [Exemplo de DELETE na Tabela USUARIO]
DELETE FROM Usuario  WHERE UsuarioId  = 1;
DELETE FROM Usuario  WHERE UsuarioId  = 2;
DELETE FROM Usuario  WHERE UsuarioId  = 3;
DELETE FROM Usuario  WHERE UsuarioId  = 4;

-- DELETE [Exemplo de DELETE na Tabela FORNECEDOR]
DELETE FROM Fornecedor  WHERE FornecedorId  = 1;
DELETE FROM Fornecedor  WHERE FornecedorId  = 2;
DELETE FROM Fornecedor  WHERE FornecedorId  = 3;
DELETE FROM Fornecedor  WHERE FornecedorId  = 4;

-- DELETE [Exemplo de DELETE na Tabela PRODUTO]
DELETE FROM Produto  WHERE ProdutoId  = 1;
DELETE FROM Produto  WHERE ProdutoId  = 2;
DELETE FROM Produto  WHERE ProdutoId  = 3;
DELETE FROM Produto  WHERE ProdutoId  = 4;

-- DELETE [Exemplo de DELETE na Tabela LOJA]
DELETE FROM Loja  WHERE LojaId  = 1;

-- DELETE [Exemplo de DELETE na Tabela VENDEDOR]
DELETE FROM Vendedor  WHERE VendedorId  = 1;
DELETE FROM Vendedor  WHERE VendedorId  = 2;
DELETE FROM Vendedor  WHERE VendedorId  = 3;
DELETE FROM Vendedor  WHERE VendedorId  = 4;

-- DELETE [Exemplo de DELETE na Tabela ESTOQUE]
DELETE FROM Estoque  WHERE EstoqueId  = 1;
DELETE FROM Estoque  WHERE EstoqueId  = 2;
DELETE FROM Estoque  WHERE EstoqueId  = 3;
DELETE FROM Estoque  WHERE EstoqueId  = 4;

-- DELETE [Exemplo de DELETE na Tabela RELATORIO]
DELETE FROM Relatorio  WHERE RelatorioId = 1;
DELETE FROM Relatorio  WHERE RelatorioId = 2;
DELETE FROM Relatorio  WHERE RelatorioId = 3;
DELETE FROM Relatorio  WHERE RelatorioId = 4;

-- DELETE [Exemplo de DELETE na Tabela PEDIDO]
DELETE FROM Pedido  WHERE PedidoId  = 1;
DELETE FROM Pedido  WHERE PedidoId  = 2;
DELETE FROM Pedido  WHERE PedidoId  = 3;
DELETE FROM Pedido  WHERE PedidoId  = 4;

-- DELETE [Exemplo de DELETE na Tabela ITEM PEDIDO]
DELETE FROM Item_Pedido  WHERE Item_PedidoId  = 1;
DELETE FROM Item_Pedido  WHERE Item_PedidoId  = 2;
DELETE FROM Item_Pedido  WHERE Item_PedidoId  = 3;
DELETE FROM Item_Pedido  WHERE Item_PedidoId  = 4;

-- INNER JOIN
-- 01 Trazer informações de pedidos, incluindo os nomes do cliente e do vendedor
SELECT P.PedidoId, C.Nome AS NomeCliente, V.Nome AS NomeVendedor
FROM Pedido P
INNER JOIN Cliente C ON P.ClienteId = C.ClienteId
INNER JOIN Vendedor V ON P.VendedorId = V.VendedorId;

-- 02 Trazer informações de pedidos, incluíndo os produtos
SELECT P.PedidoId, C.Nome AS NomeCliente, V.Nome AS NomeVendedor, IP.Quant_Produto, PR.Nome AS NomeProduto
FROM Pedido P
INNER JOIN Cliente C ON P.ClienteId = C.ClienteId
INNER JOIN Vendedor V ON P.VendedorId = V.VendedorId
INNER JOIN Item_Pedido IP ON P.PedidoId = IP.PedidoId
INNER JOIN Produto PR ON IP.ProdutoId = PR.ProdutoId;

-- 03 Trazer informações do estoque
SELECT E.EstoqueId, P.Nome AS NomeProduto, E.Quant_Produto
FROM Estoque E
INNER JOIN Produto P ON E.ProdutoId = P.ProdutoId;

-- 04 Trazer todos os pedidos até o momento com suas datas
SELECT P.PedidoId, C.Nome AS NomeCliente, V.Nome AS NomeVendedor, P.Data_Pedido, P.VLR_Pedido, IP.Quant_Produto 
FROM Pedido P
INNER JOIN Cliente C ON P.ClienteId = C.ClienteId
INNER JOIN Vendedor V ON P.VendedorId = V.VendedorId
INNER JOIN Item_Pedido IP ON P.PedidoId = IP.PedidoId;

-- 05 Trazer todos os vendedores cadastrados com seus dados
SELECT V.VendedorId, V.Nome AS NomeVendedor, V.CPF, V.Endereco, V.Telefone, U.Loguin, U.Email
FROM Vendedor V
INNER JOIN Usuario U ON V.UsuarioId = U.UsuarioId;


-- LEFT JOIN
--01 Trazer todos os Clientes Cdastrados e seus pedidos relacionados
SELECT C.ClienteId, C.Nome AS NomeCliente, C.CPF, P.PedidoId, P.Data_Pedido, P.Status
FROM Cliente C
LEFT JOIN Pedido P ON C.ClienteId = P.ClienteId;

