-- fazer com que mecânico de Especialidade x só possa pegar serviço x

use mecânica;

create table Mecânico(
	IdMecânico int primary key not null,
    CpfMecânico varchar(11) not null,
    Nome varchar(60) not null,
    Especialidade ENUM('Geral', 'Motor', 'Suspensão e Direção', 'Freio', 'Acabamento', 'Ar Condicionado') not null,
    Disponibilidade ENUM('Seg. a Sex.', 'Sábado', 'Domingo') not null,
    DataNascimento date not null,
    DataAdmissão date not null,
    Endereço varchar(100) not null
);

create table Veículo(
	Placa char(8) primary key not null,
    Tipo enum('Carro', 'Moto') not null,
    ÚltimaRevisão date
);

create table OrdemServiço(
	IdOrdemServiço int primary key not null,
    Serviço enum('Revisão', 'Motor', 'Suspensão e Direção', 'Freio', 'Acabamento', 'Ar Condicionado') not null,
    Especificações varchar(500),
    DataEntrada date not null,
    PrevisãoEntrega date,
    DataEntrega date,
    Valor float (6,2) zerofill not null,
    FormaPagamento enum('Dinheiro', 'PIX', 'Boleto', 'Cartão') not null,
    Estado enum('Aguardando Mecânico', 'Em Processo', 'Aguardando Peça', 'Aguardando Retirada', 'Finalizado') not null,
    Veículo_Placa char(8),
    foreign key (Veículo_Placa) references Veículo(Placa),
    Mecânico_IdMecânico int,
    foreign key (Mecânico_IdMecânico) references Mecânico(IdMecânico)
);    

create table Cliente (
	CpfCnpj varchar(14) primary key not null,
    Nome varchar(60),
    dataNascimento date not null,
    endereço varchar(100)
);

-- verificar fk
CREATE TABLE Cliente_has_Veículo (
    HistóricoServiços VARCHAR(1000),
    Cliente_has_Veículo_ClienteCpfCnpj VARCHAR(14),
    FOREIGN KEY (Cliente_has_Veículo_ClienteCpfCnpj) REFERENCES Cliente(CpfCnpj),
    Cliente_has_Veículo_Veículo_Placa CHAR(8),
    FOREIGN KEY (Cliente_has_Veículo_Veículo_Placa) REFERENCES Veículo(Placa)
);
    