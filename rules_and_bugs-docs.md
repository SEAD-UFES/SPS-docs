# client-docs

## Observações sobre o comportamento dos processos:
- process:
  - Usuários não logados devem ver apenas os processos "visiveis". (ok)
  - Usuários logados sem permissões devem ver apenas os processos "visiveis". (ok)
  - Usuários logados com a permissão "ver processo" em um curso devem poder ver os processos "ocultos" deste curso. (ok)
  - Processos não podem ter Numero/Ano iguais ao mesmo tempo (pendente)
  - BUG: Acesse (sem login) /processes e tente filtrar por atribuição o back-end retorna um erro.
  
- filtros:
  - [Número]
  - [Ano]
  - [Tipo de curso]
  - [Curso]
  - [Tipo de vaga]
  - [Tem chamada aberta] (avaliar)
  
- call:
  - Criar o campo data de inicio da chamada. (ok)
  - Data de encerramento deve ser maior que data de abertura. (pendente)
  - Duas chamadas não podem estar abertas em um mesmo periodo de tempo. (pendente)
  - Inscrições (inicio e fim) não podem mais ser campos obrigatórios. (pendente)

## Observações sobre o sistema de permissões:
- userRole:
  - Cuidado ao dar permissões "globais" a um papel que será dado em um "curso". Exemplo: Dar permissão de "deletar usuário" ao papel de "coordenador" no curso de "matemática" pode dar permissões para este coordenador "deletar usuário" que não tem nenhuma relação com o curso do mesmo.
  - Não podem existir 2 ou mais userRoles iguais. (pendente)
- roleType:
  - O roleType "Administrador" não pode ter seu nome alterado. (pendente)
  - Não podem existir outros RoleTypes chamadas "Administrador" (pendente)
  - O nome do roleType deve ser único. (pendente?)
