
DROP TRIGGER check_matricula ON Matricula;

CREATE OR REPLACE FUNCTION check_matricula() RETURNS trigger AS $check_matricula$
DECLARE
quanti_matriculas INTEGER;
BEGIN
SELECT COUNT(*) INTO quanti_matriculas WHERE Aluno = NEW.Aluno FROM Matricula;
IF quanti_matriculas > 20 THEN
RAISE EXCEPTION 'Nao pode cadastrar mais disciplinas para esse aluno';
END IF;
RETURN NEW;
END;
$check_matricula$ LANGUAGE plpgsql;
CREATE TRIGGER check_matricula
BEFORE INSERT ON Matricula
EXECUTE PROCEDURE check_matricula();
