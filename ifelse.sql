DROP FUNCTION salario_ok;

CREATE FUNCTION salario_ok(instrutor instrutor) RETURNS VARCHAR AS $$ 
	BEGIN
		SELECT * FROM instrutor WHERE id = id_instrutor INTO instrutor;
		-- se o salário do instrutor for maior que 200 está ok, senão, pode aumentar
		
		/*IF instrutor.salario > 300 THEN
			RETURN 'Salario está ok';
		ELSEIF instrutor.salario = 300 THEN
			RETURN 'Salário pode aumentar';
		ELSE
			RETURN 'Salario está defasado';
		END IF;	*/
		CASE instrutor.salario
			WHEN 100 THEN
				RETURN 'Salario muito baixo';
			WHEN  200 THEN
				RETURN 'Salario baixo';
			WHEN 300 THEN
				RETURN 'Salario ok';
			ELSE
				RETURN 'Salario ótimo'
		END CASE
	END;
$$ LANGUAGE plpgsql;

SELECT nome, salario_ok(instrutor) FROM instrutor;

--------------------------------------------------------------------

CREATE TABLE a (nome VARCHAR(255) NOT NULL);

CREATE OR REPLACE FUNCTION cria_a (nome VARCHAR) RETURNS void AS $$
	BEGIN
		INSERT INTO a (nome) VALUES ('Patricia');
	END
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION cria_instrutor_falso() RETURNS instrutor AS $$
	DECLARE
		retorno instrutor;
	BEGIN
		SELECT 22, 'Nome falso', 200::DECIMAL INTO retorno;
		RETURN retorno;
	END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION instrtutores_bem_pagos(valor_salario DECIMAL) RETURNS SETOF instrutor AS $$
	BEGIN
		RETURN QUERY SELECT * FROM instrutor WHERE salario > valor_salario;
	END;
$$ LANGUAGE plpgsql;


