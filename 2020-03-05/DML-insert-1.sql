-- DML: INSERT, SELECT
USE faculdade;

-- Insert with multiple entries
INSERT INTO tbAlunos (rgm, nome, sexo, email, nasc)
VALUES  (201, "Ana Silva", "F", "ana@gmail.com", "2000-05-10"),
	(202, "Pedro Souza", "M", "pedro@uol.com.br", "1999-09-14");

SELECT * FROM faculdade.tbalunos;
