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
where price between 10 and 100