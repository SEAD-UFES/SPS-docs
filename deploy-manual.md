
# Como fazer o Deploy do SPS

## 1. Instalar / Configurar MySQL:

https://www.digitalocean.com/community/tutorials/how-to-install-mariadb-on-centos-7  
https://tecadmin.net/install-mysql-5-7-centos-rhel  
http://www.daniloaz.com/en/how-to-create-a-user-in-mysql-mariadb-and-grant-permissions-on-a-specific-database/  

### 1.1. Instalar MySQL (5.7):

1. Habilitar o repositório

> -- On CentOS and RHEL 7 -- 
> \# yum localinstall https://dev.mysql.com/get/mysql57-community-release-el7-9.noarch.rpm

2. Instalar o MySQL

> \# yum install mysql-community-server

Coletar o password temporario (Não precisou na minha instalação o mysql ficou com a senha de root):
> \# grep 'A temporary password' /var/log/mysqld.log |tail -1

3. Iniciar o serviço (habilitar o restart também por garantia)

> \# systemctl enable mysqld
> \# systemctl start mysqld

4. Configuração Inicial

> \# /usr/bin/mysql_secure_installation

Troque o passwor se precisar e confirme o que você quiser confirmar no assitente.

5. Teste de login

> \# mysql -h localhost -u root -p 

### 1.2. Configurar DB para o servidor:

Crie o banco de dados para o servidor do SPS.

> /* CREATE NEW DATABASE */  
> mysql\> CREATE DATABASE sps_production_v1;

> /* CREATE MYSQL USER FOR DATABASE */  
> mysql\> CREATE USER 'sps_user'@'localhost' IDENTIFIED BY 'password';

> /* GRANT Permission to User on Database */  
> mysql\> GRANT ALL ON sps_production_v1.* TO 'db_user'@'localhost';

> /* RELOAD PRIVILEGES */  
> mysql\> FLUSH PRIVILEGES;

## 2. Instalar GIT:

https://www.digitalocean.com/community/tutorials/how-to-set-up-a-node-js-application-for-production-on-centos-7  

Instalar o git será necessário (dependencia do NPM).

> sudo yum install git

## 3. Instalar NODE/NPM:

###3.1. Instalar o node

Procurar o link para os binarios linux para a instalação LTS
https://nodejs.org/en/download/

Baixar o binário:
> $ cd ~
> $ wget https://nodejs.org/dist/v4.2.3/node-v4.2.3-linux-x64.tar.gz (link para os binarios do tutorial)

Criar diretório e descompactar:
> $ mkdir node
> $ tar xvf node-v*.tar.gz --strip-components=1 -C ./node

Configurar prefixo para o npm criar links para os pacotes instalados: 
> $ mkdir node/etc
> $ echo 'prefix=/usr/local' > node/etc/npmrc

Mover a pasta, alterar as permissões, colocar links que estarão disponiveis no PATH:
> $ sudo mv node /opt/
> $ sudo chown -R root: /opt/node
> $ sudo ln -s /opt/node/bin/node /usr/local/bin/node
> $ sudo ln -s /opt/node/bin/npm /usr/local/bin/npm


sudo visudo

Alterar linha adicionando "/usr/local/bin" para usuários do sudo:
> Defaults    secure_path = /sbin:/bin:/usr/sbin:/usr/bin:/usr/local/bin

Testar node:
> $ node -v

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
