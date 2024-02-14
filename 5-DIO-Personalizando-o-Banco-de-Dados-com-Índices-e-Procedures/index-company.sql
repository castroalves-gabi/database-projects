USE company;

-- Índice para a chave primária de cada tabela
CREATE INDEX idx_Cidade_IdCidade ON Cidade (IdCidade);
CREATE INDEX idx_Departamento_IdDepartamento ON Departamento (IdDepartamento);
CREATE INDEX idx_Empregado_IdEmpregado ON Empregado (IdEmpregado);

-- Index para relacionar empregado e departamento
-- Objetivo: facilitar a busca rápida de empregados com base em seus departamentos
CREATE INDEX idx_departamento_id_empregado ON Empregado (Departamento_IdDepartamento);

-- Index composto nas colunas Departamento_IdDepartamento e Departamento_Cidade_IdCidade da tabela Empregado
-- Objetivo: acelerar consultas combinadas
CREATE INDEX idx_departamento_cidade_empregado ON Empregado (Departamento_IdDepartamento, Departamento_Cidade_IdCidade);