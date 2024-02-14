USE company;
DELIMITER //

CREATE PROCEDURE ManipularDados(
    IN acao INT,
    IN id INT,
    IN novo_nome VARCHAR(30),
    IN novo_departamento_id INT,
    IN novo_departamento_cidade_id INT
)
BEGIN
    -- Variável de controle para determinar a ação a ser executada
    DECLARE acao_executar VARCHAR(10);
    SET acao_executar = CASE acao
        WHEN 1 THEN 'SELECT'
        WHEN 2 THEN 'UPDATE'
        WHEN 3 THEN 'DELETE'
        ELSE NULL
    END;

    -- Estrutura condicional para selecionar a ação a ser executada
    CASE acao_executar
        WHEN 'SELECT' THEN
            SELECT *
            FROM Empregado
            WHERE IdEmpregado = id;

        WHEN 'UPDATE' THEN
            UPDATE Empregado
            SET Nome = novo_nome,
                Departamento_IdDepartamento = novo_departamento_id,
                Departamento_Cidade_IdCidade = novo_departamento_cidade_id
            WHERE IdEmpregado = id;

        WHEN 'DELETE' THEN
            DELETE FROM Empregado
            WHERE IdEmpregado = id;
    END CASE;
END //

DELIMITER ;

-- call procedure
-- 2 é update, 1 é id do empregado a ser atualizado, 2 é o novo id de departamento, 3 é o id da cidade associada ao departamento
CALL ManipularDados(2, 9, 'Linda Ganimedes', 3, 5);

