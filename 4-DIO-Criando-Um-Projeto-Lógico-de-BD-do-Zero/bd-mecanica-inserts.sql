-- inserts

-- MECÂNICO
INSERT INTO Mecânico (IdMecânico, CpfMecânico, Nome, Especialidade, Disponibilidade, DataNascimento, DataAdmissão, Endereço) VALUES
(1, '12345678901', 'João Silva', 'Geral', 'Seg. a Sex.', '1985-03-15', '2020-01-10', 'Rua A, 123'),
(2, '98765432109', 'Maria Santos', 'Motor', 'Sábado', '1990-07-20', '2019-05-05', 'Rua B, 456'),
(3, '23456789012', 'Carlos Oliveira', 'Freio', 'Domingo', '1988-11-30', '2021-03-22', 'Rua C, 789'),
(4, '56789012345', 'Ana Pereira', 'Suspensão e Direção', 'Seg. a Sex.', '1995-04-25', '2018-12-01', 'Rua D, 321'),
(5, '89012345678', 'Luiz Fernandes', 'Ar Condicionado', 'Seg. a Sex.', '1992-09-10', '2022-02-14', 'Rua E, 987');


-- VEÍCULO
INSERT INTO Veículo (Placa, Tipo, ÚltimaRevisão) VALUES
('ABC1234', 'Carro', '2023-08-20'),
('DEF5678', 'Carro', '2023-07-15'),
('GHI9012', 'Moto', '2023-09-10'),
('JKL3456', 'Carro', '2023-06-25'),
('MNO7890', 'Moto', '2023-08-05');

-- ORDEMSERVIÇO
INSERT INTO OrdemServiço (IdOrdemServiço, Serviço, Especificações, DataEntrada, PrevisãoEntrega, DataEntrega, Valor, FormaPagamento, Estado, Veículo_Placa, Mecânico_IdMecânico) VALUES
(1, 'Revisão', 'Troca de óleo e filtro', '2023-09-01', '2023-09-02', '2023-09-02', 150.00, 'Dinheiro', 'Finalizado', 'ABC1234', 1),
(2, 'Motor', 'Troca de correia dentada', '2023-08-25', '2023-08-28', NULL, 300.00, 'PIX', 'Em Processo', 'DEF5678', 2),
(3, 'Suspensão e Direção', 'Troca de amortecedores', '2023-08-30', NULL, NULL, 500.00, 'Boleto', 'Aguardando Mecânico', 'GHI9012', 3),
(4, 'Freio', 'Troca de pastilhas de freio', '2023-09-05', '2023-09-07', NULL, 200.00, 'Cartão', 'Aguardando Peça', 'JKL3456', 4),
(5, 'Ar Condicionado', 'Recarga de gás', '2023-09-10', '2023-09-11', '2023-09-11', 100.00, 'Dinheiro', 'Finalizado', 'MNO7890', 5);

-- CLIENTE
INSERT INTO Cliente (CpfCnpj, Nome, dataNascimento, endereço) VALUES
('12345678901', 'José da Silva', '1980-05-20', 'Av. X, 123'),
('98765432109', 'Ana Maria', '1992-12-10', 'Rua Y, 456'),
('23456789012', 'Pedro Oliveira', '1975-07-15', 'Rua Z, 789'),
('56789012345', 'Carla Fernandes', '1988-10-30', 'Av. W, 321'),
('89012345678', 'Luciana Santos', '1995-02-05', 'Rua V, 987');

-- CLIENTE_HAS_VEÍCULO
-- add fk
INSERT INTO Cliente_has_Veículo (HistóricoServiços) VALUES
('Troca de óleo e filtro realizada em 2023-09-01.'),
('Troca de correia dentada agendada para 2023-08-25.'),
('Serviço de troca de amortecedores iniciado em 2023-08-30.'),
('Aguardando chegada de pastilhas de freio.'),
('Recarga de gás do ar condicionado concluída em 2023-09-11.');
