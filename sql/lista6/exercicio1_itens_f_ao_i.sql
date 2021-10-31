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
*/

--item h
/*
*/

--item i
