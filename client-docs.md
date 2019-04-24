# client-docs

## Observações sobre o comportamento dos processos:
- process:
  - Usuários não logados devem ver apenas os processos "visiveis".
  - Usuários logados sem permissões devem ver apenas os processos "visiveis".
  - Usuários logados com a permissão "ver processo" em um curso "devem poder ver os processos "ocultos" deste curso.

## Observações sobre o sistema de permissões:
- userRole: Cuidado ao dar permissões "globais" a um papel que será dado em um "curso". Exemplo: Dar permissão de "deletar usuário" ao papel de "coordenador" no curso de "matemática" pode dar permissões para este coordenador "deletar usuário" que não tem nenhuma relação com o curso do mesmo.
