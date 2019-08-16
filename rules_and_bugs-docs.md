# client-docs

## Observações sobre o comportamento dos processos:
- selectiveprocess:
  - Usuários não logados devem ver apenas os processos "visiveis". (ok)
  - Usuários logados sem permissões devem ver apenas os processos "visiveis". (ok)
  - Usuários logados com a permissão "ver processo" em um curso devem poder ver os processos "ocultos" deste curso. (ok)
  - Processos não podem ter Numero/Ano iguais ao mesmo tempo (pendente)
  - BK BUG: Acesse (sem login) /processes e tente filtrar por atribuição o back-end retorna um erro. (resolvido)
  - BK BUG: Acesse /processes tente filtrar nível e curso ao mesmo tempo.  
  (node:13632) UnhandledPromiseRejectionWarning: TypeError: list.split is not a function
[0]     at validIds (C:\Users\fernando.annecchini\Documents\projetos\SPS\server\app\helpers\listFilters.js:50:12)
[0]     at api.list (C:\Users\fernando.annecchini\Documents\projetos\SPS\server\app\api\selectiveProcesses.js:65:21)
[0] (node:13632) UnhandledPromiseRejectionWarning: Unhandled promise rejection. This error originated either by throwing inside of an async function without a catch block, or by rejecting a promise which was not handled with .catch(). (rejection id: 3)
(quando split é chamada ela já não exite mais?)
  
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
