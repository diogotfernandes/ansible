Postfix
=========

Role para instalação do Postfix

Ficheiros de Configuração
------------

+ `/etc/postfix/main.cf`
+ `/etc/postfix/master.cf`


Role Variables
--------------

| Variable                             | Default                                     | Description                                                                                                                     |
|--------------------------------------|---------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------|
| postfix_virtual_domain_name          | foo.bar                                     | Postfix is final destination for the specified list of domains                                                                  |
| postfix_virtual_recipients           | n/a                                         | Lookup table with all valid recipient addresses                                                                                 |
| postfix_use_ssl                      | False                                       | Bool para verificar se e para utilizar ssl                                                                                      |
| postfix_smtpd_tls_key_file           | /etc/ssl/csr/mail.foo.bar.csr               |                                                                                                                                 |
| postfix_smtpd_tls_cert_file          | /etc/ssl/crt/mail.foo.bar.crt               |                                                                                                                                 |
| postfix_smtpd_tls_CAfile             | /etc/ssl/private/mail.foo.bar.pem           |                                                                                                                                 |
| postfix_packages                     | [posrfix, postfix-doc]                      | Lista com o software a instalar                                                                                                 |
| postfix_mailname                     | "{{ postfix_virtual_domain_name }}"         | Used by the Mail Transfer Agent to know its own hostname                                                                        |
| postfix_main_mailer_type             | Internet Site                               |                                                                                                                                 |
| postfix_mynetworks                   | 127.0.0.0/8                                 | The list of "trusted" remote SMTP clients that have more privileges than "strangers".                                           |
| postfix_recipient_delim              | +                                           | The set of characters that can separate an email address localpart, user name, or a .forward file name from its extension.      |
| postfix_root_address                 | root@{{ postfix_virtual_domain_name }}      |                                                                                                                                 |
| postfix_mydomain                     | "{{ postfix_virtual_domain_name }}"         | The mydomain parameter specifies the local internet domain name                                                                 |
| postfix_myhostname                   | mail.{{ postfix_virtual_domain_name }}      | The myhostname parameter specifies the internet hostname of this mail system                                                    |
| postfix_spf_package                  | postfix-policyd-spf-python                  |                                                                                                                                 |
| postfix_use_spf                      | True                                        | Bool para verificar se é para configurar o spf                                                                                  |
| postfix_use_mailman3                 | False                                       | Bool para verificar se é utilizado o mailman3 com o postfix                                                                     |
| postfix_use_sasl                     | True                                        | Bool para verificar se é utilizado o método de autenticaçao sasl2                                                               |
| postfix_inet_interfaces              | all                                         | The network interface addresses that this mail system receives mail on                                                          |
| postfix_inet_protocols               | ipv4                                        | The Internet protocols Postfix will attempt to use when making or accepting connections                                         |
| postfix_mydestination                | localhost                                   | The list of domains that are delivered via the $local_transport mail delivery transport                                         |
| postfix_smtpd_helo_required          | 'yes'                                       | Require that a remote SMTP client introduces itself with the HELO or EHLO command                                               |
| postfix_virtual_mailbox_domains      | hash:/etc/postfix/virtual_recipient_domains | Postfix is final destination for the specified list of domains                                                                  |
| postfix_virtual_mailbox_maps         | hash:/etc/postfix/virtual_recipients        | Lookup tables with all valid addresses in the domains                                                                           |
| postfix_virtual_transport            | lmtp:unix:/var/run/cyrus/socket/lmtp        | The default mail delivery transport and next-hop destination for final delivery to domains listed with $virtual_mailbox_domains |
| postfix_smtpd_recipient_restrictions | n/a                                         | Restrictions that the Postfix SMTP server applies in the context of a client RCPT TO command                                    |


Example Playbook
----------------

```yaml
- hosts: mailservers
  gather_facts: True
  become: True

  roles:
    - postfix

  vars:
    postfix_use_ssl: False
    postfix_smtpd_tls_key_file: /etc/ssl/certs/mail.alcafaz.test.key.pem
    postfix_smtpd_tls_cert_file: /etc/ssl/certs/mail.alcafaz.test.cert.pem
    postfix_smtpd_tls_CAfile: /etc/ssl/certs/mail.alcafaz.test.ca.pem
    postfix_mynetworks: 127.0.0.0/8 192.168.100.0/24
    postfix_virtual_domain_name: alcafaz.test
    postfix_root_address: admin@{{ postfix_virtual_domain_name }}
    postfix_use_spf: True
    postfix_use_mailman3: False
    postfix_virtual_recipients:
      - name: diogo
        domain: "{{ postfix_virtual_domain_name }}"
      - name: admin
        domain: "{{ postfix_virtual_domain_name }}"
      - name: marcia
        domain: "{{ postfix_virtual_domain_name }}"
      - name: mailman3web
        domain: "{{ postfix_virtual_domain_name }}"

```


Author Information
------------------
Diogo Fernandes
