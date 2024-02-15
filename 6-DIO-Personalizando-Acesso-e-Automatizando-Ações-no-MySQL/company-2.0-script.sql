use company2;

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

create table Projeto (
	IdProjeto char(3) primary key not null,
	NomeProjeto varchar(20),
	IdDepartamento int,
    FOREIGN KEY (IdDepartamento) REFERENCES Departamento(IdDepartamento)
);

create table Empregado (
	IdEmpregado char(4) primary key not null,
    Nome varchar(30) not null, 
    Gerente tinyint not null default 0,
	Dependente tinyint not null default 0,
    Departamento_IdDepartamento int,
    foreign key (Departamento_IdDepartamento) references Departamento(IdDepartamento),
    IdProjeto char(3), 
	FOREIGN KEY (IdProjeto) REFERENCES Projeto(IdProjeto)
);