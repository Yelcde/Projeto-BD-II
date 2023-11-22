-- a) i - Criação do Banco

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

-- Inserções nas tabelas

insert into cliente (nome, telefone, email) values ('João Silva', '12345678901', 'joao@email.com');
insert into cliente (nome, email) values ('Maria Oliveira', 'maria@email.com');
insert into cliente (nome, telefone) values ('Carlos Pereira', '98765432109');
insert into cliente (nome) values ('Ana Souza');
insert into cliente (nome, telefone, email) values ('Lucas Santos', '87654321098', 'lucas@email.com');
insert into cliente (nome, telefone, email) values ('Gabriela Oliveira Mendonça Silva', '76543210987', 'gabriela@email.com');
insert into cliente (nome, telefone, email) values ('Rodrigo Lima', '123456789', 'rodrigo@email.com');
insert into cliente (nome, telefone, email) values ('Aline Pereira', '98765432109', 'aline.email.com');
insert into cliente (nome, telefone, email) values ('Mário André', '34567890123', 'mario@email.com');
insert into cliente (nome) values ('Fernanda Silva');
insert into cliente (nome, telefone) values ('Paulo Oliveira', '98765432101');
insert into cliente (nome, telefone, email) values ('Paulo Santos', '87654321012', '');
insert into cliente (nome, telefone, email) values ('Mariana Lima', '', 'mariana@email.com');
insert into cliente (nome, telefone, email) values ('Rodrigo Caio', '12345678901', 'rodrigocaio@email.com');
insert into cliente (nome) values ('Gabriel Barbosa');
select * from cliente;

insert into atendente (nome, salario) values ('Mariana Oliveira', 3000.50);
insert into atendente (nome, salario) values ('Carlos Silva', 2500.75);
insert into atendente (nome, salario) values ('Ana Souza', 3200.00);
insert into atendente (nome, salario) values ('Pedro Santos', 2800.25);
insert into atendente (nome, salario) values ('Fernanda Lima', 3500.00);
insert into atendente (nome, salario) values ('Lucas Oliveira', 2700.50);
insert into atendente (nome, salario) values ('Aline Pereira', 3000.75);
insert into atendente (nome, salario) values ('Rodrigo Lima', 2600.00);
insert into atendente (nome, salario) values ('Gabriela Silva', 3300.25);
insert into atendente (nome, salario) values ('Paulo Santos', 2900.50);
insert into atendente (nome, salario) values ('Marta Oliveira', 3100.75);
insert into atendente (nome, salario) values ('João Souza', 2400.00);
insert into atendente (nome, salario) values ('Mário Lima', 2800.25);
insert into atendente (nome, salario) values ('Mara Santos', 3200.50);
insert into atendente (nome, salario) values ('Rafaela Silva', 3000.75);
select * from atendente;

insert into produto (nome, preco) values ('Notebook', 2500.00);
insert into produto (nome, preco) values ('Smartphone', 1200.50);
insert into produto (nome, preco) values ('TV LED 55"', 1800.75);
insert into produto (nome, preco) values ('Forno Elétrico', 350.00);
insert into produto (nome, preco) values ('Câmera Digital', 600.25);
insert into produto (nome, preco) values ('Console de Videogame', 450.25);
insert into produto (nome, preco) values ('Monitor 24"', 300.75);
insert into produto (nome, preco) values ('Bicicleta Ergométrica', 700.00);
insert into produto (nome, preco) values ('Aspirador de Pó', 180.50);
insert into produto (nome, preco) values ('Micro-ondas', 120.25);
insert into produto (nome, preco) values ('Impressora Multifuncional', 150.00);
insert into produto (nome, preco) values ('Caixa de Som Bluetooth', 80.75);
insert into produto (nome, preco) values ('Tablet', 400.50);
insert into produto (nome, preco) values ('Aparelho de Som', 250.25);
insert into produto (nome, preco) values ('Secador de Cabelo', 50.00);
select * from produto;

insert into fornecedor (nome, cnpj) values ('ElectroTech', '12345678901234');
insert into fornecedor (nome, cnpj) values ('Gadget World', '56789012345678');
insert into fornecedor (nome, cnpj) values ('Digital Supplies', '90123456789012');
insert into fornecedor (nome, cnpj) values ('E-Tech Solutions', '34567890123456');
insert into fornecedor (nome, cnpj) values ('Tech Innovators', '78901234567890');
insert into fornecedor (nome, cnpj) values ('ElectroGizmos', '23456789012345');
insert into fornecedor (nome, cnpj) values ('Digital Trends', '67890123456789');
insert into fornecedor (nome, cnpj) values ('ElecMart', '01234567890123');
select * from fornecedor;

insert into fornecimento (codprod, codfor, data, quantidade) values (1, 1, '2023-01-15', 50);
insert into fornecimento (codprod, codfor, data, quantidade) values (2, 2, '2023-02-20', 30);
insert into fornecimento (codprod, codfor, data, quantidade) values (3, 3, '2023-03-10', 25);
insert into fornecimento (codprod, codfor, data, quantidade) values (4, 4, '2023-04-05', 40);
insert into fornecimento (codprod, codfor, data, quantidade) values (5, 5, '2023-05-12', 20);
insert into fornecimento (codprod, codfor, data, quantidade) values (6, 6, '2023-06-18', 35);
insert into fornecimento (codprod, codfor, data, quantidade) values (7, 7, '2023-07-22', 15);
insert into fornecimento (codprod, codfor, data, quantidade) values (8, 8, '2023-08-30', 28);
insert into fornecimento (codprod, codfor, data, quantidade) values (11, 1, '2023-01-20', 10);
insert into fornecimento (codprod, codfor, data, quantidade) values (12, 2, '2023-02-25', 18);
insert into fornecimento (codprod, codfor, data, quantidade) values (13, 3, '2023-03-15', 12);
insert into fornecimento (codprod, codfor, data, quantidade) values (14, 4, '2023-04-10', 25);
insert into fornecimento (codprod, codfor, data, quantidade) values (15, 8, '2023-04-10', 35);
select * from fornecimento;

insert into pedido (data, codcli, codaten) values ('2023-11-05', 1, 1);
insert into pedido (data, codcli, codaten) values ('2023-12-10', 1, 2);
insert into pedido (data, codcli, codaten) values ('2023-10-10', 1, 2);
insert into pedido (data, codcli, codaten) values ('2023-01-05', 2, 2);
insert into pedido (data, codcli, codaten) values ('2023-11-15', 3, 3);
insert into pedido (data, codcli, codaten) values ('2023-12-20', 3, 4);
insert into pedido (data, codcli, codaten) values ('2023-02-10', 4, 4);
insert into pedido (data, codcli, codaten) values ('2023-03-15', 5, 5);
insert into pedido (data, codcli, codaten) values ('2023-04-20', 6, 6);
insert into pedido (data, codcli, codaten) values ('2023-05-25', 7, 7);
insert into pedido (data, codcli, codaten) values ('2023-06-30', 8, 8);
insert into pedido (data, codcli, codaten) values ('2023-07-05', 9, 9);
insert into pedido (data, codcli, codaten) values ('2023-08-10', 10, 10);
insert into pedido (data, codcli, codaten) values ('2023-09-25', 11, 11);
insert into pedido (data, codcli, codaten) values ('2023-10-30', 12, 12);
insert into pedido (data, codcli, codaten) values ('2023-11-05', 13, 13);
insert into pedido (data, codcli, codaten) values ('2023-12-10', 14, 14);
insert into pedido (data, codcli, codaten) values ('2024-01-15', 15, 5);
select * from pedido;

insert into itenspedido (codped, codprod, quantidade) values (1, 1, 2);
insert into itenspedido (codped, codprod, quantidade) values (1, 3, 1);
insert into itenspedido (codped, codprod, quantidade) values (1, 5, 3);
insert into itenspedido (codped, codprod, quantidade) values (1, 8, 1);
insert into itenspedido (codped, codprod, quantidade) values (1, 14, 3);

insert into itenspedido (codped, codprod, quantidade) values (2, 2, 4);
insert into itenspedido (codped, codprod, quantidade) values (2, 4, 2);
insert into itenspedido (codped, codprod, quantidade) values (2, 6, 1);

insert into itenspedido (codped, codprod, quantidade) values (3, 7, 1);
insert into itenspedido (codped, codprod, quantidade) values (3, 9, 2);
insert into itenspedido (codped, codprod, quantidade) values (3, 11, 3);

insert into itenspedido (codped, codprod, quantidade) values (4, 8, 3);
insert into itenspedido (codped, codprod, quantidade) values (4, 10, 2);
insert into itenspedido (codped, codprod, quantidade) values (4, 12, 1);
insert into itenspedido (codped, codprod, quantidade) values (4, 6, 2);
insert into itenspedido (codped, codprod, quantidade) values (4, 14, 3);

insert into itenspedido (codped, codprod, quantidade) values (5, 13, 2);
insert into itenspedido (codped, codprod, quantidade) values (5, 15, 3);
insert into itenspedido (codped, codprod, quantidade) values (5, 2, 1);

insert into itenspedido (codped, codprod, quantidade) values (6, 14, 1);
insert into itenspedido (codped, codprod, quantidade) values (6, 1, 2);
insert into itenspedido (codped, codprod, quantidade) values (6, 7, 3);

insert into itenspedido (codped, codprod, quantidade) values (7, 3, 1);
insert into itenspedido (codped, codprod, quantidade) values (7, 9, 2);
insert into itenspedido (codped, codprod, quantidade) values (7, 11, 3);
insert into itenspedido (codped, codprod, quantidade) values (7, 2, 2);
insert into itenspedido (codped, codprod, quantidade) values (7, 6, 1);
insert into itenspedido (codped, codprod, quantidade) values (7, 10, 3);

insert into itenspedido (codped, codprod, quantidade) values (8, 8, 3);
insert into itenspedido (codped, codprod, quantidade) values (8, 10, 2);
insert into itenspedido (codped, codprod, quantidade) values (8, 12, 1);

insert into itenspedido (codped, codprod, quantidade) values (9, 13, 2);
insert into itenspedido (codped, codprod, quantidade) values (9, 15, 3);
insert into itenspedido (codped, codprod, quantidade) values (9, 2, 1);

insert into itenspedido (codped, codprod, quantidade) values (10, 4, 2);
insert into itenspedido (codped, codprod, quantidade) values (10, 6, 1);
insert into itenspedido (codped, codprod, quantidade) values (10, 8, 3);

insert into itenspedido (codped, codprod, quantidade) values (11, 10, 4);
insert into itenspedido (codped, codprod, quantidade) values (11, 12, 2);
insert into itenspedido (codped, codprod, quantidade) values (11, 14, 1);

insert into itenspedido (codped, codprod, quantidade) values (12, 7, 1);
insert into itenspedido (codped, codprod, quantidade) values (12, 9, 2);
insert into itenspedido (codped, codprod, quantidade) values (12, 11, 3);

insert into itenspedido (codped, codprod, quantidade) values (13, 3, 1);
insert into itenspedido (codped, codprod, quantidade) values (13, 9, 2);
insert into itenspedido (codped, codprod, quantidade) values (13, 11, 3);

insert into itenspedido (codped, codprod, quantidade) values (14, 8, 3);
insert into itenspedido (codped, codprod, quantidade) values (14, 10, 2);
insert into itenspedido (codped, codprod, quantidade) values (14, 12, 1);

insert into itenspedido (codped, codprod, quantidade) values (15, 13, 2);
insert into itenspedido (codped, codprod, quantidade) values (15, 15, 3);
insert into itenspedido (codped, codprod, quantidade) values (15, 2, 1);
insert into itenspedido (codped, codprod, quantidade) values (15, 4, 2);
insert into itenspedido (codped, codprod, quantidade) values (15, 8, 1);
insert into itenspedido (codped, codprod, quantidade) values (15, 14, 3);

insert into itenspedido (codped, codprod, quantidade) values (16, 14, 1);
insert into itenspedido (codped, codprod, quantidade) values (16, 1, 2);
insert into itenspedido (codped, codprod, quantidade) values (16, 7, 3);

insert into itenspedido (codped, codprod, quantidade) values (17, 3, 1);
insert into itenspedido (codped, codprod, quantidade) values (17, 9, 2);
insert into itenspedido (codped, codprod, quantidade) values (17, 11, 3);

insert into itenspedido (codped, codprod, quantidade) values (18, 8, 3);
insert into itenspedido (codped, codprod, quantidade) values (18, 10, 2);
insert into itenspedido (codped, codprod, quantidade) values (18, 12, 1);
select * from itenspedido;

-- a) ii - Consultas Variadas

-- Exibir relatório de produtos fornecidos entre os meses 1 e 3, mostrando
-- nome do produto, quantidade fornecida, mês de fornecimento e nome do fornecedor

select
	P.nome "Produto", FR.quantidade "Quantidade",
	extract(month from FR.data) "Mês fornecimento",
	F.nome "Fornecedor"
from produto P
join fornecimento FR on P.codprod = FR.codprod
join fornecedor F on FR.codfor = F.codfor
where extract(month from FR.data) between 1 and 3
order by FR.data;

-- Exiba o nome dos atendentes que atenderam pedidos

select distinct A.nome from atendente A
join pedido P on A.codaten = P.codaten;

-- Exiba o nome dos cliente que fizeram pedidos e foram atendidos pelo
-- atendente Calos Silva

select distinct C.nome from atendente A
join pedido P on A.codaten = P.codaten
join cliente C on P.codcli = C.codcli
where A.nome = 'Carlos Silva';

-- Exiba o nome e preço dos produtos fornecedos pelas fornecedoras
-- ElectroTech e Gadget World. Exibir também o nome da fornecedora

select
	P.nome "Produto",
	P.preco "Preço",
	F.nome "Fornecedor"
from produto p
join fornecimento FR on P.codprod = FR.codprod
join fornecedor F on FR.codfor = F.codfor
where F.nome in ('ElectroTech', 'Gadget World')
order by F.nome;

-- Exiba todos os nomes dos atendentes e a quantidade de pedidos que
-- eles atenderam

select A.nome "Atendente", count(P.codped) "Qtd Atendimentos"
from atendente A left join pedido P on A.codaten = P.codaten
group by A.codaten
order by A.nome;

-- Exiba o nome do fornecedor e o total de produtos que ele forneceu

select F.nome "Fornecedor", count(P.codprod) "Qtd Produtos Fornecidos"
from fornecedor F
join fornecimento FR on F.codfor = FR.codfor
join produto P on FR.codprod = P.codprod
group by F.codfor
order by F.nome;

-- Exiba o nome dos produtos que tiveram no mínimo 10 vendas. Mostre também a
-- quantidade de vendas

select P.nome "Produto", sum(IP.quantidade) "Qtd Vendida"
from produto P
join itenspedido IP on P.codprod = IP.codprod
group by P.codprod
having sum(IP.quantidade) > 9
order by sum(IP.quantidade);

-- Exiba os atendentes que não atenderam pedidos

select codaten from atendente
except
select codaten from pedido;

-- Exiba o nome dos produtos fornecidos após o mês 4

select nome from produto
where codprod in (
	select codprod from fornecimento
	where extract(month from data) > 4
);

-- Exiba o nome e o salário dos atendentes com salário abaixo da média

select nome, salario from atendente
where salario < (select avg(salario) from atendente);


-- b) Views

-- Crie uma view para exibir somente o cnpj dos fornecedores. Ela também
-- deve permitir inserções

create or replace view cnpjFornecedores as
	select cnpj from fornecedor;
	select * from cnpjFornecedores;

-- Crie uma view para exibir um relatório de pedidos, exibindo:
-- nome do cliente, nome do atendente, data do pedido, quantidade de itens
-- e valor total do pedido.

create or replace view relatorioPedidos as
	select
		C.nome "Cliente", A.nome "Atendente",
		P.data "Data do Pedido", sum(IP.quantidade) "Qtd Itens",
		sum(PR.preco * IP.quantidade) "Total Valor"
	from itenspedido IP
	join pedido P on IP.codped = P.codped
	join atendente A on P.codaten = A.codaten
	join cliente C on P.codcli = C.codcli
	join produto PR on IP.codprod = PR.codprod
	group by (P.codped, C.codcli, A.codaten)
	order by sum(PR.preco * IP.quantidade);
select * from relatorioPedidos;

-- Crie uma view para exibir um relatório de fornecimento, exibindo o
-- nome do fornecedor, o produto fornecido e a quantidade fornecida em um mês especifico

create or replace view relatorioFornecimento as
	select F.nome "Fornecedor", P.nome "Produto", FR.quantidade "Quantidade"
	from fornecedor F
	join fornecimento FR on F.codfor = FR.codfor
	join produto P on FR.codprod = P.codprod
	where extract(month from FR.data) = 1
	order by F.nome;
select * from relatorioFornecimento;

-- c) Índices

-- Campo "data" de fornecimento, é um campo comumente usado em comparação de intervalos
create index dataFornecimento on fornecimento(data);
-- Campo "nome" de produto, campo muito procurado em cláusulas where, group by e order by
create index nomeProduto on produto(nome);
-- Campo "salário" de atendente, campo usado para comparação de intervalos, somatória de valores
-- e comparação com média de salários
create index salarioAtendente on atendente(salario);


-- d) Reescrita de consultas

-- Consulta a ser reescrita: Exiba os atendentes que não atenderam pedidos.

	-- select codaten from atendente
	-- except
	-- select codaten from pedido;

-- Justificativa: seria mais interessante termos acesso a mais dado do atendente,
-- não somente ao seu código.

select A.nome from atendente A
left join pedido P on A.codaten = P.codaten
where P.codped is null;

-- Consulta a ser reescrita: Exiba o nome dos produtos fornecidos após o mês 4.

	-- select nome from produto
	-- where codprod in (
	-- 	select codprod from fornecimento
	-- 	where extract(month from data) > 4
	-- );

-- Justificativa: assim como na consulta anterior, seria mais interessante termos
-- acesso a mais dados do que apenas o nome do produto, um dado interessante poderia
-- ser a quantidade. Por isso substituímos a subquerie por um join.

select P.nome, FR.quantidade from produto P
join fornecimento FR on P.codprod = FR.codprod
where extract(month from FR.data) > 4;

-- e) Funções e procedures armazenadas

-- 1 função que use SUM, MAX, MIN, AVG ou COUNT

-- -- Verificando a quantidade vendida de cada produto da loja

create or replace function mostrar_quantidade_vendida()
returns table (
    produto_nome varchar(50),
    quantidade_vendida bigint
) as $$
begin
    return query
    select
        P.nome as produto_nome,
        sum(IP.quantidade) as quantidade_vendida
    from produto P
    left join itenspedido IP on P.codprod = IP.codprod
    group by P.codprod, P.nome
	order by sum(IP.quantidade);
end;
$$ language plpgsql;

select * from mostrar_quantidade_vendida();

-- 2 funções e 1 procedure com justificativa semântica, conforme os requisitos da aplicação

-- -- Verificar quantas vendas um atendente fez

create or replace procedure qntVendas(codigoaten integer)
	language plpgsql
	as $$
		declare 
			nome atendente.nome%type;
			vendas atendente.codaten%type;
		begin
			select A.nome "Nome", count(P.codaten) "Vendas" into nome, vendas
			from atendente A join pedido P on P.codaten = A.codaten
			where A.codaten = codigoaten
			group by A.nome;
			
            if nome is null then
                raise exception 'Código não encontrado';
            end if;
            
			raise notice 'Nome: %, Quantidade de Vendas: %', nome, vendas;
	end $$;

call qntVendas(5);

-- -- Criar função para exibir o produto fornecido de um determinado fabricante

create or replace function produtoMaisFornecido(cod_for integer) returns void
as $$ 
	declare
		nome_prod produto.nome%type;
		qtd_fornecidos integer;
		cursor_prod_fornecedores cursor for select P.nome, FR.quantidade
		from fornecedor F
		join fornecimento FR on FR.codfor = F.codfor
		join produto P on P.codprod = FR.codprod
		where F.codfor = cod_for;
	
	begin
		if cod_for not in (select codfor from fornecedor) then
			raise exception 'Fornecedor inexistente';
		end if;
		
		qtd_fornecidos = 0;
		
		for c_prod_for in cursor_prod_fornecedores loop
			if c_prod_for.quantidade > qtd_fornecidos then
				qtd_fornecidos = c_prod_for.quantidade;
				nome_prod = c_prod_for.nome;
			end if;
		end loop;
		
		raise notice 'Produto: %, Fornecidos: %', nome_prod, qtd_fornecidos;
	
	exception
		when raise_exception then
			raise notice 'Fornecedor inexistente';
end;
$$ language plpgsql;

select produtoMaisFornecido(4);

-- f) Triggers

-- Criar um trigger para impedir criação de pedidos com datas passadas

create or replace function verificaData()
    returns trigger
    as $$
        begin
            if new.data < current_date then
                raise exception 'Erro: A data do pedido não pode ser no passado.';
            end if;
            
            return new;
        end;
    $$ language plpgsql;
    
create trigger trigger_verifica_data
    before insert on pedido
        for each row execute procedure verificaData();

insert into pedido (data, codcli, codaten) values ('2023-11-10', 14, 14);

-- Criar um trigger para impedir o aumento exagerado de preço de produto.
-- O novo preço só pode ser 50% a mais do preço antigo.

create or replace function aumentoLimite() returns trigger
as $$
	declare preco_limite produto.preco%type;
	
	begin
		preco_limite = old.preco + (old.preco * 0.5);
		
		if new.preco > preco_limite then
			return old;
		else
			return new;
		end if;
end;
$$ language plpgsql;

create trigger limiteDeAtualizacaoPreco before update
on produto for each row
execute procedure aumentoLimite();

select * from produto where codprod = 8;
update produto set preco = 1050 where codprod = 8;
select * from produto where codprod = 8;