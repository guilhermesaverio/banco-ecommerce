-- Listar o Endereço de algum cliente pelo nome:
SELECT e.logradouro, e.numero, e.bairro, e.cidade, e.estado, e.cep
FROM Endereco e
INNER JOIN Clientes c ON c.id_cliente = e.id_cliente
WHERE c.nome = 'Guilherme Savério'

-- Listar Telefones e Email de clientes:
SELECT c.id_cliente, c.nome, t.ddd, t.numero, e.email
FROM Clientes c
LEFT JOIN Telefone t ON t.id_cliente = c.id_cliente
LEFT JOIN Email e ON e.id_cliente = c.id_cliente

-- Pedidos e clientes correspondentes:
SELECT c.id_cliente, c.nome, p.id_pedido, p.valor_total, p.status
FROM Clientes c
INNER JOIN Pedido p ON p.id_cliente = c.id_cliente

-- Itens de pedido com preço unitario:
SELECT ip.id_item_pedido, p.descricao, ip.quantidade_item, ip.valor_unitario
FROM ItemPedido ip
INNER JOIN Produto p ON p.id_produto = ip.id_produto

-- Produtos de uma categoria especifica:
SELECT p.descricao, p.preco_unitario
FROM Categoria_Produto cp
INNER JOIN Produto p ON p.id_categoria = cp.id_categoria
WHERE cp.nome = 'Eletrônicos'

-- Pedidos de um cliente específico com status e total:
SELECT c.nome, p.status, p.valor_total
FROM Clientes c
INNER JOIN Pedido p ON p.id_cliente = c.id_cliente
WHERE c.nome = 'Carlos Lima'

-- Pedidos com mais de um item
SELECT p.id_pedido, p.status, c.nome
FROM Pedido p
INNER JOIN Clientes c ON c.id_cliente = p.id_cliente
WHERE p.quantidade_itens > 1

-- Total gasto por cliente, apenas os que foram pagos
SELECT c.nome, SUM(p.valor_total) AS total
FROM Clientes c
INNER JOIN Pedido p ON c.id_cliente = p.id_cliente
WHERE p.status = 'PAGO'
GROUP BY c.nome;

-- Produto mais vendido, quantidade total:
SELECT p.descricao, SUM(ip.quantidade_item) AS total_vendido
FROM ItemPedido ip
INNER JOIN Produto p ON ip.id_produto = p.id_produto
GROUP BY p.descricao
ORDER BY total_vendido DESC;

-- Pedidos ABERTO com valor total e cliente
SELECT c.id_cliente, c.nome, p.valor_total
FROM Clientes c
INNER JOIN Pedido p ON p.id_cliente = c.id_cliente
WHERE p.status = 'ABERTO'

-- Produtos com pouco estoque, para ter reposição
SELECT descricao, quantidade_estoque
FROM Produto
WHERE quantidade_estoque <= 5;

--Pedidos com valor total maior que a média dos pedidos:
SELECT id_pedido, valor_total
FROM Pedido 
WHERE valor_total > (SELECT AVG (valor_total) FROM Pedido)

-- Clientes que nunca fizeram pedidos:
SELECT c.id_cliente, c.nome 
FROM Clientes c
LEFT JOIN pedido p ON p.id_cliente = c.id_cliente
WHERE p.id_pedido IS NULL

--Produtos nunca vendidos:
SELECT pr.descricao
FROM Produto pr
LEFT JOIN ItemPedido ip ON pr.id_produto = ip.id_produto
WHERE ip.id_item_pedido IS NULL;

-- Número de pedidos por cliente:
SELECT c.nome, COUNT(p.id_pedido) AS total_pedidos
FROM Clientes c
LEFT JOIN Pedido p ON c.id_cliente = p.id_cliente
GROUP BY c.nome;

--Valor médio de pedidos por status:
SELECT status, AVG(valor_total) AS media_valor
FROM Pedido
GROUP BY status;
