---------
-- DDL --
---------
-- 01. Criar o banco de dados
CREATE SCHEMA IF NOT EXISTS Discoteca;
USE Discoteca;

-- 02. Criar as tabelas
CREATE TABLE IF NOT EXISTS CDs (
  Codigo 		INT 			PRIMARY KEY NOT NULL,
  Nome 			VARCHAR(50) 	NOT NULL,
  DataCompra 	DATE 			NULL,
  ValorPago 	DECIMAL(10,2) 	NULL,
  LocalCompra 	VARCHAR(50) 	NULL
);

CREATE TABLE IF NOT EXISTS Musicas (
  CDs_Codigo 	INT 			NOT NULL,
  Numero 		INT 			PRIMARY KEY NOT NULL,
  Nome 			VARCHAR(50) 	NOT NULL,
  Artista 		VARCHAR(50) 	NULL,
  Tempo 		TIME 			NULL,
  CONSTRAINT FK_MusicaCD FOREIGN KEY (CDs_Codigo)
  REFERENCES CDs(Codigo)
);

-- 03. Criar relacionamentos
-- Feito no create (exercicio 2)

---------
-- DDL --
---------
-- 04. Mostrar todos os cds
SELECT * 
FROM CDs;

-- 05. Mostrar todos os campos nome e data da compra dos cds ordenados por nome
SELECT Nome, DataCompra 
FROM CDs 
ORDER BY Nome;

-- 06. Mostrar os campos nome e data da compra dos CDs classificados por data
-- de compra em ordem decrescente.
SELECT Nome, DataCompra 
FROM CDs 
ORDER BY DataCompra DESC;

-- 07. Mostrar o total gasto com a compra dos CDs.
SELECT SUM(ValorPago) as 'Valor Total'
FROM CDs;

-- 08. Mostrar todas as músicas (todos os campos) do CD de código igual a 1.
SELECT * FROM Musicas 
WHERE CDs_Codigo = 1;

-- 09. Mostrar o nome dos CDs presentes na tabela e o nome de todas as 
-- músicas de cada CD ordenados por nome do CD.
SELECT CDs.Nome as 'Nome do CD', Musicas.Nome as 'Musica'
FROM CDs
INNER JOIN Musicas
ON CDs.Codigo = Musicas.CDs_Codigo
ORDER BY CDs.Nome;

-- 10. Mostre o nome e o artista de todas músicas cadastradas.
SELECT Nome, Artista 
FROM Musicas;

-- 11. Mostre o tempo total de músicas cadastradas.
SELECT SEC_TO_TIME(SUM(TIME_TO_SEC(Musicas.Tempo))) as 'Tempo Total'
FROM Musicas;

-- 12. Mostre o número, nome e tempo das músicas do CD de código igual a 5 em
-- ordem de número da música.
SELECT Numero, Nome, Tempo
FROM Musicas
WHERE CDs_Codigo = 5
ORDER BY Numero;

-- 13. Mostre o tempo total de músicas por CD.
SELECT CDs.Nome, SEC_TO_TIME(SUM(TIME_TO_SEC(Musicas.Tempo))) as 'Tempo'
FROM CDs
INNER JOIN Musicas
ON CDs.Codigo = Musicas.CDs_Codigo
GROUP BY CDs.Nome; -- (A gente chegou a ver group by?)

-- 14. Mostre a quantidade de músicas cadastradas.
SELECT COUNT(Numero) as 'Total de Musicas'
FROM Musicas;

-- 15. Mostre a média de duração das músicas cadastradas.
SELECT SEC_TO_TIME(AVG(TIME_TO_SEC(Musicas.Tempo))) as 'Media do Tempo'
FROM Musicas;

-- 16. Mostre a quantidade de CDs.
SELECT COUNT(Codigo) as 'Total de CDs'
FROM CDs;

-- 17. Mostre o nome das músicas dos artistas que terminados com “Jr.”.
SELECT Nome
FROM Musicas
WHERE Artista LIKE '%Jr.';

-- 18. Mostre a quantidade de músicas do CD com o nome iniciado com “Max”.
SELECT COUNT(Musicas.Numero) as 'Total de Musicas no CD'
FROM Musicas
INNER JOIN CDs
ON CDs.Codigo = Musicas.CDs_Codigo
WHERE CDs.Nome LIKE 'Max%';

-- 19. Mostre o nome de todos CDs comprados em qualquer loja da “Ratke” e com
-- valor de compra maior ou igual a 400.
SELECT Nome
FROM CDs
WHERE LocalCompra LIKE 'Ratke%' && ValorPago >= 400;

-- 20. Mostre uma listagem com as informações das músicas do CD mais
-- recentemente comprado.
SELECT *
FROM Musicas
INNER JOIN CDs
ON CDs.Codigo = Musicas.CDs_Codigo
WHERE CDs.DataCompra = (SELECT MAX(CDs.DataCompra) FROM CDs);
