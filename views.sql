SELECT categoria
	FROM(
		SELECT categoria.nome AS categoria,
			COUNT (curso.id) AS numero_cursos
		FROM categoria
		JOIN curso ON curso.categoria_id = categoria.id
		GROUP BY categoria
	) AS categoria_curso
	WHERE numero_cursos > 3;
	
CREATE VIEW vw_cursos_por_categorias AS SELECT categoria.nome AS categoria,
			COUNT (curso.id) AS numero_cursos
		FROM categoria
		JOIN curso ON curso.categoria_id = categoria.id
		GROUP BY categoria
		
SELECT * FROM  vw_cursos_por_categorias;

CREATE VIEW vw_cursos_programacao AS SELECT nome FROM curso WHERE categoria_id = 2;

SELECT * FROM vw_cursos_programacao;

SELECT * FROM vw_cursos_programacao WHERE nome = 'PHP';


SELECT categoria.id AS categoria_id, vw_cursos_por_categorias.*
FROM vw_cursos_por_categorias
JOIN categoria ON categoria.nome = vw_cursos_por_categorias.categoria;
