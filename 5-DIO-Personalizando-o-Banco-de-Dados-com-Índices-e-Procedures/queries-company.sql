
-- departamento com maior n de empregados
SELECT d.NomeDepartamento, COUNT(e.IdEmpregado) AS NumEmpregados
FROM Departamento d
JOIN Empregado e ON d.IdDepartamento = e.Departamento_IdDepartamento
GROUP BY d.NomeDepartamento
ORDER BY NumEmpregados DESC
LIMIT 1;

-- dep por cidade
SELECT c.NomeCidade, d.NomeDepartamento
FROM Cidade c
JOIN Departamento d ON c.IdCidade = d.Cidade_IdCidade
ORDER BY c.NomeCidade, d.NomeDepartamento;

-- empregados por dep
SELECT d.NomeDepartamento, e.Nome AS NomeEmpregado
FROM Departamento d
JOIN Empregado e ON d.IdDepartamento = e.Departamento_IdDepartamento
ORDER BY d.NomeDepartamento, e.Nome;