Cyrus Imap
=========

Role para instalação e configuração do Cyrus IMAP

+ Instalação do cyrus-imap
+ Configuração (`cyrus.conf`, `imapd.conf`)
+ Abrir porto `143` na firewall (ufw)

Requirements
------------

+ MTA -> postfix
+ Autenticação -> SALS2

Role Variables
--------------

| Variable                        | Default                                                 | Description                                                             |
|---------------------------------|---------------------------------------------------------|-------------------------------------------------------------------------|
| cyrus_imap_lmtpsocket           | [cyrus-admin, cyrus-clients, cyrus-common, cyrus-imapd] | Software a instalar                                                     |
| cyrus_imap_default_group        | mail                                                    | Grupo do cyrus-imap                                                     |
| cyrus_imap_default_user         | cyrus                                                   | Utilizador do cyrus-imap                                                |
| cyrus_imap_default_sasl_group   | sasl                                                    | Utilizado SASL                                                          |
| cyrus_imap_lmtpsocket           | /run/cyrus/socket/lmtp                                  | Socket lmtp                                                             |
| cyrus_imap_idlesocket           | /run/cyrus/socket/idle                                  | Socket idle                                                             |
| cyrus_imap_notifysocket         | /run/cyrus/socket/notify                                | Socket notify                                                           |
| cyrus_imap_tls                  | n/a                                                     | Lista com informação TLS                                                |
| - use                           | False                                                   | Bool para verificar se o cyrus-imap vai utilizar TLS                    |
| - tls_server_cert               | /etc/ssl/certs/my-cert.pem                              | Localização do ficheiro com o certificado                               |
| - server_key                    | /etc/ssl/private/my-cert.key                            | Localização do ficheiro com a chave privada                             |
| - client_ca_file                | /etc/ssl/certs/cyrus-imapd-ca.pem                       | Localização do ficheiro com certificado do cliente                      |
| - tls_client_ca_dir             | /etc/ssl/certs                                          | Directório com os certificados                                          |
| - tls_session_timeout           | 1440                                                    |                                                                         |
| cyrus_imap_autocreate_mailboxes | n/a                                                     | Lista com informação das mailboxes a criar automaticamente              |
| - create                        | True                                                    | Bool para verificar se o cyrus-imap vai criar mailboxes automaticamente |
| - autocreate_quota              | 20480                                                   | Quota da mailboxes                                                      |
| - unixhierarchysep              | 'yes'                                                   |                                                                         |
| - quotawarn                     | '90'                                                    |                                                                         |
| - autocreate_inbox_folders      | Drafts\|Sent\|Trash                                     | Nome das mailboxes a criar automaticamente                              |
| - autocreate_subscribe_folders  | Drafts\|Sent\|Trash                                     | Nome das mailboxes a subscrever                                         |
| - lmtp_over_quota_perm_failure  | 1                                                       |                                                                         |
| cyrus_imap_cyrus_conf           | n/a                                                     | Lista com informação a configurar no ficheiro cyrus.conf                |
| - services                      | []                                                      | Lista de serviços do cyrus-imap                                         |
| - services['name']              | imap                                                    | Nome do serviço                                                         |
| - services['cmd']               | 'imapd -s'                                              | Comando do serviço                                                      |
| - services['listen']            | imap                                                    |                                                                         |
| services['prefork']             | 0                                                       |                                                                         |
| - events                        | []                                                      | Lista de eventos do cyrus-imapd                                         |
| - events['name']                | checkpoint                                              | Nome do evento                                                          |
| - events['cmd']                 | ctl_cyrusdb -c                                          | Comando do evento                                                       |
| - events['period']              | 30                                                      | Período do evento                                                       |
| - daemon                        | []                                                      | Lista com os daemons do cyrus-imapd                                     |
| - daemon['name']                | idled                                                   | Nome do daemon                                                          |
| - daemon['cmd']                 | idled                                                   | Comando do daemon                                                       |


Example Playbook
----------------

```yaml
- hosts: mailservers
  become: True

  roles:
   - cyrus_imap

  vars:
    cyrus_imap_tls:
      use: True
      tls_server_cert: /etc/ssl/certs/foo.example.com.cert.pem
      tls_server_key: /etc/ssl/certs/foo.example.com.key.pem
      tls_client_ca_file: /etc/ssl/certs/csr/foo.example.com.ca.pem
      tls_client_ca_dir: /etc/ssl/certs
      tls_session_timeout: 1440
```


Author Information
------------------

Diogo Fernandes | a21230576 at isec.pt
