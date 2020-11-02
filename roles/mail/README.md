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
