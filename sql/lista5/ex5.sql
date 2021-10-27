CREATE OR REPLACE FUNCTION check_terceirizado() RETURNS trigger AS
$check_terceirizado$
BEGIN
PERFORM * FROM l11_terceirizado WHERE PECPF = NEW.TCPF;
IF FOUND THEN
RAISE EXCEPTION 'Este funcionário já se encontra na tabela de
tercerizados';
END IF;
RETURN NEW;
END;
$check_terceirizado$ LANGUAGE plpgsql;
DROP TRIGGER check_terceirizado ON l11_terceirizado;
CREATE TRIGGER check_terceirizado
BEFORE UPDATE OR INSERT ON l11_terceirizado
FOR EACH ROW EXECUTE PROCEDURE check_terceirizado();