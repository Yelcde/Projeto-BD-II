-- Criação do Banco
create table cliente (
	codcli serial primary key,
	nome varchar(50) not null,
	telefone char(11),
	email varchar(50) unique
);

create table atendente (
	codaten serial primary key,
	nome varchar(50) not null,
	salario numeric(7, 2) not null
);
alter table atendente add constraint salario_positivo check (salario > 0);

create table produto (
	codprod serial primary key,
	nome varchar(50) not null,
	preco numeric(8, 2) not null
);
alter table produto add constraint preco_positivo check (preco > 0);

create table pedido (
	codped serial primary key,
	data date not null,
	codcli integer,
	codaten integer
);
alter table pedido add constraint fk_pedido_codcli foreign key (codcli) references cliente(codcli);
alter table pedido add constraint fk_pedido_codaten foreign key (codaten) references atendente(codaten);

create table itenspedido (
	codped integer,
	codprod integer,
	quantidade integer
);
alter table itenspedido add primary key(codped, codprod);
alter table itenspedido add constraint fk_itenspedido_codped foreign key (codped) references pedido(codped);
alter table itenspedido add constraint fk_itenspedido_codprod foreign key (codprod) references produto(codprod);
alter table itenspedido add constraint quantidade_positiva check (quantidade > 0);

create table fornecedor (
	codfor serial primary key,
	nome varchar(50),
	cnpj char(14) not null unique
);

create table fornecimento (
	codprod integer,
	codfor integer,
	data date,
	quantidade integer
);

alter table fornecimento add primary key(codprod, codfor, data);
alter table fornecimento add constraint fk_fornecimento_codprod foreign key (codprod) references produto(codprod);
alter table fornecimento add constraint fk_fornecimento_codfor foreign key (codfor) references fornecedor(codfor);
alter table fornecimento add constraint quantidade_positiva check (quantidade > 0);