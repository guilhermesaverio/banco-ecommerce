--Inserindo clientes:
INSERT INTO Clientes (nome, data_nascimento, cpf)
VALUES
('Guilherme Savério', '1998-05-10', '12345678901'),
('Ana Souza', '1995-08-21', '23456789012'),
('Carlos Lima', '2000-03-15', '34567890123'),
('Mariana Oliveira', '1992-11-30', '45678901234'),
('Pedro Alves', '1988-07-22', '56789012345');

--Inserindo Endereco:
INSERT INTO Endereco (logradouro, numero, bairro, cidade, estado, cep, id_cliente)
VALUES
('Rua das Flores', 123, 'Centro', 'São Paulo', 'SP', '01001000', 1),
('Av. Brasil', 456, 'Jardins', 'São Paulo', 'SP', '01414000', 2),
('Rua Copacabana', 789, 'Copacabana', 'Rio de Janeiro', 'RJ', '22040001', 3),
('Rua Vitória', 101, 'Savassi', 'Belo Horizonte', 'MG', '30140071', 4),
('Av. Amazonas', 202, 'Centro', 'Manaus', 'AM', '69005000', 5);

--Inserindo Telefone:
INSERT INTO Telefone (ddd, numero, id_cliente)
VALUES
(11, 912345678, 1),
(11, 987654321, 2),
(21, 998877665, 3),
(31, 912233445, 4),
(92, 999887766, 5);

--Inserindo Email:
INSERT INTO Email (email, id_cliente)
VALUES
('guilherme.saverio@email.com', 1),
('ana.souza@email.com', 2),
('carlos.lima@email.com', 3),
('mariana.oliveira@email.com', 4),
('pedro.alves@email.com', 5);

--Inserindo categoria de produto:
INSERT INTO Categoria_Produto (nome, descricao)
VALUES
('Eletrônicos', 'Produtos eletrônicos diversos'),
('Roupas', 'Vestuário e acessórios'),
('Livros', 'Livros de todos os gêneros'),
('Beleza', 'Cosméticos e cuidados pessoais'),
('Esportes', 'Artigos esportivos');

--inserindo produtos:
INSERT INTO Produto (descricao, preco_unitario, quantidade_estoque, id_categoria)
VALUES
('Fone de ouvido Bluetooth', 199.90, 50, 1),
('Camiseta Polo Masculina', 79.90, 100, 2),
('Livro Java Avançado', 120.00, 30, 3),
('Kit Maquiagem Básico', 89.90, 40, 4),
('Bola de Futebol Oficial', 150.00, 25, 5);

-- inserindo pedidos:
INSERT INTO Pedido (nota_fiscal, serie_nota, valor_total, quantidade_itens, desconto_total, status, id_cliente)
VALUES
('NF001', '001', 199.90, 1, 0, 'ABERTO', 1),
('NF002', '001', 159.80, 2, 0, 'PAGO', 2),
('NF003', '001', 120.00, 1, 0, 'CANCELADO', 3),
('NF004', '001', 239.90, 3, 10.00, 'PAGO', 4),
('NF005', '001', 150.00, 1, 0, 'ABERTO', 5);

--Inserindo itens do pedido:
INSERT INTO ItemPedido (valor_unitario, quantidade_item, valor_desconto, id_pedido, id_produto)
VALUES
(199.90, 1, 0, 1, 1),
(79.90, 1, 0, 2, 2),
(79.90, 1, 0, 2, 2),
(120.00, 1, 0, 3, 3),
(79.90, 2, 0, 4, 2),
(89.90, 1, 0, 4, 4),
(70.00, 1, 10.00, 4, 5),
(150.00, 1, 0, 5, 5);

SELECT * FROM Clientes
SELECT * FROM Categoria_Produto
SELECT * FROM Email
SELECT * FROM Endereco
SELECT * FROM ItemPedido
SELECT * FROM Pedido
SELECT * FROM Produto
SELECT * FROM Telefone




