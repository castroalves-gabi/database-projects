-- Trigger de remoção
DELIMITER //
CREATE TRIGGER before_delete_user
BEFORE DELETE ON Pessoa
FOR EACH ROW
BEGIN
    INSERT INTO Log_Remocao_Usuario (idUsuarioRemovido, dataRemocao)
    VALUES (OLD.idPessoa, NOW());
END;
//
DELIMITER ;

-- Trigger de atualização
DELIMITER //
CREATE TRIGGER before_update_pessoa_salário
BEFORE UPDATE ON Pessoa
FOR EACH ROW
BEGIN
    IF OLD.seVendedor = 1 THEN
        INSERT INTO Log_Atualizacao_Salario (idVendedor, novoSalario, dataAtualizacao)
        VALUES (OLD.idPessoa, NEW.salário, NOW());
    END IF;
END;
//
DELIMITER ;
