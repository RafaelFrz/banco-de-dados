-- 1. consulta que lista o nome, 
-- email e telefone de todos os usuarios

select nome, email, telefone from usuarios
order by id asc

-- 2. consulta que liste o nome de todas as 
-- sessões cadastradas

select descricao from sessoes
order by id asc

-- 3. consulta que liste o titulo, autor e
-- data de publicacao de todos os livros
-- DESAFIO: exibir a data no formato DD/MM/YYYY
-- Pesquisar sobre o uso da funcao to_char()

select titulo, nome_autor, 
    to_char(
        publicacao, 'DD/MM/YYYY'
    ) from livros
order by id asc

-- 4. consulta que lista todos os emprestimos
-- filtrando por apenas um usuario
-- utilizar WHERE

select * from emprestimo_livros
where id_emprestimo = 1
order by id asc

-- 5. consulta que liste todos os emprestimo_livros
-- filtrando por apenas um emprestimo
-- utilizar WHERE

select * from emprestimo_livros
where id = 4
order by id asc