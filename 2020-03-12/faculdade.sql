----- RESETA TUDO -----
DROP DATABASE faculdade;

----- CRIA DATABASE -----
CREATE SCHEMA IF NOT EXISTS faculdade;
USE faculdade;

----- CRIAÇÃO 1 -----
CREATE TABLE tbAlunos (
	rgm INT PRIMARY KEY,
	nome VARCHAR(50),
	sexo CHAR(1),
	email VARCHAR(50),
	nascimento DATE
);

CREATE TABLE cursos (
	idCurso INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(50),
	duracao INT(11),
	periodo VARCHAR(30)
);

----- INSERT 1 -----
INSERT INTO tbAlunos (rgm, nome, sexo, email, nascimento) 
VALUES (201, "Maria Silva", "F", "maria@gmail.com", "2000-05-20");

INSERT INTO tbAlunos VALUES (202, "João Abreu", "M", "joao@uol.com", "1999-02-13");

----- DELETE 1 -----
DELETE FROM tbAlunos WHERE rgm > 0;

----- ALTER 1 -----
ALTER TABLE tbAlunos ADD idCurso INT;

ALTER TABLE tbAlunos ADD CONSTRAINT FK_idCurso
FOREIGN KEY tbAlunos(idCurso) REFERENCES Cursos(idCurso);

ALTER TABLE tbAlunos MODIFY idCurso INT NOT NULL; -- Erro por ser FK

----- INSERT 2 (exercicio) -----
INSERT INTO tbAlunos (rgm, nome, sexo, email, nascimento, idcurso)
VALUES (203, "Pablo", "M", "google@gmail", "2002-01-20", 1); -- Erro de FK

INSERT INTO cursos (idCurso, nome, duracao, periodo)
VALUES (1, "Biologia", 8, "matutino");

INSERT INTO cursos (nome, duracao, periodo)
VALUES ("ADS", 4, "matutino");

INSERT INTO cursos (nome, duracao, periodo)
VALUES ("ADS", 4, "noturno");

INSERT INTO tbAlunos (rgm, nome, sexo, email, nascimento, idcurso)
VALUES (201, "Ana Silva", "F", "ana@gmail.com", "2000-05-10", 1), -- Agora vai 
	   (202, "Pedro Sousa", "M", "pedro@uol.com.br", "1999-10-05", 1);
