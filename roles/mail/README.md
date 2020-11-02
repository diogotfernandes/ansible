# Postfix (MTA)

## Install

``` shell
sudo apt install postfix postfix-doc
```

+ General type of mail configuration : **Internet Site**
+ System mail name : **alcafaz.test**

## Postfix configuration files

Por omissão os ficheiros de configuração do Postfix estão localizados em `/etc/postfix`. Os ficheiro de configuração mais importantes são o `master.cf` e o `main.cf`. O dono destes ficheiro deve ser o `root`!
Após qualquer configuração nestes ficheiros é necessário executar o comando `postfix reload`

+ `/etc/postfix/main.cf`
```shell
# default is to use fqdn
myhostname = mail.alcafaz.test

#(send mail as "user@$mydomain")
myorigin = /etc/mailname

#
mydestination = $myhostname, alcafaz.test, mail.alcafaz.test, localhost.alcafaz.test, localhost
```


+ `/etc/postfix/master.cf`
