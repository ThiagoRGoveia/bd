CREATE TABLE Aluno(
 NUSP NUMERIC(10) NOT NULL,
 Nome VARCHAR(100) NOT NULL,
 Idade SMALLINT,
 DataNasc DATE,
 CidadeOrigem VARCHAR(100) DEFAULT 'Sao Carlos',

 CONSTRAINT aluno_pk PRIMARY KEY(NUSP),
 CONSTRAINT aluno_un UNIQUE(Nome),
 CONSTRAINT aluno_ck CHECK(Idade > 15)
);

CREATE TABLE Professor(
 NFunc NUMERIC(10) NOT NULL,
 Nome VARCHAR(100) NOT NULL,
 Idade SMALLINT,
 Titulacao VARCHAR(100),

 CONSTRAINT prof_pk PRIMARY KEY(NFunc),
 CONSTRAINT prof_un UNIQUE(Nome),
 CONSTRAINT prof_idade_ck CHECK(Idade > 18),
 CONSTRAINT prof_tit_ck CHECK(Titulacao IN ('Mestrado','Doutorado'))
);

CREATE TABLE Disciplina(
 Sigla CHAR(5) NOT NULL,
 Nome VARCHAR(100) NOT NULL,
 NCred SMALLINT DEFAULT 4 NOT NULL,
 Professor NUMERIC(10) NOT NULL,
 Livro VARCHAR(100),

 CONSTRAINT disc_pk PRIMARY KEY(Sigla),
 CONSTRAINT disc_ncred_ck CHECK(NCred > 0),
 CONSTRAINT disc_fk FOREIGN KEY(Professor) REFERENCES Professor(NFunc) ON DELETE CASCADE
);

CREATE TABLE TURMA(
  SIGLA	CHAR(5) NOT NULL,
  NUMERO	SMALLINT NOT NULL,
  NALUNOS	SMALLINT DEFAULT 0,

  CONSTRAINT turma_pk PRIMARY KEY (Sigla, Numero),
  CONSTRAINT turma_fk FOREIGN KEY (Sigla) REFERENCES DISCIPLINA (Sigla) ON DELETE CASCADE,
  CONSTRAINT turma_ck CHECK(NAlunos >=0)
);


CREATE TABLE Matricula(
 Sigla CHAR(5) NOT NULL,
 Numero SMALLINT NOT NULL,
 Aluno NUMERIC(7) NOT NULL,
 Ano SMALLINT NOT NULL,
 Nota NUMERIC(4,2) DEFAULT 0,
 FrequenciaPorc NUMERIC(5,2) DEFAULT 0,

 CONSTRAINT matricula_pk PRIMARY KEY(Sigla, Numero, Aluno, Ano),
 CONSTRAINT matricula_fk1 FOREIGN KEY(Sigla,Numero) REFERENCES Turma(Sigla, Numero) ON DELETE CASCADE,
 CONSTRAINT matricula_fk2 FOREIGN KEY(Aluno) REFERENCES Aluno(NUSP) ON DELETE CASCADE,
 CONSTRAINT matricula_ck CHECK(Nota >=0)
);


INSERT INTO Aluno VALUES(1, 'Ana', 20, '06/07/1990','Jau');
INSERT INTO Aluno VALUES(2, 'Andre', 19, '06/09/1991','Lins');
INSERT INTO Aluno VALUES(3, 'Adriana', 18, '03/08/1992','Limeira');
INSERT INTO Aluno VALUES(4, 'Albertina', 18, '02/09/1992','Descalvado');
INSERT INTO Aluno (NUSP, NOME, IDADE, DATANASC, CIDADEORIGEM) VALUES ('30', 'Petrus', '30', TO_DATE('05/02/80', 'DD/MM/RR'), 'Marilia');
INSERT INTO Aluno (NUSP, NOME, IDADE, DATANASC, CIDADEORIGEM) VALUES ('40', 'Marcos', '35', TO_DATE('03/07/85', 'DD/MM/RR'), 'Vitoria');

/*Exemplo do uso de DEFAULT*/
INSERT INTO Aluno(NUSP,Nome,Idade,DataNasc) VALUES(5, 'Adilson', 20, '06/07/1990');

INSERT INTO Professor VALUES(10, 'Paulo', 32, 'Doutorado');
INSERT INTO Professor VALUES(20, 'Pedro', 26, 'Mestrado');
INSERT INTO Professor VALUES(30, 'Petrus', 40, 'Doutorado');
INSERT INTO Professor VALUES(40, 'Marcos', 35, 'Mestrado');


INSERT INTO Disciplina VALUES('SC540', 'BDInfo', 4, 10, 'Fundamentos de Bases de Dados');
INSERT INTO Disciplina VALUES('SC241', 'LabBD', 4, 20, 'Oracle guide');
INSERT INTO Disciplina VALUES('SM300', 'Calculo', 6, 30, 'Introdução ao Cálculo');
INSERT INTO Disciplina VALUES('SM400', 'Algebra', 4, 30, 'Introdução à Algebra');

INSERT INTO Turma VALUES('SC540',1,2);
INSERT INTO Turma VALUES('SC241',1,2);
INSERT INTO Turma VALUES('SC540',2,2);
INSERT INTO Turma VALUES('SC241',2,2);
INSERT INTO Turma VALUES('SM300',1,2);
INSERT INTO Turma VALUES('SM400',1,2);
INSERT INTO Turma VALUES('SM300',2,1);
INSERT INTO Turma VALUES('SM400',2,0);

INSERT INTO Matricula VALUES('SC540', 1, 1, 2009, 4.5, 59);
INSERT INTO Matricula VALUES('SC540', 1, 2, 2009, 4.6, 50);
INSERT INTO Matricula VALUES('SC540', 1, 3, 2009, 4.0, 60);

INSERT INTO Matricula VALUES('SC540', 1, 1, 2010, 5.5, 65);
INSERT INTO Matricula VALUES('SC540', 1, 2, 2010, 7.6, 80);
INSERT INTO Matricula VALUES('SC540', 1, 3, 2010, 4.2, 65);

INSERT INTO Matricula VALUES('SC241', 1, 1, 2009, 4.5, 59);
INSERT INTO Matricula VALUES('SC241', 1, 2, 2009, 6.5, 40);
INSERT INTO Matricula VALUES('SC241', 1, 3, 2009, 4.5, 59);

INSERT INTO Matricula VALUES('SC241', 1, 1, 2010, 9.0, 30);
INSERT INTO Matricula VALUES('SC241', 1, 3, 2010, 4.5, 59);

INSERT INTO Matricula VALUES('SM300', 1, 2, 2009, 3.0, 59);
INSERT INTO Matricula VALUES('SM300', 1, 3, 2010, 5.1, 50);
INSERT INTO Matricula VALUES('SM300', 2, 4, 2010, 5.8, 100);
INSERT INTO Matricula VALUES('SM300', 2, 5, 2010, 9.1, 50);

-- ex1

-- DROP TRIGGER check_matricula ON Matricula;

CREATE OR REPLACE FUNCTION check_matricula() RETURNS trigger AS $check_matricula$
DECLARE
quanti_matriculas INTEGER;
BEGIN
SELECT COUNT(*) INTO  quanti_matriculas FROM Matricula WHERE Aluno = NEW.Aluno ;
IF quanti_matriculas >= 20 THEN
RAISE EXCEPTION 'Nao pode cadastrar mais disciplinas para esse aluno';
END IF;
RAISE NOTICE '%', quanti_matriculas;
RETURN NEW;
END;
$check_matricula$ LANGUAGE plpgsql;
CREATE TRIGGER check_matricula
BEFORE INSERT ON Matricula
FOR EACH ROW EXECUTE PROCEDURE check_matricula();
-- fim do  ex1
