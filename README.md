# Ansible

## Apache2

+ Instalação do apache2
+ Criação de vhost e ativação, quando ´apache2_create_vhost = True´
+ TODO: criar pasta para cada vhost, e possivelmente enviar algum conteúdo...


## Cyrus-Imap

+ Instalção e configuração (cyrus.conf , imapd.conf) do cyrus-imap
+ Cria pastas (INBOX|Drafts|Sent|Trash) quando o utilizador entra pela 1a \
vez na sua conta
+ Corre em chroot
+ TODO: utilizar variáveis no ficheiro de configuração...

## Cyrus-SALS2

+ Instalação e configuração do sasl2
+ Criar utilizadores
+ TODO: ...

## DNS-Bind9

+ Instalção e configuração (named.conf) do bind9
+ Criar zonas (forward e reverse)
+ TODO: ...

## Initial_Setup

+ Instalação de pacotes
+ Criar utilizador/password
+ Remover utilizador default
+ Adicionar hostname
+ Mudar configuração de ssh,
+ configuração de firewall (ufw)
+ Adicionar key para ssh
+ TODO: ...

## Mailman3

+ Instalção do Mailman3-full com debconf
+ TODO: ...

## Postfix

+ Instalação e configuração (main.cf, master.cf, smtpd.conf) do Postfix
+ Criar virtual_recipients, virtual_recipient_domains
+ Instalação do postfix-spf
+ TODO: ...


## Postgresql

+ Instalação do postgresql
+ Mudar password do user postgres
+ TODO: ... 
