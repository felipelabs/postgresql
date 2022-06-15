CREATE FUNCTION primeiraFuncao() RETURNS INTEGER AS '
	SELECT (5 - 3) * 2
' LANGUAGE SQL;


SELECT  primeiraFuncao();

SELECT  primeiraFuncao() AS numero;

DROP FUNCTION somaNumeros
CREATE FUNCTION somaNumeros(numero_1 INTEGER, numero_2 INTEGER) RETURNS INTEGER AS '
	SELECT numero_1 + numero_2
' LANGUAGE SQL;

CREATE FUNCTION somaNumeros( INTEGER, INTEGER) RETURNS INTEGER AS '
	SELECT $1 + $2
' LANGUAGE SQL;

SELECT somaNumeros(2, 2) AS soma;

CREATE TABLE a (nome VARCHAR(255));

DROP FUNCTION cria_a;

CREATE FUNCTION cria_a(nome VARCHAR) RETURNS VARCHAR AS $$
	INSERT INTO a (nome) VALUES(cria_a.nome);
	
	SELECT nome;
$$ LANGUAGE SQL;