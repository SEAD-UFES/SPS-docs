<!-- @format -->

Aqui vamos descrever como foi o processo para implemetar ssl no servidor nginx da aplicação:

# Configurar ssl em servidor nginx.

## 1 instalação do certbot

1.1 - Para instalar o certbot usamos os seguintes links de referencia:

https://certbot.eff.org  
https://certbot.eff.org/lets-encrypt/centosrhel7-nginx

1.2 - Ao consultar o manual de instalação para o CentOS 7 vimos que seria preciso instalar o snapd (gerenciador de
pacotes).

https://linuxscriptshub.com/install-letsencrypt-ssl-nginx-centos-6/ (letsencrypt falhou então usei o linka abaixo)
https://snapcraft.io/docs/installing-snapd  
https://snapcraft.io/docs/installing-snap-on-centos

Para instalar "extra packages":

```bash
$ sudo yum install epel-release
```

Para instalar o snapd:

```bash
$ sudo yum install snapd
```

Para habilitar o serviço:

```bash
$ sudo systemctl enable --now snapd.socket
```

Para habilitar o classic snap suport(?):

```bash
$ sudo ln -s /var/lib/snapd/snap /snap
```

1.3 - Com o snapd instalado, intalar e configurar o certbot

Para instalar o certbot

```bash
$ sudo snap install --classic certbot
```

Para colocar o comando no bash

```bash
$ sudo ln -s /snap/bin/certbot /usr/bin/certbot
```

## 2 Gerar certificados

https://certbot.eff.org/lets-encrypt/centosrhel7-nginx
https://linuxscriptshub.com/install-letsencrypt-ssl-nginx-centos-6/ (usei mais este)
https://www.digitalocean.com/community/tutorials/how-to-create-a-self-signed-ssl-certificate-for-nginx-on-centos-7

Problema: Tivemos problemas para gerar certificado pois nossas url de teste continha "\_" que é uma caractere invlálido.
fizemos a correção.

Observação: Optamos por apenas gerar os certificados (certonly) e fazer as configurações do servidor manualmente.

Para gerar um certificado a partir no nginx:

O comando abaixo vai localizar os dominios que já estão disponiveis no nginx e perguntara de qual você deseja criar o
certificado. Optamos por repetir o processo para cada dominio.

No nosso teste, usamos o dominio (teste-editais.sead.ufes.br)

```bash
$ sudo certbot certonly --nginx
```

Se tudo correu normalmente suas chaves são geradas em (/etc/letsencrypt/live).

## 3 Gerar server key do servidor nginx

Para criar a pasta onde a chave será armazenada:

```bash
\# mkdir /etc/nginx/ssl
```

Para entrar na pasta:

```bash
\# cd /etc/nginx/ssl
```

Para gerar a server.key dentro da pasta:

O comando abaixo vai solicitar um password para criar uma chave única. Forneça-o.

```bash
\# openssl genrsa -des3 -out server.key 2048
```

Para gerar a server.csr dentro da pasta:

```bash
\# openssl req -new -key server.key -out server.csr
```

## 4 Configurar virtualhosts do servidor nginx

Nosso nginx foi configurado com as pastas sites-available e sites-enabled. Na primeira pasta criarmos 3 arquivos. Na
segunda, links para os arquivos que serão disponibilizados.

4.1 - O primeiro arquivo (000-default.conf):

Este arquivo deve pegar qualquer link que não seja de outros server configurados e devolver uma resposta "vazia" para o
requisitante:

```
server {
    listen 80 default_server;
    server_name _;
    return 444; # "Connection closed without response"
}
```

4.2 - O segundo arquivo (teste-editais.sead.ufes.br):

Aqui temos a configuração de um dominio pelo qual o servidor responde:

São dois servidores vituais, um redirecionando o trafego da porta 80 (http) para o endereço que possui ssl e outro com
as configurações de ssl deste dominio.

```
server {
    listen 80;
    server_name teste-editais.sead.ufes.br;
    return https://teste-editais.sead.ufes.br$request_uri;
}

server {
    #ssl settings
    listen 443 ssl;
    ssl_certificate /etc/letsencrypt/live/teste-editais.sead.ufes.br/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/teste-editais.sead.ufes.br/privkey.pem;
    ssl_trusted_certificate /etc/letsencrypt/live/teste-editais.sead.ufes.br/chain.pem;

    server_name teste-editais.sead.ufes.br;

    location / {
	    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
 	    proxy_set_header X-Forwarded-Proto $scheme;
 	    proxy_set_header X-Real-IP $remote_addr;
 	    proxy_set_header Host $http_host;
 	    proxy_pass http://127.0.0.1:5000;
 	    proxy_redirect off;
    }

    location /api {
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

4.3 - Outros arquivo em (/etc/nginx/sites-available):

Outros dominios que tem crtificados criados em (/etc/letsencrypt/live):  
As configurações ssl de outros dominios serão configurados da mesma forma que o segundo arquivo.

## 5 - Ajustes finais.

5.1 - ajustes nas aplicações node.js que servimos:

Alguns ajustes no sistema foram efetuadas para o funcionamento correto do das configurações ssl no servidor:

5.1.1 - No sps-server

Parar o serviço pm2:

```bash
\# pm2 stop sps-server-teste
```

Ajustar o arquivo de configuração (~/sps-teste/server/config/site.js):  
A nova url deve apontar para o servidor https.

```bash
\# vim ~/sps-teste/server/config/site.js
```

Reiniciar o serviço pm2:

```bash
\# pm2 start sps-server-teste
```

5.1.2 - No sps-client

Parar o serviço pm2:

```bash
\# pm2 stop sps-client-teste
```

Ajustar o arquivo de configuração (~/sps-teste/client/src/config/backend.js)  
A nova url deve apontar para o servidor https.

```bash
\# vim ~/sps-teste/client/src/config/backend.js
```

Fazer o rebuild do bundle:

```bash
\# cd ~/sps-teste/client
\# npm run build
```

Reiniciar o serviço pm2:

```bash
\# pm2 start sps-client-teste
```

5.2 - Ajuste no servidor nginx:

Checar syntax dos arquivos de configuração:

```bash
\# nginx -t
```

Reiniciar servidor nginx para aplicar as novas configurações:

```bash
\# systemctl restart nginx
```

## 6 - Renovação automática de certificados.

Podemos solicitar ao certbot renovação automatica dos certificados, isso vai colocar um script no "cron" do sistema
operacional.

```bash
\# sudo certbot renew --dry-run
```

O cmando para a renovação do certbot estará instalado em uma das localizaçãoes a seguir:

/etc/crontab/  
/etc/cron.\*/\*  
systemctl list-timers (Nosso caso)
