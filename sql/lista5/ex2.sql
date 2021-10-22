-- Implemente uma regra de negócio que impede que professores tenham sua titulação atualizada para um status anterior segundo a
-- ordem < Mestre, Doutor, Livre-docente, Titular>. Por exemplo, se a titulação de um dado professor for atualizada para Mestre,
-- sendo que sua titulação anterior é Doutor ou acima, levante uma exceção impedindo a operação.


DROP TRIGGER check_titulo_professor ON Matricula;

CREATE OR REPLACE FUNCTION check_titulo_professor() RETURNS trigger AS $check_titulo_professor$
DECLARE
titulo_prof INTEGER;
BEGIN
SELECT Titulação INTO titulo_prof WHERE NFunc = NEW.NFunc FROM Matricula;
IF NEW.Titulação = 'Titular' THEN RETURN NEW;
IF NEW.Titulação = 'Livre-docente' AND Titulação != 'Titular' THEN RETURN NEW;
IF NEW.Titulação = 'Doutor' AND Titulação != 'Livre-docente' AND Titulação != 'Titular' THEN RETURN NEW;
-- Mestre não pode ser um valor inserido no UPDATE pois viola a regra de negócio
END IF;
RAISE EXCEPTION 'Nao pode regredir titulação';

END;
$check_titulo_professor$ LANGUAGE plpgsql;
CREATE TRIGGER check_titulo_professor
BEFORE UPDATE ON Professor
FOR EACH ROW EXECUTE PROCEDURE check_titulo_professor();
