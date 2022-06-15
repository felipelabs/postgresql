CREATE SEQUENCE eu_criei;

SELECT NEXTVAL('eu_criei')

CREATE TABLE auto (
	id SERIAL PRIMARY KEY DEFAULT NEXTVAL('eu_criei'), 
	nome VARCHAR(30) NOT NULL
);

INSERT INTO auto (nome) VALUES ('Vinicius Dias');
INSERT INTO auto (id, nome) VALUES (2, 'Vinicius Dias');


CREATE TYPE CLASSIFICACAO AS ENUM ('LIVRE', '12_ANOS', '14_ANOS', '16_ANOS', '18_ANOS');
CREATE TEMPORARY TABLE filme (
	id SERIAL PRMIARY KEY,
	nome VARCHAR(255) NOT NULL,
	classificacao CLASSIFICACAO
);

