-- Passo 1 - Criar o banco de dados

CREATE DATABASE
	modelagem_dados;

-- Passo 2 - Criar as tabelas

CREATE TABLE categorias (
	id serial primary key,
  nome varchar(50)
);

CREATE TABLE produtos (
	id serial primary key,
    nome varchar(100),
    descricao text,
    preco integer,
    quantidade_em_estoque integer not null,
    categoria_id integer references categorias(id)
);

CREATE TABLE itens_do_pedido (
    id serial,
    pedido_id integer,
    quantidade integer,
    produto_id integer references produtos(id)
);


CREATE TABLE pedidos (
	id serial primary key,
    valor integer,
    cliente_cpf char(11) not null,
    vendedor_cpf char(11) not null
);

CREATE TABLE clientes (
	cpf char(11) primary key not null unique,
    nome varchar(150) not null
);


CREATE TABLE vendedores (
	cpf char(11) primary key not null unique,
    nome varchar(150) not null
);


-- Passo 3 - Criar as referencias entre tabelas

ALTER TABLE
  itens_do_pedido
add
  constraint fk_pedidos_id foreign key (pedido_id) references pedidos(id);


ALTER TABLE
  pedidos
add
  constraint fk_cliente_cpf foreign key (cliente_cpf) references clientes(cpf);


ALTER TABLE
  pedidos
add
  constraint fk_vendendor_cpf foreign key (vendedor_cpf) references vendedores (cpf);


-- Passo 4 - Inserir os valores na tabela categoria

INSERT INTO categorias
	(nome)
VALUES
	('frutas'),
  ('verduras'),
  ('massas'),
  ('bebidas'),
  ('utilidades');


-- Passo 5 - Alimentar a tabela produtos


INSERT INTO produtos
	(nome, descricao, preco, quantidade_em_estoque, categoria_id)
VAlUES
	('Mamão', 'Rico em vitamina A, potássio e vitamina C', 300, 123, 1),
  ('Maça', 'Fonte de potássio e fibras', 90, 34, 1),
  ('Cebola', 'Rico em quercetina, antocianinas, vitaminas do complexo B, C', 50, 76, 2),
  ('Abacate', 'NÃO CONTÉM GLÚTEN', 150, 64, 1),
  ('Tomate', 'Rico em vitaminas A, B e C', 125, 88, 2),
  ('Acelga', 'NÃO CONTÉM GLÚTEN', 235, 13, 1),
  ('Macarrão parafuso', 'Sêmola de trigo enriquecida com ferro e ácido fólico, ovos e corantes naturais', 690, 5, 3),
  ('Massa para lasanha', 'Uma reunião de família precisa ter comida boa e muita alegria', 875, 19, 3),
  ('Refrigerante coca cola lata', 'Sabor original', 350, 189, 4),
  ('Refrigerante Pepsi 2l', 'NÃO CONTÉM GLÚTEN. NÃO ALCOÓLICO', 700, 12, 4),
  ('Cerveja Heineken 600ml', 'Heineken é uma cerveja lager Puro Malte, refrescante e de cor amarelo-dourado', 1200, 500, 4),
  ('Agua mineral sem gás', 'Smartwater é água adicionado de sais mineirais (cálcio, potássio e magnésio) livre de sódio e com pH neutro', 130, 478, 4),
  ('Vassoura', 'Pigmento, matéria sintética e metal', 2350, 30, 5),
  ('Saco para lixo', 'Reforçado para garantir mais segurança', 1340, 90, 5),
  ('Escova dental', 'Faça uma limpeza profunda com a tecnologia inovadora', 1000, 44, 5),
  ('Balde para lixo 50l', 'Possui tampa e fabricado com material reciclado', 2290, 55, 5),
  ('Manga', 'Rico em Vitamina A, potássio e vitamina C', 198, 176, 1),
  ('Uva', 'NÃO CONTÉM GLÚTEN', 420, 90, 1);
  


-- Passo 6 - alimentar a tabela clientes

INSERT INTO clientes
	(cpf, nome)
VALUES
	('803.713.500-42', 'José Augusto Silva'),
	('676.428.690-61', 'Antonio Oliveira'),
	('631.933.100-34', 'Ana Rodrigues'),
	('756.705.050-18', 'Maria da Conceição');



-- Passo 7 - alimentar a tabela vendedores


INSERT INTO vendedores
	(cpf, nome)
VALUES
	('825.398.410-31', 'Rodrigo Sampaio'),
	('232.625.460-03', 'Beatriz Souza Santos'),
	('280.071.550-23', 'Carlos Eduardo');


-- Passo 7 - Lançar as vendas

-- a) José Algusto comprou os seguintes itens com o vendedor Carlos Eduardo:
-- 1 Mamão, 1 Pepsi de 2l, 6 Heinekens de 600ml, 1 Escova dental e 5 Maçãs.






-- b) Ana Rodrigues comprou os seguintes itens com a vendedora Beatriz Souza Santos
-- 10 Mangas, 3 Uvas, 5 Mamões, 10 tomates e 2 Acelgas.








-- c) Maria da Conceição comprou os seguintes itens com a vendedora Beatriz Souza Santos
-- 1 Vassoura, 6 Águas sem gás e 5 Mangas.





-- d) Maria da Conceição comprou os seguintes itens com o vendedor Rodrigo Sampaio
-- 1 Balde para lixo, 6 Uvas, 1 Macarrão parafuso, 3 Mamões, 20 tomates e 2 Acelgas.






-- e) Antonio Oliveira comprou os seguintes itens com o vendedor Rodrigo Sampaio
-- 8 Uvas, 1 Massa para lasanha, 3 Mangas, 8 tomates e 2 Heinekens 600ml.

