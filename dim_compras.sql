-- Database: BI_ERPDemo

-- DROP DATABASE "BI_ERPDemo";

CREATE DATABASE "BI_ERPDemo"
    WITH 
    OWNER = postgres
    ENCODING = 'LATIN1'
    LC_COLLATE = 'C'
    LC_CTYPE = 'C'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;

create table "BI_ERPDemo".public.dim_loja(
	id_loja_pk bigserial not null,
	cod_empresa varchar(5) not null,
	nome_empresa varchar(60),
	cod_loja varchar(5) not null,
	nome_loja varchar(30),
	rua_loja varchar(50),
	num_loja varchar(8),
	bairro_loja varchar(50),
	cidade_loja varchar(50),
	uf_loja varchar(2),
	cep_loja varchar(8),
	cnpj_loja varchar(15),
	telefone_loja varchar(12),
	CONSTRAINT pk_dim_loja PRIMARY KEY (id_loja_pk)
);

create table "BI_ERPDemo".public.dim_nota_fiscal(
	id_nf_pk bigserial not null,
	num_nf varchar(15) not null,
    codope_nf varchar(5) not null,
    nummovest_nf varchar(5) not null,
	CONSTRAINT pk_dim_nota_fiscal PRIMARY KEY (id_nf_pk)
);

create table "BI_ERPDemo".public.dim_produto(
	id_produto_pk bigserial not null,
	cod_produto varchar(10) not null,
	desc_produto varchar(100),
	embal_produto varchar(10),
	desc_grupo_produto varchar(60),
	marca_produto varchar(20),
	qtd_embal_produto float8,
	CONSTRAINT pk_dim_produto PRIMARY KEY (id_produto_pk)
);


create table "BI_ERPDemo".public.dim_fornecedor(
	id_fornecedor_pk bigserial not null,
	cod_fornecedor varchar(10) not null,
	descricao_fornecedor varchar(50),
	rua_fornecedor varchar(50),
	bairro_fornecedor varchar(20),
	cidade_fornecedor varchar(60),
	uf_fornecedor varchar(60),
	cep_fornecedor varchar(8),
	cnpj_fornecedor varchar(20),
	telefone_fornecedor varchar(11),
	CONSTRAINT pk_dim_fornecedor PRIMARY KEY (id_fornecedor_pk)
);

create table "BI_ERPDemo".public.dim_pessoa(
	id_pessoa_pk bigserial not null,
	cod_pessoa varchar(10) not null,
	nome_pessoa varchar(50),
	cpf_pessoa varchar(20),
	sexo_pessoa varchar(15),
	tipo_pessoa varchar(50),
	CONSTRAINT pk_dim_pessoa PRIMARY KEY (id_pessoa_pk)
);

create table "BI_ERPDemo".public.dim_tempo(
	id_tempo_pk bigserial not null,
	data date,
	dia char(2),
	mes char(2),
	ano char(4),
	semana int4,
	dia_semana varchar(20),
	semestre int4,
	trimestre int4,
	quadrimestre int4,
	nome_mes varchar(15),
	mes_ano char(6),
	CONSTRAINT pk_dim_tempo PRIMARY KEY (id_tempo_pk)
);

create table "BI_ERPDemo".public.fato_compras(
	id_loja_fk int4 not null,
	id_nf_fk int4 not null,	
	id_produto_fk int4 not null,
	id_fornecedor_fk int4 not null,
	id_pessoa_fk int4 not null,
	id_tempo_fk int4 not null,
	custoun_compra float8,
	custotot_compra float8,
	qtd_compras int4,
	CONSTRAINT fk_dim_loja FOREIGN KEY (id_loja_fk) REFERENCES public.dim_loja (id_loja_pk) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION NOT VALID,
	CONSTRAINT fk_dim_nf FOREIGN KEY (id_nf_fk) REFERENCES public.dim_nota_fiscal (id_nf_pk) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION NOT valid,
	CONSTRAINT fk_dim_produto FOREIGN KEY (id_produto_fk) REFERENCES public.dim_produto (id_produto_pk) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION NOT VALID,
	CONSTRAINT fk_dim_fornecedor FOREIGN KEY (id_fornecedor_fk) REFERENCES public.dim_fornecedor (id_fornecedor_pk) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION NOT VALID,
	CONSTRAINT fk_dim_pessoa FOREIGN KEY (id_pessoa_fk) REFERENCES public.dim_pessoa (id_pessoa_pk) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION NOT VALID,
	CONSTRAINT fk_dim_tempo FOREIGN KEY (id_tempo_fk) REFERENCES public.dim_tempo (id_tempo_pk) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION NOT VALID
	
);
