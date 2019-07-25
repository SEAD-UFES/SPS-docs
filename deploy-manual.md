
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

Coletar o password temporario (Não precisou na minha instalação, o mysql ficou com a senha de root):
> \# grep 'A temporary password' /var/log/mysqld.log |tail -1

3. Iniciar o serviço (habilitar o restart no boot também por garantia)

> \# systemctl enable mysqld
> \# systemctl start mysqld

4. Configuração Inicial

> \# /usr/bin/mysql_secure_installation

Troque o password se precisar e confirme o que você quiser confirmar no assitente.

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

> $ sudo yum install git

## 3. Instalar NODE/NPM:

https://www.digitalocean.com/community/tutorials/how-to-set-up-a-node-js-application-for-production-on-centos-7  
https://www.digitalocean.com/community/tutorials/how-to-set-up-a-node-js-application-for-production-on-debian-9  

### 3.1. Instalar o node

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

Editar o visudo / Alterar linha adicionando "/usr/local/bin" para usuários do sudo:

> $ sudo visudo

> Defaults    secure_path = /sbin:/bin:/usr/sbin:/usr/bin:/usr/local/bin

Verificar node:
> $ node -v

### 3.2. Testar o node:

Criar app de teste:
> $ cd ~  
> $ vim hello.js

Editar o salvar o arquivo:
> var http = require('http');  
> http.createServer(function (req, res) {  
>  res.writeHead(200, {'Content-Type': 'text/plain'});  
>  res.end('Hello World\n');  
> }).listen(8080, '127.0.0.1');  
> console.log('Server running at http://127.0.0.1:8080/');  

Iniciar aplicação:
> $ node hello.js

Testar servidor:
> $ curl http://127.0.0.1:8080

## 4. Instalar PM2:

https://www.digitalocean.com/community/tutorials/how-to-set-up-a-node-js-application-for-production-on-centos-7  
https://www.digitalocean.com/community/tutorials/how-to-set-up-a-node-js-application-for-production-on-debian-9  

### 4.1. Instalação do PM2:
Instalar PM2:
> $ sudo npm install pm2@latest -g

Testar PM2 (com o app criado na seção anterior):
> $ pm2 start hello.js

Testar servidor:
> $ curl http://127.0.0.1:8080

Configurar pm2 como serviço e inicializar no boot (vai tentar localizar o sistema de serviços):
> $ sudo pm2 startup

Caso não encontre o sistema de serviços, você precisa especificar:
> $ sudo pm2 startup systemd

### 4.2. Comandos úteis:

Iniciar app:
> $ pm2 start app (app_name, app_id) ou (app_arquive para novos processos)

Listar serviços:
> $ pm2 list

Salvar configuração atual para o próximo boot:
> $ pm2 save

App info:
> $ pm2 info app (app_name, app_id)

Parar app:
> $ pm2 stop app (app_name, app_id)

Excluir app:
> $ pm2 delete app (app_name, app_id)

## 5. Instalar SPS:

Criar pasta onde o sistema vai funcionar (/home/user, /var/www, onde você quiser):
> $ cd /var/www
> $ mkdir sps-production
> $ cd sps-production

### 5.1. Instalar server / Configurar PM2:

#### 5.1.1. Baixar projeto do git hub:

Clonar o repositório:
> $ git clone https://github.com/SEAD-UFES/publications.git

Renomear a pasta e entrar:
> $ mv publications server  
> $ cd server

Alterar para o branch desejado:
> $ git branch development

Baixar atualizações:
> $ git pull

#### 5.1.2. Configurar o servidor:

Criar o arquivo database.json:
> $ vim config/database.json

Editar e salvar o arquivo (preciso aprender como funcionam as databases de production e teste):
> {
>    "development": {
>      "username": "sps_user",
>      "password": "sps_production_v1",
>      "database": "password",
>      "host": "127.0.0.1",
>      "dialect": "mysql",
>      "operatorsAliases": false
>    }
> }

Criar o arquivo secrets.json:
> $ vim config/secrets.json

Editar e salvar o arquivo:
>



### 5.2. Instalar client / Configurar PM2:
## 6. Instalar / Configurar Nginx:














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
