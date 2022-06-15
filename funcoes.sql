SELECT * FROM aluno;

SELECT (primeiro_nome || ' ' || ultimo_nome) AS nome_completo FROM aluno;

SELECT CONCAT('Vinicius', NULL, 'Dias');

SELECT UPPER(CONCAT('Vinicius', ' ', 'Dias')) || ' ';

SELECT TRIM(UPPER(CONCAT('Vinicius', ' ', 'Dias')) || ' ');


SELECT (primeiro_nome || ' ' || ultimo_nome) AS nome_completo, 
	(NOW()::DATE - data_nascimento) / 365 AS idade
FROM aluno;

SELECT (primeiro_nome || ' ' || ultimo_nome) AS nome_completo, 
	EXTRACT(YEAR FROM AGE(data_nascimento)) AS idade
FROM aluno;


SELECT TO_CHAR(NOW(), 'DD/MM/YYYY');

SELECT TO_CHAR(128.3::REAL, '999D99');