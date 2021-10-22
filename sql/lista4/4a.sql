INSERT INTO equipes VALUES(1,'COR','MG','Profissional', 2);
INSERT INTO equipes VALUES(2,'PAL','MG','Profissional', 2);
INSERT INTO equipes VALUES(3,'SAO','MG','Profissional', 2);
INSERT INTO equipes VALUES(4,'GER',NULL,'SELECAO',DEFAULT); 

INSERT INTO jogos VALUES(1,2,1);
INSERT INTO jogos VALUES(1,3,1);
INSERT INTO jogos VALUES(3,2,1);

INSERT INTO partidas VALUES(1,2,'2001-10-05',1,DEFAULT,'itaquera');
INSERT INTO partidas VALUES(1,3,'2001-10-08',1,DEFAULT,'itaquera');
INSERT INTO partidas VALUES(3,2,'2001-10-11',2,2,'Morumbi');

INSERT INTO jogadores VALUES('11111111','Cassio','2000-01-01','BRA',1);
INSERT INTO jogadores VALUES('22222222','Ze Roberto','2000-01-01','BRA',2);
INSERT INTO jogadores VALUES('33333333','Rogerio Ceni','2000-01-01','BRA',3);

INSERT INTO posicao_jogador VALUES('11111111','goleiro');
INSERT INTO posicao_jogador VALUES('22222222','atacante');
INSERT INTO posicao_jogador VALUES('33333333','goleiro');

INSERT INTO diretores VALUES(1,'Tite','Bachi');
INSERT INTO diretores VALUES(2,'Felipao','Scolari');
INSERT INTO diretores VALUES(3,'Hernan','CreMGo');

INSERT INTO uniformes VALUES(1,'listrado','preto');
INSERT INTO uniformes VALUES(2,'listrado','verde');
INSERT INTO uniformes VALUES(3,'tricolor','vermelho');
INSERT INTO uniformes VALUES(4,'Retro','branco');