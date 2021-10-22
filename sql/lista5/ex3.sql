-- Acrescente um atributo nota_media na tabela disciplina e escreva um gatilho que mantém o valor deste atributo atualizado de
-- acordo com as atualizações da tabela matricula; isto é, sempre após um delete, update ou insert na tabela matricula, deve-se
-- computar a média de todos os alunos matriculados na respectiva disciplina, e atualizar o atributo nota_media da tabela disciplina.

ALTER TABLE disciplina ADD COLUMN nota_media float;

DROP TRIGGER calculate_media ON Matricula;

CREATE OR REPLACE FUNCTION calculate_media() RETURNS trigger AS $calculate_media$
DECLARE
media INTEGER;
BEGIN
SELECT AVG(Nota) INTO media WHERE Sigla = NEW.Sigla GROUP BY Nota FROM Matricula;
UPDATE disciplina SET nota_media = media WHERE Sigla = NEW.Sigla;
END;
$calculate_media$ LANGUAGE plpgsql;
CREATE TRIGGER calculate_media
BEFORE INSERT OR UPDATE OR DELETE ON Matricula
FOR EACH ROW EXECUTE PROCEDURE calculate_media();