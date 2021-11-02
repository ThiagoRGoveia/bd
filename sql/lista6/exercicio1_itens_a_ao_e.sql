--item a)
/*Parte de álgebra relacional
    T1 <- condição(cor = 'vermelho')(pecas)
    T2 <- T1 * catalogo
    T3 <- T2 * fornecedores
    T4 <- listar(f_nome) (T3)
Fim da parte de álgebra relacional*/
SELECT DISTINCT f.f_nome
FROM fornecedores f JOIN catalogo C
    ON f.f_id = c.f_id JOIN
    pecas p ON c.p_id = p.p_id
WHERE p.cor = 'vermelho'

--item b)
--Por algum motivo bugou o cecedilha
/*
    T1 <- fornecedores * catalogo
    T2 <- T1 * pecas
    T3 <- condição(cor = 'vermelho' OR endereco = 'Sao Carlos') (T2)
    T4 <- listar(f_nome) (T3)
*/
SELECT DISTINCT f.f_nome
FROM fornecedores f JOIN catalogo C
    ON f.f_id = c.f_id JOIN
    pecas p ON c.p_id = p.p_id
WHERE p.cor = 'vermelho' OR f.endere�o = 'Sao Carlos'

--item c)
/*  
    T1 <- listar(f_nome) (fornecedores * catalogo * condicao (cor = 'vermelho')(pecas))
    T2 <- listar(f_nome) (fornecedores * catalogo * condicao (cor = 'verde')(pecas))
    T3 <- T1 INTERSECT T2
*/
SELECT DISTINCT * FROM
((SELECT f.f_nome
FROM fornecedores f JOIN catalogo C
    ON f.f_id = c.f_id JOIN
    pecas p ON c.p_id = p.p_id
WHERE p.cor = 'verde')

INTERSECT

(SELECT f.f_nome
FROM fornecedores f JOIN catalogo C
    ON f.f_id = c.f_id JOIN
    pecas p ON c.p_id = p.p_id
WHERE p.cor = 'vermelho')) TEMP

--item d)
/*
    T1 <- oferece f1 (f_id1, f_nome1, endereço1) (fornecedores) * oferece c1 (f_id1, p_id1, preco1) (catalogo)
    T2 <- oferece f2 (f_id2, f_nome2, endereço2) (fornecedores) * oferece c2 (f_id2, p_id2, preco2) (catalogo)
    T3 <- T1 theta-join(p_id1 = p_id2 AND preco1 > preco2) (T2)
    T4 <- listar(f_id1, f_id2, p_id1) (T3)
*/
SELECT f1.f_id, c1.preco, c1.p_id, f2.f_id,c2.preco, c2.p_id
FROM fornecedores f1 JOIN catalogo c1 ON f1.f_id = c1.f_id,
     fornecedores f2 JOIN catalogo c2 ON f2.f_id = c2.f_id
WHERE f1.f_id <> f2.f_id AND c1.p_id = c2.p_id AND c1.preco > c2.preco

--item e)
/*
    T1 <- pecas LEFT OUTER JOIN (pecas.p_id = catalogo.p_id) (catalogo)
    T2 <- T1 LEFT OUTER JOIN (T1.f_id = fornecedores.f_id) (fornecedores)
    T3 <- listar(nome, cor, preco, f_nome) (T2)
*/
SELECT p_nome, cor, preco, f_nome  
FROM pecas 
	NATURAL LEFT OUTER JOIN catalogo 
	NATURAL LEFT OUTER JOIN fornecedores;
	