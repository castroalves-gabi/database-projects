-- PERMISSÕES
-- Gerentes: têm acesso a todas as tabelas e permissões de SELECT, INSERT, UPDATE e DELETE.
-- Empregados: só podem ver informações relacionadas ao próprio departamento em que trabalham
-- Concede permissões para gerentes
GRANT SELECT, INSERT, UPDATE, DELETE ON company2.* TO 'gerente_role'@'localhost';

-- permissões para empregados
GRANT SELECT ON company3.Cidade TO 'empregado_role'@'localhost';
GRANT SELECT ON company3.Departamento TO 'empregado_role'@'localhost';
GRANT SELECT ON company3.Projeto TO 'empregado_role'@'localhost';
GRANT SELECT ON company3.Empregado TO 'empregado_role'@'localhost';

-- restrição de acesso para empregados
CREATE VIEW Empregado_Departamento AS
SELECT *
FROM company2.Empregado e
JOIN company2.Departamento d ON e.Departamento_IdDepartamento = d.IdDepartamento;

-- Revoga todas as permissões de SELECT para empregados na tabela Empregado
REVOKE SELECT ON company3.Empregado FROM 'empregado_role'@'localhost';

-- Concede permissão de SELECT na view Empregado_Departamento para empregados
GRANT SELECT ON company3.Empregado_Departamento TO 'empregado_role'@'localhost';
