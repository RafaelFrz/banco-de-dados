create table usuario (
    id serial primary key,
    nome varchar(200) not null,
    cpf varchar(14) not null unique,
    email varchar(200) not null unique,
    telefone varchar(16)
)

create table endereco(
    id serial primary key,
    bairro varchar(200) not null unique,
    rua varchar(200) not null unique,
    numero int not null unique,
    cidade varchar(200) not null,
    logradouro varchar(200),
    cep varchar(9)
)

create table endereco_fornecedor(
    id serial primary key,
    id_fornecedor integer not null,
    id_endereco integer not null,
    constraint fk_fornecedor_to_endereco_fornecedor foreign key (id_fornecedor) references fornecedor(id),
    constraint fk_endereco_to_endereco_fornecedor foreign key (id_endereco) references endereco (id)
)

create table endereco_pagador(
    id serial primary key,
    id_pagador integer not null,
    id_endereco integer not null,
    constraint fk_pagador_to_endereco_pagador foreign key (id_pagador) references pagador(id),
    constraint fk_endereco_to_endereco_pagador foreign key (id_endereco) references (id)
)

create table tipo(
    id serial primary key,
    nome varchar(200) not null,
)

create table pagador(
    id serial primary key,
    nome varchar(200) not null,
    telefone varchar(16),
    email varchar(200),
    cpf_cnpj(18) not null unique
)

create table receitas(
    id serial primary key,
    valor numeric not null,
    data date,
    observacao varchar(200),
    id_pagador integer not null,
    id_tipo integer not null,
    constraint fk_pagador_to_receitas foreign key (id_pagador) references pagador(id)
    constraint fk_tipo_to_receitas foreign key (id_tipo) references tipo(id)
)

create table fornecedor(
    id serial primary key,
    nome varchar(200) not null,
    telefone varchar(16),
    email varchar(200),
    cpf_cnpj(18) not null unique
)

create table despesas(
    id serial primary key,
    valor numeric not null,
    data date,
    observacao varchar(200),
    pago boolean default false not null,
    id_fornecedor integer not null
    constraint fk_fonecedor_to_despesas foreign key (id_fornecedor) references fornecedor(id)
)