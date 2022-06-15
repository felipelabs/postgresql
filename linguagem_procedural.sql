CREATE TABLE instrutor (
	id SERIAL PRIMARY KEY,
	nome VARCHAR(255) NOT NULL,
	salario DECIMAL(10, 2)
);

INSERT INTO instrutor (nome, salario) VALUES ('Felipe Neves', 100);
INSERT INTO instrutor (nome, salario) VALUES ('Diogo Mascarenhas', 200);
INSERT INTO instrutor (nome, salario) VALUES ('Nico Steppat', 300);
INSERT INTO instrutor (nome, salario) VALUES ('Juliana', 400);
INSERT INTO instrutor (nome, salario) VALUES ('Priscila', 500);


CREATE FUNCTION dobroSalario(instrutor) RETURNS DECIMAL AS $$
	SELECT $1.salario * 2 AS salario;
$$ LANGUAGE SQL;

SELECT nome, dobroSalario(instrutor.*) FROM instrutor;

CREATE OR REPLACE FUNCTION cria_instrutor_falso() RETURNS instrutor AS $$
	SELECT 22, 'Nome Falso', 200::DECIMAL;
$$ LANGUAGE SQL;

SELECT * from cria_instrutor_falso();

DROP FUNCTION instutorBemPago;

CREATE FUNCTION instrutorBemPago(valor_salario DECIMAL) RETURNS SETOF instrutor AS $$
	SELECT * FROM instrutor WHERE salario > valor_salario;
$$ LANGUAGE SQL;

SELECT * FROM instrutorBemPago(300);

---------------------------------------------------




DROP FUNCTION soma_e_produto;

CREATE TYPE dois_valores AS (soma INTEGER, produto INTEGER);

CREATE FUNCTION soma_e_produto (IN numero_1 INTEGER, IN numero_2 INTEGER) RETURNS dois_valores AS $$
	SELECT numero_1 + numero_2 AS soma, numero_1 + numero_2 AS produto;
$$ LANGUAGE SQL;

SELECT * FROM soma_e_produto(3, 3);


-----------------------------------------------------




CREATE FUNCTION primeira_pl() RETURNS INTEGER AS $$
	DECLARE
		primeira_variavel INTEGER DEFAULT 3;
	BEGIN
		-- Varios comandos SQL
		primeira_variavel := primeira_variavel * 2;
		
		BEGIN
			primeira_variavel := 7;
		END;
		
		RETURN primeira_variavel;
	END
$$ LANGUAGE plpgsql;

SELECT primeira_pl();

DROP FUNCTION primeira_pl;

