-- queries para teste

SELECT * FROM Mecânico;
SELECT * FROM Veículo WHERE Tipo = 'Carro';
SELECT * FROM OrdemServiço WHERE Estado = 'Finalizado';
SELECT * FROM Cliente;
SELECT * FROM Cliente WHERE dataNascimento > '1990-01-01';
SELECT * FROM Cliente_has_Veículo;
SELECT * FROM Mecânico WHERE Disponibilidade = 'Sábado';
SELECT * FROM OrdemServiço WHERE Valor > 200.00;

SELECT 
    m.Nome AS Nome_Mecânico,
    m.Especialidade,
    os.Serviço,
    os.PrevisãoEntrega
FROM 
    Mecânico m
JOIN 
    OrdemServiço os ON m.IdMecânico = os.Mecânico_IdMecânico;

