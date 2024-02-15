-- Desabilitar o autocommit
SET autocommit = 0;

-- Iniciar a transação
START TRANSACTION;

-- Inserir algumas cidades
INSERT INTO Cidade (IdCidade, NomeCidade) VALUES (1, 'São Paulo');
INSERT INTO Cidade (IdCidade, NomeCidade) VALUES (2, 'Rio de Janeiro');
INSERT INTO Cidade (IdCidade, NomeCidade) VALUES (3, 'Belo Horizonte');

-- Inserir alguns departamentos
INSERT INTO Departamento (IdDepartamento, NomeDepartamento, Cidade_IdCidade) VALUES (1, 'TI', 1);
INSERT INTO Departamento (IdDepartamento, NomeDepartamento, Cidade_IdCidade) VALUES (2, 'Marketing', 2);
INSERT INTO Departamento (IdDepartamento, NomeDepartamento, Cidade_IdCidade) VALUES (3, 'Recursos Humanos', 3);

-- Inserir alguns projetos
INSERT INTO Projeto (IdProjeto, NomeProjeto, IdDepartamento) VALUES ('001', 'Website', 1);
INSERT INTO Projeto (IdProjeto, NomeProjeto, IdDepartamento) VALUES ('002', 'Campanha mkt', 2);
INSERT INTO Projeto (IdProjeto, NomeProjeto, IdDepartamento) VALUES ('003', 'Treinamento', 3);

-- Inserir alguns empregados
INSERT INTO Empregado (IdEmpregado, Nome, Gerente, Dependente, Departamento_IdDepartamento, IdProjeto) VALUES ('0001', 'João', 1, 0, 1, '001');
INSERT INTO Empregado (IdEmpregado, Nome, Gerente, Dependente, Departamento_IdDepartamento, IdProjeto) VALUES ('0002', 'Maria', 0, 0, 2, '002');
INSERT INTO Empregado (IdEmpregado, Nome, Gerente, Dependente, Departamento_IdDepartamento, IdProjeto) VALUES ('0003', 'Pedro', 0, 0, 3, '003');

-- Comitar a transação para efetivar as mudanças
COMMIT;
