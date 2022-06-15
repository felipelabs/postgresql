DROP TABLE curso;

CREATE TABLE curso (
	id INTEGER PRIMARY KEY,
	nome VARCHAR(255)
)

INSERT INTO curso (id, nome) VALUES (1, 'HTML');
INSERT INTO curso (id, nome) VALUES (2, 'Javascript');

SELECT * FROM curso;

DROP TABLE aluno;

CREATE TABLE aluno(
	id SERIAL PRIMARY KEY,
	nome VARCHAR(255) NOT NULL
)

INSERT INTO aluno (nome) VALUES ('Diogo');
INSERT INTO aluno (nome) VALUES ('Vinicius');

DROP TABLE aluno_curso;

CREATE TABLE aluno_curso(
	aluno_id INTEGER,
	curso_id INTEGER,
	PRIMARY KEY (aluno_id, curso_id),
	FOREIGN KEY (aluno_id)
	 REFERENCES aluno(id),
	FOREIGN KEY (curso_id)
	 REFERENCES curso(id)
)

INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (1, 1);
INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (2, 1);

SELECT * FROM aluno;
SELECT * FROM curso;
SELECT * FROM aluno_curso;

SELECT aluno.nome as aluno_nome,
	   curso.nome as curso_nome
	FROM aluno
	JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
	JOIN curso ON curso.id = aluno_curso.curso_id

SELECT A.nome AS "Nome Aluno",
	   C.nome AS "Nome Curso"
	FROM aluno as A
	JOIN aluno_curso as AC ON AC.aluno_id = A.id
	JOIN curso as C ON C.id = AC.curso_id
	
	INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (2, 2);

	INSERT INTO aluno (nome) VALUES ('Nico');
	
	INSERT INTO curso (id, nome) VALUES (3, 'CSS');

SELECT aluno.nome as aluno_nome,
	   curso.nome as "Nome do curso"
	   FROM aluno
	   LEFT JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
	   LEFT JOIN curso ON curso.id = aluno_curso.curso_id

SELECT aluno.nome as aluno_nome,
	   curso.nome as "Nome do curso"
	   FROM aluno
	   RIGHT JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
	   RIGHT JOIN curso ON curso.id = aluno_curso.curso_id

SELECT aluno.nome as aluno_nome,
	   curso.nome as "Nome do curso"
	   FROM aluno
	   FULL JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
	   FULL JOIN curso ON curso.id = aluno_curso.curso_id

SELECT aluno.nome as aluno_nome,
	   curso.nome as "Nome do curso"
	   FROM aluno
	   CROSS JOIN curso

INSERT INTO aluno (nome) VALUES ('João');