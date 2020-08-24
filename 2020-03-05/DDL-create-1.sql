-- DDL: CREATE - DROP - ALTER (ADD / MODIFY)
CREATE DATABASE IF NOT EXISTS faculdade
CHARACTER SET latin1
COLLATE latin1_swedish_ci;

-- Create table without PRIMARY KEY
CREATE TABLE tbAlunos (
	rgm		INT		 			 				,
	nome 		VARCHAR(50)		NOT NULL					,
	email		VARCHAR(50)		NOT NULL					,
	nasc		DATE			NOT NULL					
);

-- Drop wrong table
DROP TABLE tbAlunos;

-- Create table with PRIMARY KEY
CREATE TABLE tbAlunos (
	rgm		INT 			PRIMARY KEY	 				,
	nome 		VARCHAR(50)		NOT NULL					,
	email		VARCHAR(50)		NOT NULL					,
	nasc		DATE			NOT NULL					
);

-- Alter table adding sex
ALTER TABLE tbAlunos 
ADD sexo CHAR(1)
AFTER nome; 

-- Adding NOT NULL to sex field.
ALTER TABLE tbAlunos
MODIFY sexo char(1) NOT NULL;

