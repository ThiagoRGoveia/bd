--Q1
SELECT * FROM equipes LEFT JOIN jogadores ON jogadores.idequipe = equipes.idequipe;

--Q2
SELECT * FROM uniformes JOIN equipes ON equipes.idequipe = uniformes.equipe WHERE uniformes.tipo = 'Titular' AND equipe IN (
	SELECT idequipe FROM equipes WHERE estado = 'SP' AND tipo = 'Profissional'
);

--Q2
SELECT * FROM uniformes JOIN equipes ON equipes.idequipe = uniformes.equipe WHERE uniformes.tipo = 'Titular' AND equipes.estado = 'SP' AND equipes.tipo = 'Titular'

--Q3
SELECT jogadores.nome, jogadores.naturalidade, jogadores.idequipe, equipes.estado FROM jogadores JOIN equipes ON equipes.idequipe = jogadores.idequipe --falta a posicao

--Q4 
SELECT estado, AVG(saldo_gols) FROM equipes GROUP BY equipes.estado ORDER BY equipes.estado

--Q5
SELECT tipo, estado, AVG(saldo_gols) FROM equipes GROUP BY equipes.tipo, equipes.estado ORDER BY equipes.tipo, equipes.estado

--Q6 
SELECT estado, AVG(saldo_gols) 
FROM equipes 
WHERE equipes.tipo = 'Titular'
GROUP BY equipes.estado, equipes.tipo 
HAVING AVG(saldo_gols) >= 3 AND AVG(saldo_gols) <= 10

--Q7
SELECT estado, AVG(saldo_gols) FROM equipes WHERE equipes.tipo = 'Titular' AND saldo_gols >= 1 GROUP BY equipes.estado, equipes.tipo 

--Q8
SELECT jogadores.rg, jogadores.nome, jogadores.naturalidade FROM jogadores WHERE rg IN(
	SELECT rg FROM jogadores WHERE '1980' = EXTRACT(YEAR FROM jogadores.data_nascimento)
);

--Q9
SELECT jogadores.rg, jogadores.nome, jogadores.naturalidade FROM jogadores WHERE rg IN(
	SELECT rg WHERE 30 <= (EXTRACT(YEAR FROM CURRENT_DATE) - EXTRACT(YEAR FROM jogadores.data_nascimento))
);

--Q10
SELECT partidas.idequipe1, partidas.idequipe2, partidas.data, partidas.gols_equipe1, partidas.gols_equipe2, partidas.local FROM partidas WHERE idequipe1 IN(
	SELECT idequipe1 WHERE idequipe1 = '1'
);