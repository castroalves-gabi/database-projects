-- VIEWS
USE company2;

-- Número de empregados por departamento
SELECT d.NomeDepartamento, COUNT(e.IdEmpregado) AS NumEmpregados
FROM Departamento d
LEFT JOIN Empregado e ON d.IdDepartamento = e.Departamento_IdDepartamento
GROUP BY d.NomeDepartamento;

-- Número de empregados por localidade (cidade)
SELECT c.NomeCidade, COUNT(e.IdEmpregado) AS NumEmpregados
FROM Cidade c
JOIN Departamento d ON c.IdCidade = d.Cidade_IdCidade
LEFT JOIN Empregado e ON d.IdDepartamento = e.Departamento_IdDepartamento
GROUP BY c.NomeCidade;

-- lista de departamentos e seus gerentes 
SELECT d.NomeDepartamento, e.Nome AS NomeGerente
FROM Departamento d
LEFT JOIN Empregado e ON d.IdDepartamento = e.Departamento_IdDepartamento AND e.Gerente = 1;

-- projetos com maior número de empregados
SELECT p.IdProjeto, p.NomeProjeto, COUNT(e.IdEmpregado) AS NumEmpregados
FROM Projeto p
LEFT JOIN Empregado e ON p.IdProjeto = e.IdProjeto
GROUP BY p.IdProjeto, p.NomeProjeto
ORDER BY COUNT(e.IdEmpregado) DESC;

-- lista de projetos, departamentos e gerentes
SELECT p.NomeProjeto, d.NomeDepartamento, e.Nome AS NomeGerente
FROM Projeto p
JOIN Departamento d ON p.IdDepartamento = d.IdDepartamento
LEFT JOIN Empregado e ON d.IdDepartamento = e.Departamento_IdDepartamento AND e.Gerente = 1;

-- empregados que possuem dependentes e se são gerentes
SELECT e.Nome, 
CASE WHEN e.Gerente = 1 THEN 'Sim' ELSE 'Não' END AS Gerente,
CASE WHEN e.Dependente = 1 THEN 'Sim' ELSE 'Não' END AS PossuiDependentes
FROM Empregado e
WHERE e.Dependente = 1 OR e.Gerente = 1;

-- query que mostra, para cada departamento com gerente, o nome do departamento, do gerente e cidade
SELECT 
    d.NomeDepartamento AS Nome_Departamento,
    e.Nome AS Nome_Gerente,
    c.NomeCidade AS Nome_Cidade
FROM 
    Departamento d
JOIN 
    Empregado e ON d.IdDepartamento = e.Departamento_IdDepartamento AND e.Gerente = 1
JOIN 
    Cidade c ON d.Cidade_IdCidade = c.IdCidade;
