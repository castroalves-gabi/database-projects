use ecommerce;

-- Para a tabela dadosBanco
SELECT * FROM dadosBanco;

-- Para a tabela Pessoa
SELECT * FROM Pessoa;
SELECT * FROM Pessoa WHERE seCliente = 1;
select * from Pessoa where seFornecedor = 1;

-- Para a tabela Pagamento
SELECT * FROM Pagamento;

-- Para a tabela dadosCartão
SELECT * FROM dadosCartão;

-- Para a tabela pessoa_tem_dadosCartão
SELECT * FROM pessoa_tem_dadosCartão;

-- Para a tabela Produto
SELECT * FROM Produto;
SELECT * FROM Produto ORDER BY valor DESC;

-- Para a tabela Entrega
SELECT * FROM Entrega;

-- Para a tabela Devolução
SELECT * FROM Devolução;

-- Para a tabela Cliente
SELECT * FROM Cliente;

-- Para a tabela Pedido
SELECT * FROM Pedido;

-- Para a tabela Pedido_inclui_Produto
SELECT * FROM Pedido_inclui_Produto;
-- Calcular o valor total de cada pedido 
SELECT Pedido_idPedido, SUM(quantidade * valor) AS valorTotal
	FROM Pedido_inclui_Produto
	GROUP BY Pedido_idPedido;

-- Para a tabela perfilCliente
SELECT * FROM perfilCliente;

-- Para a tabela carteiraVendedor
SELECT * FROM carteiraVendedor;

-- Para a tabela Vendedor
SELECT * FROM Vendedor;

-- Para a tabela perfilVendedor
SELECT * FROM perfilVendedor;

-- Para a tabela Vendedor_vende_Produto
SELECT * FROM Vendedor_vende_Produto;

-- Para a tabela Fornecedor
SELECT * FROM Fornecedor;

-- Para a tabela perfilFornecedor
SELECT * FROM perfilFornecedor;

-- Para a tabela Fornecedor_fornece_Produto
SELECT * FROM Fornecedor_fornece_Produto;


-- JOIN
-- Recuperar os detalhes dos pedidos, incluindo os dados do cliente e o status do pagamento
SELECT P.idPedido, P.dataPedido, Pe.primeiroNome AS nomeCliente, Pe.email AS emailCliente, Pa.status AS statusPagamento
	FROM Pedido P
	JOIN Pessoa Pe ON P.Cliente_idCliente = Pe.idPessoa
	JOIN Pagamento Pa ON P.Pagamento_idPagamento = Pa.idPagamento;