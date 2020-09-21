<!-- @format -->

# Como fazer o Deploy do SPS (CentOS 7)

## 1. Instalar / Configurar MySQL:

https://www.digitalocean.com/community/tutorials/how-to-install-mariadb-on-centos-7  
https://tecadmin.net/install-mysql-5-7-centos-rhel  
http://www.daniloaz.com/en/how-to-create-a-user-in-mysql-mariadb-and-grant-permissions-on-a-specific-database/

### 1.1. Instalar MySQL (5.7):

1. Habilitar o repositório

> -- On CentOS and RHEL 7 -- \# yum localinstall https://dev.mysql.com/get/mysql57-community-release-el7-9.noarch.rpm

2. Instalar o MySQL

> \# yum install mysql-community-server

Coletar o password temporario (Não precisou na minha instalação, o mysql ficou com a senha de root):

> \# grep 'A temporary password' /var/log/mysqld.log | tail -1

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

> /_ CREATE NEW DATABASE _/  
> mysql\> CREATE DATABASE sps_production_v1;

> /_ CREATE MYSQL USER FOR DATABASE _/  
> mysql\> CREATE USER 'sps_user'@'localhost' IDENTIFIED BY 'password';

> /_ GRANT Permission to User on Database _/  
> mysql\> GRANT ALL ON sps_production_v1.\* TO 'db_user'@'localhost';

> /_ RELOAD PRIVILEGES _/  
> mysql\> FLUSH PRIVILEGES;

## 2. Instalar GIT:

https://www.digitalocean.com/community/tutorials/how-to-set-up-a-node-js-application-for-production-on-centos-7

Instalar o git será necessário (dependencia do NPM).

> \$ sudo yum install git

## 3. Instalar NODE/NPM:

Usamos a última versão LTS do Node (12.\* no momento de atualização desse documento). Não é recomendável instalar pelo
gerenciador nativo (yum/apt/etc) pois normalmente disponibiliza uma versão mais antiga do pacote.

https://www.digitalocean.com/community/tutorials/how-to-set-up-a-node-js-application-for-production-on-centos-7  
https://www.digitalocean.com/community/tutorials/how-to-set-up-a-node-js-application-for-production-on-debian-9  
[ou usando o nvm](https://linuxize.com/post/how-to-install-node-js-on-centos-7/#how-to-install-nodejs-and-npm-using-nvm)

### 3.1. Instalar o node

Procurar o link para os binarios linux para a instalação LTS https://nodejs.org/en/download/

Baixar o binário:

> $ cd ~  
> $ wget https://nodejs.org/dist/v4.2.3/node-v4.2.3-linux-x64.tar.gz (link para os binarios do tutorial)

Criar diretório e descompactar:

> $ mkdir node  
> $ tar xvf node-v\*.tar.gz --strip-components=1 -C ./node

Configurar prefixo para o npm criar links para os pacotes instalados:

> $ mkdir node/etc  
> $ echo 'prefix=/usr/local' > node/etc/npmrc

Mover a pasta, alterar as permissões, colocar links que estarão disponiveis no PATH:

> $ sudo mv node /opt/  
> $ sudo chown -R root: /opt/node  
> $ sudo ln -s /opt/node/bin/node /usr/local/bin/node  
> $ sudo ln -s /opt/node/bin/npm /usr/local/bin/npm

Editar o visudo / Alterar linha adicionando "/usr/local/bin" para usuários do sudo:

> \$ sudo visudo

> Defaults secure_path = /sbin:/bin:/usr/sbin:/usr/bin:/usr/local/bin

Verificar node:

> \$ node -v

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

> \$ node hello.js

Testar servidor:

> \$ curl http://127.0.0.1:8080

## 4. Instalar PM2:

https://www.digitalocean.com/community/tutorials/how-to-set-up-a-node-js-application-for-production-on-centos-7  
https://www.digitalocean.com/community/tutorials/how-to-set-up-a-node-js-application-for-production-on-debian-9

### 4.1. Instalação do PM2:

Instalar PM2:

> \$ sudo npm install pm2@latest -g

Testar PM2 (com o app criado na seção anterior):

> \$ pm2 start hello.js

Testar servidor:

> \$ curl http://127.0.0.1:8080

Configurar pm2 como serviço e inicializar no boot (vai tentar localizar o sistema de serviços):

> \$ sudo pm2 startup

Caso não encontre o sistema de serviços, você precisa especificar:

> \$ sudo pm2 startup systemd

### 4.2. Comandos úteis:

Iniciar app:

> \$ pm2 start app (app_name, app_id) ou (app_arquive para novos processos)

Listar serviços:

> \$ pm2 list

Salvar configuração atual para o próximo boot:

> \$ pm2 save

App info:

> \$ pm2 info app (app_name, app_id)

Parar app:

> \$ pm2 stop app (app_name, app_id)

Excluir app:

> \$ pm2 delete app (app_name, app_id)

## 5. Instalar SPS:

Criar pasta onde o sistema vai funcionar (/home/user, /var/www, onde você quiser):

> $ cd /var/www  
> $ mkdir sps-production  
> \$ cd sps-production

### 5.1. Instalar server / Configurar PM2:

#### 5.1.1. Baixar projeto-server do github:

Entrar no diretório do sistema:

> \$ cd /var/www/sps-production

Clonar o repositório:

> \$ git clone https://github.com/SEAD-UFES/publications.git

Renomear a pasta e entrar:

> $ mv publications server  
> $ cd server

Alterar para o branch desejado:

> \$ git branch development

Baixar atualizações:

> \$ git pull

Instalar dependencias:

> \$ npm install

#### 5.1.2. Configurar o servidor:

Criar o arquivo database.json:

> \$ vim config/database.json

Editar e salvar o arquivo (preciso aprender como funcionam as databases de production e teste).

> As entradas `dialectOptions`, `useUTC`, `dateString`, `typeCast` e `timezone` são necessárias para que as datas do
> frontend, backend e banco de dados estejam todas no horário local do Brasil.

```
{
   "development": {
     "username": "sps_user",
     "password": "sps_production_v1",
     "database": "password",
     "host": "127.0.0.1",
     "dialect": "mysql",
     "operatorsAliases": false,
     "dialectOptions": {
      "useUTC": false,
      "dateStrings": true,
      "typeCast": true
     },
     "timezone": "-03:00"
   }
}
```

Criar o arquivo secrets.json:

> \$ vim config/secrets.json

Editar e salvar o arquivo (chave exadecimal?):

> [ > { > "key": "jwt_secret", > "value": "DDDDDDDD" > } >]

Criar arquivo mail.js (use o modelo mail.example.js)

Criar arquivo site.js (use o modelo site.example.js)

#### 5.1.3. migrar database:

Se não tiver npx, instalar:

> \$ sudo npm install -g npx

Migrar a database:

> \$ npx sequelize db:migrate

Carregar seeds:

> \$ npx sequelize db:seed:all

#### 5.1.4. configurar server no PM2:

Iniciar serviço e salvar na lista do PM2

> $ pm2 start server.js --name=sps-server  
> $ pm2 save

Testar servidor:

> \$ curl http://127.0.0.1:3000

### 5.2. Instalar client / Configurar PM2:

https://medium.com/@seanconrad_25426/setting-up-a-create-react-app-with-pm2-and-nginx-on-digitalocean-1fd9c060ac1f  
https://andrewpark.ca/blog/create-and-deploy-a-react-app/

#### 5.2.1. Baixar projeto-client do github:

Entrar no diretório do sistema:

> \$ cd /var/www/sps-production

Clonar o repositório:

> \$ git clone https://github.com/SEAD-UFES/SPS-client.git

Renomear a pasta e entrar:

> $ mv publications client  
> $ cd client

Alterar para o branch desejado:

> \$ git branch development

Baixar atualizações:

> \$ git pull

Instalar dependencias:

> \$ npm install

#### 5.2.2. Configurar o cliente:

Editar o arquivo spsServer:

> \$ vim src/apis/spsServer.js

Editar e salvar o arquivo (colocar o endereço que será o backend da aplicação):

> import axios from "axios";
>
> export default axios.create({ baseURL: "http://servidor.dev.br/api" });

#### 5.2.3. Fazer o "deployment" da aplicação:

Instalar o serve:

> \$ npm install -g serve

Observação sobre paths relativos: O deploy do create-react-app parte do principio que a aplicação será servida na raiz
da url. se não for o caso, você deve fazer duas coisas:

Coisa 1: Defina a home page no arquivo package.json.

> "homepage": "https://your-domain/your-project/build"

Coisa 2: Altere o BrowserRouter em App.js.

> <BrowserRouter basename="/your-path"\>
>
> <Link to="/about"/\> = href="/your-path/about"

Criar a production build:

> \$ npm run build

#### 5.2.4. configurar client no PM2:

Entre no diretório do client. Execute o comando:

> \$ pm2 ecosystem

Edite o arquivo ecosystem.config.js

> \$ vim ecosystem.config.js

Editar e salvar o arquivo:

> apps : [ > { > name : 'sps-client', > script : 'npx', > interpreter : 'none', > args : 'serve build -s', > > > > >
> env_production : { > NODE_ENV: 'production' > } > } > ]

Inicie o processo no pm2:

> \$ pm2 start ecosystem.config.js

## 6. Instalar / Configurar Nginx (Reverse proxy):

#Instalar Nginx  
https://www.digitalocean.com/community/tutorials/how-to-set-up-nginx-server-blocks-on-centos-7  
https://www.digitalocean.com/community/tutorials/how-to-install-nginx-on-ubuntu-18-04

#Problema com SElinux  
https://stackoverflow.com/questions/22586166/why-does-nginx-return-a-403-even-though-all-permissions-are-set-properly#answer-26228135

#React app  
https://medium.com/@seanconrad_25426/setting-up-a-create-react-app-with-pm2-and-nginx-on-digitalocean-1fd9c060ac1f  
https://andrewpark.ca/blog/create-and-deploy-a-react-app/

### 6.1. instalar Nginx:

Não me lembro se fiz isso:

> \$ sudo rpm -Uvh http://nginx.org/packages/centos/7/noarch/RPMS/nginx-release-centos-7-0.el7.ngx.noarch.rpm

Executar os comandos:

> $ sudo yum install nginx
> $ sudo systemctl enable nginx

Criar o diretórios de blocks dentro do nginx (Opcional, pode-se usar a pasta "/etc/nginx/conf.d"):

> $ sudo mkdir /etc/nginx/sites-available
> $ sudo mkdir /etc/nginx/sites-enabled

Editar o arquivo de configuração do nginx

> \$ sudo nano /etc/nginx/nginx.conf

No fim do block http\{\} adicionar: (para buscar os arquivos de configuração e aumentar a memoria para urls)

> include /etc/nginx/sites-enabled/\*.conf;  
> server_names_hash_bucket_size 64;

### 6.2. Configurar as aplicações (server e client) no Nginx:

Estamos configurando as duas aplicações na mesma url (servidor.dev.br) o client na Raiz "/" e o servidor em "/api"

criar um arquivo para url do servidor que vamos colocar no ar: vim /etc/nginx/sites-available/servidor.deb.br.conf

Editar e salvar o arquivo:

```
> server {
>  listen 80;
>  server_name servidor.dev.br www.servidor.dev.br
>
> access_log /var/log/nginx/servidor.dev.br.access.log;
>  error_log /var/log/nginx/servidor.dev.br.error.log;
>
> location / { proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
>        proxy_set_header X-Forwarded-Proto $scheme;
>        proxy_set_header X-Real-IP $remote_addr;
>        proxy_set_header Host $http_host;
>        proxy_pass http://127.0.0.1:5000;
>        proxy_redirect off;
>
> }
>
> error_page 500 502 503 504 /50x.html;
>  location = /50x.html {
>  root /usr/share/nginx/html;
>  }
> }
```

#### 6.2.1 Configurar o server no Nginx:

Editar o arquivo:

> \$ vim /etc/nginx/sites-available/servidor.dev.br.conf

Adicionar e salvar a seguinte location no local indicado do código:

```
server { listen 81; server_name teste_editais.ufes.br www.teste_editais.ufes.br;

    location / {
       proxy_pass http://127.0.0.1:3000;
       proxy_http_version 1.1;
       proxy_set_header Upgrade $http_upgrade;
       proxy_set_header Connection 'upgrade';
       proxy_set_header Host $host;
       proxy_cache_bypass $http_upgrade;
    }

    error_page 500 502 503 504 /50x.html;

    location = /50x.html {
        root /usr/share/nginx/html;
    }

}
```

Reiniciar o nginx:

> \$ systemctl restart nginx

Testar a aplicação (verifique se o sistema devolve um objeto json):

> \$ curl servidor.dev.br/api/selectiveprocesses

#### 6.2.2 Configurar o server no Nginx:

Editar o arquivo:

> \$ vim /etc/nginx/sites-available/servidor.deb.br.conf

Adicionar e salvar a seguinte location no local indicado do código:

>     location / {
>
>        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
>        proxy_set_header X-Forwarded-Proto $scheme;
>        proxy_set_header X-Real-IP $remote_addr;
>        proxy_set_header Host $http_host;
>        proxy_pass http://127.0.0.1:5000;
>        proxy_redirect off;
>
>        }

Reiniciar o nginx:

> \$ systemctl restart nginx

Testar a aplicação (verifique se o sistema devolve a landing page do client):

> \$ curl servidor.dev.br/

#### 6.3 Problemas com o SELinux:

https://stackoverflow.com/questions/22586166/why-does-nginx-return-a-403-even-though-all-permissions-are-set-properly#answer-26228135

Caso existam problemas de permissão nos logs, apesar das permissões estarem corretas, temos que verificar se as
consfigurações do selinux estão ok para rodar a aplicação. Tive esse problema para servir o client do sistema.

Desligar o SElinux (é possivel mudar essa configurações de forma permanente em /etc/sysconfig/selinux):

> \# getenforce  
> \# setenforce Permissive

Faça o teste:

> $ sudo systemctl restart nginx  
> $ curl servidor.dev.br

Reabilite o SELinux

> \# setenforce Enforcing (depois de verificar o problema)

Se for o SELinux:

> \# chcon -Rt httpd_sys_content_t /var/www/sps-production/client/build  
> $ sudo systemctl restart nginx  
> $ curl servidor.dev.br

Se ainda exitirem problemas:

> \# getsebool -a (procurar por httpd_can_network_connect)  
> \# setsebool -P httpd_can_network_connect on  
> $ sudo systemctl restart nginx  
> $ curl servidor.dev.br

---
