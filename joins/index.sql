-- Listar o nome, email e telefone do usuarios que pegaram emprestado algum livro do setor id 2 (caso não tenha setor id 2 no banco de dados de vocês, substituir por um id existente);

select 
    us.nome,
    us.email,
    us.telefone
from emprestimos as em

inner join usuarios as us on (em.id_usuario = us.id)
inner join emprestimo_livros as el on (em.id = el.id_emprestimo)
inner join livros as li on (el.id_livro = li.id)

where li.id_sessao = 8;

-- Listar título, nome da sessão e nome do autor dos livros que o usuário id 5 pegou emprestado (mesma lógica da anterior, caso não tenha usuario com id 5, substituir por um id de usuario existente)

-- Listar o título e data de publicação dos livros emprestados para usuarios com DDD (55)
