
# Como fazer o Deploy do SPS

## Instalar / Configurar MySQL:

https://www.digitalocean.com/community/tutorials/how-to-install-mariadb-on-centos-7  
https://tecadmin.net/install-mysql-5-7-centos-rhel  
http://www.daniloaz.com/en/how-to-create-a-user-in-mysql-mariadb-and-grant-permissions-on-a-specific-database/  

### Instalar MySQL:




### Configurar DB para o servidor:

## Instalar GIT:

## Instalar Node:

## Instalar PM2:

## Instalar server / Configurar PM2:

## Instalar client / Configurar PM2:

## Instalar / Configurar Nginx:














- process:
  - Usuários não logados devem ver apenas os processos "visiveis".
  - Usuários logados sem permissões devem ver apenas os processos "visiveis".
  - Usuários logados com a permissão "ver processo" em um curso devem poder ver os processos "ocultos" deste curso.
- filtros:
  - [Número]
  - [Ano]
  - [Tipo de curso]
  - [Curso]
  - [Tipo de vaga]
  - [Tem chamada aberta]

## Observações sobre o sistema de permissões:
- userRole:
  - Cuidado ao dar permissões "globais" a um papel que será dado em um "curso". Exemplo: Dar permissão de "deletar usuário" ao papel de "coordenador" no curso de "matemática" pode dar permissões para este coordenador "deletar usuário" que não tem nenhuma relação com o curso do mesmo.
  - Não podem existir 2 ou mais userRoles iguais.
- roleType:
  - O roleType "Administrador" não pode ter seu nome alterado.
  - O nome do roleType deve ser único.
