# Postfix (MTA)

## Install

``` shell
sudo apt install postfix postfix-doc
```

+ General type of mail configuration : **Internet Site**
+ System mail name : **alcafaz.test**

+ debconf-show postfix
```shell
  postfix/bad_recipient_delimiter:
  postfix/recipient_delim: +
  postfix/not_configured:
  postfix/main_cf_conversion_warning: true
  postfix/tlsmgr_upgrade_warning:
  postfix/procmail: false
  postfix/main_mailer_type: Internet Site
  postfix/relay_restrictions_warning:
  postfix/destinations: $myhostname, alcafaz.test, mail.alcafaz.test, localhost.alcafaz.test, localhost
  postfix/sqlite_warning:
  postfix/newaliases: false
  postfix/retry_upgrade_warning:
  postfix/dynamicmaps_conversion_warning:
  postfix/mynetworks: 127.0.0.0/8 [::ffff:127.0.0.0]/104 [::1]/128
  postfix/chattr: false
  postfix/mailname: alcafaz.test
  postfix/lmtp_retired_warning: true
  postfix/mydomain_warning:
  postfix/compat_conversion_warning: true
  postfix/relayhost:
  postfix/protocols: all
  postfix/root_address:
  postfix/kernel_version_warning:
  postfix/rfc1035_violation: false
  postfix/mailbox_limit: 0

```


## Postfix configuration files

Por omissão os ficheiros de configuração do Postfix estão localizados em `/etc/postfix`. Os ficheiro de configuração mais importantes são o `master.cf` e o `main.cf`. O dono destes ficheiro deve ser o `root`!
Após qualquer configuração nestes ficheiros é necessário executar o comando `postfix reload`

+ `/etc/postfix/main.cf`
```shell
# default is to use fqdn
myhostname = mail.alcafaz.test

#(send mail as "user@$mydomain")
myorigin = /etc/mailname

#specifies what domains this machine will deliver locally, instead of forwarding to another machine.
mydestination = $myhostname, alcafaz.test, mail.alcafaz.test, localhost.alcafaz.test, localhost

#By default, Postfix will forward mail from clients in authorized network blocks to any destination
mynetworks = 127.0.0.0/8 192.168.100.0/24





```


+ `/etc/postfix/master.cf`



# Cyrus IMAP (MDA)

## Requirements

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
