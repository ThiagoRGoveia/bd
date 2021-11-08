-- item j

SELECT COUNT(DISTINCT p_id) 
FROM catalogo,fornecedores 
WHERE catalogo.f_id = fornecedores.f_id AND fornecedores.f_nome ='joao'

-- item k

-- menor valor das pecas verdes

SELECT catalogo.p_id,MIN(preco) 
FROM catalogo,pecas 
WHERE  catalogo.p_id = pecas.p_id AND cor ='verde' 
GROUP BY catalogo.p_id

--media de tudo que eh verde

SELECT catalogo.p_id ,AVG(preco) 
FROM catalogo,pecas 
WHERE catalogo.p_id = pecas.p_id AND pecas.cor = 'verde' 
GROUP BY catalogo.p_id

-- maior valor das pecas verdes

SELECT catalogo.p_id,MAX(preco) 
FROM catalogo,pecas 
WHERE  catalogo.p_id = pecas.p_id AND cor ='verde' 
GROUP BY catalogo.p_id

-- item l

SELECT fornecedores.f_id, f_nome, COUNT(catalogo.f_id) AS Quantidade_De_Pecas 
FROM fornecedores,catalogo WHERE fornecedores.f_id = catalogo.f_id 
GROUP BY fornecedores.f_id 
ORDER BY Quantidade_De_Pecas DESC