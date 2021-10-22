-- Usando trigger, implemente o fato de que o atributo Aluno.Idade é derivado de Aluno.DataNasc, isto é, ao se fazer update (after
-- update) da data de nascimento, faça o update correspondente da idade.

DROP TRIGGER calculate_age ON ALUNO;

CREATE OR REPLACE FUNCTION calculate_age() RETURNS trigger AS $calculate_age$
DECLARE
today INTEGER;
BEGIN
today := EXTRACT(YEAR FROM CURRENT_DATE);
NEW.Idade := today - EXTRACT(year FROM age(NEW.DataNasc));
RETURN NEW;
END;
$calculate_age$ LANGUAGE plpgsql;
CREATE TRIGGER calculate_age
AFTER UPDATE OR INSERT ON ALUNO
FOR EACH ROW EXECUTE PROCEDURE calculate_age();