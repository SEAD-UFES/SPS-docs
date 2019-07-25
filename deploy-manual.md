
# Como fazer o Deploy do SPS

## 1. Instalar / Configurar MySQL:

https://www.digitalocean.com/community/tutorials/how-to-install-mariadb-on-centos-7  
https://tecadmin.net/install-mysql-5-7-centos-rhel  
http://www.daniloaz.com/en/how-to-create-a-user-in-mysql-mariadb-and-grant-permissions-on-a-specific-database/  

### 1.1. Instalar MySQL:

1. Habilitar o repositório

> -- On CentOS and RHEL 7 -- 
> \# yum localinstall https://dev.mysql.com/get/mysql57-community-release-el7-9.noarch.rpm

2. Instalar o MySQL

> \# yum install mysql-community-server


3. Iniciar o serviço
4. Configuração Inicial
5. Teste de login

### 1.2. Configurar DB para o servidor:



## 2. Instalar GIT:

## 3. Instalar Node:

## 4. Instalar PM2:

## 5. Instalar server / Configurar PM2:

## 6. Instalar client / Configurar PM2:

## 7. Instalar / Configurar Nginx:














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
