use ecommerce;

-- dadosBanco
INSERT INTO dadosBanco (contaBanco, agência, banco)
	VALUES ('123456-7', '001', '265');
INSERT INTO dadosBanco (contaBanco, agência, banco)
	VALUES ('987654-3', '002', '255');
INSERT INTO dadosBanco (contaBanco, agência, banco)
	VALUES ('543210-1', '003', '255');
INSERT INTO dadosBanco (contaBanco, agência, banco)
	VALUES ('246801-8', '004', '275');
INSERT INTO dadosBanco (contaBanco, agência, banco)
	VALUES ('135792-4', '005', '265');

-- Pessoa
INSERT INTO Pessoa (cpfCnpj, primeiroNome, sobrenome, dataNascimento, endereço, celular, email)
	VALUES ('123.456.789-10', 'João', 'Silva', '1990-05-15', 'Rua A, 123', '11999998888', 'joao@example.com');
INSERT INTO Pessoa (cpfCnpj, primeiroNome, sobrenome, dataNascimento, endereço, celular, email, seCliente, seVendedor)
	VALUES ('987.654.321-00', 'Maria', 'Souza', '1985-10-20', 'Avenida B, 456', '11998887777', 'maria@example.com', 1, 1);
INSERT INTO Pessoa (cpfCnpj, primeiroNome, sobrenome, dataNascimento, endereço, celular, email, seFornecedor)
	VALUES ('111.222.333-44', 'José', 'Oliveira', '1978-03-08', 'Rua C, 789', '11997776666', 'jose@example.com', 1);
INSERT INTO Pessoa (cpfCnpj, primeiroNome, segundoNome, sobrenome, dataNascimento, endereço, celular, email)
	VALUES ('555.666.777-88', 'Ana', 'Carolina', 'Ferreira', '1982-12-25', 'Avenida D, 1010', '11995554444', 'ana@example.com');
INSERT INTO Pessoa (cpfCnpj, primeiroNome, sobrenome, dataNascimento, endereço, celular, email, seCliente)
	VALUES ('999.888.777-66', 'Carlos', 'Rocha', '1975-08-03', 'Rua E, 222', '11994443333', 'carlos@example.com', 1);
-- Pagamento
INSERT INTO Pagamento (formaPagamento, dataPagamento, status, númeroParcelas)
	VALUES ('Cartão', '2024-02-12', 'Pendente', 1);
INSERT INTO Pagamento (formaPagamento, dataPagamento, status, númeroParcelas)
	VALUES ('Pix', '2024-02-11', 'Aprovado', 0);
INSERT INTO Pagamento (formaPagamento, dataPagamento, status, númeroParcelas)
	VALUES ('Boleto', '2024-02-10', 'Recusado', 2);
INSERT INTO Pagamento (formaPagamento, dataPagamento, status, númeroParcelas)
	VALUES ('Cartão', '2024-02-09', 'Aprovado', 3);
INSERT INTO Pagamento (formaPagamento, dataPagamento, status, númeroParcelas)
	VALUES ('Pix', '2024-02-08', 'Pendente', 0);

-- dadosCartão
INSERT INTO dadosCartão (númeroCartão, dataValidade, códigoSegurança, nomeImpressoCartão, bandeira, limiteDisponível) VALUES
('1111222233334444', '2025-12-31', '123', 'FULANO DE TAL', 'Visa', 500.00),
('2222333344445555', '2026-12-31', '234', 'CICLANO DE TAL', 'Master', 1000.00),
('3333444455556666', '2027-12-31', '345', 'BELTRANO DE TAL', 'Elo', 1500.00),
('4444555566667777', '2028-12-31', '456', 'FABIANO DE TAL', 'Outra', 2000.00),
('5555666677778888', '2029-12-31', '567', 'MARCELO DE TAL', 'Visa', 2500.00);

INSERT INTO Produto (nome, descrição, categoria, valor, condição, produtoÚnico, quantidade, dataCadastro, pesoGramas, alturaCm, larguraCm, profundidadeCm)
VALUES
('Mesa de Jantar', 'Mesa de jantar em madeira maciça', 'Casa', 999.99, 'Nova', 1, 20, '2024-02-12', 5000.00, 75.00, 150.00, 90.00),
('Coleira para Cachorro', 'Coleira resistente para cães de médio e grande porte', 'Pet', 29.99, 'Nova', 1, 50, '2024-02-12', 100.00, 1.00, 30.00, 1.00),
('Caderno Universitário', 'Caderno espiral capa dura 200 folhas', 'Papelaria', 15.99, 'Nova', 0, 100, '2024-02-12', 500.00, 1.50, 20.00, 30.00),
('Boneco Transformers', 'Boneco de ação com transformação', 'Brinquedo', 49.99, 'Novo', 1, 30, '2024-02-12', 200.00, 25.00, 10.00, 5.00),
('Smartphone', 'Smartphone desbloqueado com câmera de alta resolução', 'Eletrônico', 1599.99, 'Novo', 1, 15, '2024-02-12', 200.00, 15.00, 8.00, 0.50);

-- Inserções na tabela Entrega
INSERT INTO Entrega (status)
VALUES
('Aguardando envio'),
('Enviado'),
('Entregue'),
('Aguardando envio'),
('Enviado');

-- Inserções na tabela Devolução
INSERT INTO Devolução (possibilidadeDevolução, status)
VALUES
(1, 'Aguardando envio'),
(0, 'Enviado'),
(0, 'Prazo esgotado'),
(1, 'Devolução solicitada'),
(1, 'Aguardando envio');

-- Inserções na tabela Pedido
INSERT INTO Pedido (dataPedido)
VALUES
('2024-02-12'),
('2024-02-11'),
('2024-02-10'),
('2024-02-09'),
('2024-02-08');

-- Inserções na tabela carteiraVendedor
INSERT INTO carteiraVendedor (formaRecebimento, valorAReceber, valorRecebido)
VALUES
('Cartão', 1500.00, 200.00),
('Boleto', 2500.00, 0.00),
('PIX', 2000.00, 5542.00),
('Boleto', 1000.00, 56.00),
('PIX', 500.00, 1228.50);

-- Inserções na tabela Vendedor
INSERT INTO Vendedor (quantidadeVendida)
VALUES
(5),
(8),
(12),
(4),
(6);

-- Inserções na tabela Fornecedor_fornece_Produto
INSERT INTO Fornecedor_fornece_Produto (quantidade, valor, formaRecebimento)
VALUES
(10, 9.99, 'Boleto'),
(20, 19.99, 'PIX'),
(30, 29.99, 'Cartão'),
(40, 39.99, 'PIX'),
(50, 49.99, 'Boleto');