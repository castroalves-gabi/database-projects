use company;

create table Cidade(
	IdCidade int primary key not null,
    NomeCidade varchar(30) not null
);

create table Departamento(
	IdDepartamento int primary key not null,
    NomeDepartamento varchar(20) not null,
	Cidade_IdCidade INT,
    FOREIGN KEY (Cidade_IdCidade) REFERENCES Cidade(IdCidade)
);

create table Empregado (
	IdEmpregado int primary key not null,
    Nome varchar(30) not null, 
    Departamento_IdDepartamento int,
    foreign key (Departamento_IdDepartamento) references Departamento(IdDepartamento),
    Departamento_Cidade_IdCidade int,
	foreign key (Departamento_Cidade_IdCidade) references Departamento(Cidade_IdCidade)
);