CREATE TABLE equipes (
	idequipe int NOT NULL UNIQUE,
	nome varchar(20) NOT NULL UNIQUE,
	estado varchar(20),
	tipo varchar(20),
	saldo_gols int DEFAULT 0,
	PRIMARY KEY(idequipe)
);

CREATE TABLE jogos (
	idequipe1 int NOT NULL,
	idequipe2 int NOT NULL,
	classico smallint NOT NULL,
	CONSTRAINT fk_equipe1 FOREIGN KEY (idequipe1) REFERENCES equipes(idequipe),
	CONSTRAINT fk_equipe2 FOREIGN KEY (idequipe2) REFERENCES equipes(idequipe),
	CONSTRAINT pk_jogo PRIMARY KEY (idequipe1,idequipe2)
);

CREATE TABLE partidas (
	idequipe1 int NOT NULL,
	idequipe2 int NOT NULL,
	data date NOT NULL,
	gols_equipe1 int DEFAULT 0,
	gols_equipe2 int DEFAULT 0,
	local varchar(20),
	CONSTRAINT fk_equipe1 FOREIGN KEY (idequipe1, idequipe2) REFERENCES jogos(idequipe1, idequipe2),
	CONSTRAINT pk_partida PRIMARY KEY (idequipe1,idequipe2, data)
);

CREATE TABLE jogadores (
	rg varchar(30) NOT NULL UNIQUE,
	nome varchar(30) NOT NULL,
	data_nascimento date,
	naturalidade varchar(20),
	idequipe int NOT NULL,
	CONSTRAINT fk_equipe FOREIGN KEY (idequipe) REFERENCES equipes(idequipe),
	CONSTRAINT pk_jogadores PRIMARY KEY (rg,nome)
);

CREATE TABLE posicao_jogador (
	rg varchar(30) NOT NULL,
	posicao varchar(30) NOT NULL,
	CONSTRAINT fk_jogador FOREIGN KEY (rg) REFERENCES jogadores(rg),
	CONSTRAINT pk_posicao_jogador PRIMARY KEY (rg,posicao)
);

CREATE TABLE diretores (
	equipe int NOT NULL,
	nome varchar(20) NOT NULL,
	sobrenome varchar(20) NOT NULL,
	CONSTRAINT fk_equipe FOREIGN KEY (equipe) REFERENCES equipes(idequipe),
	CONSTRAINT pk_diretor PRIMARY KEY (equipe, nome, sobrenome)
);

CREATE TABLE uniformes (
	equipe int NOT NULL,
	tipo varchar(20) NOT NULL,
	cor_Titular varchar(20) NOT NULL,
	CONSTRAINT fk_equipe FOREIGN KEY (equipe) REFERENCES equipes(idequipe),
	CONSTRAINT pk_uniforme PRIMARY KEY (equipe, tipo)
);

INSERT INTO equipes VALUES(1, 'A', 'MG', 'Profissional', 2);
INSERT INTO equipes VALUES(2, 'B', 'MG', 'Amador', 1);
INSERT INTO equipes VALUES(3, 'C', 'MG', 'Profissional', 3);
INSERT INTO equipes VALUES(4, 'D', 'MG', 'Amador', 6);
INSERT INTO equipes VALUES(5, 'E', 'MG', 'Profissional', -5);
INSERT INTO equipes VALUES(6, 'F', 'MG', 'Profissional', 0);
INSERT INTO equipes VALUES(7, 'G', 'MG', 'Amador', 1);
INSERT INTO equipes VALUES(8, 'H', 'MG', 'Profissional', 2);
INSERT INTO equipes VALUES(9, 'I', 'MG', 'Amador', 1);
INSERT INTO equipes VALUES(10, 'J', 'SP', 'Amador', 3);
INSERT INTO equipes VALUES(11, 'As', 'SP', 'Amador', 2);
INSERT INTO equipes VALUES(12, 'Bs', 'SP', 'Amador', 1);
INSERT INTO equipes VALUES(13, 'Cs', 'SP', 'Amador', 3);
INSERT INTO equipes VALUES(14, 'Ds', 'SP', 'Amador', 6);
INSERT INTO equipes VALUES(15, 'Es', 'SP', 'Amador', -5);
INSERT INTO equipes VALUES(16, 'Fs', 'SP', 'Amador', 0);
INSERT INTO equipes VALUES(17, 'Gs', 'SP', 'Amador', 1);
INSERT INTO equipes VALUES(18, 'Hs', 'SP', 'Amador', 2);
INSERT INTO equipes VALUES(19, 'Is', 'SP', 'Amador', 1);
INSERT INTO equipes VALUES(20, 'Js', 'SP', 'Profissional', 3);
INSERT INTO equipes VALUES(21, 'Af', 'MG', 'Amador', 2);
INSERT INTO equipes VALUES(22, 'Bf', 'MG', 'Profissional', 1);
INSERT INTO equipes VALUES(23, 'Cf', 'MG', 'Amador', 3);
INSERT INTO equipes VALUES(24, 'Df', 'MG', 'Profissional', 6);
INSERT INTO equipes VALUES(25, 'Ef', 'MG', 'Amador', -5);
INSERT INTO equipes VALUES(26, 'Ff', 'MG', 'Profissional', 0);
INSERT INTO equipes VALUES(27, 'Gf', 'MG', 'Profissional', 1);
INSERT INTO equipes VALUES(28, 'Hf', 'MG', 'Profissional', 2);
INSERT INTO equipes VALUES(29, 'If', 'MG', 'Amador', 1);
INSERT INTO equipes VALUES(30, 'Jf', 'RJ', 'Profissional', 3);
INSERT INTO equipes VALUES(31, 'Ag', 'RJ', 'Profissional', 2);
INSERT INTO equipes VALUES(32, 'Bg', 'RJ', 'Amador', 1);
INSERT INTO equipes VALUES(33, 'Cg', 'SP', 'Profissional', 3);
INSERT INTO equipes VALUES(34, 'Dg', 'RJ', 'Amador', 6);
INSERT INTO equipes VALUES(35, 'Eg', 'SP', 'Profissional', -5);
INSERT INTO equipes VALUES(36, 'Fg', 'RJ', 'Amador', 0);
INSERT INTO equipes VALUES(37, 'Gg', 'RJ', 'Profissional', 1);
INSERT INTO equipes VALUES(38, 'Hg', 'RJ', 'Amador', 2);
INSERT INTO equipes VALUES(39, 'Ig', 'RJ', 'Profissional', 1);
INSERT INTO equipes VALUES(40, 'Jg', 'SP', 'Amador', 3);

INSERT INTO jogos VALUES(2, 1, 1);
INSERT INTO jogos VALUES(1, 2, 0);
INSERT INTO jogos VALUES(10, 3, 1);
INSERT INTO jogos VALUES(5, 4, 0);
INSERT INTO jogos VALUES(6, 5, 1);
INSERT INTO jogos VALUES(7, 6, 0);
INSERT INTO jogos VALUES(9, 7, 1);
INSERT INTO jogos VALUES(1, 8, 0);
INSERT INTO jogos VALUES(2, 9, 1);
INSERT INTO jogos VALUES(4, 10, 0);

INSERT INTO partidas VALUES(2, 1, '2001-10-05', 1, 0);
INSERT INTO partidas VALUES(1, 2, '2001-10-05', 2, 0);
INSERT INTO partidas VALUES(10, 3, '2001-10-05', 1, 3);
INSERT INTO partidas VALUES(5, 4, '2001-10-05', 1, 1);
INSERT INTO partidas VALUES(6, 5, '2001-10-05', 5, 0);
INSERT INTO partidas VALUES(7, 6, '2001-10-05', 0, 0);
INSERT INTO partidas VALUES(9, 7, '2001-10-05', 3, 2);
INSERT INTO partidas VALUES(1, 8, '2001-10-05', 0, 4);
INSERT INTO partidas VALUES(2, 9, '2001-10-05', 7, 1);
INSERT INTO partidas VALUES(4, 10, '2001-10-05', 0, 0);

INSERT INTO jogadores VALUES('1234567890', 'Jog. A', '1995-10-06', 'Cidade A', 1);
INSERT INTO jogadores VALUES('1234567891', 'Jog. B', '1995-10-06', 'Cidade B', 2);
INSERT INTO jogadores VALUES('1234567892', 'Jog. C', '1995-10-06', 'Cidade C', 3);
INSERT INTO jogadores VALUES('1234567893', 'Jog. D', '1995-10-06', 'Cidade D', 4);
INSERT INTO jogadores VALUES('1234567894', 'Jog. E', '1995-10-06', 'Cidade E', 5);
INSERT INTO jogadores VALUES('1234567895', 'Jog. F', '1995-10-06', 'Cidade F', 6);
INSERT INTO jogadores VALUES('1234567896', 'Jog. G', '1995-10-06', 'Cidade G', 7);
INSERT INTO jogadores VALUES('1234567897', 'Jog. H', '1995-10-06', 'Cidade H', 8);
INSERT INTO jogadores VALUES('1234567898', 'Jog. I', '1995-10-06', 'Cidade I', 9);
INSERT INTO jogadores VALUES('1234567899', 'Jog. J', '1995-10-06', 'Cidade J', 10);

INSERT INTO posicao_jogador VALUES('1234567890', 'Ataque');
INSERT INTO posicao_jogador VALUES('1234567891', 'Defesa');
INSERT INTO posicao_jogador VALUES('1234567892', 'Ataque');
INSERT INTO posicao_jogador VALUES('1234567893', 'Defesa');
INSERT INTO posicao_jogador VALUES('1234567894', 'Ataque');
INSERT INTO posicao_jogador VALUES('1234567895', 'Defesa');
INSERT INTO posicao_jogador VALUES('1234567896', 'Ataque');
INSERT INTO posicao_jogador VALUES('1234567897', 'Defesa');
INSERT INTO posicao_jogador VALUES('1234567898', 'Ataque');
INSERT INTO posicao_jogador VALUES('1234567899', 'Defesa');

INSERT INTO diretores VALUES(1, 'Dir. A', 'da Silva');
INSERT INTO diretores VALUES(2, 'Dir. B', 'da Silva');
INSERT INTO diretores VALUES(3, 'Dir. C', 'da Silva');
INSERT INTO diretores VALUES(4, 'Dir. D', 'da Silva');
INSERT INTO diretores VALUES(5, 'Dir. E', 'da Silva');
INSERT INTO diretores VALUES(6, 'Dir. F', 'da Silva');
INSERT INTO diretores VALUES(7, 'Dir. G', 'da Silva');
INSERT INTO diretores VALUES(8, 'Dir. H', 'da Silva');
INSERT INTO diretores VALUES(9, 'Dir. I', 'da Silva');
INSERT INTO diretores VALUES(10, 'Dir. J', 'da Silva');

INSERT INTO uniformes VALUES(1, 'Titular', 'Amarelo');
INSERT INTO uniformes VALUES(2, 'Reserva', 'Verde');
INSERT INTO uniformes VALUES(3, 'Titular', 'Preto');
INSERT INTO uniformes VALUES(4, 'Reserva', 'Rosa chiclete');
INSERT INTO uniformes VALUES(5, 'Titular', 'Azul');
INSERT INTO uniformes VALUES(6, 'Reserva', 'Laranja');
INSERT INTO uniformes VALUES(7, 'Titular', 'Abacate');
INSERT INTO uniformes VALUES(8, 'Reserva', 'Branco');
INSERT INTO uniformes VALUES(9, 'Titular', 'Cinza');
INSERT INTO uniformes VALUES(10, 'Reserva', 'Roxo');
