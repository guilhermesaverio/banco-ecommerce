-- View de pedidos por cliente
CREATE VIEW vw_PedidosClientes AS
SELECT p.id_pedido, c.nome AS cliente, p.valor_total, p.status
FROM Pedido p
JOIN Clientes c ON p.id_cliente = c.id_cliente;
GO

-- View de produtos mais vendidos
CREATE VIEW vw_ProdutosMaisVendidos AS
SELECT pr.id_produto, pr.descricao, SUM(ip.quantidade_item) AS total_vendido
FROM ItemPedido ip
JOIN Produto pr ON ip.id_produto = pr.id_produto
GROUP BY pr.id_produto, pr.descricao;
GO

-- View de produtos com baixo estoque
CREATE VIEW vw_ProdutosBaixoEstoque AS
SELECT id_produto, descricao, quantidade_estoque
FROM Produto
WHERE quantidade_estoque <= 5;
GO

SELECT * FROM vw_ProdutosMaisVendidos
SELECT * FROM vw_PedidosClientes
SELECT * FROM vw_ProdutosBaixoEstoque





