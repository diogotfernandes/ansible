# Cyrus IMAP (MDA)

## Requirements

https://www.suse.com/support/kb/doc/?id=000016670
\#Não resolveu o problema
https://wiki.debian.org/pt_BR/PostfixAndSASL
\#Resolveu o problema!!
http://blog.bekyarov.info/2013/01/04/testsaslauthd-connect-no-such-file-or-directory-0-postfix-postfixsmtpd11571-warning-sasl-authentication-failure-cannot-connect-to-saslauthd-server-no-such-file-or-directory/


+ libsasl2-modules sasl2-bin
```shell
sudo apt install libsasl2-modules sasl2-bin
```

+ cyrus-*
```shell
sudo apt install cyrus-imapd cyrus-clients cyrus-common cyrus-admin
```


## Install

+ Setup the cyrus:mail user and group

Verificar se já existe um grupo com o nome `mail` e um utilizador com o nome cyrus
```shell
#mail:x:8:
getent group mail

#cyrus:x:999:8:Cyrus IMAP Server:/var/lib/imap:/bin/bash
getent passwd cyrus
```

Exemplo para criar utilizador/grupo
```shell
groupadd -fr mail
useradd -c "Cyrus IMAP Server" -d /var/lib/cyrus -g mail -s /bin/bash -r cyrus
```

## Setting up authentication with SASL

### Por omissão são criados os grupos necessários (mail,sasl) e os utilizadores necessários(cyrus)!!

+ Verificar se existe um grupo `sasl`
```shell
getent group sasl
```

+ Mudar a configuração do SASL `/etc/default/saslauthd`
```shell
START=yes
MECHANISMS="sasldb"
```

+ Criar um utilizador dentro do SASL
```shell
echo 'secret' | sudo saslpasswd2 -p -c cyrus
```

+ Testar a autenticação
```shell
sudo testsaslauth -u cyrus -p qwerty
```
You should get an `0: OK "Success."` message.



+ imtest
path: /usr/lib/cyrus/bin/imtest

# Mailman3

## Requirements


+ python-pip

+ Apache2
sudo apt install Apache2
sudo a2enmod rewrite
sudo apt install php libapache2-mod-php
editar /etc/apache2/mods-enabled/dir.conf
testar php -> criar info.php

+ PostgreSQL

set locale pt_PT.UTF-8 (/etc/default/locale)

sudo apt install postgresql postgresql-contrib

mudar pw do postgres (sudo -u postgres psql postgres password postgres)
CREATE EXTENSION adminpack;

Mudar todos os métodos (peer) para md5 (/etc/postgres/12/main/pg_hba.conf)

Mudar listen_address = "*" (/etc/postgres/12/main/postgresql.conf)

Instalar pgadmin4
-> sudo apt install pgadmin4-apache2 (https://www.postgresql.org/download/linux/ubuntu/) (https://www.pgadmin.org/download/pgadmin-4-apt/)


sudo debconf-show --listowners | grep mailman3 | sudo xargs debconf-show



admin@mail:~$ sudo debconf-show mailman3
  mailman3/pgsql/app-pass: (password omitted)
  mailman3/password-confirm: (password omitted)
  mailman3/mysql/app-pass: (password omitted)
  mailman3/mysql/admin-pass: (password omitted)
  mailman3/app-password-confirm: (password omitted)
* mailman3/pgsql/admin-pass: (password omitted)
  mailman3/pgsql/manualconf:
* mailman3/pgsql/authmethod-user: password
* mailman3/remote/port: 5432
  mailman3/init_service_failed:
* mailman3/config_hyperkitty: true
* mailman3/db/dbname: mailman3
  mailman3/remote/newhost: localhost
  mailman3/remove-error: abort
  mailman3/pgsql/changeconf: false
  mailman3/install-error: abort
  mailman3/internal/skip-preseed: false
* mailman3/db/app-user: mailman3
  mailman3/mysql/method: Unix socket
  mailman3/mysql/admin-user:
  mailman3/upgrade-error: abort
  mailman3/purge: false
* mailman3/pgsql/authmethod-admin: password
* mailman3/database-type: pgsql
  mailman3/pgsql/no-empty-passwords:
  mailman3/dbconfig-upgrade: true
  mailman3/internal/reconfiguring: false
  mailman3/passwords-do-not-match:
  mailman3/db/basepath: /var/lib/mailman3/data
* mailman3/dbconfig-install: true
* mailman3/remote/host: localhost
* mailman3/pgsql/admin-user: postgres
  mailman3/dbconfig-remove: true
* mailman3/pgsql/method: TCP/IP
  mailman3/upgrade-backup: true
  mailman3/dbconfig-reinstall: false
  mailman3/missing-db-package-error: abort


  admin@mail:~$ sudo debconf-show mailman3-web
    mailman3-web/pgsql/app-pass: (password omitted)
    mailman3-web/app-password-confirm: (password omitted)
    mailman3-web/password-confirm: (password omitted)
    mailman3-web/mysql/app-pass: (password omitted)
  * mailman3-web/superuser-password: (password omitted)
    mailman3-web/mysql/admin-pass: (password omitted)
  * mailman3-web/pgsql/admin-pass: (password omitted)
    mailman3-web/missing-db-package-error: abort
    mailman3-web/mysql/admin-user:
  * mailman3-web/pgsql/method: TCP/IP
    mailman3-web/passwords-do-not-match:
  * mailman3-web/db/app-user: mailman3web
    mailman3-web/pgsql/no-empty-passwords:
  * mailman3-web/remote/port: 5432
    mailman3-web/upgrade-error: abort
  * mailman3-web/database-type: pgsql
  * mailman3-web/superuser-mail: mailman3web@alcafaz.test
    mailman3-web/pgsql/manualconf:
  * mailman3-web/pgsql/admin-user: postgres
  * mailman3-web/superuser-name: mailman3web
    mailman3-web/pgsql/changeconf: false
  * mailman3-web/pgsql/authmethod-user: password
    mailman3-web/purge: false
    mailman3-web/dbconfig-upgrade: true
  * mailman3-web/configure-webserver: apache2
    mailman3-web/nginx-choice:
    mailman3-web/db/basepath: /var/lib/mailman3/web
    mailman3-web/internal/skip-preseed: false
    mailman3-web/upgrade-backup: true
  * mailman3-web/db/dbname: mailman3web
    mailman3-web/remove-error: abort
  * mailman3-web/pgsql/authmethod-admin: password
    mailman3-web/internal/reconfiguring: false
    mailman3-web/mysql/method: Unix socket
  * mailman3-web/remote/host: localhost
    mailman3-web/dbconfig-reinstall: false
  * mailman3-web/restart-webserver: true
    mailman3-web/install-error: abort
    mailman3-web/remote/newhost: localhost
  * mailman3-web/dbconfig-install: true
  * mailman3-web/emailname: alcafaz.test
    mailman3-web/dbconfig-remove: true
