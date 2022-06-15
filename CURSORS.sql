CREATE OR REPLACE FUNCTION cria_instrutor () RETURNS TRIGGER AS $$
	DECLARE
		media_salarial DECIMAL;
		instrutores_recebe_menos INTEGER DEFAULT 0;
		total_instrutores INTEGER DEFAULT 0;
		salario INTEGER;
		percentual DECIMAL(5, 2);
	BEGIN
		
		SELECT AVG(instrutor.salario) INTO media_salarial FROM instrutor WHERE id <> NEW.id;
		
		START TRANSACTION
		IF NEW.salario > media_salarial THEN
			INSERT INTO log_instrutores (informacao) VALUES (NEW.nome || 'recebe acima da média.');
		END IF;
		
		SELECT instrutores_internos(NEW.id) INTO cursor_salarios;
		LOOP
			FETCH cursor_salarios INTO salario;
			EXIT WHEN NOT FOUND;
			total_instrutores := total_instrutores + 1;
			
			IF NEW.salario > salario THEN
				instrutores_recebem_menos := instrutores_recebem_menos + 1;
			END IF;
		END LOOP;
		
		percentual = instrutores_recebem_menos::DECIMAL / total_instutores::DECIMAL * 100;
		
		ASSERT percentual < 100::DECIMAL, 'Instrutores novos não podem receber mais do que todos os antigos';
		
		INSERT INTO log_instutores (informacao, test)
			VALUES (NEW.nome || 'recebe mais do que ' || '% da grade de instrutores');
		COMMIT;
		
		RETURN NEW;
	
	EXCEPTION
		WHEN undefined_column THEN
			RAISE NOTICE 'Algo de errado não esta certo.';
			RAISE EXCEPTION 'Erro complicado de fazer';
			
	END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER cria_log_instrutores AFTER INSERT ON instrtutor
	FOR EACH ROW EXECUTE FUNCTION cria_instrutor();

BEGIN;
INSERT INTO instrutor (nome, salario) VALUES ('Maria', 600);
ROLLBACK;

-----------------------------------------------------------

CREATE FUNCTION instrtutores_internos() RETURNS refcursor AS $$
	DECLARE
		cursor_salarios refcursor;
		salario DECIMAL;
	BEGIN
		OPEN cursor_salario FOR SELECT instrutor.salario FROM instrtutor WHERE id <> id_instrtutor AND salario > 0;
		
		FETCH LAST FROM cursor_salario INTO salarios;
		FETCH NEXT FROM cursor_salario INTO salarios;
		FETCH PRIOR FROM cursor_salario INTO salarios;
		FETCH FIRST FROM cursor_salario INTO salarios;
		
		MOVE LAST FROM cursor_salarios;
		MOVE NEXT FROM cursor_salarios;
		MOVE PRIOR FROM cursor_salarios;
		MOVE FIRST FROM cursor_salarios;
		
		CLOSE cursor_salarios;
		RETURN cursor_salarios;
	END;
$$ LANGUAGE plpgsql;