--item f
/*
T1 <- pi (p_id) (pecas)
T2 <- pi (f_nome, endereco, p_id) (fornecedores THETA_JOIN(fornecedores.f_id=catalogo.f_id) catalogo)
T3 <- T2 dividido por T1
T4 <- listar(f_nome, f_endereco) (T3)
*/

--item g
/*
T1 <- pi (p_id) (sigma(cor='vermelho')) (pecas)
T2 <- pi (p_id) (sigma(cor='verde')) (pecas)
T3 <- pi (f_id, p_id) (fornecedores * catalogo)
T4 <- T3 dividido por T1
T5 <- T3 dividido por T2
T6 <- T4 UNION T5
T7 <- listar(f_id) (T6)
*/

--item h
/*
T1 <- pi (p_id, p_nome, preco) (pecas)
T2 <- pi (f_id, f_nome, p_id) (fornecedores)
T3 <- (T2 NATURAL_JOIN (T1))
T4 <- listar(f_id, f_nome, p_nome, preco) (T3)
*/

--item i
