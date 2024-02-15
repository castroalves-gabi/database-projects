USE company3;

DELIMITER //

CREATE PROCEDURE CriarEmpregado(
    IN p_IdEmpregado CHAR(4),
    IN p_Nome VARCHAR(30),
    IN p_Gerente TINYINT,
    IN p_Dependente TINYINT,
    IN p_Departamento_IdDepartamento INT,
    IN p_IdProjeto CHAR(3)
)
BEGIN
    DECLARE exit handler for sqlexception
    BEGIN
        ROLLBACK;
        SELECT 'Erro durante a transação. Rollback realizado.' AS Mensagem;
    END;

    START TRANSACTION;
    
    -- Insere o empregado na tabela Empregado
    INSERT INTO Empregado(IdEmpregado, Nome, Gerente, Dependente, Departamento_IdDepartamento, IdProjeto) 
    VALUES (p_IdEmpregado, p_Nome, p_Gerente, p_Dependente, p_Departamento_IdDepartamento, p_IdProjeto);

    -- Verifica se o empregado foi inserido corretamente
    SELECT 'Empregado criado com sucesso.' AS Mensagem;

    COMMIT;
    SELECT 'Transação realizada com sucesso.' AS Mensagem;
END//

DELIMITER ;

-- chamar procedure
CALL CriarEmpregado('pepa', 'Pedro Paulo', 0, 1, 1, '002');
