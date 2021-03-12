<!-- @format -->

Aqui vamos descrever como foi o processo para implemetar ssl no servidor nginx da aplicação:

# Configurar ssl em servidor nginx.

## 1 instalação do certbot

1 - Para instalar o certbot usamos os seguintes links de referencia:

https://certbot.eff.org  
https://certbot.eff.org/lets-encrypt/centosrhel7-nginx

2 - Ao consultar o manual de instalação para o CentOS 7 vimos que seria preciso instalar o snapd (gerenciador de
pacotes).

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

## 2 Gerar certificados

## 3 Gerar server key do servidor nginx

## 4 Configurar virtualhosts do servidor nginx

## Ajustes finais.
