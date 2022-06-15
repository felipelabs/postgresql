SELECT * FROM curso;
SELECT * FROM categoria;

SELECT * FROM curso WHERE categoria_id = 1 OR categoria_id = 2;

SELECT * FROM curso WHERE categoria_id IN (1, 2);

SELECT id FROM categoria WHERE nome NOT LIKE '% %';

SELECT * FROM curso WHERE categoria_id IN (
	SELECT id FROM categoria WHERE nome NOT LIKE '% %'
);

SELECT curso.nome FROM curso WHERE categoria_id IN (
	SELECT id FROM categoria WHERE nome LIKE '% de %'
);

SELECT categoria
	FROM(
		SELECT categoria.nome AS categoria,
			COUNT (curso.id) AS numero_cursos
		FROM categoria
		JOIN curso ON curso.categoria_id = categoria.id
		GROUP BY categoria
	) AS categoria_curso
	WHERE numero_cursos > 3;
	
	
SELECT categoria.nome AS categoria,
			COUNT (curso.id) 
		FROM categoria
		JOIN curso ON curso.categoria_id = categoria.id
		GROUP BY categoria
		HAVING COUNT (curso.id) > 3;
		
		
  SELECT curso.nome,
         COUNT(aluno_curso.aluno_id) numero_alunos
    FROM curso
    JOIN aluno_curso ON aluno_curso.curso_id = curso.id
	GROUP BY 1
     HAVING COUNT(aluno_curso.aluno_id) > 2
	ORDER BY numero_alunos DESC;
	
SELECT curso
	FROM(
		SELECT curso.nome AS curso,
         	COUNT(aluno_curso.aluno_id) AS numero_alunos
    	FROM curso
    	JOIN aluno_curso ON aluno_curso.curso_id = curso.id
		GROUP BY 1
		ORDER BY numero_alunos DESC
	) AS nome_curso
	WHERE numero_alunos > 2;