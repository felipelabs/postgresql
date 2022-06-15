DROP TABLE funcionarios;

CREATE TABLE funcionarios(
    id SERIAL PRIMARY KEY,
    matricula VARCHAR(10),
    nome VARCHAR(255),
    sobrenome VARCHAR(255)
);

INSERT INTO funcionarios (matricula, nome, sobrenome) VALUES ('M001', 'Diogo', 'Mascarenhas');
INSERT INTO funcionarios (matricula, nome, sobrenome) VALUES ('M002', 'Vinícius', 'Dias');
INSERT INTO funcionarios (matricula, nome, sobrenome) VALUES ('M003', 'Nico', 'Steppat');
INSERT INTO funcionarios (matricula, nome, sobrenome) VALUES ('M004', 'João', 'Roberto');
INSERT INTO funcionarios (matricula, nome, sobrenome) VALUES ('M005', 'Diogo', 'Mascarenhas');
INSERT INTO funcionarios (matricula, nome, sobrenome) VALUES ('M006', 'Alberto', 'Martins');

SELECT * FROM funcionarios;

SELECT * FROM funcionarios
ORDER BY nome;

SELECT * FROM funcionarios
ORDER BY nome DESC;

SELECT * FROM funcionarios
ORDER BY nome, matricula DESC;

SELECT * FROM funcionarios
ORDER BY 3, 4, 2;

SELECT * FROM funcionarios
ORDER BY 4 DESC, nome DESC, 2 ASC;

SELECT * FROM funcionarios
ORDER BY 4 DESC, funcionarios.nome DESC, 2 ASC;


SELECT * FROM funcionarios
ORDER BY nome
LIMIT 3;

SELECT * FROM funcionarios
ORDER BY nome
LIMIT 5
OFFSET 2;

SELECT COUNT (id),
       SUM(id),
       MAX(id),
       MIN(id),
       ROUND(AVG(id),0)
  FROM funcionarios;
  
SELECT nome
  FROM funcionarios
  ORDER BY nome;

SELECT DISTINCT nome, sobrenome
  FROM funcionarios
  ORDER BY nome;
 
SELECT nome, sobrenome, COUNT(id)
  FROM funcionarios
  GROUP BY nome, sobrenome
  ORDER BY nome;
  
  
SELECT curso.nome,
	COUNT (aluno.id)
	FROM aluno
	JOIN aluno_curso ON aluno.id = aluno_curso.aluno_id
	JOIN curso ON curso.id = aluno_curso.curso_id
GROUP BY 1
ORDER BY 1


SELECT * FROM aluno;
SELECT * FROM aluno_curso;
SELECT * FROM curso;

SELECT curso.nome,
	COUNT (aluno.id)
	FROM curso
	LEFT JOIN aluno_curso ON aluno_curso.curso_id = curso.id
	LEFT JOIN aluno ON aluno.id = aluno_curso.curso_id
	-- WHERE curso.nome = 'Javascript'
    GROUP BY 1
	HAVING 	COUNT (aluno.id) > 0

SELECT nome, 
	COUNT(id)
	FROM funcionarios
	GROUP BY nome
	HAVING COUNT (id) > 1;
	
