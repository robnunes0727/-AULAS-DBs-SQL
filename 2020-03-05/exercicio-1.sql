-- (1) Create a table: (idCurso - INT - PK - AI, nome - VARCHAR(30) - NN, duracao - INT - NN, periodo - VARCHAR(30) - NN 
-- (2) Do a commit on GITHUB with this file.

CREATE TABLE cursos (
	idCurso		INT			PRIMARY KEY AUTO_INCREMENT		,
	nome		VARCHAR(30) 		NOT NULL				,
	duracao		INT 			NOT NULL				,
	periodo		VARCHAR(30)		NOT NULL				
);
