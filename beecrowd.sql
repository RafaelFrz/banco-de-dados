-- 2062 - Select básico

select 
    name 
from customers
where state = 'RS'

-- 2063 - Endereço dos clientes

select
    name,
    street
from customers
where city = 'Porto Alegre'

-- 2064 - Menores que 10 ou Maiores que 100

select
    id,
    name
from products
where price < 10 or price > 100

-- 2065 - Representantes Executivos

select 
    pdt.name,
    pvd.name
from products as pdt
inner join providers as pvd on (pdt.id_providers = pvd.id)
where pdt.id_categories = 6

-- 2606 - Categorias

select
    pdt.id,
    pdt.name
from products as pdt
inner join categories as ctg on (pdt.id_categories = ctg.id)
where ctg.name like 'super%'

-- 2607 - Cidades em Ordem Alfabética

select
    city
from providers
order by city asc

-- 2608 - Maior e Menor Preço

select
    max(price),
    min(price)
from products

-- 2609 - Produtos por Categorias

select 
    ctg.name,
    sum(pdt.amount)
from products as pdt
inner join categories as ctg on (pdt.id_categories = ctg.id)
group by ctg.id

-- 2610 - Valor Médio dos Produtos

select
    round(
        avg(price), 2
    ) as price
from products

-- 2611 - Filmes de Ação

select
    mv.id,
    mv.name
from movies as mv
inner join genres as gen on (mv.id_genres = gen.id)
where gen.description like 'Action'

-- 2613 - Filmes em Promoção

-- 2614 - Locação em Setembro

select
    ctm.name,
    rnt.rentals_date
from rentals as rnt
inner join customers as ctm on (rnt.id_customers = ctm.id)
where rentals_date between '2016-09-01' and '2016-09-30'

-- 2615 - Expandindo o Negocio

select
    city
from customers
group by city

-- 2616 - Nenhuma Locação

select
    ctm.id,
    ctm.name
from customers as ctm
where ctm.id not in (select id_customers from locations)

-- 2617 - Fornecedor Ajax SA

