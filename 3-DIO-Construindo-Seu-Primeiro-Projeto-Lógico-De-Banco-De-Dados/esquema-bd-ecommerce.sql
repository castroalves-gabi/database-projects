-- verificar tabela Pedido e correlatas para que marque corretamente os pprodutos e quantidades

create table dadosBanco(
	idBanco int auto_increment primary key not null,
    contaBanco varchar(30) not null,
	agência varchar(30) not null,
    banco char(3) not null
);

create table Pessoa(
	idPessoa int auto_increment primary key not null,
	cpfCnpj varchar(14) not null,
    primeiroNome varchar(20) not null,
	segundoNome varchar(20),
	sobrenome varchar(20) not null,
	dataNascimento date,
	endereço varchar(100),
    celular varchar(11),
    email varchar(45),
    seCliente bool default 1,
    seVendedor bool default 0,
    seFornecedor bool default 0,
    constraint unique_cpfCnpj_pessoa unique (cpfCnpj),
    dadosBanco_idBanco int,
    constraint fk_Pessoa_dadosBanco foreign key (dadosBanco_idBanco) references dadosBanco(idBanco)
);

create table Pagamento(
	idPagamento int auto_increment primary key not null,
    formaPagamento ENUM('Cartão', 'Pix', 'Boleto'),
    dataPagamento date,
    status ENUM('Pendente', 'Aprovado', 'Recusado') not null,
    númeroParcelas int default 0
);

-- add validação de limite
create table dadosCartão (
	idCartão int auto_increment primary key not null,
    númeroCartão varchar(20) not null,
    dataValidade date not null,
    códigoSegurança char(3) not null,
    nomeImpressoCartão varchar(30),
    bandeira ENUM('Visa', 'Master', 'Elo', 'Outra'),
    limiteDisponível float,
    Pagamento_idPagamento int,
	constraint fk_dadosCartão_Pagamento foreign key (Pagamento_idPagamento) references Pagamento(idPagamento)
);

create table pessoa_tem_dadosCartão(
	Pessoa_idPessoa int,
    dadosCartão_idCartão int,
	constraint fk_pessoa_tem_dadosCartão_Pessoa foreign key (Pessoa_idPessoa) references Pessoa(idPessoa),
    constraint fk_pessoa_tem_dadosCartão_idCartão foreign key (dadosCartão_idCartão) references dadosCartão(idCartão)
);
    
create table Produto(
	idProduto int auto_increment primary key not null,
    nome varchar(60) not null,
    descrição varchar(500),
    categoria ENUM('Casa', 'Pet', 'Papelaria', 'Brinquedo', 'Eletrônico', 'Acessório', 'Vestuário', 'Outra'),
    valor float(8,2) zerofill,
    condição ENUM('Novo', 'Usado'),
    produtoÚnico bool,
    quantidade int not null,
    dataCadastro date,
    pesoGramas float(7,2) zerofill default 300.00,
    alturaCm float(5,2) zerofill default 30.00,
    larguraCm float(5,2) zerofill default 20.00,
    profundidadeCm float(5,2) zerofill default 5.00
);

create table Entrega(
	idEntrega int auto_increment primary key not null,
    status ENUM('Aguardando envio', 'Enviado', 'Entregue') not null
);

-- se estiver no prazo de devolução true
create table Devolução(
	idDevolução int auto_increment primary key not null,
    possibilidadeDevolução tinyint default true not null,
    status ENUM('Devolução solicitada', 'Aguardado envio', 'Enviado', 'Prazo esgotado') not null
);

create table Cliente(
	idCliente int auto_increment primary key not null
);

create table Pedido(
	idPedido int auto_increment primary key not null,
    dataPedido date,
	Cliente_idCliente int,
	constraint fk_pedido_cliente foreign key (Cliente_idCliente) references Cliente(idCliente),
	Pagamento_idPagamento int,
	constraint fk_pedido_pagamento foreign key (Pagamento_idPagamento) references Pagamento(idPagamento),
	Entrega_idEntrega int,
    constraint fk_pedido_entrega foreign key (Entrega_idEntrega) references Entrega(idEntrega),
	Devolução_idDevolução int,
    constraint fk_pedido_devolução foreign key (Devolução_idDevolução) references Devolução(idDevolução)
);

create table Pedido_inclui_Produto(
	Pedido_idPedido int,
	constraint fk_Pedido_inclui_Produto_Pedido foreign key (Pedido_idPedido) references Pedido(idPedido),
    Produto_idProduto int,
	constraint fk_Pedido_inclui_Produto_Produto foreign key (Produto_idProduto) references Produto(idProduto),
    quantidade int
);

create table perfilCliente(
	Pessoa_idPessoa int,
	constraint fk_perfilCliente_Pessoa foreign key (Pessoa_idPessoa) references Pessoa(idPessoa),
	Cliente_idCliente int,
    constraint fk_perfilCliente_Cliente foreign key (Cliente_idCliente) references Cliente(idCliente)
);

create table carteiraVendedor(
	idcarteiraVendedor int auto_increment primary key not null,
    formaRecebimento ENUM('Cartão', 'Boleto', 'PIX'),
    valorAReceber float,
    valorRecebido float
);

create table Vendedor(
	idVendedor int auto_increment primary key not null,
    quantidadeVendida int,
    carteiraVendedor_idcarteiraVendedor int,
	constraint fk_Vendedor_carteiraVendedor foreign key (carteiraVendedor_idcarteiraVendedor) references carteiraVendedor(idcarteiraVendedor)
);

create table perfilVendedor(
	Pessoa_idPessoa int,
	constraint fk_perfilVendedor_Pessoa foreign key (Pessoa_idPessoa) references Pessoa(idPessoa),
	Vendedor_idVendedor int,
    constraint fk_perfilVendedor_Vendedor foreign key (Vendedor_idVendedor) references Vendedor(idVendedor)
);

create table Vendedor_vende_Produto(
	Vendedor_idVendedor int,
	constraint fk_Vendedor_vende_Produto_Vendedor foreign key (Vendedor_idVendedor) references Vendedor(idVendedor),
	Produto_idProduto int,
    constraint fk_Vendedor_vende_Produto_Produto foreign key (Produto_idProduto) references Produto(idProduto)
);

create table Fornecedor(
	idFornecedor int auto_increment primary key not null
);

create table perfilFornecedor(
	Pessoa_idPessoa int,
	constraint fk_perfilFornecedor_Pessoa foreign key (Pessoa_idPessoa) references Pessoa(idPessoa),
	Fornecedor_idFornecedor int,
    constraint fk_perfilFornecedor_Fornecedor foreign key (Fornecedor_idFornecedor) references Fornecedor(idFornecedor)
);

create table Fornecedor_fornece_Produto(
	quantidade int not null,
    valor float not null,
    formaRecebimento ENUM('Cartão', 'Boleto', 'PIX'),
    Fornecedor_idFornecedor int,
    constraint fk_Fornecedor_fornece_Produto_Fornecedor foreign key (Fornecedor_idFornecedor) references Fornecedor(idFornecedor),
	Produto_idProduto int,
    constraint fk_Fornecedor_fornece_Produto_Produto foreign key (Produto_idProduto) references Produto(idProduto)
);