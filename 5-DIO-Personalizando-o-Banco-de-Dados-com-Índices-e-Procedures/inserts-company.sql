-- inserts

INSERT INTO Cidade (IdCidade, NomeCidade) VALUES 
(1, 'Porto Alegre'),
(2, 'Alvorada'),
(3, 'Cachoeirinha'),
(4, 'Gravataí'),
(5, 'Canoas'),
(6, 'Caxias do Sul'),
(7, 'Pelotas'),
(8, 'Santa Maria'),
(9, 'Rio Grande');

INSERT INTO `company`.`departamento` (`IdDepartamento`, `NomeDepartamento`, `Cidade_IdCidade`) VALUES ('1', 'TI', '1');
INSERT INTO `company`.`departamento` (`IdDepartamento`, `NomeDepartamento`, `Cidade_IdCidade`) VALUES ('2', 'RH', '2');
INSERT INTO `company`.`departamento` (`IdDepartamento`, `NomeDepartamento`, `Cidade_IdCidade`) VALUES ('3', 'Marketing', '5');
INSERT INTO `company`.`departamento` (`IdDepartamento`, `NomeDepartamento`, `Cidade_IdCidade`) VALUES ('4', 'Contabilidade', '1');
INSERT INTO `company`.`departamento` (`IdDepartamento`, `NomeDepartamento`, `Cidade_IdCidade`) VALUES ('5', 'Logística', '5');


INSERT INTO `company`.`empregado` (`IdEmpregado`, `Nome`, `Departamento_IdDepartamento`, `Departamento_Cidade_IdCidade`) VALUES ('1', 'Gabrieli Jupiter', '1', '1');
INSERT INTO `company`.`empregado` (`IdEmpregado`, `Nome`, `Departamento_IdDepartamento`, `Departamento_Cidade_IdCidade`) VALUES ('2', 'Joana Marte', '2', '2');
INSERT INTO `company`.`empregado` (`IdEmpregado`, `Nome`, `Departamento_IdDepartamento`, `Departamento_Cidade_IdCidade`) VALUES ('3', 'Alice Saturno', '3', '5');
INSERT INTO `company`.`empregado` (`IdEmpregado`, `Nome`, `Departamento_IdDepartamento`, `Departamento_Cidade_IdCidade`) VALUES ('4', 'Galileu Vênus', '4', '1');
INSERT INTO `company`.`empregado` (`IdEmpregado`, `Nome`, `Departamento_IdDepartamento`, `Departamento_Cidade_IdCidade`) VALUES ('5', 'Leandra Urano', '5', '5');
INSERT INTO `company`.`empregado` (`IdEmpregado`, `Nome`, `Departamento_IdDepartamento`, `Departamento_Cidade_IdCidade`) VALUES ('6', 'Joel Netuno', '5', '5');
INSERT INTO `company`.`empregado` (`IdEmpregado`, `Nome`, `Departamento_IdDepartamento`, `Departamento_Cidade_IdCidade`) VALUES ('7', 'Molly Plutão', '1', '1');
INSERT INTO `company`.`empregado` (`IdEmpregado`, `Nome`, `Departamento_IdDepartamento`, `Departamento_Cidade_IdCidade`) VALUES ('8', 'John Lua', '1', '1');
INSERT INTO `company`.`empregado` (`IdEmpregado`, `Nome`, `Departamento_IdDepartamento`, `Departamento_Cidade_IdCidade`) VALUES ('9', 'Laisa Ganimedes', '3', '5');
INSERT INTO `company`.`empregado` (`IdEmpregado`, `Nome`, `Departamento_IdDepartamento`, `Departamento_Cidade_IdCidade`) VALUES ('10', 'Paula Saturno', '1', '1');
