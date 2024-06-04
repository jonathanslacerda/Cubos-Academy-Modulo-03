-- 1 - Faça uma query que retorna a quantidade de medicamentos da tabela farmacia.

SELECT COUNT(*) FROM farmacia;

-- 2 - Faça uma query que retorna apenas a idade do usuario mais novo cadastrado na tabela usuarios.

SELECT MIN(idade) FROM usuarios;

-- 3 - Faça uma query que retorna apenas a idade do usuario mais velho cadastrado na tabela usuarios.

SELECT MAX(idade) FROM usuarios;

-- 4 - Faça uma query que retorna a média de idade entre os usuários 
-- cadastrados na tabela usuarios com idade maior ou igual a 18 anos.

SELECT AVG(idade) FROM usuarios WHERE idade > 17;

-- 5 - Faça uma query que retorna a soma total do estoque de todos os
--  medicamentos das categorias blue e black na tabela farmacia.

SELECT SUM(estoque) FROM farmacia WHERE categoria = 'blue' OR categoria = 'black';

-- 6 - Faça uma query que retorna todas as categorias não nulas e a soma do estoque 
-- de todos os medicamentos de cada categoria na tabela farmacia.

